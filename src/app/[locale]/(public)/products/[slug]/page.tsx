import { prisma } from '@/lib/db';
import { notFound } from 'next/navigation';
import { filsToDisplay } from '@/lib/money';
import Image from 'next/image';
import Link from 'next/link';
import { ProductVariantSelector } from '@/components/ProductVariantSelector';
import ProductMainAccords from '@/components/ProductMainAccords';
import type { Metadata } from 'next';

const BASE_URL = 'https://dahabperfumes.com';

export const revalidate = 3600; // تحديث صفحات المنتجات كل ساعة

// بناء مسبق لصفحات المنتجات (Static Site Generation)
// تجنباً للضغط على قاعدة البيانات أثناء البناء (Connection Timeout)، نستخدم ISR (الريندر عند الطلب)
export async function generateStaticParams() {
  return [];
}

export async function generateMetadata({
  params,
}: {
  params: Promise<{ slug: string; locale: string }>;
}): Promise<Metadata> {
  const { slug, locale } = await params;
  const isAr = locale === 'ar';

  const product = await prisma.product.findUnique({
    where: { slug },
    include: {
      images: { where: { isMain: true }, take: 1 },
      category: true,
    },
  });

  if (!product) return {};

  const name = isAr ? product.nameAr : product.nameEn;
  const description =
    product.shortDescription ||
    (isAr
      ? `اشتري عطر ${product.nameAr} من دهب للعطور — عطور شرقية فاخرة في عمّان`
      : `Buy ${product.nameEn} from Dahab Perfumes — Luxury Oriental Fragrances in Amman`);
  const imageUrl = product.images[0]?.url?.startsWith('local://')
    ? `${BASE_URL}/product-placeholder.png`
    : product.images[0]?.url || `${BASE_URL}/og-image.jpg`;

  return {
    title: `${name} | دهب للعطور`,
    description,
    keywords: [
      name,
      'دهب للعطور',
      product.category.name,
      'عطور فاخرة',
      'عطور عمّان',
      'Dahab Perfumes',
    ],
    alternates: {
      canonical: `${BASE_URL}/${locale}/products/${slug}`,
      languages: {
        ar: `${BASE_URL}/ar/products/${slug}`,
        en: `${BASE_URL}/en/products/${slug}`,
      },
    },
    openGraph: {
      type: 'article',
      title: `${name} | دهب للعطور`,
      description,
      url: `${BASE_URL}/${locale}/products/${slug}`,
      locale: isAr ? 'ar_JO' : 'en_US',
      images: [
        {
          url: imageUrl,
          width: 800,
          height: 800,
          alt: name,
        },
      ],
    },
    twitter: {
      card: 'summary_large_image',
      title: `${name} | دهب للعطور`,
      description,
      images: [imageUrl],
    },
  };
}

