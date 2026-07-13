'use client';

import React, { useActionState, useEffect, useState } from 'react';
import { processCheckout } from '@/actions/checkout';
import { filsToDisplay } from '@/lib/money';
import Link from 'next/link';

export default function CheckoutPage({ params }: { params: Promise<{ locale: string }> }) {
  const resolvedParams = React.use(params);
  const locale = resolvedParams.locale;
  const isAr = locale === 'ar';

  const [state, formAction, isPending] = useActionState(processCheckout, null);
  const [cartItems, setCartItems] = useState<any[]>([]);
  const [mounted, setMounted] = useState(false);
  const [zones, setZones] = useState<any[]>([]);
  const [selectedZoneId, setSelectedZoneId] = useState<string>('');

  useEffect(() => {
    const saved = localStorage.getItem('dahab_cart');
    if (saved) {
      try {
        setCartItems(JSON.parse(saved));
      } catch (e) {}
    }
    
    // Fetch shipping zones
    fetch('/api/shipping-zones')
      .then(res => res.json())
      .then(data => {
        if (data.success && data.zones) {
          setZones(data.zones);
          if (data.zones.length > 0) {
            setSelectedZoneId(data.zones[0].id);
          }
        }
      })
      .catch(console.error);

    setMounted(true);
  }, []);

  useEffect(() => {
    if (state?.success && state.whatsappUrl) {
      // Clear cart on success
      localStorage.removeItem('dahab_cart');
      window.location.href = state.whatsappUrl;
    }
  }, [state]);

  const getSubtotal = () => {
    return cartItems.reduce((acc, item) => acc + (item.price * item.quantity), 0);
  };

  const getSelectedZone = () => {
    return zones.find(z => z.id === selectedZoneId);
  };

  const getShippingFee = () => {
    const zone = getSelectedZone();
    if (!zone) return 0;
    const subtotal = getSubtotal();
    if (zone.freeShippingThreshold && subtotal >= zone.freeShippingThreshold) {
      return 0;
    }
    return zone.fee;
  };

  const getGrandTotal = () => {
    return getSubtotal() + getShippingFee();
  };

  const hasUnverifiedItems = cartItems.some(item => item.stockStatus === 'UNVERIFIED');

  if (!mounted) return null;

  return (
    <div className="container mx-auto px-6 py-12 bg-[var(--color-ivory-100)] min-h-screen">
      <h1 className="text-3xl font-bold font-heading text-[var(--color-forest-900)] mb-8">
        {isAr ? 'إتمام الشراء' : 'Checkout'}
      </h1>
      
      <div className="grid grid-cols-1 lg:grid-cols-2 gap-12">
        {/* Delivery Form */}
        <div>
          <form action={formAction} className="bg-white p-8 rounded-lg shadow-sm border border-[var(--color-ivory-200)]">
            <h2 className="text-xl font-bold text-zinc-900 mb-6">
              {isAr ? 'تفاصيل التوصيل' : 'Delivery Details'}
            </h2>
            
            <div className="space-y-4">
              <div>
                <label htmlFor="customerName" className="block text-sm font-medium text-zinc-700 mb-1">
                  {isAr ? 'الاسم الكامل' : 'Full Name'}
                </label>
                <input
                  type="text"
                  id="customerName"
                  name="customerName"
                  required
                  className="w-full border border-zinc-300 rounded px-4 py-2 focus:ring-2 focus:ring-[var(--color-champagne-600)] outline-none"
                />
              </div>
              
              <div>
                <label htmlFor="customerPhone" className="block text-sm font-medium text-zinc-700 mb-1">
                  {isAr ? 'رقم الهاتف (الأردن)' : 'Phone Number (Jordan)'}
                </label>
                <input
                  type="tel"
                  id="customerPhone"
                  name="customerPhone"
                  required
                  dir="ltr"
                  placeholder="07XXXXXXXX"
                  className="w-full border border-zinc-300 rounded px-4 py-2 text-right focus:ring-2 focus:ring-[var(--color-champagne-600)] outline-none"
                />
              </div>

              <div>
                <label htmlFor="shippingZoneId" className="block text-sm font-medium text-zinc-700 mb-1">
                  {isAr ? 'منطقة التوصيل' : 'Shipping Zone'}
                </label>
                <select
                  id="shippingZoneId"
                  name="shippingZoneId"
                  value={selectedZoneId}
                  onChange={(e) => setSelectedZoneId(e.target.value)}
                  className="w-full border border-zinc-300 rounded px-4 py-2 focus:ring-2 focus:ring-[var(--color-champagne-600)] outline-none bg-white text-zinc-700"
                >
                  {zones.map((zone) => (
                    <option key={zone.id} value={zone.id}>
                      {isAr ? zone.nameAr : zone.nameEn}
                    </option>
                  ))}
                </select>
              </div>

              {/* Hidden payload inputs */}
              <input type="hidden" name="items" value={JSON.stringify(cartItems)} />
            </div>

            {state?.error && (
              <div className="mt-6 p-4 bg-red-50 text-red-600 rounded text-sm font-bold">
                {state.error}
              </div>
            )}

            {hasUnverifiedItems && (
              <div className="mt-6 p-4 bg-amber-50 text-amber-800 border border-amber-200 rounded text-xs leading-relaxed">
                {isAr 
                  ? 'تنبيه: سلتك تحتوي على عطور تُصنع بالطلب أو بانتظار التحقق من المخزن. قد يتواصل معك فريق العمل لتأكيد الموعد النهائي للتوصيل.'
                  : 'Notice: Your cart contains custom-blended or unverified stock items. Our team will verify availability when processing your request.'}
              </div>
            )}

            <div className="mt-8">
              <button
                type="submit"
                disabled={isPending || cartItems.length === 0}
                className="w-full bg-[var(--color-forest-900)] hover:bg-[var(--color-forest-800)] text-white font-bold py-4 rounded transition-colors disabled:opacity-50"
              >
                {isPending ? (isAr ? 'جاري المعالجة...' : 'Processing...') : (isAr ? 'تأكيد الطلب عبر واتساب' : 'Confirm Order via WhatsApp')}
              </button>
            </div>
          </form>
        </div>

        {/* Order Summary */}
        <div>
          <div className="bg-white p-8 rounded-lg border border-[var(--color-ivory-200)] shadow-sm">
            <h2 className="text-xl font-bold text-zinc-900 mb-6">
              {isAr ? 'ملخص الطلب' : 'Order Summary'}
            </h2>
            
            {cartItems.length === 0 ? (
              <div className="text-center py-8 text-zinc-500">
                {isAr ? 'السلة فارغة.' : 'Your cart is empty.'}{' '}
                <Link href={`/${locale}/shop`} className="text-[var(--color-champagne-600)] underline">
                  {isAr ? 'تسوق الآن' : 'Shop now'}
                </Link>
              </div>
            ) : (
              <div className="space-y-4">
                {cartItems.map((item, idx) => (
                  <div key={idx} className="flex justify-between items-center border-b border-zinc-100 pb-4">
                    <div>
                      <h4 className="font-bold text-zinc-900">{item.name}</h4>
                      <p className="text-xs text-zinc-500">
                        {item.size} × {item.quantity}
                        {item.stockStatus === 'UNVERIFIED' && (
                          <span className="text-amber-600 font-bold ml-2">({isAr ? 'بانتظار تأكيد المخزن' : 'Pending verification'})</span>
                        )}
                      </p>
                    </div>
                    <span className="font-bold text-zinc-700">
                      {filsToDisplay(item.price * item.quantity, isAr ? 'ar' : 'en')}
                    </span>
                  </div>
                ))}
                
                <div className="pt-4 space-y-2 border-t border-zinc-200">
                  <div className="flex justify-between text-zinc-600">
                    <span>{isAr ? 'المجموع الفرعي' : 'Subtotal'}</span>
                    <span>{filsToDisplay(getSubtotal(), isAr ? 'ar' : 'en')}</span>
                  </div>
                  <div className="flex justify-between text-zinc-600">
                    <span>{isAr ? 'رسوم التوصيل' : 'Shipping Fee'}</span>
                    <span>
                      {getShippingFee() > 0 
                        ? filsToDisplay(getShippingFee(), isAr ? 'ar' : 'en') 
                        : (isAr ? 'شحن مجاني' : 'Free Shipping')}
                    </span>
                  </div>
                  <div className="flex justify-between text-xl font-bold text-[var(--color-forest-900)] pt-2 border-t">
                    <span>{isAr ? 'الإجمالي' : 'Total'}</span>
                    <span>{filsToDisplay(getGrandTotal(), isAr ? 'ar' : 'en')}</span>
                  </div>
                </div>
              </div>
            )}
          </div>
        </div>
      </div>
    </div>
  );
}
