import fs from 'fs';
import path from 'path';
import { parse } from 'csv-parse';
import { prisma } from '../src/lib/db';
import crypto from 'crypto';

const CSV_PATH = '/home/moayad/Desktop/main avtivity/source-data/products.csv';
const IMAGES_DIR = '/home/moayad/Desktop/main avtivity/source-data/products';
const PUBLIC_UPLOADS = path.join(process.cwd(), 'public', 'uploads');

const globalPrices = {
  '50ml': 10000,
  '100ml': 15000,
  '200ml': 25000,
};

function generateSlug(text: string): string {
  return text.trim().toLowerCase().replace(/\s+/g, '-').replace(/[^\w-]/g, '') + '-' + crypto.randomBytes(2).toString('hex');
}

async function main() {
  if (!fs.existsSync(PUBLIC_UPLOADS)) {
    fs.mkdirSync(PUBLIC_UPLOADS, { recursive: true });
  }

  const parser = fs.createReadStream(CSV_PATH).pipe(
    parse({
      columns: true,
      skip_empty_lines: true,
      trim: true,
    })
  );

  let successCount = 0;
  let errorCount = 0;

  for await (const row of parser) {
    try {
      const sku = row['SKU'];
      if (!sku) continue;

      const nameAr = row['اسم العطر'];
      const nameEn = row['Inspired By'] || nameAr;
      const categoryName = row['التصنيف الرئيسي'] || 'عام';
      const genderName = row['الجنس'];
      const seasonName = row['الموسم'];
      const familyName = row['العائلة العطرية'];
      const shortDesc = row['وصف قصير'];
      
      const stockLiters = parseFloat(row['المخزون الكلي']) || 1.0;
      const isVisible = row['ظاهر بالموقع؟'] === 'نعم';
      
      const usesGlobal = row['يستخدم الأسعار العامة؟'] === 'نعم';
      const price50 = parseFloat(row['سعر 50ml خاص']);
      const price100 = parseFloat(row['سعر 100ml خاص']);
      const price200 = parseFloat(row['سعر 200ml خاص']);
      
      const imageName = row['اسم الصورة'];

      // Upsert Category
      const category = await prisma.category.upsert({
        where: { slug: generateSlug(categoryName) }, // Assuming slug might not exist, but let's just find first then create to avoid slug collisions if we don't have unique names mapped
        update: {},
        create: {
          name: categoryName,
          slug: generateSlug(categoryName)
        }
      });
      // Better to findFirst and then create to avoid slug unique constraint issues on upsert if we regenerate a random slug each time
      // Let's do it safely
      let cat = await prisma.category.findFirst({ where: { name: categoryName } });
      if (!cat) {
        cat = await prisma.category.create({ data: { name: categoryName, slug: generateSlug(categoryName) } });
      }

      let gen = null;
      if (genderName) {
        gen = await prisma.gender.findFirst({ where: { name: genderName } });
        if (!gen) gen = await prisma.gender.create({ data: { name: genderName } });
      }

      let sea = null;
      if (seasonName) {
        sea = await prisma.season.findFirst({ where: { name: seasonName } });
        if (!sea) sea = await prisma.season.create({ data: { name: seasonName } });
      }

      let fam = null;
      if (familyName) {
        // Just take the first part if it's comma separated
        const mainFamily = familyName.split('،')[0].trim();
        fam = await prisma.fragranceFamily.findFirst({ where: { name: mainFamily } });
        if (!fam) fam = await prisma.fragranceFamily.create({ data: { name: mainFamily } });
      }

      const product = await prisma.product.upsert({
        where: { sku },
        update: {
          nameAr,
          nameEn,
          shortDescription: shortDesc,
          categoryId: cat.id,
          genderId: gen?.id,
          seasonId: sea?.id,
          familyId: fam?.id,
          stockLiters,
          isVisible,
        },
        create: {
          sku,
          nameAr,
          nameEn,
          slug: generateSlug(nameEn),
          shortDescription: shortDesc,
          categoryId: cat.id,
          genderId: gen?.id,
          seasonId: sea?.id,
          familyId: fam?.id,
          stockLiters,
          isVisible,
        }
      });

      // Handle Image
      if (imageName && imageName !== 'missing') {
        const sourceImg = path.join(IMAGES_DIR, imageName);
        if (fs.existsSync(sourceImg)) {
          const targetImg = path.join(PUBLIC_UPLOADS, imageName);
          fs.copyFileSync(sourceImg, targetImg);
          
          const existingImage = await prisma.productImage.findFirst({
            where: { productId: product.id, url: `/uploads/${imageName}` }
          });
          
          if (!existingImage) {
            // Delete old main images if we want only one, or just add
            await prisma.productImage.updateMany({
              where: { productId: product.id },
              data: { isMain: false }
            });
            
            await prisma.productImage.create({
              data: {
                productId: product.id,
                url: `/uploads/${imageName}`,
                isMain: true
              }
            });
          }
        }
      }

      // Handle Variants
      const sizes = [
        { size: '50ml', priceFils: usesGlobal ? globalPrices['50ml'] : (price50 ? price50 * 1000 : globalPrices['50ml']) },
        { size: '100ml', priceFils: usesGlobal ? globalPrices['100ml'] : (price100 ? price100 * 1000 : globalPrices['100ml']) },
        { size: '200ml', priceFils: usesGlobal ? globalPrices['200ml'] : (price200 ? price200 * 1000 : globalPrices['200ml']) }
      ];

      for (const v of sizes) {
        const variantSku = `${sku}-${v.size.replace('ml', '')}`;
        await prisma.productVariant.upsert({
          where: { sku: variantSku },
          update: {
            price: v.priceFils,
            usesGlobalPricing: usesGlobal,
            size: v.size
          },
          create: {
            productId: product.id,
            sku: variantSku,
            size: v.size,
            price: v.priceFils,
            usesGlobalPricing: usesGlobal
          }
        });
      }

      console.log(`[SUCCESS] Imported ${sku}`);
      successCount++;
    } catch (err) {
      console.error(`[ERROR] Failed to import row`, err);
      errorCount++;
    }
  }

  console.log(`\nImport Completed!`);
  console.log(`Success: ${successCount}`);
  console.log(`Errors: ${errorCount}`);
  await prisma.$disconnect();
}

main()
  .then(() => process.exit(0))
  .catch((e) => {
    console.error(e);
    process.exit(1);
  });
