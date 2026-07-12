import { describe, it, expect, vi, beforeEach } from 'vitest';

// Mock dependencies
vi.mock('@/lib/db', () => {
  return {
    prisma: {
      order: {
        findUnique: vi.fn(),
        create: vi.fn(),
      },
      productVariant: {
        findUnique: vi.fn(),
      },
      shippingZone: {
        findUnique: vi.fn(),
      },
      siteSettings: {
        findUnique: vi.fn(),
      },
      $transaction: vi.fn(async (callback) => {
        return callback(prisma);
      }),
    }
  };
});

vi.mock('server-only', () => ({}));
vi.mock('next/headers', () => ({
  headers: vi.fn(() => ({
    get: vi.fn(() => '127.0.0.1')
  }))
}));

import { processCheckout } from '@/actions/checkout';
import { prisma } from '@/lib/db';

describe('Idempotency Snapshot Consistency', () => {
  beforeEach(() => {
    vi.resetAllMocks();
  });

  it('Returns the exact original order details even if product pricing changes afterwards', async () => {
    // 1. Mock existing persisted order with original price snapshot (e.g. 10.00 JOD)
    const originalOrder = {
      id: 'ord-orig-123',
      reference: 'ORD-ORIGINAL-REF',
      customerName: 'Ahmad Test',
      customerPhone: '0781234567',
      shippingCost: 300,
      totalAmount: 2300, // 20.00 JOD items + 3.00 JOD shipping
      items: [
        {
          id: 'item-1',
          name: 'سوفاج',
          size: '50ml',
          quantity: 2,
          unitPrice: 1000, // 10.00 JOD
          total: 2000 // 20.00 JOD
        }
      ]
    };

    (prisma.order.findUnique as any).mockResolvedValue(originalOrder);
    (prisma.siteSettings.findUnique as any).mockResolvedValue({
      key: 'whatsapp_number',
      value: JSON.stringify({ number: '962785050655' })
    });

    // 2. Submit second request with the same idempotency key
    const formData = new FormData();
    formData.append('customerName', 'Ahmad Test');
    formData.append('customerPhone', '0781234567');
    formData.append('idempotencyKey', 'fixed-idempotency-key');
    formData.append('items', JSON.stringify([{ productId: 'prod-1', variantId: 'var-123', quantity: 2 }]));

    const result = await processCheckout(null, formData);

    expect(result.success).toBe(true);
    expect(result.reference).toBe('ORD-ORIGINAL-REF');
    // Ensure the message carries the original price snapshot (10.00 JOD unit price, 20.00 JOD total)
    // and not recalculating from a new price!
    expect(result.whatsappUrl).toContain('20.00');
    expect(result.whatsappUrl).toContain('23.00');
    
    // Ensure order.create was never called
    expect(prisma.order.create).not.toHaveBeenCalled();
  });
});
