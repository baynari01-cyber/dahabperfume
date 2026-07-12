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

  const validRecords = records.filter(r => r['SKU']?.trim() && r['اسم العطر']?.trim());

  console.log('Record 1 columns and values:');
  const r = validRecords[0];
  for (const [k, v] of Object.entries(r)) {
    console.log(`- ${k}: "${v}"`);
  }
}

main();
