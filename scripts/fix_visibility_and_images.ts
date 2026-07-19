import { PrismaClient } from '@prisma/client';
import { Pool } from 'pg';
import { PrismaPg } from '@prisma/adapter-pg';
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

const PUBLIC_UPLOADS_DIR = path.join(process.cwd(), 'public', 'uploads');
const TARGET_IMG_DIR = path.join(PUBLIC_UPLOADS_DIR, 'products');

async function main() {
  console.log('--- STARTING FIX PROCESS ---');

  // 1. Set isVisible to true for all products
  console.log('Updating isVisible for all products to true...');
  const updatedCount = await prisma.product.updateMany({
    data: {
      isVisible: true
    }
  });
  console.log(`Updated ${updatedCount.count} products to be visible.`);

  // 2. Find missing images
  console.log('Finding products without images...');
  const productsWithoutImages = await prisma.product.findMany({
    where: {
      images: {
        none: {}
      }
    }
  });

  console.log(`Found ${productsWithoutImages.length} products without images.`);

  let fixedCount = 0;

  for (const product of productsWithoutImages) {
    const sku = product.sku;
    
    // Check possible image locations in public/uploads/
    const possibleExtensions = ['.webp', '.jpg', '.png', '.jpeg'];
    let foundImagePath = null;

    for (const ext of possibleExtensions) {
      const p1 = path.join(PUBLIC_UPLOADS_DIR, `${sku}${ext}`);
      const p2 = path.join(PUBLIC_UPLOADS_DIR, `${sku.toLowerCase()}${ext}`);
      const p3 = path.join(TARGET_IMG_DIR, `${sku}${ext}`); // sometimes placed here by mistake

      if (fs.existsSync(p1)) {
        foundImagePath = p1;
        break;
      } else if (fs.existsSync(p2)) {
        foundImagePath = p2;
        break;
      } else if (fs.existsSync(p3)) {
        foundImagePath = p3;
        break;
      }
    }

    if (foundImagePath) {
      const ext = path.extname(foundImagePath);
      const newFileName = `${product.id}${ext}`;
      const destImagePath = path.join(TARGET_IMG_DIR, newFileName);

      console.log(`Found image for SKU ${sku} at ${foundImagePath}. Copying to ${destImagePath}...`);
      
      try {
        if (foundImagePath !== destImagePath) {
           fs.copyFileSync(foundImagePath, destImagePath);
        }
        
        await prisma.productImage.create({
          data: {
            productId: product.id,
            url: `/uploads/products/${newFileName}`,
            isMain: true,
            order: 0
          }
        });
        fixedCount++;
      } catch (err) {
        console.error(`Failed to copy and link image for SKU ${sku}:`, err);
      }
    } else {
      console.warn(`WARNING: Could not find any image for SKU ${sku} (${product.nameAr})`);
    }
  }

  console.log(`--- FIX COMPLETED: Fixed images for ${fixedCount} out of ${productsWithoutImages.length} products ---`);
}

main().catch(console.error).finally(() => prisma.$disconnect());
