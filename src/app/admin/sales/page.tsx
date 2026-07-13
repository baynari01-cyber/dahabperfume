import React from 'react';
import { requireAuth } from '@/lib/dal';
import { filsToDisplay } from '@/lib/money';
import { prisma } from '@/lib/db';
import { AdminSidebar } from '@/components/AdminSidebar';

export default async function AdminSalesPage() {
  const session = await requireAuth();

  const sales = await prisma.sale.findMany({
    orderBy: { createdAt: 'desc' },
    include: {
      employee: true,
      items: true,
      payments: true
    }
  });

  return (
    <div className="flex h-screen bg-[var(--color-ivory-100)]" dir="rtl">
      <AdminSidebar employeeName={session.employee.name} />

      <main className="flex-1 overflow-y-auto p-8 font-sans">
        <div className="flex justify-between items-center mb-8 border-b border-[var(--color-ivory-200)] pb-4">
          <div>
            <h1 className="text-3xl font-bold font-heading text-[var(--color-forest-900)]">
              عمليات البيع والفواتير (POS)
            </h1>
            <p className="text-zinc-650 mt-1">سجل المبيعات المسجلة عبر الكاونتر وجلسات الكاشير</p>
          </div>
        </div>

        <div className="bg-white rounded-lg shadow-sm border border-[var(--color-ivory-200)] overflow-hidden">
          <table className="w-full text-right border-collapse">
            <thead className="bg-zinc-50 border-b border-zinc-200">
              <tr className="text-sm font-bold text-zinc-700">
                <th className="px-6 py-4">رقم العملية</th>
                <th className="px-6 py-4">الكاشير</th>
                <th className="px-6 py-4">اسم العميل</th>
                <th className="px-6 py-4">المجموع الفرعي</th>
                <th className="px-6 py-4">الضريبة</th>
                <th className="px-6 py-4">المجموع الإجمالي</th>
                <th className="px-6 py-4">طريقة الدفع</th>
                <th className="px-6 py-4">التاريخ والوقت</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-zinc-100">
              {sales.map((sale) => {
                const payMethod = sale.payments[0]?.method || '-';
                return (
                  <tr key={sale.id} className="hover:bg-zinc-50/50 transition-colors text-zinc-650">
                    <td className="px-6 py-4 font-bold font-mono text-zinc-900">{sale.reference}</td>
                    <td className="px-6 py-4">{sale.employee.name}</td>
                    <td className="px-6 py-4">{sale.customerName}</td>
                    <td className="px-6 py-4">{filsToDisplay(sale.subtotal, 'ar')}</td>
                    <td className="px-6 py-4">{filsToDisplay(sale.tax, 'ar')}</td>
                    <td className="px-6 py-4 font-bold text-emerald-600">
                      {filsToDisplay(sale.total, 'ar')}
                    </td>
                    <td className="px-6 py-4">
                      <span className="bg-zinc-150 px-2.5 py-0.5 rounded text-xs font-bold text-zinc-700">
                        {payMethod}
                      </span>
                    </td>
                    <td className="px-6 py-4 text-sm">
                      {new Date(sale.createdAt).toLocaleString('ar-JO')}
                    </td>
                  </tr>
                );
              })}

              {sales.length === 0 && (
                <tr>
                  <td colSpan={8} className="px-6 py-12 text-center text-zinc-500">
                    لا توجد مبيعات مسجلة في النظام حالياً.
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
