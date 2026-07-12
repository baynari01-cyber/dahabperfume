import React from 'react';
import { requireAuth } from '@/lib/dal';
import { AdminSidebar } from '@/components/AdminSidebar';
import { prisma } from '@/lib/db';
import { redirect } from 'next/navigation';

export default async function InventorySettingsPage() {
  const session = await requireAuth();

  // Load current settings
  const blindCountSetting = await prisma.siteSettings.findUnique({
    where: { key: 'blind_count_enabled' }
  });
  const blindCountEnabled = blindCountSetting?.value === 'true';

  async function handleSave(formData: FormData) {
    'use server';
    const blindCountEnabledValue = formData.get('blindCountEnabled') === 'true' ? 'true' : 'false';

    await prisma.siteSettings.upsert({
      where: { key: 'blind_count_enabled' },
      update: { value: blindCountEnabledValue },
      create: { key: 'blind_count_enabled', value: blindCountEnabledValue }
    });

    redirect('/admin/settings');
  }

  return (
    <div className="flex min-h-screen bg-[var(--color-ivory-100)] text-zinc-800" dir="rtl">
      <AdminSidebar employeeName={session.employee.name} />
      <main className="flex-grow p-6 md:p-12 w-full max-w-4xl mx-auto">
        <h1 className="text-2xl font-bold font-heading text-[var(--color-forest-900)] mb-4">إعدادات جرد المخزون</h1>
        <form action={handleSave} className="bg-white p-6 rounded shadow-sm border border-[var(--color-ivory-200)] flex flex-col gap-6">
          <div className="flex items-center gap-3">
            <input 
              type="checkbox" 
              name="blindCountEnabled" 
              id="blindCountEnabled" 
              value="true" 
              defaultChecked={blindCountEnabled} 
              className="w-5 h-5 accent-[var(--color-forest-800)]" 
            />
            <label htmlFor="blindCountEnabled" className="font-bold cursor-pointer">
              تفعيل الجرد الأعمى (إخفاء الكميات المتوقعة عن الكاشير)
            </label>
          </div>
          
          <button 
            type="submit" 
            className="bg-[var(--color-forest-800)] text-white font-bold p-3 rounded hover:bg-[var(--color-forest-900)] transition-colors mt-4"
          >
            حفظ إعدادات الجرد
          </button>
        </form>
      </main>
    </div>
  );
}
