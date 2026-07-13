'use client';

import React, { useState } from 'react';
import { useRouter } from 'next/navigation';
import { createProduct } from '@/actions/products';
import { Loader2, Plus, Trash2 } from 'lucide-react';

interface Variant {
  size: string;
  sku: string;
  price: string;
  isActive: boolean;
}

interface Category {
  id: string;
  name: string;
}

export function ProductNewForm({ categories }: { categories: Category[] }) {
  const router = useRouter();
  const [pending, setPending] = useState(false);
  const [error, setError] = useState('');
  const [preview, setPreview] = useState<string | null>(null);
  const [variants, setVariants] = useState<Variant[]>([
    { size: '50ml', sku: '', price: '25', isActive: true }
  ]);

  const addVariant = () => {
    setVariants(prev => [...prev, { size: '', sku: '', price: '', isActive: true }]);
  };

  const removeVariant = (index: number) => {
    setVariants(prev => prev.filter((_, i) => i !== index));
  };

  const updateVariant = (index: number, field: keyof Variant, value: string | boolean) => {
    setVariants(prev => prev.map((v, i) => i === index ? { ...v, [field]: value } : v));
  };

  const handleSkuChange = (baseSku: string) => {
    setVariants(prev => prev.map((v, i) => ({
      ...v,
      sku: v.sku === '' || i === 0 ? `${baseSku}-${v.size}` : v.sku
    })));
  };

  const handleSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    setPending(true);
    setError('');

    try {
      const formData = new FormData(e.currentTarget);

      // Convert variants to JD → fils
      const variantsForAction = variants.map(v => ({
        size: v.size,
        sku: v.sku,
        price: Math.round(parseFloat(v.price) * 1000),
        isActive: v.isActive
      }));
      formData.set('variants', JSON.stringify(variantsForAction));

      const res = await createProduct(formData);
      if (res.success) {
        router.push('/admin/products');
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
          <input type="text" name="nameAr" required className="w-full border rounded p-2 text-sm outline-none focus:border-[var(--color-champagne-600)]" />
        </div>
        <div>
          <label className="block text-sm font-bold text-zinc-700 mb-2">اسم العطر (إنجليزي) *</label>
          <input type="text" name="nameEn" required className="w-full border rounded p-2 text-sm outline-none focus:border-[var(--color-champagne-600)]" />
        </div>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
        <div>
          <label className="block text-sm font-bold text-zinc-700 mb-2">SKU الأساسي *</label>
          <input
            type="text"
            name="sku"
            required
            dir="ltr"
            className="w-full border rounded p-2 text-sm font-mono text-left outline-none focus:border-[var(--color-champagne-600)]"
            onChange={e => handleSkuChange(e.target.value)}
          />
          <p className="text-xs text-zinc-400 mt-1">مثال: DHB-001</p>
        </div>
        <div>
          <label className="block text-sm font-bold text-zinc-700 mb-2">التصنيف *</label>
          <select name="categoryId" required className="w-full border rounded p-2 text-sm outline-none bg-white focus:border-[var(--color-champagne-600)]">
            <option value="">-- اختر التصنيف --</option>
            {categories.map(c => (
              <option key={c.id} value={c.id}>{c.name}</option>
            ))}
          </select>
        </div>
        <div>
          <label className="block text-sm font-bold text-zinc-700 mb-2">مخزون اللترات الابتدائي</label>
          <input type="number" step="0.001" name="stockLiters" defaultValue="0" dir="ltr" className="w-full border rounded p-2 text-sm text-left outline-none focus:border-[var(--color-champagne-600)]" />
          <p className="text-xs text-zinc-400 mt-1">مثال: 1.5 (أي لتر ونصف)</p>
        </div>
      </div>

      <div>
        <label className="block text-sm font-bold text-zinc-700 mb-2">الوصف القصير (عربي)</label>
        <textarea name="shortDescription" rows={2} className="w-full border rounded p-2 text-sm outline-none focus:border-[var(--color-champagne-600)]" placeholder="وصف مختصر يظهر في قائمة المنتجات..."></textarea>
      </div>

      <div>
        <label className="block text-sm font-bold text-zinc-700 mb-2">الوصف التفصيلي</label>
        <textarea name="longDescription" rows={4} className="w-full border rounded p-2 text-sm outline-none focus:border-[var(--color-champagne-600)]" placeholder="وصف تفصيلي كامل للعطر..."></textarea>
      </div>

      {/* Variants */}
      <div>
        <div className="flex justify-between items-center mb-3">
          <label className="text-sm font-bold text-zinc-700">الأحجام والأسعار *</label>
          <button type="button" onClick={addVariant} className="flex items-center gap-1 text-xs font-bold text-[var(--color-champagne-600)] hover:text-[var(--color-champagne-700)] border border-[var(--color-champagne-300)] px-3 py-1.5 rounded hover:bg-[var(--color-champagne-50)] transition-colors">
            <Plus className="w-3 h-3" /> إضافة حجم
          </button>
        </div>

        <div className="border rounded-lg divide-y divide-zinc-100 overflow-hidden">
          <div className="bg-zinc-50 grid grid-cols-12 gap-2 px-4 py-2 text-xs font-bold text-zinc-500">
            <div className="col-span-3">الحجم (مثال: 50ml)</div>
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
                <input type="text" value={v.sku} onChange={e => updateVariant(i, 'sku', e.target.value)} required placeholder="DHB-001-50" className="w-full border rounded p-1.5 text-xs font-mono outline-none focus:border-[var(--color-champagne-600)]" dir="ltr" />
              </div>
              <div className="col-span-3">
                <input type="number" step="0.001" value={v.price} onChange={e => updateVariant(i, 'price', e.target.value)} required placeholder="25.000" className="w-full border rounded p-1.5 text-xs outline-none focus:border-[var(--color-champagne-600)]" dir="ltr" />
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

      {/* Image Upload */}
      <div>
        <label className="block text-sm font-bold text-zinc-700 mb-2">صورة العطر</label>
        <input
          type="file"
          name="image"
          accept="image/*"
          className="w-full border rounded p-2 text-sm outline-none focus:border-[var(--color-champagne-600)] bg-zinc-50"
          onChange={e => {
            const file = e.target.files?.[0];
            if (file) setPreview(URL.createObjectURL(file));
          }}
        />
        {preview && (
          <div className="mt-3 w-24 h-24 border rounded-lg overflow-hidden bg-zinc-50">
            <img src={preview} alt="Preview" className="w-full h-full object-contain" />
          </div>
        )}
        <p className="text-xs text-zinc-500 mt-1">يُفضل PNG بخلفية شفافة، مقاس مربع.</p>
      </div>

      <div className="flex items-center gap-2 border-t pt-4">
        <input type="checkbox" name="isVisible" value="true" defaultChecked id="isVisible" className="w-4 h-4 rounded" />
        <label htmlFor="isVisible" className="text-sm font-bold text-zinc-700 cursor-pointer">عرض العطر في المتجر الإلكتروني ونظام البيع</label>
      </div>

      <div className="pt-4 flex justify-end gap-3">
        <a href="/admin/products" className="px-6 py-2 border rounded font-bold text-zinc-600 hover:bg-zinc-50 transition-colors text-sm">
          إلغاء
        </a>
        <button type="submit" disabled={pending} className="bg-[var(--color-forest-900)] text-white px-8 py-2 rounded font-bold hover:bg-[var(--color-forest-800)] transition-colors text-sm shadow-sm disabled:opacity-60 flex items-center gap-2">
          {pending && <Loader2 className="w-4 h-4 animate-spin" />}
          {pending ? 'جاري الحفظ...' : 'حفظ وإضافة العطر'}
        </button>
      </div>

    </form>
  );
}
