'use server';

import { prisma } from '@/lib/db';
import { requirePermission } from '@/lib/dal';

export async function updateGlobalSizePrice(size: string, priceInFils: number, adminId: string) {
  try {
    await requirePermission('manage:settings');

    if (priceInFils <= 0) {
      return { success: false, error: 'يجب أن يكون السعر قيمة موجبة' };
    }

    const result = await prisma.$transaction(async (tx) => {
      // 1. Get existing global size prices
      const settings = await tx.siteSettings.findUnique({
        where: { key: 'global_size_prices' }
      });

      let currentPrices: Record<string, number> = {
        '50ml': 10000,
        '100ml': 15000,
        '200ml': 25000
      };

      if (settings) {
        try {
          currentPrices = JSON.parse(settings.value);
        } catch (e) {
          // fallback
        }
      }

      currentPrices[size] = priceInFils;

      // 2. Save back to SiteSettings
      await tx.siteSettings.upsert({
        where: { key: 'global_size_prices' },
        update: { value: JSON.stringify(currentPrices) },
        create: { key: 'global_size_prices', value: JSON.stringify(currentPrices) }
      });

      // 3. Update all existing variant rows matching this size where usesGlobalPricing is true
      const { count } = await tx.productVariant.updateMany({
        where: { size, usesGlobalPricing: true },
        data: { price: priceInFils }
      });

      // 4. Record audit log
      await tx.auditLog.create({
        data: {
          employeeId: adminId,
          action: 'GLOBAL_PRICING_UPDATED',
          entityType: 'GlobalPricingSettings',
          entityId: '1',
          details: JSON.stringify({ size, priceInFils, updatedCount: count })
        }
      });

      return { success: true, updatedCount: count };
    });

    return result;
  } catch (error: any) {
    return { success: false, error: error.message || 'حدث خطأ أثناء تعديل السعر' };
  }
}

export async function getGlobalSizePrices() {
  const settings = await prisma.siteSettings.findUnique({
    where: { key: 'global_size_prices' }
  });

  if (!settings) {
    return {
      '50ml': 10000,
      '100ml': 15000,
      '200ml': 25000
    };
  }

  try {
    return JSON.parse(settings.value) as Record<string, number>;
  } catch (e) {
    return {
      '50ml': 10000,
      '100ml': 15000,
      '200ml': 25000
    };
  }
}
