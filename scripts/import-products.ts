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
  console.log('Starting product import...');
  const csvPath = path.resolve(process.cwd(), '../source-data/products.csv');
  const fileContent = fs.readFileSync(csvPath, 'utf-8');
  
  const records = parse(fileContent, {
    columns: true,
    skip_empty_lines: true
  }) as any[];

  console.log(`Parsed ${records.length} rows.`);

  const invalidProducts = [];
  const missingImages = [];
  let successCount = 0;

  for (let i = 0; i < records.length; i++) {
    const record = records[i];
    
    // Progress logging
    if ((i + 1) % 50 === 0) {
      console.log(`Processed ${i + 1}/${records.length}`);
    }

    const sku = record['SKU']?.trim();
    if (!sku) {
      invalidProducts.push(`Row ${i + 2}: Missing SKU`);
      continue;
    }

    const nameAr = record['اسم العطر']?.trim();
    if (!nameAr) {
      invalidProducts.push(`Row ${i + 2} (${sku}): Missing Arabic Name`);
      continue;
    }

    const categoryName = record['التصنيف الرئيسي']?.trim() || 'عام';
    const category = await prisma.category.upsert({
      where: { slug: categoryName },
      update: {},
      create: { slug: categoryName, name: categoryName }
    });

    const genderName = record['الجنس']?.trim();
    let gender = null;
    if (genderName) {
      gender = await prisma.gender.upsert({
        where: { name: genderName },
        update: {},
        create: { name: genderName }
      });
    }

    const seasonName = record['الموسم']?.trim();
    let season = null;
    if (seasonName) {
      season = await prisma.season.upsert({
        where: { name: seasonName },
        update: {},
        create: { name: seasonName }
      });
    }

    const familyName = record['العائلة العطرية']?.trim();
    let family = null;
    if (familyName) {
      family = await prisma.fragranceFamily.upsert({
        where: { name: familyName },
        update: {},
        create: { name: familyName }
      });
    }

    // Process Product
    const isVisible = record['ظاهر بالموقع؟'] === 'نعم';
    const isFeatured = record['مميز بالواجهة؟'] === 'نعم';

    const product = await prisma.product.upsert({
      where: { sku },
      update: {
        nameAr,
        nameEn: record['Inspired By']?.trim() || '',
        shortDescription: record['وصف قصير']?.trim(),
        categoryId: category.id,
        genderId: gender?.id,
        seasonId: season?.id,
        familyId: family?.id,
        isVisible,
        isFeatured
      },
      create: {
        sku,
        slug: sku.toLowerCase(),
        nameAr,
        nameEn: record['Inspired By']?.trim() || '',
        shortDescription: record['وصف قصير']?.trim(),
        categoryId: category.id,
        genderId: gender?.id,
        seasonId: season?.id,
        familyId: family?.id,
        isVisible,
        isFeatured
      }
    });

    // Handle Accords
    for (let j = 1; j <= 5; j++) {
      const accordName = record[`البصمة العطرية ${j}`]?.trim();
      const accordValue = parseFloat(record[`قوة البصمة ${j}`] || '0');
      
      if (accordName && accordValue > 0) {
        const accord = await prisma.accord.upsert({
          where: { name: accordName },
          update: {},
          create: { name: accordName }
        });

        await prisma.productAccord.upsert({
          where: {
            productId_accordId: {
              productId: product.id,
              accordId: accord.id
            }
          },
          update: { value: accordValue, order: j },
          create: {
            productId: product.id,
            accordId: accord.id,
            value: accordValue,
            order: j
          }
        });
      }
    }

    // Handle Image
    const imageName = record['اسم الصورة']?.trim();
    if (imageName && imageName !== 'missing') {
      const imagePath = path.resolve(process.cwd(), '../source-data/products', imageName);
      if (fs.existsSync(imagePath)) {
        await prisma.productImage.create({
          data: {
            productId: product.id,
            url: `local://${imageName}`, // Fallback until Supabase is available
            isMain: true
          }
        });
      } else {
        missingImages.push(`Row ${i + 2} (${sku}): File ${imageName} not found`);
      }
    } else {
      missingImages.push(`Row ${i + 2} (${sku}): No image specified`);
    }

    // Handle Pricing & Variants
    const useGlobalPricing = record['يستخدم الأسعار العامة؟'] === 'نعم';
    const prices = {
      '50ml': parseFloat(record['سعر 50ml خاص'] || '0'),
      '100ml': parseFloat(record['سعر 100ml خاص'] || '0'),
      '200ml': parseFloat(record['سعر 200ml خاص'] || '0'),
    };

    const globalPrices = {
      '50ml': 55.0,
      '100ml': 65.0,
      '200ml': 85.0
    };

    for (const size of ['50ml', '100ml', '200ml']) {
      let price = useGlobalPricing ? globalPrices[size as keyof typeof globalPrices] : prices[size as keyof typeof prices];
      if (price > 0) {
        await prisma.productVariant.upsert({
          where: { sku: `${sku}-${size}` },
          update: { price: price * 100, size },
          create: {
            sku: `${sku}-${size}`,
            productId: product.id,
            size,
            price: price * 100,
            stock: parseInt(record['المخزون الكلي'] || '0', 10)
          }
        });
      }
    }

    successCount++;
  }

  // Generate Reports
  const reportsDir = path.join(process.cwd(), 'reports');
  if (!fs.existsSync(reportsDir)) fs.mkdirSync(reportsDir);

  fs.writeFileSync(path.join(reportsDir, 'invalid-products.csv'), invalidProducts.join('\n'));
  fs.writeFileSync(path.join(reportsDir, 'missing-images.csv'), missingImages.join('\n'));
  
  const mdReport = `
# Import Report

- **Total Rows Processed:** ${records.length}
- **Successfully Imported:** ${successCount}
- **Missing Images:** ${missingImages.length}
- **Invalid Products:** ${invalidProducts.length}
- **External Integration:** Pending credentials - Local bypass used

Please check the generated CSV files for details on missing images and errors.
  `.trim();
  fs.writeFileSync(path.join(reportsDir, 'product-import-report.md'), mdReport);

  console.log('Import finished.');
}

main().catch(console.error).finally(() => prisma.$disconnect());
