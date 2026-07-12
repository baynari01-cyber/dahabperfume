import { randomBytes, createHash } from 'crypto';
import * as argon2 from 'argon2';
import { prisma } from './db';
import { cookies } from 'next/headers';

const SESSION_COOKIE_NAME = 'dahab_session';
const SESSION_EXPIRATION_DAYS = 7;

export async function hashPassword(password: string): Promise<string> {
  return argon2.hash(password, { type: argon2.argon2id });
}

export async function verifyPassword(password: string, hash: string): Promise<boolean> {
  return argon2.verify(hash, password);
}

export function generateSessionToken(): string {
  // 256 bits = 32 bytes
  return randomBytes(32).toString('hex');
}

export function hashSessionToken(token: string): string {
  return createHash('sha256').update(token).digest('hex');
}

export async function createSession(employeeId: string) {
  const token = generateSessionToken();
  const hashedToken = hashSessionToken(token);
  const expiresAt = new Date(Date.now() + 1000 * 60 * 60 * 24 * SESSION_EXPIRATION_DAYS);

  await prisma.session.create({
    data: {
      id: hashedToken, // Store the SHA-256 hash as the primary key
      employeeId,
      expiresAt,
    },
  });

  return { token, expiresAt };
}

export async function validateSessionToken(token: string) {
  const hashedToken = hashSessionToken(token);
  const session = await prisma.session.findUnique({
    where: { id: hashedToken },
    include: {
      employee: {
        include: { role: true },
      },
    },
  });

  if (!session) {
    return null;
  }

  if (Date.now() >= session.expiresAt.getTime()) {
    await prisma.session.delete({ where: { id: session.id } });
    return null;
  }

  // Extend session if it's close to expiration (e.g. less than 3 days left)
  const threeDays = 1000 * 60 * 60 * 24 * 3;
  if (session.expiresAt.getTime() - Date.now() < threeDays) {
    const newExpiresAt = new Date(Date.now() + 1000 * 60 * 60 * 24 * SESSION_EXPIRATION_DAYS);
    await prisma.session.update({
      where: { id: session.id },
      data: { expiresAt: newExpiresAt },
    });
    session.expiresAt = newExpiresAt;
  }

  return session;
}

export async function invalidateSession(token: string) {
  const hashedToken = hashSessionToken(token);
  await prisma.session.deleteMany({
    where: { id: hashedToken },
  });
}

export async function setSessionCookie(token: string, expiresAt: Date) {
  const cookieStore = await cookies();
  cookieStore.set(SESSION_COOKIE_NAME, token, {
    httpOnly: true,
    secure: process.env.NODE_ENV === 'production',
    sameSite: 'lax',
    expires: expiresAt,
    path: '/',
  });
}

export async function deleteSessionCookie() {
  const cookieStore = await cookies();
  cookieStore.delete(SESSION_COOKIE_NAME);
}

export async function getCurrentSession() {
  const cookieStore = await cookies();
  const token = cookieStore.get(SESSION_COOKIE_NAME)?.value;
  if (!token) {
    return null;
  }

  const session = await validateSessionToken(token);
  if (!session) {
    await deleteSessionCookie();
    return null;
  }

  return session;
}
