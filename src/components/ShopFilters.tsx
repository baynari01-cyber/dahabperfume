'use client';

import React, { useState, useEffect } from 'react';
import { useRouter, useSearchParams } from 'next/navigation';

interface ShopFiltersProps {
  categories: { id: string; name: string; slug: string }[];
  genders: { id: string; name: string }[];
  families: { id: string; name: string }[];
  initialMinPrice?: number;
  initialMaxPrice?: number;
  initialCategory?: string;
  initialGender?: string;
  initialFamily?: string;
}

export function ShopFilters({ 
  categories, 
  genders,
  families,
  initialMinPrice = 0, 
  initialMaxPrice = 500, 
  initialCategory = '',
  initialGender = '',
  initialFamily = ''
}: ShopFiltersProps) {
  const router = useRouter();
  const searchParams = useSearchParams();
  const [searchQuery, setSearchQuery] = useState('');
  const [selectedCategory, setSelectedCategory] = useState(initialCategory);
  const [selectedGender, setSelectedGender] = useState(initialGender);
  const [selectedFamily, setSelectedFamily] = useState(initialFamily);

  const isFirstRender = React.useRef(true);

  useEffect(() => {
    setSearchQuery(searchParams.get('q') || '');
    setSelectedCategory(searchParams.get('category') || '');
    setSelectedGender(searchParams.get('gender') || '');
    setSelectedFamily(searchParams.get('family') || '');
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

      const currentGen = searchParams.get('gender') || '';
      if (selectedGender !== currentGen) {
        if (selectedGender) params.set('gender', selectedGender);
        else params.delete('gender');
        changed = true;
      }

      const currentFam = searchParams.get('family') || '';
      if (selectedFamily !== currentFam) {
        if (selectedFamily) params.set('family', selectedFamily);
        else params.delete('family');
        changed = true;
      }

      if (changed) {
        router.push(`?${params.toString()}`);
      }
    }, 400);

    return () => clearTimeout(delayDebounceFn);
  }, [searchQuery, selectedCategory, selectedGender, selectedFamily, router, searchParams]);

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
        <label className="block text-sm font-bold text-zinc-700 mb-2">الجنس</label>
        <select 
          value={selectedGender}
          onChange={(e) => setSelectedGender(e.target.value)}
          className="w-full border border-zinc-300 rounded px-3 py-2 text-sm focus:border-[var(--color-champagne-600)] outline-none bg-white"
        >
          <option value="">الجميع</option>
          {genders.map(g => (
            <option key={g.id} value={g.id}>{g.name}</option>
          ))}
        </select>
      </div>

      <div className="flex-1 min-w-[120px]">
        <label className="block text-sm font-bold text-zinc-700 mb-2">العائلة العطرية</label>
        <select 
          value={selectedFamily}
          onChange={(e) => setSelectedFamily(e.target.value)}
          className="w-full border border-zinc-300 rounded px-3 py-2 text-sm focus:border-[var(--color-champagne-600)] outline-none bg-white"
        >
          <option value="">الجميع</option>
          {families.map(f => (
            <option key={f.id} value={f.id}>{f.name}</option>
          ))}
        </select>
      </div>
    </div>
  );
}
