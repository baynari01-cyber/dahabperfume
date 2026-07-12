import { PrismaClient } from '@prisma/client';
import { Pool } from 'pg';
import { PrismaPg } from '@prisma/adapter-pg';
import * as argon2 from 'argon2';

const connectionString = process.env.DATABASE_URL || '';
const pool = new Pool({ connectionString });
const adapter = new PrismaPg(pool);
const prisma = new PrismaClient({ adapter });

async function main() {
  const actions = ['manage:products', 'manage:orders', 'pos:access', 'manage:inventory', 'manage:settings'];
  
  for (const action of actions) {
    await prisma.permission.upsert({
      where: { action },
      update: {},
      create: { action }
    });
  }

  const permissions = await prisma.permission.findMany();

  let adminRole = await prisma.role.findUnique({ where: { name: 'Admin' } });
  if (!adminRole) {
    adminRole = await prisma.role.create({
      data: { name: 'Admin' }
    });
  }

  // Assign all permissions to Admin
  for (const p of permissions) {
    await prisma.rolePermission.upsert({
      where: { roleId_permissionId: { roleId: adminRole.id, permissionId: p.id } },
      update: {},
      create: { roleId: adminRole.id, permissionId: p.id }
    });
  }

  const passwordHash = await argon2.hash('admin123'); // Default password, MUST be changed

  await prisma.employee.upsert({
    where: { email: 'system@dahab.local' },
    update: {},
    create: {
      email: 'system@dahab.local',
      name: 'System Admin',
      passwordHash,
      roleId: adminRole.id
    }
  });

  // Also create a GlobalPricingSettings if it doesn't exist
  await prisma.globalPricingSettings.upsert({
    where: { id: "1" },
    update: {},
    create: {
      id: "1",
      taxRate: 16.0,
      currencyCode: "JOD",
      currencySymbol: "د.أ"
    }
  });

  console.log('System Admin user created: system@dahab.local / admin123');
}

main().catch(console.error).finally(() => prisma.$disconnect());
