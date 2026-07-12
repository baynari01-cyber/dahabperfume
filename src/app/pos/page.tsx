import React from 'react';
import { requireAuth } from '@/lib/dal';
import { prisma } from '@/lib/db';
import { POSCounter } from '@/components/POSCounter';

export default async function POSCounterPage() {
  await requireAuth();

  const products = await prisma.product.findMany({
    where: { isVisible: true },
    include: {
      variants: { where: { isActive: true } },
      category: true,
    }
  });

  const settings = await prisma.globalPricingSettings.findUnique({
    where: { id: '1' }
  });

  const parsedSettings = {
    taxEnabled: settings?.taxEnabled ?? false,
    taxRate: settings?.taxRate ?? 0.0,
    pricesIncludeTax: settings?.pricesIncludeTax ?? true
  };

  return (
    <div className="w-full h-screen overflow-hidden">
      <POSCounter products={products} settings={parsedSettings} />
    </div>
  );
}
