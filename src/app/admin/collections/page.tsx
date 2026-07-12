import React from 'react';
import { requireAuth } from '@/lib/dal';
import { prisma } from '@/lib/db';
import { AdminSidebar } from '@/components/AdminSidebar';

export default async function AdminCollectionsPage() {
  const session = await requireAuth();

  const collections = await prisma.collection.findMany({
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
              المجموعات التسويقية
            </h1>
            <p className="text-zinc-650 mt-1">عرض وإدارة مجموعات المنتجات لتصنيفها تسويقياً</p>
          </div>
        </div>

        <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
          <div className="lg:col-span-2 bg-white rounded-lg shadow-sm border border-[var(--color-ivory-200)] overflow-hidden">
            <table className="w-full text-right border-collapse">
              <thead className="bg-zinc-50 border-b border-zinc-200">
                <tr className="text-sm font-bold text-zinc-700">
                  <th className="px-6 py-4">اسم المجموعة</th>
                  <th className="px-6 py-4">Slug</th>
                  <th className="px-6 py-4 text-center">عدد المنتجات</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-zinc-100">
                {collections.map((col) => (
                  <tr key={col.id} className="hover:bg-zinc-50/50 transition-colors text-zinc-650">
                    <td className="px-6 py-4 font-bold text-zinc-900">{col.name}</td>
                    <td className="px-6 py-4 font-mono text-sm">{col.slug}</td>
                    <td className="px-6 py-4 text-center font-bold text-[var(--color-forest-800)]">
                      {col._count.products}
                    </td>
                  </tr>
                ))}

                {collections.length === 0 && (
                  <tr>
                    <td colSpan={3} className="px-6 py-12 text-center text-zinc-500">
                      لا توجد مجموعات تسويقية حالياً.
                    </td>
                  </tr>
                )}
              </tbody>
            </table>
          </div>

          <div className="bg-white p-6 rounded-lg border border-[var(--color-ivory-200)] shadow-sm h-fit">
            <h3 className="text-lg font-bold text-[var(--color-forest-900)] mb-4 border-b pb-2">
              إضافة مجموعة جديدة
            </h3>
            <div className="space-y-4">
              <div>
                <label className="block text-sm font-medium text-zinc-700 mb-1">اسم المجموعة</label>
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
                إضافة مجموعة
              </button>
            </div>
          </div>
        </div>
      </main>
    </div>
  );
}
