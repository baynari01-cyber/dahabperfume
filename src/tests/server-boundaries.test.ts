import { describe, it, expect, vi, beforeAll, afterAll } from 'vitest';
import { prisma } from '@/lib/db';

vi.mock('server-only', () => ({}));
vi.mock('next/cache', () => ({
  revalidatePath: vi.fn()
}));

// Mock requirePermission to throw permissions missing on cashier mock
let mockActiveRole = 'Cashier';
vi.mock('@/lib/dal', () => {
  return {
    requireAuth: vi.fn(async () => {
      return {
        employeeId: 'emp-boundary-test',
        employee: {
          role: { name: mockActiveRole },
          roleId: mockActiveRole === 'Admin' ? 'role-admin' : 'role-cashier'
        }
      };
    }),
    requirePermission: vi.fn(async (action: string) => {
      if (mockActiveRole === 'Cashier') {
        throw new Error(`Unauthorized Access: Missing ${action}`);
      }
      return {
        employeeId: 'emp-boundary-test',
        employee: {
          role: { name: mockActiveRole },
          roleId: mockActiveRole === 'Admin' ? 'role-admin' : 'role-cashier'
        }
      };
    })
  };
});

import { createImportJob, executeImportDryRun, executeImportCommit } from '@/actions/imports';
import { updateGlobalSizePrice } from '@/actions/settings';

describe('Server Boundary & Access Control Tests', () => {
  beforeAll(async () => {
    const role = await prisma.role.upsert({
      where: { name: 'Admin' },
      update: {},
      create: { name: 'Admin', description: 'Admin' }
    });

    await prisma.employee.upsert({
      where: { id: 'emp-boundary-test' },
      update: {},
      create: {
        id: 'emp-boundary-test',
        email: 'boundary-test@dahab.local',
        passwordHash: 'dummy',
        name: 'Boundary Tester',
        roleId: role.id
      }
    });
  });

  afterAll(async () => {
    await prisma.employee.deleteMany({ where: { id: 'emp-boundary-test' } });
  });

  it('Verify cashiers are blocked from Admin imports triggers', async () => {
    mockActiveRole = 'Cashier';

    // Cashier attempts to create an import job: should throw Unauthorized error
    await expect(createImportJob({
      fileName: 'leak.csv',
      fileType: 'CSV',
      totalRows: 10
    })).rejects.toThrow('Unauthorized Access');
  });

  it('Verify cashiers are blocked from executing dry runs', async () => {
    mockActiveRole = 'Cashier';

    await expect(executeImportDryRun('some-job-id', [])).rejects.toThrow('Unauthorized Access');
  });

  it('Verify cashiers are blocked from committing import jobs', async () => {
    mockActiveRole = 'Cashier';

    await expect(executeImportCommit('some-job-id')).rejects.toThrow('Unauthorized Access');
  });

  it('Verify cashier cannot run admin settings updates', async () => {
    mockActiveRole = 'Cashier';

    const res = await updateGlobalSizePrice('50ml', 10000, 'emp-boundary-test');
    expect(res.success).toBe(false);
    expect(res.error).toContain('Unauthorized Access');
  });

  it('Verify admin access passes successfully', async () => {
    mockActiveRole = 'Admin';

    // Mock category and settings to avoid foreign key errors
    await prisma.role.upsert({
      where: { name: 'Admin' },
      update: {},
      create: { name: 'Admin', description: 'Admin' }
    });

    const res = await createImportJob({
      fileName: 'valid_admin_trigger.csv',
      fileType: 'CSV',
      totalRows: 1
    });

    expect(res.success).toBe(true);

    // Clean up
    await prisma.importJob.delete({ where: { id: res.jobId } });
  });
});
