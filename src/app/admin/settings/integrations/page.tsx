import React from 'react';
import { requireAuth } from '@/lib/dal';
import { AdminSidebar } from '@/components/AdminSidebar';
import { getIntegrationsSettings, updateIntegrationsSettings } from '@/actions/settings-crud';

export default async function IntegrationsSettingsPage() {
  const session = await requireAuth();
  const settings = await getIntegrationsSettings();

  async function handleSave(formData: FormData) {
    'use server';
    const supabaseStorageUrl = formData.get('supabaseStorageUrl') as string || '';
    const whatsappGatewayApiKey = formData.get('whatsappGatewayApiKey') as string || '';

    await updateIntegrationsSettings({ supabaseStorageUrl, whatsappGatewayApiKey }, session.employeeId);
  }

  return (
    <div className="flex min-h-screen bg-[var(--color-ivory-100)] text-zinc-800">
      <AdminSidebar employeeName={session.employee.name} />
      <main className="flex-1 p-6 md:p-12 font-sans w-full max-w-4xl mx-auto">
        <h1 className="text-2xl font-bold font-heading text-[var(--color-forest-900)] mb-4">إعدادات الربط والدمج (Integrations)</h1>
        <form action={handleSave} className="bg-white p-6 rounded shadow-sm border border-[var(--color-ivory-200)] flex flex-col gap-6">
          <div className="flex flex-col gap-1">
            <label htmlFor="supabaseStorageUrl" className="text-sm font-bold">رابط Supabase Storage الخاص بصور المنتجات</label>
            <input type="text" name="supabaseStorageUrl" id="supabaseStorageUrl" defaultValue={settings.supabaseStorageUrl} placeholder="https://xxxx.supabase.co/storage/v1/object/public/products" className="border border-zinc-200 rounded p-2 text-sm" />
          </div>
          <div className="flex flex-col gap-1">
            <label htmlFor="whatsappGatewayApiKey" className="text-sm font-bold">مفتاح الربط لبوابة الواتساب (WhatsApp API Key)</label>
            <input type="password" name="whatsappGatewayApiKey" id="whatsappGatewayApiKey" defaultValue={settings.whatsappGatewayApiKey} className="border border-zinc-200 rounded p-2 text-sm" />
          </div>
          <button type="submit" className="bg-[var(--color-forest-800)] text-white font-bold p-3 rounded hover:bg-[var(--color-forest-900)] transition-colors mt-4">حفظ إعدادات الربط</button>
        </form>
      </main>
    </div>
  );
}
