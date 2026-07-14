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
      variants: { orderBy: { createdAt: 'asc' } }
    }
  });

  if (!product) notFound();

  const categories = await prisma.category.findMany({ orderBy: { name: 'asc' } });

  const initialData = {
    nameAr: product.nameAr,
    nameEn: product.nameEn || '',
    sku: product.sku,
    shortDescription: product.shortDescription,
    longDescription: product.longDescription,
    isVisible: product.isVisible,
    isFeatured: product.isFeatured,
    categoryId: product.categoryId || '',
    stockLiters: product.stockLiters,
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
    }))
  };

  return (
    <div className="flex h-screen bg-[var(--color-ivory-100)]" dir="rtl">
      <AdminSidebar employeeName={user?.name || ''} />

      <main className="flex-1 overflow-y-auto p-8 font-sans">
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
          productId={id}
          initialData={initialData}
          categories={categories.map(c => ({ id: c.id, name: c.name }))}
        />
      </main>
    </div>
  );
}
