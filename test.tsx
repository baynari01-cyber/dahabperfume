import React from 'react';
import { requireAuth } from '@/lib/dal';
import { prisma } from '@/lib/db';
import { AdminSidebar } from '@/components/AdminSidebar';
import { GlobalPricingModal } from '@/components/GlobalPricingModal';
import Link from 'next/link';
import { filsToDisplay } from '@/lib/money';
import { getGlobalSizePrices } from '@/actions/settings';
import Image from 'next/image';

export default async function AdminProductsPage() {
  const session = await requireAuth();
  const globalPrices = await getGlobalSizePrices();

  const products = await prisma.product.findMany({
    orderBy: { createdAt: 'desc' },
    include: {
      category: true,
      variants: true,
      images: { where: { isMain: true }, take: 1 }
    }
  });

  return (
    <div className="flex h-screen bg-[var(--color-ivory-100)]" dir="rtl">
      <AdminSidebar employeeName={session.employee.name} />

      <main className="flex-1 overflow-y-auto p-4 md:p-8 font-sans w-full max-w-full">
        <div className="flex justify-between items-center mb-8 border-b border-[var(--color-ivory-200)] pb-4">
          <div>
            <h1 className="text-3xl font-bold font-heading text-[var(--color-forest-900)]">
              إدارة المنتجات والأسعار
            </h1>
            <p className="text-zinc-500 mt-1 text-sm">التحكم بكافة العطور، الأحجام، والأسعار • {products.length} منتج</p>
          </div>
          <div className="flex gap-2">
            <GlobalPricingModal initialPrices={globalPrices} adminId={session.employee.id} />
            <Link
              href="/admin/products/new"
              className="bg-[var(--color-forest-900)] hover:bg-[var(--color-forest-800)] text-white px-6 py-2.5 rounded font-bold transition-colors text-sm shadow-sm"
            >
              + إضافة عطر جديد
            </Link>
          </div>
        </div>

        <div className="bg-white rounded-lg shadow-sm border border-[var(--color-ivory-200)] overflow-x-auto">
          <table className="w-full text-right border-collapse min-w-[800px]">
            <thead className="bg-zinc-50 border-b border-zinc-200">
              <tr className="text-sm font-bold text-zinc-700">
                <th className="px-4 py-4 w-14">صورة</th>
                <th className="px-4 py-4">اسم العطر</th>
                <th className="px-4 py-4">SKU</th>
                <th className="px-4 py-4">التصنيف</th>
                <th className="px-4 py-4">الأحجام والأسعار</th>
                <th className="px-4 py-4">المخزون (لتر)</th>
                  <th className="px-4 py-4">الحالة</th>
                  <th className="px-4 py-4 text-center">إجراءات</th>
                </tr>
              </thead>
              
            </table>
          </div>
        </div>
      </main>
    </div>
  );
}
