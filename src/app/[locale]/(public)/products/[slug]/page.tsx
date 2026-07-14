import { prisma } from '@/lib/db';
import { notFound } from 'next/navigation';
import { filsToDisplay } from '@/lib/money';
import Image from 'next/image';
import Link from 'next/link';
import { ProductVariantSelector } from '@/components/ProductVariantSelector';

export async function generateMetadata({ params }: { params: Promise<{ slug: string; locale: string }> }) {
  const { slug } = await params;
  const product = await prisma.product.findUnique({ where: { slug } });
  
  if (!product) return {};
  
  return {
    title: `${product.nameAr} | Dahab Perfumes`,
    description: product.shortDescription || `اشتري عطر ${product.nameAr} من دهب للعطور`,
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
    }
  });

  if (!product || !product.isVisible) {
    notFound();
  }

  const mainImage = product.images.find(img => img.isMain) || product.images[0];
  const lowestPrice = product.variants.length > 0 
    ? Math.min(...product.variants.map(v => v.price))
    : 0;

  return (
    <div className="container mx-auto px-6 py-12">
      <div className="flex text-sm text-[var(--color-champagne-600)] font-bold mb-8 gap-2">
        <Link href={`/${locale}`}>الرئيسية</Link>
        <span>/</span>
        <Link href={`/${locale}/shop`}>المتجر</Link>
        <span>/</span>
        <span className="text-[var(--color-forest-900)]">{product.nameAr}</span>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-2 gap-12">
        {/* Product Images */}
        <div className="space-y-4">
          <div className="aspect-square bg-[var(--color-ivory-200)] rounded-lg overflow-hidden relative border border-[var(--color-ivory-200)]">
             <div className="absolute inset-0 flex items-center justify-center text-[var(--color-forest-600)]">
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
          <h1 className="text-3xl md:text-4xl font-bold font-heading text-[var(--color-forest-900)] mb-2">
            {product.nameAr}
          </h1>
          <p className="text-[var(--color-forest-700)] text-lg mb-6">
            {product.category.name} {product.family ? `| ${product.family.name}` : ''}
          </p>

          <p className="text-zinc-700 leading-relaxed mb-8">
            {product.shortDescription || 'عطر فاخر ينبض بالجاذبية ويمثل بصمة عطرية فريدة تدوم طويلاً.'}
          </p>

          <ProductVariantSelector variants={product.variants} locale={locale} product={product} mainImage={mainImage?.url} />

          {/* Accords (Olfactory Notes) */}
          {product.accords.length > 0 && (
            <div className="border-t border-[var(--color-ivory-200)] pt-8">
              <h3 className="text-lg font-bold font-heading text-[var(--color-forest-900)] mb-6">البصمة العطرية</h3>
              <div className="space-y-4">
                {product.accords.map((accord) => (
                  <div key={accord.accordId} className="flex items-center justify-between">
                    <span className="text-sm font-bold text-zinc-700 w-24">{accord.accord.name}</span>
                    <div className="flex-1 h-2 bg-[var(--color-ivory-200)] rounded-full overflow-hidden mx-4">
                      <div 
                        className="h-full bg-[var(--color-champagne-600)] rounded-full" 
                        style={{ width: `${accord.value}%` }}
                      />
                    </div>
                  </div>
                ))}
              </div>
            </div>
          )}
        </div>
      </div>
    </div>
  );
}
