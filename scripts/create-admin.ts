import { PrismaClient } from '@prisma/client';
import { Pool } from 'pg';
import { PrismaPg } from '@prisma/adapter-pg';
import * as argon2 from 'argon2';

const connectionString = process.env.DATABASE_URL || '';
const pool = new Pool({ connectionString });
const adapter = new PrismaPg(pool);
const prisma = new PrismaClient({ adapter });

async function main() {
  const actions = ['manage:products', 'manage:orders', 'orders.confirm', 'pos:access', 'manage:inventory', 'manage:settings'];
  
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

  // Seed default local-development Admin account
  const adminPasswordHash = await argon2.hash('Dhb-Adm!7Qm4#Zp92');
  await prisma.employee.upsert({
    where: { email: 'admin@dahabperfume.local' },
    update: {},
    create: {
      email: 'admin@dahabperfume.local',
      name: 'Local Admin',
      passwordHash: adminPasswordHash,
      roleId: adminRole.id,
      mustChangePassword: true,
      bootstrapCredential: true
    }
  });

  // Seed default local-development Cashier account
  let cashierRole = await prisma.role.findUnique({ where: { name: 'Cashier' } });
  if (!cashierRole) {
    cashierRole = await prisma.role.create({
      data: { name: 'Cashier' }
    });
  }

  // Assign pos:access to Cashier role
  const posPermission = await prisma.permission.findUnique({ where: { action: 'pos:access' } });
  if (posPermission) {
    await prisma.rolePermission.upsert({
      where: { roleId_permissionId: { roleId: cashierRole.id, permissionId: posPermission.id } },
      update: {},
      create: { roleId: cashierRole.id, permissionId: posPermission.id }
    });
  }

  const cashierPasswordHash = await argon2.hash('Dhb-POS!4Vr8#Nk61');
  await prisma.employee.upsert({
    where: { email: 'cashier@dahabperfume.local' },
    update: {},
    create: {
      email: 'cashier@dahabperfume.local',
      name: 'Local Cashier',
      passwordHash: cashierPasswordHash,
      roleId: cashierRole.id,
      mustChangePassword: true,
      bootstrapCredential: true
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

  // Create default SiteSettings for WhatsApp number
  await prisma.siteSettings.upsert({
    where: { key: 'whatsapp_number' },
    update: {},
    create: {
      key: 'whatsapp_number',
      value: JSON.stringify({ number: '962785050655' })
    }
  });

  // Create default SiteSettings for Announcement Bar
  await prisma.siteSettings.upsert({
    where: { key: 'announcement_bar' },
    update: {},
    create: {
      key: 'announcement_bar',
      value: JSON.stringify({ textAr: 'توصيل مجاني للطلبات فوق 50 د.أ', textEn: 'Free delivery for orders above 50 JOD' })
    }
  });

  // Create default SiteSettings for Homepage Content
  await prisma.siteSettings.upsert({
    where: { key: 'homepage_content' },
    update: {},
    create: {
      key: 'homepage_content',
      value: JSON.stringify({
        heroTitleAr: 'حين تُترجم الفخامة إلى عطر',
        heroTitleEn: 'When Luxury Translates to Fragrance',
        heroDescAr: 'دهب للعطور.. نفحات مختارة بعناية من الشرق، لترافق هويتك وتُشعرك بالأصالة والتميز.',
        heroDescEn: 'Dahab Perfumes... carefully selected notes from the East, to accompany your identity and make you feel authentic.'
      })
    }
  });

  // Create default SiteSettings for Brand Story
  await prisma.siteSettings.upsert({
    where: { key: 'brand_story' },
    update: {},
    create: {
      key: 'brand_story',
      value: JSON.stringify({
        titleAr: 'عن دهب للعطور',
        titleEn: 'About Dahab Perfumes',
        contentAr: 'دهب للعطور.. دار عطور شرقية أصيلة تأسست لتقدم فخامة تناسب شخصيتك وهويتك العطرية الفريدة.',
        contentEn: 'Dahab Perfumes... an authentic oriental fragrance house established to present luxury matching your unique personality.'
      })
    }
  });

  // Create default SiteSettings for Location Info
  await prisma.siteSettings.upsert({
    where: { key: 'store_location_info' },
    update: {},
    create: {
      key: 'store_location_info',
      value: JSON.stringify({
        addressAr: 'عمان، الأردن - شارع مكة',
        addressEn: 'Amman, Jordan - Mecca St',
        hoursAr: '10:00 ص - 10:00 م',
        hoursEn: '10:00 AM - 10:00 PM',
        phone: '+962785050655'
      })
    }
  });

  // Create default SiteSettings for Social Links
  await prisma.siteSettings.upsert({
    where: { key: 'social_links' },
    update: {},
    create: {
      key: 'social_links',
      value: JSON.stringify({
        instagram: 'https://instagram.com/dahab',
        facebook: 'https://facebook.com/dahab'
      })
    }
  });

  console.log('System Admin user created: system@dahab.local / admin123');
}

main().catch(console.error).finally(() => prisma.$disconnect());
