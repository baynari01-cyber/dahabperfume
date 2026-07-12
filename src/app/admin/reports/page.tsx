import React from 'react';
import { requireAuth } from '@/lib/dal';
import { prisma } from '@/lib/db';
import { AdminSidebar } from '@/components/AdminSidebar';

export default async function AdminReportsPage() {
  const session = await requireAuth();

  const sales = await prisma.sale.findMany({
    include: { items: true }
  });

  const totalRevenue = sales.reduce((acc, s) => acc + s.total, 0);
  const totalSalesCount = sales.length;
  const averageTicketValue = totalSalesCount > 0 ? totalRevenue / totalSalesCount : 0;

  // Most popular variants
  const variantCounts: Record<string, { sku: string; name: string; size: string; qty: number; total: number }> = {};
  for (const sale of sales) {
    for (const it of sale.items) {
      if (!variantCounts[it.sku]) {
        variantCounts[it.sku] = { sku: it.sku, name: it.name, size: it.size, qty: 0, total: 0 };
      }
      variantCounts[it.sku].qty += it.quantity;
      variantCounts[it.sku].total += it.total;
    }
  }

  const popularVariants = Object.values(variantCounts)
    .sort((a, b) => b.qty - a.qty)
    .slice(0, 5);

  return (
    <div className="flex h-screen bg-[var(--color-ivory-100)]" dir="rtl">
      <AdminSidebar employeeName={session.employee.name} />

      <main className="flex-1 overflow-y-auto p-8 font-sans">
        <div className="flex justify-between items-center mb-8 border-b border-[var(--color-ivory-200)] pb-4">
          <div>
            <h1 className="text-3xl font-bold font-heading text-[var(--color-forest-900)]">
              التقارير والإحصائيات المالية
            </h1>
            <p className="text-zinc-650 mt-1">مراقبة أداء المبيعات، العطور الأكثر شعبية، ومعدلات الفواتير اليومية</p>
          </div>
        </div>

        {/* Dashboard widget values */}
        <div className="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
          <div className="bg-white p-6 rounded-lg shadow-sm border border-[var(--color-ivory-200)] text-center">
            <h3 className="text-sm font-bold text-zinc-500 mb-1">صافي الإيرادات الكلية</h3>
            <p className="text-3xl font-bold text-emerald-600">{(totalRevenue / 100).toFixed(2)} د.أ</p>
          </div>
          <div className="bg-white p-6 rounded-lg shadow-sm border border-[var(--color-ivory-200)] text-center">
            <h3 className="text-sm font-bold text-zinc-500 mb-1">عدد الفواتير الصادرة</h3>
            <p className="text-3xl font-bold text-[var(--color-forest-900)]">{totalSalesCount}</p>
          </div>
          <div className="bg-white p-6 rounded-lg shadow-sm border border-[var(--color-ivory-200)] text-center">
            <h3 className="text-sm font-bold text-zinc-500 mb-1">متوسط قيمة الفاتورة</h3>
            <p className="text-3xl font-bold text-[var(--color-forest-900)]">{(averageTicketValue / 100).toFixed(2)} د.أ</p>
          </div>
        </div>

        <div className="grid grid-cols-1 lg:grid-cols-2 gap-8">
          {/* Most popular products */}
          <div className="bg-white p-6 rounded-lg shadow-sm border border-[var(--color-ivory-200)]">
            <h2 className="text-xl font-bold text-[var(--color-forest-900)] mb-4 border-b pb-2">العطور الأكثر طلباً</h2>
            <div className="divide-y divide-zinc-100">
              {popularVariants.map((item, idx) => (
                <div key={item.sku} className="py-3 flex justify-between items-center text-sm">
                  <div>
                    <span className="font-bold text-zinc-900">{idx + 1}. {item.name}</span>
                    <span className="text-xs text-zinc-500 ml-2">({item.size})</span>
                  </div>
                  <div className="text-left">
                    <span className="font-bold text-[var(--color-forest-800)]">{item.qty} قطعة</span>
                    <span className="block text-xs text-zinc-400">{(item.total / 100).toFixed(2)} د.أ</span>
                  </div>
                </div>
              ))}

              {popularVariants.length === 0 && (
                <p className="text-zinc-500 py-6 text-center">لا توجد إحصائيات بيع متوفرة بعد.</p>
              )}
            </div>
          </div>
        </div>
      </main>
    </div>
  );
}
