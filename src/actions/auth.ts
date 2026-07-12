'use server';

import { prisma } from '@/lib/db';
import { verifyPassword, createSession, setSessionCookie, deleteSessionCookie, invalidateSession, getCurrentSession } from '@/lib/auth';
import { z } from 'zod';
import { redirect } from 'next/navigation';

const loginSchema = z.object({
  email: z.string().email(),
  password: z.string().min(1),
});

export async function login(prevState: any, formData: FormData) {
  const parsed = loginSchema.safeParse(Object.fromEntries(formData));
  
  if (!parsed.success) {
    return { error: 'Invalid input' };
  }
  
  const { email, password } = parsed.data;
  
  const employee = await prisma.employee.findUnique({ where: { email } });
  
  if (!employee || !employee.isActive) {
    return { error: 'Invalid credentials or inactive account' };
  }
  
  const isValid = await verifyPassword(password, employee.passwordHash);
  if (!isValid) {
    return { error: 'Invalid credentials' };
  }
  
  const { token, expiresAt } = await createSession(employee.id);
  await setSessionCookie(token, expiresAt);
  
  // Decide where to redirect based on role, for now just redirect to admin
  // The middleware will handle /admin or /pos isolation logic later if needed
  redirect('/admin');
}

export async function logout() {
  const session = await getCurrentSession();
  if (session) {
    const { cookies } = await import('next/headers');
    const token = (await cookies()).get('dahab_session')?.value;
    if (token) {
      await invalidateSession(token);
    }
  }
  await deleteSessionCookie();
  redirect('/admin/login');
}
