'use client';

import React from 'react';

export type AccordData = {
  id: string;
  name: string;
  value: number;
};

interface ProductMainAccordsProps {
  accords: AccordData[];
}

const ACCORD_COLORS: Record<string, { bg: string; text: string }> = {
  'فانيلا': { bg: '#fdf4cb', text: '#000000' },
  'vanilla': { bg: '#fdf4cb', text: '#000000' },
  'تبغ': { bg: '#b67b3e', text: '#ffffff' },
  'tobacco': { bg: '#b67b3e', text: '#ffffff' },
  'توابل دافئة': { bg: '#c04829', text: '#ffffff' },
  'warm spicy': { bg: '#c04829', text: '#ffffff' },
  'حلو': { bg: '#cd3f48', text: '#ffffff' },
  'sweet': { bg: '#cd3f48', text: '#ffffff' },
  'قرفة': { bg: '#a66332', text: '#ffffff' },
  'cinnamon': { bg: '#a66332', text: '#ffffff' },
  'بودري': { bg: '#b3aca0', text: '#ffffff' },
  'powdery': { bg: '#b3aca0', text: '#ffffff' },
  'توابل منعشة': { bg: '#6e8c3a', text: '#ffffff' },
  'fresh spicy': { bg: '#6e8c3a', text: '#ffffff' },
  'حمضي': { bg: '#f28e2b', text: '#ffffff' },
  'citrus': { bg: '#f28e2b', text: '#ffffff' },
  'خشبي': { bg: '#5c4033', text: '#ffffff' },
  'woody': { bg: '#5c4033', text: '#ffffff' },
  'أروماتك': { bg: '#4a807c', text: '#ffffff' },
  'aromatic': { bg: '#4a807c', text: '#ffffff' },
};

const DEFAULT_COLOR = { bg: '#6b7280', text: '#ffffff' };

export default function ProductMainAccords({ accords }: ProductMainAccordsProps) {
  if (!accords || accords.length === 0) return null;

  const sortedAccords = [...accords].sort((a, b) => b.value - a.value);

  return (
    <div className="bg-[#1c1c1c] rounded-xl p-6 w-full shadow-lg border border-zinc-800" dir="ltr">
      <h3 className="text-white text-center text-xl font-medium tracking-widest uppercase mb-6" style={{ letterSpacing: '0.2em' }}>
        main accords
      </h3>
      
      <div className="flex flex-col space-y-2 relative">
        <div className="absolute left-0 top-0 bottom-0 w-[2px] bg-zinc-700/50 rounded-full" />
        
        {sortedAccords.map((accord) => {
          const colorData = ACCORD_COLORS[accord.name.toLowerCase()] || DEFAULT_COLOR;
          // Use the raw value as percentage directly (cap at 100%)
          const percentage = Math.min(100, Math.max(10, accord.value));
          
          return (
            <div key={accord.id} className="relative w-full h-10 flex items-center pr-12 group">
              <div 
                className="h-full rounded-r-lg transition-all duration-700 ease-out flex items-center justify-center relative overflow-hidden group-hover:brightness-110"
                style={{ 
                  width: `${percentage}%`,
                  backgroundColor: colorData.bg
                }}
              >
                <span 
                  className="font-bold text-sm sm:text-base px-4 truncate w-full text-center relative z-10 transition-transform duration-300"
                  style={{ 
                    color: colorData.text,
                    textShadow: colorData.text === '#ffffff' ? '0px 1px 2px rgba(0,0,0,0.4)' : 'none'
                  }}
                  title={accord.name}
                >
                  {accord.name}
                </span>
                
                <div className="absolute inset-0 -translate-x-full bg-gradient-to-r from-transparent via-white/20 to-transparent group-hover:animate-[shimmer_1.5s_infinite]" />
              </div>
              
              <div className="absolute right-2 text-zinc-400 text-sm font-bold font-mono whitespace-nowrap">
                {accord.value}%
              </div>
            </div>
          );
        })}
      </div>
    </div>
  );
}
