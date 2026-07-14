'use client';

import React, { useState } from 'react';
import { useRouter } from 'next/navigation';
import { updateProduct } from '@/actions/products';
import { Loader2, Plus, Trash2 } from 'lucide-react';

interface Variant {
  id?: string;
  size: string;
  sku: string;
  price: number;
  isActive: boolean;
}

interface Category {
  id: string;
  name: string;
}

interface ProductImage {
  id: string;
  url: string;
  isMain: boolean;
}

interface ProductEditFormProps {
  productId: string;
  initialData: {
    nameAr: string;
    nameEn: string;
    sku: string;
    shortDescription: string | null;
    longDescription: string | null;
    isVisible: boolean;
    isFeatured: boolean;
    categoryId: string;
    stockLiters: number;
    variants: Variant[];
    images: ProductImage[];
  };
  categories: Category[];
}

export function ProductEditForm({ productId, initialData, categories }: ProductEditFormProps) {
  const router = useRouter();
  const [pending, setPending] = useState(false);
  const [error, setError] = useState('');
  const [preview, setPreview] = useState<string | null>(null);
  const [variants, setVariants] = useState<Variant[]>(initialData.variants);

  const addVariant = () => {
    setVariants(prev => [...prev, { size: '', sku: '', price: 25000, isActive: true }]);
  };

  const removeVariant = (index: number) => {
    setVariants(prev => prev.filter((_, i) => i !== index));
  };

  const updateVariant = (index: number, field: keyof Variant, value: string | boolean | number) => {
    setVariants(prev => prev.map((v, i) => i === index ? { ...v, [field]: value } : v));
  };

  const mainImage = initialData.images.find(img => img.isMain) || initialData.images[0];

  const handleSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    setPending(true);
    setError('');

    try {
      const formData = new FormData(e.currentTarget);

      // Variants in fils
      const variantsForAction = variants.map(v => ({
        id: v.id,
        size: v.size,
        sku: v.sku,
        price: typeof v.price === 'string' ? Math.round(parseFloat(v.price) * 1000) : v.price,
        isActive: v.isActive
      }));
      formData.set('variants', JSON.stringify(variantsForAction));

      const res = await updateProduct(productId, formData);
      if (res.success) {
        window.location.href = '/admin/products';
      } else {
        setError(res.error || 'حدث خطأ');
        setPending(false);
      }
    } catch (err: any) {
      setError(err.message || 'حدث خطأ');
      setPending(false);
    }
  };

  return (
    <form onSubmit={handleSubmit} className="max-w-3xl bg-white p-6 rounded-lg shadow-sm border border-[var(--color-ivory-200)] space-y-6">

      {error && (
        <div className="bg-red-50 border border-red-200 text-red-700 px-4 py-3 rounded text-sm">
          {error}
        </div>
      )}

      <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
        <div>
          <label className="block text-sm font-bold text-zinc-700 mb-2">اسم العطر (عربي) *</label>
          <input type="text" name="nameAr" defaultValue={initialData.nameAr} required className="w-full border rounded p-2 text-sm outline-none focus:border-[var(--color-champagne-600)]" />
        </div>
        <div>
          <label className="block text-sm font-bold text-zinc-700 mb-2">اسم العطر (إنجليزي) *</label>
          <input type="text" name="nameEn" defaultValue={initialData.nameEn} required className="w-full border rounded p-2 text-sm outline-none focus:border-[var(--color-champagne-600)]" />
        </div>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
        <div>
          <label className="block text-sm font-bold text-zinc-700 mb-2">SKU الأساسي *</label>
          <input type="text" name="sku" defaultValue={initialData.sku} required dir="ltr" className="w-full border rounded p-2 text-sm font-mono text-left outline-none focus:border-[var(--color-champagne-600)]" />
        </div>
        <div>
          <label className="block text-sm font-bold text-zinc-700 mb-2">التصنيف *</label>
          <select name="categoryId" defaultValue={initialData.categoryId} required className="w-full border rounded p-2 text-sm outline-none bg-white focus:border-[var(--color-champagne-600)]">
            <option value="">-- اختر التصنيف --</option>
            {categories.map(c => (
              <option key={c.id} value={c.id}>{c.name}</option>
            ))}
          </select>
        </div>
        <div>
          <label className="block text-sm font-bold text-zinc-700 mb-2">مخزون اللترات الحالي</label>
          <input type="number" step="0.001" name="stockLiters" defaultValue={initialData.stockLiters} dir="ltr" className="w-full border rounded p-2 text-sm text-left outline-none focus:border-[var(--color-champagne-600)]" />
        </div>
      </div>

      <div>
        <label className="block text-sm font-bold text-zinc-700 mb-2">الوصف القصير (عربي)</label>
        <textarea name="shortDescription" defaultValue={initialData.shortDescription || ''} rows={2} className="w-full border rounded p-2 text-sm outline-none focus:border-[var(--color-champagne-600)]"></textarea>
      </div>

      <div>
        <label className="block text-sm font-bold text-zinc-700 mb-2">الوصف التفصيلي</label>
        <textarea name="longDescription" defaultValue={initialData.longDescription || ''} rows={4} className="w-full border rounded p-2 text-sm outline-none focus:border-[var(--color-champagne-600)]"></textarea>
      </div>

      {/* Variants */}
      <div>
        <div className="flex justify-between items-center mb-3">
          <label className="text-sm font-bold text-zinc-700">الأحجام والأسعار</label>
          <button type="button" onClick={addVariant} className="flex items-center gap-1 text-xs font-bold text-[var(--color-champagne-600)] hover:text-[var(--color-champagne-700)] border border-[var(--color-champagne-300)] px-3 py-1.5 rounded hover:bg-[var(--color-champagne-50)] transition-colors">
            <Plus className="w-3 h-3" /> إضافة حجم
          </button>
        </div>

        <div className="border rounded-lg divide-y divide-zinc-100 overflow-hidden">
          <div className="bg-zinc-50 grid grid-cols-12 gap-2 px-4 py-2 text-xs font-bold text-zinc-500">
            <div className="col-span-3">الحجم</div>
            <div className="col-span-4">SKU الحجم</div>
            <div className="col-span-3">السعر (دينار)</div>
            <div className="col-span-1 text-center">نشط</div>
            <div className="col-span-1 text-center">حذف</div>
          </div>
          {variants.map((v, i) => (
            <div key={i} className="grid grid-cols-12 gap-2 px-4 py-3 items-center">
              <div className="col-span-3">
                <input type="text" value={v.size} onChange={e => updateVariant(i, 'size', e.target.value)} required placeholder="50ml" className="w-full border rounded p-1.5 text-xs outline-none focus:border-[var(--color-champagne-600)]" dir="ltr" />
              </div>
              <div className="col-span-4">
                <input type="text" value={v.sku} onChange={e => updateVariant(i, 'sku', e.target.value)} required className="w-full border rounded p-1.5 text-xs font-mono outline-none focus:border-[var(--color-champagne-600)]" dir="ltr" />
              </div>
              <div className="col-span-3">
                <input
                  type="number"
                  step="0.001"
                  value={(v.price / 1000).toFixed(3)}
                  onChange={e => updateVariant(i, 'price', Math.round(parseFloat(e.target.value) * 1000))}
                  required
                  className="w-full border rounded p-1.5 text-xs outline-none focus:border-[var(--color-champagne-600)]"
                  dir="ltr"
                />
              </div>
              <div className="col-span-1 text-center">
                <input type="checkbox" checked={v.isActive} onChange={e => updateVariant(i, 'isActive', e.target.checked)} className="w-4 h-4" />
              </div>
              <div className="col-span-1 text-center">
                {variants.length > 1 && (
                  <button type="button" onClick={() => removeVariant(i)} className="text-red-400 hover:text-red-600 transition-colors">
                    <Trash2 className="w-4 h-4" />
                  </button>
                )}
              </div>
            </div>
          ))}
        </div>
      </div>

      {/* Image */}
      <div className="flex gap-6 items-start">
        <div className="flex-1">
          <label className="block text-sm font-bold text-zinc-700 mb-2">تحديث صورة العطر</label>
          <input
            type="file"
            name="image"
            accept="image/*"
            className="w-full border rounded p-2 text-sm bg-zinc-50 outline-none"
            onChange={e => {
              const file = e.target.files?.[0];
              if (file) setPreview(URL.createObjectURL(file));
            }}
          />
          <p className="text-xs text-zinc-500 mt-1">اتركه فارغاً للإبقاء على الصورة الحالية.</p>
        </div>
        <div className="w-24 h-24 border rounded-lg overflow-hidden bg-zinc-50 flex items-center justify-center flex-shrink-0">
          {preview ? (
            <img src={preview} alt="Preview" className="w-full h-full object-contain" />
          ) : mainImage ? (
            <img src={mainImage.url} alt="Current" className="w-full h-full object-contain" />
          ) : (
            <span className="text-xs text-zinc-400">بدون صورة</span>
          )}
        </div>
      </div>

      <div className="flex flex-col gap-3 border-t pt-4">
        <div className="flex items-center gap-2">
          <input type="checkbox" name="isVisible" value="true" defaultChecked={initialData.isVisible} id="isVisible" className="w-4 h-4 rounded" />
          <label htmlFor="isVisible" className="text-sm font-bold text-zinc-700 cursor-pointer">عرض العطر في المتجر الإلكتروني ونظام البيع</label>
        </div>
        <div className="flex items-center gap-2">
          <input type="checkbox" name="isFeatured" value="true" defaultChecked={initialData.isFeatured} id="isFeatured" className="w-4 h-4 rounded" />
          <label htmlFor="isFeatured" className="text-sm font-bold text-zinc-700 cursor-pointer">تمييز كأكثر مبيعاً (Best Seller)</label>
        </div>
      </div>

      <div className="pt-4 flex justify-end gap-3">
        <a href="/admin/products" className="px-6 py-2 border rounded font-bold text-zinc-600 hover:bg-zinc-50 transition-colors text-sm">
          إلغاء
        </a>
        <button type="submit" disabled={pending} className="bg-[var(--color-charcoal-900)] text-white px-8 py-2 rounded font-bold hover:bg-[var(--color-charcoal-800)] transition-colors text-sm shadow-sm disabled:opacity-60 flex items-center gap-2">
          {pending && <Loader2 className="w-4 h-4 animate-spin" />}
          {pending ? 'جاري الحفظ...' : 'حفظ التعديلات'}
        </button>
      </div>

    </form>
  );
}
