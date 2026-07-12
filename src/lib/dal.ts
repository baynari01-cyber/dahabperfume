import { getCurrentSession } from './auth';
import { redirect } from 'next/navigation';
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
  
  const hasPermission = session.employee.role.permissions.some(p => p.action === action);
  
  if (!hasPermission) {
    throw new Error('Unauthorized Access'); // Next.js will catch this with error boundary
  }
  
  return session;
}
