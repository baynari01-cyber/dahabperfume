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
  
  const overrides = await prisma.employeePermission.findMany({
    where: {
      employeeId: session.employeeId,
      permission: { action }
    },
    include: { permission: true }
  });

  const now = new Date();

  // 1. Explicit employee DENY override
  const denyOverride = overrides.find(o => o.effect === 'DENY');
  if (denyOverride) {
    throw new Error(`Unauthorized Access: Explicitly Denied ${action}`);
  }

  // 2. Explicit employee ALLOW override (must not be expired)
  const allowOverride = overrides.find(o => o.effect === 'ALLOW' && (!o.expiresAt || o.expiresAt > now));
  if (allowOverride) {
    return session;
  }

  // 3. Role permission
  const employeeRole = await prisma.role.findUnique({
    where: { id: session.employee.roleId },
    include: { permissions: { include: { permission: true } } }
  });

  const hasRolePermission = employeeRole?.permissions.some(p => p.permission.action === action);
  
  if (!hasRolePermission) {
    throw new Error(`Unauthorized Access: Missing ${action}`);
  }
  
  return session;
}

export async function getEmployeePermissions(employeeId: string): Promise<string[]> {
  const employee = await prisma.employee.findUnique({
    where: { id: employeeId },
    select: { roleId: true }
  });

  const rolePermissions = employee?.roleId ? await prisma.role.findUnique({
    where: { id: employee.roleId },
    include: { permissions: { include: { permission: true } } }
  }) : null;

  let allowed = new Set<string>(
    rolePermissions?.permissions.map(p => p.permission.action) || []
  );

  const overrides = await prisma.employeePermission.findMany({
    where: { employeeId },
    include: { permission: true }
  });

  const now = new Date();

  // Apply explicit DENY overrides
  for (const o of overrides) {
    if (o.effect === 'DENY') {
      allowed.delete(o.permission.action);
    }
  }

  // Apply explicit ALLOW overrides (if not expired)
  for (const o of overrides) {
    if (o.effect === 'ALLOW' && (!o.expiresAt || o.expiresAt > now)) {
      allowed.add(o.permission.action);
    }
  }

  return Array.from(allowed);
}
