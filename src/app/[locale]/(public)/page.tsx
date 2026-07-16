import Image from 'next/image';
import Link from 'next/link';
import { prisma } from '@/lib/db';
import { getHeroSlides, getHeroCarouselSettings, getStoreLocationSettings } from '@/actions/homepage-cms';
import { HeroCarousel } from '@/components/HeroCarousel';
import { StoreLocationSection } from '@/components/StoreLocationSection';
import { WishlistHeart } from '@/components/WishlistHeart';
import type { Metadata } from 'next';

import { filsToDisplay } from '@/lib/money';
import { Sparkles } from 'lucide-react';

interface Params {
  locale?: string;
}

export const revalidate = 60;

export async function generateMetadata({ params }: { params: Promise<Params> }): Promise<Metadata> {
  const { locale = 'ar' } = await params;
  const isAr = locale === 'ar';
  const BASE_URL = 'https://dahabperfumes.com';

  return {
    title: isAr
      ? 'دهب للعطور — عطور شرقية فاخرة في عمّان | الصفحة الرئيسية'
      : 'Dahab Perfumes — Luxury Oriental Fragrances in Amman | Home',
    description: isAr
      ? 'دهب للعطور وجهتك الأولى للعطور الشرقية الفاخرة في عمّان، الأردن. اكتشف تشكيلاتنا من العود والمسك والبخور والعطور الرجالية والنسائية. منذ عام 2007.'
      : 'Dahab Perfumes is your premier destination for luxury oriental fragrances in Amman, Jordan. Discover our collections of oud, musk, incense, and perfumes since 2007.',
    alternates: {
      canonical: `${BASE_URL}/${locale}`,
      languages: {
        'ar': `${BASE_URL}/ar`,
        'en': `${BASE_URL}/en`,
      },
    },
    openGraph: {
      title: isAr ? 'دهب للعطور — عطور فاخرة في عمّان' : 'Dahab Perfumes — Luxury Fragrances in Amman',
      description: isAr
        ? 'عطور شرقية فاخرة من قلب عمّان منذ 2007. العود والمسك والبخور والعطور الراقية.'
        : 'Luxury oriental fragrances from the heart of Amman since 2007.',
      url: `${BASE_URL}/${locale}`,
      locale: isAr ? 'ar_JO' : 'en_US',
    },
  };
}

