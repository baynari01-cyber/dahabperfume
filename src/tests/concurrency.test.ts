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
        // Mock a transaction runner
        return callback(prisma);
      }),
      $executeRaw: vi.fn(),
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

describe('Real Idempotency Flow', () => {
  beforeEach(() => {
    vi.resetAllMocks();
  });

  it('Always returns the exact same order for a duplicate key, regardless of timing', async () => {
    // Mock that findUnique finds the existing order
    const mockOrder = {
      id: 'existing-order-id',
      reference: 'ORD-EXISTING',
      totalAmount: 2500,
      shippingCost: 300,
      createdAt: new Date(Date.now() - 10 * 60 * 1000) // 10 minutes ago (longer than 2 minutes!)
    };

    (prisma.order.findUnique as any).mockResolvedValue(mockOrder);
    (prisma.siteSettings.findUnique as any).mockResolvedValue({
      key: 'whatsapp_number',
      value: JSON.stringify({ number: '962785050655' })
    });

    const formData = new FormData();
    formData.append('customerName', 'Test Customer');
    formData.append('customerPhone', '0781234567');
    formData.append('idempotencyKey', 'cryptographic-key-xyz');
    formData.append('items', JSON.stringify([{ productId: 'p1', variantId: 'v1', quantity: 1 }]));

    const result = await processCheckout(null, formData);

    expect(result.success).toBe(true);
    expect(result.reference).toBe('ORD-EXISTING');
    // Verify we did not call order.create
    expect(prisma.order.create).not.toHaveBeenCalled();
  });
});
