import React from 'react';
import { requireAuth } from '@/lib/dal';
import { AdminSidebar } from '@/components/AdminSidebar';
import * as fs from 'fs';
import * as path from 'path';

export default async function AdminImportsPage() {
  const session = await requireAuth();

  // Read the import report from the filesystem if it exists
  const reportPath = path.resolve(process.cwd(), 'reports/product-import-report.md');
  let reportContent = 'لا توجد سجلات استيراد متوفرة حالياً. يرجى تشغيل المستورد.';
  
  if (fs.existsSync(reportPath)) {
    reportContent = fs.readFileSync(reportPath, 'utf-8');
  }

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
        </div>

        <div className="bg-white p-8 rounded-lg border border-[var(--color-ivory-200)] shadow-sm">
          <h2 className="text-xl font-bold text-[var(--color-forest-900)] mb-4 border-b pb-2">تفاصيل عملية الاستيراد الأخيرة</h2>
          <pre className="whitespace-pre-wrap text-sm text-zinc-700 font-mono leading-relaxed bg-[var(--color-ivory-100)] p-6 rounded border">
            {reportContent}
          </pre>
        </div>
      </main>
    </div>
  );
}
