import * as fs from 'fs';
import * as path from 'path';
import { parse } from 'csv-parse/sync';

async function main() {
  const csvPath = path.resolve(process.cwd(), '../source-data/products.csv');
  const fileContent = fs.readFileSync(csvPath, 'utf-8');
  
  const records = parse(fileContent, {
    columns: true,
    skip_empty_lines: true
  }) as any[];

  // Filter out blank template rows
  const validRecords = records.filter(r => r['SKU']?.trim() && r['اسم العطر']?.trim());

  let missingImageCount = 0;
  let missingStockCount = 0;
  let missingPriceCount = 0;
  let customPriceCount = 0;

  for (const r of validRecords) {
    const notes = r['ملاحظات'] || '';
    if (notes.includes('صورة') || r['اسم الصورة'] === 'missing') {
      missingImageCount++;
    }
    if (notes.includes('مخزون')) {
      missingStockCount++;
    }
    if (notes.includes('سعر خاص') || r['يستخدم الأسعار العامة؟'] === 'لا') {
      customPriceCount++;
    }
  }

  console.log(`Missing image note/status: ${missingImageCount}`);
  console.log(`Missing/unverified stock note: ${missingStockCount}`);
  console.log(`Custom price products: ${customPriceCount}`);
  console.log(`Total valid products: ${validRecords.length}`);
}

main();
