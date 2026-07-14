'use client';

import React, { useEffect, useState } from 'react';
import { ShoppingBag } from 'lucide-react';
import Link from 'next/link';
import { usePathname } from 'next/navigation';
import { filsToDisplay } from '@/lib/money';

export function FloatingCart({ locale = 'ar' }: { locale?: string }) {
  const [cartItems, setCartItems] = useState<any[]>([]);
  const pathname = usePathname();

  // Hide floating cart on admin, pos, or if already in checkout/cart pages
  const isHiddenRoute = pathname.includes('/admin') || 
                        pathname.includes('/pos') || 
                        pathname.includes('/checkout') || 
                        pathname.includes('/cart');

  useEffect(() => {
    // Initial load
    const saved = localStorage.getItem('dahab_cart');
    if (saved) {
      try {
        setCartItems(JSON.parse(saved));
      } catch (e) {}
    }

    // Listen for storage events (if changed from another tab)
    const handleStorage = (e: StorageEvent) => {
      if (e.key === 'dahab_cart') {
        try {
          setCartItems(JSON.parse(e.newValue || '[]'));
        } catch (err) {}
      }
    };
    
    // Custom event dispatcher for intra-tab updates (dispatched by Add to Cart button)
    const handleCartUpdate = () => {
      const current = localStorage.getItem('dahab_cart');
      if (current) {
        try {
          setCartItems(JSON.parse(current));
        } catch (e) {}
      } else {
        setCartItems([]);
      }
    };

    window.addEventListener('storage', handleStorage);
    window.addEventListener('cart_updated', handleCartUpdate);
    
    // Poll just in case storage event misses intra-tab
    const interval = setInterval(handleCartUpdate, 2000);

    return () => {
      window.removeEventListener('storage', handleStorage);
      window.removeEventListener('cart_updated', handleCartUpdate);
      clearInterval(interval);
    };
  }, []);

  if (isHiddenRoute || cartItems.length === 0) {
    return null;
  }

  const totalQuantity = cartItems.reduce((sum, item) => sum + item.quantity, 0);
  const totalPrice = cartItems.reduce((sum, item) => sum + (item.price * item.quantity), 0);

  return (
<<<<<<< HEAD
    <div className="fixed bottom-6 right-6 z-50 animate-bounce-in">
      <Link href={`/${locale}/checkout`}>
        <div className="bg-[var(--color-forest-900)] hover:bg-[var(--color-forest-800)] text-white p-4 rounded-2xl shadow-2xl flex items-center gap-4 transition-transform hover:scale-105 border-2 border-[var(--color-champagne-600)]">
          <div className="relative">
            <ShoppingBag className="w-8 h-8 text-[var(--color-champagne-400)]" />
            <span className="absolute -top-2 -right-2 bg-red-600 text-white text-xs font-bold w-6 h-6 rounded-full flex items-center justify-center border-2 border-white">
              {totalQuantity}
            </span>
          </div>
          <div className="flex flex-col pr-2 border-r border-white/20">
            <span className="text-xs text-zinc-300">السلة</span>
            <span className="font-bold text-sm">{filsToDisplay(totalPrice, 'ar')}</span>
=======
    <div className="fixed z-[100] animate-bounce-in w-full bottom-0 left-0 right-0 md:w-auto md:bottom-6 md:right-6 md:left-auto" dir="rtl">
      <Link href={`/${locale}/checkout`} className="block w-full">
        <div className="bg-[var(--color-forest-900)] hover:bg-[var(--color-forest-800)] text-white p-4 md:rounded-2xl shadow-[0_-4px_20px_rgba(0,0,0,0.15)] md:shadow-2xl flex items-center justify-between md:justify-start gap-4 transition-transform md:hover:scale-105 border-t-2 md:border-2 border-[var(--color-champagne-600)]">
          <div className="flex items-center gap-4">
            <div className="relative">
              <ShoppingBag className="w-8 h-8 text-[var(--color-champagne-400)]" />
              <span className="absolute -top-2 -right-2 bg-red-600 text-white text-xs font-bold w-6 h-6 rounded-full flex items-center justify-center border-2 border-[var(--color-forest-900)]">
                {totalQuantity}
              </span>
            </div>
            <div className="flex flex-col pr-4 border-r border-white/20">
              <span className="text-xs text-zinc-300">إجمالي السلة</span>
              <span className="font-bold text-sm">{filsToDisplay(totalPrice, 'ar')}</span>
            </div>
          </div>
          
          <div className="md:hidden">
            <span className="bg-[var(--color-champagne-600)] text-white px-6 py-2 rounded font-bold text-sm">إتمام الطلب</span>
>>>>>>> f8d5952 (hehhee)
          </div>
        </div>
      </Link>
    </div>
  );
}
