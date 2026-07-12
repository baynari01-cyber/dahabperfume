'use server';

import { prisma } from '@/lib/db';
import { requirePermission } from '@/lib/dal';
import * as argon2 from 'argon2';
import crypto from 'crypto';

export async function createEmployee(data: {
  name: string;
  email: string;
  password?: string;
  roleId: string;
  isActive: boolean;
  selectedPermissionIds: string[];
  bootstrapAdminId: string; // The performing employee (Admin)
}) {
  try {
    await requirePermission('manage:settings');

    const existing = await prisma.employee.findUnique({
      where: { email: data.email }
    });
    if (existing) {
      return { success: false, error: 'البريد الإلكتروني مسجل بالفعل' };
    }

    // Default password if not provided
    const password = data.password || 'Dhb-Staff!' + crypto.randomBytes(3).toString('hex');
    const passwordHash = await argon2.hash(password);

    const employee = await prisma.employee.create({
      data: {
        name: data.name,
        email: data.email,
        passwordHash,
        roleId: data.roleId,
        isActive: data.isActive,
        mustChangePassword: true,
        bootstrapCredential: true
      }
    });

    // Save custom checkbox permissions
    if (data.selectedPermissionIds.length > 0) {
      await prisma.employeePermission.createMany({
        data: data.selectedPermissionIds.map((pId) => ({
          employeeId: employee.id,
          permissionId: pId
        }))
      });
    }

    // Write audit log
    await prisma.auditLog.create({
      data: {
        employeeId: data.bootstrapAdminId,
        action: 'EMPLOYEE_CREATED',
        entityType: 'Employee',
        entityId: employee.id,
        details: JSON.stringify({ name: data.name, email: data.email, roleId: data.roleId })
      }
    });

    return { success: true, employeeId: employee.id, generatedPassword: password };
  } catch (error: any) {
    return { success: false, error: error.message || 'حدث خطأ أثناء حفظ البيانات' };
  }
}

export async function updateEmployee(data: {
  id: string;
  name: string;
  email: string;
  roleId: string;
  isActive: boolean;
  selectedPermissionIds: string[];
  adminId: string;
}) {
  try {
    await requirePermission('manage:settings');

    // Update Employee
    await prisma.employee.update({
      where: { id: data.id },
      data: {
        name: data.name,
        email: data.email,
        roleId: data.roleId,
        isActive: data.isActive
      }
    });

    // Re-sync custom permissions
    await prisma.employeePermission.deleteMany({
      where: { employeeId: data.id }
    });

    if (data.selectedPermissionIds.length > 0) {
      await prisma.employeePermission.createMany({
        data: data.selectedPermissionIds.map((pId) => ({
          employeeId: data.id,
          permissionId: pId
        }))
      });
    }

    // Revoke employee sessions if disabled or permissions changed
    await prisma.session.deleteMany({
      where: { employeeId: data.id }
    });

    // Write audit log
    await prisma.auditLog.create({
      data: {
        employeeId: data.adminId,
        action: 'EMPLOYEE_UPDATED',
        entityType: 'Employee',
        entityId: data.id,
        details: JSON.stringify({ name: data.name, email: data.email })
      }
    });

    return { success: true };
  } catch (error: any) {
    return { success: false, error: error.message || 'حدث خطأ أثناء تحديث البيانات' };
  }
}

export async function getActiveSessionPermissions() {
  const { getCurrentSession } = await import('@/lib/auth');
  const { getEmployeePermissions } = await import('@/lib/dal');
  const session = await getCurrentSession();
  if (!session) return [];
  return getEmployeePermissions(session.employeeId);
}
