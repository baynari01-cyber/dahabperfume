import React from 'react';
import { requireAuth } from '@/lib/dal';
import { AdminSidebar } from '@/components/AdminSidebar';
import { getTaxSettings, updateTaxSettings } from '@/actions/settings-crud';

export default async function TaxSettingsPage() {
  const session = await requireAuth();
  const tax = await getTaxSettings();

  async function handleSave(formData: FormData) {
    'use server';
    const taxEnabled = formData.get('taxEnabled') === 'true';
    const taxRate = parseFloat(formData.get('taxRate') as string || '0');
    const pricesIncludeTax = formData.get('pricesIncludeTax') === 'true';

    await updateTaxSettings({ taxEnabled, taxRate, pricesIncludeTax }, session.employeeId);
  }

  return (
    <div className="flex min-h-screen bg-[var(--color-ivory-100)] text-zinc-800">
      <AdminSidebar employeeName={session.employee.name} />
      <main className="flex-1 p-6 md:p-12 font-sans w-full max-w-4xl mx-auto">
        <h1 className="text-2xl font-bold font-heading text-[var(--color-forest-900)] mb-4">إعدادات الضريبة</h1>
        <form action={handleSave} className="bg-white p-6 rounded shadow-sm border border-[var(--color-ivory-200)] flex flex-col gap-6">
          <div className="flex items-center gap-3">
            <input type="checkbox" name="taxEnabled" id="taxEnabled" value="true" defaultChecked={tax.taxEnabled} className="w-5 h-5 accent-[var(--color-forest-800)]" />
            <label htmlFor="taxEnabled" className="font-bold">تفعيل الضريبة العامة</label>
          </div>
          <div className="flex flex-col gap-1">
            <label htmlFor="taxRate" className="text-sm font-bold">نسبة الضريبة (%)</label>
            <input type="number" name="taxRate" step="0.01" id="taxRate" defaultValue={tax.taxRate} className="border border-zinc-200 rounded p-2 text-sm focus:outline-none focus:border-[var(--color-forest-800)]" />
          </div>
          <div className="flex items-center gap-3">
            <input type="checkbox" name="pricesIncludeTax" id="pricesIncludeTax" value="true" defaultChecked={tax.pricesIncludeTax} className="w-5 h-5 accent-[var(--color-forest-800)]" />
            <label htmlFor="pricesIncludeTax" className="font-bold">الأسعار تشمل الضريبة</label>
          </div>
          <button type="submit" className="bg-[var(--color-forest-800)] text-white font-bold p-3 rounded hover:bg-[var(--color-forest-900)] transition-colors mt-4">حفظ إعدادات الضريبة</button>
        </form>
      </main>
    </div>
  );
}
