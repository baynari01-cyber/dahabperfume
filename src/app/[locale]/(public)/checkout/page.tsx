'use client';

import { useActionState, useEffect, useState } from 'react';
import { processCheckout } from '@/actions/checkout';
import Link from 'next/link';

export default function CheckoutPage() {
  const [state, formAction, isPending] = useActionState(processCheckout, null);
  const [cartItems, setCartItems] = useState<any[]>([]);
  const [mounted, setMounted] = useState(false);

  useEffect(() => {
    // In a real app, this would be loaded from a robust cart context or localStorage
    // For now, we simulate an empty cart if not loaded
    const saved = localStorage.getItem('dahab_cart');
    if (saved) {
      try { setCartItems(JSON.parse(saved)); } catch (e) {}
    }
    setMounted(true);
  }, []);

  useEffect(() => {
    if (state?.success && state.whatsappUrl) {
      // Clear cart on success
      localStorage.removeItem('dahab_cart');
      window.location.href = state.whatsappUrl;
    }
  }, [state]);

  if (!mounted) return null;

  return (
    <div className="container mx-auto px-6 py-12">
      <h1 className="text-3xl font-bold font-heading text-[var(--color-forest-900)] mb-8">إتمام الطلب</h1>
      
      <div className="grid grid-cols-1 lg:grid-cols-2 gap-12">
        {/* Form */}
        <div>
          <form action={formAction} className="bg-white p-8 rounded-lg shadow-sm border border-zinc-200">
            <h2 className="text-xl font-bold text-zinc-900 mb-6">تفاصيل التوصيل</h2>
            
            <div className="space-y-4">
              <div>
                <label htmlFor="customerName" className="block text-sm font-medium text-zinc-700 mb-1">الاسم الكامل</label>
                <input
                  type="text"
                  id="customerName"
                  name="customerName"
                  required
                  className="w-full border border-zinc-300 rounded-md px-4 py-2 focus:ring-2 focus:ring-[var(--color-champagne-600)] focus:border-transparent"
                />
              </div>
              
              <div>
                <label htmlFor="customerPhone" className="block text-sm font-medium text-zinc-700 mb-1">رقم الهاتف (الأردن)</label>
                <input
                  type="tel"
                  id="customerPhone"
                  name="customerPhone"
                  required
                  dir="ltr"
                  placeholder="07XXXXXXXX"
                  className="w-full border border-zinc-300 rounded-md px-4 py-2 text-right focus:ring-2 focus:ring-[var(--color-champagne-600)] focus:border-transparent"
                />
              </div>

              {/* Hidden payload for cart items */}
              <input type="hidden" name="items" value={JSON.stringify(cartItems)} />
            </div>

            {state?.error && (
              <div className="mt-6 p-4 bg-red-50 text-red-600 rounded-md text-sm font-bold">
                {state.error}
              </div>
            )}

            <div className="mt-8">
              <button
                type="submit"
                disabled={isPending || cartItems.length === 0}
                className="w-full bg-[var(--color-forest-900)] hover:bg-[var(--color-forest-800)] text-white font-bold py-4 rounded-md transition-colors disabled:opacity-50"
              >
                {isPending ? 'جاري المعالجة...' : 'تأكيد الطلب عبر واتساب'}
              </button>
            </div>
          </form>
        </div>

        {/* Order Summary */}
        <div>
          <div className="bg-zinc-50 p-8 rounded-lg border border-zinc-200">
            <h2 className="text-xl font-bold text-zinc-900 mb-6">ملخص الطلب</h2>
            
            {cartItems.length === 0 ? (
              <div className="text-center py-8 text-zinc-500">
                السلة فارغة.{' '}
                <Link href="/ar/shop" className="text-[var(--color-champagne-600)] underline">تسوق الآن</Link>
              </div>
            ) : (
              <div className="space-y-4">
                {cartItems.map((item, idx) => (
                  <div key={idx} className="flex justify-between items-center border-b border-zinc-200 pb-4">
                    <div>
                      <h4 className="font-bold text-zinc-900">{item.name}</h4>
                      <p className="text-sm text-zinc-500">{item.size} × {item.quantity}</p>
                    </div>
                  </div>
                ))}
                
                <div className="pt-4 space-y-2">
                  <div className="flex justify-between text-zinc-600">
                    <span>التوصيل</span>
                    <span>يتم حسابه عند الطلب</span>
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
