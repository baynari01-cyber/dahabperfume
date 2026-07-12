import Image from 'next/image';
import Link from 'next/link';
import { prisma } from '@/lib/db';

export default async function HomePage() {
  const featuredProducts = await prisma.product.findMany({
    where: { isVisible: true, isFeatured: true },
    orderBy: { featuredOrder: 'asc' },
    take: 4,
    include: {
      variants: true,
      images: {
        where: { isMain: true },
        take: 1
      }
    }
  });

  return (
    <main className="flex-1">
      {/* Hero Section */}
      <section className="relative w-full min-h-[600px] flex items-center bg-[var(--color-forest-900)] text-white overflow-hidden">
        <div className="absolute inset-0 bg-black/40 z-10" />
        {/* Placeholder for hero background image */}
        <div className="absolute inset-0 z-0">
          <div className="w-full h-full bg-[var(--color-forest-900)]" />
        </div>
        
        <div className="relative z-20 container mx-auto px-6 text-center lg:text-right">
          <div className="max-w-2xl lg:ml-auto rtl:mr-auto rtl:ml-0">
            <h1 className="text-4xl md:text-5xl lg:text-6xl font-bold leading-tight text-[var(--color-champagne-400)] mb-6">
              حين تُترجم الفخامة <br /> إلى عطر
            </h1>
            <p className="text-lg md:text-xl text-zinc-200 mb-8 max-w-xl lg:mr-auto rtl:ml-auto rtl:mr-0">
              دهب للعطور.. نفحات مختارة بعناية من الشرق، لترافق هويتك وتُشعرك بالأصالة والتميز.
            </p>
            <div className="flex flex-col sm:flex-row gap-4 justify-center lg:justify-start rtl:justify-start">
              <Link 
                href="/shop" 
                className="px-8 py-3 bg-[var(--color-champagne-600)] hover:bg-[var(--color-champagne-500)] text-white font-bold rounded-sm transition-colors text-lg"
              >
                تسوق الآن
              </Link>
              <Link 
                href="/collections" 
                className="px-8 py-3 bg-transparent border border-[var(--color-champagne-600)] text-[var(--color-champagne-400)] hover:bg-[var(--color-champagne-600)] hover:text-white font-bold rounded-sm transition-colors text-lg"
              >
                اكتشف المجموعات
              </Link>
            </div>
          </div>
        </div>
      </section>

      {/* Featured Products */}
      <section className="py-20 bg-[var(--color-ivory-100)]">
        <div className="container mx-auto px-6">
          <div className="text-center mb-16">
            <h2 className="text-3xl md:text-4xl font-bold text-[var(--color-forest-900)] mb-4">الأكثر مبيعاً</h2>
            <div className="w-24 h-1 bg-[var(--color-champagne-600)] mx-auto" />
          </div>

          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-8">
            {featuredProducts.map((product) => (
              <div key={product.id} className="group cursor-pointer bg-white rounded-lg shadow-sm hover:shadow-md transition-shadow p-4 border border-[var(--color-ivory-200)]">
                <div className="relative aspect-square w-full bg-[var(--color-ivory-200)] rounded-md mb-4 overflow-hidden">
                  {/* Simulated Image */}
                  <div className="absolute inset-0 flex items-center justify-center text-[var(--color-forest-600)]">
                     {product.images[0] ? (
                        <div className="w-full h-full bg-cover bg-center" style={{ backgroundImage: `url(${product.images[0].url.startsWith('local://') ? '/product-placeholder.png' : product.images[0].url})` }} />
                     ) : 'صورة العطر'}
                  </div>
                </div>
                <div className="text-center">
                  <h3 className="text-xl font-bold text-[var(--color-forest-900)] mb-2">{product.nameAr}</h3>
                  <div className="text-[var(--color-champagne-600)] font-bold text-lg">
                    {product.variants[0] ? `${(product.variants[0].price / 100).toFixed(2)} د.أ` : 'نفذت الكمية'}
                  </div>
                </div>
                <div className="mt-4">
                  <button className="w-full py-2 bg-[var(--color-forest-900)] hover:bg-[var(--color-forest-800)] text-white rounded-sm transition-colors text-sm font-bold">
                    أضف إلى السلة
                  </button>
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>
    </main>
  );
}
