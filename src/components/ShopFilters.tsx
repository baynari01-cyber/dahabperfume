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
  const [minPrice, setMinPrice] = useState(initialMinPrice);
  const [maxPrice, setMaxPrice] = useState(initialMaxPrice);
  const [selectedCategory, setSelectedCategory] = useState(initialCategory);

  useEffect(() => {
    setMinPrice(Number(searchParams.get('minPrice')) || 0);
    setMaxPrice(Number(searchParams.get('maxPrice')) || 500);
    setSelectedCategory(searchParams.get('category') || '');
  }, [searchParams]);

  const handleApply = () => {
    const params = new URLSearchParams(searchParams.toString());
    params.set('minPrice', minPrice.toString());
    params.set('maxPrice', maxPrice.toString());
    if (selectedCategory) {
      params.set('category', selectedCategory);
    } else {
      params.delete('category');
    }
    router.push(`?${params.toString()}`);
  };

  return (
    <div className="bg-white p-6 rounded-lg shadow-sm border border-[var(--color-ivory-200)] sticky top-24">
      <h3 className="font-bold text-lg text-[var(--color-forest-900)] mb-4 border-b pb-2">تصفية البحث</h3>
      
      <div className="mb-6">
        <h4 className="font-bold text-sm text-zinc-700 mb-3">المجموعة</h4>
        <div className="space-y-2">
          <label className="flex items-center gap-2 cursor-pointer">
            <input 
              type="radio" 
              name="category"
              checked={selectedCategory === ''} 
              onChange={() => setSelectedCategory('')}
              className="text-[var(--color-champagne-600)] focus:ring-[var(--color-champagne-600)]" 
            />
            <span className="text-sm text-zinc-600">الجميع</span>
          </label>
          {categories.map(cat => (
            <label key={cat.id} className="flex items-center gap-2 cursor-pointer">
              <input 
                type="radio" 
                name="category"
                checked={selectedCategory === cat.id}
                onChange={() => setSelectedCategory(cat.id)}
                className="text-[var(--color-champagne-600)] focus:ring-[var(--color-champagne-600)]" 
              />
              <span className="text-sm text-zinc-600">{cat.name}</span>
            </label>
          ))}
        </div>
      </div>

      <div className="mb-6">
        <h4 className="font-bold text-sm text-zinc-700 mb-3">نطاق السعر (دينار)</h4>
        
        {/* Simple Dual Handle Slider using two range inputs overlayed */}
        <div className="relative h-2 bg-zinc-200 rounded-full mb-6">
          <div 
            className="absolute h-2 bg-[var(--color-champagne-600)] rounded-full" 
            style={{ 
              left: `${(minPrice / 500) * 100}%`, 
              right: `${100 - (maxPrice / 500) * 100}%` 
            }}
          ></div>
          <input 
            type="range" 
            min="0" 
            max="500" 
            value={minPrice} 
            onChange={(e) => setMinPrice(Math.min(Number(e.target.value), maxPrice - 5))}
            className="absolute w-full h-2 top-0 appearance-none pointer-events-none bg-transparent [&::-webkit-slider-thumb]:pointer-events-auto [&::-webkit-slider-thumb]:appearance-none [&::-webkit-slider-thumb]:w-4 [&::-webkit-slider-thumb]:h-4 [&::-webkit-slider-thumb]:rounded-full [&::-webkit-slider-thumb]:bg-white [&::-webkit-slider-thumb]:border-2 [&::-webkit-slider-thumb]:border-[var(--color-champagne-600)]"
            style={{ zIndex: minPrice > 250 ? 5 : 3 }}
          />
          <input 
            type="range" 
            min="0" 
            max="500" 
            value={maxPrice} 
            onChange={(e) => setMaxPrice(Math.max(Number(e.target.value), minPrice + 5))}
            className="absolute w-full h-2 top-0 appearance-none pointer-events-none bg-transparent [&::-webkit-slider-thumb]:pointer-events-auto [&::-webkit-slider-thumb]:appearance-none [&::-webkit-slider-thumb]:w-4 [&::-webkit-slider-thumb]:h-4 [&::-webkit-slider-thumb]:rounded-full [&::-webkit-slider-thumb]:bg-white [&::-webkit-slider-thumb]:border-2 [&::-webkit-slider-thumb]:border-[var(--color-champagne-600)]"
            style={{ zIndex: 4 }}
          />
        </div>
        
        <div className="flex justify-between items-center gap-2">
          <div className="flex-1">
            <span className="text-xs text-zinc-500 mb-1 block">من</span>
            <input 
              type="number" 
              value={minPrice} 
              onChange={(e) => setMinPrice(Number(e.target.value))}
              className="w-full border border-zinc-300 rounded px-2 py-1 text-sm text-center focus:border-[var(--color-champagne-600)] outline-none"
            />
          </div>
          <span className="text-zinc-400 mt-5">-</span>
          <div className="flex-1">
            <span className="text-xs text-zinc-500 mb-1 block">إلى</span>
            <input 
              type="number" 
              value={maxPrice} 
              onChange={(e) => setMaxPrice(Number(e.target.value))}
              className="w-full border border-zinc-300 rounded px-2 py-1 text-sm text-center focus:border-[var(--color-champagne-600)] outline-none"
            />
          </div>
        </div>
      </div>
      
      <button 
        onClick={handleApply}
        className="w-full bg-[var(--color-forest-900)] hover:bg-[var(--color-forest-800)] text-white py-2 rounded-md font-bold text-sm transition-colors"
      >
        تطبيق الفلاتر
      </button>
    </div>
  );
}
