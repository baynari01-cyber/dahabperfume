import React from 'react';
import Link from 'next/link';
import { requirePermission } from '@/lib/dal';
import { prisma } from '@/lib/db';
import { AdminSidebar } from '@/components/AdminSidebar';
import { ProductNewForm } from '@/components/ProductNewForm';
import { getGlobalSizePrices } from '@/actions/settings';

export default async function AdminProductsNewPage() {
  const session = await requirePermission('manage:products');
  const user = await prisma.employee.findUnique({
    where: { id: session.employeeId },
    include: { role: true }
  });

  const categories = await prisma.category.findMany({ orderBy: { name: 'asc' } });
  const genders = await prisma.gender.findMany({ orderBy: { name: 'asc' } });
  const seasons = await prisma.season.findMany({ orderBy: { name: 'asc' } });
  const families = await prisma.fragranceFamily.findMany({ orderBy: { name: 'asc' } });
  const globalPrices = await getGlobalSizePrices();

  // Find the highest product SKU to auto-increment
  const lastProduct = await prisma.product.findFirst({
    where: {
      sku: { startsWith: 'DHB-' }
    },
    orderBy: {
      sku: 'desc'
    }
  });

  let nextSkuNumber = 1;
  if (lastProduct && lastProduct.sku) {
    const match = lastProduct.sku.match(/DHB-(\d+)/);
    if (match) {
      nextSkuNumber = parseInt(match[1], 10) + 1;
    }
  }
  const nextSku = `DHB-${nextSkuNumber.toString().padStart(4, '0')}`;

  return (
    <div className="flex flex-col md:flex-row h-screen bg-[var(--color-ivory-100)] overflow-hidden" dir="rtl">
      <AdminSidebar employeeName={user?.name || ''} roleName={"ADMIN"} />

      <main className="flex-1 overflow-y-auto p-8 font-sans w-full max-w-full">
        <div className="mb-8 border-b border-[var(--color-ivory-200)] pb-4">
          <div className="flex items-center gap-3 mb-2">
            <Link href="/admin/products" className="text-sm text-zinc-500 hover:underline">المنتجات</Link>
            <span className="text-zinc-300">/</span>
            <span className="text-sm font-bold text-zinc-700">إضافة عطر جديد</span>
          </div>
          <h1 className="text-3xl font-bold font-heading text-[var(--color-charcoal-900)]">
            إضافة عطر جديد
          </h1>
        </div>

        <ProductNewForm 
          categories={categories.map(c => ({ id: c.id, name: c.name }))} 
          genders={genders.map(g => ({ id: g.id, name: g.name }))}
          seasons={seasons.map(s => ({ id: s.id, name: s.name }))}
          families={families.map(f => ({ id: f.id, name: f.name }))}
          globalPrices={globalPrices}
          nextSku={nextSku}
        />
      </main>
    </div>
  );
}
