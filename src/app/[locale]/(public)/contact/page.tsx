import React from 'react';
import { getCMSContent } from '@/lib/cms';

export default async function ContactPage({ params }: { params: Promise<{ locale: string }> }) {
  const resolvedParams = await params;
  const locale = resolvedParams.locale;
  const isAr = locale === 'ar';

  const locationInfo = await getCMSContent('store_location_info', {
    addressAr: 'عمان، الأردن - شارع مكة',
    addressEn: 'Amman, Jordan - Mecca St',
    hoursAr: '10:00 ص - 10:00 م',
    hoursEn: '10:00 AM - 10:00 PM',
    phone: '+962785050655'
  });

  return (
    <div className="container mx-auto px-6 py-16">
      <div className="max-w-3xl mx-auto bg-white border border-[var(--color-ivory-200)] rounded-lg p-10 shadow-sm">
        <h1 className="text-4xl font-bold font-heading text-[var(--color-forest-900)] mb-8 border-b pb-4">
          {isAr ? 'تواصل معنا' : 'Contact Us'}
        </h1>
        
        <div className="grid grid-cols-1 md:grid-cols-2 gap-10">
          <div>
            <h2 className="text-xl font-bold text-[var(--color-forest-900)] mb-4">
              {isAr ? 'معلومات الاتصال' : 'Contact Info'}
            </h2>
            <div className="space-y-4 text-zinc-700">
              <p>
                <strong>{isAr ? 'العنوان:' : 'Address:'}</strong> {isAr ? locationInfo.addressAr : locationInfo.addressEn}
              </p>
              <p>
                <strong>{isAr ? 'أوقات العمل:' : 'Opening Hours:'}</strong> {isAr ? locationInfo.hoursAr : locationInfo.hoursEn}
              </p>
              <p>
                <strong>{isAr ? 'رقم الهاتف/واتساب:' : 'Phone/WhatsApp:'}</strong> {locationInfo.phone}
              </p>
            </div>
            
            <div className="mt-8">
              <a
                href={`https://wa.me/${locationInfo.phone.replace(/[^0-9]/g, '')}`}
                target="_blank"
                rel="noopener noreferrer"
                className="inline-block bg-[#25D366] hover:bg-[#20ba5a] text-white px-6 py-3 rounded font-bold transition-colors"
              >
                {isAr ? 'تواصل معنا عبر واتساب' : 'Chat via WhatsApp'}
              </a>
            </div>
          </div>

          <div>
            <h2 className="text-xl font-bold text-[var(--color-forest-900)] mb-4">
              {isAr ? 'أرسل لنا رسالة' : 'Send a Message'}
            </h2>
            <form className="space-y-4">
              <div>
                <label className="block text-sm font-medium text-zinc-700 mb-1">
                  {isAr ? 'الاسم الكامل' : 'Full Name'}
                </label>
                <input
                  type="text"
                  required
                  className="w-full border border-zinc-300 rounded px-4 py-2 focus:ring-2 focus:ring-[var(--color-champagne-600)] outline-none"
                />
              </div>
              <div>
                <label className="block text-sm font-medium text-zinc-700 mb-1">
                  {isAr ? 'رقم الهاتف' : 'Phone Number'}
                </label>
                <input
                  type="tel"
                  required
                  className="w-full border border-zinc-300 rounded px-4 py-2 focus:ring-2 focus:ring-[var(--color-champagne-600)] outline-none"
                />
              </div>
              <div>
                <label className="block text-sm font-medium text-zinc-700 mb-1">
                  {isAr ? 'الرسالة' : 'Message'}
                </label>
                <textarea
                  rows={4}
                  required
                  className="w-full border border-zinc-300 rounded px-4 py-2 focus:ring-2 focus:ring-[var(--color-champagne-600)] outline-none"
                />
              </div>
              <button
                type="submit"
                className="w-full bg-[var(--color-forest-900)] hover:bg-[var(--color-forest-800)] text-white py-3 rounded font-bold transition-colors"
              >
                {isAr ? 'إرسال' : 'Send'}
              </button>
            </form>
          </div>
        </div>
      </div>
    </div>
  );
}
