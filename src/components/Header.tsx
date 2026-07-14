'use client';

import Link from 'next/link';
import Image from 'next/image';
import { usePathname } from 'next/navigation';
import { useEffect, useState } from 'react';

export function Header() {
  const pathname = usePathname() || '/ar';
  const locale = pathname.startsWith('/en') ? 'en' : 'ar';

  const [cartCount, setCartCount] = useState(0);
  const [isMobileMenuOpen, setIsMobileMenuOpen] = useState(false);

  useEffect(() => {
    const checkCart = () => {
      try {
        const saved = localStorage.getItem('dahab_cart');
        if (saved) {
          const items = JSON.parse(saved);
          const count = items.reduce((acc: number, item: any) => acc + (item.quantity || 1), 0);
          setCartCount(count);
        }
      } catch {}
    };
    checkCart();
    window.addEventListener('storage', checkCart);
    return () => window.removeEventListener('storage', checkCart);
  }, []);

  const toggleLocale = () => {
    const newLocale = locale === 'ar' ? 'en' : 'ar';
    const newPath = pathname.replace(`/${locale}`, `/${newLocale}`);
    window.location.href = newPath || `/${newLocale}`;
  };

  return (
    <header className="w-full bg-[var(--color-ivory-100)] border-b border-[var(--color-ivory-200)] sticky top-0 z-50">
      <div className="container mx-auto px-6 py-4 flex items-center justify-between">
        {/* Mobile Hamburger Button */}
        <button 
          className="md:hidden text-[var(--color-forest-900)] hover:text-[var(--color-champagne-600)] transition-colors"
          onClick={() => setIsMobileMenuOpen(true)}
          aria-label="Open mobile menu"
        >
          <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><line x1="4" x2="20" y1="12" y2="12"/><line x1="4" x2="20" y1="6" y2="6"/><line x1="4" x2="20" y1="18" y2="18"/></svg>
        </button>

        {/* Action Icons (Desktop mostly, but Cart/Lang can show on mobile) */}
        <div className="flex items-center gap-3 sm:gap-4 text-[var(--color-forest-900)]">
          {/* Language Switcher */}
          <button onClick={toggleLocale} aria-label="Language Switch" className="hover:text-[var(--color-champagne-600)] transition-colors flex items-center gap-1 font-bold text-sm">
            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><circle cx="12" cy="12" r="10"/><path d="M12 2a14.5 14.5 0 0 0 0 20 14.5 14.5 0 0 0 0-20"/><path d="M2 12h20"/></svg>
            {locale === 'ar' ? 'EN' : 'AR'}
          </button>
          
          {/* Wishlist */}
          <Link href={`/${locale}/wishlist`} aria-label="Wishlist" className="hover:text-[var(--color-champagne-600)] transition-colors relative">
            <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z"/></svg>
          </Link>
          
          {/* Cart */}
          <Link href={`/${locale}/cart`} aria-label="Cart" className="hover:text-[var(--color-champagne-600)] transition-colors relative">
            <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z"/><path d="M3 6h18"/><path d="M16 10a4 4 0 0 1-8 0"/></svg>
            {cartCount > 0 && (
              <span className="absolute -top-1.5 -right-2 bg-[var(--color-champagne-600)] text-white text-[10px] font-bold w-4 h-4 rounded-full flex items-center justify-center">
                {cartCount}
              </span>
            )}
          </Link>
        </div>

        {/* Center: Navigation Links */}
        <nav className="hidden md:flex items-center gap-8 font-bold text-[var(--color-forest-900)]">
          <Link href={`/${locale}`} className="text-[var(--color-champagne-600)]">الرئيسية</Link>
          <Link href={`/${locale}/shop`} className="hover:text-[var(--color-champagne-600)] transition-colors">المتجر</Link>
          <Link href={`/${locale}/collections`} className="hover:text-[var(--color-champagne-600)] transition-colors">المجموعات</Link>
          <Link href={`/${locale}/about`} className="hover:text-[var(--color-champagne-600)] transition-colors">عن دهب</Link>
          <Link href={`/${locale}/contact`} className="hover:text-[var(--color-champagne-600)] transition-colors">تواصل معنا</Link>
        </nav>

        {/* Right Side: Logo */}
        <Link href={`/${locale}`} className="flex items-center gap-2">
          <Image src="/logo.png" alt="Dahab Perfumes Logo" width={40} height={40} className="object-contain w-10 h-10" />
          <span className="text-[var(--color-champagne-600)] font-heading font-bold text-xl tracking-widest hidden sm:inline-block">DAHAB</span>
        </Link>
      </div>

      {/* Mobile Drawer Menu */}
      {isMobileMenuOpen && (
        <div className="md:hidden fixed inset-0 z-[100] flex" dir={locale === 'ar' ? 'rtl' : 'ltr'}>
          {/* Backdrop */}
          <div 
            className="fixed inset-0 bg-black/50 transition-opacity"
            onClick={() => setIsMobileMenuOpen(false)}
          />
          {/* Drawer Content */}
          <div className="relative w-4/5 max-w-sm bg-[var(--color-ivory-100)] h-full shadow-2xl flex flex-col transform transition-transform duration-300">
            <div className="p-6 flex items-center justify-between border-b border-[var(--color-ivory-200)]">
              <Link href={`/${locale}`} className="flex items-center gap-2" onClick={() => setIsMobileMenuOpen(false)}>
                <Image src="/logo.png" alt="Dahab Perfumes Logo" width={32} height={32} className="object-contain" />
                <span className="text-[var(--color-champagne-600)] font-heading font-bold text-lg tracking-widest">DAHAB</span>
              </Link>
              <button 
                onClick={() => setIsMobileMenuOpen(false)}
                className="p-2 text-zinc-500 hover:text-red-500 rounded-full hover:bg-zinc-100"
              >
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M18 6 6 18"/><path d="m6 6 12 12"/></svg>
              </button>
            </div>
            
            <nav className="flex-1 overflow-y-auto py-6 px-6 flex flex-col gap-6 text-lg font-bold text-[var(--color-forest-900)]">
              <Link href={`/${locale}`} onClick={() => setIsMobileMenuOpen(false)} className="hover:text-[var(--color-champagne-600)] transition-colors border-b border-zinc-100 pb-2">الرئيسية</Link>
              <Link href={`/${locale}/shop`} onClick={() => setIsMobileMenuOpen(false)} className="hover:text-[var(--color-champagne-600)] transition-colors border-b border-zinc-100 pb-2">المتجر</Link>
              <Link href={`/${locale}/collections`} onClick={() => setIsMobileMenuOpen(false)} className="hover:text-[var(--color-champagne-600)] transition-colors border-b border-zinc-100 pb-2">المجموعات العطرية</Link>
              <Link href={`/${locale}/about`} onClick={() => setIsMobileMenuOpen(false)} className="hover:text-[var(--color-champagne-600)] transition-colors border-b border-zinc-100 pb-2">عن دهب</Link>
              <Link href={`/${locale}/contact`} onClick={() => setIsMobileMenuOpen(false)} className="hover:text-[var(--color-champagne-600)] transition-colors border-b border-zinc-100 pb-2">تواصل معنا</Link>
              <Link href={`/${locale}/wishlist`} onClick={() => setIsMobileMenuOpen(false)} className="hover:text-[var(--color-champagne-600)] transition-colors border-b border-zinc-100 pb-2">قائمة المفضلة</Link>
            </nav>
            
            <div className="p-6 border-t border-[var(--color-ivory-200)] bg-white mt-auto">
              <button onClick={toggleLocale} className="w-full py-3 bg-[var(--color-forest-900)] text-white font-bold rounded flex items-center justify-center gap-2 hover:bg-[var(--color-forest-800)]">
                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><circle cx="12" cy="12" r="10"/><path d="M12 2a14.5 14.5 0 0 0 0 20 14.5 14.5 0 0 0 0-20"/><path d="M2 12h20"/></svg>
                {locale === 'ar' ? 'Switch to English' : 'التبديل للعربية'}
              </button>
            </div>
          </div>
        </div>
      )}
    </header>
  );
}
