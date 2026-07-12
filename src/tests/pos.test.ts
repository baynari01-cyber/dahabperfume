import { describe, it, expect, vi, beforeEach } from 'vitest';

vi.mock('@/lib/db', () => {
  return {
    prisma: {
      productVariant: {
        findUnique: vi.fn(),
        update: vi.fn(),
      },
      productFormula: {
        findFirst: vi.fn(),
      },
      rawMaterialStock: {
        update: vi.fn(),
      },
      rawMaterialMovement: {
        create: vi.fn(),
      },
      consumptionRecord: {
        create: vi.fn(),
        updateMany: vi.fn(),
      },
      inventoryMovement: {
        create: vi.fn(),
      },
      globalPricingSettings: {
        findUnique: vi.fn(),
      },
      sale: {
        create: vi.fn(),
      },
      invoice: {
        create: vi.fn(),
      },
      auditLog: {
        create: vi.fn(),
      },
      siteSettings: {
        findUnique: vi.fn(),
      },
      $transaction: vi.fn((callback) => callback(prisma)),
      $executeRawUnsafe: vi.fn(),
    }
  };
});

vi.mock('server-only', () => ({}));
vi.mock('@/lib/dal', () => {
  return {
    requirePermission: vi.fn(() => ({
      employeeId: 'emp-1'
    }))
  };
});

import { processPOSCheckout } from '@/actions/pos';
import { prisma } from '@/lib/db';

describe('POS Formula-Based Transactions', () => {
  beforeEach(() => {
    vi.resetAllMocks();
  });

  it('Deducts raw materials successfully if stock is available', async () => {
    // Mock product lookup
    (prisma.productVariant.findUnique as any).mockResolvedValue({
      id: 'var-1',
      productId: 'prod-1',
      sku: 'DHB-0002-50ml',
      price: 1200,
      isActive: true,
      size: '50ml',
      product: { nameAr: 'سوفاج' }
    });

    // Mock active Formula with 10ml essential oil (oil-1) and 40ml alcohol (alc-1)
    (prisma.productFormula.findFirst as any).mockResolvedValue({
      id: 'form-1',
      productId: 'prod-1',
      name: 'تركيبة سوفاج 50مل',
      size: '50ml',
      isActive: true,
      items: [
        {
          materialId: 'oil-1',
          quantity: 10.0, // 10ml per unit
          material: {
            name: 'زيت سوفاج العطري',
            stock: { quantity: 100.0 } // 100ml available
          }
        },
        {
          materialId: 'alc-1',
          quantity: 40.0, // 40ml per unit
          material: {
            name: 'كحول عطور',
            stock: { quantity: 500.0 } // 500ml available
          }
        }
      ]
    });

    (prisma.globalPricingSettings.findUnique as any).mockResolvedValue({
      taxRate: 16.0
    });

    (prisma.$executeRawUnsafe as any).mockResolvedValue(1);

    (prisma.sale.create as any).mockResolvedValue({
      id: 'sale-1',
      reference: 'POS-12345678'
    });

    const posPayload = {
      items: [{ variantId: 'var-1', sku: 'DHB-0002-50ml', quantity: 2 }],
      customerName: 'POS Cash Customer',
      paymentMethod: 'CASH',
      amountTendered: 3000
    };

    const result: any = await processPOSCheckout(posPayload);

    expect(result.success).toBe(true);
    expect(prisma.rawMaterialStock.update).toHaveBeenCalledTimes(2);
    expect(prisma.rawMaterialMovement.create).toHaveBeenCalledTimes(2);
  });

  it('Rejects transaction and rolls back if raw material stock is insufficient', async () => {
    (prisma.productVariant.findUnique as any).mockResolvedValue({
      id: 'var-1',
      productId: 'prod-1',
      sku: 'DHB-0002-50ml',
      price: 1200,
      isActive: true,
      size: '50ml',
      product: { nameAr: 'سوفاج' }
    });

    // Mock Formula requiring 10ml, but we only have 5ml in stock
    (prisma.productFormula.findFirst as any).mockResolvedValue({
      id: 'form-1',
      productId: 'prod-1',
      name: 'تركيبة سوفاج 50مل',
      size: '50ml',
      isActive: true,
      items: [
        {
          materialId: 'oil-1',
          quantity: 10.0,
          material: {
            name: 'زيت سوفاج العطري',
            stock: { quantity: 5.0 } // Insufficient stock!
          }
        }
      ]
    });

    (prisma.$executeRawUnsafe as any).mockResolvedValue(0);

    const posPayload = {
      items: [{ variantId: 'var-1', sku: 'DHB-0002-50ml', quantity: 1 }],
      customerName: 'POS Cash Customer',
      paymentMethod: 'CASH',
      amountTendered: 3000
    };

    const result: any = await processPOSCheckout(posPayload);

    expect(result.error).toContain('مخزون غير كافٍ للمادة الخام');
    // Database modifications should not be triggered since it aborted and rolled back
    expect(prisma.sale.create).not.toHaveBeenCalled();
    expect(prisma.rawMaterialStock.update).not.toHaveBeenCalled();
  });
});
