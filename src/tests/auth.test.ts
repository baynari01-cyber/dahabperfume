import { describe, it, expect, vi, beforeEach } from 'vitest';

// Mock the dependencies
vi.mock('@/lib/db', () => {
  return {
    prisma: {
      role: {
        findUnique: vi.fn(),
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
    // Mock session as a seller
    (getCurrentSession as any).mockResolvedValue({
      employeeId: 'seller-id',
      employee: {
        id: 'seller-id',
        roleId: 'role-seller'
      }
    });

    // Mock DB response for seller role
    (prisma.role.findUnique as any).mockResolvedValue({
      id: 'role-seller',
      permissions: [
        { permission: { action: 'pos:access' } }
      ]
    });

    await expect(requirePermission('manage:employees')).rejects.toThrow('Unauthorized Access: Missing manage:employees');
  });

  it('An inventory employee cannot access Admin security settings', async () => {
    // Mock session as inventory
    (getCurrentSession as any).mockResolvedValue({
      employeeId: 'inv-id',
      employee: {
        id: 'inv-id',
        roleId: 'role-inv'
      }
    });

    // Mock DB response for inventory role
    (prisma.role.findUnique as any).mockResolvedValue({
      id: 'role-inv',
      permissions: [
        { permission: { action: 'manage:inventory' } }
      ]
    });

    await expect(requirePermission('manage:settings')).rejects.toThrow('Unauthorized Access: Missing manage:settings');
  });

  it('An unauthenticated request cannot invoke protected mutations', async () => {
    // Mock session as null
    (getCurrentSession as any).mockResolvedValue(null);

    await expect(requirePermission('manage:products')).rejects.toThrow('NEXT_REDIRECT');
  });

  it('A manager with permission CAN execute mutation', async () => {
    // Mock session as manager
    (getCurrentSession as any).mockResolvedValue({
      employeeId: 'mgr-id',
      employee: {
        id: 'mgr-id',
        roleId: 'role-mgr'
      }
    });

    // Mock DB response for manager role
    (prisma.role.findUnique as any).mockResolvedValue({
      id: 'role-mgr',
      permissions: [
        { permission: { action: 'manage:products' } }
      ]
    });

    const session = await requirePermission('manage:products');
    expect(session.employeeId).toBe('mgr-id');
  });
});
