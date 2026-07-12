import React from 'react';
import { requireAuth, requirePermission } from '@/lib/dal';
import { AdminSidebar } from '@/components/AdminSidebar';
import { getImportJobs } from '@/actions/imports';
import Link from 'next/link';

export default async function AdminImportsPage() {
  const session = await requireAuth();
  await requirePermission('imports.view');

  const jobs = await getImportJobs();

  return (
    <div className="flex h-screen bg-[var(--color-ivory-100)]" dir="rtl">
      <AdminSidebar employeeName={session.employee.name} />

      <main className="flex-1 overflow-y-auto p-8 font-sans">
        <div className="flex justify-between items-center mb-8 border-b border-[var(--color-ivory-200)] pb-4">
          <div>
            <h1 className="text-3xl font-bold font-heading text-[var(--color-forest-900)]">
              سجلات استيراد البيانات
            </h1>
            <p className="text-zinc-650 mt-1">عرض تقارير ونتائج أحدث عمليات استيراد المنتجات والكتالوج</p>
          </div>
          <Link
            href="/admin/imports/new"
            className="bg-[var(--color-forest-800)] hover:bg-[var(--color-forest-900)] text-white font-bold px-4 py-2 rounded text-xs transition-colors shadow-sm"
          >
            + استيراد كتالوج جديد
          </Link>
        </div>

        <div className="bg-white rounded-lg border border-[var(--color-ivory-200)] shadow-sm overflow-hidden">
          <div className="px-6 py-4 border-b border-[var(--color-ivory-100)] bg-zinc-50/50">
            <h2 className="text-sm font-bold text-[var(--color-forest-800)]">قائمة عمليات الاستيراد السابقة</h2>
          </div>

          <div className="overflow-x-auto">
            <table className="w-full text-right border-collapse text-xs">
              <thead>
                <tr className="bg-zinc-50 text-zinc-500 font-bold border-b border-zinc-100">
                  <th className="p-4">اسم الملف</th>
                  <th className="p-4">النوع</th>
                  <th className="p-4">الحالة</th>
                  <th className="p-4">عدد الأسطر</th>
                  <th className="p-4">ناجح</th>
                  <th className="p-4">فاشل</th>
                  <th className="p-4">تاريخ البدء</th>
                  <th className="p-4 text-left">الإجراءات</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-zinc-100">
                {jobs.map(job => (
                  <tr key={job.id} className="hover:bg-zinc-50/50">
                    <td className="p-4 font-bold">{job.fileName}</td>
                    <td className="p-4">{job.fileType}</td>
                    <td className="p-4">
                      <span className={`px-2 py-0.5 rounded text-[10px] font-bold ${
                        job.status === 'COMPLETED' ? 'bg-emerald-100 text-emerald-800' :
                        job.status === 'DRY_RUN' ? 'bg-amber-100 text-amber-800' :
                        job.status === 'CANCELLED' ? 'bg-neutral-100 text-neutral-800' :
                        'bg-rose-100 text-rose-800'
                      }`}>
                        {job.status}
                      </span>
                    </td>
                    <td className="p-4">{job.totalRows}</td>
                    <td className="p-4 text-emerald-600 font-bold">{job.successRows}</td>
                    <td className="p-4 text-rose-600 font-bold">{job.failedRows}</td>
                    <td className="p-4 text-zinc-500">{new Date(job.startedAt).toLocaleString('ar-JO')}</td>
                    <td className="p-4 text-left">
                      <Link
                        href={`/admin/imports/${job.id}`}
                        className="text-[var(--color-forest-800)] hover:underline font-bold"
                      >
                        عرض التفاصيل ←
                      </Link>
                    </td>
                  </tr>
                ))}

                {jobs.length === 0 && (
                  <tr>
                    <td colSpan={8} className="p-8 text-center text-zinc-500">لا توجد عمليات استيراد سابقة.</td>
                  </tr>
                )}
              </tbody>
            </table>
          </div>
        </div>
      </main>
    </div>
  );
}
