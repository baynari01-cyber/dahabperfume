'use client';

import React, { useState } from 'react';
import { useRouter } from 'next/navigation';
import Link from 'next/link';
import { updateProduct } from '@/actions/products';
import { Loader2, Plus, Trash2, Search, X, GripVertical } from 'lucide-react';

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

interface AccordEntry {
  accordId: string;
  name: string;
  color: string | null;
  value: number;
  order: number;
}

interface AccordOption {
  id: string;
  name: string;
  color: string | null;
}

interface ProductOption {
  id: string;
  nameAr: string;
  nameEn: string;
  sku: string;
  imageUrl: string | null;
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
    genderId?: string | null;
    seasonId?: string | null;
    familyId?: string | null;
    stockLiters: number | string;
    variants: Variant[];
    images: ProductImage[];
    accords: AccordEntry[];
    similarProductIds: string[];
  };
  categories: Category[];
  genders?: Category[];
  seasons?: Category[];
  families?: Category[];
  allAccords?: AccordOption[];
  allProducts?: ProductOption[];
}

const DEFAULT_ACCORD_COLOR = '#6b7280';

export function ProductEditForm({
  productId,
  initialData,
  categories,
  genders = [],
  seasons = [],
  families = [],
  allAccords = [],
  allProducts = [],
}: ProductEditFormProps) {
  const router = useRouter();
  const [pending, setPending] = useState(false);
  const [error, setError] = useState('');
  const [preview, setPreview] = useState<string | null>(null);
  const [variants, setVariants] = useState<Variant[]>(initialData.variants);

  // Accords state
  const [accords, setAccords] = useState<AccordEntry[]>(initialData.accords);
  const [accordSearch, setAccordSearch] = useState('');
  const [showAccordDropdown, setShowAccordDropdown] = useState(false);

  // Similar products state
  const [similarSearch, setSimilarSearch] = useState('');
  const [selectedSimilarIds, setSelectedSimilarIds] = useState<string[]>(initialData.similarProductIds);

  const addVariant = () => {
    setVariants(prev => [...prev, { size: '', sku: '', price: 25000, isActive: true }]);
  };

  const removeVariant = (index: number) => {
    setVariants(prev => prev.filter((_, i) => i !== index));
  };

  const updateVariant = (index: number, field: keyof Variant, value: string | boolean | number) => {
    setVariants(prev => prev.map((v, i) => i === index ? { ...v, [field]: value } : v));
  };

  // Accord helpers
  const addAccord = (accord: AccordOption) => {
    if (accords.find(a => a.accordId === accord.id)) return;
    setAccords(prev => [...prev, {
      accordId: accord.id,
      name: accord.name,
      color: accord.color,
      value: 50,
      order: prev.length,
    }]);
    setAccordSearch('');
    setShowAccordDropdown(false);
  };

  const removeAccord = (accordId: string) => {
    setAccords(prev => prev.filter(a => a.accordId !== accordId));
  };

  const updateAccordValue = (accordId: string, value: number) => {
    setAccords(prev => prev.map(a => a.accordId === accordId ? { ...a, value } : a));
  };

  const filteredAccords = allAccords.filter(a =>
    !accords.find(existing => existing.accordId === a.id) &&
    a.name.toLowerCase().includes(accordSearch.toLowerCase())
  );

  // Similar products helpers
  const toggleSimilar = (productId: string) => {
    setSelectedSimilarIds(prev =>
      prev.includes(productId) ? prev.filter(id => id !== productId) : [...prev, productId]
    );
  };

  const filteredProducts = allProducts.filter(p =>
    p.nameAr.toLowerCase().includes(similarSearch.toLowerCase()) ||
    p.nameEn.toLowerCase().includes(similarSearch.toLowerCase()) ||
    p.sku.toLowerCase().includes(similarSearch.toLowerCase())
  );

  const mainImage = initialData.images.find(img => img.isMain) || initialData.images[0];

  const handleSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    setPending(true);
    setError('');

    try {
      const formData = new FormData(e.currentTarget);

      const variantsForAction = variants.map(v => ({
        id: v.id,
        size: v.size,
        sku: v.size ? `${initialData.sku}-${v.size.toUpperCase().replace(/\s+/g, '')}` : v.sku,
        price: typeof v.price === 'string' ? Math.round(parseFloat(v.price) * 1000) : v.price,
        isActive: v.isActive
      }));
      formData.set('variants', JSON.stringify(variantsForAction));

      // Send accords
      formData.set('accords', JSON.stringify(accords.map((a, idx) => ({
        accordId: a.accordId,
        value: a.value,
        order: idx,
      }))));

      // Send similar product ids
      formData.set('similarProductIds', JSON.stringify(selectedSimilarIds));

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
          <input type="text" name="sku" readOnly value={initialData.sku} required dir="ltr" className="w-full border rounded p-2 text-sm font-mono text-left outline-none focus:border-[var(--color-champagne-600)] bg-zinc-50 cursor-not-allowed text-zinc-500" />
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

      <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
        <div>
          <label className="block text-sm font-bold text-zinc-700 mb-2">الجنس</label>
          <select name="genderId" defaultValue={initialData.genderId || ''} className="w-full border rounded p-2 text-sm outline-none bg-white focus:border-[var(--color-champagne-600)]">
            <option value="">-- بدون --</option>
            {genders.map(g => (
              <option key={g.id} value={g.id}>{g.name}</option>
            ))}
          </select>
        </div>
        <div>
          <label className="block text-sm font-bold text-zinc-700 mb-2">الموسم</label>
          <select name="seasonId" defaultValue={initialData.seasonId || ''} className="w-full border rounded p-2 text-sm outline-none bg-white focus:border-[var(--color-champagne-600)]">
            <option value="">-- بدون --</option>
            {seasons.map(s => (
              <option key={s.id} value={s.id}>{s.name}</option>
            ))}
          </select>
        </div>
        <div>
          <label className="block text-sm font-bold text-zinc-700 mb-2">العائلة العطرية</label>
          <select name="familyId" defaultValue={initialData.familyId || ''} className="w-full border rounded p-2 text-sm outline-none bg-white focus:border-[var(--color-champagne-600)]">
            <option value="">-- بدون --</option>
            {families.map(f => (
              <option key={f.id} value={f.id}>{f.name}</option>
            ))}
          </select>
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
                <input type="text" value={v.size ? `${initialData.sku}-${v.size.toUpperCase().replace(/\s+/g, '')}` : ''} readOnly className="w-full border rounded p-1.5 text-xs font-mono outline-none bg-zinc-50 cursor-not-allowed text-zinc-500" dir="ltr" />
                <input type="hidden" name={`variants[${i}].sku`} value={v.size ? `${initialData.sku}-${v.size.toUpperCase().replace(/\s+/g, '')}` : ''} />
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

      {/* ═══════════════════════════════════════════════════════════════ */}
      {/* Main Accords Manager */}
      {/* ═══════════════════════════════════════════════════════════════ */}
      <div className="border border-zinc-200 rounded-lg p-4 space-y-4">
        <div className="flex justify-between items-center">
          <label className="text-sm font-bold text-zinc-700">🎵 Main Accords (الروائح الأساسية)</label>
          <span className="text-xs text-zinc-400">{accords.length} / كل ما تريد</span>
        </div>

        {/* Add accord dropdown */}
        <div className="relative">
          <div className="flex items-center gap-2 border rounded p-2 bg-white focus-within:border-[var(--color-champagne-600)] transition-colors">
            <Search className="w-4 h-4 text-zinc-400 flex-shrink-0" />
            <input
              type="text"
              placeholder="ابحث عن رائحة لإضافتها..."
              value={accordSearch}
              onChange={e => { setAccordSearch(e.target.value); setShowAccordDropdown(true); }}
              onFocus={() => setShowAccordDropdown(true)}
              onBlur={() => setTimeout(() => setShowAccordDropdown(false), 200)}
              className="flex-1 text-sm outline-none bg-transparent"
            />
          </div>
          {showAccordDropdown && filteredAccords.length > 0 && (
            <div className="absolute top-full left-0 right-0 z-10 bg-white border border-zinc-200 rounded-lg shadow-lg mt-1 max-h-48 overflow-y-auto">
              {filteredAccords.map(accord => (
                <button
                  key={accord.id}
                  type="button"
                  onMouseDown={() => addAccord(accord)}
                  className="w-full flex items-center gap-3 px-3 py-2 hover:bg-zinc-50 transition-colors text-right"
                >
                  <span
                    className="w-4 h-4 rounded-full flex-shrink-0 border border-white/20"
                    style={{ backgroundColor: accord.color || DEFAULT_ACCORD_COLOR }}
                  />
                  <span className="text-sm text-zinc-700">{accord.name}</span>
                </button>
              ))}
            </div>
          )}
          {showAccordDropdown && accordSearch && filteredAccords.length === 0 && (
            <div className="absolute top-full left-0 right-0 z-10 bg-white border border-zinc-200 rounded-lg shadow-lg mt-1 px-3 py-2 text-sm text-zinc-400">
              لا توجد نتائج
            </div>
          )}
        </div>

        {/* Accords list with sliders */}
        {accords.length === 0 ? (
          <p className="text-sm text-zinc-400 text-center py-4 border border-dashed border-zinc-200 rounded-lg">
            لم تُضف أي روائح بعد. ابحث وأضف من الأعلى.
          </p>
        ) : (
          <div className="space-y-3">
            {accords.map(accord => (
              <div key={accord.accordId} className="flex items-center gap-3 bg-zinc-50 rounded-lg p-3">
                <span
                  className="w-5 h-5 rounded-full flex-shrink-0 border border-white shadow-sm"
                  style={{ backgroundColor: accord.color || DEFAULT_ACCORD_COLOR }}
                />
                <span className="text-sm font-medium text-zinc-700 w-24 flex-shrink-0">{accord.name}</span>
                <div className="flex-1 flex items-center gap-3">
                  <input
                    type="range"
                    min="1"
                    max="100"
                    value={accord.value}
                    onChange={e => updateAccordValue(accord.accordId, parseInt(e.target.value))}
                    className="flex-1 h-2 accent-[var(--color-champagne-600)] cursor-pointer"
                    style={{ accentColor: accord.color || undefined }}
                  />
                  <span className="text-xs font-bold text-zinc-500 w-8 text-center">{accord.value}</span>
                </div>
                <button
                  type="button"
                  onClick={() => removeAccord(accord.accordId)}
                  className="text-red-400 hover:text-red-600 transition-colors flex-shrink-0"
                >
                  <X className="w-4 h-4" />
                </button>
              </div>
            ))}
          </div>
        )}

        {/* Preview */}
        {accords.length > 0 && (
          <div className="bg-[#1c1c1c] rounded-xl p-4 w-full" dir="ltr">
            <p className="text-zinc-400 text-xs text-center mb-3 tracking-widest uppercase">معاينة · main accords</p>
            <div className="flex flex-col space-y-1.5">
              {[...accords].sort((a, b) => b.value - a.value).map(accord => (
                <div key={accord.accordId} className="relative w-full h-8 flex items-center">
                  <div
                    className="h-full rounded-r-lg flex items-center px-3 transition-all"
                    style={{
                      width: `${Math.min(100, Math.max(10, accord.value))}%`,
                      backgroundColor: accord.color || DEFAULT_ACCORD_COLOR,
                    }}
                  >
                    <span className="text-white text-xs font-bold truncate">{accord.name}</span>
                  </div>
                </div>
              ))}
            </div>
          </div>
        )}
      </div>

      {/* ═══════════════════════════════════════════════════════════════ */}
      {/* Similar Products Manager */}
      {/* ═══════════════════════════════════════════════════════════════ */}
      <div className="border border-zinc-200 rounded-lg p-4 space-y-4">
        <div className="flex justify-between items-center">
          <label className="text-sm font-bold text-zinc-700">✨ المنتجات المشابهة (المقترحة)</label>
          <span className="text-xs text-zinc-400">
            {selectedSimilarIds.length === 0 ? 'افتراضي: أول 3 منتجات' : `${selectedSimilarIds.length} منتج محدد`}
          </span>
        </div>
        <p className="text-xs text-zinc-400">
          اختر المنتجات التي ستظهر كمقترحات في صفحة هذا العطر. إذا لم تختر أي منتج، ستظهر أول 3 منتجات من المتجر تلقائياً.
        </p>

        {/* Search */}
        <div className="flex items-center gap-2 border rounded p-2 bg-white focus-within:border-[var(--color-champagne-600)] transition-colors">
          <Search className="w-4 h-4 text-zinc-400 flex-shrink-0" />
          <input
            type="text"
            placeholder="ابحث عن منتج..."
            value={similarSearch}
            onChange={e => setSimilarSearch(e.target.value)}
            className="flex-1 text-sm outline-none bg-transparent"
          />
          {similarSearch && (
            <button type="button" onClick={() => setSimilarSearch('')}>
              <X className="w-4 h-4 text-zinc-400 hover:text-zinc-600" />
            </button>
          )}
        </div>

        {/* Products list */}
        <div className="max-h-64 overflow-y-auto border border-zinc-100 rounded-lg divide-y divide-zinc-50">
          {filteredProducts.length === 0 ? (
            <p className="text-sm text-zinc-400 text-center py-4">لا توجد منتجات مطابقة</p>
          ) : (
            filteredProducts.map(product => {
              const isSelected = selectedSimilarIds.includes(product.id);
              return (
                <label
                  key={product.id}
                  className={`flex items-center gap-3 px-3 py-2 cursor-pointer transition-colors ${isSelected ? 'bg-[var(--color-champagne-50)]' : 'hover:bg-zinc-50'}`}
                >
                  <input
                    type="checkbox"
                    checked={isSelected}
                    onChange={() => toggleSimilar(product.id)}
                    className="w-4 h-4 accent-[var(--color-champagne-600)]"
                  />
                  {product.imageUrl && (
                    <div
                      className="w-10 h-10 rounded-md bg-zinc-100 flex-shrink-0 bg-cover bg-center bg-no-repeat"
                      style={{ backgroundImage: `url("${product.imageUrl.startsWith('local://') ? '/product-placeholder.png' : product.imageUrl}")` }}
                    />
                  )}
                  <div className="flex-1 min-w-0">
                    <p className="text-sm font-medium text-zinc-800 truncate">{product.nameAr}</p>
                    <p className="text-xs text-zinc-400">{product.sku}</p>
                  </div>
                  {isSelected && (
                    <span className="text-xs font-bold text-[var(--color-champagne-600)] bg-[var(--color-champagne-100)] px-2 py-0.5 rounded-full flex-shrink-0">محدد</span>
                  )}
                </label>
              );
            })
          )}
        </div>

        {/* Selected chips */}
        {selectedSimilarIds.length > 0 && (
          <div className="flex flex-wrap gap-2">
            {selectedSimilarIds.map(sid => {
              const p = allProducts.find(p => p.id === sid);
              if (!p) return null;
              return (
                <span key={sid} className="flex items-center gap-1 bg-[var(--color-champagne-100)] text-[var(--color-charcoal-700)] text-xs px-2 py-1 rounded-full border border-[var(--color-champagne-300)]">
                  {p.nameAr}
                  <button type="button" onClick={() => toggleSimilar(sid)} className="hover:text-red-500 transition-colors">
                    <X className="w-3 h-3" />
                  </button>
                </span>
              );
            })}
            <button
              type="button"
              onClick={() => setSelectedSimilarIds([])}
              className="text-xs text-zinc-400 hover:text-red-500 transition-colors underline"
            >
              إلغاء الكل
            </button>
          </div>
        )}
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
        <Link href="/admin/products" className="px-6 py-2 border rounded font-bold text-zinc-600 hover:bg-zinc-50 transition-colors text-sm">
          إلغاء
        </Link>
        <button type="submit" disabled={pending} className="bg-[var(--color-charcoal-900)] text-white px-8 py-2 rounded font-bold hover:bg-[var(--color-charcoal-800)] transition-colors text-sm shadow-sm disabled:opacity-60 flex items-center gap-2">
          {pending && <Loader2 className="w-4 h-4 animate-spin" />}
          {pending ? 'جاري الحفظ...' : 'حفظ التعديلات'}
        </button>
      </div>

    </form>
  );
}
