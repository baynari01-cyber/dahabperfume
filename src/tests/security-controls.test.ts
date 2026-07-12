import { describe, it, expect, beforeAll, afterAll, vi } from 'vitest';
vi.mock('server-only', () => ({}));

let testAdminId = '';
let testCashierId = '';

vi.mock('@/lib/dal', () => {
  return {
    requirePermission: vi.fn(async () => {
      return { employeeId: testAdminId || 'test-admin-id', employee: { role: { name: 'Admin' } } };
    }),
    requireAuth: vi.fn(async () => {
      return { employeeId: testAdminId || 'test-admin-id', employee: { role: { name: 'Admin' } } };
    })
  };
});

import { prisma } from '@/lib/db';
import { updateEmployee } from '@/actions/employees';
import { validatePasswordPolicy } from '@/lib/password-policy';
import { rateLimit } from '@/lib/rate-limit';
import { validateSessionToken } from '@/lib/auth';
import { updateGlobalSizePrice } from '@/actions/settings';

describe('Dahab Perfumes Hardened Security Controls & Integrity Tests', () => {
  let adminId = '';
  let cashierId = '';

  beforeAll(async () => {
    // 1. Clean old test employees
    await prisma.employeePermission.deleteMany({
      where: { employee: { email: { in: ['sec-admin-1@dahab.local', 'sec-cashier-1@dahab.local'] } } }
    });
    await prisma.employee.deleteMany({
      where: { email: { in: ['sec-admin-1@dahab.local', 'sec-cashier-1@dahab.local'] } }
    });
    await prisma.productVariant.deleteMany({
      where: { sku: { in: ['SEC-VAR-1-50ml', 'SEC-VAR-2-50ml'] } }
    });
    await prisma.product.deleteMany({
      where: { sku: { in: ['SEC-VAR-1', 'SEC-VAR-2'] } }
    });
    await prisma.category.deleteMany({
      where: { slug: 'sec-category' }
    });

    // 2. Fetch admin role
    const adminRole = await prisma.role.findFirst({ where: { name: 'Admin' } });
    if (!adminRole) throw new Error('Admin role missing');

    const cashierRole = await prisma.role.findFirst({ where: { name: 'Cashier' } });
    if (!cashierRole) throw new Error('Cashier role missing');

    // Create test active Admin
    const admin = await prisma.employee.create({
      data: {
        email: 'sec-admin-1@dahab.local',
        name: 'Security Admin',
        passwordHash: 'dummyhash',
        roleId: adminRole.id,
        isActive: true
      }
    });
    adminId = admin.id;
    testAdminId = admin.id;

    // Create test Cashier
    const cashier = await prisma.employee.create({
      data: {
        email: 'sec-cashier-1@dahab.local',
        name: 'Security Cashier',
        passwordHash: 'dummyhash',
        roleId: cashierRole.id,
        isActive: true
      }
    });
    cashierId = cashier.id;
    testCashierId = cashier.id;
  });

  afterAll(async () => {
    // Clean up
    await prisma.employeePermission.deleteMany({
      where: { employee: { email: { in: ['sec-admin-1@dahab.local', 'sec-cashier-1@dahab.local'] } } }
    });
    await prisma.employee.deleteMany({
      where: { id: { in: [adminId, cashierId] } }
    });
    await prisma.productVariant.deleteMany({
      where: { sku: { in: ['SEC-VAR-1-50ml', 'SEC-VAR-2-50ml'] } }
    });
    await prisma.product.deleteMany({
      where: { sku: { in: ['SEC-VAR-1', 'SEC-VAR-2'] } }
    });
    await prisma.category.deleteMany({
      where: { slug: 'sec-category' }
    });
  });

  describe('Last Active Super Admin Protection', () => {
    it('should refuse to deactivate the final active Admin account', async () => {
      // Find and temporarily deactivate all other active admin accounts to isolate this admin
      const otherAdmins = await prisma.employee.findMany({
        where: {
          role: { name: 'Admin' },
          isActive: true,
          id: { not: adminId }
        }
      });

      if (otherAdmins.length > 0) {
        await prisma.employee.updateMany({
          where: { id: { in: otherAdmins.map(a => a.id) } },
          data: { isActive: false }
        });
      }

      try {
        const res = await updateEmployee({
          id: adminId,
          name: 'Security Admin',
          email: 'sec-admin-1@dahab.local',
          roleId: (await prisma.role.findFirst({ where: { name: 'Admin' } }))!.id,
          isActive: false, // Attempt to disable
          selectedPermissionIds: [],
          adminId
        });

        expect(res.success).toBe(false);
        expect(res.error).toContain('لا يمكن تعطيل آخر مدير نشط');
      } finally {
        // Restore other admins
        if (otherAdmins.length > 0) {
          await prisma.employee.updateMany({
            where: { id: { in: otherAdmins.map(a => a.id) } },
            data: { isActive: true }
          });
        }
      }
    });
  });

  describe('Password Policy Rule Checks', () => {
    it('should reject passwords shorter than 8 characters', () => {
      const res = validatePasswordPolicy('Short1', 'test@dahab.local');
      expect(res.isValid).toBe(false);
      expect(res.error).toContain('8');
    });

    it('should reject passwords containing email prefix or weak words', () => {
      const res = validatePasswordPolicy('testuser123456789', 'testuser@dahab.local');
      expect(res.isValid).toBe(false);
      expect(res.error).toContain('الحساب الإلكتروني');

      const res2 = validatePasswordPolicy('dahabperfume12345', 'other@dahab.local');
      expect(res2.isValid).toBe(false);
      expect(res2.error).toContain('ضعيفة');
    });
  });

  describe('Persistent Rate Limiting Store', () => {
    it('should lock out requests exceeding points limits', async () => {
      const route = 'test:login';
      const key = 'test-ip-address-123';

      // Clean up previous rate limit records for safety
      await prisma.rateLimitEvent.deleteMany({});

      // Call 5 times (limit is 5)
      for (let i = 0; i < 5; i++) {
        const res = await rateLimit({ key, route, maxAttempts: 5, durationMinutes: 5 });
        expect(res.success).toBe(true);
      }

      // The 6th attempt must be blocked
      const blocked = await rateLimit({ key, route, maxAttempts: 5, durationMinutes: 5 });
      expect(blocked.success).toBe(false);
    });
  });

  describe('Session Expirations & Lifecycle Checks', () => {
    it('should reject validateSessionToken if expired absolute lifetime', async () => {
      // Create session in past (e.g. 13 hours ago)
      const expiredSession = await prisma.session.create({
        data: {
          id: 'test-expired-token-hash-1',
          employeeId: adminId,
          expiresAt: new Date(Date.now() + 60 * 60 * 1000),
          createdAt: new Date(Date.now() - 13 * 60 * 60 * 1000), // 13 hours ago (absolute limit is 12)
          lastActivityAt: new Date()
        }
      });

      const validated = await validateSessionToken('test-expired-token-hash-1');
      expect(validated).toBeNull();
    });

    it('should reject validateSessionToken if idle timeout exceeded', async () => {
      // Create session with last activity 35 minutes ago
      const idleSession = await prisma.session.create({
        data: {
          id: 'test-idle-token-hash-2',
          employeeId: adminId,
          expiresAt: new Date(Date.now() + 60 * 60 * 1000),
          createdAt: new Date(),
          lastActivityAt: new Date(Date.now() - 35 * 60 * 1000) // 35 mins ago (idle limit is 30)
        }
      });

      const validated = await validateSessionToken('test-idle-token-hash-2');
      expect(validated).toBeNull();
    });
  });

  describe('Custom Price Overwrite Protection', () => {
    it('should update global variant prices but preserve custom ones', async () => {
      // Create a category
      const category = await prisma.category.create({
        data: { name: 'Security Category', slug: 'sec-category' }
      });

      // Create product 1 (usesGlobalPricing = true)
      const p1 = await prisma.product.create({
        data: { nameAr: 'Global Product', nameEn: 'Global', sku: 'SEC-VAR-1', slug: 'sec-var-1', categoryId: category.id }
      });
      const v1 = await prisma.productVariant.create({
        data: { productId: p1.id, sku: 'SEC-VAR-1-50ml', size: '50ml', price: 10000, usesGlobalPricing: true }
      });

      // Create product 2 (usesGlobalPricing = false)
      const p2 = await prisma.product.create({
        data: { nameAr: 'Custom Product', nameEn: 'Custom', sku: 'SEC-VAR-2', slug: 'sec-var-2', categoryId: category.id }
      });
      const v2 = await prisma.productVariant.create({
        data: { productId: p2.id, sku: 'SEC-VAR-2-50ml', size: '50ml', price: 12000, usesGlobalPricing: false }
      });

      // Update global price of 50ml to 11 JOD (11000 fils)
      await updateGlobalSizePrice('50ml', 11000, adminId);

      // Verify Product 1 updated
      const updatedV1 = await prisma.productVariant.findUnique({ where: { id: v1.id } });
      expect(updatedV1?.price).toBe(11000);

      // Verify Product 2 remained unchanged (12000 fils)
      const updatedV2 = await prisma.productVariant.findUnique({ where: { id: v2.id } });
      expect(updatedV2?.price).toBe(12000);
    });
  });

  describe('POS Shift requirement & Held Sales persistence', () => {
    it('should respect pos_settings requireShiftToSell constraint', async () => {
      // 1. Enable requireShiftToSell setting via global test variable
      (global as any).__TEST_REQUIRE_SHIFT__ = true;

      const { processPOSCheckout, openShift, closeShift } = await import('@/actions/pos');

      // 2. Try to checkout, should fail with shift required error
      const checkoutRes1 = await processPOSCheckout({
        items: [{ variantId: 'dummy-id', sku: 'SEC-VAR-1-50ml', quantity: 1 }],
        paymentMethod: 'CASH',
        amountTendered: 1000
      });
      expect(checkoutRes1.success).toBe(false);
      expect(checkoutRes1.error).toContain('يجب فتح وردية');

      // 3. Open a shift
      const openRes = await openShift(50000, 'terminal-1');
      expect(openRes.success).toBe(true);

      // 4. Try checkout now, the shift check should pass (it may fail on other stock errors but not shift error)
      const checkoutRes2 = await processPOSCheckout({
        items: [{ variantId: 'dummy-id', sku: 'SEC-VAR-1-50ml', quantity: 1 }],
        paymentMethod: 'CASH',
        amountTendered: 1000
      });
      expect(checkoutRes2.error).not.toContain('يجب فتح وردية');

      // 5. Close the shift
      const closeRes = await closeShift(50000, 'All fine');
      expect(closeRes.success).toBe(true);

      // 6. Checkout should fail again with shift error
      const checkoutRes3 = await processPOSCheckout({
        items: [{ variantId: 'dummy-id', sku: 'SEC-VAR-1-50ml', quantity: 1 }],
        paymentMethod: 'CASH',
        amountTendered: 1000
      });
      expect(checkoutRes3.success).toBe(false);
      expect(checkoutRes3.error).toContain('يجب فتح وردية');

      // Reset global test variable for other tests compatibility
      (global as any).__TEST_REQUIRE_SHIFT__ = false;
    });

    it('should hold and resume sales correctly storing them in PostgreSQL', async () => {
      const { holdSale, resumeHeldSale, getHeldSales } = await import('@/actions/pos');

      const cartJson = JSON.stringify([{ variantId: 'dummy-var-id', quantity: 2 }]);
      const holdRes = await holdSale('Customer A', 'Ahmad', '0790000000', 'Wants to think', cartJson);
      expect(holdRes.success).toBe(true);
      expect(holdRes.heldSale?.label).toBe('Customer A');

      // Verify it's in the list
      const list = await getHeldSales();
      expect(list.some(h => h.label === 'Customer A')).toBe(true);

      // Resume
      const resumeRes = await resumeHeldSale(holdRes.heldSale!.id);
      expect(resumeRes.success).toBe(true);
      expect(resumeRes.cartData).toBe(cartJson);
    });
  });
});
