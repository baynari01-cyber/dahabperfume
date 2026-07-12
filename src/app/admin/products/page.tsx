import { requireAuth } from '@/lib/dal';
import { prisma } from '@/lib/db';
import Link from 'next/link';

export default async function AdminProductsPage() {
  await requireAuth();

  const products = await prisma.product.findMany({
    orderBy: { createdAt: 'desc' },
    include: {
      category: true,
      variants: true,
    }
  });

  return (
    <div className="p-8">
      <div className="flex justify-between items-center mb-8">
        <div>
          <h1 className="text-2xl font-bold text-zinc-900 dark:text-white">إدارة المنتجات</h1>
          <p className="text-zinc-600 dark:text-zinc-400 mt-1">التحكم بالمنتجات، الأسعار، والمخزون</p>
        </div>
        <Link 
          href="/admin/products/new" 
          className="bg-emerald-600 hover:bg-emerald-700 text-white px-4 py-2 rounded-md font-medium transition-colors"
        >
          + إضافة منتج جديد
        </Link>
      </div>

      <div className="bg-white dark:bg-zinc-800 rounded-lg shadow-sm border border-zinc-200 dark:border-zinc-700 overflow-hidden">
        <div className="overflow-x-auto">
          <table className="w-full text-right">
            <thead className="bg-zinc-50 dark:bg-zinc-900 border-b border-zinc-200 dark:border-zinc-700">
              <tr>
                <th className="px-6 py-4 text-sm font-bold text-zinc-700 dark:text-zinc-300">المنتج</th>
                <th className="px-6 py-4 text-sm font-bold text-zinc-700 dark:text-zinc-300">SKU</th>
                <th className="px-6 py-4 text-sm font-bold text-zinc-700 dark:text-zinc-300">الفئة</th>
                <th className="px-6 py-4 text-sm font-bold text-zinc-700 dark:text-zinc-300">السعر (أقل حجم)</th>
                <th className="px-6 py-4 text-sm font-bold text-zinc-700 dark:text-zinc-300">الحالة</th>
                <th className="px-6 py-4 text-sm font-bold text-zinc-700 dark:text-zinc-300 text-center">إجراءات</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-zinc-200 dark:divide-zinc-700">
              {products.map((product) => {
                const lowestPrice = product.variants.length > 0 
                  ? Math.min(...product.variants.map(v => v.price))
                  : 0;

                return (
                  <tr key={product.id} className="hover:bg-zinc-50 dark:hover:bg-zinc-700/50 transition-colors">
                    <td className="px-6 py-4">
                      <div className="font-bold text-zinc-900 dark:text-white">{product.nameAr}</div>
                      <div className="text-xs text-zinc-500">{product.nameEn}</div>
                    </td>
                    <td className="px-6 py-4 text-sm font-mono text-zinc-600 dark:text-zinc-400">
                      {product.sku}
                    </td>
                    <td className="px-6 py-4 text-sm text-zinc-600 dark:text-zinc-400">
                      {product.category.name}
                    </td>
                    <td className="px-6 py-4 text-sm font-bold text-emerald-600">
                      {lowestPrice > 0 ? `${(lowestPrice / 100).toFixed(2)} د.أ` : '-'}
                    </td>
                    <td className="px-6 py-4">
                      <span className={`inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium ${product.isVisible ? 'bg-green-100 text-green-800 dark:bg-green-900/30 dark:text-green-400' : 'bg-zinc-100 text-zinc-800 dark:bg-zinc-800 dark:text-zinc-400'}`}>
                        {product.isVisible ? 'ظاهر' : 'مخفي'}
                      </span>
                    </td>
                    <td className="px-6 py-4 text-center">
                      <button className="text-blue-600 hover:text-blue-800 dark:text-blue-400 dark:hover:text-blue-300 text-sm font-medium mr-3">تعديل</button>
                      <button className="text-red-600 hover:text-red-800 dark:text-red-400 dark:hover:text-red-300 text-sm font-medium">حذف</button>
                    </td>
                  </tr>
                );
              })}
              
              {products.length === 0 && (
                <tr>
                  <td colSpan={6} className="px-6 py-12 text-center text-zinc-500">
                    لا توجد منتجات في قاعدة البيانات. قم بتشغيل مستورد البيانات.
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
