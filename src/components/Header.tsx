import Link from 'next/link';

export function Header() {
  return (
    <header className="w-full bg-[var(--color-ivory-100)] border-b border-[var(--color-ivory-200)] sticky top-0 z-50">
      {/* Top Bar */}
      <div className="bg-[var(--color-forest-900)] text-white text-xs md:text-sm py-2 text-center font-bold">
        توصيل مجاني لجميع الطلبات داخل الأردن
      </div>
      
      {/* Main Navigation */}
      <div className="container mx-auto px-6 py-4 flex items-center justify-between">
        
        {/* Left Side: Icons (Cart, Account, Search) */}
        <div className="flex items-center gap-4 text-[var(--color-forest-900)]">
          <button aria-label="Cart" className="hover:text-[var(--color-champagne-600)] transition-colors">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><circle cx="8" cy="21" r="1"/><circle cx="19" cy="21" r="1"/><path d="M2.05 2.05h2l2.66 12.42a2 2 0 0 0 2 1.58h9.78a2 2 0 0 0 1.95-1.57l1.65-7.43H5.12"/></svg>
          </button>
          <button aria-label="Account" className="hover:text-[var(--color-champagne-600)] transition-colors">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M19 21v-2a4 4 0 0 0-4-4H9a4 4 0 0 0-4 4v2"/><circle cx="12" cy="7" r="4"/></svg>
          </button>
          <button aria-label="Search" className="hover:text-[var(--color-champagne-600)] transition-colors">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><circle cx="11" cy="11" r="8"/><path d="m21 21-4.3-4.3"/></svg>
          </button>
        </div>

        {/* Center: Navigation Links */}
        <nav className="hidden md:flex items-center gap-8 font-bold text-[var(--color-forest-900)]">
          <Link href="/ar" className="text-[var(--color-champagne-600)]">الرئيسية</Link>
          <Link href="/ar/shop" className="hover:text-[var(--color-champagne-600)] transition-colors">المتجر</Link>
          <Link href="/ar/collections" className="hover:text-[var(--color-champagne-600)] transition-colors">المجموعات</Link>
          <Link href="/ar/about" className="hover:text-[var(--color-champagne-600)] transition-colors">عن دهب</Link>
          <Link href="/ar/contact" className="hover:text-[var(--color-champagne-600)] transition-colors">تواصل معنا</Link>
        </nav>

        {/* Right Side: Logo */}
        <Link href="/ar" className="flex items-center text-[var(--color-champagne-600)] font-heading font-bold text-2xl tracking-widest">
          DAHAB
        </Link>
      </div>
    </header>
  );
}
