import React from 'react';
import { requireAuth } from '@/lib/dal';
import { AdminSidebar } from '@/components/AdminSidebar';
import { getSEOSettings, updateSEOSettings } from '@/actions/settings-crud';

export default async function SEOSettingsPage() {
  const session = await requireAuth();
  const settings = await getSEOSettings();

  async function handleSave(formData: FormData) {
    'use server';
    const metaTitleAr = formData.get('metaTitleAr') as string || '';
    const metaTitleEn = formData.get('metaTitleEn') as string || '';
    const metaDescriptionAr = formData.get('metaDescriptionAr') as string || '';
    const metaDescriptionEn = formData.get('metaDescriptionEn') as string || '';

    await updateSEOSettings({ metaTitleAr, metaTitleEn, metaDescriptionAr, metaDescriptionEn }, session.employeeId);
  }

  return (
    <div className="flex min-h-screen bg-[var(--color-ivory-100)] text-zinc-800">
      <AdminSidebar employeeName={session.employee.name} />
      <main className="flex-1 p-6 md:p-12 font-sans w-full max-w-4xl mx-auto">
        <h1 className="text-2xl font-bold font-heading text-[var(--color-forest-900)] mb-4">إعدادات محركات البحث (SEO)</h1>
        <form action={handleSave} className="bg-white p-6 rounded shadow-sm border border-[var(--color-ivory-200)] flex flex-col gap-6">
          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            <div className="flex flex-col gap-1">
              <label htmlFor="metaTitleAr" className="text-sm font-bold">العنوان التعريفي بالعربية (Meta Title)</label>
              <input type="text" name="metaTitleAr" id="metaTitleAr" defaultValue={settings.metaTitleAr} className="border border-zinc-200 rounded p-2 text-sm" />
            </div>
            <div className="flex flex-col gap-1">
              <label htmlFor="metaTitleEn" className="text-sm font-bold">العنوان التعريفي بالإنجليزية</label>
              <input type="text" name="metaTitleEn" id="metaTitleEn" defaultValue={settings.metaTitleEn} className="border border-zinc-200 rounded p-2 text-sm" />
            </div>
            <div className="flex flex-col gap-1 md:col-span-2">
              <label htmlFor="metaDescriptionAr" className="text-sm font-bold">الوصف التعريفي بالعربية (Meta Description)</label>
              <textarea name="metaDescriptionAr" id="metaDescriptionAr" defaultValue={settings.metaDescriptionAr} rows={3} className="border border-zinc-200 rounded p-2 text-sm resize-none" />
            </div>
            <div className="flex flex-col gap-1 md:col-span-2">
              <label htmlFor="metaDescriptionEn" className="text-sm font-bold">الوصف التعريفي بالإنجليزية</label>
              <textarea name="metaDescriptionEn" id="metaDescriptionEn" defaultValue={settings.metaDescriptionEn} rows={3} className="border border-zinc-200 rounded p-2 text-sm resize-none" />
            </div>
          </div>
          <button type="submit" className="bg-[var(--color-forest-800)] text-white font-bold p-3 rounded hover:bg-[var(--color-forest-900)] transition-colors mt-4">حفظ إعدادات SEO</button>
        </form>
      </main>
    </div>
  );
}
