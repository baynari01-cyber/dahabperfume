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
  
  // In the new schema, session.employee.role isn't automatically loaded with permissions 
  // deep nested in the auth.ts validateSessionToken (wait, auth.ts had it loaded as role.permissions, but schema changed to RolePermission).
  // So we must fetch the permissions here dynamically to be safe.
  const employeeRole = await prisma.role.findUnique({
    where: { id: session.employee.roleId },
    include: { permissions: { include: { permission: true } } }
  });

  const hasPermission = employeeRole?.permissions.some(p => p.permission.action === action);
  
  if (!hasPermission) {
    throw new Error(`Unauthorized Access: Missing ${action}`); // Next.js will catch this with error boundary
  }
  
  return session;
}
