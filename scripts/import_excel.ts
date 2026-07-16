

import { PrismaClient } from '@prisma/client';
import { Pool } from 'pg';
import { PrismaPg } from '@prisma/adapter-pg';
import * as xlsx from 'xlsx';
import * as fs from 'fs';
import * as path from 'path';

// Parse URL and remove pgbouncer if present to avoid local pooling issues
const dbUrl = new URL(process.env.DATABASE_URL || '');
dbUrl.searchParams.delete('pgbouncer');

const pool = new Pool({ 
  connectionString: dbUrl.toString(),
  max: 5,
  idleTimeoutMillis: 30000,
  connectionTimeoutMillis: 10000,
});
const adapter = new PrismaPg(pool);
const prisma = new PrismaClient({ adapter });

const EXCEL_PATH = '/home/moayad/Desktop/main avtivity/c6ac6e8b-eaba-4c64-acbe-2d55aacbb2fe.xlsx';
const SOURCE_IMG_DIR = '/home/moayad/Desktop/main avtivity/DHB-0000';
const TARGET_IMG_DIR = path.join(process.cwd(), 'public', 'uploads', 'products');

async function main() {
  console.log('--- STARTING IMPORT PROCESS ---');

  if (!fs.existsSync(TARGET_IMG_DIR)) {
    fs.mkdirSync(TARGET_IMG_DIR, { recursive: true });
  }

  console.log('Cleaning existing data (TRUNCATE)...');
  await prisma.$executeRawUnsafe(`TRUNCATE TABLE "Product", "Category", "Gender", "Season", "FragranceFamily", "Accord" CASCADE;`);
  console.log('Existing data cleared.');

  console.log('Reading Excel file...');
  if (!fs.existsSync(EXCEL_PATH)) {
    console.error('ERROR: Excel file not found at', EXCEL_PATH);
    process.exit(1);
  }

  const workbook = xlsx.readFile(EXCEL_PATH);
  const sheetName = workbook.SheetNames[0];
  const rows: any[] = xlsx.utils.sheet_to_json(workbook.Sheets[sheetName]);

  console.log(`Found ${rows.length} rows to process.`);

  const categoryMap = new Map<string, string>();
  const genderMap = new Map<string, string>();
  const seasonMap = new Map<string, string>();
  const familyMap = new Map<string, string>();
  const accordMap = new Map<string, string>();

  // Fetch global prices
  let globalPrices = { '50ml': 10000, '100ml': 15000, '200ml': 25000 };
  const settings = await prisma.siteSettings.findUnique({ where: { key: 'global_size_prices' } });
  if (settings) {
    try { globalPrices = JSON.parse(settings.value); } catch(e) {}
  }
  console.log('Using Global Prices:', globalPrices);

  async function getOrCreateCategory(name: string) {
    if (!name) return null;
    let id = categoryMap.get(name);
    if (!id) {
      const slug = name.toLowerCase().replace(/\s+/g, '-');
      const record = await prisma.category.create({ data: { name, slug } });
      id = record.id;
      categoryMap.set(name, id);
    }
    return id;
  }

  async function getOrCreateGender(name: string) {
    if (!name) return null;
    let id = genderMap.get(name);
    if (!id) {
      const record = await prisma.gender.create({ data: { name } });
      id = record.id;
      genderMap.set(name, id);
    }
    return id;
  }

  async function getOrCreateSeason(name: string) {
    if (!name) return null;
    let id = seasonMap.get(name);
    if (!id) {
      const record = await prisma.season.create({ data: { name } });
      id = record.id;
      seasonMap.set(name, id);
    }
    return id;
  }

  async function getOrCreateFamily(name: string) {
    if (!name) return null;
    let id = familyMap.get(name);
    if (!id) {
      const record = await prisma.fragranceFamily.create({ data: { name } });
      id = record.id;
      familyMap.set(name, id);
    }
    return id;
  }

  async function getOrCreateAccord(name: string) {
    if (!name) return null;
    let id = accordMap.get(name);
    if (!id) {
      const record = await prisma.accord.create({ data: { name } });
      id = record.id;
      accordMap.set(name, id);
    }
    return id;
  }

  for (const row of rows) {
    try {
      const sku = String(row['SKU'] || '').trim();
      const nameAr = String(row['اسم العطر'] || '').trim();
      if (!sku || !nameAr) continue;

      console.log(`Processing: ${sku} - ${nameAr}`);

      const categoryId = await getOrCreateCategory(row['التصنيف الرئيسي'] || 'عام');
      const genderId = await getOrCreateGender(row['الجنس']);
      const seasonId = await getOrCreateSeason(row['الموسم']);
      const familyId = await getOrCreateFamily(row['العائلة العطرية']);
      
      const shortDesc = row['وصف قصير'] || null;
      const isVisible = String(row['ظاهر بالموقع؟']) === 'نعم';
      const isFeatured = String(row['مميز بالواجهة؟']) === 'نعم';

      const slug = encodeURIComponent(nameAr.toLowerCase().replace(/\s+/g, '-').replace(/[^a-z0-9\-أ-ي]/g, '') + '-' + sku.toLowerCase());
      
      const product = await prisma.product.create({
        data: {
          sku,
          nameAr,
          nameEn: row['V3 Search Query'] || nameAr,
          slug,
          shortDescription: shortDesc,
          categoryId: categoryId!,
          genderId,
          seasonId,
          familyId,
          isVisible: true,
          isFeatured,
          stockStatus: 'VERIFIED',
          notesStatus: 'VERIFIED',
        }
      });

      for (let i = 1; i <= 5; i++) {
        const accordName = row[`البصمة العطرية ${i}`];
        const accordStrength = row[`قوة البصمة ${i}`];

        if (accordName && accordStrength && !isNaN(parseInt(accordStrength))) {
          const accordId = await getOrCreateAccord(accordName);
          if (accordId) {
            await prisma.productAccord.create({
              data: {
                productId: product.id,
                accordId,
                value: parseInt(accordStrength),
                order: i
              }
            });
          }
        }
      }

      const variantsToCreate = [
        { size: '50ml', price: globalPrices['50ml'] || 10000 },
        { size: '100ml', price: globalPrices['100ml'] || 15000 },
        { size: '200ml', price: globalPrices['200ml'] || 25000 },
      ];

      for (const v of variantsToCreate) {
        await prisma.productVariant.create({
          data: {
            productId: product.id,
            size: v.size,
            sku: `${sku}-${v.size.toUpperCase()}`,
            price: v.price,
            usesGlobalPricing: true,
            isActive: true
          }
        });
      }

      const imageName = row['اسم الصورة'];
      if (imageName) {
        let sourceImagePath = path.join(SOURCE_IMG_DIR, imageName);
        let found = fs.existsSync(sourceImagePath);
        
        if (!found) {
          // Try with .png or .jpg
          const baseName = path.parse(imageName).name;
          const pngPath = path.join(SOURCE_IMG_DIR, baseName + '.png');
          const jpgPath = path.join(SOURCE_IMG_DIR, baseName + '.jpg');
          
          if (fs.existsSync(pngPath)) {
            sourceImagePath = pngPath;
            found = true;
          } else if (fs.existsSync(jpgPath)) {
            sourceImagePath = jpgPath;
            found = true;
          }
        }

        if (found) {
          const ext = path.extname(sourceImagePath);
          const newFileName = `${product.id}${ext}`;
          const destImagePath = path.join(TARGET_IMG_DIR, newFileName);
          
          fs.copyFileSync(sourceImagePath, destImagePath);

          await prisma.productImage.create({
            data: {
              productId: product.id,
              url: `/uploads/products/${newFileName}`,
              isMain: true,
              order: 0
            }
          });
        } else {
          console.warn(`WARNING: Image not found at ${sourceImagePath}`);
        }
      }

    } catch (e) {
      console.error(`Error processing row:`, row, e);
    }
  }

  console.log('--- IMPORT COMPLETED SUCCESSFULLY ---');
}

main().catch(console.error).finally(() => prisma.$disconnect());
