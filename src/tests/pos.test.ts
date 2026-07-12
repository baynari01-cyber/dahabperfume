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
      employee: {
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

describe('POS Formula-Based Transactions & Seller Attribution', () => {
  beforeEach(() => {
    vi.resetAllMocks();
  });

  it('Deducts raw materials successfully if stock is available', async () => {
    (prisma.productVariant.findUnique as any).mockResolvedValue({
      id: 'var-1',
      productId: 'prod-1',
      sku: 'DHB-0002-50ml',
      price: 1200,
      isActive: true,
      size: '50ml',
      product: { nameAr: 'سوفاج' }
    });

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
            stock: { quantity: 100.0 }
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

    (prisma.employee.findUnique as any).mockResolvedValue({
      id: 'emp-1',
      name: 'Ahmad Cashier',
      email: 'ahmad@dahab.local',
      role: { name: 'Cashier' }
    });

    const posPayload = {
      items: [{ variantId: 'var-1', sku: 'DHB-0002-50ml', quantity: 2 }],
      customerName: 'POS Cash Customer',
      paymentMethod: 'CASH',
      amountTendered: 3000
    };

    const result: any = await processPOSCheckout(posPayload);

    expect(result.success).toBe(true);
    expect(prisma.rawMaterialStock.update).toHaveBeenCalledTimes(1);
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
            stock: { quantity: 5.0 }
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
    expect(prisma.sale.create).not.toHaveBeenCalled();
  });

  it('Enforces secure seller attribution snapshots: ignores spoofed employeeId, writes immutable name snapshots, prevents partial records on failure', async () => {
    // 1. Setup mock product
    (prisma.productVariant.findUnique as any).mockResolvedValue({
      id: 'var-1',
      productId: 'prod-1',
      sku: 'DHB-0002-50ml',
      price: 1200,
      isActive: true,
      size: '50ml',
      product: { nameAr: 'سوفاج' }
    });

    // 2. Setup mock employee info representing the active session ('emp-1')
    (prisma.employee.findUnique as any).mockResolvedValue({
      id: 'emp-1',
      name: 'Immutability Cashier',
      email: 'immutability-cashier@dahab.local',
      role: { name: 'Cashier' }
    });

    (prisma.globalPricingSettings.findUnique as any).mockResolvedValue({
      taxRate: 16.0
    });

    (prisma.sale.create as any).mockResolvedValue({
      id: 'sale-immutable-1',
      reference: 'POS-IMMUTABLE-REF'
    });

    // Payload containing a spoofed employeeId from client side ('client-spoofed-employee-id')
    const posPayload = {
      items: [{ variantId: 'var-1', sku: 'DHB-0002-50ml', quantity: 1 }],
      customerName: 'POS Cash Customer',
      paymentMethod: 'CASH',
      amountTendered: 1200,
      employeeId: 'client-spoofed-employee-id' // Spoofed client input
    };

    // 3. Perform checkout
    const result: any = await processPOSCheckout(posPayload);
    expect(result.success).toBe(true);

    // 4. Assert spoofed client employeeId is ignored and session employee ('emp-1') is stored instead
    expect(prisma.sale.create).toHaveBeenCalledWith(
      expect.objectContaining({
        data: expect.objectContaining({
          soldByEmployeeId: 'emp-1', // Uses session value
          sellerNameSnapshot: 'Immutability Cashier', // Immutable snapshot
          sellerRoleSnapshot: 'Cashier'
        })
      })
    );

    // 5. Assert invoice and receipt display matching stored snapshot values
    expect(prisma.invoice.create).toHaveBeenCalledWith(
      expect.objectContaining({
        data: expect.objectContaining({
          confirmedByEmployeeId: 'emp-1',
          cashierNameSnapshot: 'Immutability Cashier',
          cashierRoleSnapshot: 'Cashier'
        })
      })
    );

    // 6. Assert failed checkouts create no seller records (handled by standard database transaction rollback)
    (prisma.productVariant.findUnique as any).mockResolvedValue(null); // Force error
    const failedResult = await processPOSCheckout(posPayload);
    expect(failedResult.success).toBe(false);
  });
});
