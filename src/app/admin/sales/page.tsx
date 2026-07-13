import React from 'react';
import { requireAuth } from '@/lib/dal';
import { filsToDisplay } from '@/lib/money';
import { prisma } from '@/lib/db';
import { AdminSidebar } from '@/components/AdminSidebar';
import Link from 'next/link';

export default async function AdminSalesPage({
  searchParams
}: {
  searchParams: Promise<{ employeeId?: string; source?: string; payMethod?: string }>;
}) {
  const session = await requireAuth();

  const resolvedParams = await searchParams;
  const filterEmployee = resolvedParams.employeeId;
  const filterSource = resolvedParams.source;
  const filterPayMethod = resolvedParams.payMethod;

  const whereClause: any = {};
  if (filterEmployee) whereClause.employeeId = filterEmployee;
  if (filterSource) whereClause.source = filterSource;
  if (filterPayMethod) {
    whereClause.payments = {
      some: { method: filterPayMethod }
    };
  }

  const sales = await prisma.sale.findMany({
    where: whereClause,
    orderBy: { createdAt: 'desc' },
    include: {
      employee: true,
      items: true,
      payments: true
    }
  });

  const employees = await prisma.employee.findMany();

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

        {/* Filters */}
        <div className="bg-white p-4 rounded-lg shadow-sm border border-[var(--color-ivory-200)] mb-6 flex gap-4 text-sm">
          <div>
            <label className="block text-xs font-bold text-zinc-600 mb-1">الموظف (الكاشير)</label>
            <form action="/admin/sales" method="GET">
              {filterSource && <input type="hidden" name="source" value={filterSource} />}
              {filterPayMethod && <input type="hidden" name="payMethod" value={filterPayMethod} />}
              <select name="employeeId" className="border rounded p-2 text-xs" onChange={(e) => e.target.form?.submit()} defaultValue={filterEmployee || ''}>
                <option value="">الجميع</option>
                {employees.map(e => <option key={e.id} value={e.id}>{e.name}</option>)}
              </select>
            </form>
          </div>

          <div>
            <label className="block text-xs font-bold text-zinc-600 mb-1">نوع الطلب (المصدر)</label>
            <form action="/admin/sales" method="GET">
              {filterEmployee && <input type="hidden" name="employeeId" value={filterEmployee} />}
              {filterPayMethod && <input type="hidden" name="payMethod" value={filterPayMethod} />}
              <select name="source" className="border rounded p-2 text-xs" onChange={(e) => e.target.form?.submit()} defaultValue={filterSource || ''}>
                <option value="">الجميع</option>
                <option value="POS">نقطة بيع (كاش)</option>
                <option value="STOREFRONT">طلب متجر (توصيل)</option>
              </select>
            </form>
          </div>
          
          <div>
            <label className="block text-xs font-bold text-zinc-600 mb-1">طريقة الدفع</label>
            <form action="/admin/sales" method="GET">
              {filterEmployee && <input type="hidden" name="employeeId" value={filterEmployee} />}
              {filterSource && <input type="hidden" name="source" value={filterSource} />}
              <select name="payMethod" className="border rounded p-2 text-xs" onChange={(e) => e.target.form?.submit()} defaultValue={filterPayMethod || ''}>
                <option value="">الجميع</option>
                <option value="CASH">نقدي</option>
                <option value="CARD">بطاقة</option>
              </select>
            </form>
          </div>

          <div className="self-end pb-1">
             <Link href="/admin/sales" className="text-zinc-500 hover:text-red-600 underline text-xs">إلغاء الفلاتر</Link>
          </div>
        </div>

        <div className="bg-white rounded-lg shadow-sm border border-[var(--color-ivory-200)] overflow-hidden">
          <table className="w-full text-right border-collapse">
            <thead className="bg-zinc-50 border-b border-zinc-200">
              <tr className="text-sm font-bold text-zinc-700">
                <th className="px-6 py-4">رقم العملية</th>
                <th className="px-6 py-4">الكاشير</th>
                <th className="px-6 py-4">المصدر</th>
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
                    <td className="px-6 py-4">{sale.employee?.name || '-'}</td>
                    <td className="px-6 py-4">
                      <span className={`px-2 py-0.5 rounded text-[10px] font-bold ${sale.source === 'STOREFRONT' ? 'bg-amber-100 text-amber-800' : 'bg-blue-100 text-blue-800'}`}>
                        {sale.source === 'STOREFRONT' ? 'طلب توصيل' : 'نقاط بيع (POS)'}
                      </span>
                    </td>
                    <td className="px-6 py-4">{sale.customerName || '-'}</td>
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
                  <td colSpan={9} className="px-6 py-12 text-center text-zinc-500">
                    لا توجد مبيعات مسجلة تطابق الفلاتر.
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
