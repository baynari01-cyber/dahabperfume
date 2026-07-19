import { PrismaClient } from '@prisma/client';
import { Pool } from 'pg';
import { PrismaPg } from '@prisma/adapter-pg';

const dbUrl = new URL(process.env.DATABASE_URL || '');
dbUrl.searchParams.delete('pgbouncer');

const pool = new Pool({ connectionString: dbUrl.toString() });
const adapter = new PrismaPg(pool);
const prisma = new PrismaClient({ adapter });

async function main() {
  const missingImages = await prisma.product.count({
    where: { images: { none: {} } }
  });
  console.log("Products without images:", missingImages);
}
main().finally(() => prisma.$disconnect());
