import { NextResponse } from 'next/server';
import { prisma } from '@/lib/db';

export async function GET() {
  try {
    const genders = ['رجالي', 'نسائي', 'للجنسين'];
    for (const g of genders) {
      await prisma.gender.upsert({ where: { name: g }, update: {}, create: { name: g } });
    }

    const seasons = ['صيفي', 'شتوي', 'ربيعي', 'خريفي', 'لكل المواسم'];
    for (const s of seasons) {
      await prisma.season.upsert({ where: { name: s }, update: {}, create: { name: s } });
    }

    const families = ['شرقية', 'خشبية', 'زهرية', 'حمضية', 'فاكهية', 'حارة', 'بحرية', 'عطرية', 'عنبرية', 'جلدية', 'مسكية'];
    for (const f of families) {
      await prisma.fragranceFamily.upsert({ where: { name: f }, update: {}, create: { name: f } });
    }

    return NextResponse.json({ success: true, message: 'Database seeded successfully' });
  } catch (error: any) {
    return NextResponse.json({ success: false, error: error.message });
  }
}
