'use server';

import { prisma } from '@/lib/db';
import { verifyPassword, createSession, setSessionCookie, deleteSessionCookie, invalidateSession, getCurrentSession } from '@/lib/auth';
import { z } from 'zod';
import { redirect } from 'next/navigation';
import { headers } from 'next/headers';

const loginSchema = z.object({
  email: z.string().email(),
  password: z.string().min(1),
});

const MAX_FAILED_ATTEMPTS = 5;
const LOCKOUT_MINUTES = 15;

export async function login(prevState: any, formData: FormData) {
  const parsed = loginSchema.safeParse(Object.fromEntries(formData));
  
  const headersList = await headers();
  const ipAddress = headersList.get('x-forwarded-for') || 'unknown';
  const userAgent = headersList.get('user-agent') || 'unknown';

  if (!parsed.success) {
    return { error: 'Invalid input' };
  }
  
  const { email, password } = parsed.data;
  
  // Check lockout
  const recentAttempts = await prisma.loginAttempt.findMany({
    where: {
      email,
      success: false,
      createdAt: {
        gte: new Date(Date.now() - LOCKOUT_MINUTES * 60 * 1000)
      }
    },
    orderBy: { createdAt: 'desc' }
  });

  if (recentAttempts.length >= MAX_FAILED_ATTEMPTS) {
    return { error: `Account locked due to too many failed attempts. Try again in ${LOCKOUT_MINUTES} minutes.` };
  }

  const employee = await prisma.employee.findUnique({ where: { email } });
  
  if (!employee || !employee.isActive) {
    await prisma.loginAttempt.create({
      data: { email, ipAddress, userAgent, success: false }
    });
    return { error: 'Invalid credentials or inactive account' };
  }
  
  const isValid = await verifyPassword(password, employee.passwordHash);
  if (!isValid) {
    await prisma.loginAttempt.create({
      data: { email, ipAddress, userAgent, success: false, employeeId: employee.id }
    });
    return { error: 'Invalid credentials' };
  }
  
  // Success
  await prisma.loginAttempt.create({
    data: { email, ipAddress, userAgent, success: true, employeeId: employee.id }
  });

  await prisma.auditLog.create({
    data: {
      employeeId: employee.id,
      action: 'LOGIN_SUCCESS',
      entityType: 'Session',
      entityId: employee.id,
      ipAddress
    }
  });

  const { token, expiresAt } = await createSession(employee.id);
  await setSessionCookie(token, expiresAt);
  
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
