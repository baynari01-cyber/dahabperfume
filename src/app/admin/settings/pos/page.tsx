import React from 'react';
import { requireAuth } from '@/lib/dal';
import { AdminSidebar } from '@/components/AdminSidebar';
import { getPOSSettings } from '@/actions/settings-crud';
import { POSSettingsForm } from '@/components/POSSettingsForm';

export default async function POSSettingsPage() {
  const session = await requireAuth();
  const settings = await getPOSSettings();

  return (
    <div className="flex min-h-screen bg-[var(--color-ivory-100)] text-zinc-800" dir="rtl">
      <AdminSidebar employeeName={session.employee.name} />
      <main className="flex-1 p-6 md:p-12 font-sans w-full max-w-6xl mx-auto space-y-6">
        <div>
          <h1 className="text-2xl font-bold font-heading text-[var(--color-forest-900)]">إعدادات شاشة الكاشير والـ POS</h1>
          <p className="text-xs text-zinc-500 mt-1">تخصيص الخمول التلقائي، شاشات التنبيه، وأوقات عمل الجلسات.</p>
        </div>

        <POSSettingsForm initialSettings={settings} adminId={session.employeeId} />
      </main>
    </div>
  );
}
