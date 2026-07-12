import { prisma } from '@/lib/db';
import Link from 'next/link';

export default async function ShopPage({ params }: { params: Promise<{ locale: string }> }) {
  const { locale } = await params;
  
  const products = await prisma.product.findMany({
    where: { isVisible: true },
    include: {
      variants: { orderBy: { size: 'asc' } },
      images: { orderBy: { order: 'asc' } },
      category: true,
    },
    orderBy: { createdAt: 'desc' }
  });

  // Extract unique categories for filtering (in a real app, this would be dynamic via search params)
  const categories = Array.from(new Set(products.map(p => p.category.name)));

  return (
    <div className="bg-[var(--color-ivory-100)] min-h-screen pb-20">
      {/* Header Banner */}
      <div className="bg-[var(--color-forest-900)] text-white py-16 text-center border-b-4 border-[var(--color-champagne-600)]">
        <h1 className="text-4xl md:text-5xl font-bold font-heading mb-4">المتجر</h1>
        <p className="text-zinc-300 text-lg">اكتشف تشكيلتنا الحصرية من العطور الفاخرة</p>
      </div>

      <div className="container mx-auto px-6 mt-12 flex flex-col md:flex-row gap-8">
        
        {/* Sidebar Filters */}
        <aside className="w-full md:w-64 flex-shrink-0">
          <div className="bg-white p-6 rounded-lg shadow-sm border border-[var(--color-ivory-200)] sticky top-24">
            <h3 className="font-bold text-lg text-[var(--color-forest-900)] mb-4 border-b pb-2">تصفية البحث</h3>
            
            <div className="mb-6">
              <h4 className="font-bold text-sm text-zinc-700 mb-3">الفئة</h4>
              <div className="space-y-2">
                {categories.map(cat => (
                  <label key={cat} className="flex items-center gap-2 cursor-pointer">
                    <input type="checkbox" className="rounded text-[var(--color-champagne-600)] focus:ring-[var(--color-champagne-600)]" />
                    <span className="text-sm text-zinc-600">{cat}</span>
                  </label>
                ))}
              </div>
            </div>

            <div className="mb-6">
              <h4 className="font-bold text-sm text-zinc-700 mb-3">السعر</h4>
              <input type="range" min="0" max="200" className="w-full accent-[var(--color-champagne-600)]" />
              <div className="flex justify-between text-xs text-zinc-500 mt-2">
                <span>0 د.أ</span>
                <span>200+ د.أ</span>
              </div>
            </div>
            
            <button className="w-full bg-[var(--color-forest-900)] hover:bg-[var(--color-forest-800)] text-white py-2 rounded-md font-bold text-sm transition-colors">
              تطبيق الفلاتر
            </button>
          </div>
        </aside>

        {/* Product Grid */}
        <main className="flex-1">
          <div className="flex justify-between items-center mb-6 bg-white p-4 rounded-lg shadow-sm border border-[var(--color-ivory-200)]">
            <span className="text-sm font-bold text-zinc-600">إظهار {products.length} نتائج</span>
            <select className="border border-zinc-300 rounded-md px-4 py-2 text-sm focus:outline-none focus:border-[var(--color-champagne-600)] bg-white text-zinc-700">
              <option>ترتيب حسب: الأحدث</option>
              <option>السعر: من الأقل للأعلى</option>
              <option>السعر: من الأعلى للأقل</option>
              <option>الأكثر مبيعاً</option>
            </select>
          </div>

          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
            {products.map((product) => {
              const mainImage = product.images.find(img => img.isMain) || product.images[0];
              const lowestPrice = product.variants.length > 0 
                ? Math.min(...product.variants.map(v => v.price))
                : 0;

              return (
                <Link key={product.id} href={`/${locale}/products/${product.slug}`} className="group bg-white rounded-lg shadow-sm hover:shadow-md transition-all duration-300 p-4 border border-[var(--color-ivory-200)] flex flex-col h-full hover:border-[var(--color-champagne-600)]">
                  <div className="relative aspect-square w-full bg-[var(--color-ivory-200)] rounded-md mb-4 overflow-hidden">
                    <div className="absolute inset-0 flex items-center justify-center text-[var(--color-forest-600)]">
                      {mainImage ? (
                        <div className="w-full h-full bg-cover bg-center group-hover:scale-105 transition-transform duration-500" style={{ backgroundImage: `url(${mainImage.url.startsWith('local://') ? '/product-placeholder.png' : mainImage.url})` }} />
                      ) : 'صورة العطر'}
                    </div>
                  </div>
                  <div className="text-center flex-1 flex flex-col">
                    <h3 className="text-lg font-bold text-[var(--color-forest-900)] mb-1 group-hover:text-[var(--color-champagne-600)] transition-colors">{product.nameAr}</h3>
                    <p className="text-xs text-zinc-500 mb-2">{product.category.name}</p>
                    <div className="mt-auto text-[var(--color-champagne-600)] font-bold text-lg">
                      {lowestPrice > 0 ? `${(lowestPrice / 100).toFixed(2)} د.أ` : 'نفذت الكمية'}
                    </div>
                  </div>
                  <div className="mt-4 opacity-0 group-hover:opacity-100 transition-opacity duration-300">
                    <button className="w-full py-2 bg-[var(--color-forest-900)] hover:bg-[var(--color-forest-800)] text-white rounded-sm text-sm font-bold shadow-md">
                      عرض التفاصيل
                    </button>
                  </div>
                </Link>
              );
            })}
          </div>
          
          {products.length === 0 && (
            <div className="text-center py-20">
              <p className="text-xl text-zinc-500">لا توجد منتجات حالياً.</p>
            </div>
          )}
        </main>
      </div>
    </div>
  );
}
