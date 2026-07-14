'use client';

import { useState } from 'react';
import { updateGlobalSizePrice } from '@/actions/settings';

export function GlobalPricingModal({ 
  initialPrices, 
  adminId 
}: { 
  initialPrices: Record<string, number>; 
  adminId: string 
}) {
  const [isOpen, setIsOpen] = useState(false);
  const [prices, setPrices] = useState({
    '50ml': (initialPrices['50ml'] || 10000) / 1000,
    '100ml': (initialPrices['100ml'] || 15000) / 1000,
    '200ml': (initialPrices['200ml'] || 25000) / 1000,
  });
  const [loading, setLoading] = useState(false);
  const [message, setMessage] = useState('');

  const handleSave = async () => {
    setLoading(true);
    setMessage('');
    
    let totalUpdated = 0;
    let hasError = false;

    // Update each size sequentially
    for (const size of ['50ml', '100ml', '200ml']) {
      const fils = prices[size as keyof typeof prices] * 1000;
      const res = await updateGlobalSizePrice(size, fils, adminId);
      if (!res.success) {
        hasError = true;
        setMessage((res as any).error || 'حدث خطأ أثناء حفظ الأسعار');
        break;
      }
      totalUpdated += (res as any).updatedCount || 0;
    }

    setLoading(false);
    if (!hasError) {
      setMessage(`تم التحديث بنجاح، وتطبيق السعر الجديد على ${totalUpdated} حجم(أحجام)`);
      setTimeout(() => {
        setIsOpen(false);
        window.location.reload();
      }, 2000);
    }
  };

  return (
    <>
      <button 
        onClick={() => setIsOpen(true)}
        className="bg-white border border-[var(--color-champagne-600)] text-[var(--color-charcoal-900)] hover:bg-zinc-50 px-4 py-2.5 rounded font-bold transition-colors text-sm ml-2 shadow-sm"
      >
        تعديل الأسعار الموحدة
      </button>

      {isOpen && (
        <div className="fixed inset-0 bg-black/60 z-[100] flex items-center justify-center p-4">
          <div className="bg-white rounded-xl shadow-xl w-full max-w-md overflow-hidden relative">
            <div className="bg-[var(--color-charcoal-900)] text-white p-4 flex justify-between items-center">
              <h2 className="font-bold text-lg">الأسعار الموحدة للأحجام</h2>
              <button onClick={() => setIsOpen(false)} className="text-zinc-300 hover:text-white">
                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M18 6 6 18"/><path d="m6 6 12 12"/></svg>
              </button>
            </div>
            
            <div className="p-6 space-y-4">
              <p className="text-sm text-zinc-600 mb-4 leading-relaxed">
                ستُطبق هذه الأسعار تلقائياً عند إضافة عطر جديد، وأيضاً سيتم تحديث أسعار كافة العطور الحالية التي تعتمد "السعر الموحد".
              </p>

              {message && (
                <div className={`p-3 rounded text-sm font-bold ${message.includes('بنجاح') ? 'bg-green-100 text-green-800' : 'bg-red-100 text-red-800'}`}>
                  {message}
                </div>
              )}

              {Object.keys(prices).map((size) => (
                <div key={size} className="flex justify-between items-center bg-zinc-50 p-3 rounded border border-zinc-200">
                  <span className="font-bold font-mono text-[var(--color-charcoal-900)]">{size}</span>
                  <div className="flex items-center gap-2">
                    <input 
                      type="number" 
                      min="1"
                      value={prices[size as keyof typeof prices]} 
                      onChange={(e) => setPrices({ ...prices, [size]: parseFloat(e.target.value) || 0 })}
                      className="border border-zinc-300 rounded px-3 py-1.5 w-24 text-center focus:outline-none focus:border-[var(--color-champagne-600)]"
                    />
                    <span className="text-sm text-zinc-500">د.أ</span>
                  </div>
                </div>
              ))}
            </div>

            <div className="p-4 border-t border-zinc-100 bg-zinc-50 flex justify-end gap-2">
              <button 
                onClick={() => setIsOpen(false)}
                className="px-4 py-2 text-zinc-600 hover:bg-zinc-200 rounded font-bold text-sm transition-colors"
                disabled={loading}
              >
                إلغاء
              </button>
              <button 
                onClick={handleSave}
                className="px-4 py-2 bg-[var(--color-charcoal-900)] hover:bg-[var(--color-charcoal-800)] text-white rounded font-bold text-sm shadow-sm transition-colors disabled:opacity-50 flex items-center gap-2"
                disabled={loading}
              >
                {loading && <svg className="animate-spin h-4 w-4" viewBox="0 0 24 24"><circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4" fill="none"></circle><path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path></svg>}
                حفظ وتطبيق
              </button>
            </div>
          </div>
        </div>
      )}
    </>
  );
}
