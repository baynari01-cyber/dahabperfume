import React from 'react';
import { requireAuth } from '@/lib/dal';
import { prisma } from '@/lib/db';
import { AdminSidebar } from '@/components/AdminSidebar';

export default async function AdminSettingsPage() {
  const session = await requireAuth();

  const pricing = await prisma.globalPricingSettings.findUnique({
    where: { id: '1' }
  });

  return (
    <div className="flex h-screen bg-[var(--color-ivory-100)]" dir="rtl">
      <AdminSidebar employeeName={session.employee.name} />

      <main className="flex-1 overflow-y-auto p-8 font-sans">
        <div className="flex justify-between items-center mb-8 border-b border-[var(--color-ivory-200)] pb-4">
          <div>
            <h1 className="text-3xl font-bold font-heading text-[var(--color-forest-900)]">
              الإعدادات العامة للنظام
            </h1>
            <p className="text-zinc-650 mt-1">التحكم بنسب الضرائب، العملة الافتراضية، ورموز الحسابات</p>
          </div>
        </div>

        <div className="max-w-xl bg-white p-8 rounded-lg border border-[var(--color-ivory-200)] shadow-sm space-y-6">
          <h2 className="text-xl font-bold text-[var(--color-forest-900)] border-b pb-2">تفاصيل التسعير والعملة</h2>
          
          <div className="space-y-4 text-sm text-zinc-700">
            <div>
              <label className="block font-bold mb-1">نسبة ضريبة المبيعات المطبقة</label>
              <input 
                type="text" 
                disabled 
                value={`${pricing?.taxRate}%`}
                className="w-full bg-zinc-50 border border-zinc-200 rounded px-3 py-2 text-zinc-500 outline-none cursor-not-allowed"
              />
            </div>
            <div>
              <label className="block font-bold mb-1">رمز العملة الرسمي</label>
              <input 
                type="text" 
                disabled 
                value={pricing?.currencySymbol}
                className="w-full bg-zinc-50 border border-zinc-200 rounded px-3 py-2 text-zinc-500 outline-none cursor-not-allowed"
              />
            </div>
            <div>
              <label className="block font-bold mb-1">كود العملة الدولي</label>
              <input 
                type="text" 
                disabled 
                value={pricing?.currencyCode}
                className="w-full bg-zinc-50 border border-zinc-200 rounded px-3 py-2 text-zinc-500 outline-none cursor-not-allowed"
              />
            </div>
          </div>
        </div>
      </main>
    </div>
  );
}
