import { PrismaClient } from '@prisma/client';
import { Pool } from 'pg';
import { PrismaPg } from '@prisma/adapter-pg';

const connectionString = process.env.DATABASE_URL || '';
const pool = new Pool({ connectionString });
const adapter = new PrismaPg(pool);
const prisma = new PrismaClient({ adapter });

async function main() {
  // Counts grouped by size and price
  const groupings = await prisma.productVariant.groupBy({
    by: ['size', 'price'],
    _count: {
      _all: true
    },
    orderBy: [
      { size: 'asc' },
      { price: 'asc' }
    ]
  });

  console.log('--- VARIANT SIZE AND PRICE GROUPING ---');
  for (const group of groupings) {
    console.log(`Size: ${group.size} | Price: ${group.price / 100} JOD | Count: ${group._count._all}`);
  }

  // Check if any old prices remain
  const oldPricesCount = await prisma.productVariant.count({
    where: {
      price: {
        in: [5500, 6500, 8500]
      }
    }
  });
  console.log(`\nOld prices remaining (55/65/85 JOD): ${oldPricesCount}`);

  // Check if any zero prices exist
  const zeroPricesCount = await prisma.productVariant.count({
    where: {
      price: 0
    }
  });
  console.log(`Zero prices remaining: ${zeroPricesCount}`);
}

main().catch(console.error).finally(() => prisma.$disconnect());
