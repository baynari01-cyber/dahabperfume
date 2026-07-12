import React from 'react';
import { requireAuth } from '@/lib/dal';
import { AdminSidebar } from '@/components/AdminSidebar';
import { triggerBackupDownload } from '@/actions/settings-crud';

export default async function BackupsSettingsPage() {
  const session = await requireAuth();

  async function handleBackup() {
    'use server';
    await triggerBackupDownload();
  }

  return (
    <div className="flex min-h-screen bg-[var(--color-ivory-100)] text-zinc-800">
      <AdminSidebar employeeName={session.employee.name} />
      <main className="flex-1 p-6 md:p-12 font-sans w-full max-w-4xl mx-auto">
        <h1 className="text-2xl font-bold font-heading text-[var(--color-forest-900)] mb-4">إدارة النسخ الاحتياطي (Backups)</h1>
        <div className="bg-white p-6 rounded shadow-sm border border-[var(--color-ivory-200)] flex flex-col gap-6">
          <p className="text-sm text-zinc-600">
            يمكنك تحميل نسخة احتياطية كاملة من بيانات النظام (المنتجات، الأقسام، وتركيبات العطور) في أي وقت لحمايتها من الضياع أو استخدامها للاسترجاع لاحقاً.
          </p>
          <form action={handleBackup}>
            <button type="submit" className="bg-[var(--color-forest-800)] text-white font-bold p-3 rounded hover:bg-[var(--color-forest-900)] transition-colors">
              تصدير وتحميل النسخة الاحتياطية الحالية (.json)
            </button>
          </form>
        </div>
      </main>
    </div>
  );
}
