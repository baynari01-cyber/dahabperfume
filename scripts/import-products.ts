import fs from 'fs';
import path from 'path';
import Papa from 'papaparse';
import { PrismaClient, Gender, Season, MovementType } from '@prisma/client';
import { Pool } from 'pg';
import { PrismaPg } from '@prisma/adapter-pg';
import { createClient } from '@supabase/supabase-js';

const connectionString = process.env.DATABASE_URL || '';
const pool = new Pool({ connectionString });
const adapter = new PrismaPg(pool);
const prisma = new PrismaClient({ adapter });

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL || '';
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY || '';

const supabase = supabaseUrl && supabaseKey ? createClient(supabaseUrl, supabaseKey) : null;

// File paths
const CSV_PATH = path.resolve(process.cwd(), '../source-data/products.csv');
const IMAGES_DIR = path.resolve(process.cwd(), '../source-data/products');
const REPORTS_DIR = path.resolve(process.cwd(), 'reports');

interface CsvRow {
  'SKU': string;
  'اسم العطر': string;
  'Inspired By': string;
  'التصنيف الرئيسي': string;
  'الجنس': string;
  'الموسم': string;
  'العائلة العطرية': string;
  'البصمة العطرية 1': string;
  'قوة البصمة 1': string;
  'البصمة العطرية 2': string;
  'قوة البصمة 2': string;
  'البصمة العطرية 3': string;
  'قوة البصمة 3': string;
  'البصمة العطرية 4': string;
  'قوة البصمة 4': string;
  'البصمة العطرية 5': string;
  'قوة البصمة 5': string;
  'الكلمات المفتاحية': string;
  'المخزون الكلي': string;
  'حد تنبيه المخزون': string;
  'يستخدم الأسعار العامة؟': string;
  'سعر 50ml خاص': string;
  'سعر 100ml خاص': string;
  'سعر 200ml خاص': string;
  'اسم الصورة': string;
  'ظاهر بالموقع؟': string;
  'مميز بالواجهة؟': string;
  'وصف قصير': string;
  'ملاحظات': string;
}

const mapGender = (val: string): Gender => {
  if (val.includes('رجالي')) return Gender.MALE;
  if (val.includes('نسائي')) return Gender.FEMALE;
  return Gender.UNISEX;
};

const mapSeason = (val: string): Season => {
  if (val.includes('صيفي')) return Season.SUMMER;
  if (val.includes('شتوي')) return Season.WINTER;
  return Season.ALL_SEASONS;
};

