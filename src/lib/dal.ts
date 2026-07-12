import { getCurrentSession } from './auth';
import { redirect } from 'next/navigation';
import { prisma } from './db';
import 'server-only';

export async function requireAuth() {
  const session = await getCurrentSession();
  
  if (!session) {
    redirect('/admin/login');
  }
  
  return session;
}

export async function requirePermission(action: string) {
  const session = await requireAuth();
  
  // 1. Check direct employee permissions
  const directPermission = await prisma.employeePermission.findFirst({
    where: {
      employeeId: session.employeeId,
      permission: { action }
    }
  });

  if (directPermission) {
    return session;
  }

  // 2. Check role permissions
  const employeeRole = await prisma.role.findUnique({
    where: { id: session.employee.roleId },
    include: { permissions: { include: { permission: true } } }
  });

  const hasRolePermission = employeeRole?.permissions.some(p => p.permission.action === action);
  
  if (!hasRolePermission) {
    throw new Error(`Unauthorized Access: Missing ${action}`); // Next.js will catch this
  }
  
  return session;
}

export async function getEmployeePermissions(employeeId: string): Promise<string[]> {
  const directPermissions = await prisma.employeePermission.findMany({
    where: { employeeId },
    include: { permission: true }
  });
  
  const employee = await prisma.employee.findUnique({
    where: { id: employeeId },
    select: { roleId: true }
  });

  const rolePermissions = employee?.roleId ? await prisma.role.findUnique({
    where: { id: employee.roleId },
    include: { permissions: { include: { permission: true } } }
  }) : null;

  const all = new Set([
    ...directPermissions.map(p => p.permission.action),
    ...(rolePermissions?.permissions.map(p => p.permission.action) || [])
  ]);

  return Array.from(all);
}
