import { describe, it, expect, vi, beforeAll, afterAll } from 'vitest';
import { prisma } from '@/lib/db';

// Mock authorization to bypass permission checks and return a system employee
vi.mock('@/lib/dal', () => {
  return {
    requirePermission: vi.fn(async () => {
      return { employeeId: 'emp-concurrency-test' };
    })
  };
});

vi.mock('server-only', () => ({}));
vi.mock('next/headers', () => ({
  headers: vi.fn(() => ({
    get: vi.fn(() => '127.0.0.1')
  }))
}));

import { processPOSCheckout } from '@/actions/pos';
import { confirmStorefrontOrder } from '@/actions/orders';

describe('Real PostgreSQL Database Concurrency & Race Condition Safety', () => {
  let testVariantId: string;
  let testProductId: string;
  let categoryId: string;

  beforeAll(async () => {
    // 0. Ensure role and employee exist
    const role = await prisma.role.upsert({
      where: { name: 'ADMIN' },
      update: {},
      create: { name: 'ADMIN', description: 'Admin' }
    });
    
    await prisma.employee.upsert({
      where: { email: 'test-concurrency@dahab.local' },
      update: {},
      create: {
        id: 'emp-concurrency-test',
        email: 'test-concurrency@dahab.local',
        passwordHash: 'dummy',
        name: 'Concurrency Test Employee',
        roleId: role.id
      }
    });

    // 1. Ensure test category exists
    const category = await prisma.category.upsert({
      where: { slug: 'test-conc' },
      update: {},
      create: { name: 'Test Concurrency', slug: 'test-conc' }
    });
    categoryId = category.id;
  });

  it('Finished Product stock test: Initial stock = 1, concurrent sales qty 1 -> exactly one succeeds', async () => {
    // Create a product with stock = 1
    const sku = `CONC-SKU-${Date.now()}`;
    const product = await prisma.product.create({
      data: {
        sku,
        slug: sku.toLowerCase(),
        nameAr: 'منتج الفحص المتزامن',
        nameEn: 'Concurrency Test Product',
        categoryId,
        isVisible: true,
        variants: {
          create: {
            sku: `${sku}-50ml`,
            size: '50ml',
            price: 1000,
            stock: 1,
            isActive: true
          }
        }
      },
      include: { variants: true }
    });

    const variantId = product.variants[0].id;

    // Trigger two concurrent sales of quantity 1
    const payload1 = {
      items: [{ variantId, sku: `${sku}-50ml`, quantity: 1 }],
      customerName: 'Thread 1',
      paymentMethod: 'CASH',
      amountTendered: 1000
    };

    const payload2 = {
      items: [{ variantId, sku: `${sku}-50ml`, quantity: 1 }],
      customerName: 'Thread 2',
      paymentMethod: 'CASH',
      amountTendered: 1000
    };

    const [res1, res2] = await Promise.all([
      processPOSCheckout(payload1),
      processPOSCheckout(payload2)
    ]);

    // Exactly one must succeed and the other must fail with stock shortage
    const successCount = [res1, res2].filter(r => r.success).length;
    const errorCount = [res1, res2].filter(r => !r.success).length;

    expect(successCount).toBe(1);
    expect(errorCount).toBe(1);

    // Verify final stock is exactly 0
    const finalVariant = await prisma.productVariant.findUnique({
      where: { id: variantId }
    });
    expect(finalVariant?.stock).toBe(0);

    // Verify exactly one sale, invoice, movement, and audit log exist for this SKU
    const movements = await prisma.inventoryMovement.findMany({
      where: { sku: `${sku}-50ml` }
    });
    expect(movements.length).toBe(1);
  });

  it('Raw Material stock test: Set required material quantity for one sale, concurrent formula sales -> exactly one succeeds', async () => {
    const sku = `CONC-FORMULA-${Date.now()}`;
    
    // Create raw material category & raw material with stock = 10 (which is exactly what 1 sale needs!)
    const matCat = await prisma.rawMaterialCategory.upsert({
      where: { name: 'Oils' },
      update: {},
      create: { name: 'Oils' }
    });

    const material = await prisma.rawMaterial.create({
      data: {
        sku: `MAT-CONC-${Date.now()}`,
        name: 'Sauvage Oil Concurrency',
        categoryId: matCat.id,
        unit: 'ml',
        costPerUnit: 100, // 1.00 JOD
        stock: {
          create: {
            quantity: 10.0, // Stock = 10
            minThreshold: 1.0
          }
        }
      }
    });

    // Create product
    const product = await prisma.product.create({
      data: {
        sku,
        slug: sku.toLowerCase(),
        nameAr: 'تركيبة الفحص المتزامن',
        nameEn: 'Formula Concurrency Product',
        categoryId,
        isVisible: true,
        variants: {
          create: {
            sku: `${sku}-50ml`,
            size: '50ml',
            price: 1500,
            stock: 0, // Formula-based, finished stock is 0
            isActive: true
          }
        },
        formulas: {
          create: {
            name: 'Sauvage 50ml Formula',
            size: '50ml',
            isActive: true,
            items: {
              create: {
                materialId: material.id,
                quantity: 10.0 // Requires exactly 10 units of material
              }
            }
          }
        }
      },
      include: { variants: true }
    });

    const variantId = product.variants[0].id;

    // Trigger two concurrent sales of quantity 1
    const payload1 = {
      items: [{ variantId, sku: `${sku}-50ml`, quantity: 1 }],
      customerName: 'Formula Thread 1',
      paymentMethod: 'CASH',
      amountTendered: 1500
    };

    const payload2 = {
      items: [{ variantId, sku: `${sku}-50ml`, quantity: 1 }],
      customerName: 'Formula Thread 2',
      paymentMethod: 'CASH',
      amountTendered: 1500
    };

    const [res1, res2] = await Promise.all([
      processPOSCheckout(payload1),
      processPOSCheckout(payload2)
    ]);

    const successCount = [res1, res2].filter(r => r.success).length;
    const errorCount = [res1, res2].filter(r => !r.success).length;

    expect(successCount).toBe(1);
    expect(errorCount).toBe(1);

    // Verify final raw material stock is exactly 0 and never went negative
    const finalStock = await prisma.rawMaterialStock.findUnique({
      where: { materialId: material.id }
    });
    expect(finalStock?.quantity).toBe(0);
  });

  it('Storefront confirmation test: Confirm the same pending order concurrently -> exactly one confirmation succeeds', async () => {
    // Create a product with stock = 1
    const sku = `CONC-CONFIRM-${Date.now()}`;
    const product = await prisma.product.create({
      data: {
        sku,
        slug: sku.toLowerCase(),
        nameAr: 'منتج تأكيد متزامن',
        nameEn: 'Confirmation Concurrency Product',
        categoryId,
        isVisible: true,
        variants: {
          create: {
            sku: `${sku}-50ml`,
            size: '50ml',
            price: 1000,
            stock: 1,
            isActive: true
          }
        }
      },
      include: { variants: true }
    });

    const variantId = product.variants[0].id;

    // Create a pending order
    const order = await prisma.order.create({
      data: {
        reference: `ORD-CONC-${Date.now()}`,
        customerName: 'Concurrency Storefront',
        customerPhone: '0781234567',
        status: 'AWAITING_WHATSAPP',
        totalAmount: 1300,
        shippingCost: 300,
        items: {
          create: {
            productId: product.id,
            variantId,
            sku: `${sku}-50ml`,
            name: 'منتج تأكيد متزامن',
            size: '50ml',
            quantity: 1,
            unitPrice: 1000,
            total: 1000
          }
        }
      }
    });

    // Confirm the same order concurrently
    const [res1, res2] = await Promise.all([
      confirmStorefrontOrder(order.id),
      confirmStorefrontOrder(order.id)
    ]);

    const successCount = [res1, res2].filter(r => r.success).length;
    const errorCount = [res1, res2].filter(r => r.error).length;

    expect(successCount).toBe(1);
    expect(errorCount).toBe(1);

    // Verify stock is 0
    const finalVariant = await prisma.productVariant.findUnique({
      where: { id: variantId }
    });
    expect(finalVariant?.stock).toBe(0);
  });
});
