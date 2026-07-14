import Link from 'next/link';
import Image from 'next/image';

export function Footer() {
  return (
    <footer className="bg-[var(--color-forest-900)] text-white pt-16 pb-8 border-t-4 border-[var(--color-champagne-600)]">
      <div className="container mx-auto px-6">
        <div className="grid grid-cols-1 md:grid-cols-3 gap-12 mb-12">
          
          {/* Logo & About */}
          <div className="col-span-1 md:col-span-1">
            <Link href="/ar" className="flex items-center gap-3 mb-6">
              <div className="bg-white/10 p-2 rounded-lg">
                <Image src="/logo.png" alt="Dahab Perfumes Logo" width={48} height={48} className="object-contain w-12 h-12" />
              </div>
              <span className="text-[var(--color-champagne-600)] font-heading font-bold text-3xl tracking-widest">
                DAHAB
              </span>
            </Link>
            <p className="text-zinc-300 mb-6 leading-relaxed">
              دهب للعطور.. نفحات مختارة بعناية من الشرق، لترافق هويتك وتُشعرك بالأصالة والتميز. فخامة تُترجم إلى عطر.
            </p>
            <div className="flex gap-4 text-[var(--color-champagne-600)]">
              {/* Social Icons Placeholder */}
              <a href="#" aria-label="Instagram" className="hover:text-white transition-colors">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><rect width="20" height="20" x="2" y="2" rx="5" ry="5"/><path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z"/><line x1="17.5" x2="17.51" y1="6.5" y2="6.5"/></svg>
              </a>
              <a href="#" aria-label="Snapchat" className="hover:text-white transition-colors">
                {/* Simulated Snapchat icon */}
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M11.64 2c3.48 0 5.48 2 6.54 3.2.14.15.54.54.54.54s1.26 2.05.5 3.33c-.76 1.28-2.6 1.5-2.6 1.5s-.83.1-1.34-.14c0 0-1.28 2.05-3.64 2.05s-3.64-2.05-3.64-2.05c-.5.24-1.34.14-1.34.14s-1.84-.22-2.6-1.5c-.76-1.28.5-3.33.5-3.33s.4-.39.54-.54C6.16 4 8.16 2 11.64 2Z"/><path d="M15.5 14.5c0 0 2 2.5 3 2.5s2-1 2-1-1 3-3 3-2.5-1-4-1-3 1-4 1-3-3-3-3 1 1 2 1 3-2.5 3-2.5"/></svg>
              </a>
              <a href="#" aria-label="TikTok" className="hover:text-white transition-colors">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M9 12a4 4 0 1 0 4 4V4a5 5 0 0 0 5 5"/></svg>
              </a>
            </div>
          </div>

          {/* Links 1 */}
          <div>
            <h4 className="text-xl font-bold font-heading mb-6 text-[var(--color-champagne-400)]">عن دهب</h4>
            <ul className="space-y-4 text-zinc-300">
              <li><Link href="/ar/about" className="hover:text-[var(--color-champagne-600)] transition-colors">قصتنا</Link></li>
              <li><Link href="/ar/ingredients" className="hover:text-[var(--color-champagne-600)] transition-colors">مكوناتنا</Link></li>
              <li><Link href="/ar/privacy" className="hover:text-[var(--color-champagne-600)] transition-colors">سياسة الخصوصية</Link></li>
              <li><Link href="/ar/terms" className="hover:text-[var(--color-champagne-600)] transition-colors">الشروط والأحكام</Link></li>
            </ul>
          </div>

          {/* Links 2 */}
          <div>
            <h4 className="text-xl font-bold font-heading mb-6 text-[var(--color-champagne-400)]">خدمة العملاء</h4>
            <ul className="space-y-4 text-zinc-300">
              <li><Link href="/ar/shipping" className="hover:text-[var(--color-champagne-600)] transition-colors">الشحن والتوصيل</Link></li>
              <li><Link href="/ar/returns" className="hover:text-[var(--color-champagne-600)] transition-colors">الاسترجاع والاستبدال</Link></li>
              <li><Link href="/ar/faq" className="hover:text-[var(--color-champagne-600)] transition-colors">الأسئلة الشائعة</Link></li>
              <li><Link href="/ar/contact" className="hover:text-[var(--color-champagne-600)] transition-colors">تواصل معنا</Link></li>
            </ul>
          </div>

        </div>

        <div className="pt-8 border-t border-zinc-800 text-center md:flex md:justify-between md:items-center">
          <p className="text-sm text-zinc-500 mb-4 md:mb-0">
            جميع الحقوق محفوظة © دهب للعطور {new Date().getFullYear()}
          </p>
          <div className="flex items-center justify-center gap-2 text-zinc-400 text-sm">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/><path d="m9 12 2 2 4-4"/></svg>
            صنع في الأردن
          </div>
        </div>
      </div>
    </footer>
  );
}
