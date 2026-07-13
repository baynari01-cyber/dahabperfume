import React from 'react';
import Link from 'next/link';
import { filsToDisplay } from '@/lib/money';
import { requireAuth } from '@/lib/dal';
import { prisma } from '@/lib/db';
import { AdminSidebar } from '@/components/AdminSidebar';

export default async function AdminRawMaterialsPage() {
  const session = await requireAuth();

  const materials = await prisma.rawMaterial.findMany({
    include: {
      category: true,
      stock: true
    }
  });

  return (
    <div className="flex h-screen bg-[var(--color-ivory-100)]" dir="rtl">
      <AdminSidebar employeeName={session.employee.name} />

      <main className="flex-1 overflow-y-auto p-8 font-sans">
        <div className="flex justify-between items-center mb-8 border-b border-[var(--color-ivory-200)] pb-4">
          <div>
            <h1 className="text-3xl font-bold font-heading text-[var(--color-forest-900)]">
              إدارة مستودع المواد الخام
            </h1>
            <p className="text-zinc-650 mt-1">تتبع الزيوت العطرية، الكحول، الزجاجات، والعلب المطلوبة لتركيبات العطور</p>
          </div>
        </div>

        <div className="bg-white rounded-lg shadow-sm border border-[var(--color-ivory-200)] overflow-hidden">
          <table className="w-full text-right border-collapse">
            <thead className="bg-zinc-50 border-b border-zinc-200">
              <tr className="text-sm font-bold text-zinc-700">
                <th className="px-6 py-4">اسم المادة الخام</th>
                <th className="px-6 py-4">SKU الأصلي</th>
                <th className="px-6 py-4">التصنيف</th>
                <th className="px-6 py-4">المخزون الحالي</th>
                <th className="px-6 py-4">الحد الأدنى للتنبيه</th>
                <th className="px-6 py-4">تكلفة الوحدة الكلية</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-zinc-100">
              {materials.map((mat) => {
                const stockQty = mat.stock?.quantity ?? 0;
                const minThresh = mat.stock?.minThreshold ?? 0;
                const isLow = minThresh > 0 && stockQty <= minThresh;

                return (
                  <tr key={mat.id} className="hover:bg-zinc-50/50 transition-colors text-zinc-650">
                    <td className="px-6 py-4 font-bold text-zinc-900">{mat.name}</td>
                    <td className="px-6 py-4 font-mono text-sm">{mat.sku}</td>
                    <td className="px-6 py-4 text-sm">{mat.category.name}</td>
                    <td className="px-6 py-4">
                      <span className={`font-bold ${isLow ? 'text-red-650 font-extrabold' : 'text-zinc-900'}`}>
                        {stockQty} {mat.unit}
                      </span>
                    </td>
                    <td className="px-6 py-4 text-sm">
                      {minThresh} {mat.unit}
                    </td>
                    <td className="px-6 py-4 font-bold text-[var(--color-forest-800)]">
                      {filsToDisplay(mat.costPerUnit, 'ar')}
                    </td>
                  </tr>
                );
              })}

              {materials.length === 0 && (
                <tr>
                  <td colSpan={6} className="px-6 py-12 text-center text-zinc-500">
                    لا توجد مواد خام مسجلة في المستودع.
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
