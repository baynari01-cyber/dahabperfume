import * as dotenv from 'dotenv';
dotenv.config();

import { prisma } from '../src/lib/db';

async function main() {
  console.log('Seeding POS order permissions...');
  
  const permissions = [
    { action: 'pos.orders.view', description: 'عرض طلبات المتجر في شاشة الكاشير' },
    { action: 'pos.orders.manage', description: 'إدارة وتغيير حالة طلبات المتجر في الكاشير' }
  ];

  for (const perm of permissions) {
    await prisma.permission.upsert({
      where: { action: perm.action },
      update: {},
      create: perm
    });
  }

  console.log('POS order permissions seeded successfully.');
}

main()
  .catch(e => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
