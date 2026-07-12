import { describe, it, expect, vi, beforeEach } from 'vitest';

// Mock the dependencies
vi.mock('@/lib/db', () => {
  return {
    prisma: {
      role: {
        findUnique: vi.fn(),
      },
      employeePermission: {
        findFirst: vi.fn().mockResolvedValue(null),
      }
    }
  };
});

vi.mock('@/lib/auth', () => {
  return {
    getCurrentSession: vi.fn(),
  };
});

vi.mock('server-only', () => ({}));
vi.mock('next/navigation', () => ({
  redirect: () => { throw new Error('NEXT_REDIRECT'); }
}));

import { requirePermission } from '@/lib/dal';
import { prisma } from '@/lib/db';
import { getCurrentSession } from '@/lib/auth';

describe('Authorization Logic (DAL)', () => {
  beforeEach(() => {
    vi.resetAllMocks();
  });

  it('A seller cannot manage employees', async () => {
    (getCurrentSession as any).mockResolvedValue({
      employeeId: 'seller-id',
      employee: { id: 'seller-id', roleId: 'role-seller', isActive: true }
    });

    (prisma.role.findUnique as any).mockResolvedValue({
      id: 'role-seller',
      permissions: [{ permission: { action: 'pos:access' } }]
    });

    await expect(requirePermission('manage:employees')).rejects.toThrow('Unauthorized Access: Missing manage:employees');
  });

  it('A seller cannot change prices without permission', async () => {
    (getCurrentSession as any).mockResolvedValue({
      employeeId: 'seller-id',
      employee: { id: 'seller-id', roleId: 'role-seller', isActive: true }
    });

    (prisma.role.findUnique as any).mockResolvedValue({
      id: 'role-seller',
      permissions: [{ permission: { action: 'pos:access' } }]
    });

    await expect(requirePermission('manage:prices')).rejects.toThrow('Unauthorized Access: Missing manage:prices');
  });

  it('A seller cannot apply discounts without permission', async () => {
    (getCurrentSession as any).mockResolvedValue({
      employeeId: 'seller-id',
      employee: { id: 'seller-id', roleId: 'role-seller', isActive: true }
    });

    (prisma.role.findUnique as any).mockResolvedValue({
      id: 'role-seller',
      permissions: [{ permission: { action: 'pos:access' } }]
    });

    await expect(requirePermission('apply:discounts')).rejects.toThrow('Unauthorized Access: Missing apply:discounts');
  });

  it('A seller cannot void or return a sale without permission', async () => {
    (getCurrentSession as any).mockResolvedValue({
      employeeId: 'seller-id',
      employee: { id: 'seller-id', roleId: 'role-seller', isActive: true }
    });

    (prisma.role.findUnique as any).mockResolvedValue({
      id: 'role-seller',
      permissions: [{ permission: { action: 'pos:access' } }]
    });

    await expect(requirePermission('void:sales')).rejects.toThrow('Unauthorized Access: Missing void:sales');
    await expect(requirePermission('return:sales')).rejects.toThrow('Unauthorized Access: Missing return:sales');
  });

  it('An inventory employee cannot access Admin security settings', async () => {
    (getCurrentSession as any).mockResolvedValue({
      employeeId: 'inv-id',
      employee: { id: 'inv-id', roleId: 'role-inv', isActive: true }
    });

    (prisma.role.findUnique as any).mockResolvedValue({
      id: 'role-inv',
      permissions: [{ permission: { action: 'manage:inventory' } }]
    });

    await expect(requirePermission('manage:settings')).rejects.toThrow('Unauthorized Access: Missing manage:settings');
  });

  it('A POS employee cannot access Admin routes', async () => {
    (getCurrentSession as any).mockResolvedValue({
      employeeId: 'pos-id',
      employee: { id: 'pos-id', roleId: 'role-pos', isActive: true }
    });

    (prisma.role.findUnique as any).mockResolvedValue({
      id: 'role-pos',
      permissions: [{ permission: { action: 'pos:access' } }]
    });

    await expect(requirePermission('manage:admin')).rejects.toThrow('Unauthorized Access: Missing manage:admin');
  });

  it('A disabled employee cannot mutate data or authenticate', async () => {
    // If employee is disabled, getCurrentSession resolves to null (validated in validateSessionToken)
    (getCurrentSession as any).mockResolvedValue(null);

    await expect(requirePermission('pos:access')).rejects.toThrow('NEXT_REDIRECT');
  });

  it('An unauthenticated user cannot invoke actions directly', async () => {
    (getCurrentSession as any).mockResolvedValue(null);

    await expect(requirePermission('manage:products')).rejects.toThrow('NEXT_REDIRECT');
  });

  it('Hiding navigation does not grant or remove server-side permission checks', async () => {
    (getCurrentSession as any).mockResolvedValue({
      employeeId: 'pos-id',
      employee: { id: 'pos-id', roleId: 'role-pos', isActive: true }
    });

    (prisma.role.findUnique as any).mockResolvedValue({
      id: 'role-pos',
      permissions: [{ permission: { action: 'pos:access' } }]
    });

    // Even if client navigates directly or mocks UI state, requirePermission blocks backend execution
    await expect(requirePermission('manage:products')).rejects.toThrow('Unauthorized Access: Missing manage:products');
  });
});
