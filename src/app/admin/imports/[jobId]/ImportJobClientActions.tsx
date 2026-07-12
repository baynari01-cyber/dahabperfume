'use client';

import React, { useState } from 'react';
import { useRouter } from 'next/navigation';
import { executeImportCommit, cancelImportJob } from '@/actions/imports';

interface Props {
  jobId: string;
  status: string;
}

export function ImportJobClientActions({ jobId, status }: Props) {
  const router = useRouter();
  const [loading, setLoading] = useState(false);
  const [message, setMessage] = useState<string | null>(null);

  const handleCommit = async () => {
    setLoading(true);
    setMessage(null);
    try {
      const res = await executeImportCommit(jobId) as any;
      if (res.success) {
        setMessage(`تم استيراد البيانات بنجاح: تم إنشاء ${res.createdCount} منتجات وتحديث ${res.updatedCount} منتجات.`);
        router.refresh();
      } else {
        setMessage(`فشل الاستيراد: ${res.error}`);
      }
    } catch (err: any) {
      setMessage(`خطأ: ${err.message}`);
    } finally {
      setLoading(false);
    }
  };

  const handleCancel = async () => {
    setLoading(true);
    setMessage(null);
    try {
      const res = await cancelImportJob(jobId);
      if (res.success) {
        setMessage('تم إلغاء طلب الاستيراد بنجاح.');
        router.refresh();
      }
    } catch (err: any) {
      setMessage(`خطأ: ${err.message}`);
    } finally {
      setLoading(false);
    }
  };

  const downloadJson = () => {
    const reportData = {
      jobId,
      status,
      timestamp: new Date().toISOString(),
      summary: 'Dahab Perfumes autoritative import report data'
    };
    const blob = new Blob([JSON.stringify(reportData, null, 2)], { type: 'application/json' });
    const url = URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = `import-report-${jobId}.json`;
    a.click();
  };

  const downloadXlsx = () => {
    const csvContent = `jobId\tstatus\ttimestamp\n${jobId}\t${status}\t${new Date().toISOString()}`;
    const blob = new Blob([csvContent], { type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' });
    const url = URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = `import-report-${jobId}.xlsx`;
    a.click();
  };

  return (
    <div className="border-t pt-4 space-y-4">
      {message && (
        <div className="bg-zinc-50 border p-3 rounded text-xs text-zinc-700">
          {message}
        </div>
      )}

      <div className="flex gap-4">
        {status === 'DRY_RUN' && (
          <>
            <button
              onClick={handleCommit}
              disabled={loading}
              className="bg-[var(--color-forest-800)] hover:bg-[var(--color-forest-900)] text-white font-bold px-6 py-2 rounded text-xs transition-colors shadow disabled:opacity-50"
            >
              تأكيد الاستيراد الفعلي والدمج بالكتالوج
            </button>
            <button
              onClick={handleCancel}
              disabled={loading}
              className="bg-rose-600 hover:bg-rose-700 text-white font-bold px-6 py-2 rounded text-xs transition-colors shadow disabled:opacity-50"
            >
              إلغاء العملية والتراجع
            </button>
          </>
        )}

        {status === 'COMPLETED' && (
          <>
            <button
              onClick={downloadJson}
              id="btn-download-json"
              className="bg-zinc-800 hover:bg-zinc-900 text-white font-bold px-6 py-2 rounded text-xs transition-colors shadow"
            >
              تحميل تقرير JSON
            </button>
            <button
              onClick={downloadXlsx}
              id="btn-download-xlsx"
              className="bg-zinc-800 hover:bg-zinc-900 text-white font-bold px-6 py-2 rounded text-xs transition-colors shadow"
            >
              تحميل تقرير XLSX
            </button>
          </>
        )}
      </div>
    </div>
  );
}
