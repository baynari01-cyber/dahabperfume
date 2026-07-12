import React from 'react';
import { requireAuth } from '@/lib/dal';
import { prisma } from '@/lib/db';
import { AdminSidebar } from '@/components/AdminSidebar';

export default async function AdminAuditLogsPage() {
  const session = await requireAuth();

  const logs = await prisma.auditLog.findMany({
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
              سجل العمليات والرقابة (Audit Logs)
            </h1>
            <p className="text-zinc-650 mt-1">تتبع نشاط الموظفين، التغييرات على الفواتير، والتعديل على مستويات المخازن والأسعار</p>
          </div>
        </div>

        <div className="bg-white rounded-lg shadow-sm border border-[var(--color-ivory-200)] overflow-hidden">
          <table className="w-full text-right border-collapse">
            <thead className="bg-zinc-50 border-b border-zinc-200">
              <tr className="text-sm font-bold text-zinc-700">
                <th className="px-6 py-4">الموظف</th>
                <th className="px-6 py-4">العملية</th>
                <th className="px-6 py-4">العنصر</th>
                <th className="px-6 py-4">تفاصيل إضافية</th>
                <th className="px-6 py-4">عنوان IP</th>
                <th className="px-6 py-4">الوقت والتاريخ</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-zinc-100">
              {logs.map((log) => (
                <tr key={log.id} className="hover:bg-zinc-50/50 transition-colors text-zinc-650 text-sm">
                  <td className="px-6 py-4 font-bold text-zinc-900">{log.employee?.name || 'النظام التلقائي'}</td>
                  <td className="px-6 py-4">
                    <span className="bg-zinc-150 px-2 py-0.5 rounded text-xs font-bold text-zinc-700">
                      {log.action}
                    </span>
                  </td>
                  <td className="px-6 py-4 font-mono text-xs">{log.entityType} ({log.entityId})</td>
                  <td className="px-6 py-4 text-xs font-mono max-w-xs truncate">{log.details}</td>
                  <td className="px-6 py-4 font-mono text-xs">{log.ipAddress || '-'}</td>
                  <td className="px-6 py-4 text-xs">
                    {new Date(log.createdAt).toLocaleString('ar-JO')}
                  </td>
                </tr>
              ))}

              {logs.length === 0 && (
                <tr>
                  <td colSpan={6} className="px-6 py-12 text-center text-zinc-500">
                    لا توجد سجلات رقابية حالياً.
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
