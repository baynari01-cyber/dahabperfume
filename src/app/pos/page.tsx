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

  return (
    <div className="w-full h-screen overflow-hidden">
      <POSCounter products={products} />
    </div>
  );
}