export default async function ProductPage({ params }: { params: Promise<{ slug: string; locale: string }> }) {
  const { slug, locale } = await params;
  
  const product = await prisma.product.findUnique({
    where: { slug },
    include: {
      variants: { orderBy: { size: 'asc' } },
      images: { orderBy: { order: 'asc' } },
      accords: { include: { accord: true }, orderBy: { order: 'asc' } },
      category: true,
      family: true,
      gender: true,
      season: true,
    }
  });

  if (!product || !product.isVisible) {
    notFound();
  }

  const mainImage = product.images.find(img => img.isMain) || product.images[0];
  const lowestPrice = product.variants.length > 0 
    ? Math.min(...product.variants.map(v => v.price))
    : 0;

  const isAr = locale === 'ar';
  const productName = isAr ? product.nameAr : product.nameEn;
  const mainImageUrl = mainImage?.url?.startsWith('local://')
    ? `${BASE_URL}/product-placeholder.png`
    : mainImage?.url || `${BASE_URL}/og-image.jpg`;

  // بيانات المنتج المهيكلة لـ Google (Product Schema + BreadcrumbList)
  const productSchema = {
    '@context': 'https://schema.org',
    '@type': 'Product',
    name: productName,
    description: product.shortDescription || productName,
    image: mainImageUrl,
    brand: {
      '@type': 'Brand',
      name: 'دهب للعطور',
    },
    category: product.category.name,
    url: `${BASE_URL}/${locale}/products/${product.slug}`,
    offers: product.variants.map(v => ({
      '@type': 'Offer',
      price: (v.price / 100).toFixed(2),
      priceCurrency: 'JOD',
      availability: 'https://schema.org/InStock',
      name: v.size,
      seller: {
        '@type': 'Organization',
        name: 'دهب للعطور',
      },
    })),
  };

  const breadcrumbSchema = {
    '@context': 'https://schema.org',
    '@type': 'BreadcrumbList',
    itemListElement: [
      { '@type': 'ListItem', position: 1, name: isAr ? 'الرئيسية' : 'Home', item: `${BASE_URL}/${locale}` },
      { '@type': 'ListItem', position: 2, name: isAr ? 'المتجر' : 'Shop', item: `${BASE_URL}/${locale}/shop` },
      { '@type': 'ListItem', position: 3, name: productName, item: `${BASE_URL}/${locale}/products/${product.slug}` },
    ],
  };

  return (
    <div className="container mx-auto px-6 py-12">
      {/* Product & Breadcrumb Schema JSON-LD */}
      <script type="application/ld+json" dangerouslySetInnerHTML={{ __html: JSON.stringify(productSchema) }} />
      <script type="application/ld+json" dangerouslySetInnerHTML={{ __html: JSON.stringify(breadcrumbSchema) }} />

      <div className="flex text-sm text-[var(--color-champagne-600)] font-bold mb-8 gap-2">
        <Link href={`/${locale}`}>{isAr ? 'الرئيسية' : 'Home'}</Link>
        <span>/</span>
        <Link href={`/${locale}/shop`}>{isAr ? 'المتجر' : 'Shop'}</Link>
        <span>/</span>
        <span className="text-[var(--color-charcoal-900)]">{productName}</span>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-2 gap-12">
        {/* Product Images */}
        <div className="space-y-4">
          <div className="aspect-square bg-[var(--color-ivory-200)] rounded-lg overflow-hidden relative border border-[var(--color-ivory-200)]">
             <div className="absolute inset-0 flex items-center justify-center text-[var(--color-charcoal-600)]">
               {mainImage ? (
                  <div className="w-full h-full bg-cover bg-center" style={{ backgroundImage: `url(${mainImage.url.startsWith('local://') ? '/product-placeholder.png' : mainImage.url})` }} />
               ) : 'صورة العطر'}
            </div>
          </div>
          {product.images.length > 1 && (
            <div className="flex gap-4 overflow-x-auto pb-2">
              {product.images.map((img) => (
                <div key={img.id} className={`w-24 h-24 flex-shrink-0 rounded-md border-2 overflow-hidden bg-[var(--color-ivory-200)] ${img.id === mainImage?.id ? 'border-[var(--color-champagne-600)]' : 'border-transparent'}`}>
                  <div className="w-full h-full bg-cover bg-center" style={{ backgroundImage: `url(${img.url.startsWith('local://') ? '/product-placeholder.png' : img.url})` }} />
                </div>
              ))}
            </div>
          )}
        </div>

        {/* Product Info */}
        <div className="flex flex-col">
          <h1 className="text-3xl md:text-4xl font-bold font-heading text-[var(--color-charcoal-900)] mb-2">
            {product.nameAr}
          </h1>
          <div className="flex flex-wrap gap-2 mb-6">
            <span className="bg-[var(--color-champagne-100)] text-[var(--color-charcoal-700)] px-3 py-1 rounded-full text-sm border border-[var(--color-champagne-300)]">{product.category.name}</span>
            {product.family && <span className="bg-[var(--color-champagne-100)] text-[var(--color-charcoal-700)] px-3 py-1 rounded-full text-sm border border-[var(--color-champagne-300)]">{product.family.name}</span>}
            {product.gender && <span className="bg-[var(--color-champagne-100)] text-[var(--color-charcoal-700)] px-3 py-1 rounded-full text-sm border border-[var(--color-champagne-300)]">{product.gender.name}</span>}
            {product.season && <span className="bg-[var(--color-champagne-100)] text-[var(--color-charcoal-700)] px-3 py-1 rounded-full text-sm border border-[var(--color-champagne-300)]">{product.season.name}</span>}
          </div>

          <p className="text-zinc-700 leading-relaxed mb-8">
            {product.shortDescription || 'عطر فاخر ينبض بالجاذبية ويمثل بصمة عطرية فريدة تدوم طويلاً.'}
          </p>

          <ProductVariantSelector variants={product.variants} locale={locale} product={product} mainImage={mainImage?.url} />

          {/* Accords (Olfactory Notes) */}
          {product.accords.length > 0 && (
            <div className="mt-8 pt-8 border-t border-[var(--color-ivory-200)]">
              <ProductMainAccords 
                accords={product.accords.map(a => ({
                  id: a.accordId,
                  name: a.accord.name,
                  value: a.value
                }))} 
              />
            </div>
          )}
        </div>
      </div>
    </div>
  );
}
