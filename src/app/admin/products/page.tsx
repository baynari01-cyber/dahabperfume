import React from 'react';
import { requireAuth } from '@/lib/dal';
import { prisma } from '@/lib/db';
import { AdminSidebar } from '@/components/AdminSidebar';
import Link from 'next/link';
import { filsToDisplay } from '@/lib/money';

export default async function AdminProductsPage() {
  const session = await requireAuth();

  const products = await prisma.product.findMany({
    orderBy: { createdAt: 'desc' },
    include: {
      category: true,
      variants: true,
    }
  });

  return (
    <div className="flex h-screen bg-[var(--color-ivory-100)]" dir="rtl">
      {/* Sidebar on the right */}
      <AdminSidebar employeeName={session.employee.name} />

      {/* Main Content */}
      <main className="flex-1 overflow-y-auto p-8 font-sans">
        <div className="flex justify-between items-center mb-8 border-b border-[var(--color-ivory-200)] pb-4">
          <div>
            <h1 className="text-3xl font-bold font-heading text-[var(--color-forest-900)]">
              إدارة المنتجات والأسعار
            </h1>
            <p className="text-zinc-650 mt-1">التحكم بكافة العطور، الأحجام، والأسعار في المعرض والمنتجات</p>
          </div>
          <Link 
            href="/admin/products/new" 
            className="bg-[var(--color-forest-900)] hover:bg-[var(--color-forest-800)] text-white px-6 py-2.5 rounded font-bold transition-colors text-sm"
          >
            + إضافة عطر جديد
          </Link>
        </div>

        <div className="bg-white rounded-lg shadow-sm border border-[var(--color-ivory-200)] overflow-hidden">
          <div className="overflow-x-auto">
            <table className="w-full text-right border-collapse">
              <thead className="bg-zinc-50 border-b border-zinc-200">
                <tr className="text-sm font-bold text-zinc-700">
                  <th className="px-6 py-4">اسم العطر</th>
                  <th className="px-6 py-4">SKU الأصلي</th>
                  <th className="px-6 py-4">التصنيف</th>
                  <th className="px-6 py-4">الأحجام المتوفرة</th>
                  <th className="px-6 py-4">حالة العرض</th>
                  <th className="px-6 py-4 text-center">إجراءات</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-zinc-100">
                {products.map((product) => {
                  return (
                    <tr key={product.id} className="hover:bg-zinc-50/50 transition-colors text-zinc-650">
                      <td className="px-6 py-4 font-bold text-zinc-900">
                        <div>{product.nameAr}</div>
                        <div className="text-xs text-zinc-400 font-normal">{product.nameEn}</div>
                      </td>
                      <td className="px-6 py-4 text-sm font-mono">{product.sku}</td>
                      <td className="px-6 py-4 text-sm">{product.category.name}</td>
                      <td className="px-6 py-4 text-sm">
                        <div className="flex flex-wrap gap-1">
                          {product.variants.map((v) => (
                            <span key={v.id} className="bg-[var(--color-ivory-200)] px-2 py-0.5 rounded text-xs font-bold text-[var(--color-forest-800)]">
                              {v.size}: {filsToDisplay(v.price, 'ar')}
                            </span>
                          ))}
                        </div>
                      </td>
                      <td className="px-6 py-4">
                        <span className={`inline-flex px-2 py-0.5 rounded text-xs font-bold ${product.isVisible ? 'bg-green-100 text-green-800' : 'bg-zinc-150 text-zinc-650'}`}>
                          {product.isVisible ? 'نشط' : 'مخفي'}
                        </span>
                      </td>
                      <td className="px-6 py-4 text-center text-sm font-bold space-x-3">
                        <Link 
                          href={`/admin/products/${product.id}`}
                          className="text-[var(--color-champagne-600)] hover:underline ml-3"
                        >
                          تعديل
                        </Link>
                      </td>
                    </tr>
                  );
                })}

                {products.length === 0 && (
                  <tr>
                    <td colSpan={6} className="px-6 py-12 text-center text-zinc-500">
                      لا توجد منتجات في النظام. قم باستيراد المنتجات من لوحة الاستيراد.
                    </td>
                  </tr>
                )}
              </tbody>
            </table>
          </div>
        </div>
      </main>
    </div>
  );
}
