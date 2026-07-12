'use server';

import { prisma } from '@/lib/db';
import { verifyPassword, createSession, setSessionCookie, deleteSessionCookie, invalidateSession, getCurrentSession } from '@/lib/auth';
import { verifyTOTP } from '@/lib/totp';
import { z } from 'zod';
import { redirect } from 'next/navigation';
import { headers } from 'next/headers';
import crypto from 'crypto';

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
  
  const employee = await prisma.employee.findUnique({
    where: { email },
    include: { role: true }
  });
  
  if (!employee) {
    await prisma.loginAttempt.create({
      data: { email, ipAddress, userAgent, success: false }
    });
    return { error: 'خطأ في البريد الإلكتروني أو كلمة المرور' };
  }

  if (!employee.isActive) {
    await prisma.loginAttempt.create({
      data: { email, ipAddress, userAgent, success: false, employeeId: employee.id }
    });
    return { error: 'الحساب معطل حالياً' };
  }

  // Account Lockout check
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
  
  // Success: Reset failed attempts
  await prisma.employee.update({
    where: { id: employee.id },
    data: {
      failedAttempts: 0,
      lockoutUntil: null
    }
  });

  // If MFA is enabled, redirect to OTP screen instead of setting session cookie directly
  if (employee.mfaEnabled) {
    return { requiresMfa: true, tempEmployeeId: employee.id };
  }

  // Create standard session
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

export async function verifyMfaLogin(prevState: any, formData: FormData) {
  const code = formData.get('code') as string;
  const tempEmployeeId = formData.get('tempEmployeeId') as string;

  const headersList = await headers();
  const ipAddress = headersList.get('x-forwarded-for') || 'unknown';
  const userAgent = headersList.get('user-agent') || 'unknown';

  if (!code || !tempEmployeeId) {
    return { error: 'الرمز المدخل غير صالح' };
  }

  const employee = await prisma.employee.findUnique({
    where: { id: tempEmployeeId },
    include: { role: true }
  });

  if (!employee) {
    return { error: 'الموظف غير موجود' };
  }

  if (employee.lockoutUntil && employee.lockoutUntil > new Date()) {
    return { error: 'الحساب مقفل مؤقتاً' };
  }

  // 1. Replay Protection: Check if this code was recently used
  const replayKey = `last_mfa_code_${employee.id}`;
  const lastUsed = await prisma.siteSettings.findUnique({ where: { key: replayKey } });
  if (lastUsed && lastUsed.value === code) {
    return { error: 'تم استخدام هذا الرمز من قبل. يرجى الانتظار 30 ثانية لتوليد رمز جديد.' };
  }

  // 2. Verify TOTP Code or hashed Recovery Code
  let isVerified = false;
  if (employee.mfaSecret) {
    isVerified = verifyTOTP(employee.mfaSecret, code);
  }

  // Check recovery code if not verified by TOTP
  if (!isVerified && employee.mfaRecoveryCodes) {
    try {
      const hashedInput = crypto.createHash('sha256').update(code).digest('hex');
      const codes: string[] = JSON.parse(employee.mfaRecoveryCodes);
      const codeIndex = codes.indexOf(hashedInput);
      
      if (codeIndex > -1) {
        isVerified = true;
        // Omit/remove used recovery code
        codes.splice(codeIndex, 1);
        await prisma.employee.update({
          where: { id: employee.id },
          data: { mfaRecoveryCodes: JSON.stringify(codes) }
        });
      }
    } catch {}
  }

  if (!isVerified) {
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

    await prisma.auditLog.create({
      data: {
        employeeId: employee.id,
        action: 'MFA_VERIFICATION_FAILURE',
        entityType: 'Employee',
        entityId: employee.id,
        ipAddress,
        details: JSON.stringify({ failedAttempts: newFailedCount })
      }
    });

    if (isLocking) {
      return { error: `تم قفل الحساب بسبب محاولات خاطئة متتالية. يرجى المحاولة بعد ${LOCKOUT_MINUTES} دقيقة.` };
    }
    return { error: 'رمز التحقق الثنائي غير صحيح' };
  }

  // Save verified code for replay protection
  await prisma.siteSettings.upsert({
    where: { key: replayKey },
    update: { value: code },
    create: { key: replayKey, value: code }
  });

  // Success: Reset failures and start session
  await prisma.employee.update({
    where: { id: employee.id },
    data: { failedAttempts: 0, lockoutUntil: null }
  });

  await prisma.loginAttempt.create({
    data: { email: employee.email, ipAddress, userAgent, success: true, employeeId: employee.id }
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
