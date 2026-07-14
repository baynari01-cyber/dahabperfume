'use server';

import { prisma } from '@/lib/db';
import { requirePermission } from '@/lib/dal';
import fs from 'fs';
import path from 'path';
import crypto from 'crypto';
import { revalidatePath } from 'next/cache';

async function saveUploadedImage(imageFile: File): Promise<string> {
  const buffer = Buffer.from(await imageFile.arrayBuffer());
  const ext = path.extname(imageFile.name) || '.jpg';
  const filename = `${crypto.randomUUID()}${ext}`;
  const uploadDir = path.join(process.cwd(), 'public', 'uploads');

  if (!fs.existsSync(uploadDir)) {
    fs.mkdirSync(uploadDir, { recursive: true });
  }

  fs.writeFileSync(path.join(uploadDir, filename), buffer);
  return `/uploads/${filename}`;
}

export async function createCategory(formData: FormData) {
  await requirePermission('manage:products'); // or manage:settings depending on the role setup

  try {
    const name = formData.get('name') as string;
    if (!name) throw new Error('اسم المجموعة مطلوب');

    const slug = name.toLowerCase().replace(/[^a-z0-9\u0600-\u06FF]+/g, '-') + '-' + Date.now();

    // Handle image
    let imagePath = '';
    const imageFile = formData.get('image') as File;
    if (imageFile && imageFile.size > 0) {
      imagePath = await saveUploadedImage(imageFile);
    } else {
      throw new Error('صورة المجموعة مطلوبة');
    }

    const category = await prisma.category.create({
      data: {
        name,
        slug,
        imagePath
      }
    });

    revalidatePath('/admin/categories');
    return { success: true, categoryId: category.id };
  } catch (error: any) {
    console.error('Error creating category:', error);
    return { success: false, error: error.message };
  }
}
