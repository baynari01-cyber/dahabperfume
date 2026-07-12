import { PrismaClient } from '@prisma/client';
import { Pool } from 'pg';
import { PrismaPg } from '@prisma/adapter-pg';

const connectionString = process.env.DATABASE_URL || '';
const pool = new Pool({ connectionString });
const adapter = new PrismaPg(pool);
const prisma = new PrismaClient({ adapter });

async function main() {
  const total = await prisma.product.count();
  const visible = await prisma.product.count({ where: { isVisible: true } });
  const variants = await prisma.productVariant.count();
  console.log(`Total products: ${total}`);
  console.log(`Visible products: ${visible}`);
  console.log(`Total variants: ${variants}`);
}

main().catch(console.error).finally(() => prisma.$disconnect());
