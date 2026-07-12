import { PrismaClient } from '@prisma/client';
import { Pool } from 'pg';
import { PrismaPg } from '@prisma/adapter-pg';

const connectionString = process.env.DATABASE_URL || '';
const pool = new Pool({ connectionString });
const adapter = new PrismaPg(pool);
const prisma = new PrismaClient({ adapter });

async function main() {
  // 1. Accords Verification
  const distinctAccords = await prisma.accord.count();
  const productAccordRelations = await prisma.productAccord.count();
  
  const products = await prisma.product.findMany({
    include: { accords: true, variants: true }
  });

  const productsWithZeroAccords = products.filter(p => p.accords.length === 0).length;
  const productsWithFewerAccords = products.filter(p => p.accords.length > 0 && p.accords.length < 5).length;
  
  // 2. Variants Verification
  const active50ml = await prisma.productVariant.count({ where: { size: '50ml', isActive: true } });
  const active100ml = await prisma.productVariant.count({ where: { size: '100ml', isActive: true } });
  const active200ml = await prisma.productVariant.count({ where: { size: '200ml', isActive: true } });

  // Custom vs Global price products
  // Global price product: uses standard pricing 55, 65, 85
  // We can query this by checking if any variant price matches the custom column or global values
  // But wait, the importer set variants based on CSV fields.
  // Let's count how many variants have custom prices vs global default pricing.
  // In the CSV, we can see if they had 'نعم' for 'يستخدم الأسعار العامة؟'.
  // Since we don't store that flag on Product directly, let's look at the prices.
  const global50mlPrice = 5500;
  const global100mlPrice = 6500;
  const global200mlPrice = 8500;

  let globalPricedCount = 0;
  let customPricedCount = 0;

  for (const p of products) {
    const isGlobal = p.variants.every(v => {
      if (v.size === '50ml') return v.price === global50mlPrice;
      if (v.size === '100ml') return v.price === global100mlPrice;
      if (v.size === '200ml') return v.price === global200mlPrice;
      return false;
    });
    if (isGlobal) {
      globalPricedCount++;
    } else {
      customPricedCount++;
    }
  }

  // 3. needs_review breakdown
  // In our schema, we don't have a needs_review field on Product!
  // Wait! Let's check schema.prisma to see if there is a needs_review field on Product.
  // No, we didn't add needs_review field to Product!
  // In my previous import-products.ts, we did not set any needs_review status in DB. We only printed counts in the report based on Notes containing 'يحتاج صورة'.
  // Let's analyze why they needed review from the CSV notes directly!
  // Let's count how many rows in the CSV have notes containing different check reasons.
  
  console.log('--- RELATIONSHIP AND ACCORD STATS ---');
  console.log(`Distinct Accord dictionary records: ${distinctAccords}`);
  console.log(`ProductAccord relationship records: ${productAccordRelations}`);
  console.log(`Products with zero accords: ${productsWithZeroAccords}`);
  console.log(`Products with fewer than 5 accords: ${productsWithFewerAccords}`);
  
  console.log('\n--- VARIANT STATS ---');
  console.log(`Active 50ml variants in DB: ${active50ml}`);
  console.log(`Active 100ml variants in DB: ${active100ml}`);
  console.log(`Active 200ml variants in DB: ${active200ml}`);
  console.log(`Global-priced products count: ${globalPricedCount}`);
  console.log(`Custom-priced products count: ${customPricedCount}`);
}

main().catch(console.error).finally(() => prisma.$disconnect());
