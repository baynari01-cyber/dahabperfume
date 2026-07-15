import React from 'react';
import { requireAuth } from '@/lib/dal';
import { prisma } from '@/lib/db';
import { AdminSidebar } from '@/components/AdminSidebar';
import { getInventorySettings } from '@/actions/settings-crud';
import { InventorySettingsForm } from '@/components/InventorySettingsForm';

export default async function AdminInventoryPage() {
  const session = await requireAuth();

  const movements = await prisma.inventoryMovement.findMany({
    orderBy: { createdAt: 'desc' },
    include: {
      employee: true
    }
  });

  const products = await prisma.product.findMany({
    orderBy: { nameAr: 'asc' },
    select: { id: true, nameAr: true, sku: true, stockLiters: true }
  });

  const settings = await getInventorySettings();
  const threshold = settings.lowStockThreshold;
  const shortages = products.filter(p => p.stockLiters <= threshold);

  return (
    <div className="flex flex-col md:flex-row h-screen bg-[var(--color-ivory-100)] overflow-hidden" dir="rtl">
      <AdminSidebar employeeName={session.employee.name} roleName={session?.employee?.role?.name || "ADMIN"} />

      <main className="flex-1 overflow-y-auto p-4 md:p-8 font-sans w-full max-w-full">
        <div className="flex justify-between items-center mb-8 border-b border-[var(--color-ivory-200)] pb-4">
          <div>
            <h1 className="text-3xl font-bold font-heading text-[var(--color-charcoal-900)]">
              سجل الحركات ومخزون الزيوت العطرية
            </h1>
            <p className="text-zinc-650 mt-1">تتبع كميات اللترات المتبقية لكل عطر وحركات التعديل والبيع</p>
          </div>
        </div>

        <InventorySettingsForm initialThreshold={threshold} employeeId={session.employee.id} />

        {/* Shortages Section */}
        {shortages.length > 0 && (
          <div className="mb-10 bg-red-50 rounded-lg shadow-sm border border-red-200 overflow-hidden">
            <div className="p-4 bg-red-100 border-b border-red-200 flex justify-between items-center">
              <h2 className="text-lg font-bold text-red-900">🚨 تنبيه النواقص (أقل من أو يساوي {threshold} لتر)</h2>
              <span className="bg-red-600 text-white px-3 py-1 rounded-full text-xs font-bold">{shortages.length} منتجات</span>
            </div>
            <div className="overflow-x-auto w-full max-w-[90vw] md:max-w-full pb-4">
              <table className="w-full text-right border-collapse min-w-[600px]">
                <thead className="bg-red-50/50 border-b border-red-200">
                  <tr className="text-sm font-bold text-red-800">
                    <th className="px-6 py-3 w-1/3">اسم العطر</th>
                    <th className="px-6 py-3 w-1/3">SKU الأساسي</th>
                    <th className="px-6 py-3 w-1/3">الكمية المتبقية (لتر)</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-red-100 text-sm">
                  {shortages.map(p => (
                    <tr key={p.id} className="hover:bg-red-100/50 transition-colors">
                      <td className="px-6 py-3 font-bold text-red-900">{p.nameAr}</td>
                      <td className="px-6 py-3 text-red-700 font-mono">{p.sku}</td>
                      <td className="px-6 py-3 font-bold text-red-700">{p.stockLiters} لتر</td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </div>
        )}

        {/* Essential Oils Summary Table */}
        <div className="mb-10 bg-white rounded-lg shadow-sm border border-[var(--color-ivory-200)] overflow-x-auto">
          <div className="p-4 bg-[var(--color-champagne-50)] border-b border-[var(--color-ivory-200)]">
            <h2 className="text-lg font-bold text-[var(--color-charcoal-900)]">مخزون الزيوت العطرية الحالي (باللتر)</h2>
          </div>
          <div className="overflow-x-auto w-full max-w-[90vw] md:max-w-full pb-4"><table className="w-full text-right border-collapse min-w-[600px]">
            <thead className="bg-zinc-50 border-b border-zinc-200">
              <tr className="text-sm font-bold text-zinc-700">
                <th className="px-6 py-3 w-1/3">اسم العطر</th>
                <th className="px-6 py-3 w-1/3">SKU الأساسي</th>
                <th className="px-6 py-3 w-1/3">الكمية المتبقية (لتر)</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-zinc-100 text-sm">
              {products.map(p => (
                <tr key={p.id} className="hover:bg-zinc-50/50 transition-colors">
                  <td className="px-6 py-3 font-bold text-zinc-900">{p.nameAr}</td>
                  <td className="px-6 py-3 text-zinc-500 font-mono">{p.sku}</td>
                  <td className="px-6 py-3">
                    <span className={`inline-block px-3 py-1 rounded font-bold ${p.stockLiters <= threshold ? 'bg-red-100 text-red-800' : 'bg-emerald-100 text-emerald-800'}`}>
                      {p.stockLiters} لتر
                    </span>
                  </td>
                </tr>
              ))}
              {products.length === 0 && (
                <tr>
                  <td colSpan={3} className="px-6 py-8 text-center text-zinc-500">لا توجد عطور مضافة بعد.</td>
                </tr>
              )}
            </tbody>
          </table></div>
        </div>
      </main>
    </div>
  );
}
