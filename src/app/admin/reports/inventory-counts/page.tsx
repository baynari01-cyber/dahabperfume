import React from 'react';
import { requireAuth, requirePermission } from '@/lib/dal';
import { AdminSidebar } from '@/components/AdminSidebar';
import { prisma } from '@/lib/db';

export default async function AdminInventoryCountsReportPage() {
  const session = await requireAuth();
  await requirePermission('reports.inventory_counts');

  // Fetch all count sessions with their lines
  const countSessions = await prisma.inventoryCountSession.findMany({
    include: {
      assignedEmployee: true,
      lines: true
    },
    orderBy: { createdAt: 'desc' }
  });

  // Calculate aggregated stats
  const totalSessions = countSessions.length;
  const approvedSessions = countSessions.filter(s => s.status === 'APPROVED').length;
  const recountRequiredSessions = countSessions.filter(s => s.status === 'RECOUNT_REQUIRED').length;
  
  // Calculate total absolute variance from all approved sessions
  let totalVarianceMl = 0;
  let totalVarianceUnits = 0;

  countSessions.forEach(session => {
    if (session.status === 'APPROVED') {
      session.lines.forEach(line => {
        totalVarianceMl += Math.abs(line.varianceMl);
        totalVarianceUnits += Math.abs(line.varianceUnits ?? 0);
      });
    }
  });

  return (
    <div className="flex min-h-screen bg-[var(--color-ivory-100)] text-zinc-800" dir="rtl">
      <AdminSidebar employeeName={session.employee.name} />

      <main className="flex-grow p-6 md:p-12 w-full max-w-6xl mx-auto space-y-6">
        <div>
          <h1 className="text-2xl font-bold font-heading text-[var(--color-forest-900)]">تقرير تسويات جرد المخزون</h1>
          <p className="text-xs text-zinc-500 mt-1">مراجعة الفروقات الجردية الإجمالية وتكرار جرد البنود المتأخرة.</p>
        </div>

        {/* Dynamic summary widgets */}
        <div className="grid grid-cols-1 md:grid-cols-4 gap-4">
          <div className="bg-white p-4 rounded-lg border shadow-sm text-center">
            <span className="text-[10px] text-zinc-400 font-bold block">إجمالي جلسات الجرد</span>
            <span className="text-xl font-bold text-zinc-800">{totalSessions}</span>
          </div>
          <div className="bg-white p-4 rounded-lg border shadow-sm text-center">
            <span className="text-[10px] text-zinc-400 font-bold block">الجلسات المعتمدة</span>
            <span className="text-xl font-bold text-green-700">{approvedSessions}</span>
          </div>
          <div className="bg-white p-4 rounded-lg border shadow-sm text-center">
            <span className="text-[10px] text-zinc-400 font-bold block">طلب إعادة الجرد (تداخل مبيعات)</span>
            <span className="text-xl font-bold text-amber-700">{recountRequiredSessions}</span>
          </div>
          <div className="bg-white p-4 rounded-lg border shadow-sm text-center">
            <span className="text-[10px] text-zinc-400 font-bold block">إجمالي فارق التعديل المتراكم</span>
            <span className="text-xs font-bold text-zinc-800 block mt-1">{totalVarianceMl} مل سائل</span>
            <span className="text-xs font-bold text-zinc-800 block">{totalVarianceUnits} علبة مغلقة</span>
          </div>
        </div>

        <div className="bg-white rounded-lg border border-[var(--color-ivory-200)] shadow-sm overflow-hidden">
          <table className="w-full text-right border-collapse text-xs">
            <thead>
              <tr className="bg-zinc-50 text-zinc-500 font-bold border-b">
                <th className="p-4">المرجع</th>
                <th className="p-4">العنوان</th>
                <th className="p-4">الموظف المسؤول</th>
                <th className="p-4">حالة الجرد</th>
                <th className="p-4">عدد البنود الجردية</th>
                <th className="p-4">تاريخ التكليف</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-zinc-150">
              {countSessions.map(session => (
                <tr key={session.id} className="hover:bg-zinc-50/30">
                  <td className="p-4 font-mono font-bold text-zinc-900">{session.reference}</td>
                  <td className="p-4">{session.title}</td>
                  <td className="p-4">{session.assignedEmployee.name}</td>
                  <td className="p-4">
                    <span className={`px-2 py-0.5 rounded text-[10px] font-bold ${
                      session.status === 'APPROVED' ? 'bg-green-100 text-green-800' :
                      session.status === 'RECOUNT_REQUIRED' ? 'bg-amber-100 text-amber-800' : 'bg-blue-100 text-blue-800'
                    }`}>
                      {session.status}
                    </span>
                  </td>
                  <td className="p-4 font-bold">{session.lines.length}</td>
                  <td className="p-4 text-zinc-400">{new Date(session.createdAt).toLocaleDateString('ar-JO')}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </main>
    </div>
  );
}
