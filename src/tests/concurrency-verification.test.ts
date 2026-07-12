import { describe, it, expect, vi, beforeAll, afterAll } from 'vitest';
import { prisma } from '@/lib/db';

// Mock headers and server-only for CLI environment compatibility
vi.mock('server-only', () => ({}));
vi.mock('next/headers', () => ({
  headers: vi.fn(() => ({
    get: vi.fn((key) => {
      if (key === 'host') return 'localhost:3000';
      if (key === 'origin') return 'http://localhost:3000';
      return '127.0.0.1';
    })
  }))
}));

// Mock requirePermission to act as a system employee
vi.mock('@/lib/dal', () => {
  return {
    requirePermission: vi.fn(async () => {
      return { employeeId: 'emp-concurrency-verify' };
    })
  };
});

import { processPOSCheckout } from '@/actions/pos';

describe('DAHAB CONCURRENCY VERIFICATION SUITE', () => {
  let categoryId: string;
  const empId = 'emp-concurrency-verify';

  // Reusable clean up helper to delete product references safely
  async function cleanProduct(productId: string) {
    const variants = await prisma.productVariant.findMany({
      where: { productId }
    });
    const variantIds = variants.map(v => v.id);
    
    if (variantIds.length > 0) {
      await prisma.invoice.deleteMany({ where: { sale: { items: { some: { variantId: { in: variantIds } } } } } });
      await prisma.payment.deleteMany({ where: { sale: { items: { some: { variantId: { in: variantIds } } } } } });
      await prisma.saleItem.deleteMany({ where: { variantId: { in: variantIds } } });
      await prisma.sale.deleteMany({ where: { items: { some: { variantId: { in: variantIds } } } } });
      await prisma.productVariant.deleteMany({ where: { productId } });
    }
    
    await prisma.productLiquidStock.deleteMany({ where: { productId } });
    await prisma.productFormulaItem.deleteMany({ where: { formula: { productId } } });
    await prisma.productFormula.deleteMany({ where: { productId } });
    await prisma.product.delete({ where: { id: productId } }).catch((e) => {
      console.error("PRODUCT DELETE ERROR FOR", productId, e.message);
    });
  }

  beforeAll(async () => {
    const role = await prisma.role.upsert({
      where: { name: 'ADMIN' },
      update: {},
      create: { name: 'ADMIN', description: 'Admin' }
    });

    await prisma.employee.upsert({
      where: { id: empId },
      update: {},
      create: {
        id: empId,
        email: 'verify-conc@dahab.local',
        passwordHash: 'dummy',
        name: 'Verify Concurrency Employee',
        roleId: role.id
      }
    });

    const category = await prisma.category.upsert({
      where: { slug: 'verify-conc-cat' },
      update: {},
      create: { name: 'Verify Conc Cat', slug: 'verify-conc-cat' }
    });
    categoryId = category.id;

    // Clean up any stray products referencing this category from previous aborts
    const strays = await prisma.product.findMany({ where: { categoryId } });
    for (const p of strays) {
      await cleanProduct(p.id);
    }
  });

  afterAll(async () => {
    const strays = await prisma.product.findMany({ where: { categoryId } });
    for (const p of strays) {
      await cleanProduct(p.id);
    }
    await prisma.invoice.deleteMany({ where: { sale: { employeeId: empId } } });
    await prisma.payment.deleteMany({ where: { sale: { employeeId: empId } } });
    await prisma.saleItem.deleteMany({ where: { sale: { employeeId: empId } } });
    await prisma.sale.deleteMany({ where: { employeeId: empId } });
    await prisma.inventoryMovement.deleteMany({ where: { employeeId: empId } });
    await prisma.productLiquidMovement.deleteMany({ where: { employeeId: empId } });
    await prisma.employee.deleteMany({ where: { id: empId } });
    await prisma.category.deleteMany({ where: { id: categoryId } });
  });

  it('1. Finished Product Concurrency: Stock = 1, concurrent sales qty 1 -> exactly one succeeds', async () => {
    const finishedSku = `VCONC-F-${Date.now()}`;
    const finishedProd = await prisma.product.create({
      data: {
        sku: finishedSku,
        slug: finishedSku.toLowerCase(),
        nameAr: 'جاهز متزامن',
        nameEn: 'Ready Concurrency',
        categoryId,
        isVisible: true,
        inventoryMode: 'FINISHED_PRODUCT',
        variants: {
          create: {
            sku: `${finishedSku}-50ml`,
            size: '50ml',
            price: 10000,
            stock: 1,
            isActive: true,
            usesGlobalPricing: false
          }
        }
      },
      include: { variants: true }
    });
    
    const finishedVariantId = finishedProd.variants[0].id;
    const finishedPayloads = Array.from({ length: 5 }).map((_, idx) => ({
      items: [{ variantId: finishedVariantId, sku: `${finishedSku}-50ml`, quantity: 1 }],
      customerName: `Thread Finished ${idx}`,
      paymentMethod: 'CASH' as const,
      amountTendered: 10000
    }));

    const finishedResults = await Promise.all(finishedPayloads.map(p => processPOSCheckout(p)));
    console.log('FINISHED RESULTS:', finishedResults);
    const finishedSuccess = finishedResults.filter(r => r.success).length;
    const finishedFail = finishedResults.filter(r => !r.success).length;
    
    const finishedFinalStock = await prisma.productVariant.findUnique({
      where: { id: finishedVariantId }
    });

    expect(finishedSuccess).toBe(1);
    expect(finishedFail).toBe(4);
    expect(finishedFinalStock?.stock).toBe(0);

    // Clean up
    await cleanProduct(finishedProd.id);
  });

  it('2. Direct Liquid Concurrency: 50ml deducts 50ml, no negative milliliters', async () => {
    const liquidSku = `VCONC-L-${Date.now()}`;
    const liquidProd = await prisma.product.create({
      data: {
        sku: liquidSku,
        slug: liquidSku.toLowerCase(),
        nameAr: 'سائل متزامن',
        nameEn: 'Liquid Concurrency',
        categoryId,
        isVisible: true,
        inventoryMode: 'DIRECT_LIQUID',
        liquidStock: {
          create: {
            quantityMl: 50,
            lowStockThresholdMl: 10,
            verificationStatus: 'VERIFIED'
          }
        },
        variants: {
          create: {
            sku: `${liquidSku}-50ml`,
            size: '50ml',
            price: 10000,
            stock: 0,
            isActive: true,
            usesGlobalPricing: false
          }
        }
      },
      include: { variants: true }
    });

    const liquidVariantId = liquidProd.variants[0].id;
    const liquidPayloads = Array.from({ length: 2 }).map((_, idx) => ({
      items: [{ variantId: liquidVariantId, sku: `${liquidSku}-50ml`, quantity: 1 }],
      customerName: `Thread Liquid ${idx}`,
      paymentMethod: 'CASH' as const,
      amountTendered: 10000
    }));

    const liquidResults = await Promise.all(liquidPayloads.map(p => processPOSCheckout(p)));
    const liquidSuccess = liquidResults.filter(r => r.success).length;
    const liquidFail = liquidResults.filter(r => !r.success).length;

    const liquidFinalStock = await prisma.productLiquidStock.findUnique({
      where: { productId: liquidProd.id }
    });

    expect(liquidSuccess).toBe(1);
    expect(liquidFail).toBe(1);
    expect(liquidFinalStock?.quantityMl).toBe(0);

    // Clean up
    await cleanProduct(liquidProd.id);
  });

  it('3. Formula Material Consumption: One missing material rejects complete sale', async () => {
    const formulaSku = `VCONC-FM-${Date.now()}`;
    const matCat = await prisma.rawMaterialCategory.upsert({
      where: { name: 'Oils' },
      update: {},
      create: { name: 'Oils' }
    });
    const material = await prisma.rawMaterial.create({
      data: {
        sku: `VCONC-M-${Date.now()}`,
        name: 'Verify Material',
        categoryId: matCat.id,
        unit: 'ml',
        costPerUnit: 100,
        stock: {
          create: {
            quantity: 10.0,
            minThreshold: 1.0
          }
        }
      }
    });

    const formulaProd = await prisma.product.create({
      data: {
        sku: formulaSku,
        slug: formulaSku.toLowerCase(),
        nameAr: 'تركيبة متزامنة',
        nameEn: 'Formula Concurrency',
        categoryId,
        isVisible: true,
        inventoryMode: 'FORMULA_BASED',
        variants: {
          create: {
            sku: `${formulaSku}-50ml`,
            size: '50ml',
            price: 15000,
            stock: 0,
            isActive: true,
            usesGlobalPricing: false
          }
        },
        formulas: {
          create: {
            name: 'Verify 50ml Formula',
            size: '50ml',
            isActive: true,
            items: {
              create: {
                materialId: material.id,
                quantity: 10.0
              }
            }
          }
        }
      },
      include: { variants: true }
    });

    const formulaVariantId = formulaProd.variants[0].id;
    const formulaPayloads = Array.from({ length: 2 }).map((_, idx) => ({
      items: [{ variantId: formulaVariantId, sku: `${formulaSku}-50ml`, quantity: 1 }],
      customerName: `Thread Formula ${idx}`,
      paymentMethod: 'CASH' as const,
      amountTendered: 15000
    }));

    const formulaResults = await Promise.all(formulaPayloads.map(p => processPOSCheckout(p)));
    const formulaSuccess = formulaResults.filter(r => r.success).length;
    const formulaFail = formulaResults.filter(r => !r.success).length;

    const formulaFinalStock = await prisma.rawMaterialStock.findUnique({
      where: { materialId: material.id }
    });

    expect(formulaSuccess).toBe(1);
    expect(formulaFail).toBe(1);
    expect(formulaFinalStock?.quantity).toBe(0);

    // Clean up
    await prisma.consumptionRecord.deleteMany({ where: { materialId: material.id } });
    await cleanProduct(formulaProd.id);
    await prisma.rawMaterialStock.deleteMany({ where: { materialId: material.id } });
    await prisma.rawMaterial.delete({ where: { id: material.id } });
  });

  it('4. Idempotency Key Reuse: returns original reference on duplicate submission', async () => {
    const idempotencySku = `VCONC-ID-${Date.now()}`;
    const idempotencyProd = await prisma.product.create({
      data: {
        sku: idempotencySku,
        slug: idempotencySku.toLowerCase(),
        nameAr: 'مكرر متزامن',
        nameEn: 'Idempotency Concurrency',
        categoryId,
        isVisible: true,
        inventoryMode: 'FINISHED_PRODUCT',
        variants: {
          create: {
            sku: `${idempotencySku}-50ml`,
            size: '50ml',
            price: 10000,
            stock: 10,
            isActive: true,
            usesGlobalPricing: false
          }
        }
      },
      include: { variants: true }
    });

    const idempotencyVariantId = idempotencyProd.variants[0].id;
    const idempotencyKey = `idempotency-key-${Date.now()}`;
    const idempotencyPayload = {
      items: [{ variantId: idempotencyVariantId, sku: `${idempotencySku}-50ml`, quantity: 1 }],
      customerName: 'Idempotency Customer',
      paymentMethod: 'CASH' as const,
      amountTendered: 10000,
      idempotencyKey
    };

    const [resId1, resId2] = await Promise.all([
      processPOSCheckout(idempotencyPayload),
      processPOSCheckout(idempotencyPayload)
    ]);
    console.log('IDEMPOTENCY RESULTS:', resId1, resId2);

    const idempotencyFinalStock = await prisma.productVariant.findUnique({
      where: { id: idempotencyVariantId }
    });

    expect(resId1.success).toBe(true);
    expect(resId2.success).toBe(true);
    expect(resId1.reference).toBe(resId2.reference);
    expect(idempotencyFinalStock?.stock).toBe(9);

    // Clean up
    await cleanProduct(idempotencyProd.id);
  });
});
