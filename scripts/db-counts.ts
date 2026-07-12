import { PrismaClient } from '@prisma/client';
import { Pool } from 'pg';
import { PrismaPg } from '@prisma/adapter-pg';

const connectionString = process.env.DATABASE_URL || '';
const pool = new Pool({ connectionString });
const adapter = new PrismaPg(pool);
const prisma = new PrismaClient({ adapter });

async function main() {
  console.log('Querying Database Counts...');
  const [
    products,
    variants,
    accords,
    productAccords,
    images,
    categories,
    collections,
    seasons,
    families
  ] = await Promise.all([
    prisma.product.count(),
    prisma.productVariant.count(),
    prisma.accord.count(),
    prisma.productAccord.count(),
    prisma.productImage.count(),
    prisma.category.count(),
    prisma.collection.count(),
    prisma.season.count(),
    prisma.fragranceFamily.count()
  ]);

  console.log(JSON.stringify({
    products,
    variants,
    accords,
    productAccords,
    images,
    categories,
    collections,
    seasons,
    families
  }, null, 2));
}

main().catch(console.error).finally(() => prisma.$disconnect());
