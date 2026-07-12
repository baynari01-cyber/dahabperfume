'use client';

import React, { useState, useTransition } from 'react';
import { processPOSCheckout } from '@/actions/pos';

interface POSCounterProps {
  products: any[];
}

export function POSCounter({ products }: POSCounterProps) {
  const [cart, setCart] = useState<any[]>([]);
  const [search, setSearch] = useState('');
  const [selectedProduct, setSelectedProduct] = useState<any | null>(null);
  const [paymentMethod, setPaymentMethod] = useState<'CASH' | 'CARD'>('CASH');
  const [customerName, setCustomerName] = useState('عميل نقدي');
  const [amountTendered, setAmountTendered] = useState<string>('');
  const [discountAmount, setDiscountAmount] = useState<string>('0');
  const [isPending, startTransition] = useTransition();
  const [checkoutResult, setCheckoutResult] = useState<any | null>(null);

  // Filter products by name or SKU
  const filteredProducts = products.filter(p => 
    p.nameAr.toLowerCase().includes(search.toLowerCase()) || 
    p.sku.toLowerCase().includes(search.toLowerCase()) ||
    (p.nameEn && p.nameEn.toLowerCase().includes(search.toLowerCase()))
  );

  const handleSelectProduct = (product: any) => {
    setSelectedProduct(product);
  };

  const handleAddVariant = (variant: any) => {
    if (!selectedProduct) return;
    
    // Check if variant already in cart
    const existingIdx = cart.findIndex(item => item.variantId === variant.id);
    if (existingIdx > -1) {
      const updated = [...cart];
      updated[existingIdx].quantity += 1;
      setCart(updated);
    } else {
      setCart([...cart, {
        variantId: variant.id,
        sku: variant.sku,
        name: selectedProduct.nameAr,
        size: variant.size,
        price: variant.price,
        quantity: 1,
        stockStatus: selectedProduct.stockStatus
      }]);
    }
    setSelectedProduct(null);
  };

  const handleRemoveItem = (variantId: string) => {
    setCart(cart.filter(item => item.variantId !== variantId));
  };

  const handleUpdateQty = (variantId: string, delta: number) => {
    setCart(cart.map(item => {
      if (item.variantId === variantId) {
        return { ...item, quantity: Math.max(1, item.quantity + delta) };
      }
      return item;
    }));
  };

  const getSubtotal = () => {
    return cart.reduce((acc, item) => acc + (item.price * item.quantity), 0);
  };

  const getDiscount = () => {
    const discVal = parseFloat(discountAmount) || 0;
    return Math.round(discVal * 100);
  };

  const getTax = () => {
    const afterDiscount = Math.max(0, getSubtotal() - getDiscount());
    return Math.round(afterDiscount * 0.16);
  };

  const getGrandTotal = () => {
    const afterDiscount = Math.max(0, getSubtotal() - getDiscount());
    return afterDiscount + getTax();
  };

  const getChange = () => {
    const tender = parseFloat(amountTendered) || 0;
    const tenderCents = Math.round(tender * 100);
    const total = getGrandTotal();
    return Math.max(0, tenderCents - total);
  };

  const handleCheckout = () => {
    if (cart.length === 0) return;
    
    const payload = {
      items: cart.map(item => ({
        variantId: item.variantId,
        sku: item.sku,
        quantity: item.quantity
      })),
      customerName,
      paymentMethod,
      amountTendered: paymentMethod === 'CASH' ? (parseFloat(amountTendered) || 0) * 100 : getGrandTotal()
    };

    startTransition(async () => {
      const res = await processPOSCheckout(payload);
      if (res.success) {
        setCheckoutResult(res);
        setCart([]);
        setAmountTendered('');
        setDiscountAmount('0');
      } else {
        alert(res.error || 'حدث خطأ أثناء إتمام العملية');
      }
    });
  };

  return (
    <div className="flex w-full h-screen font-sans bg-[var(--color-ivory-100)]" dir="rtl">
      {/* Products & Search Area */}
      <div className="flex-grow flex flex-col p-6 overflow-hidden">
        {/* Top bar search */}
        <div className="flex gap-4 mb-6">
          <input 
            type="text" 
            value={search}
            onChange={(e) => setSearch(e.target.value)}
            placeholder="بحث بالاسم العربي أو الإنجليزي أو SKU..." 
            className="flex-grow border border-[var(--color-ivory-200)] bg-white rounded px-4 py-3 outline-none focus:ring-2 focus:ring-[var(--color-champagne-600)]"
          />
        </div>

        {/* Products Grid */}
        <div className="flex-grow overflow-y-auto grid grid-cols-2 md:grid-cols-4 lg:grid-cols-5 gap-4">
          {filteredProducts.map((product) => {
            const lowestPrice = product.variants.length > 0
              ? Math.min(...product.variants.map((v: any) => v.price))
              : 0;

            const isUnverified = product.stockStatus === 'UNVERIFIED';

            return (
              <button 
                key={product.id} 
                onClick={() => handleSelectProduct(product)}
                className="bg-white p-4 rounded border border-[var(--color-ivory-200)] shadow-sm hover:border-[var(--color-champagne-600)] hover:shadow transition-all text-right flex flex-col h-36"
              >
                <span className="text-xs text-zinc-400 mb-1">{product.category.name}</span>
                <span className="font-bold text-zinc-900 line-clamp-2 leading-tight mb-auto">
                  {product.nameAr}
                </span>
                
                {isUnverified && (
                  <span className="bg-amber-100 text-amber-800 text-[9px] font-bold px-1.5 py-0.5 rounded w-fit mb-2">
                    بانتظار التحقق
                  </span>
                )}

                <div className="flex justify-between items-end w-full mt-2 pt-2 border-t border-zinc-50">
                  <span className="text-[var(--color-champagne-600)] font-bold">
                    {(lowestPrice / 100).toFixed(2)} د.أ
                  </span>
                  <span className="text-xs text-zinc-400">
                    {product.variants.length} أحجام
                  </span>
                </div>
              </button>
            );
          })}
        </div>
      </div>

      {/* Cart & Checkout Panel */}
      <div className="w-96 bg-white border-r border-[var(--color-ivory-200)] flex flex-col h-full shadow-lg">
        {/* Customer Select */}
        <div className="p-4 border-b border-zinc-100">
          <input 
            type="text" 
            value={customerName}
            onChange={(e) => setCustomerName(e.target.value)}
            placeholder="اسم العميل" 
            className="w-full border border-zinc-300 rounded px-3 py-2 text-sm outline-none focus:ring-2 focus:ring-[var(--color-champagne-600)]"
          />
        </div>

        {/* Cart Items */}
        <div className="flex-1 overflow-y-auto p-4 space-y-4">
          {cart.map((item) => (
            <div key={item.variantId} className="flex gap-4 border-b pb-4 text-sm">
              <div className="flex-grow">
                <h4 className="font-bold text-zinc-900">{item.name}</h4>
                <p className="text-xs text-zinc-500">{item.size} | SKU: {item.sku}</p>
                {item.stockStatus === 'UNVERIFIED' && (
                  <span className="text-amber-600 text-[10px] font-bold block mt-0.5">
                    بانتظار التحقق من المخزن
                  </span>
                )}
                
                <div className="flex justify-between items-center mt-2">
                  <div className="flex items-center border rounded">
                    <button 
                      onClick={() => handleUpdateQty(item.variantId, -1)}
                      className="px-2 py-0.5 bg-zinc-50 hover:bg-zinc-100 font-bold"
                    >
                      -
                    </button>
                    <span className="px-3 font-bold">{item.quantity}</span>
                    <button 
                      onClick={() => handleUpdateQty(item.variantId, 1)}
                      className="px-2 py-0.5 bg-zinc-50 hover:bg-zinc-100 font-bold"
                    >
                      +
                    </button>
                  </div>
                  <span className="font-bold text-[var(--color-champagne-600)]">
                    {((item.price * item.quantity) / 100).toFixed(2)} د.أ
                  </span>
                </div>
              </div>
              <button 
                onClick={() => handleRemoveItem(item.variantId)}
                className="text-red-500 hover:text-red-700 text-xs self-start"
              >
                إزالة
              </button>
            </div>
          ))}

          {cart.length === 0 && (
            <div className="h-full flex flex-col items-center justify-center text-zinc-400">
              <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1" strokeLinecap="round" strokeLinejoin="round" className="mb-4 opacity-50"><circle cx="8" cy="21" r="1"/><circle cx="19" cy="21" r="1"/><path d="M2.05 2.05h2l2.66 12.42a2 2 0 0 0 2 1.58h9.78a2 2 0 0 0 1.95-1.57l1.65-7.43H5.12"/></svg>
              <span>السلة فارغة</span>
            </div>
          )}
        </div>

        {/* Totals & Payments */}
        <div className="bg-zinc-50 p-4 border-t space-y-4">
          <div className="space-y-2 text-sm text-zinc-600">
            <div className="flex justify-between">
              <span>المجموع الفرعي</span>
              <span>{(getSubtotal() / 100).toFixed(2)} د.أ</span>
            </div>
            
            <div className="flex justify-between items-center">
              <span>الخصم المسموح</span>
              <input 
                type="number" 
                value={discountAmount}
                onChange={(e) => setDiscountAmount(e.target.value)}
                className="w-20 border border-zinc-300 rounded px-2 py-0.5 text-left text-xs outline-none focus:ring-1 focus:ring-[var(--color-champagne-600)]"
              />
            </div>

            <div className="flex justify-between">
              <span>ضريبة المبيعات (16%)</span>
              <span>{(getTax() / 100).toFixed(2)} د.أ</span>
            </div>
            
            <div className="flex justify-between text-lg font-bold text-zinc-900 pt-2 border-t">
              <span>الإجمالي الكلي</span>
              <span className="text-xl text-[var(--color-forest-900)]">
                {(getGrandTotal() / 100).toFixed(2)} د.أ
              </span>
            </div>
          </div>

          {/* Payment Method Selector */}
          <div className="grid grid-cols-2 gap-3 text-sm font-bold">
            <button
              onClick={() => setPaymentMethod('CASH')}
              className={`py-2 border rounded transition-colors ${paymentMethod === 'CASH' ? 'bg-[var(--color-forest-900)] text-white border-transparent' : 'bg-white text-zinc-700 border-zinc-300'}`}
            >
              نقدي
            </button>
            <button
              onClick={() => setPaymentMethod('CARD')}
              className={`py-2 border rounded transition-colors ${paymentMethod === 'CARD' ? 'bg-[var(--color-forest-900)] text-white border-transparent' : 'bg-white text-zinc-700 border-zinc-300'}`}
            >
              بطاقة
            </button>
          </div>

          {/* Cash Payment Tendered Input */}
          {paymentMethod === 'CASH' && (
            <div className="space-y-2 text-sm border-t pt-3">
              <div className="flex justify-between items-center">
                <span>المبلغ المستلم</span>
                <input 
                  type="number" 
                  value={amountTendered}
                  onChange={(e) => setAmountTendered(e.target.value)}
                  placeholder="0.00"
                  className="w-24 border border-zinc-300 rounded px-2 py-1 text-left text-sm outline-none focus:ring-1 focus:ring-[var(--color-champagne-600)]"
                />
              </div>
              <div className="flex justify-between font-bold text-amber-700">
                <span>المتبقي للعميل (الباقي)</span>
                <span>{(getChange() / 100).toFixed(2)} د.أ</span>
              </div>
            </div>
          )}

          <button
            onClick={handleCheckout}
            disabled={isPending || cart.length === 0}
            className="w-full bg-[var(--color-forest-900)] hover:bg-[var(--color-forest-800)] text-white font-bold py-4 rounded transition-colors disabled:opacity-50 text-lg shadow-md"
          >
            {isPending ? 'جاري المعالجة...' : 'دفع وإصدار الفاتورة'}
          </button>
        </div>
      </div>

      {/* Variant Selector Overlay */}
      {selectedProduct && (
        <div className="fixed inset-0 bg-black/50 z-50 flex items-center justify-center p-4">
          <div className="bg-white rounded-lg p-6 max-w-md w-full border-4 border-[var(--color-champagne-600)] shadow-2xl">
            <h3 className="text-xl font-bold text-[var(--color-forest-900)] mb-2">
              {selectedProduct.nameAr}
            </h3>
            <p className="text-xs text-zinc-500 mb-6">{selectedProduct.sku}</p>
            
            <div className="space-y-3">
              <h4 className="font-bold text-sm text-zinc-700 mb-2">اختر الحجم المطلوب:</h4>
              {selectedProduct.variants.map((v: any) => (
                <button
                  key={v.id}
                  onClick={() => handleAddVariant(v)}
                  className="w-full flex justify-between items-center p-3 border border-zinc-200 rounded hover:border-[var(--color-champagne-600)] hover:bg-[var(--color-ivory-100)] transition-colors text-right"
                >
                  <span className="font-bold text-zinc-900">{v.size}</span>
                  <span className="text-[var(--color-champagne-600)] font-bold">
                    {(v.price / 100).toFixed(2)} د.أ
                  </span>
                </button>
              ))}
            </div>

            <button
              onClick={() => setSelectedProduct(null)}
              className="w-full mt-6 bg-zinc-200 text-zinc-700 py-2.5 rounded font-bold transition-colors hover:bg-zinc-350"
            >
              إلغاء
            </button>
          </div>
        </div>
      )}

      {/* Checkout Success/Receipt Modal */}
      {checkoutResult && (
        <div className="fixed inset-0 bg-black/60 z-50 flex items-center justify-center p-4">
          <div className="bg-white rounded-lg p-8 max-w-md w-full border-t-8 border-emerald-600 shadow-2xl text-center">
            <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" className="mx-auto text-emerald-600 mb-4"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/><polyline points="22 4 12 14.01 9 11.01"/></svg>
            
            <h3 className="text-2xl font-bold text-zinc-900 mb-2">تم إصدار الفاتورة!</h3>
            <p className="text-sm text-zinc-500 mb-6">رقم الفاتورة: <span className="font-bold font-mono text-zinc-800">{checkoutResult.reference}</span></p>
            
            <div className="bg-zinc-50 p-4 rounded text-right space-y-2 text-sm text-zinc-600 mb-6">
              <div className="flex justify-between border-b pb-1">
                <span>الإجمالي:</span>
                <span className="font-bold text-zinc-800">{(checkoutResult.total / 100).toFixed(2)} د.أ</span>
              </div>
              <div className="flex justify-between">
                <span>طريقة الدفع:</span>
                <span className="font-bold text-zinc-800">{paymentMethod === 'CASH' ? 'نقدي' : 'بطاقة'}</span>
              </div>
            </div>

            <div className="space-y-3">
              <button
                onClick={() => window.print()}
                className="w-full bg-[var(--color-forest-900)] text-white py-3 rounded font-bold hover:bg-[var(--color-forest-800)]"
              >
                طباعة الفاتورة والوصل
              </button>
              <button
                onClick={() => setCheckoutResult(null)}
                className="w-full bg-zinc-200 text-zinc-700 py-3 rounded font-bold hover:bg-zinc-300"
              >
                إغلاق
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
