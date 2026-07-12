'use client';
import React from 'react';
import Link from 'next/link';

export default function Page({ params }: { params: Promise<{ locale: string; slug?: string; orderReference?: string }> }) {
  const resolvedParams = React.use(params);
  const locale = resolvedParams.locale;
  const isAr = locale === 'ar';

  return (
    <div className="min-h-screen bg-[var(--color-ivory-50)] py-16 px-6 font-sans">
      <div className="max-w-4xl mx-auto bg-white border border-[var(--color-ivory-200)] rounded-xl p-8 shadow-sm">
        <h1 className="text-3xl font-bold font-heading text-[var(--color-forest-900)] mb-6 border-b border-[var(--color-ivory-100)] pb-4">
          {isAr ? 'دهب للعطور' : 'Dahab Perfumes'} - ABOUT
        </h1>
        <p className="text-zinc-600 mb-8 leading-relaxed">
          {isAr 
            ? 'هذه الصفحة قيد التطوير لتوفير أفضل تجربة تصفح وخدمة عطور فاخرة تليق بذوقكم.' 
            : 'This page is under active development to provide a premium fragrance browsing experience.'}
        </p>
        <Link 
          href={`/${locale}`}
          className="inline-block bg-[var(--color-forest-800)] text-white px-6 py-2.5 rounded-lg hover:bg-[var(--color-forest-900)] transition-colors font-medium text-sm"
        >
          {isAr ? 'العودة للرئيسية' : 'Return Home'}
        </Link>
      </div>
    </div>
  );
}
