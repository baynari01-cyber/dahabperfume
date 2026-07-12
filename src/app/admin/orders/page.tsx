import { requirePermission } from '@/lib/dal';
import { prisma } from '@/lib/db';
import Link from 'next/link';

export default async function AdminOrdersPage() {
  await requirePermission('manage:orders');

  const orders = await prisma.order.findMany({
    orderBy: { createdAt: 'desc' },
    include: {
      items: true
    }
  });

  return (
    <div className="p-8">
      <div className="flex justify-between items-center mb-8">
        <div>
          <h1 className="text-2xl font-bold text-zinc-900 dark:text-white">إدارة الطلبات</h1>
          <p className="text-zinc-600 dark:text-zinc-400 mt-1">متابعة طلبات المتجر وتحديث حالتها</p>
        </div>
      </div>

      <div className="bg-white dark:bg-zinc-800 rounded-lg shadow-sm border border-zinc-200 dark:border-zinc-700 overflow-hidden">
        <div className="overflow-x-auto">
          <table className="w-full text-right">
            <thead className="bg-zinc-50 dark:bg-zinc-900 border-b border-zinc-200 dark:border-zinc-700">
              <tr>
                <th className="px-6 py-4 text-sm font-bold text-zinc-700 dark:text-zinc-300">المرجع</th>
                <th className="px-6 py-4 text-sm font-bold text-zinc-700 dark:text-zinc-300">العميل</th>
                <th className="px-6 py-4 text-sm font-bold text-zinc-700 dark:text-zinc-300">التاريخ</th>
                <th className="px-6 py-4 text-sm font-bold text-zinc-700 dark:text-zinc-300">الإجمالي</th>
                <th className="px-6 py-4 text-sm font-bold text-zinc-700 dark:text-zinc-300">الحالة</th>
                <th className="px-6 py-4 text-sm font-bold text-zinc-700 dark:text-zinc-300 text-center">إجراءات</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-zinc-200 dark:divide-zinc-700">
              {orders.map((order) => (
                <tr key={order.id} className="hover:bg-zinc-50 dark:hover:bg-zinc-700/50 transition-colors">
                  <td className="px-6 py-4 font-mono text-sm text-zinc-900 dark:text-white">
                    {order.reference}
                  </td>
                  <td className="px-6 py-4">
                    <div className="font-bold text-sm text-zinc-900 dark:text-white">{order.customerName}</div>
                    <div className="text-xs text-zinc-500">{order.customerPhone}</div>
                  </td>
                  <td className="px-6 py-4 text-sm text-zinc-600 dark:text-zinc-400">
                    {order.createdAt.toLocaleDateString('ar-JO')}
                  </td>
                  <td className="px-6 py-4 text-sm font-bold text-emerald-600">
                    {(order.totalAmount / 100).toFixed(2)} د.أ
                  </td>
                  <td className="px-6 py-4">
                    <span className="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-amber-100 text-amber-800 dark:bg-amber-900/30 dark:text-amber-400">
                      {order.status}
                    </span>
                  </td>
                  <td className="px-6 py-4 text-center">
                    <button className="text-blue-600 hover:text-blue-800 dark:text-blue-400 dark:hover:text-blue-300 text-sm font-medium mr-3">التفاصيل</button>
                  </td>
                </tr>
              ))}
              
              {orders.length === 0 && (
                <tr>
                  <td colSpan={6} className="px-6 py-12 text-center text-zinc-500">
                    لا توجد طلبات حالياً.
                  </td>
                </tr>
              )}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );
}
