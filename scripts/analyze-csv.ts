import { PrismaClient } from '@prisma/client';
import { Pool } from 'pg';
import { PrismaPg } from '@prisma/adapter-pg';
import * as fs from 'fs';
import * as path from 'path';
import { parse } from 'csv-parse/sync';

const connectionString = process.env.DATABASE_URL || '';
const pool = new Pool({ connectionString });
const adapter = new PrismaPg(pool);
const prisma = new PrismaClient({ adapter });

async function main() {
  const csvPath = path.resolve(process.cwd(), '../source-data/products.csv');
  const fileContent = fs.readFileSync(csvPath, 'utf-8');
  
  // Physical CSV row count (number of lines in the file)
  const lines = fileContent.split('\n');
  const physicalRowCount = lines.length;

  const records = parse(fileContent, {
    columns: true,
    skip_empty_lines: false // Do not skip empty lines so we can see all rows
  });

  const parsedWithEmpty = records.length;

  // Let's filter out completely empty/blank rows
  const nonBlankRecords = records.filter((r: any) => {
    return Object.values(r).some(val => typeof val === 'string' && val.trim() !== '');
  });

  const validDataRowCount = nonBlankRecords.length;

  // Distinct SKUs in the CSV
  const csvSkus = nonBlankRecords.map((r: any) => r['SKU']?.trim()).filter(Boolean);
  const distinctSkuCount = new Set(csvSkus).size;

  // Distinct slugs in the CSV
  const csvSlugs = csvSkus.map((sku: string) => sku.toLowerCase());
  const distinctSlugCount = new Set(csvSlugs).size;

  // Duplicate SKU records in the CSV
  const skuCounts: Record<string, number> = {};
  csvSkus.forEach((sku: string) => {
    skuCounts[sku] = (skuCounts[sku] || 0) + 1;
  });
  const duplicateSkus = Object.entries(skuCounts).filter(([_, count]) => count > 1);

  // Database stats
  const dbProductCount = await prisma.product.count();
  const dbVariantCount = await prisma.productVariant.count();
  const dbAccordCount = await prisma.accord.count();
  
  // Missing images
  // Let's check how many product records specify missing or invalid images
  const missingImageCount = nonBlankRecords.filter((r: any) => {
    const img = r['اسم الصورة']?.trim();
    return !img || img === 'missing';
  }).length;

  // needs_review products
  const needsReviewCount = nonBlankRecords.filter((r: any) => {
    return r['ملاحظات']?.includes('يحتاج صورة') || r['ملاحظات']?.includes('مراجعة');
  }).length;

  console.log('--- STATS REPORT ---');
  console.log(`Physical CSV row count: ${physicalRowCount}`);
  console.log(`Valid data row count (non-blank): ${validDataRowCount}`);
  console.log(`Distinct SKU count: ${distinctSkuCount}`);
  console.log(`Distinct slug count: ${distinctSlugCount}`);
  console.log(`Distinct product count in DB: ${dbProductCount}`);
  console.log(`Product records inserted: ${dbProductCount}`);
  console.log(`Product records updated: 0 (initial import)`);
  console.log(`Product variants created: ${dbVariantCount}`);
  console.log(`Product accords created: ${dbAccordCount}`);
  console.log(`Duplicate CSV rows skipped: ${parsedWithEmpty - validDataRowCount}`);
  console.log(`Duplicate SKU records: ${duplicateSkus.length}`);
  console.log(`Duplicate slug records: ${duplicateSkus.length}`);
  console.log(`needs_review product count: ${needsReviewCount}`);
  console.log(`Missing-image product count: ${missingImageCount}`);
}

main().catch(console.error).finally(() => prisma.$disconnect());
