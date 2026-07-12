import React from 'react';
import { requireAuth } from '@/lib/dal';
import { prisma } from '@/lib/db';
import { AdminSidebar } from '@/components/AdminSidebar';

export default async function AdminCategoriesPage() {
  const session = await requireAuth();

  const categories = await prisma.category.findMany({
    include: {
      _count: { select: { products: true } }
    }
  });

  return (
    <div className="flex h-screen bg-[var(--color-ivory-100)]" dir="rtl">
      <AdminSidebar employeeName={session.employee.name} />

      <main className="flex-1 overflow-y-auto p-8 font-sans">
        <div className="flex justify-between items-center mb-8 border-b border-[var(--color-ivory-200)] pb-4">
          <div>
            <h1 className="text-3xl font-bold font-heading text-[var(--color-forest-900)]">
              تصنيفات العطور
            </h1>
            <p className="text-zinc-650 mt-1">إدارة الفئات والتصنيفات الأساسية لتقسيم العطور</p>
          </div>
        </div>

        <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
          {/* Categories List */}
          <div className="lg:col-span-2 bg-white rounded-lg shadow-sm border border-[var(--color-ivory-200)] overflow-hidden">
            <table className="w-full text-right border-collapse">
              <thead className="bg-zinc-50 border-b border-zinc-200">
                <tr className="text-sm font-bold text-zinc-700">
                  <th className="px-6 py-4">اسم التصنيف</th>
                  <th className="px-6 py-4">Slug</th>
                  <th className="px-6 py-4 text-center">عدد المنتجات</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-zinc-100">
                {categories.map((cat) => (
                  <tr key={cat.id} className="hover:bg-zinc-50/50 transition-colors text-zinc-650">
                    <td className="px-6 py-4 font-bold text-zinc-900">{cat.name}</td>
                    <td className="px-6 py-4 font-mono text-sm">{cat.slug}</td>
                    <td className="px-6 py-4 text-center font-bold text-[var(--color-forest-800)]">
                      {cat._count.products}
                    </td>
                  </tr>
                ))}

                {categories.length === 0 && (
                  <tr>
                    <td colSpan={3} className="px-6 py-12 text-center text-zinc-500">
                      لا توجد تصنيفات حالياً.
                    </td>
                  </tr>
                )}
              </tbody>
            </table>
          </div>

          {/* Add Category Form (Simulated visual placeholder) */}
          <div className="bg-white p-6 rounded-lg border border-[var(--color-ivory-200)] shadow-sm h-fit">
            <h3 className="text-lg font-bold text-[var(--color-forest-900)] mb-4 border-b pb-2">
              إضافة تصنيف جديد
            </h3>
            <div className="space-y-4">
              <div>
                <label className="block text-sm font-medium text-zinc-700 mb-1">اسم التصنيف</label>
                <input 
                  type="text" 
                  disabled
                  placeholder="مغلق في وضع التطوير المحلي"
                  className="w-full border border-zinc-200 rounded px-3 py-2 text-sm bg-zinc-50 text-zinc-400 outline-none"
                />
              </div>
              <button 
                disabled 
                className="w-full bg-zinc-200 text-zinc-400 py-2.5 rounded font-bold text-sm cursor-not-allowed"
              >
                إضافة تصنيف
              </button>
            </div>
          </div>
        </div>
      </main>
    </div>
  );
}
