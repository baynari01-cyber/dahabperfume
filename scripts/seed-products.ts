import { prisma } from '../src/lib/db';

async function main() {
  const perfumes = [
    { nameAr: 'عطر ليالي الشرق', nameEn: 'Oriental Nights', sku: 'PERF-001' },
    { nameAr: 'عطر مسك الأصيل', nameEn: 'Authentic Musk', sku: 'PERF-002' },
    { nameAr: 'عطر عود ملكي', nameEn: 'Royal Oud', sku: 'PERF-003' },
    { nameAr: 'عطر زهور الربيع', nameEn: 'Spring Flowers', sku: 'PERF-004' },
    { nameAr: 'عطر همس الجوري', nameEn: 'Whisper of Rose', sku: 'PERF-005' },
  ];

  for (const p of perfumes) {
    const existing = await prisma.product.findUnique({ where: { sku: p.sku } });
    if (!existing) {
      console.log(`Creating product: ${p.nameAr}`);
      await prisma.product.create({
        data: {
          nameAr: p.nameAr,
          nameEn: p.nameEn,
          sku: p.sku,
          slug: p.sku.toLowerCase(),
          shortDescription: `عطر فخم ومميز من دهب للعطور.`,
          categoryId: null,
          imagePath: '/products/premium-perfume.jpg',
          isVisible: true,
          stockLiters: 10.0,
          variants: {
            create: [
              { size: '50ml', sku: `${p.sku}-50`, price: 10000, isActive: true, usesGlobalPricing: true },
              { size: '100ml', sku: `${p.sku}-100`, price: 15000, isActive: true, usesGlobalPricing: true },
              { size: '200ml', sku: `${p.sku}-200`, price: 25000, isActive: true, usesGlobalPricing: true }
            ]
          }
        }
      });
    } else {
      console.log(`Product ${p.sku} already exists, updating variants...`);
      await prisma.product.update({
        where: { sku: p.sku },
        data: {
          imagePath: '/products/premium-perfume.jpg',
          stockLiters: existing.stockLiters < 1 ? 10.0 : existing.stockLiters
        }
      });
      
      const sizes = [
        { size: '50ml', price: 10000 },
        { size: '100ml', price: 15000 },
        { size: '200ml', price: 25000 }
      ];
      
      for (const size of sizes) {
        const variantSku = `${p.sku}-${size.size.replace('ml', '')}`;
        const existingVariant = await prisma.productVariant.findFirst({
          where: { productId: existing.id, size: size.size }
        });
        if (!existingVariant) {
          await prisma.productVariant.create({
            data: {
              productId: existing.id,
              size: size.size,
              sku: variantSku,
              price: size.price,
              isActive: true,
              usesGlobalPricing: true
            }
          });
        }
      }
    }
  }
  console.log('Finished seeding products!');
}

main().catch(console.error).finally(() => process.exit(0));
