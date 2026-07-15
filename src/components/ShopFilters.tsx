'use client';

import React, { useState, useEffect } from 'react';
import { useRouter, useSearchParams } from 'next/navigation';

interface ShopFiltersProps {
  categories: { id: string; name: string; slug: string }[];
  initialMinPrice?: number;
  initialMaxPrice?: number;
  initialCategory?: string;
}

export function ShopFilters({ categories, initialMinPrice = 0, initialMaxPrice = 500, initialCategory = '' }: ShopFiltersProps) {
  const router = useRouter();
  const searchParams = useSearchParams();
  const [searchQuery, setSearchQuery] = useState('');
  const [selectedCategory, setSelectedCategory] = useState(initialCategory);

  const isFirstRender = React.useRef(true);

  useEffect(() => {
    setSearchQuery(searchParams.get('q') || '');
    setSelectedCategory(searchParams.get('category') || '');
  }, [searchParams]);

  useEffect(() => {
    if (isFirstRender.current) {
      isFirstRender.current = false;
      return;
    }

    const delayDebounceFn = setTimeout(() => {
      const params = new URLSearchParams(searchParams.toString());
      let changed = false;

      const currentQ = searchParams.get('q') || '';
      if (searchQuery !== currentQ) {
        if (searchQuery) params.set('q', searchQuery);
        else params.delete('q');
        changed = true;
      }

      const currentCat = searchParams.get('category') || '';
      if (selectedCategory !== currentCat) {
        if (selectedCategory) params.set('category', selectedCategory);
        else params.delete('category');
        changed = true;
      }

      if (changed) {
        router.push(`?${params.toString()}`);
      }
    }, 400);

    return () => clearTimeout(delayDebounceFn);
  }, [searchQuery, selectedCategory, router, searchParams]);

  return (
    <div className="bg-white p-4 rounded-lg shadow-sm border border-[var(--color-ivory-200)] flex flex-col md:flex-row gap-4">
      <div className="flex-1 min-w-[200px]">
        <label className="block text-sm font-bold text-zinc-700 mb-2">بحث بالاسم</label>
        <input 
          type="text" 
          value={searchQuery}
          onChange={(e) => setSearchQuery(e.target.value)}
          placeholder="ابحث عن عطر..."
          className="w-full border border-zinc-300 rounded px-3 py-2 text-sm focus:border-[var(--color-champagne-600)] outline-none bg-white"
        />
      </div>

      <div className="flex-1 min-w-[150px]">
        <label className="block text-sm font-bold text-zinc-700 mb-2">المجموعة</label>
        <select 
          value={selectedCategory}
          onChange={(e) => setSelectedCategory(e.target.value)}
          className="w-full border border-zinc-300 rounded px-3 py-2 text-sm focus:border-[var(--color-champagne-600)] outline-none bg-white"
        >
          <option value="">الجميع</option>
          {categories.map(cat => (
            <option key={cat.id} value={cat.id}>{cat.name}</option>
          ))}
        </select>
      </div>

      <div className="flex-1 min-w-[120px]">
        <label className="block text-sm font-bold text-zinc-700 mb-2 text-zinc-400">الجنس</label>
        <select disabled className="w-full border border-zinc-200 text-zinc-400 rounded px-3 py-2 text-sm outline-none bg-zinc-50 cursor-not-allowed">
          <option>قريباً...</option>
        </select>
      </div>

      <div className="flex-1 min-w-[120px]">
        <label className="block text-sm font-bold text-zinc-700 mb-2 text-zinc-400">النوتات العطرية</label>
        <select disabled className="w-full border border-zinc-200 text-zinc-400 rounded px-3 py-2 text-sm outline-none bg-zinc-50 cursor-not-allowed">
          <option>قريباً...</option>
        </select>
      </div>
    </div>
  );
}