export default async function StoreFrontPage({ params }: { params: Promise<Params> }) {
  const { locale = 'ar' } = await params;
  const isAr = locale === 'ar';

  // تشغيل كل استعلامات قاعدة البيانات بشكل متوازي لتحسين الأداء
  const [
    featuredProducts,
    carouselSettings,
    allSlides,
    locationSettings,
    collections,
  ] = await Promise.all([
    // 1. المنتجات المميزة
    prisma.product.findMany({
      where: { isVisible: true, isFeatured: true },
      orderBy: { featuredOrder: 'asc' },
      take: 4,
      include: {
        variants: true,
        images: {
          where: { isMain: true },
          take: 1
        },
        category: true
      }
    }),
    // 2. إعدادات الكاروسيل
    getHeroCarouselSettings(),
    // 3. شرائح الكاروسيل
    getHeroSlides(),
    // 4. إعدادات موقع المتجر
    getStoreLocationSettings(),
    // 5. المجموعات (التصنيفات) مع المنتجات
    prisma.category.findMany({
      include: {
        products: {
          where: { isVisible: true },
          take: 6,
          include: {
            variants: true,
            images: {
              where: { isMain: true },
              take: 1
            }
          }
        }
      }
    }),
  ]);

  const now = new Date();
  const activeSlides = allSlides.filter(slide => {
    if (!slide.isEnabled) return false;
    if (slide.startsAt && new Date(slide.startsAt) > now) return false;
    if (slide.endsAt && new Date(slide.endsAt) < now) return false;
    return true;
  });


  // Default mock collections if none configured in CMS
  const defaultSlides: any[] = [
    {
      id: 'default-1',
      titleAr: 'مجموعة الصيف',
      titleEn: 'Summer Collection',
      descriptionAr: 'انتعاش يدوم طوال اليوم مع أرقى الحمضيات والأزهار',
      descriptionEn: 'Long lasting freshness with the finest citrus and florals',
      eyebrowAr: 'جديد',
      eyebrowEn: 'New Arrival',
      ctaAr: 'تسوق الآن',
      ctaEn: 'Shop Now',
      imageDesktopPath: '',
      imageMobilePath: '',
      altAr: 'مجموعة الصيف',
      altEn: 'Summer Collection',
      destinationType: 'URL',
      internalPath: '/collections/summer',
      displayOrder: 1,
      isEnabled: true,
      openInNewTab: false,
      overlayStrength: 40,
      textPosition: 'CENTER'
    },
    {
      id: 'default-2',
      titleAr: 'مجموعة العود الملكي',
      titleEn: 'Royal Oud Collection',
      descriptionAr: 'فخامة الشرق الأصيلة المستخلصة من أندر أنواع العود',
      descriptionEn: 'Authentic oriental luxury extracted from the rarest Oud',
      eyebrowAr: 'الأكثر مبيعاً',
      eyebrowEn: 'Best Seller',
      ctaAr: 'اكتشف المجموعة',
      ctaEn: 'Discover',
      imageDesktopPath: '',
      imageMobilePath: '',
      altAr: 'مجموعة العود الملكي',
      altEn: 'Royal Oud Collection',
      destinationType: 'URL',
      internalPath: '/collections/oud',
      displayOrder: 2,
      isEnabled: true,
      openInNewTab: false,
      overlayStrength: 50,
      textPosition: 'CENTER'
    }
  ];

  const carouselSlidesToDisplay = activeSlides.length > 0 ? activeSlides : defaultSlides;

  return (
    <main className="flex-1" dir={isAr ? 'rtl' : 'ltr'}>
      {/* Localized Business Structured Data (JSON-LD) */}
      {locationSettings.locationSectionEnabled && (
        <script
          type="application/ld+json"
          dangerouslySetInnerHTML={{
            __html: JSON.stringify({
              '@context': 'https://schema.org',
              '@type': 'HealthAndBeautyBusiness',
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
      <section className="relative w-full overflow-hidden min-h-[60vh] md:min-h-[80vh] flex items-center">
        <div className="absolute inset-0 w-full h-full z-10">
          {carouselSettings.enabled && carouselSlidesToDisplay.length > 0 ? (
            <HeroCarousel slides={carouselSlidesToDisplay} settings={carouselSettings} />
          ) : (
            // Non-ad Hero fallback composition
            <div className="relative w-full h-full bg-[var(--color-charcoal-900)] flex flex-col items-center justify-center p-6 text-center z-20">
              <Sparkles className="w-12 h-12 text-[var(--color-champagne-400)] mb-6 opacity-80" />
              <h1 className="text-3xl md:text-5xl font-bold leading-tight text-white font-heading mb-4">
                {isAr ? (
                  <>حين تُترجم الفخامة إلى عطر</>
                ) : (
                  <>Where Luxury Translates to Scent</>
                )}
              </h1>
              <p className="text-sm md:text-base text-zinc-300 max-w-xl mx-auto leading-relaxed mb-8">
                {isAr 
                  ? 'دهب للعطور.. نفحات مختارة بعناية من الشرق، لترافق هويتك وتُشعرك بالأصالة والتميز.'
                  : 'Dahab Perfumes.. meticulously selected notes from the East to accompany your identity and embrace your heritage.'}
              </p>
              <div className="flex flex-col sm:flex-row gap-4 justify-center">
                <Link 
                  href="/shop" 
                  className="px-8 py-3 bg-[var(--color-champagne-600)] hover:bg-[var(--color-champagne-500)] text-white font-bold rounded-sm transition-all text-sm shadow-md"
                >
                  {isAr ? 'تسوق الآن' : 'Shop Now'}
                </Link>
              </div>
            </div>
          )}
        </div>
      </section>

      {/* اختر العطر Section */}
      <section id="find-your-scent" className="py-16 bg-white">
        <div className="container mx-auto px-6">
          <div className="text-center mb-12">
            <h2 className="text-3xl font-bold font-heading text-[var(--color-charcoal-900)] mb-4">
              {isAr ? 'اختر العطر حسب الحالة، لا حسب الزحمة.' : 'Choose your scent by mood, not by trend.'}
            </h2>
            <div className="w-16 h-1 bg-[var(--color-champagne-600)] mx-auto rounded-full" />
          </div>
          
          <div className="grid grid-cols-1 md:grid-cols-3 gap-6 max-w-5xl mx-auto">
            {collections.length > 0 ? collections.map(collection => (
              <Link href={`/${locale}/shop?category=${collection.id}`} key={collection.id} className="block group">
                {/* بطاقة المجموعة — الصورة تملأ البطاقة كاملاً مع gradient overlay */}
                <div className="relative rounded-xl overflow-hidden shadow-md border border-[var(--color-ivory-200)] group-hover:border-[var(--color-champagne-600)] group-hover:shadow-xl transition-all duration-300 aspect-[4/5]">
                  {/* صورة المجموعة كاملة */}
                  {collection.imagePath ? (
                    <img
                      src={collection.imagePath.startsWith('local://') ? '/product-placeholder.png' : collection.imagePath}
                      alt={collection.name}
                      className="absolute inset-0 w-full h-full object-cover group-hover:scale-105 transition-transform duration-500"
                    />
                  ) : (
                    /* Gradient placeholder عندما لا توجد صورة */
                    <div className="absolute inset-0 bg-gradient-to-br from-[var(--color-charcoal-800)] via-[var(--color-charcoal-700)] to-[var(--color-champagne-600)] group-hover:scale-105 transition-transform duration-500" />
                  )}

                  {/* Gradient overlay من الأسفل */}
                  <div className="absolute inset-0 bg-gradient-to-t from-black/80 via-black/20 to-transparent" />

                  {/* محتوى البطاقة في الأسفل */}
                  <div className="absolute bottom-0 left-0 right-0 p-5 text-white">
                    <h3 className="text-xl font-bold font-heading mb-1 drop-shadow-md">
                      {collection.name}
                    </h3>
                    {collection.description && (
                      <p className="text-sm text-zinc-200 line-clamp-2 drop-shadow-sm">
                        {collection.description}
                      </p>
                    )}
                    {/* زر "تسوق الآن" يظهر عند hover */}
                    <div className="mt-3 opacity-0 group-hover:opacity-100 transition-opacity duration-300 translate-y-2 group-hover:translate-y-0">
                      <span className="inline-block text-xs font-bold bg-[var(--color-champagne-600)] text-white px-4 py-1.5 rounded-full">
                        {isAr ? 'تسوق الآن ←' : 'Shop Now →'}
                      </span>
                    </div>
                  </div>
                </div>
              </Link>
            )) : (
              <>
                {[isAr ? 'رجالي' : 'Men', isAr ? 'نسائي' : 'Women', isAr ? 'عود' : 'Oud'].map((label, i) => (
                  <div key={i} className="relative rounded-xl overflow-hidden shadow-md aspect-[4/5] border border-[var(--color-ivory-200)]">
                    <div className="absolute inset-0 bg-gradient-to-br from-[var(--color-charcoal-800)] via-[var(--color-charcoal-700)] to-[var(--color-champagne-600)]" />
                    <div className="absolute inset-0 bg-gradient-to-t from-black/70 to-transparent" />
                    <div className="absolute bottom-0 left-0 right-0 p-5 text-white">
                      <h3 className="text-xl font-bold font-heading">{label}</h3>
                    </div>
                  </div>
                ))}
              </>
            )}
          </div>
        </div>
      </section>

      {/* Featured Products */}
      <section className="py-20 bg-[var(--color-ivory-100)]">
        <div className="container mx-auto px-6">
          
          {/* Desktop Specific: Featured Products Grid */}
          <div className="hidden md:block">
            <div className="text-center mb-16">
              <h2 className="text-3xl md:text-4xl font-bold text-[var(--color-charcoal-900)] mb-4">
                {isAr ? 'الأكثر مبيعاً' : 'Best Sellers'}
              </h2>
              <div className="w-24 h-1 bg-[var(--color-champagne-600)] mx-auto" />
            </div>

            <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-8">
            {featuredProducts.map((product) => {
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
                      ) : (
                        isAr ? 'صورة العطر' : 'Perfume Image'
                      )}
                    </div>
                  </div>
                  <div className="text-center flex-1 flex flex-col">
                    <h3 className="text-lg font-bold text-[var(--color-charcoal-900)] mb-1 group-hover:text-[var(--color-champagne-600)] transition-colors">
                      {isAr ? product.nameAr : product.nameEn}
                    </h3>
                    {product.category && <p className="text-xs text-zinc-500 mb-2">{product.category.name}</p>}
                    <div className="mt-auto text-sm text-[var(--color-champagne-600)] font-bold">
                      {isAr ? 'اختر الحجم لعرض السعر' : 'Select size for price'}
                    </div>
                  </div>
                  <div className="mt-4 opacity-0 group-hover:opacity-100 transition-opacity duration-300">
                    <button className="w-full py-2 bg-[var(--color-charcoal-900)] hover:bg-[var(--color-charcoal-800)] text-white rounded-sm text-sm font-bold shadow-md">
                      {isAr ? 'عرض التفاصيل' : 'View Details'}
                    </button>
                  </div>
                </Link>
              );
            })}
            </div>
          </div>
        </div>
      </section>

      {/* تجربة شراء أهدأ */}
      <section className="py-20 bg-zinc-900 text-white text-center">
        <div className="container mx-auto px-6 max-w-4xl space-y-8">
          <h2 className="text-3xl md:text-4xl font-bold font-heading text-[var(--color-champagne-400)]">
            {isAr ? 'تجربة شراء أهدأ' : 'A Calmer Shopping Experience'}
          </h2>
          <p className="text-lg md:text-xl text-zinc-300 leading-relaxed max-w-3xl mx-auto">
            {isAr ? 'لا تحتاج أن تعرف أسماء النوتات. نساعدك تختار الأثر.' : 'You don\'t need to know the notes. We help you choose the impact.'}
          </p>
          <p className="text-zinc-400 leading-relaxed max-w-2xl mx-auto">
            {isAr 
              ? 'في دهب، الاختيار يبدأ من المناسبة، قوة الحضور، وذوقك الشخصي. يمكنك زيارة المعرض أو إرسال رسالة واتساب ليقترح لك الفريق خيارات مناسبة.'
              : 'At Dahab, the choice begins with the occasion, the strength of presence, and your personal taste. You can visit the showroom or send a WhatsApp message for our team to suggest suitable options.'}
          </p>
          <div className="pt-4 flex flex-col sm:flex-row justify-center items-center gap-4">
             <Link 
                href={locationSettings.mapPlaceUrl || 'https://maps.app.goo.gl/6vNgkpRotjgZZA1E6'}
                target="_blank"
                rel="noopener noreferrer"
                className="px-8 py-3 bg-[var(--color-champagne-600)] hover:bg-[var(--color-champagne-500)] text-white font-bold rounded-sm transition-all shadow-md"
              >
                {isAr ? 'افتح موقع المعرض' : 'Open Showroom Location'}
              </Link>
          </div>
        </div>
      </section>

      {/* Brand Story */}
      <section id="brand-story" className="py-20 bg-white">
        <div className="container mx-auto px-6">
          <div className="max-w-4xl mx-auto text-center space-y-8">
            <span className="text-[var(--color-champagne-600)] font-bold tracking-widest uppercase text-sm">
              {isAr ? 'عن دهب للعطور' : 'About Dahab Perfumes'}
            </span>
            <h2 className="text-4xl font-bold font-heading text-[var(--color-charcoal-900)]">
              {isAr ? 'قصتنا' : 'Our Story'}
            </h2>
            <p className="text-xl text-zinc-700 font-medium italic">
              {isAr ? 'رحلة من الشغف والإبداع في قلب وسط البلد، عمّان.' : 'A journey of passion and creativity in the heart of Downtown, Amman.'}
            </p>
            <div className="space-y-4 text-zinc-600 leading-relaxed text-justify md:text-center">
              <p>
                {isAr 
                  ? 'منذ عام 2007، حُفرت رحلتنا بالشغف والإبداع والتميّز. بدأت الحكاية من متجر صغير في وسط البلد تحت اسم "دهب"، حيث أصبح وجهة لعشاق العطور وخلطات العطور الفريدة.'
                  : 'Since 2007, our journey has been engraved with passion, creativity, and excellence. The story began in a small store in Downtown under the name "Dahab", where it became a destination for perfume lovers and unique blends.'}
              </p>
              <p>
                {isAr 
                  ? 'مع مرور الوقت، توسّعنا لنبدأ فصلاً جديداً من النمو والتميّز. واليوم، نحن إحدى كبرى محلات العطور في المملكة الأردنية الهاشمية، شهادةً على عقود من العمل المتفاني والالتزام بالجودة.'
                  : 'Over time, we expanded to begin a new chapter of growth and excellence. Today, we are one of the largest perfume stores in the Hashemite Kingdom of Jordan, a testament to decades of dedicated work and commitment to quality.'}
              </p>
              <p className="font-bold text-[var(--color-charcoal-900)] text-lg pt-4">
                {isAr 
                  ? 'نمزج بين أصالة تراثنا وشغفنا بالابتكار لنخلق روائح تلامس القلب وتبقى للأبد.'
                  : 'We blend the authenticity of our heritage with our passion for innovation to create scents that touch the heart and last forever.'}
              </p>
            </div>
            
            <div className="pt-8 flex flex-col sm:flex-row justify-center items-center gap-4">
              <a href="#store-location" className="px-8 py-3 bg-[var(--color-charcoal-900)] hover:bg-[var(--color-charcoal-800)] text-white font-bold rounded-sm transition-all shadow-md">
                {isAr ? 'زيارة المعرض' : 'Visit Showroom'}
              </a>
              <a href={`tel:${locationSettings.phone}`} className="px-8 py-3 bg-transparent border-2 border-[var(--color-charcoal-900)] text-[var(--color-charcoal-900)] hover:bg-[var(--color-charcoal-900)] hover:text-white font-bold rounded-sm transition-all">
                {isAr ? 'تواصل معنا' : 'Contact Us'}
              </a>
            </div>
          </div>
        </div>
      </section>
      
      {/* Quote Section */}
      <section className="py-24 bg-[var(--color-ivory-50)] border-y border-[var(--color-ivory-200)] relative overflow-hidden">
        <div className="absolute top-0 left-1/2 -translate-x-1/2 -translate-y-1/2 text-9xl text-[var(--color-ivory-200)] opacity-50 select-none font-serif">&quot;</div>
        <div className="container mx-auto px-6 text-center relative z-10">
          <p className="text-2xl md:text-3xl font-heading font-medium text-[var(--color-charcoal-900)] leading-relaxed max-w-4xl mx-auto">
            {isAr 
              ? '«نحن عشاق العطور وصناع الذكريات، نؤمن بأن كل عطر يحمل قصة، وكل شعور له نفحة.»'
              : '&quot;We are perfume lovers and memory makers, we believe that every perfume carries a story, and every feeling has a scent.&quot;'}
          </p>
        </div>
      </section>

      {/* Stats/Benefits Section */}
      <section id="benefits" className="py-16 bg-[var(--color-charcoal-900)] text-white text-center">
        <div className="container mx-auto px-6 grid grid-cols-1 md:grid-cols-3 gap-12 divide-y md:divide-y-0 md:divide-x md:divide-x-reverse divide-white/20">
          <div className="space-y-3 pt-8 md:pt-0">
            <div className="text-4xl font-bold font-heading text-[var(--color-champagne-400)]">2007</div>
            <div className="text-lg font-bold">{isAr ? 'منذ عام' : 'Since'}</div>
            <div className="text-sm text-zinc-300">{isAr ? 'رحلة من الشغف والإبداع في قلب عمّان.' : 'A journey of passion and creativity in the heart of Amman.'}</div>
          </div>
          <div className="space-y-3 pt-8 md:pt-0">
            <div className="text-4xl font-bold font-heading text-[var(--color-champagne-400)]">4.7</div>
            <div className="text-lg font-bold">{isAr ? 'نجوم' : 'Stars'}</div>
            <div className="text-sm text-zinc-300">{isAr ? '216+ تقييم حقيقي على جوجل' : '216+ Real reviews on Google'}</div>
          </div>
          <div className="space-y-3 pt-8 md:pt-0">
            <div className="text-4xl font-bold font-heading text-[var(--color-champagne-400)] text-xl">
              {isAr ? 'وسط البلد' : 'Downtown'}
            </div>
            <div className="text-lg font-bold">{isAr ? 'موقعنا' : 'Location'}</div>
            <div className="text-sm text-zinc-300">{isAr ? 'شارع الأمير محمد، عمّان.' : 'Prince Mohammed St, Amman.'}</div>
          </div>
        </div>
      </section>

      {/* Store Location Map Section */}
      <StoreLocationSection settings={locationSettings} />
    </main>
  );
}
