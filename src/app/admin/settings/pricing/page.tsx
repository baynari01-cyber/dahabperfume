import React from 'react';
import { requirePermission, getEmployeePermissions } from '@/lib/dal';
import { AdminSidebar } from '@/components/AdminSidebar';
import { getGlobalSizePrices, updateGlobalSizePrice } from '@/actions/settings';
import { redirect } from 'next/navigation';

export default async function AdminSettingsPricingPage() {
  const session = await requirePermission('manage:settings');
  const permissions = await getEmployeePermissions(session.employeeId);

  const globalPrices = await getGlobalSizePrices();

  async function handleUpdatePrices(formData: FormData) {
    'use server';

    const session = await requirePermission('manage:settings');

    const size50Fils = Math.round(parseFloat(formData.get('price_50ml') as string || '0') * 1000);
    const size100Fils = Math.round(parseFloat(formData.get('price_100ml') as string || '0') * 1000);
    const size200Fils = Math.round(parseFloat(formData.get('price_200ml') as string || '0') * 1000);

    // Save sizes
    await updateGlobalSizePrice('50ml', size50Fils, session.employeeId);
    await updateGlobalSizePrice('100ml', size100Fils, session.employeeId);
    await updateGlobalSizePrice('200ml', size200Fils, session.employeeId);

    redirect('/admin/settings/pricing?success=true');
  }

  return (
    <div className="flex flex-col md:flex-row min-h-screen bg-[var(--color-ivory-100)]" dir="rtl">
      <AdminSidebar employeeName={session.employee.name} permissions={permissions} />

      <main className="flex-1 p-4 md:p-8 font-sans w-full max-w-xl mx-auto">
        <div className="flex justify-between items-center mb-6 border-b border-[var(--color-ivory-200)] pb-4">
          <div>
            <h1 className="text-2xl md:text-3xl font-bold font-heading text-[var(--color-forest-900)]">
              إعدادات الأسعار الموحدة
            </h1>
            <p className="text-zinc-650 text-xs md:text-sm mt-1">تحديد السعر الموحد لعطور دهب بناءً على الحجم</p>
          </div>
        </div>

        <form action={handleUpdatePrices} className="bg-white p-6 rounded-lg border border-[var(--color-ivory-200)] shadow-sm space-y-6">
          <h2 className="text-lg font-bold text-[var(--color-forest-900)] border-b pb-2">تعديل الأسعار حسب حجم العبوة</h2>

          <div className="space-y-4 text-sm text-zinc-700">
            <div>
              <label className="block font-bold mb-1">سعر حجم 50 مل (بالدينار الأردني JOD)</label>
              <input
                type="number"
                step="0.001"
                name="price_50ml"
                required
                defaultValue={(globalPrices['50ml'] || 10000) / 1000}
                className="w-full border border-zinc-200 rounded px-3 py-2 text-sm outline-none focus:border-[var(--color-forest-800)]"
              />
              <p className="text-xs text-zinc-400 mt-1">المكافئ الحالي: {globalPrices['50ml'] || 10000} فلس</p>
            </div>

            <div>
              <label className="block font-bold mb-1">سعر حجم 100 مل (بالدينار الأردني JOD)</label>
              <input
                type="number"
                step="0.001"
                name="price_100ml"
                required
                defaultValue={(globalPrices['100ml'] || 15000) / 1000}
                className="w-full border border-zinc-200 rounded px-3 py-2 text-sm outline-none focus:border-[var(--color-forest-800)]"
              />
              <p className="text-xs text-zinc-400 mt-1">المكافئ الحالي: {globalPrices['100ml'] || 15000} فلس</p>
            </div>

            <div>
              <label className="block font-bold mb-1">سعر حجم 200 مل (بالدينار الأردني JOD)</label>
              <input
                type="number"
                step="0.001"
                name="price_200ml"
                required
                defaultValue={(globalPrices['200ml'] || 25000) / 1000}
                className="w-full border border-zinc-200 rounded px-3 py-2 text-sm outline-none focus:border-[var(--color-forest-800)]"
              />
              <p className="text-xs text-zinc-400 mt-1">المكافئ الحالي: {globalPrices['200ml'] || 25000} فلس</p>
            </div>
          </div>

          <div className="flex gap-3 justify-end pt-4 border-t border-zinc-100">
            <button
              type="submit"
              className="bg-[var(--color-forest-800)] text-white text-xs md:text-sm px-6 py-2 rounded font-bold hover:bg-[var(--color-forest-900)] transition-colors w-full md:w-auto"
            >
              حفظ وتحديث كافة المنتجات
            </button>
          </div>
        </form>

        <div className="bg-zinc-50 border border-zinc-100 p-4 rounded-lg mt-6 text-xs text-zinc-500 leading-relaxed">
          <span className="font-bold text-[var(--color-forest-900)] block mb-1">ملاحظة هامة:</span>
          عند تعديل السعر الموحد لأي حجم، سيقوم النظام تلقائياً ودفعة واحدة بتحديث أسعار جميع خيارات العطور (Variants) التي تحمل نفس الحجم المختار لتتطابق مع السعر الجديد في قاعدة البيانات وفي الكاشير والمتجر فوراً.
        </div>
      </main>
    </div>
  );
}
