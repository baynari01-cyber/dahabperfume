import React from 'react';
import { requireAuth, requirePermission } from '@/lib/dal';
import { AdminSidebar } from '@/components/AdminSidebar';
import { getImportReport } from '@/actions/imports';
import { ImportJobClientActions } from './ImportJobClientActions';
import Link from 'next/link';

interface Params {
  jobId: string;
}

export default async function AdminImportJobDetailPage({ params }: { params: Promise<Params> }) {
  const { jobId } = await params;
  const session = await requireAuth();
  await requirePermission('imports.view');

  const job = await getImportReport(jobId);

  if (!job) {
    return (
      <div className="min-h-screen bg-[var(--color-ivory-100)] flex items-center justify-center p-6" dir="rtl">
        <div className="bg-white p-8 rounded-xl border shadow text-center space-y-4">
          <h1 className="text-xl font-bold text-red-650">طلب الاستيراد غير موجود</h1>
          <Link href="/admin/imports" className="inline-block bg-[var(--color-forest-800)] text-white px-4 py-2 rounded text-xs">
            العودة لسجلات الاستيراد
          </Link>
        </div>
      </div>
    );
  }

  return (
    <div className="flex h-screen bg-[var(--color-ivory-100)]" dir="rtl">
      <AdminSidebar employeeName={session.employee.name} />

      <main className="flex-1 overflow-y-auto p-8 font-sans">
        <div className="flex justify-between items-start mb-8 border-b border-[var(--color-ivory-200)] pb-4">
          <div>
            <h1 className="text-3xl font-bold font-heading text-[var(--color-forest-900)]">
              تفاصيل عملية الاستيراد المجدولة
            </h1>
            <p className="text-zinc-650 mt-1">الملف: {job.fileName} | الحالة الحالية: <span className="font-bold text-[var(--color-forest-800)]">{job.status}</span></p>
          </div>
          <Link href="/admin/imports" className="bg-neutral-100 hover:bg-neutral-200 text-zinc-700 px-4 py-2 rounded text-xs transition-colors">
            ← عودة
          </Link>
        </div>

        <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
          {/* Summary Cards */}
          <div className="lg:col-span-2 space-y-8">
            <div className="bg-white p-6 rounded-lg border border-[var(--color-ivory-200)] shadow-sm space-y-6">
              <h2 className="text-lg font-bold text-[var(--color-forest-900)] border-b pb-2">فحص المطابقة والتحقق (Dry Run)</h2>
              
              <div className="grid grid-cols-3 gap-4 text-center">
                <div className="bg-zinc-50 p-4 rounded border">
                  <h3 className="text-xs text-zinc-500 font-bold">إجمالي الأسطر</h3>
                  <p className="text-2xl font-bold text-zinc-800">{job.totalRows}</p>
                </div>
                <div className="bg-emerald-50 p-4 rounded border border-emerald-100">
                  <h3 className="text-xs text-emerald-800 font-bold">الأسطر السليمة</h3>
                  <p className="text-2xl font-bold text-emerald-600">{job.successRows}</p>
                </div>
                <div className="bg-rose-50 p-4 rounded border border-rose-100">
                  <h3 className="text-xs text-rose-800 font-bold">الأسطر الخاطئة</h3>
                  <p className="text-2xl font-bold text-rose-600">{job.failedRows}</p>
                </div>
              </div>

              {/* Client Operations Control */}
              <ImportJobClientActions jobId={job.id} status={job.status} />
            </div>

            {/* List Rows */}
            <div className="bg-white p-6 rounded-lg border border-[var(--color-ivory-200)] shadow-sm space-y-4">
              <h2 className="text-lg font-bold text-[var(--color-forest-900)] border-b pb-2">سجلات الأسطر ومخرجات التحقق</h2>
              
              <div className="overflow-x-auto text-xs">
                <table className="w-full text-right border-collapse">
                  <thead>
                    <tr className="bg-zinc-50 font-bold text-zinc-500 border-b border-zinc-100">
                      <th className="p-3">رقم السطر</th>
                      <th className="p-3">الرمز SKU</th>
                      <th className="p-3">الحالة المبدئية</th>
                      <th className="p-3">ملاحظات الفحص / الأخطاء</th>
                      <th className="p-3">حالة التنفيذ</th>
                    </tr>
                  </thead>
                  <tbody className="divide-y divide-zinc-100">
                    {job.rows.map(row => (
                      <tr key={row.id} className="hover:bg-zinc-50/50">
                        <td className="p-3 font-bold">{row.rowNumber}</td>
                        <td className="p-3">{row.sku || '-'}</td>
                        <td className="p-3">
                          <span className={`px-2 py-0.5 rounded text-[10px] font-bold ${
                            row.status === 'VALID' ? 'bg-emerald-100 text-emerald-800' :
                            row.status === 'SKIPPED' ? 'bg-zinc-100 text-zinc-800' :
                            'bg-rose-100 text-rose-800'
                          }`}>
                            {row.status}
                          </span>
                        </td>
                        <td className="p-3 text-rose-600 font-bold">{row.errorMessage || row.warnings || '-'}</td>
                        <td className="p-3 text-emerald-600 font-bold">{row.resultStatus || '-'}</td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
            </div>
          </div>

          {/* Sidebar recovery info */}
          <div className="space-y-6">
            <div className="bg-white p-6 rounded-lg border border-[var(--color-ivory-200)] shadow-sm space-y-4">
              <h3 className="text-md font-bold text-[var(--color-forest-900)] border-b pb-2">معلومات الاسترداد والنسخ</h3>
              <p className="text-xs text-zinc-650 leading-relaxed">
                في حال وجود أخطاء في الاستيراد، سيقوم النظام تلقائياً بتجميد العملية وإلغاء كافة المدخلات السابقة للخطأ للحفاظ على سلامة الكتالوج بدون تشويه.
              </p>
              <div className="bg-amber-50 border border-amber-200 text-amber-900 p-3 rounded text-[11px] space-y-1">
                <span className="font-bold block">ملاحظات الأمان:</span>
                <span>لا يتم تعديل أو حذف أي منتجات لا تظهر في جدول الاستيراد.</span>
              </div>
            </div>
          </div>
        </div>
      </main>
    </div>
  );
}
