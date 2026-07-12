import React from 'react';
import { requireAuth } from '@/lib/dal';
import { AdminSidebar } from '@/components/AdminSidebar';
import { getShippingZones, updateShippingZone } from '@/actions/settings-crud';

export default async function ShippingSettingsPage() {
  const session = await requireAuth();
  const zones = await getShippingZones();

  async function handleAddZone(formData: FormData) {
    'use server';
    const nameAr = formData.get('nameAr') as string;
    const nameEn = formData.get('nameEn') as string;
    const fee = Math.round(parseFloat(formData.get('fee') as string || '0') * 1000); // converting to Fils
    const estimatedDeliveryTime = formData.get('estimatedDeliveryTime') as string;

    await updateShippingZone({
      nameAr,
      nameEn,
      fee,
      estimatedDeliveryTime,
      isEnabled: true
    });
  }

  return (
    <div className="flex min-h-screen bg-[var(--color-ivory-100)] text-zinc-800">
      <AdminSidebar employeeName={session.employee.name} />
      <main className="flex-1 p-6 md:p-12 font-sans w-full max-w-4xl mx-auto">
        <h1 className="text-2xl font-bold font-heading text-[var(--color-forest-900)] mb-4">إعدادات الشحن ومناطق التوصيل</h1>
        
        {/* Existing Zones */}
        <div className="bg-white p-6 rounded shadow-sm border border-[var(--color-ivory-200)] mb-8">
          <h2 className="text-lg font-bold mb-4">مناطق الشحن الحالية</h2>
          <div className="flex flex-col gap-4">
            {zones.map((z) => (
              <div key={z.id} className="flex justify-between items-center border-b border-zinc-100 pb-3">
                <div>
                  <p className="font-bold">{z.nameAr} ({z.nameEn})</p>
                  <p className="text-xs text-zinc-550">توصيل خلال {z.estimatedDeliveryTime}</p>
                </div>
                <div className="text-left">
                  <p className="font-bold text-[var(--color-forest-800)]">{z.fee / 1000} JOD</p>
                </div>
              </div>
            ))}
            {zones.length === 0 && <p className="text-sm text-zinc-500">لا توجد مناطق شحن مضافة.</p>}
          </div>
        </div>

        {/* Add Zone Form */}
        <form action={handleAddZone} className="bg-white p-6 rounded shadow-sm border border-[var(--color-ivory-200)] flex flex-col gap-4">
          <h2 className="text-lg font-bold mb-2">إضافة منطقة شحن جديدة</h2>
          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            <div className="flex flex-col gap-1">
              <label htmlFor="nameAr" className="text-xs font-bold">الاسم بالعربية</label>
              <input type="text" name="nameAr" required className="border border-zinc-200 rounded p-2 text-sm" />
            </div>
            <div className="flex flex-col gap-1">
              <label htmlFor="nameEn" className="text-xs font-bold">الاسم بالإنجليزية</label>
              <input type="text" name="nameEn" required className="border border-zinc-200 rounded p-2 text-sm" />
            </div>
            <div className="flex flex-col gap-1">
              <label htmlFor="fee" className="text-xs font-bold">تكلفة الشحن بالدينار (JOD)</label>
              <input type="number" name="fee" step="0.001" required className="border border-zinc-200 rounded p-2 text-sm" />
            </div>
            <div className="flex flex-col gap-1">
              <label htmlFor="estimatedDeliveryTime" className="text-xs font-bold">وقت التوصيل المتوقع (مثال: 24-48 ساعة)</label>
              <input type="text" name="estimatedDeliveryTime" required className="border border-zinc-200 rounded p-2 text-sm" />
            </div>
          </div>
          <button type="submit" className="bg-[var(--color-forest-800)] text-white font-bold p-3 rounded hover:bg-[var(--color-forest-900)] transition-colors mt-4">إضافة المنطقة</button>
        </form>
      </main>
    </div>
  );
}
