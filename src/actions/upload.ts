'use server';

import { requirePermission } from '@/lib/dal';
import fs from 'fs';
import path from 'path';

export async function uploadMedia(formData: FormData): Promise<{ success: boolean; url?: string; error?: string }> {
  try {
    await requirePermission('manage:settings');

    const file = formData.get('file') as File | null;
    if (!file) {
      return { success: false, error: 'لم يتم العثور على أي ملف' };
    }

    const buffer = Buffer.from(await file.arrayBuffer());
    
    // Create a safe, unique filename
    const ext = path.extname(file.name).toLowerCase();
    
    // Allowed extensions for basic security
    const allowedExts = ['.jpg', '.jpeg', '.png', '.webp', '.gif', '.mp4', '.webm', '.ogg'];
    if (!allowedExts.includes(ext)) {
      return { success: false, error: 'صيغة الملف غير مدعومة' };
    }

    const filename = `${Date.now()}-${Math.random().toString(36).substring(2, 9)}${ext}`;
    const uploadDir = path.join(process.cwd(), 'public', 'uploads');

    if (!fs.existsSync(uploadDir)) {
      fs.mkdirSync(uploadDir, { recursive: true });
    }

    fs.writeFileSync(path.join(uploadDir, filename), buffer);
    
    return { success: true, url: `/uploads/${filename}` };
  } catch (error: any) {
    console.error('Upload Error:', error);
    return { success: false, error: error.message || 'حدث خطأ أثناء رفع الملف' };
  }
}
