import React from 'react';
import { requireAuth } from '@/lib/dal';
import { prisma } from '@/lib/db';
import { AdminSidebar } from '@/components/AdminSidebar';
import { filsToDisplay } from '@/lib/money';
import Link from 'next/link';

export default async function AdminDashboardPage() {
  const session = await requireAuth();

  // Query actual metrics from DB
  const [totalOrders, totalProducts, totalSales, rawStocks, productVariants] = await Promise.all([
    prisma.order.count(),
    prisma.product.count(),
    prisma.sale.findMany({ select: { total: true } }),
    prisma.rawMaterialStock.findMany({ include: { material: true } }),
    prisma.productVariant.findMany({ include: { product: true } })
  ]);

  const totalSalesRevenue = totalSales.reduce((acc, s) => acc + s.total, 0);

  // Count low stock materials
  const lowStockMaterials = rawStocks.filter(
    (s) => s.minThreshold !== null && s.quantity <= s.minThreshold
  );

  // Count low stock finished products (variants with stock <= 5 and not formula-based)
  // For simplicity, we just count variants with stock <= 5
  const lowStockProducts = productVariants.filter((v) => v.stock <= 5);

  const recentOrders = await prisma.order.findMany({
    orderBy: { createdAt: 'desc' },
    take: 5
  });

  return (
    <div className="flex h-screen bg-[var(--color-ivory-100)]" dir="rtl">
      {/* Sidebar on the right */}
      <AdminSidebar employeeName={session.employee.name} />

      {/* Main Content Area on the left */}
      <main className="flex-1 overflow-y-auto p-8 font-sans">
        <div className="flex justify-between items-center mb-8 border-b border-[var(--color-ivory-200)] pb-4">
          <div>
            <h1 className="text-3xl font-bold font-heading text-[var(--color-forest-900)]">
              لوحة التحكم الرئيسية
            </h1>
            <p className="text-zinc-650 mt-1">
              مرحباً بك مجدداً، {session.employee.name}
            </p>
          </div>
        </div>

        {/* Metric Cards */}
        <div className="grid grid-cols-1 md:grid-cols-4 gap-6 mb-8">
          <div className="bg-white p-6 rounded-lg shadow-sm border border-[var(--color-ivory-200)]">
            <h3 className="text-sm font-bold text-zinc-500 mb-2">إجمالي الطلبات</h3>
            <p className="text-3xl font-bold text-[var(--color-forest-900)]">{totalOrders}</p>
          </div>

          <div className="bg-white p-6 rounded-lg shadow-sm border border-[var(--color-ivory-200)]">
            <h3 className="text-sm font-bold text-zinc-500 mb-2">إجمالي المنتجات</h3>
            <p className="text-3xl font-bold text-[var(--color-forest-900)]">{totalProducts}</p>
          </div>

          <div className="bg-white p-6 rounded-lg shadow-sm border border-[var(--color-ivory-200)]">
            <h3 className="text-sm font-bold text-zinc-500 mb-2">إجمالي المبيعات (POS)</h3>
            <p className="text-3xl font-bold text-emerald-600">
              {filsToDisplay(totalSalesRevenue, 'ar')}
            </p>
          </div>

          <div className="bg-white p-6 rounded-lg shadow-sm border border-[var(--color-ivory-200)]">
            <h3 className="text-sm font-bold text-zinc-500 mb-2">تنبيهات نقص المخزون</h3>
            <p className="text-3xl font-bold text-amber-600">
              {lowStockMaterials.length + lowStockProducts.length}
            </p>
          </div>
        </div>

        <div className="grid grid-cols-1 lg:grid-cols-2 gap-8">
          {/* Recent Orders */}
          <div className="bg-white p-6 rounded-lg shadow-sm border border-[var(--color-ivory-200)]">
            <h2 className="text-xl font-bold text-[var(--color-forest-900)] mb-4">أحدث طلبات المتجر</h2>
            <div className="divide-y divide-zinc-100">
              {recentOrders.map((order) => (
                <div key={order.id} className="py-3 flex justify-between items-center">
                  <div>
                    <span className="font-bold text-zinc-900 font-mono text-sm">{order.reference}</span>
                    <p className="text-xs text-zinc-500">{order.customerName}</p>
                  </div>
                  <div className="text-left">
                    <span className="text-sm font-bold text-[var(--color-champagne-600)]">
                      {filsToDisplay(order.totalAmount, 'ar')}
                    </span>
                    <span className={`block text-[10px] px-2 py-0.5 rounded font-bold mt-1 ${order.status === 'CONFIRMED' ? 'bg-green-150 text-green-800' : 'bg-amber-100 text-amber-800'}`}>
                      {order.status}
                    </span>
                  </div>
                </div>
              ))}

              {recentOrders.length === 0 && (
                <p className="text-zinc-500 py-6 text-center">لا توجد طلبات معلقة حالياً.</p>
              )}
            </div>
          </div>

          {/* Quick Actions / Alerts */}
          <div className="bg-white p-6 rounded-lg shadow-sm border border-[var(--color-ivory-200)]">
            <h2 className="text-xl font-bold text-[var(--color-forest-900)] mb-4">المواد الخام الناقصة</h2>
            <div className="space-y-4">
              {lowStockMaterials.map((s) => (
                <div key={s.id} className="p-3 bg-amber-50 text-amber-800 border border-amber-100 rounded flex justify-between items-center text-sm">
                  <span className="font-bold">{s.material.name}</span>
                  <span>المخزون الحالي: {s.quantity} {s.material.unit} (الحد الأدنى: {s.minThreshold})</span>
                </div>
              ))}

              {lowStockMaterials.length === 0 && (
                <p className="text-zinc-500 py-6 text-center">جميع مستويات المواد الخام ضمن الحدود الآمنة.</p>
              )}
            </div>
          </div>
        </div>
      </main>
    </div>
  );
}
