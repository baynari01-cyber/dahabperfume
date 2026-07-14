import { PrismaClient } from '@prisma/client';
import { Pool } from 'pg';
import { PrismaPg } from '@prisma/adapter-pg';

const connectionString = process.env.DATABASE_URL || '';
const pool = new Pool({ connectionString });
const adapter = new PrismaPg(pool);
const prisma = new PrismaClient({ adapter });

async function main() {
  console.log('Seeding dummy categories and products...');

  // Create Categories
  const categoriesData = [
    { name: 'العطور الرجالية (Men)', slug: 'men-perfumes', description: 'عطور رجالية بحضور فخم وثبات يدوم طويلاً.' },
    { name: 'العطور النسائية (Women)', slug: 'women-perfumes', description: 'تركيبات ناعمة وجذابة تناسب كافة المناسبات.' },
    { name: 'عطور العود (Oud)', slug: 'oud-perfumes', description: 'عود، عنبر، مسك وتوابل دافئة بحضور واضح.' },
    { name: 'المجموعة الصيفية (Summer)', slug: 'summer-collection', description: 'انتعاش يدوم طوال اليوم مع أرقى الحمضيات والأزهار.' },
  ];

  const createdCategories = [];
  for (const cat of categoriesData) {
    const category = await prisma.category.upsert({
      where: { slug: cat.slug },
      update: {},
      create: cat,
    });
    createdCategories.push(category);
    console.log(`Upserted category: ${category.name}`);
  }

  // Create Products
  const productsData = [
    {
      nameAr: 'عطر الفارس',
      nameEn: 'Al Fares',
      slug: 'al-fares',
      sku: 'PRD-FARES-01',
      categoryId: createdCategories[0].id,
      shortDescription: 'عطر رجالي كلاسيكي يجمع بين الأخشاب والتوابل.',
      isFeatured: true,
      price: 35000, // 35 JOD
      image: 'local:///product-placeholder.png'
    },
    {
      nameAr: 'عطر الأميرة',
      nameEn: 'Al Ameera',
      slug: 'al-ameera',
      sku: 'PRD-AMEERA-01',
      categoryId: createdCategories[1].id,
      shortDescription: 'عطر نسائي رقيق بنفحات الياسمين والورد.',
      isFeatured: true,
      price: 45000, // 45 JOD
      image: 'local:///product-placeholder.png'
    },
    {
      nameAr: 'عود السلطان',
      nameEn: 'Sultan Oud',
      slug: 'sultan-oud',
      sku: 'PRD-OUD-01',
      categoryId: createdCategories[2].id,
      shortDescription: 'عود ملكي معتق لمناسباتك الفاخرة.',
      isFeatured: true,
      price: 60000, // 60 JOD
      image: 'local:///product-placeholder.png'
    },
    {
      nameAr: 'نسيم البحر',
      nameEn: 'Sea Breeze',
      slug: 'sea-breeze',
      sku: 'PRD-SEA-01',
      categoryId: createdCategories[3].id,
      shortDescription: 'عطر صيفي منعش يمزج بين الحمضيات ونسيم البحر.',
      isFeatured: true,
      price: 25000, // 25 JOD
      image: 'local:///product-placeholder.png'
    }
  ];

  for (const prod of productsData) {
    const product = await prisma.product.upsert({
      where: { slug: prod.slug },
      update: {},
      create: {
        nameAr: prod.nameAr,
        nameEn: prod.nameEn,
        slug: prod.slug,
        sku: prod.sku,
        shortDescription: prod.shortDescription,
        categoryId: prod.categoryId,
        isVisible: true,
        isFeatured: prod.isFeatured,
        stockStatus: 'IN_STOCK',
        variants: {
          create: [
            {
              size: '50ml',
              sku: `${prod.sku}-50`,
              price: prod.price,
              isActive: true,
            },
            {
              size: '100ml',
              sku: `${prod.sku}-100`,
              price: prod.price + 15000, // +15 JOD
              isActive: true,
            }
          ]
        },
        images: {
          create: [
            {
              url: prod.image,
              isMain: true,
              alt: prod.nameAr
            }
          ]
        }
      }
    });
    console.log(`Upserted product: ${product.nameAr}`);
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
