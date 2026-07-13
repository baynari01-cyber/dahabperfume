'use server';

import { prisma } from '@/lib/db';
import { requirePermission } from '@/lib/dal';
import fs from 'fs';
import path from 'path';
import crypto from 'crypto';

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

export async function createProduct(formData: FormData) {
  await requirePermission('manage:products');

  try {
    const nameAr = formData.get('nameAr') as string;
    const nameEn = formData.get('nameEn') as string;
    const sku = formData.get('sku') as string;
    const shortDescription = (formData.get('shortDescription') as string) || null;
    const longDescription = (formData.get('longDescription') as string) || null;
    const isVisible = formData.get('isVisible') === 'true';
    const categoryId = formData.get('categoryId') as string;
    const stockLiters = parseFloat(formData.get('stockLiters') as string) || 0;
    const slug = sku.toLowerCase().replace(/[^a-z0-9]+/g, '-') + '-' + Date.now();

    if (!categoryId) throw new Error('التصنيف مطلوب');

    let variants: any[] = [];
    const variantsJson = formData.get('variants') as string;
    if (variantsJson) {
      try { variants = JSON.parse(variantsJson); } catch {}
    }
    if (variants.length === 0) {
      variants = [{ size: '50ml', sku: `${sku}-50ml`, price: 25000, isActive: true }];
    }

    // Handle image
    let imageUrl = '';
    const imageFile = formData.get('image') as File;
    if (imageFile && imageFile.size > 0) {
      imageUrl = await saveUploadedImage(imageFile);
    }

    const product = await prisma.product.create({
      data: {
        slug,
        nameAr,
        nameEn,
        sku,
        shortDescription,
        longDescription,
        isVisible,
        categoryId,
        stockLiters,
        variants: {
          create: variants.map((v: any) => ({
            size: v.size,
            sku: v.sku,
            price: Number(v.price),
            isActive: v.isActive ?? true,
          }))
        },
        ...(imageUrl ? {
          images: {
            create: [{ url: imageUrl, isMain: true, alt: nameAr }]
          }
        } : {})
      }
    });

    return { success: true, productId: product.id };
  } catch (error: any) {
    console.error('Error creating product:', error);
    return { success: false, error: error.message };
  }
}

export async function updateProduct(productId: string, formData: FormData) {
  await requirePermission('manage:products');

  try {
    const nameAr = formData.get('nameAr') as string;
    const nameEn = formData.get('nameEn') as string;
    const sku = formData.get('sku') as string;
    const shortDescription = (formData.get('shortDescription') as string) || null;
    const longDescription = (formData.get('longDescription') as string) || null;
    const isVisible = formData.get('isVisible') === 'true';
    const categoryId = formData.get('categoryId') as string;
    const stockLiters = parseFloat(formData.get('stockLiters') as string) || 0;

    if (!categoryId) throw new Error('التصنيف مطلوب');

    let variants: any[] = [];
    const variantsJson = formData.get('variants') as string;
    if (variantsJson) {
      try { variants = JSON.parse(variantsJson); } catch {}
    }

    // Handle image
    let imageUrl = '';
    const imageFile = formData.get('image') as File;
    if (imageFile && imageFile.size > 0) {
      imageUrl = await saveUploadedImage(imageFile);
    }

    // Upsert product
    await prisma.product.update({
      where: { id: productId },
      data: {
        nameAr,
        nameEn,
        sku,
        shortDescription,
        longDescription,
        isVisible,
        categoryId,
        stockLiters,
      }
    });

    // Upsert variants: delete all and re-create for simplicity
    if (variants.length > 0) {
      await prisma.productVariant.deleteMany({ where: { productId } });
      await prisma.productVariant.createMany({
        data: variants.map((v: any) => ({
          productId,
          size: v.size,
          sku: v.sku,
          price: Number(v.price),
          isActive: v.isActive ?? true,
        }))
      });
    }

    // Update image if provided
    if (imageUrl) {
      await prisma.productImage.deleteMany({ where: { productId } });
      await prisma.productImage.create({
        data: { productId, url: imageUrl, isMain: true, alt: nameAr }
      });
    }

    return { success: true };
  } catch (error: any) {
    console.error('Error updating product:', error);
    return { success: false, error: error.message };
  }
}
