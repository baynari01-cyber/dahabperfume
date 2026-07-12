import React from 'react';
import { requireAuth } from '@/lib/dal';
import { AdminSidebar } from '@/components/AdminSidebar';
import { getNotificationsSettings, updateNotificationsSettings } from '@/actions/settings-crud';

export default async function NotificationsSettingsPage() {
  const session = await requireAuth();
  const settings = await getNotificationsSettings();

  async function handleSave(formData: FormData) {
    'use server';
    const whatsappNotifications = formData.get('whatsappNotifications') === 'true';
    const whatsappNumber = formData.get('whatsappNumber') as string || '';
    const emailAlerts = formData.get('emailAlerts') === 'true';

    await updateNotificationsSettings({ whatsappNotifications, whatsappNumber, emailAlerts }, session.employeeId);
  }

  return (
    <div className="flex min-h-screen bg-[var(--color-ivory-100)] text-zinc-800">
      <AdminSidebar employeeName={session.employee.name} />
      <main className="flex-1 p-6 md:p-12 font-sans w-full max-w-4xl mx-auto">
        <h1 className="text-2xl font-bold font-heading text-[var(--color-forest-900)] mb-4">إعدادات الإشعارات والتنبيهات</h1>
        <form action={handleSave} className="bg-white p-6 rounded shadow-sm border border-[var(--color-ivory-200)] flex flex-col gap-6">
          <div className="flex items-center gap-3">
            <input type="checkbox" name="whatsappNotifications" id="whatsappNotifications" value="true" defaultChecked={settings.whatsappNotifications} className="w-5 h-5 accent-[var(--color-forest-800)]" />
            <label htmlFor="whatsappNotifications" className="font-bold">تفعيل إرسال فواتير المبيعات عبر الواتساب</label>
          </div>
          <div className="flex flex-col gap-1">
            <label htmlFor="whatsappNumber" className="text-sm font-bold">رقم الواتساب الرسمي لإرسال الرسائل (مع رمز الدولة)</label>
            <input type="text" name="whatsappNumber" id="whatsappNumber" defaultValue={settings.whatsappNumber} placeholder="+962790000000" className="border border-zinc-200 rounded p-2 text-sm" />
          </div>
          <div className="flex items-center gap-3">
            <input type="checkbox" name="emailAlerts" id="emailAlerts" value="true" defaultChecked={settings.emailAlerts} className="w-5 h-5 accent-[var(--color-forest-800)]" />
            <label htmlFor="emailAlerts" className="font-bold">تفعيل تنبيهات البريد الإلكتروني للمخزون المنخفض</label>
          </div>
          <button type="submit" className="bg-[var(--color-forest-800)] text-white font-bold p-3 rounded hover:bg-[var(--color-forest-900)] transition-colors mt-4">حفظ إعدادات الإشعارات</button>
        </form>
      </main>
    </div>
  );
}
