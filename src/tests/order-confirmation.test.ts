import { describe, it, expect, vi, beforeEach } from 'vitest';

// Mock dependencies
vi.mock('@/lib/db', () => {
  return {
    prisma: {
      order: {
        findUnique: vi.fn(),
        update: vi.fn(),
      },
      orderStatusHistory: {
        create: vi.fn(),
      },
      productVariant: {
        findUnique: vi.fn(),
        update: vi.fn(),
      },
      productFormula: {
        findFirst: vi.fn(),
      },
      inventoryMovement: {
        create: vi.fn(),
      },
      auditLog: {
        create: vi.fn(),
      },
      $transaction: vi.fn(async (callback) => {
        return callback(prisma);
      }),
      $executeRawUnsafe: vi.fn(),
    }
  };
});

vi.mock('server-only', () => ({}));
vi.mock('@/lib/dal', () => {
  return {
    requirePermission: vi.fn(() => ({
      employeeId: 'emp-admin'
    }))
  };
});

import { confirmStorefrontOrder } from '@/actions/orders';
import { prisma } from '@/lib/db';

describe('Storefront Order Confirmation & Stock Deductions Boundary', () => {
  beforeEach(() => {
    vi.resetAllMocks();
  });

  it('Order confirmation deducts stock atomically once and registers history and audits', async () => {
    // Mock successful order lookup
    (prisma.order.findUnique as any).mockResolvedValue({
      id: 'ord-123',
      reference: 'ORD-REF-1',
      status: 'AWAITING_WHATSAPP',
      totalAmount: 3000,
      items: [
        {
          id: 'item-1',
          variantId: 'var-123',
          sku: 'DHB-0002-50ml',
          quantity: 2
        }
      ]
    });

    (prisma.productVariant.findUnique as any).mockResolvedValue({
      id: 'var-123',
      productId: 'prod-1',
      sku: 'DHB-0002-50ml',
      isActive: true,
      size: '50ml',
      product: { nameAr: 'سوفاج' }
    });

    // Mock no formula exists (finished product stock deduction)
    (prisma.productFormula.findFirst as any).mockResolvedValue(null);

    // Mock atomic update affected rows = 1
    (prisma.$executeRawUnsafe as any).mockResolvedValue(1);

    (prisma.order.update as any).mockResolvedValue({
      id: 'ord-123',
      status: 'CONFIRMED'
    });

    const result = await confirmStorefrontOrder('ord-123');

    expect(result.success).toBe(true);
    // Verified inventory movement created
    expect(prisma.inventoryMovement.create).toHaveBeenCalledTimes(1);
    // Verified update triggered
    expect(prisma.productVariant.update).toHaveBeenCalledTimes(1);
    // Verified history and audit logged
    expect(prisma.orderStatusHistory.create).toHaveBeenCalledTimes(1);
    expect(prisma.auditLog.create).toHaveBeenCalledTimes(1);
  });

  it('Duplicate confirmation rejects and deducts zero additional stock', async () => {
    // Mock already confirmed order
    (prisma.order.findUnique as any).mockResolvedValue({
      id: 'ord-123',
      reference: 'ORD-REF-1',
      status: 'CONFIRMED',
      items: []
    });

    const result = await confirmStorefrontOrder('ord-123');

    expect(result.error).toContain('الطلب مؤكد مسبقاً');
    expect(prisma.productVariant.update).not.toHaveBeenCalled();
    expect(prisma.inventoryMovement.create).not.toHaveBeenCalled();
  });

  it('Failed confirmation (e.g. out of stock) rolls back and leaves stock unchanged', async () => {
    (prisma.order.findUnique as any).mockResolvedValue({
      id: 'ord-123',
      reference: 'ORD-REF-1',
      status: 'AWAITING_WHATSAPP',
      items: [
        {
          id: 'item-1',
          variantId: 'var-123',
          sku: 'DHB-0002-50ml',
          quantity: 10
        }
      ]
    });

    (prisma.productVariant.findUnique as any).mockResolvedValue({
      id: 'var-123',
      productId: 'prod-1',
      sku: 'DHB-0002-50ml',
      isActive: true,
      size: '50ml',
      stock: 5,
      product: { nameAr: 'سوفاج' }
    });

    (prisma.productFormula.findFirst as any).mockResolvedValue(null);

    // Mock atomic update failure (affected rows = 0)
    (prisma.$executeRawUnsafe as any).mockResolvedValue(0);

    const result = await confirmStorefrontOrder('ord-123');

    expect(result.error).toContain('مخزون غير كافٍ');
    // Order update and movements must not have been triggered
    expect(prisma.order.update).not.toHaveBeenCalled();
    expect(prisma.inventoryMovement.create).not.toHaveBeenCalled();
  });
});
