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

    const productIds = formData.getAll('productIds') as string[];
    if (productIds && productIds.length > 0) {
      await prisma.product.updateMany({
        where: { id: { in: productIds } },
        data: { categoryId: category.id }
      });
    }

    revalidatePath('/admin/categories');
    return { success: true, categoryId: category.id };
  } catch (error: any) {
    console.error('Error creating category:', error);
    return { success: false, error: error.message || 'حدث خطأ غير معروف' };
  }
}

export async function updateCategory(id: string, formData: FormData) {
  await requirePermission('manage:products');

  try {
    const name = formData.get('name') as string;
    if (!name) throw new Error('اسم المجموعة مطلوب');

    const data: any = { name };

    const imageFile = formData.get('image') as File;
    if (imageFile && imageFile.size > 0) {
      data.imagePath = await saveUploadedImage(imageFile);
    }

    await prisma.category.update({
      where: { id },
      data
    });

    revalidatePath('/admin/categories');
    return { success: true };
  } catch (error: any) {
    console.error('Error updating category:', error);
    return { success: false, error: error.message || 'حدث خطأ غير معروف' };
  }
}

export async function deleteCategory(id: string, deleteProducts: boolean, fallbackCategoryId?: string) {
  await requirePermission('manage:products');

  try {
    if (deleteProducts) {
      // First delete all products associated with this category
      await prisma.product.deleteMany({
        where: { categoryId: id }
      });
    } else {
      if (!fallbackCategoryId) {
        throw new Error('يجب اختيار مجموعة بديلة لنقل المنتجات إليها');
      }
      if (fallbackCategoryId === id) {
         throw new Error('لا يمكن نقل المنتجات إلى نفس المجموعة المحذوفة');
      }
      // Update all products to the fallback category
      await prisma.product.updateMany({
        where: { categoryId: id },
        data: { categoryId: fallbackCategoryId }
      });
    }

    // Now delete the category itself
    await prisma.category.delete({
      where: { id }
    });

    revalidatePath('/admin/categories');
    return { success: true };
  } catch (error: any) {
    console.error('Error deleting category:', error);
    return { success: false, error: error.message || 'حدث خطأ أثناء الحذف' };
  }
}
