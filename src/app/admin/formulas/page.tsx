import React from 'react';
import { requireAuth } from '@/lib/dal';
import { prisma } from '@/lib/db';
import { AdminSidebar } from '@/components/AdminSidebar';

export default async function AdminFormulasPage() {
  const session = await requireAuth();

  const formulas = await prisma.productFormula.findMany({
    include: {
      product: true,
      items: {
        include: {
          material: true
        }
      }
    }
  });

  return (
    <div className="flex h-screen bg-[var(--color-ivory-100)]" dir="rtl">
      <AdminSidebar employeeName={session.employee.name} />

      <main className="flex-1 overflow-y-auto p-8 font-sans">
        <div className="flex justify-between items-center mb-8 border-b border-[var(--color-ivory-200)] pb-4">
          <div>
            <h1 className="text-3xl font-bold font-heading text-[var(--color-forest-900)]">
              تركيبات العطور الخاصة
            </h1>
            <p className="text-zinc-650 mt-1">تحديد نسب المواد الخام والزيوت المطلوبة لتركيب كل حجم من العطور المصنعة</p>
          </div>
        </div>

        <div className="bg-white rounded-lg shadow-sm border border-[var(--color-ivory-200)] overflow-hidden">
          <table className="w-full text-right border-collapse">
            <thead className="bg-zinc-50 border-b border-zinc-200">
              <tr className="text-sm font-bold text-zinc-700">
                <th className="px-6 py-4">اسم التركيبة</th>
                <th className="px-6 py-4">العطر المرتبط</th>
                <th className="px-6 py-4">الحجم</th>
                <th className="px-6 py-4">المكونات ونسب الاستهلاك</th>
                <th className="px-6 py-4">الحالة</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-zinc-100">
              {formulas.map((form) => (
                <tr key={form.id} className="hover:bg-zinc-50/50 transition-colors text-zinc-650">
                  <td className="px-6 py-4 font-bold text-zinc-900">{form.name}</td>
                  <td className="px-6 py-4 text-sm">{form.product.nameAr}</td>
                  <td className="px-6 py-4 text-sm font-mono">{form.size}</td>
                  <td className="px-6 py-4 text-xs">
                    <div className="space-y-1">
                      {form.items.map((it) => (
                        <div key={it.id}>
                          - {it.material.name}: <span className="font-bold text-[var(--color-forest-800)]">{it.quantity} {it.material.unit}</span>
                        </div>
                      ))}
                    </div>
                  </td>
                  <td className="px-6 py-4">
                    <span className={`inline-flex px-2 py-0.5 rounded text-xs font-bold ${form.isActive ? 'bg-green-100 text-green-800' : 'bg-zinc-150 text-zinc-600'}`}>
                      {form.isActive ? 'نشط' : 'معطل'}
                    </span>
                  </td>
                </tr>
              ))}

              {formulas.length === 0 && (
                <tr>
                  <td colSpan={5} className="px-6 py-12 text-center text-zinc-500">
                    لا توجد تركيبات مسجلة حالياً.
                  </td>
                </tr>
              )}
            </tbody>
          </table>
        </div>
      </main>
    </div>
  );
}
