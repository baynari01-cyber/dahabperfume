import { PrismaClient } from '@prisma/client';
import { Pool } from 'pg';
import { PrismaPg } from '@prisma/adapter-pg';
import * as fs from 'fs';
import * as path from 'path';

const dbUrl = new URL(process.env.DATABASE_URL || '');
dbUrl.searchParams.delete('pgbouncer');

const pool = new Pool({ connectionString: dbUrl.toString() });
const adapter = new PrismaPg(pool);
const prisma = new PrismaClient({ adapter });

async function main() {
  const productsWithoutImages = await prisma.product.count({
    where: { images: { none: {} } }
  });
  console.log(`Products entirely without images: ${productsWithoutImages}`);

  const allImages = await prisma.productImage.findMany({
    include: { product: { select: { sku: true, nameAr: true } } }
  });
  
  let brokenLinks = 0;
  for (const img of allImages) {
    // The DB stores url like '/uploads/products/filename.webp'
    const absolutePath = path.join(process.cwd(), 'public', img.url);
    if (!fs.existsSync(absolutePath)) {
      console.log(`BROKEN LINK: Product ${img.product.sku} (${img.product.nameAr}) - Missing file: ${absolutePath}`);
      brokenLinks++;
    }
  }
  
  console.log(`Total images in DB: ${allImages.length}`);
  console.log(`Total broken links: ${brokenLinks}`);
}
main().finally(() => prisma.$disconnect());
