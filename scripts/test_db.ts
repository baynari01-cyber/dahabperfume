import { PrismaClient } from '@prisma/client';
import { Pool } from 'pg';
import { PrismaPg } from '@prisma/adapter-pg';

const dbUrl = new URL(process.env.DATABASE_URL || '');
dbUrl.searchParams.delete('pgbouncer');

const pool = new Pool({ connectionString: dbUrl.toString() });
const adapter = new PrismaPg(pool);
const prisma = new PrismaClient({ adapter });

async function main() {
  const p = await prisma.product.findMany({
    take: 5,
    select: { sku: true, nameAr: true, isVisible: true, stockLiters: true, variants: true, images: {select: {url: true}} }
  });
  console.dir(p, {depth: null});
  const c = await prisma.product.count({where: {isVisible: true}});
  console.log("Visible count:", c);
}
main().finally(() => prisma.$disconnect());
