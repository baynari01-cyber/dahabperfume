import React from 'react';
import { requireAuth } from '@/lib/dal';
import { prisma } from '@/lib/db';
import { AdminSidebar } from '@/components/AdminSidebar';
import Link from 'next/link';
import { filsToDisplay } from '@/lib/money';

export default async function AdminOrdersPage() {
  const session = await requireAuth();

  const orders = await prisma.order.findMany({
    orderBy: { createdAt: 'desc' },
    include: {
      items: true
    }
  });

  return (
    <div className="flex h-screen bg-[var(--color-ivory-100)]" dir="rtl">
      <AdminSidebar employeeName={session.employee.name} />

      <main className="flex-1 overflow-y-auto p-8 font-sans">
        <div className="flex justify-between items-center mb-8 border-b border-[var(--color-ivory-200)] pb-4">
          <div>
            <h1 className="text-3xl font-bold font-heading text-[var(--color-forest-900)]">
              طلبات المتجر الإلكتروني
            </h1>
            <p className="text-zinc-650 mt-1">إدارة الطلبات الواردة، التحقق من توفر المنتجات، وتأكيد عمليات الشحن</p>
          </div>
        </div>

        <div className="bg-white rounded-lg shadow-sm border border-[var(--color-ivory-200)] overflow-hidden">
          <table className="w-full text-right border-collapse">
            <thead className="bg-zinc-50 border-b border-zinc-200">
              <tr className="text-sm font-bold text-zinc-700">
                <th className="px-6 py-4">رقم الطلب</th>
                <th className="px-6 py-4">العميل</th>
                <th className="px-6 py-4">الهاتف</th>
                <th className="px-6 py-4">الإجمالي</th>
                <th className="px-6 py-4">حالة الطلب</th>
                <th className="px-6 py-4">تاريخ الطلب</th>
                <th className="px-6 py-4 text-center">إجراءات</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-zinc-100">
              {orders.map((order) => (
                <tr key={order.id} className="hover:bg-zinc-50/50 transition-colors text-zinc-650">
                  <td className="px-6 py-4 font-bold font-mono text-zinc-900">{order.reference}</td>
                  <td className="px-6 py-4">{order.customerName}</td>
                  <td className="px-6 py-4 font-mono text-sm">{order.customerPhone}</td>
                  <td className="px-6 py-4 font-bold text-[var(--color-forest-800)]">
                    {filsToDisplay(order.totalAmount, 'ar')}
                  </td>
                  <td className="px-6 py-4">
                    <span className={`inline-flex px-2 py-0.5 rounded text-xs font-bold ${order.status === 'CONFIRMED' ? 'bg-green-100 text-green-800' : order.status === 'AWAITING_WHATSAPP' ? 'bg-amber-100 text-amber-800' : 'bg-zinc-150 text-zinc-600'}`}>
                      {order.status}
                    </span>
                  </td>
                  <td className="px-6 py-4 text-sm">
                    {new Date(order.createdAt).toLocaleDateString('ar-JO')}
                  </td>
                  <td className="px-6 py-4 text-center">
                    <Link 
                      href={`/admin/orders/${order.id}`}
                      className="text-[var(--color-champagne-600)] hover:underline font-bold text-sm"
                    >
                      تفاصيل وتأكيد
                    </Link>
                  </td>
                </tr>
              ))}

              {orders.length === 0 && (
                <tr>
                  <td colSpan={7} className="px-6 py-12 text-center text-zinc-500">
                    لا توجد طلبات مسجلة حالياً.
                  </td>
                </tr>
              )}
            </tbody>
          </table>
        </div>
      </main>
    </div>
  );
}
