import React from 'react';
import { prisma } from '@/lib/db';
import Link from 'next/link';
import Image from 'next/image';

export default async function CollectionsPage({ params }: { params: Promise<{ locale: string }> }) {
  const resolvedParams = await params;
  const locale = resolvedParams.locale;
  const isAr = locale === 'ar';

  const collections = await prisma.category.findMany({
    include: {
      _count: { select: { products: true } }
    }
  });

  return (
    <div className="bg-[var(--color-ivory-100)] min-h-screen pb-20">
      {/* Header Banner */}
      <div className="bg-[var(--color-forest-900)] text-white py-16 text-center border-b-4 border-[var(--color-champagne-600)] relative overflow-hidden">
        <div className="absolute inset-0 bg-[url('/pattern.png')] opacity-10 bg-repeat" />
        <div className="relative z-10">
          <h1 className="text-4xl md:text-5xl font-bold font-heading mb-4">
            {isAr ? 'المجموعات العطرية' : 'Our Collections'}
          </h1>
          <p className="text-zinc-300 text-lg max-w-2xl mx-auto">
            {isAr 
              ? 'اكتشف مجموعاتنا الحصرية المصممة لتناسب كل حالة مزاجية ومناسبة.' 
              : 'Discover our exclusive collections tailored for every mood and occasion.'}
          </p>
        </div>
      </div>

      <div className="container mx-auto px-6 mt-16">
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8 max-w-6xl mx-auto">
          {collections.map((collection) => (
            <Link 
              href={`/${locale}/shop?category=${collection.id}`} 
              key={collection.id} 
              className="group block relative overflow-hidden rounded-2xl shadow-sm hover:shadow-xl transition-all duration-500 bg-white border border-[var(--color-ivory-200)]"
            >
              <div className="aspect-[4/3] w-full relative bg-zinc-100 overflow-hidden">
                {collection.imagePath ? (
                  <Image 
                    src={collection.imagePath.startsWith('local://') ? '/product-placeholder.png' : collection.imagePath} 
                    alt={collection.name} 
                    fill 
                    className="object-cover transition-transform duration-700 group-hover:scale-110" 
                  />
                ) : (
                  <div className="w-full h-full flex items-center justify-center bg-zinc-100">
                    <span className="text-zinc-400 font-heading text-lg">دهب للعطور</span>
                  </div>
                )}
                {/* Gradient Overlay */}
                <div className="absolute inset-0 bg-gradient-to-t from-[var(--color-forest-900)] via-[var(--color-forest-900)]/20 to-transparent transition-opacity duration-300 opacity-90 group-hover:opacity-100" />
              </div>
              
              <div className="absolute bottom-0 left-0 w-full p-8 text-white transform transition-transform duration-500 translate-y-4 group-hover:translate-y-0">
                <h3 className="text-3xl font-bold font-heading mb-2 drop-shadow-md">{collection.name}</h3>
                
                {collection.description && (
                  <p className="text-zinc-300 text-sm mb-4 line-clamp-2 opacity-0 group-hover:opacity-100 transition-opacity duration-500 delay-100">
                    {collection.description}
                  </p>
                )}

                <div className="flex items-center justify-between opacity-0 group-hover:opacity-100 transition-opacity duration-500 delay-200">
                  <p className="text-[var(--color-champagne-400)] font-bold">
                    {collection._count.products} {isAr ? 'عطور' : 'Perfumes'}
                  </p>
                  <span className="bg-[var(--color-champagne-600)] text-[var(--color-forest-900)] p-2 rounded-full transform group-hover:rotate-45 transition-transform duration-300">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="3" strokeLinecap="round" strokeLinejoin="round"><path d="M5 12h14"/><path d="m12 5 7 7-7 7"/></svg>
                  </span>
                </div>
              </div>
            </Link>
          ))}
        </div>
        
        {collections.length === 0 && (
          <div className="text-center py-20 text-zinc-500">
            {isAr ? 'لا توجد مجموعات متاحة حالياً.' : 'No collections available at the moment.'}
          </div>
        )}
      </div>
    </div>
  );
}
