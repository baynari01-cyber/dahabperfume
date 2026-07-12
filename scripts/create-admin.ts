import { PrismaClient } from '@prisma/client';
import { Pool } from 'pg';
import { PrismaPg } from '@prisma/adapter-pg';
import * as argon2 from 'argon2';

const connectionString = process.env.DATABASE_URL || '';
const pool = new Pool({ connectionString });
const adapter = new PrismaPg(pool);
const prisma = new PrismaClient({ adapter });

async function main() {
  const adminRole = await prisma.role.upsert({
    where: { name: 'Admin' },
    update: {},
    create: {
      name: 'Admin',
      permissions: {
        create: [
          { action: 'manage:products' },
          { action: 'manage:orders' },
          { action: 'pos:access' },
          { action: 'manage:inventory' }
        ]
      }
    }
  });

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

  console.log('System Admin user created: system@dahab.local / admin123');
}

main().catch(console.error).finally(() => prisma.$disconnect());
