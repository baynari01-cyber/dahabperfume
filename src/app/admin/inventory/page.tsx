import React from 'react';
import { requireAuth } from '@/lib/dal';
import { prisma } from '@/lib/db';
import { AdminSidebar } from '@/components/AdminSidebar';

export default async function AdminInventoryPage() {
  const session = await requireAuth();

  const movements = await prisma.inventoryMovement.findMany({
    orderBy: { createdAt: 'desc' },
    include: {
      employee: true
    }
  });

  const products = await prisma.product.findMany({
    orderBy: { nameAr: 'asc' },
    select: { id: true, nameAr: true, sku: true, stockLiters: true }
  });

  return (
    <div className="flex h-screen bg-[var(--color-ivory-100)]" dir="rtl">
      <AdminSidebar employeeName={session.employee.name} />

      <main className="flex-1 overflow-y-auto p-4 md:p-8 font-sans w-full max-w-full">
        <div className="flex justify-between items-center mb-8 border-b border-[var(--color-ivory-200)] pb-4">
          <div>
            <h1 className="text-3xl font-bold font-heading text-[var(--color-charcoal-900)]">
              سجل الحركات ومخزون الزيوت العطرية
            </h1>
            <p className="text-zinc-650 mt-1">تتبع كميات اللترات المتبقية لكل عطر وحركات التعديل والبيع</p>
          </div>
        </div>

        {/* Essential Oils Summary Table */}
        <div className="mb-10 bg-white rounded-lg shadow-sm border border-[var(--color-ivory-200)] overflow-x-auto">
          <div className="p-4 bg-[var(--color-champagne-50)] border-b border-[var(--color-ivory-200)]">
            <h2 className="text-lg font-bold text-[var(--color-charcoal-900)]">مخزون الزيوت العطرية الحالي (باللتر)</h2>
          </div>
          <table className="w-full text-right border-collapse min-w-[600px]">
            <thead className="bg-zinc-50 border-b border-zinc-200">
              <tr className="text-sm font-bold text-zinc-700">
                <th className="px-6 py-3 w-1/3">اسم العطر</th>
                <th className="px-6 py-3 w-1/3">SKU الأساسي</th>
                <th className="px-6 py-3 w-1/3">الكمية المتبقية (لتر)</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-zinc-100 text-sm">
              {products.map(p => (
                <tr key={p.id} className="hover:bg-zinc-50/50 transition-colors">
                  <td className="px-6 py-3 font-bold text-zinc-900">{p.nameAr}</td>
                  <td className="px-6 py-3 text-zinc-500 font-mono">{p.sku}</td>
                  <td className="px-6 py-3">
                    <span className={`inline-block px-3 py-1 rounded font-bold ${p.stockLiters <= 0.5 ? 'bg-red-100 text-red-800' : 'bg-emerald-100 text-emerald-800'}`}>
                      {p.stockLiters} لتر
                    </span>
                  </td>
                </tr>
              ))}
              {products.length === 0 && (
                <tr>
                  <td colSpan={3} className="px-6 py-8 text-center text-zinc-500">لا توجد عطور مضافة بعد.</td>
                </tr>
              )}
            </tbody>
          </table>
        </div>

        {/* Movements Table */}
        <h2 className="text-xl font-bold text-zinc-900 mb-4">أحدث الحركات اللوجستية والمبيعات</h2>
        <div className="bg-white rounded-lg shadow-sm border border-[var(--color-ivory-200)] overflow-x-auto">
          <table className="w-full text-right border-collapse min-w-[800px]">
            <thead className="bg-zinc-50 border-b border-zinc-200">
              <tr className="text-sm font-bold text-zinc-700">
                <th className="px-6 py-4">SKU المنتج</th>
                <th className="px-6 py-4">نوع الحركة</th>
                <th className="px-6 py-4">الكمية</th>
                <th className="px-6 py-4">الموظف المسؤول</th>
                <th className="px-6 py-4">المرجع</th>
                <th className="px-6 py-4">التاريخ والوقت</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-zinc-100">
              {movements.map((move) => (
                <tr key={move.id} className="hover:bg-zinc-50/50 transition-colors text-zinc-650">
                  <td className="px-6 py-4 font-bold font-mono text-zinc-900">{move.sku}</td>
                  <td className="px-6 py-4">
                    <span className={`inline-flex px-2 py-0.5 rounded text-xs font-bold ${move.type === 'SALE' ? 'bg-blue-100 text-blue-800' : move.type === 'IN' ? 'bg-green-100 text-green-800' : 'bg-red-100 text-red-800'}`}>
                      {move.type}
                    </span>
                  </td>
                  <td className={`px-6 py-4 font-bold ${move.quantity > 0 ? 'text-green-600' : 'text-red-650'}`}>
                    {move.quantity > 0 ? `+${move.quantity}` : move.quantity}
                  </td>
                  <td className="px-6 py-4">{move.employee.name}</td>
                  <td className="px-6 py-4 text-xs font-mono">{move.reference || '-'}</td>
                  <td className="px-6 py-4 text-sm">
                    {new Date(move.createdAt).toLocaleString('ar-JO')}
                  </td>
                </tr>
              ))}

              {movements.length === 0 && (
                <tr>
                  <td colSpan={6} className="px-6 py-12 text-center text-zinc-500">
                    لا توجد حركات مخزون مسجلة حالياً.
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
