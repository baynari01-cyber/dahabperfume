'use server';

import { prisma } from '@/lib/db';

export async function getPaginatedProducts({
  skip = 0,
  take = 40,
  categoryId = '',
  genderId = '',
  familyId = '',
  q = '',
  orderBy = 'createdAt_desc'
}: {
  skip?: number;
  take?: number;
  categoryId?: string;
  genderId?: string;
  familyId?: string;
  q?: string;
  orderBy?: string;
}) {
  const where: any = { isVisible: true };
  
  if (categoryId) where.categoryId = categoryId;
  if (genderId) where.genderId = genderId;
  if (familyId) where.familyId = familyId;
  
  if (q) {
    where.OR = [
      { nameAr: { contains: q } },
      { nameEn: { contains: q } }
    ];
  }

  let orderByClause: any = { createdAt: 'desc' };
  
  // Note: we can map the generic 'orderBy' strings to prisma clauses here if needed
  if (orderBy === 'price_asc') {
    // Handling sorting by relation is tricky, typically we rely on default sorting or add denormalized fields.
    // For now we stick to createdAt desc.
  }

  const [products, total] = await Promise.all([
    prisma.product.findMany({
      where,
      skip,
      take,
      include: {
        variants: { orderBy: { size: 'asc' } },
        images: { orderBy: { order: 'asc' } },
        category: true,
      },
      orderBy: orderByClause
    }),
    prisma.product.count({ where })
  ]);

  return { success: true, products, total };
}
