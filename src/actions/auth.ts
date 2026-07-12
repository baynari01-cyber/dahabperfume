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
    return { error: 'يرجى التحقق من البريد الإلكتروني وكلمة المرور' };
  }
  
  const { email, password } = parsed.data;
  
  const employee = await prisma.employee.findUnique({ where: { email } });
  
  if (!employee) {
    // Audit failure for non-existent employee
    await prisma.loginAttempt.create({
      data: { email, ipAddress, userAgent, success: false }
    });
    return { error: 'خطأ في البريد الإلكتروني أو كلمة المرور' };
  }

  // Check if disabled
  if (!employee.isActive) {
    await prisma.loginAttempt.create({
      data: { email, ipAddress, userAgent, success: false, employeeId: employee.id }
    });
    return { error: 'الحساب معطل حالياً' };
  }

  // Check lockout status
  if (employee.lockoutUntil && employee.lockoutUntil > new Date()) {
    return { error: `الحساب مقفل مؤقتاً بسبب محاولات فاشلة متكررة. حاول مجدداً بعد انتهاء مدة القفل.` };
  }

  const isValid = await verifyPassword(password, employee.passwordHash);
  
  if (!isValid) {
    // Increment failed attempts
    const newFailedCount = employee.failedAttempts + 1;
    const isLocking = newFailedCount >= MAX_FAILED_ATTEMPTS;
    const lockoutUntil = isLocking ? new Date(Date.now() + LOCKOUT_MINUTES * 60 * 1000) : null;

    await prisma.employee.update({
      where: { id: employee.id },
      data: {
        failedAttempts: newFailedCount,
        lockoutUntil
      }
    });

    await prisma.loginAttempt.create({
      data: { email, ipAddress, userAgent, success: false, employeeId: employee.id }
    });

    await prisma.auditLog.create({
      data: {
        employeeId: employee.id,
        action: isLocking ? 'ACCOUNT_LOCKED' : 'LOGIN_FAILURE',
        entityType: 'Employee',
        entityId: employee.id,
        ipAddress,
        details: JSON.stringify({ failedAttempts: newFailedCount })
      }
    });

    if (isLocking) {
      return { error: `تم قفل الحساب بسبب 5 محاولات خاطئة متتالية. يرجى المحاولة بعد ${LOCKOUT_MINUTES} دقيقة.` };
    }

    return { error: 'خطأ في البريد الإلكتروني أو كلمة المرور' };
  }
  
  // Success: Reset failed attempts & lockout
  await prisma.employee.update({
    where: { id: employee.id },
    data: {
      failedAttempts: 0,
      lockoutUntil: null
    }
  });

  await prisma.loginAttempt.create({
    data: { email, ipAddress, userAgent, success: true, employeeId: employee.id }
  });

  await prisma.auditLog.create({
    data: {
      employeeId: employee.id,
      action: 'SESSION_CREATED',
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
      
      // Audit Session Revocation
      await prisma.auditLog.create({
        data: {
          employeeId: session.employeeId,
          action: 'SESSION_REVOKED',
          entityType: 'Session',
          entityId: session.id,
          details: 'User logged out'
        }
      });
    }
  }
  await deleteSessionCookie();
  redirect('/admin/login');
}
