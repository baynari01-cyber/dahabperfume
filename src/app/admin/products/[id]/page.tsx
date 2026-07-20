import React from 'react';
import Link from 'next/link';
import { requirePermission } from '@/lib/dal';
import { prisma } from '@/lib/db';
import { AdminSidebar } from '@/components/AdminSidebar';
import { ProductEditForm } from '@/components/ProductEditForm';
import { notFound } from 'next/navigation';

export default async function AdminProductEditPage({
  params
}: {
  params: Promise<{ id: string }>
}) {
  const session = await requirePermission('manage:products');
  const user = await prisma.employee.findUnique({
    where: { id: session.employeeId },
    include: { role: true }
  });

  const { id } = await params;

  const product = await prisma.product.findUnique({
    where: { id },
    include: {
      category: true,
      images: true,
      variants: { orderBy: { createdAt: 'asc' } },
      accords: { include: { accord: true }, orderBy: { order: 'asc' } },
      similarProducts: { include: { similar: { include: { images: { where: { isMain: true }, take: 1 } } } }, orderBy: { order: 'asc' } },
    }
  });

  if (!product) notFound();

  const categories = await prisma.category.findMany({ orderBy: { name: 'asc' } });
  const genders = await prisma.gender.findMany({ orderBy: { name: 'asc' } });
  const seasons = await prisma.season.findMany({ orderBy: { name: 'asc' } });
  const families = await prisma.fragranceFamily.findMany({ orderBy: { name: 'asc' } });
  const allAccords = await prisma.accord.findMany({ orderBy: { name: 'asc' } });

  // All products except this one (for similar products selection)
  const allProducts = await prisma.product.findMany({
    where: { id: { not: id }, isVisible: true },
    include: { images: { where: { isMain: true }, take: 1 } },
    orderBy: { nameAr: 'asc' },
  });

  const initialData = {
    nameAr: product.nameAr,
    nameEn: product.nameEn || '',
    sku: product.sku,
    shortDescription: product.shortDescription,
    longDescription: product.longDescription,
    isVisible: product.isVisible,
    isFeatured: product.isFeatured,
    categoryId: product.categoryId,
    genderId: product.genderId,
    seasonId: product.seasonId,
    familyId: product.familyId,
    stockLiters: product.stockLiters.toString(),
    variants: product.variants.map(v => ({
      id: v.id,
      size: v.size,
      sku: v.sku,
      price: v.price,
      isActive: v.isActive
    })),
    images: product.images.map(img => ({
      id: img.id,
      url: img.url,
      isMain: img.isMain
    })),
    accords: product.accords.map(a => ({
      accordId: a.accordId,
      name: a.accord.name,
      color: a.accord.color,
      value: a.value,
      order: a.order,
    })),
    similarProductIds: product.similarProducts.map(sp => sp.similarId),
  };

  return (
    <div className="flex flex-col md:flex-row h-screen bg-[var(--color-ivory-100)] overflow-hidden" dir="rtl">
      <AdminSidebar employeeName={user?.name || ''} roleName={"ADMIN"} />

      <main className="flex-1 overflow-y-auto p-8 font-sans w-full max-w-full">
        <div className="mb-8 border-b border-[var(--color-ivory-200)] pb-4">
          <div className="flex items-center gap-3 mb-2">
            <Link href="/admin/products" className="text-sm text-zinc-500 hover:underline">المنتجات</Link>
            <span className="text-zinc-300">/</span>
            <span className="text-sm font-bold text-zinc-700">تعديل المنتج</span>
          </div>
          <h1 className="text-3xl font-bold font-heading text-[var(--color-charcoal-900)]">
            تعديل: {product.nameAr}
          </h1>
        </div>

        <ProductEditForm
          productId={product.id}
          initialData={initialData}
          categories={categories.map(c => ({ id: c.id, name: c.name }))}
          genders={genders.map(g => ({ id: g.id, name: g.name }))}
          seasons={seasons.map(s => ({ id: s.id, name: s.name }))}
          families={families.map(f => ({ id: f.id, name: f.name }))}
          allAccords={allAccords.map(a => ({ id: a.id, name: a.name, color: a.color }))}
          allProducts={allProducts.map(p => ({
            id: p.id,
            nameAr: p.nameAr,
            nameEn: p.nameEn,
            sku: p.sku,
            imageUrl: p.images[0]?.url || null,
          }))}
        />
      </main>
    </div>
  );
}
