import React from 'react';
import Link from 'next/link';
import { prisma } from '@/lib/db';

export default async function CollectionsPage({ params }: { params: Promise<{ locale: string }> }) {
  const resolvedParams = await params;
  const locale = resolvedParams.locale;
  const isAr = locale === 'ar';

  const collections = await prisma.collection.findMany();

  return (
    <div className="container mx-auto px-6 py-16 bg-[var(--color-ivory-100)] min-h-screen">
      <div className="text-center mb-16">
        <h1 className="text-4xl font-bold font-heading text-[var(--color-forest-900)] mb-4">
          {isAr ? 'المجموعات العطرية' : 'Fragrance Collections'}
        </h1>
        <div className="w-24 h-1 bg-[var(--color-champagne-600)] mx-auto" />
      </div>

      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
        {collections.map((col) => (
          <Link 
            key={col.id} 
            href={`/${locale}/collections/${col.slug}`} 
            className="group relative h-96 bg-[var(--color-forest-900)] rounded-lg overflow-hidden border border-[var(--color-ivory-200)] shadow-sm hover:shadow-md transition-shadow"
          >
            <div className="absolute inset-0 bg-black/40 group-hover:bg-black/30 transition-colors z-10" />
            
            {col.image && (
              <div 
                className="absolute inset-0 bg-cover bg-center group-hover:scale-105 transition-transform duration-500 z-0" 
                style={{ backgroundImage: `url(${col.image})` }} 
              />
            )}
            
            <div className="absolute inset-0 flex flex-col justify-end p-8 z-20">
              <h2 className="text-2xl font-bold text-[var(--color-champagne-400)] mb-2 group-hover:text-white transition-colors">
                {col.name}
              </h2>
              {col.description && (
                <p className="text-zinc-200 text-sm line-clamp-2">
                  {col.description}
                </p>
              )}
            </div>
          </Link>
        ))}

        {collections.length === 0 && (
          <div className="col-span-full text-center py-20 bg-white rounded-lg border border-[var(--color-ivory-200)]">
            <p className="text-xl text-zinc-500 mb-4">
              {isAr ? 'لا توجد مجموعات حالياً.' : 'No collections available right now.'}
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
