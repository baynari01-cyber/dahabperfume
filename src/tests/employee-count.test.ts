import { describe, it, expect, vi, beforeAll, afterAll } from 'vitest';
import { prisma } from '@/lib/db';

// Mock authorization to bypass permission checks and return a system employee
vi.mock('@/lib/dal', () => {
  return {
    requirePermission: vi.fn(async (perm) => {
      // Simulate separate manager or cashier employee IDs to test preventSelfApproval
      if (perm === 'inventory.counts.approve') {
        return { employeeId: 'emp-count-test-manager' };
      }
      return { employeeId: 'emp-count-test-cashier' };
    })
  };
});

vi.mock('server-only', () => ({}));
vi.mock('next/headers', () => ({
  headers: vi.fn(() => ({
    get: vi.fn(() => '127.0.0.1')
  }))
}));

import {
  createCountSession,
  getEmployeeCountSession,
  submitCountSession,
  approveCountSession
} from '@/actions/inventory-count';

describe('Employee Stocktaking & Blind Inventory Count Operations', () => {
  let cashierId = 'emp-count-test-cashier';
  let managerId = 'emp-count-test-manager';
  let testProductIdLiquid: string;
  let categoryId: string;

  beforeAll(async () => {
    // 0. Ensure roles and employees exist
    const cashierRole = await prisma.role.upsert({
      where: { name: 'Cashier' },
      update: {},
      create: { name: 'Cashier', description: 'Cashier' }
    });
    const managerRole = await prisma.role.upsert({
      where: { name: 'Manager' },
      update: {},
      create: { name: 'Manager', description: 'Manager' }
    });
    
    await prisma.employee.upsert({
      where: { id: cashierId },
      update: {},
      create: {
        id: cashierId,
        email: 'test-count-cashier@dahab.local',
        passwordHash: 'dummy',
        name: 'Count Test Cashier',
        roleId: cashierRole.id
      }
    });

    await prisma.employee.upsert({
      where: { id: managerId },
      update: {},
      create: {
        id: managerId,
        email: 'test-count-manager@dahab.local',
        passwordHash: 'dummy',
        name: 'Count Test Manager',
        roleId: managerRole.id
      }
    });

    // 1. Setup category
    const cat = await prisma.category.create({
      data: {
        name: 'عطور جرد متخصصة',
        slug: 'count-perfumes-slug-spec-' + Date.now()
      }
    });
    categoryId = cat.id;

    // 2. Setup Liquid Product & Stock
    const pLiquid = await prisma.product.create({
      data: {
        nameAr: 'عطر سائل جرد متخصص',
        nameEn: 'Count Liquid Perfume Spec',
        slug: 'count-liquid-perfume-spec-' + Date.now(),
        sku: 'COUNT-LIQ-SPEC-001',
        categoryId: categoryId,
        inventoryMode: 'DIRECT_LIQUID'
      }
    });
    testProductIdLiquid = pLiquid.id;
  });

  afterAll(async () => {
    // Cleanup database records
    await prisma.inventoryCountLine.deleteMany({
      where: { productId: testProductIdLiquid }
    });
    await prisma.inventoryCountSession.deleteMany({
      where: { assignedEmployeeId: cashierId }
    });
    await prisma.productLiquidMovement.deleteMany({
      where: { productId: testProductIdLiquid }
    });
    await prisma.productLiquidStock.deleteMany({
      where: { productId: testProductIdLiquid }
    });
    await prisma.product.deleteMany({
      where: { id: testProductIdLiquid }
    });
    await prisma.category.deleteMany({
      where: { id: categoryId }
    });
    await prisma.employee.deleteMany({
      where: { id: { in: [cashierId, managerId] } }
    });
  });

  it('should respect blindCountEnabled, serialize the employee response, and assert none of the forbidden properties exist in JSON', async () => {
    // Setup starting stock 1000ml
    await prisma.productLiquidStock.upsert({
      where: { productId: testProductIdLiquid },
      update: { quantityMl: 1000, version: 1 },
      create: {
        productId: testProductIdLiquid,
        quantityMl: 1000,
        lowStockThresholdMl: 200,
        verificationStatus: 'VERIFIED',
        version: 1
      }
    });

    await prisma.siteSettings.upsert({
      where: { key: 'blind_count_enabled' },
      update: { value: 'true' },
      create: { key: 'blind_count_enabled', value: 'true' }
    });

    const session = await createCountSession({
      title: 'جرد أعمى سري',
      assignedEmployeeId: cashierId,
      scopeType: 'ALL'
    });

    const employeeSession = await getEmployeeCountSession(session.id);
    const serializedJson = JSON.stringify(employeeSession);

    // List of forbidden property keys
    const forbiddenProperties = [
      'expectedQuantityMl',
      'expectedQuantityMlSnapshot',
      'expectedUnitsSnapshot',
      'varianceMl',
      'varianceUnits',
      'stockVersionSnapshot',
      'lastMovementIdSnapshot',
      'cost'
    ];

    forbiddenProperties.forEach(prop => {
      // Check that forbidden keys do not exist in the serialized string as object keys (e.g. '"expectedQuantityMl":')
      expect(serializedJson).not.toContain(`"${prop}"`);
    });

    // Check that DTO contains only the allowed employee properties
    const line = employeeSession.lines[0];
    expect(line).toHaveProperty('countSessionId');
    expect(line).toHaveProperty('countLineId');
    expect(line).toHaveProperty('productId');
    expect(line).toHaveProperty('image');
    expect(line).toHaveProperty('SKU');
    expect(line).toHaveProperty('productNameAr');
    expect(line).toHaveProperty('productNameEn');
    expect(line).toHaveProperty('countingUnit');
    expect(line).toHaveProperty('countedQuantityMl');
    expect(line).toHaveProperty('countedUnits');
    expect(line).toHaveProperty('employeeNote');
    expect(line).toHaveProperty('status');
  });

  it('should verify stock version stale count checks: Starting stock=1000ml, version=1, counted=900ml, sale=100ml (version=2), manager approval rejected, final stock=900ml', async () => {
    // 1. Starting stock = 1000ml, version = 1
    await prisma.productLiquidStock.update({
      where: { productId: testProductIdLiquid },
      data: { quantityMl: 1000, version: 1 }
    });

    // 2. Employee starts count session and counts 900ml
    const session = await createCountSession({
      title: 'جرد تداخل المبيعات',
      assignedEmployeeId: cashierId,
      scopeType: 'ALL'
    });

    const liquidLine = session.lines.find((l: any) => l.productId === testProductIdLiquid)!;

    await submitCountSession(session.id, [
      {
        lineId: liquidLine.id,
        countedQuantityMl: 900
      }
    ]);

    // 3. A sale deducts 100ml and changes version to 2 (simulating active sale)
    await prisma.productLiquidStock.update({
      where: { productId: testProductIdLiquid },
      data: {
        quantityMl: 900, // 1000ml - 100ml = 900ml
        version: 2
      }
    });

    // Also write sale movement to simulate database state
    await prisma.productLiquidMovement.create({
      data: {
        productId: testProductIdLiquid,
        type: 'SALE_CONSUMPTION',
        quantityBeforeMl: 1000,
        quantityChangeMl: -100,
        quantityAfterMl: 900,
        employeeId: cashierId,
        reason: 'Sale during count'
      }
    });

    // 4. Manager attempts approval -> must be rejected as stale
    await expect(approveCountSession(session.id, 'اعتماد فروقات التداخل')).rejects.toThrow();

    // 5. Final stock remains 900ml (from the sale) and no additional correction is applied!
    const finalStock = await prisma.productLiquidStock.findUnique({
      where: { productId: testProductIdLiquid }
    });
    expect(finalStock?.quantityMl).toBe(900);
    expect(finalStock?.version).toBe(2);

    // 6. No additional -100ml correction exists in database movement log
    const correctionsCount = await prisma.productLiquidMovement.count({
      where: { productId: testProductIdLiquid, type: 'CORRECTION' }
    });
    expect(correctionsCount).toBe(0);
  });
});
