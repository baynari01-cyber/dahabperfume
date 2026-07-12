import { describe, it, expect, vi, beforeEach } from 'vitest';

vi.mock('@/lib/db', () => {
  return {
    prisma: {
      order: {
        findFirst: vi.fn(),
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
      $transaction: vi.fn((callback) => callback(prisma)),
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

describe('Storefront Checkout Business Flow', () => {
  beforeEach(() => {
    vi.resetAllMocks();
  });

  it('Calculates shipping cost based on the database shipping zone entity', async () => {
    // Mock product variant lookup
    (prisma.productVariant.findUnique as any).mockResolvedValue({
      id: 'var-1',
      productId: 'prod-1',
      sku: 'DHB-0002-50ml',
      price: 1200, // 12.00 JOD
      isActive: true,
      size: '50ml',
      product: { nameAr: 'سوفاج' }
    });

    // Mock shipping zone lookup from database (3.00 JOD)
    (prisma.shippingZone.findUnique as any).mockResolvedValue({
      id: 'zone-amman',
      nameAr: 'عمان',
      fee: 300, // 3.00 JOD
      isEnabled: true,
      freeShippingThreshold: 5000 // Free shipping over 50.00 JOD
    });

    // Mock WhatsApp site settings
    (prisma.siteSettings.findUnique as any).mockResolvedValue({
      key: 'whatsapp_number',
      value: JSON.stringify({ number: '962785050655' })
    });

    // Mock order creation transaction
    (prisma.order.create as any).mockResolvedValue({
      id: 'ord-123',
      reference: 'ORD-TEST1234'
    });

    const formData = new FormData();
    formData.append('customerName', 'Ahmad Test');
    formData.append('customerPhone', '0781234567');
    formData.append('shippingZoneId', 'zone-amman');
    formData.append('items', JSON.stringify([{ productId: 'prod-1', variantId: 'var-1', quantity: 2 }]));

    const result = await processCheckout(null, formData);

    expect(result.success).toBe(true);
    expect(result.whatsappUrl).toContain('962785050655');
    // total = 12.00 * 2 + 3.00 = 27.00 JOD
    expect(result.whatsappUrl).toContain('27.00');
  });

  it('Protects against duplicate submission using idempotency check', async () => {
    // Mock existing recent order
    (prisma.order.findFirst as any).mockResolvedValue({
      id: 'ord-existing',
      reference: 'ORD-EXISTING',
      totalAmount: 2700,
      shippingCost: 300,
      createdAt: new Date()
    });

    (prisma.siteSettings.findUnique as any).mockResolvedValue({
      key: 'whatsapp_number',
      value: JSON.stringify({ number: '962785050655' })
    });

    const formData = new FormData();
    formData.append('customerName', 'Ahmad Test');
    formData.append('customerPhone', '0781234567');
    formData.append('idempotencyKey', 'unique-key-123');
    formData.append('items', JSON.stringify([{ productId: 'prod-1', variantId: 'var-1', quantity: 2 }]));

    const result = await processCheckout(null, formData);

    expect(result.success).toBe(true);
    expect(result.reference).toBe('ORD-EXISTING');
    // Order creation was skipped, it should not call order.create
    expect(prisma.order.create).not.toHaveBeenCalled();
  });
});
