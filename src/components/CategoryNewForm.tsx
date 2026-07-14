'use client';

import React, { useTransition } from 'react';
import { createCategory } from '@/actions/categories';
import { useRouter } from 'next/navigation';

export function CategoryNewForm() {
  const [isPending, startTransition] = useTransition();
  const router = useRouter();

  const handleSubmit = (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    const formData = new FormData(e.currentTarget);
    
    startTransition(async () => {
      const res = await createCategory(formData);
      if (res.success) {
        alert('تمت إضافة المجموعة بنجاح');
        (e.target as HTMLFormElement).reset();
        router.refresh();
      } else {
        alert(res.error || 'حدث خطأ أثناء إضافة المجموعة');
      }
    });
  };

  return (
    <form onSubmit={handleSubmit} className="bg-white p-6 rounded-lg border border-[var(--color-ivory-200)] shadow-sm h-fit">
      <h3 className="text-lg font-bold text-[var(--color-forest-900)] mb-4 border-b pb-2">
        إضافة مجموعة جديدة
      </h3>
      <div className="space-y-4">
        <div>
          <label className="block text-sm font-medium text-zinc-700 mb-1">صورة المجموعة (مطلوب)</label>
          <input 
            type="file" 
            name="image"
            required
            accept="image/*"
            className="w-full border border-zinc-200 rounded px-3 py-2 text-sm bg-white outline-none focus:border-[var(--color-forest-800)]"
          />
        </div>
        <div>
          <label className="block text-sm font-medium text-zinc-700 mb-1">اسم المجموعة</label>
          <input 
            type="text" 
            name="name"
            required
            placeholder="مثال: عطور صيفية"
            className="w-full border border-zinc-200 rounded px-3 py-2 text-sm bg-white outline-none focus:border-[var(--color-forest-800)]"
          />
        </div>
        <button 
          type="submit"
          disabled={isPending} 
          className="w-full bg-[var(--color-forest-900)] text-white py-2.5 rounded font-bold text-sm hover:bg-[var(--color-forest-800)] disabled:opacity-50 transition-colors"
        >
          {isPending ? 'جاري الإضافة...' : 'إضافة مجموعة'}
        </button>
      </div>
    </form>
  );
}
