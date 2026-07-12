import { requireAuth } from '@/lib/dal';
import { prisma } from '@/lib/db';

export default async function POSCounterPage() {
  await requireAuth();

  const products = await prisma.product.findMany({
    where: { isVisible: true },
    include: {
      variants: true,
      category: true,
    }
  });

  return (
    <div className="flex w-full h-full">
      {/* Products Grid Area (Left Side / Right in RTL) */}
      <div className="flex-1 bg-zinc-100 dark:bg-zinc-900 p-4 overflow-y-auto flex flex-col">
        {/* Categories / Search Bar */}
        <div className="mb-4 flex gap-4">
          <input 
            type="text" 
            placeholder="بحث عن منتج، باركود، رمز..." 
            className="flex-1 bg-white dark:bg-zinc-800 border border-zinc-200 dark:border-zinc-700 rounded-md px-4 py-3 shadow-sm focus:outline-none focus:ring-2 focus:ring-[var(--color-champagne-600)]"
            autoFocus
          />
          <button className="bg-white dark:bg-zinc-800 px-6 py-3 border border-zinc-200 dark:border-zinc-700 rounded-md font-bold text-[var(--color-forest-900)] dark:text-white shadow-sm hover:bg-zinc-50 dark:hover:bg-zinc-700">
            فحص الباركود
          </button>
        </div>

        {/* Products Grid */}
        <div className="grid grid-cols-3 xl:grid-cols-4 2xl:grid-cols-5 gap-4">
          {products.map(product => {
            const lowestPrice = product.variants.length > 0 ? Math.min(...product.variants.map(v => v.price)) : 0;
            return (
              <button key={product.id} className="bg-white dark:bg-zinc-800 rounded-lg p-3 shadow-sm hover:shadow-md border border-zinc-200 dark:border-zinc-700 transition-all text-right flex flex-col h-32 hover:border-[var(--color-champagne-600)]">
                <div className="text-xs text-zinc-500 dark:text-zinc-400 mb-1 line-clamp-1">{product.category.name}</div>
                <div className="font-bold text-sm text-zinc-900 dark:text-white mb-auto line-clamp-2 leading-tight">
                  {product.nameAr}
                </div>
                <div className="flex justify-between items-end w-full mt-2">
                  <div className="text-[var(--color-champagne-600)] font-bold">
                    {lowestPrice > 0 ? `${(lowestPrice / 100).toFixed(2)}` : '-'}
                  </div>
                  <div className="bg-zinc-100 dark:bg-zinc-700 text-xs px-2 py-1 rounded text-zinc-600 dark:text-zinc-300">
                    {product.variants.length} أحجام
                  </div>
                </div>
              </button>
            )
          })}
        </div>
      </div>

      {/* Cart Area (Right Side / Left in RTL) */}
      <div className="w-96 bg-white dark:bg-zinc-800 border-r border-zinc-200 dark:border-zinc-700 flex flex-col shadow-[-4px_0_15px_-3px_rgba(0,0,0,0.05)] z-10 shrink-0">
        
        {/* Customer Select */}
        <div className="p-4 border-b border-zinc-200 dark:border-zinc-700">
          <button className="w-full bg-zinc-50 dark:bg-zinc-700/50 border border-zinc-200 dark:border-zinc-600 rounded-md py-2 px-3 text-right flex items-center justify-between text-sm font-medium hover:bg-zinc-100 dark:hover:bg-zinc-700 transition-colors">
            <span className="text-zinc-600 dark:text-zinc-300">عميل نقدي (افتراضي)</span>
            <span className="text-[var(--color-champagne-600)]">+ إضافة</span>
          </button>
        </div>

        {/* Cart Items */}
        <div className="flex-1 overflow-y-auto p-4 flex flex-col gap-3">
          {/* Empty Cart State */}
          <div className="flex-1 flex flex-col items-center justify-center text-zinc-400 dark:text-zinc-500">
            <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1" strokeLinecap="round" strokeLinejoin="round" className="mb-4 opacity-50"><circle cx="8" cy="21" r="1"/><circle cx="19" cy="21" r="1"/><path d="M2.05 2.05h2l2.66 12.42a2 2 0 0 0 2 1.58h9.78a2 2 0 0 0 1.95-1.57l1.65-7.43H5.12"/></svg>
            <p>السلة فارغة</p>
            <p className="text-sm mt-1">قم بإضافة منتجات لبدء البيع</p>
          </div>
        </div>

        {/* Totals & Payment */}
        <div className="bg-zinc-50 dark:bg-zinc-800/80 p-4 border-t border-zinc-200 dark:border-zinc-700">
          <div className="flex justify-between items-center mb-2 text-sm text-zinc-600 dark:text-zinc-400">
            <span>المجموع الفرعي</span>
            <span>0.00 د.أ</span>
          </div>
          <div className="flex justify-between items-center mb-4 text-sm text-zinc-600 dark:text-zinc-400">
            <span>الضريبة (16%)</span>
            <span>0.00 د.أ</span>
          </div>
          <div className="flex justify-between items-center mb-6">
            <span className="text-lg font-bold text-zinc-900 dark:text-white">الإجمالي</span>
            <span className="text-2xl font-bold text-[var(--color-forest-900)] dark:text-[var(--color-champagne-400)]">0.00 د.أ</span>
          </div>

          <button className="w-full bg-[var(--color-forest-900)] hover:bg-[var(--color-forest-800)] text-white text-lg font-bold py-4 rounded-md shadow-lg transition-colors flex items-center justify-center gap-2">
            دفع
            <span className="bg-white/20 px-2 py-0.5 rounded text-sm">F12</span>
          </button>
        </div>
      </div>
    </div>
  );
}
