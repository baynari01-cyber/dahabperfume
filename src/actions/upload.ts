'use server';

import { requirePermission } from '@/lib/dal';
import { createClient } from '@supabase/supabase-js';
import path from 'path';

// Setup Supabase admin client to bypass RLS and create buckets if needed
const getSupabaseAdmin = () => {
  return createClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.SUPABASE_SERVICE_ROLE_KEY!,
    { auth: { persistSession: false } }
  );
};

export async function generateUploadUrl(filename: string): Promise<{ success: boolean; token?: string; path?: string; publicUrl?: string; error?: string }> {
  try {
    await requirePermission('manage:settings');

    let ext = '';
    const lastDot = filename.lastIndexOf('.');
    if (lastDot !== -1) {
      ext = filename.substring(lastDot).toLowerCase();
    }
    
    const allowedExts = ['.jpg', '.jpeg', '.png', '.webp', '.gif', '.mp4', '.webm', '.ogg'];
    if (!allowedExts.includes(ext)) {
      return { success: false, error: 'صيغة الملف غير مدعومة' };
    }

    const newFilename = `${Date.now()}-${Math.random().toString(36).substring(2, 9)}${ext}`;
    const bucketName = 'uploads';
    const supabaseAdmin = getSupabaseAdmin();

    // Ensure bucket exists
    const { data: buckets } = await supabaseAdmin.storage.listBuckets();
    if (!buckets?.find(b => b.name === bucketName)) {
      await supabaseAdmin.storage.createBucket(bucketName, { public: true });
    }

    // Create a signed upload URL valid for 5 minutes
    const { data, error } = await supabaseAdmin.storage.from(bucketName).createSignedUploadUrl(newFilename);

    if (error || !data) {
      throw new Error(error?.message || 'فشل في إنشاء رابط الرفع');
    }

    const { data: publicData } = supabaseAdmin.storage.from(bucketName).getPublicUrl(newFilename);

    return { 
      success: true, 
      token: data.token,
      path: data.path,
      publicUrl: publicData.publicUrl 
    };
  } catch (error: any) {
    console.error('Upload Error:', error);
    return { success: false, error: error.message || 'حدث خطأ' };
  }
}

// Keep this for backwards compatibility for small files if needed, but rewrite to use Supabase
export async function uploadMedia(formData: FormData): Promise<{ success: boolean; url?: string; error?: string }> {
  try {
    await requirePermission('manage:settings');

    const file = formData.get('file') as File | null;
    if (!file) return { success: false, error: 'لم يتم العثور على أي ملف' };

    const ext = path.extname(file.name).toLowerCase();
    const allowedExts = ['.jpg', '.jpeg', '.png', '.webp', '.gif', '.mp4', '.webm', '.ogg'];
    if (!allowedExts.includes(ext)) {
      return { success: false, error: 'صيغة الملف غير مدعومة' };
    }

    const newFilename = `${Date.now()}-${Math.random().toString(36).substring(2, 9)}${ext}`;
    const bucketName = 'uploads';
    const supabaseAdmin = getSupabaseAdmin();

    const { data: buckets } = await supabaseAdmin.storage.listBuckets();
    if (!buckets?.find(b => b.name === bucketName)) {
      await supabaseAdmin.storage.createBucket(bucketName, { public: true });
    }

    const buffer = Buffer.from(await file.arrayBuffer());
    
    const { error } = await supabaseAdmin.storage.from(bucketName).upload(newFilename, buffer, {
      contentType: file.type,
      upsert: true
    });

    if (error) throw new Error(error.message);

    const { data: publicData } = supabaseAdmin.storage.from(bucketName).getPublicUrl(newFilename);

    return { success: true, url: publicData.publicUrl };
  } catch (error: any) {
    console.error('Upload Error:', error);
    return { success: false, error: error.message || 'حدث خطأ أثناء الرفع' };
  }
}
