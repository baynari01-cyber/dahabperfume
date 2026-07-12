import { PrismaClient } from '@prisma/client';
import { Pool } from 'pg';
import { PrismaPg } from '@prisma/adapter-pg';

const connectionString = process.env.DATABASE_URL || '';
const pool = new Pool({ connectionString });
const adapter = new PrismaPg(pool);
const prisma = new PrismaClient({ adapter });

async function main() {
  const needsReviewCount = await prisma.product.count({ where: { needsReview: true } });
  const products = await prisma.product.findMany({
    where: { needsReview: true }
  });
  
  console.log(`Products needing review: ${needsReviewCount}`);
  for (const p of products) {
    console.log(`- ${p.sku}: ${p.reviewReasons}`);
  }
}

main().catch(console.error).finally(() => prisma.$disconnect());
