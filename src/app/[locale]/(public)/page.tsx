import Image from 'next/image';
import Link from 'next/link';
import { prisma } from '@/lib/db';
import { getHeroSlides, getHeroCarouselSettings, getStoreLocationSettings } from '@/actions/homepage-cms';
import { HeroCarousel } from '@/components/HeroCarousel';
import { StoreLocationSection } from '@/components/StoreLocationSection';
import { filsToDisplay } from '@/lib/money';

interface Params {
  locale?: string;
}

export default async function HomePage({ params }: { params: Promise<Params> }) {
  const { locale = 'ar' } = await params;
  const isAr = locale === 'ar';

  // 1. Fetch Featured Products
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

  // 2. Fetch Carousel settings & active slides
  const carouselSettings = await getHeroCarouselSettings();
  const allSlides = await getHeroSlides();
  const now = new Date();
  
  const activeSlides = allSlides.filter(slide => {
    if (!slide.isEnabled) return false;
    if (slide.startsAt && new Date(slide.startsAt) > now) return false;
    if (slide.endsAt && new Date(slide.endsAt) < now) return false;
    return true;
  });

  // 3. Fetch Store location settings
  const locationSettings = await getStoreLocationSettings();

  return (
    <main className="flex-1" dir={isAr ? 'rtl' : 'ltr'}>
      {/* Localized Business Structured Data (JSON-LD) */}
      {locationSettings.locationSectionEnabled && (
        <script
          type="application/ld+json"
          dangerouslySetInnerHTML={{
            __html: JSON.stringify({
              '@context': 'https://schema.org',
              '@type': 'PerfumeStore',
              'name': locationSettings.storeName,
              'url': 'https://dahabperfumes.com',
              'telephone': locationSettings.phone,
              'address': {
                '@type': 'PostalAddress',
                'streetAddress': isAr ? locationSettings.addressAr : locationSettings.addressEn,
                'addressLocality': 'Amman',
                'addressCountry': 'JO'
              },
              'geo': {
                '@type': 'GeoCoordinates',
                'latitude': locationSettings.latitude,
                'longitude': locationSettings.longitude
              },
              'openingHours': locationSettings.openingHours,
              'hasMap': locationSettings.mapPlaceUrl
            })
          }}
        />
      )}

      {/* Hero Section */}
      <section className="relative w-full bg-[var(--color-forest-900)] text-white py-12 md:py-20 overflow-hidden flex items-center min-h-[550px]">
        <div className="container mx-auto px-6 grid grid-cols-1 lg:grid-cols-12 gap-8 items-center relative z-20">
          
          {/* Content Column */}
          <div className="lg:col-span-6 space-y-6 text-center lg:text-start rtl:lg:text-right">
            <h1 className="text-3xl md:text-4xl lg:text-5xl font-bold leading-tight text-[var(--color-champagne-400)] font-heading">
              {isAr ? (
                <>حين تُترجم الفخامة <br /> إلى عطر</>
              ) : (
                <>Where Luxury <br /> Translates to Scent</>
              )}
            </h1>
            <p className="text-sm md:text-base text-zinc-200 max-w-xl mx-auto lg:mx-0 rtl:lg:mr-0 leading-relaxed">
              {isAr 
                ? 'دهب للعطور.. نفحات مختارة بعناية من الشرق، لترافق هويتك وتُشعرك بالأصالة والتميز.'
                : 'Dahab Perfumes.. meticulously selected notes from the East to accompany your identity and embrace your heritage.'}
            </p>
            <div className="flex flex-col sm:flex-row gap-4 justify-center lg:justify-start rtl:lg:justify-start">
              <Link 
                href="/shop" 
                className="px-6 py-2.5 bg-[var(--color-champagne-600)] hover:bg-[var(--color-champagne-500)] text-white font-bold rounded-sm transition-all text-sm shadow-md"
              >
                {isAr ? 'تسوق الآن' : 'Shop Now'}
              </Link>
              <Link 
                href="/collections" 
                className="px-6 py-2.5 bg-transparent border border-[var(--color-champagne-600)] text-[var(--color-champagne-400)] hover:bg-[var(--color-champagne-600)] hover:text-white font-bold rounded-sm transition-all text-sm"
              >
                {isAr ? 'اكتشف المجموعات' : 'Explore Collections'}
              </Link>
            </div>
          </div>

          {/* Carousel Column */}
          <div className="lg:col-span-6 w-full">
            {carouselSettings.enabled && activeSlides.length > 0 ? (
              <HeroCarousel slides={activeSlides} settings={carouselSettings} />
            ) : (
              // Non-ad Hero fallback composition
              <div className="relative w-full aspect-[4/3] rounded-md overflow-hidden bg-white/5 border border-white/10 flex items-center justify-center p-6">
                <div className="text-center space-y-4 opacity-40">
                  <span className="text-4xl block">🏺</span>
                  <span className="text-xs text-zinc-300 block font-heading tracking-widest uppercase">Dahab Perfumes</span>
                </div>
              </div>
            )}
          </div>

        </div>
      </section>

      {/* Featured Products */}
      <section className="py-20 bg-[var(--color-ivory-100)]">
        <div className="container mx-auto px-6">
          <div className="text-center mb-16">
            <h2 className="text-3xl md:text-4xl font-bold text-[var(--color-forest-900)] mb-4">
              {isAr ? 'الأكثر مبيعاً' : 'Best Sellers'}
            </h2>
            <div className="w-24 h-1 bg-[var(--color-champagne-600)] mx-auto" />
          </div>

          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-8">
            {featuredProducts.map((product) => (
              <div key={product.id} className="group cursor-pointer bg-white rounded-lg shadow-sm hover:shadow-md transition-shadow p-4 border border-[var(--color-ivory-200)]">
                <div className="relative aspect-square w-full bg-[var(--color-ivory-200)] rounded-md mb-4 overflow-hidden">
                  <div className="absolute inset-0 flex items-center justify-center text-[var(--color-forest-600)]">
                    {product.images[0] ? (
                      <div className="w-full h-full bg-cover bg-center" style={{ backgroundImage: `url(${product.images[0].url.startsWith('local://') ? '/product-placeholder.png' : product.images[0].url})` }} />
                    ) : (
                      isAr ? 'صورة العطر' : 'Perfume Image'
                    )}
                  </div>
                </div>
                <div className="text-center">
                  <h3 className="text-xl font-bold text-[var(--color-forest-900)] mb-2">
                    {isAr ? product.nameAr : product.nameEn}
                  </h3>
                  <div className="text-[var(--color-champagne-600)] font-bold text-lg">
                    {product.variants[0] ? filsToDisplay(product.variants[0].price, isAr ? 'ar' : 'en') : (isAr ? 'نفذت الكمية' : 'Out of Stock')}
                  </div>
                </div>
                <div className="mt-4">
                  <button className="w-full py-2 bg-[var(--color-forest-900)] hover:bg-[var(--color-forest-800)] text-white rounded-sm transition-colors text-sm font-bold">
                    {isAr ? 'أضف إلى السلة' : 'Add to Cart'}
                  </button>
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Store Location Map Section */}
      <StoreLocationSection settings={locationSettings} />
    </main>
  );
}
