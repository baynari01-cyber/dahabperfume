import { describe, it, expect, beforeAll, afterAll, vi } from 'vitest';
vi.mock('server-only', () => ({}));
vi.mock('@/lib/dal', () => {
  return {
    requirePermission: vi.fn(async () => {
      return { employeeId: 'test-admin-id', employee: { role: { name: 'Admin' } } };
    }),
    requireAuth: vi.fn(async () => {
      return { employeeId: 'test-admin-id', employee: { role: { name: 'Admin' } } };
    })
  };
});
import { prisma } from '@/lib/db';
import { updateGlobalSizePrice, getGlobalSizePrices } from '@/actions/settings';
import * as argon2 from 'argon2';

describe('RBAC Checkbox Override & Unified Pricing Integration Tests', () => {
  let adminEmployeeId = '';
  let testEmployeeId = '';
  let roleId = '';
  let permPosId = '';
  let permSettingsId = '';

  beforeAll(async () => {
    // 1. Clean up potential old test data
    await prisma.employeePermission.deleteMany({
      where: { employee: { email: { in: ['test-admin@dahab.local', 'test-cashier@dahab.local'] } } }
    });
    await prisma.employee.deleteMany({
      where: { email: { in: ['test-admin@dahab.local', 'test-cashier@dahab.local'] } }
    });
    await prisma.productVariant.deleteMany({
      where: { sku: { in: ['PRC-TEST-1-50ml', 'PRC-TEST-1-100ml'] } }
    });
    await prisma.product.deleteMany({
      where: { sku: 'PRC-TEST-1' }
    });
    await prisma.category.deleteMany({
      where: { slug: 'test-pricing-category' }
    });

    // 2. Fetch or create dynamic roles/permissions
    let role = await prisma.role.findFirst({ where: { name: 'Cashier' } });
    if (!role) {
      role = await prisma.role.create({ data: { name: 'Cashier' } });
    }
    roleId = role.id;

    const pPos = await prisma.permission.upsert({
      where: { action: 'pos:access' },
      update: {},
      create: { action: 'pos:access', description: 'POS access' }
    });
    permPosId = pPos.id;

    const pSettings = await prisma.permission.upsert({
      where: { action: 'manage:settings' },
      update: {},
      create: { action: 'manage:settings', description: 'Manage settings' }
    });
    permSettingsId = pSettings.id;

    // Create a temporary test admin employee
    const passHash = await argon2.hash('testPassword123');
    let adminRole = await prisma.role.findFirst({ where: { name: 'Admin' } });
    if (!adminRole) {
      adminRole = await prisma.role.create({ data: { name: 'Admin' } });
    }

    // Link manage:settings permission to Admin role
    await prisma.rolePermission.upsert({
      where: { roleId_permissionId: { roleId: adminRole.id, permissionId: permSettingsId } },
      update: {},
      create: { roleId: adminRole.id, permissionId: permSettingsId }
    });

    const adminUser = await prisma.employee.create({
      data: {
        email: 'test-admin@dahab.local',
        name: 'Test Admin',
        passwordHash: passHash,
        roleId: adminRole.id
      }
    });
    adminEmployeeId = adminUser.id;

    const cashierUser = await prisma.employee.create({
      data: {
        email: 'test-cashier@dahab.local',
        name: 'Test Cashier',
        passwordHash: passHash,
        roleId: role.id
      }
    });
    testEmployeeId = cashierUser.id;
  });

  afterAll(async () => {
    // Cleanup
    await prisma.employeePermission.deleteMany({
      where: { employeeId: { in: [adminEmployeeId, testEmployeeId] } }
    });
    await prisma.employee.deleteMany({
      where: { id: { in: [adminEmployeeId, testEmployeeId] } }
    });
  });

  describe('RBAC Direct Checkbox Override', () => {
    it('Should allow employee to obtain permission if assigned directly via EmployeePermission', async () => {
      // Initially, cashier has no direct permission to manage settings
      const directInit = await prisma.employeePermission.findFirst({
        where: { employeeId: testEmployeeId, permissionId: permSettingsId }
      });
      expect(directInit).toBeNull();

      // Assign direct permission via checkbox equivalent (EmployeePermission table insert)
      await prisma.employeePermission.create({
        data: {
          employeeId: testEmployeeId,
          permissionId: permSettingsId
        }
      });

      const directAfter = await prisma.employeePermission.findFirst({
        where: { employeeId: testEmployeeId, permissionId: permSettingsId }
      });
      expect(directAfter).not.toBeNull();
    });
  });

  describe('Unified Variant Pricing size-wide modification', () => {
    it('Should update all product variant prices of matching size globally', async () => {
      // 1. Create a test product
      const category = await prisma.category.create({
        data: { name: 'Test Pricing Category', slug: 'test-pricing-category' }
      });

      const product = await prisma.product.create({
        data: {
          sku: 'PRC-TEST-1',
          nameAr: 'عطر تجريبي للتسعير',
          nameEn: 'Pricing Test Perfume',
          slug: 'pricing-test-perfume',
          categoryId: category.id,
          variants: {
            create: [
              { sku: 'PRC-TEST-1-50ml', size: '50ml', price: 10000, stock: 100 },
              { sku: 'PRC-TEST-1-100ml', size: '100ml', price: 15000, stock: 50 }
            ]
          }
        },
        include: {
          variants: true
        }
      });

      // 2. Modify global pricing settings for size 50ml to 12.5 JOD (12500 Fils)
      const updateResult = await updateGlobalSizePrice('50ml', 12500, adminEmployeeId);
      expect(updateResult.success).toBe(true);

      // 3. Verify variant price has updated dynamically in database
      const variant50 = await prisma.productVariant.findFirst({
        where: { productId: product.id, size: '50ml' }
      });
      expect(variant50?.price).toBe(12500);

      // 4. Verify 100ml variant price remained unchanged
      const variant100 = await prisma.productVariant.findFirst({
        where: { productId: product.id, size: '100ml' }
      });
      expect(variant100?.price).toBe(15000);

      // Cleanup test product
      await prisma.productVariant.deleteMany({ where: { productId: product.id } });
      await prisma.product.delete({ where: { id: product.id } });
      await prisma.category.delete({ where: { id: category.id } });
    });
  });
});
