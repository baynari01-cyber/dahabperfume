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

  return (
    <div className="flex h-screen bg-[var(--color-ivory-100)]" dir="rtl">
      <AdminSidebar employeeName={session.employee.name} />

      <main className="flex-1 overflow-y-auto p-8 font-sans">
        <div className="flex justify-between items-center mb-8 border-b border-[var(--color-ivory-200)] pb-4">
          <div>
            <h1 className="text-3xl font-bold font-heading text-[var(--color-forest-900)]">
              سجل حركة المنتجات الجاهزة
            </h1>
            <p className="text-zinc-650 mt-1">تتبع الحركات اللوجستية، عمليات البيع، المرتجعات، وتعديلات المخازن</p>
          </div>
        </div>

        <div className="bg-white rounded-lg shadow-sm border border-[var(--color-ivory-200)] overflow-hidden">
          <table className="w-full text-right border-collapse">
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
