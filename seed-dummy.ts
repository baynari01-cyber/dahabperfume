import 'dotenv/config';
import { prisma } from './src/lib/db';

async function main() {
  console.log('Seeding dummy categories and products...');

  // 1. Categories
  const oudCat = await prisma.category.upsert({
    where: { slug: 'oud-collection' },
    update: {},
    create: {
      slug: 'oud-collection',
      name: 'مجموعة العود',
      description: 'عطور شرقية فاخرة تعتمد على العود الأصيل.',
      imagePath: 'local://dummy-oud.png'
    }
  });

  const summerCat = await prisma.category.upsert({
    where: { slug: 'summer-collection' },
    update: {},
    create: {
      slug: 'summer-collection',
      name: 'المجموعة الصيفية',
      description: 'روائح منعشة تناسب الأجواء الحارة والحيوية.',
      imagePath: 'local://dummy-summer.png'
    }
  });

  const classicCat = await prisma.category.upsert({
    where: { slug: 'classic-collection' },
    update: {},
    create: {
      slug: 'classic-collection',
      name: 'المجموعة الكلاسيكية',
      description: 'روائح كلاسيكية خالدة تناسب جميع الأوقات.',
      imagePath: 'local://dummy-classic.png'
    }
  });

  // 2. Products
  const productsToCreate = [
    {
      slug: 'royal-oud',
      nameAr: 'عود ملوكي',
      nameEn: 'Royal Oud',
      sku: 'OUD-001',
      categoryId: oudCat.id,
      stockLiters: 5.5,
    },
    {
      slug: 'smoked-oud',
      nameAr: 'عود مبخر',
      nameEn: 'Smoked Oud',
      sku: 'OUD-002',
      categoryId: oudCat.id,
      stockLiters: 3.2,
    },
    {
      slug: 'sea-breeze',
      nameAr: 'نسيم البحر',
      nameEn: 'Sea Breeze',
      sku: 'SUM-001',
      categoryId: summerCat.id,
      stockLiters: 10.0,
    },
    {
      slug: 'fresh-citrus',
      nameAr: 'حمضيات منعشة',
      nameEn: 'Fresh Citrus',
      sku: 'SUM-002',
      categoryId: summerCat.id,
      stockLiters: 8.5,
    },
    {
      slug: 'taif-rose',
      nameAr: 'ورد طائفي',
      nameEn: 'Taif Rose',
      sku: 'CLA-001',
      categoryId: classicCat.id,
      stockLiters: 4.0,
    },
    {
      slug: 'white-musk',
      nameAr: 'مسك أبيض',
      nameEn: 'White Musk',
      sku: 'CLA-002',
      categoryId: classicCat.id,
      stockLiters: 6.5,
    }
  ];

  for (const p of productsToCreate) {
    await prisma.product.upsert({
      where: { sku: p.sku },
      update: {},
      create: {
        slug: p.slug,
        nameAr: p.nameAr,
        nameEn: p.nameEn,
        sku: p.sku,
        categoryId: p.categoryId,
        stockLiters: p.stockLiters,
        isVisible: true,
        variants: {
          create: [
            {
              size: '50ml',
              sku: `${p.sku}-50`,
              price: 15000, // 15 JOD
              isActive: true,
              usesGlobalPricing: true
            },
            {
              size: '100ml',
              sku: `${p.sku}-100`,
              price: 25000, // 25 JOD
              isActive: true,
              usesGlobalPricing: true
            }
          ]
        },
        images: {
          create: [
            {
              url: 'local://placeholder-perfume.png',
              alt: p.nameEn,
              isMain: true,
              order: 0
            }
          ]
        }
      }
    });
  }

  console.log('Seeding completed successfully!');
}

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
