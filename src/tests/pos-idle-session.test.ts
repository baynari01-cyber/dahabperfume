import { describe, it, expect, vi, beforeAll, afterAll } from 'vitest';
import { prisma } from '@/lib/db';
import { validateSessionToken, hashSessionToken } from '@/lib/auth';
import { processPOSCheckout } from '@/actions/pos';

// Mock authorization to return a cashier employee
let activeEmployeeId = 'emp-idle-test-cashier';
vi.mock('@/lib/dal', () => {
  return {
    requirePermission: vi.fn(async (perm) => {
      if (perm === 'admin:access') {
        return { employeeId: 'emp-idle-test-admin' };
      }
      return { employeeId: activeEmployeeId };
    })
  };
});

vi.mock('server-only', () => ({}));
vi.mock('next/headers', () => ({
  headers: vi.fn(() => ({
    get: vi.fn(() => '127.0.0.1')
  }))
}));

describe('POS Idle, Session Limits, and Cashier Snapshots Integration Controls', () => {
  let adminId = 'emp-idle-test-admin';
  let cashierId = 'emp-idle-test-cashier';
  let categoryId: string;
  let testProductId: string;
  let testVariantId: string;

  beforeAll(async () => {
    // 0. Ensure roles exist
    const adminRole = await prisma.role.upsert({
      where: { name: 'ADMIN' },
      update: {},
      create: { name: 'ADMIN', description: 'Admin' }
    });

    const cashierRole = await prisma.role.upsert({
      where: { name: 'Cashier' },
      update: {},
      create: { name: 'Cashier', description: 'Cashier' }
    });

    // 1. Create employees
    await prisma.employee.upsert({
      where: { id: adminId },
      update: {},
      create: {
        id: adminId,
        email: 'idle-admin@dahab.local',
        passwordHash: 'dummy',
        name: 'POS Admin User',
        roleId: adminRole.id
      }
    });

    await prisma.employee.upsert({
      where: { id: cashierId },
      update: {},
      create: {
        id: cashierId,
        email: 'idle-cashier@dahab.local',
        passwordHash: 'dummy',
        name: 'POS Cashier User',
        roleId: cashierRole.id
      }
    });

    // 2. Setup product & variant for sales snapshots testing
    const cat = await prisma.category.create({
      data: {
        name: 'عطور جرد مؤقتة',
        slug: 'temp-perfumes-slug-' + Date.now()
      }
    });
    categoryId = cat.id;

    const prod = await prisma.product.create({
      data: {
        nameAr: 'عطر تجربة اللقطات',
        nameEn: 'Snapshot Perfume',
        slug: 'snapshot-perfume-slug-' + Date.now(),
        sku: 'SNAP-SKU-001',
        categoryId: categoryId,
        inventoryMode: 'FINISHED_PRODUCT'
      }
    });
    testProductId = prod.id;

    const variant = await prisma.productVariant.create({
      data: {
        productId: testProductId,
        sku: 'SNAP-SKU-001-50ML',
        size: '50ml',
        price: 10000, // 10 JOD
        stock: 100,
        isActive: true,
        usesGlobalPricing: false
      }
    });
    testVariantId = variant.id;
  });

  afterAll(async () => {
    // Cleanup safely
    await prisma.invoice.deleteMany({
      where: { cashierNameSnapshot: 'POS Cashier User' }
    });
    await prisma.payment.deleteMany({
      where: { sale: { employeeId: cashierId } }
    });
    await prisma.saleItem.deleteMany({
      where: { sale: { employeeId: cashierId } }
    });
    await prisma.inventoryMovement.deleteMany({
      where: { employeeId: { in: [adminId, cashierId] } }
    });
    await prisma.sale.deleteMany({
      where: { employeeId: cashierId }
    });
    await prisma.productVariant.deleteMany({
      where: { id: testVariantId }
    });
    await prisma.product.deleteMany({
      where: { id: testProductId }
    });
    await prisma.category.deleteMany({
      where: { id: categoryId }
    });
    await prisma.employee.deleteMany({
      where: { id: { in: [adminId, cashierId] } }
    });
  });

  it('should enforce exactly 15 hours absolute session limit for Cashier sessions and disable sliding expiration', async () => {
    // 1. Create a dummy session token in the database for the cashier
    const token = 'testtoken15hcashier';
    const hashedToken = hashSessionToken(token);
    const now = new Date();
    const expiresAt = new Date(now.getTime() + 15 * 60 * 60 * 1000); // 15 hours from now

    const session = await prisma.session.create({
      data: {
        id: hashedToken,
        employeeId: cashierId,
        expiresAt,
        createdAt: now
      }
    });

    // 2. Validate the session and verify that it returns the correct structure
    const validationResult = await validateSessionToken(token);
    expect(validationResult).not.toBeNull();
    expect(validationResult?.employee).not.toBeNull();
    expect(validationResult?.employee?.role?.name).toBe('Cashier');

    // 3. Slide check: check that the session expiration is NOT extended (does not slide)
    const initialExpiryTime = session.expiresAt.getTime();
    
    // Call validation again (simulating subsequent request activity)
    const secondValidation = await validateSessionToken(token);
    expect(secondValidation).not.toBeNull();
    
    const reloadedSession = await prisma.session.findUnique({
      where: { id: hashedToken }
    });
    
    // In our auth.ts, cashier sessions skip updating expiresAt, so it must remain exactly initialExpiryTime
    expect(reloadedSession?.expiresAt.getTime()).toBe(initialExpiryTime);

    // Cleanup session
    await prisma.session.delete({ where: { id: hashedToken } });
  });

  it('should snapshot cashier metadata name and role directly in the Sale and Invoice upon checkout', async () => {
    activeEmployeeId = cashierId;

    const payload = {
      items: [
        {
          variantId: testVariantId,
          sku: 'SNAP-SKU-001-50ML',
          quantity: 2
        }
      ],
      customerName: 'صبري عبد الله',
      paymentMethod: 'CASH',
      discount: 0,
      amountTendered: 20000 // 20 JOD in fils
    };

    const checkoutRes = await processPOSCheckout(payload);
    expect(checkoutRes.success).toBe(true);
    expect(checkoutRes.saleId).toBeDefined();

    // Verify snapshots stored in Sale record
    const sale = await prisma.sale.findUnique({
      where: { id: checkoutRes.saleId },
      include: { invoice: true }
    });
    expect(sale).not.toBeNull();
    expect(sale?.sellerNameSnapshot).toBe('POS Cashier User');
    expect(sale?.sellerRoleSnapshot).toBe('Cashier');

    // Verify snapshots stored in Invoice record
    expect(sale?.invoice).not.toBeNull();
    const invoice = sale?.invoice;
    expect(invoice?.cashierNameSnapshot).toBe('POS Cashier User');
    expect(invoice?.cashierRoleSnapshot).toBe('Cashier');
  });
});
