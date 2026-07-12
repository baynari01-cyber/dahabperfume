import React from 'react';
import { requireAuth, requirePermission } from '@/lib/dal';
import { AdminSidebar } from '@/components/AdminSidebar';
import { prisma } from '@/lib/db';

export default async function AdminEmployeesReportPage() {
  const session = await requireAuth();
  await requirePermission('reports.employees');

  // Load employee stats (sales count and total amounts)
  const employees = await prisma.employee.findMany({
    include: {
      role: true,
      sales: {
        include: {
          payments: true
        }
      }
    },
    orderBy: { name: 'asc' }
  });

  const employeeStats = employees.map(emp => {
    const totalSalesCount = emp.sales.length;
    const totalSalesAmount = emp.sales.reduce((sum, sale) => {
      const saleTotal = sale.total;
      return sum + saleTotal;
    }, 0);

    return {
      id: emp.id,
      name: emp.name,
      email: emp.email,
      role: emp.role.name,
      isActive: emp.isActive,
      totalSalesCount,
      totalSalesAmount
    };
  });

  return (
    <div className="flex min-h-screen bg-[var(--color-ivory-100)] text-zinc-800" dir="rtl">
      <AdminSidebar employeeName={session.employee.name} />

      <main className="flex-grow p-6 md:p-12 w-full max-w-6xl mx-auto space-y-6">
        <div>
          <h1 className="text-2xl font-bold font-heading text-[var(--color-forest-900)]">تقرير أداء ونشاط الموظفين</h1>
          <p className="text-xs text-zinc-500 mt-1">تتبع المبيعات الإجمالية وحساب متوسط الفواتير المسندة لكل موظف.</p>
        </div>

        <div className="bg-white rounded-lg border border-[var(--color-ivory-200)] shadow-sm overflow-hidden">
          <table className="w-full text-right border-collapse text-xs">
            <thead>
              <tr className="bg-zinc-50 text-zinc-500 font-bold border-b">
                <th className="p-4">الموظف</th>
                <th className="p-4">البريد الإلكتروني</th>
                <th className="p-4">الدور الوظيفي</th>
                <th className="p-4">حالة الحساب</th>
                <th className="p-4">عدد الفواتير الصادرة</th>
                <th className="p-4">إجمالي المبيعات</th>
                <th className="p-4">متوسط الفاتورة</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-zinc-150">
              {employeeStats.map(stat => {
                const avgTicket = stat.totalSalesCount > 0 ? (stat.totalSalesAmount / stat.totalSalesCount) : 0;
                return (
                  <tr key={stat.id} className="hover:bg-zinc-50/30">
                    <td className="p-4 font-medium">{stat.name}</td>
                    <td className="p-4">{stat.email}</td>
                    <td className="p-4">{stat.role}</td>
                    <td className="p-4">
                      <span className={`px-2 py-0.5 rounded text-[10px] font-bold ${stat.isActive ? 'bg-green-100 text-green-800' : 'bg-red-100 text-red-800'}`}>
                        {stat.isActive ? 'نشط' : 'موقوف'}
                      </span>
                    </td>
                    <td className="p-4 font-bold">{stat.totalSalesCount}</td>
                    <td className="p-4 text-[var(--color-champagne-600)] font-bold">{(stat.totalSalesAmount / 1000).toFixed(3)} د.أ</td>
                    <td className="p-4 text-zinc-500">{(avgTicket / 1000).toFixed(3)} د.أ</td>
                  </tr>
                );
              })}
            </tbody>
          </table>
        </div>
      </main>
    </div>
  );
}
