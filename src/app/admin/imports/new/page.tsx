'use client';

import React, { useState } from 'react';
import Link from 'next/link';
import { useRouter } from 'next/navigation';
import { createImportJob, executeImportDryRun } from '@/actions/imports';

export default function AdminNewImportPage() {
  const router = useRouter();
  const [fileName, setFileName] = useState('products.csv');
  const [fileType, setFileType] = useState('CSV');
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);

  // Mock records to upload (mimics the 331 valid + some blanks/invalid for UI testing)
  const mockUploadData = [
    { sku: 'DHB-NEW-0001', nameAr: 'عطر الفخامة الجديد' },
    { sku: 'DHB-NEW-0002', nameAr: 'عطر النخبة الفاخر' },
    { sku: 'DHB-INVALID-0003', nameAr: '' }, // Invalid row (missing Name)
    { sku: '', nameAr: 'عطر بدون رمز' }, // Invalid row (missing SKU)
    { sku: 'DHB-NEW-0005', nameAr: 'عطر التميز الراقي' }
  ];

  const handleStartImport = async (e: React.FormEvent) => {
    e.preventDefault();
    setLoading(true);
    setError(null);

    try {
      // 1. Create Import Job
      const jobRes = await createImportJob({
        fileName,
        fileType,
        totalRows: mockUploadData.length
      });

      if (!jobRes.success || !jobRes.jobId) {
        throw new Error('فشل إنشاء جلسة الاستيراد');
      }

      const jobId = jobRes.jobId;

      // 2. Execute Dry Run
      const dryRunRes = await executeImportDryRun(jobId, mockUploadData);
      if (!dryRunRes.success) {
        throw new Error('فشل تشغيل فحص المطابقة المبدئي');
      }

      // Redirect to the detail preview page
      router.push(`/admin/imports/${jobId}`);
    } catch (err: any) {
      setError(err.message || 'حدث خطأ غير متوقع');
      setLoading(false);
    }
  };

  return (
    <div className="min-h-screen bg-[var(--color-ivory-100)] py-12 px-6 flex items-center justify-center" dir="rtl">
      <div className="max-w-md w-full bg-white rounded-xl border border-[var(--color-ivory-200)] shadow-lg p-8 space-y-6">
        <div>
          <h1 className="text-2xl font-bold font-heading text-[var(--color-forest-900)] text-center">استيراد كتالوج جديد</h1>
          <p className="text-xs text-zinc-500 text-center mt-1">قم بتحميل ملفات CSV أو XLSX لتحديث بيانات المنتجات والأسعار.</p>
        </div>

        {error && (
          <div className="bg-rose-50 border border-rose-200 text-rose-800 p-3 rounded text-xs">
            {error}
          </div>
        )}

        <form onSubmit={handleStartImport} className="space-y-4">
          <div className="space-y-1">
            <label className="text-xs font-bold text-zinc-650">اسم الملف المصدر</label>
            <input
              type="text"
              value={fileName}
              onChange={(e) => setFileName(e.target.value)}
              required
              className="w-full border border-zinc-300 rounded p-2 text-xs outline-none focus:ring-1 focus:ring-[var(--color-champagne-600)] bg-white"
            />
          </div>

          <div className="space-y-1">
            <label className="text-xs font-bold text-zinc-650">نوع الملف</label>
            <select
              value={fileType}
              onChange={(e) => setFileType(e.target.value)}
              className="w-full border border-zinc-300 rounded p-2 text-xs outline-none focus:ring-1 focus:ring-[var(--color-champagne-600)] bg-white"
            >
              <option value="CSV">CSV Spreadsheet</option>
              <option value="XLSX">Excel Spreadsheet (XLSX)</option>
            </select>
          </div>

          <div className="pt-4 flex gap-4">
            <button
              type="submit"
              disabled={loading}
              className="flex-1 bg-[var(--color-forest-800)] hover:bg-[var(--color-forest-900)] text-white font-bold py-2.5 rounded text-xs transition-colors shadow disabled:opacity-50"
            >
              {loading ? 'جاري التحضير...' : 'بدء فحص المطابقة (Dry Run)'}
            </button>
            <Link
              href="/admin/imports"
              className="bg-neutral-100 hover:bg-neutral-200 text-zinc-700 font-bold px-6 py-2.5 rounded text-xs transition-colors text-center"
            >
              إلغاء
            </Link>
          </div>
        </form>
      </div>
    </div>
  );
}
