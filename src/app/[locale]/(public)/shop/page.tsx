import { prisma } from '@/lib/db';
import Link from 'next/link';
import { filsToDisplay } from '@/lib/money';
import { ShopFilters } from '@/components/ShopFilters';
import { WishlistHeart } from '@/components/WishlistHeart';

export const revalidate = 60;

export default async function ShopPage({ params, searchParams }: { params: Promise<{ locale: string }>, searchParams: Promise<{ [key: string]: string | string[] | undefined }> }) {
  const { locale } = await params;
  const sp = await searchParams;
  
  const minPriceStr = typeof sp.minPrice === 'string' ? sp.minPrice : '0';
  const maxPriceStr = typeof sp.maxPrice === 'string' ? sp.maxPrice : '500';
  const categoryStr = typeof sp.category === 'string' ? sp.category : '';
  
  const minPriceFils = parseInt(minPriceStr) * 1000;
  const maxPriceFils = parseInt(maxPriceStr) * 1000;

  // Build prisma where clause
  const where: any = { isVisible: true };
  
  if (categoryStr) {
    where.categoryId = categoryStr;
  }
  
  // Filter by price using variants
  where.variants = {
    some: {
      price: {
        gte: minPriceFils || 0,
        lte: maxPriceFils || 500000
      }
    }
  };

  const products = await prisma.product.findMany({
    where,
    include: {
      variants: { orderBy: { size: 'asc' } },
      images: { orderBy: { order: 'asc' } },
      category: true,
    },
    orderBy: { createdAt: 'desc' }
  });

  const categories = await prisma.category.findMany();

  return (
    <div className="bg-[var(--color-ivory-100)] min-h-screen pb-20">
      {/* Header Banner */}
      <div className="bg-[var(--color-charcoal-900)] text-white py-16 text-center border-b-4 border-[var(--color-champagne-600)]">
        <h1 className="text-4xl md:text-5xl font-bold font-heading mb-4">المتجر</h1>
        <p className="text-zinc-300 text-lg">اكتشف تشكيلتنا الحصرية من العطور الفاخرة</p>
      </div>

      <div className="container mx-auto px-6 mt-12 flex flex-col md:flex-row gap-8">
        
        {/* Sidebar Filters */}
        <aside className="w-full md:w-64 flex-shrink-0">
          <ShopFilters 
            categories={categories} 
            initialMinPrice={parseInt(minPriceStr)} 
            initialMaxPrice={parseInt(maxPriceStr)} 
            initialCategory={categoryStr} 
          />
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
                    <div className="absolute top-2 right-2 z-20">
                      <WishlistHeart product={{
                        id: product.id,
                        nameAr: product.nameAr,
                        nameEn: product.nameEn,
                        slug: product.slug,
                        imageUrl: mainImage?.url || '',
                        price: lowestPrice,
                        stockStatus: product.stockStatus
                      }} />
                    </div>
                    <div className="absolute inset-0 flex items-center justify-center text-[var(--color-charcoal-600)]">
                      {mainImage ? (
                        <div className="w-full h-full bg-cover bg-center group-hover:scale-105 transition-transform duration-500" style={{ backgroundImage: `url(${mainImage.url.startsWith('local://') ? '/product-placeholder.png' : mainImage.url})` }} />
                      ) : 'صورة العطر'}
                    </div>
                  </div>
                  <div className="text-center flex-1 flex flex-col">
                    <h3 className="text-lg font-bold text-[var(--color-charcoal-900)] mb-1 group-hover:text-[var(--color-champagne-600)] transition-colors">{product.nameAr}</h3>
                    <p className="text-xs text-zinc-500 mb-2">{product.category.name}</p>
                    <div className="mt-auto text-sm text-[var(--color-champagne-600)] font-bold">
                      {locale === 'ar' ? 'اختر الحجم لعرض السعر' : 'Select size for price'}
                    </div>
                  </div>
                  <div className="mt-4 opacity-0 group-hover:opacity-100 transition-opacity duration-300">
                    <button className="w-full py-2 bg-[var(--color-charcoal-900)] hover:bg-[var(--color-charcoal-800)] text-white rounded-sm text-sm font-bold shadow-md">
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