async function main() {
  console.log('Starting product import...');
  if (!fs.existsSync(CSV_PATH)) {
    throw new Error(`CSV not found at ${CSV_PATH}`);
  }
  
  if (!fs.existsSync(REPORTS_DIR)) {
    fs.mkdirSync(REPORTS_DIR, { recursive: true });
  }

  const csvContent = fs.readFileSync(CSV_PATH, 'utf-8');
  const parsed = Papa.parse<CsvRow>(csvContent, { header: true, skipEmptyLines: true });
  
  const rows = parsed.data;
  console.log(`Parsed ${rows.length} rows.`);

  const missingImages: string[] = [];
  const invalidProducts: string[] = [];
  let processedCount = 0;

  for (const [index, row] of rows.entries()) {
    const rowNum = index + 2; // header + 1-index
    try {
      const sku = row['SKU']?.trim();
      if (!sku) {
        invalidProducts.push(`Row ${rowNum}: Missing SKU`);
        continue;
      }

      const nameAr = row['اسم العطر']?.trim() || `Product ${sku}`;
      const slug = nameAr.toLowerCase().replace(/\s+/g, '-').replace(/[^a-z0-9\u0600-\u06FF-]/g, '') + '-' + sku.toLowerCase();
      
      const categoryName = row['التصنيف الرئيسي']?.trim() || 'عام';
      const category = await prisma.category.upsert({
        where: { name: categoryName },
        update: {},
        create: { name: categoryName, slug: categoryName.replace(/\s+/g, '-') }
      });

      const isVisible = row['ظاهر بالموقع؟']?.trim() === 'نعم';
      const isFeatured = row['مميز بالواجهة؟']?.trim() === 'نعم';
      const useGlobalPricing = row['يستخدم الأسعار العامة؟']?.trim() !== 'لا';
      const needsReview = !!row['ملاحظات']?.includes('مراجعة');
      
      let imageUrl = '';
      const csvImageName = row['اسم الصورة']?.trim();
      const imagePath1 = csvImageName ? path.join(IMAGES_DIR, csvImageName) : null;
      const imagePath2 = path.join(IMAGES_DIR, `${sku}.webp`);
      
      let targetImagePath: string | null = null;
      if (imagePath1 && fs.existsSync(imagePath1)) {
        targetImagePath = imagePath1;
      } else if (fs.existsSync(imagePath2)) {
        targetImagePath = imagePath2;
      } else {
        missingImages.push(sku);
      }

      // Upload image to Supabase Storage if available
      if (targetImagePath && supabase) {
        const fileData = fs.readFileSync(targetImagePath);
        const objectName = `products/${sku}-${path.basename(targetImagePath)}`;
        
        // Skip upload if already exists
        const { data: listData } = await supabase.storage.from('public-media').list('products', { search: `${sku}-` });
        if (!listData || listData.length === 0) {
          const { data, error } = await supabase.storage.from('public-media').upload(objectName, fileData, {
            contentType: 'image/webp',
            upsert: true
          });
          if (error) {
            console.error(`Supabase upload failed for ${sku}:`, error);
          } else if (data) {
            imageUrl = data.path;
          }
        } else {
           imageUrl = `products/${listData[0].name}`;
        }
      } else if (targetImagePath) {
         // Local simulation fallback
         imageUrl = `local://images/${path.basename(targetImagePath)}`;
      }

      const product = await prisma.product.upsert({
        where: { sku },
        update: {
          nameAr,
          categoryId: category.id,
          gender: mapGender(row['الجنس']),
          season: mapSeason(row['الموسم']),
          family: row['العائلة العطرية']?.trim() || '',
          keywords: row['الكلمات المفتاحية']?.trim() || '',
          shortDescription: row['وصف قصير']?.trim() || '',
          adminNotes: row['ملاحظات']?.trim() || '',
          isVisible: targetImagePath ? isVisible : false,
          isFeatured,
          useGlobalPricing,
          needsReview,
        },
        create: {
          sku,
          slug,
          nameAr,
          categoryId: category.id,
          gender: mapGender(row['الجنس']),
          season: mapSeason(row['الموسم']),
          family: row['العائلة العطرية']?.trim() || '',
          keywords: row['الكلمات المفتاحية']?.trim() || '',
          shortDescription: row['وصف قصير']?.trim() || '',
          adminNotes: row['ملاحظات']?.trim() || '',
          isVisible: targetImagePath ? isVisible : false,
          isFeatured,
          useGlobalPricing,
          needsReview,
        }
      });

      // Handle Accords
      const accords = [];
      for (let i = 1; i <= 5; i++) {
        const accordName = row[`البصمة العطرية ${i}` as keyof CsvRow]?.trim();
        const accordValue = parseFloat(row[`قوة البصمة ${i}` as keyof CsvRow]?.trim() || '0');
        if (accordName && accordValue) {
          accords.push({
            productId: product.id,
            name: accordName,
            value: accordValue,
            order: i
          });
        }
      }

      if (accords.length > 0) {
        await prisma.productAccord.deleteMany({ where: { productId: product.id } });
        await prisma.productAccord.createMany({ data: accords });
      }

      // Handle Variants
      const variants = [
        { size: '50ml', priceCol: 'سعر 50ml خاص' },
        { size: '100ml', priceCol: 'سعر 100ml خاص' },
        { size: '200ml', priceCol: 'سعر 200ml خاص' }
      ];

      for (const v of variants) {
        const priceStr = row[v.priceCol as keyof CsvRow]?.trim();
        if (priceStr && !isNaN(parseFloat(priceStr))) {
          const minorPrice = Math.round(parseFloat(priceStr) * 100);
          await prisma.productVariant.upsert({
            where: { productId_size: { productId: product.id, size: v.size } },
            update: { price: minorPrice },
            create: { productId: product.id, size: v.size, price: minorPrice }
          });
        }
      }

      // Initial Stock
      const stockStr = row['المخزون الكلي']?.trim();
      if (stockStr && !isNaN(parseInt(stockStr))) {
        // Find existing to make it idempotent
        const existingStock = await prisma.inventoryMovement.findFirst({
           where: { productId: product.id, type: MovementType.STOCK_IN, reason: 'Initial Import' }
        });
        if (!existingStock) {
           // We need an employee to assign this to, we will skip or create a system user
           const sysAdmin = await prisma.employee.findFirst({ where: { email: 'system@dahab.local' } });
           if (sysAdmin) {
             await prisma.inventoryMovement.create({
               data: {
                 productId: product.id,
                 type: MovementType.STOCK_IN,
                 quantity: parseInt(stockStr),
                 reason: 'Initial Import',
                 actorId: sysAdmin.id
               }
             });
           }
        }
      }

      // Handle Image
      if (imageUrl) {
        await prisma.productImage.deleteMany({ where: { productId: product.id } });
        await prisma.productImage.create({
          data: {
            productId: product.id,
            url: imageUrl,
            isMain: true,
            order: 1
          }
        });
      }

      processedCount++;
      if (processedCount % 50 === 0) {
         console.log(`Processed ${processedCount}/${rows.length}`);
      }

    } catch (err: any) {
      console.error(`Error processing row ${rowNum} (${row['SKU']}): ${err.message}`);
      invalidProducts.push(`Row ${rowNum}: ${err.message}`);
    }
  }

  // Generate Reports
  fs.writeFileSync(path.join(REPORTS_DIR, 'missing-images.csv'), missingImages.join('\n'));
  fs.writeFileSync(path.join(REPORTS_DIR, 'invalid-products.csv'), invalidProducts.join('\n'));
  
  const report = {
    totalRows: rows.length,
    processed: processedCount,
    missingImagesCount: missingImages.length,
    invalidCount: invalidProducts.length,
    timestamp: new Date().toISOString(),
    supabaseConnected: !!supabase
  };

  fs.writeFileSync(path.join(REPORTS_DIR, 'product-import-report.json'), JSON.stringify(report, null, 2));
  
  const mdReport = `
# Import Report

- **Total Rows Processed:** ${report.totalRows}
- **Successfully Imported:** ${report.processed}
- **Missing Images:** ${report.missingImagesCount}
- **Invalid Products:** ${report.invalidCount}
- **External Integration:** ${report.supabaseConnected ? 'Supabase Storage Online' : 'Pending credentials - Local bypass used'}

Please check the generated CSV files for details on missing images and errors.
`;
  fs.writeFileSync(path.join(REPORTS_DIR, 'product-import-report.md'), mdReport);
  console.log('Import finished.');
}

main().catch(console.error).finally(async () => {
  await prisma.$disconnect();
});
