import React from 'react';
import Link from 'next/link';
import { prisma } from '@/lib/db';
import { notFound } from 'next/navigation';

export default async function CollectionDetailPage({
  params
}: {
  params: Promise<{ locale: string; slug: string }>
}) {
  const resolvedParams = await params;
  const locale = resolvedParams.locale;
  const slug = resolvedParams.slug;
  const isAr = locale === 'ar';

  const collection = await prisma.collection.findUnique({
    where: { slug },
    include: {
      products: {
        where: { isVisible: true },
        include: {
          variants: { orderBy: { size: 'asc' } },
          images: { orderBy: { order: 'asc' } }
        }
      }
    }
  });

  if (!collection) {
    notFound();
  }

  return (
    <div className="container mx-auto px-6 py-16 bg-[var(--color-ivory-100)] min-h-screen">
      <div className="text-center mb-16">
        <span className="text-sm font-bold text-[var(--color-champagne-600)] uppercase tracking-wider">
          {isAr ? 'المجموعة العطرية' : 'Fragrance Collection'}
        </span>
        <h1 className="text-4xl font-bold font-heading text-[var(--color-forest-900)] mt-2 mb-4">
          {collection.name}
        </h1>
        {collection.description && (
          <p className="text-zinc-600 max-w-xl mx-auto mb-6">
            {collection.description}
          </p>
        )}
        <div className="w-24 h-1 bg-[var(--color-champagne-600)] mx-auto" />
      </div>

      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-8">
        {collection.products.map((product) => {
          const mainImage = product.images.find(img => img.isMain) || product.images[0];
          const lowestPrice = product.variants.length > 0
            ? Math.min(...product.variants.map(v => v.price))
            : 0;

          return (
            <Link 
              key={product.id} 
              href={`/${locale}/products/${product.slug}`} 
              className="group bg-white rounded-lg shadow-sm hover:shadow-md transition-all duration-300 p-4 border border-[var(--color-ivory-200)] flex flex-col h-full hover:border-[var(--color-champagne-600)]"
            >
              <div className="relative aspect-square w-full bg-[var(--color-ivory-200)] rounded-md mb-4 overflow-hidden">
                <div className="absolute inset-0 flex items-center justify-center text-[var(--color-forest-600)]">
                  {mainImage ? (
                    <div 
                      className="w-full h-full bg-cover bg-center group-hover:scale-105 transition-transform duration-500" 
                      style={{ backgroundImage: `url(${mainImage.url.startsWith('local://') ? '/product-placeholder.png' : mainImage.url})` }} 
                    />
                  ) : 'صورة العطر'}
                </div>
              </div>
              
              <div className="text-center flex-1 flex flex-col">
                <h3 className="text-lg font-bold text-[var(--color-forest-900)] mb-1 group-hover:text-[var(--color-champagne-600)] transition-colors">
                  {product.nameAr}
                </h3>
                <div className="mt-auto text-[var(--color-champagne-600)] font-bold text-lg">
                  {lowestPrice > 0 ? `${(lowestPrice / 100).toFixed(2)} د.أ` : 'نفذت الكمية'}
                </div>
              </div>
            </Link>
          );
        })}

        {collection.products.length === 0 && (
          <div className="col-span-full text-center py-20 bg-white rounded-lg border border-[var(--color-ivory-200)]">
            <p className="text-xl text-zinc-500 mb-4">
              {isAr ? 'لا توجد منتجات في هذه المجموعة حالياً.' : 'No products in this collection yet.'}
            </p>
            <Link 
              href={`/${locale}/shop`}
              className="inline-block bg-[var(--color-forest-900)] text-white px-6 py-3 rounded font-bold"
            >
              {isAr ? 'تصفح المتجر' : 'Browse Shop'}
            </Link>
          </div>
        )}
      </div>
    </div>
  );
}
