import { prisma } from '@/lib/db';
import Link from 'next/link';
import { filsToDisplay } from '@/lib/money';
import { ShopFilters } from '@/components/ShopFilters';
import { MobileCategoriesFeed } from '@/components/MobileCategoriesFeed';
import { PaginatedProductGrid } from '@/components/PaginatedProductGrid';
import type { Metadata } from 'next';

export const revalidate = 60;

const BASE_URL = 'https://dahabperfumes.com';

export async function generateMetadata({ params }: { params: Promise<{ locale: string }> }): Promise<Metadata> {
  const { locale } = await params;
  const isAr = locale === 'ar';
  return {
    title: isAr ? 'المتجر | دهب للعطور' : 'Shop | Dahab Perfumes',
    description: isAr
      ? 'تصفح تشكيلتنا الكاملة من العطور الشرقية الفاخرة. اكتشف العود والمسك والبخور وعطور رجالية ونسائية مميزة في دهب للعطور عمّان.'
      : 'Browse our full collection of luxury oriental fragrances. Discover oud, musk, incense and exclusive perfumes at Dahab Perfumes Amman.',
    alternates: {
      canonical: `${BASE_URL}/${locale}/shop`,
      languages: { ar: `${BASE_URL}/ar/shop`, en: `${BASE_URL}/en/shop` },
    },
    openGraph: {
      title: isAr ? 'متجر دهب للعطور' : 'Dahab Perfumes Shop',
      description: isAr ? 'عطور شرقية فاخرة من قلب عمّان' : 'Luxury oriental fragrances from Amman',
      url: `${BASE_URL}/${locale}/shop`,
      locale: isAr ? 'ar_JO' : 'en_US',
    },
  };
}

export default async function ShopPage({ params, searchParams }: { params: Promise<{ locale: string }>, searchParams: Promise<{ [key: string]: string | string[] | undefined }> }) {
  const { locale } = await params;
  const sp = await searchParams;
  
  const q = typeof sp.q === 'string' ? sp.q : '';
  const categoryStr = typeof sp.category === 'string' ? sp.category : '';
  const genderStr = typeof sp.gender === 'string' ? sp.gender : '';
  const familyStr = typeof sp.family === 'string' ? sp.family : '';
  
  // Build prisma where clause
  const where: any = { isVisible: true };
  
  if (categoryStr) {
    where.categoryId = categoryStr;
  }

  if (genderStr) {
    where.genderId = genderStr;
  }

  if (familyStr) {
    where.familyId = familyStr;
  }
  
  if (q) {
    where.OR = [
      { nameAr: { contains: q } },
      { nameEn: { contains: q } }
    ];
  }

  const [products, totalCount] = await Promise.all([
    prisma.product.findMany({
      where,
      take: 40,
      skip: 0,
      include: {
        variants: { orderBy: { size: 'asc' } },
        images: { orderBy: { order: 'asc' } },
        category: true,
      },
      orderBy: { createdAt: 'desc' }
    }),
    prisma.product.count({ where })
  ]);

  const categories = await prisma.category.findMany();
  const genders = await prisma.gender.findMany();
  const families = await prisma.fragranceFamily.findMany();

  // Group filtered products by category for the mobile feed
  const categoriesMap = new Map();
  for (const product of products) {
    if (!categoriesMap.has(product.categoryId)) {
      categoriesMap.set(product.categoryId, {
        id: product.categoryId,
        name: product.category.name,
        slug: product.category.slug,
        products: []
      });
    }
    categoriesMap.get(product.categoryId).products.push(product);
  }
  const groupedCategories = Array.from(categoriesMap.values());

  return (
    <div className="bg-[var(--color-ivory-100)] min-h-screen pb-20">
      {/* Header Banner */}
      <div className="bg-[var(--color-charcoal-900)] text-white py-16 text-center border-b-4 border-[var(--color-champagne-600)]">
        <h1 className="text-4xl md:text-5xl font-bold font-heading mb-4">المتجر</h1>
        <p className="text-zinc-300 text-lg">اكتشف تشكيلتنا الحصرية من العطور الفاخرة</p>
      </div>

      <div className="container mx-auto px-6 mt-8 flex flex-col gap-6">
        
        {/* Inline Top Filters */}
        <div className="mb-12">
          <ShopFilters 
            categories={categories} 
            genders={genders}
            families={families}
            initialCategory={categoryStr}
            initialGender={genderStr}
            initialFamily={familyStr}
          />
        </div>

        {/* Product Grid */}
        <main className="w-full overflow-hidden">
          {/* Mobile Specific: Categories Feed */}
          <div className="md:hidden">
            <MobileCategoriesFeed categories={groupedCategories} locale={locale} isAr={locale === 'ar'} />
            
            {products.length === 0 && (
              <div className="text-center py-20">
                <p className="text-xl text-zinc-500">لا توجد منتجات حالياً.</p>
              </div>
            )}
          </div>

          {/* Desktop Specific: Flat Grid with Pagination */}
          <div className="hidden md:block">
            <PaginatedProductGrid 
              initialProducts={products}
              totalCount={totalCount}
              locale={locale}
              filters={{ categoryId: categoryStr, genderId: genderStr, familyId: familyStr, q }}
            />
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
