import React from 'react';
import { requireAuth } from '@/lib/dal';
import { AdminSidebar } from '@/components/AdminSidebar';
import { getLocalizationSettings, updateLocalizationSettings } from '@/actions/settings-crud';

export default async function LocalizationSettingsPage() {
  const session = await requireAuth();
  const settings = await getLocalizationSettings();

  async function handleSave(formData: FormData) {
    'use server';
    const defaultLocale = formData.get('defaultLocale') as string || 'ar';
    const locales = (formData.get('supportedLocales') as string || 'ar').split(',').map((l) => l.trim());

    await updateLocalizationSettings({ defaultLocale, supportedLocales: locales }, session.employeeId);
  }

  return (
    <div className="flex min-h-screen bg-[var(--color-ivory-100)] text-zinc-800">
      <AdminSidebar employeeName={session.employee.name} />
      <main className="flex-1 p-6 md:p-12 font-sans w-full max-w-4xl mx-auto">
        <h1 className="text-2xl font-bold font-heading text-[var(--color-forest-900)] mb-4">إعدادات اللغة والترجمة (Localization)</h1>
        <form action={handleSave} className="bg-white p-6 rounded shadow-sm border border-[var(--color-ivory-200)] flex flex-col gap-6">
          <div className="flex flex-col gap-1">
            <label htmlFor="defaultLocale" className="text-sm font-bold">اللغة الافتراضية للمتجر</label>
            <select name="defaultLocale" id="defaultLocale" defaultValue={settings.defaultLocale} className="border border-zinc-200 rounded p-2 text-sm">
              <option value="ar">العربية (ar)</option>
              <option value="en">الإنجليزية (en)</option>
            </select>
          </div>
          <div className="flex flex-col gap-1">
            <label htmlFor="supportedLocales" className="text-sm font-bold">اللغات المدعومة (مفصولة بفاصلة)</label>
            <input type="text" name="supportedLocales" id="supportedLocales" defaultValue={settings.supportedLocales.join(', ')} className="border border-zinc-200 rounded p-2 text-sm" />
          </div>
          <button type="submit" className="bg-[var(--color-forest-800)] text-white font-bold p-3 rounded hover:bg-[var(--color-forest-900)] transition-colors mt-4">حفظ الإعدادات الإقليمية</button>
        </form>
      </main>
    </div>
  );
}
