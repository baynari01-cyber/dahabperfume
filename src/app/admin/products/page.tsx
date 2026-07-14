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
    <div className="flex flex-col md:flex-row h-screen bg-[var(--color-ivory-100)] overflow-hidden" dir="rtl">
      <AdminSidebar employeeName={session.employee.name} />

      <main className="flex-1 overflow-y-auto p-4 md:p-8 font-sans w-full max-w-full">
        <div className="flex justify-between items-center mb-8 border-b border-[var(--color-ivory-200)] pb-4">
          <div>
            <h1 className="text-3xl font-bold font-heading text-[var(--color-charcoal-900)]">
              إدارة المنتجات والأسعار
            </h1>
            <p className="text-zinc-500 mt-1 text-sm">التحكم بكافة العطور، الأحجام، والأسعار • {products.length} منتج</p>
          </div>
          <div className="flex gap-2">
            <GlobalPricingModal initialPrices={globalPrices} adminId={session.employee.id} />
            <Link
              href="/admin/products/new"
              className="bg-[var(--color-charcoal-900)] hover:bg-[var(--color-charcoal-800)] text-white px-6 py-2.5 rounded font-bold transition-colors text-sm shadow-sm"
            >
              + إضافة عطر جديد
            </Link>
          </div>
        </div>

        <div className="bg-white rounded-lg shadow-sm border border-[var(--color-ivory-200)] overflow-x-auto">
          <div className="overflow-x-auto w-full max-w-[90vw] md:max-w-full pb-4"><table className="w-full text-right border-collapse min-w-[800px]">
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
              <tbody className="divide-y divide-zinc-100">
                {products.map((product) => {
                  const mainImage = product.images[0];
                  return (
                    <tr key={product.id} className="hover:bg-zinc-50/50 transition-colors text-zinc-700">
                      <td className="px-4 py-3">
                        <div className="w-12 h-12 rounded-lg border bg-zinc-50 overflow-hidden flex items-center justify-center">
                          {mainImage ? (
                            <img src={mainImage.url} alt={product.nameAr} className="w-full h-full object-contain" />
                          ) : (
                            <span className="text-[10px] text-zinc-400">بدون صورة</span>
                          )}
                        </div>
                      </td>
                      <td className="px-4 py-3">
                        <div className="font-bold text-zinc-900">{product.nameAr}</div>
                        <div className="text-xs text-zinc-400 font-normal">{product.nameEn}</div>
                      </td>
                      <td className="px-4 py-3 text-sm font-mono text-zinc-600">{product.sku}</td>
                      <td className="px-4 py-3 text-sm">{product.category.name}</td>
                      <td className="px-4 py-3 text-sm">
                        <div className="flex flex-wrap gap-1">
                          {product.variants.map((v) => (
                            <span key={v.id} className="bg-[var(--color-ivory-200)] px-2 py-0.5 rounded text-xs font-bold text-[var(--color-charcoal-800)]">
                              {v.size}: {filsToDisplay(v.price, 'ar')}
                            </span>
                          ))}
                          {product.variants.length === 0 && <span className="text-xs text-zinc-400">لا أحجام</span>}
                        </div>
                      </td>
                      <td className="px-4 py-3 text-sm font-mono">
                        <span className={`font-bold ${product.stockLiters < 0.1 ? 'text-red-600' : product.stockLiters < 1 ? 'text-amber-600' : 'text-emerald-600'}`}>
                          {product.stockLiters.toFixed(3)}
                        </span>
                      </td>
                      <td className="px-4 py-3">
                        <span className={`inline-flex px-2 py-0.5 rounded text-xs font-bold ${product.isVisible ? 'bg-green-100 text-green-800' : 'bg-zinc-100 text-zinc-600'}`}>
                          {product.isVisible ? 'نشط' : 'مخفي'}
                        </span>
                      </td>
                      <td className="px-4 py-3 text-center text-sm font-bold">
                        <Link
                          href={`/admin/products/${product.id}`}
                          className="text-[var(--color-champagne-600)] hover:text-[var(--color-champagne-700)] hover:underline"
                        >
                          تعديل
                        </Link>
                      </td>
                    </tr>
                  );
                })}

                {products.length === 0 && (
                  <tr>
                    <td colSpan={8} className="px-6 py-16 text-center">
                      <p className="text-zinc-500 mb-4">لا توجد منتجات في النظام بعد.</p>
                      <Link href="/admin/products/new" className="inline-flex bg-[var(--color-charcoal-900)] text-white px-6 py-2 rounded font-bold text-sm hover:bg-[var(--color-charcoal-800)] transition-colors">
                        + إضافة أول عطر
                      </Link>
                    </td>
                  </tr>
                )}
              </tbody>
            </table></div>
          </div>
      </main>
    </div>
  );
}
