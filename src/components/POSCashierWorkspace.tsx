'use client';

import React, { useState, useEffect, useRef, useTransition } from 'react';
import { X } from 'lucide-react';
import { processPOSCheckout } from '@/actions/pos';
import { verifyUnlockPassword } from '@/actions/auth';
import { MainAccordsBars } from './MainAccordsBars';
import { POSOrdersPanel } from './POSOrdersPanel';

interface ProductNote {
  noteType: string;
  nameAr: string;
  nameEn: string;
}

interface ProductAccord {
  value: number;
  accord: {
    name: string;
    color: string | null;
  };
}

interface ProductVariant {
  id: string;
  size: string;
  sku: string;
  price: number;
  isActive: boolean;
  usesGlobalPricing: boolean;
}

interface ProductItem {
  id: string;
  nameAr: string;
  nameEn: string;
  sku: string;
  shortDescription: string | null;
  stockStatus: string;
  stockLiters: number;
  variants: ProductVariant[];
  imageUrl: string | null;
}

interface POSCashierWorkspaceProps {
  products: ProductItem[];
  settings: {
    taxEnabled: boolean;
    taxRate: number;
    pricesIncludeTax: boolean;
    posIdleEnabled?: boolean;
    posIdleTimeoutMinutes?: number;
    posIdleShowClock?: boolean;
    posIdleShowDate?: boolean;
    posIdleRequirePin?: boolean;
    posIdleMessageAr?: string;
    posIdleMessageEn?: string;
    posSessionLifetimeHours?: number;
  };
  cashierName: string;
  sessionExpiresAt: string;
  hasOrdersViewPermission?: boolean;
  hasOrdersManagePermission?: boolean;
}

export function POSCashierWorkspace({
  products,
  settings,
  cashierName,
  sessionExpiresAt,
  hasOrdersViewPermission = false,
  hasOrdersManagePermission = false
}: POSCashierWorkspaceProps) {
  const [cart, setCart] = useState<any[]>([]);
  const [search, setSearch] = useState('');
  const [selectedProduct, setSelectedProduct] = useState<ProductItem | null>(null);
  const [paymentMethod, setPaymentMethod] = useState<'CASH' | 'CARD'>('CASH');
  const [customerName, setCustomerName] = useState('عميل نقدي');
  const [amountTendered, setAmountTendered] = useState<string>('');
  const [discountAmount, setDiscountAmount] = useState<string>('0');
  const [isPending, startTransition] = useTransition();
  const [checkoutResult, setCheckoutResult] = useState<any | null>(null);

  // Mobile navigation tab: 'catalog' or 'cart'
  const [mobileTab, setMobileTab] = useState<'catalog' | 'cart'>('catalog');

  // Idle and Session state
  const [isIdle, setIsIdle] = useState(false);
  const [isLocked, setIsLocked] = useState(false);
  const [pinInput, setPinInput] = useState('');
  const [sessionTimeLeft, setSessionTimeLeft] = useState<number>(0);
  const [currentTime, setCurrentTime] = useState<string>('');
  const [currentDate, setCurrentDate] = useState<string>('');

  const idleTimerRef = useRef<NodeJS.Timeout | null>(null);
  const broadcastChannelRef = useRef<BroadcastChannel | null>(null);

  const { 
    taxEnabled, 
    taxRate, 
    pricesIncludeTax, 
    posIdleEnabled = true,
    posIdleTimeoutMinutes = 4,
    posIdleShowClock = true,
    posIdleShowDate = true,
    posIdleRequirePin = false,
    posIdleMessageAr = 'شاشة خمول مؤقتة - يرجى الضغط للمتابعة',
    posIdleMessageEn = 'Idle screen - Please press to continue',
    posSessionLifetimeHours = 15
  } = settings;

  // Initialize BroadCast Channel for Multi-Tab session sync
  useEffect(() => {
    const channel = new BroadcastChannel('pos_session_sync');
    broadcastChannelRef.current = channel;

    channel.onmessage = (event) => {
      if (event.data === 'LOCK') {
        setIsLocked(true);
      } else if (event.data === 'UNLOCK') {
        setIsLocked(false);
      } else if (event.data === 'LOGOUT') {
        window.location.href = '/pos/login';
      }
    };

    return () => {
      channel.close();
    };
  }, []);

  const handleLogoutAction = () => {
    broadcastChannelRef.current?.postMessage('LOGOUT');
    window.location.href = '/login';
  };

  // Activity tracking for idle state trigger
  const resetIdleTimer = () => {
    if (!posIdleEnabled) return;
    if (idleTimerRef.current) {
      clearTimeout(idleTimerRef.current);
    }
    if (!isLocked && !isIdle) {
      idleTimerRef.current = setTimeout(() => {
        setIsIdle(true);
      }, posIdleTimeoutMinutes * 60 * 1000);
    }
  };

  // Update clocks every second
  useEffect(() => {
    const interval = setInterval(() => {
      const now = new Date();
      // Always display in English for consistency with design
      setCurrentTime(now.toLocaleTimeString('en-US', { hour: '2-digit', minute: '2-digit', second: '2-digit', hour12: true }));
      setCurrentDate(now.toLocaleDateString('en-US', { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' }));

      // Session expiration countdown
      const expiry = new Date(sessionExpiresAt).getTime();
      const diff = Math.max(0, Math.floor((expiry - now.getTime()) / 1000));
      setSessionTimeLeft(diff);

      if (diff <= 0) {
        handleLogoutAction();
      }
    }, 1000);

    return () => clearInterval(interval);
  }, [sessionExpiresAt]);

  // Idle overlay safe dismissal using capture-phase event interception
  useEffect(() => {
    const handleCaptureInteraction = (e: MouseEvent | TouchEvent | KeyboardEvent) => {
      if (isIdle) {
        // Prevent event from propagating/triggering any click-throughs below the overlay
        e.stopPropagation();
        e.preventDefault();
        setIsIdle(false);
        if (posIdleRequirePin) {
          setIsLocked(true);
          broadcastChannelRef.current?.postMessage('LOCK');
        }
        resetIdleTimer();
      }
    };

    // Listen on window in capture phase (third arg: true)
    window.addEventListener('click', handleCaptureInteraction, true);
    window.addEventListener('pointerdown', handleCaptureInteraction, true);
    window.addEventListener('touchstart', handleCaptureInteraction, true);
    window.addEventListener('keydown', handleCaptureInteraction, true);

    return () => {
      window.removeEventListener('click', handleCaptureInteraction, true);
      window.removeEventListener('pointerdown', handleCaptureInteraction, true);
      window.removeEventListener('touchstart', handleCaptureInteraction, true);
      window.removeEventListener('keydown', handleCaptureInteraction, true);
    };
  }, [isIdle]);

  useEffect(() => {
    const events = ['pointermove', 'pointerdown', 'click', 'keydown', 'scroll', 'touchstart'];
    events.forEach(event => {
      window.addEventListener(event, resetIdleTimer, { passive: true });
    });

    resetIdleTimer();

    return () => {
      if (idleTimerRef.current) clearTimeout(idleTimerRef.current);
      events.forEach(event => {
        window.removeEventListener(event, resetIdleTimer);
      });
    };
  }, [isLocked, isIdle, posIdleEnabled, posIdleTimeoutMinutes]);

  const handleLockAction = () => {
    setIsLocked(true);
    setIsIdle(false);
    broadcastChannelRef.current?.postMessage('LOCK');
  };

  const handleUnlockAction = () => {
    if (posIdleRequirePin) {
      if (!pinInput) {
        alert('يرجى إدخال كلمة المرور');
        return;
      }
      
      startTransition(async () => {
        const res = await verifyUnlockPassword(pinInput);
        if (res.success) {
          setIsLocked(false);
          setPinInput('');
          broadcastChannelRef.current?.postMessage('UNLOCK');
        } else {
          alert(res.error || 'كلمة المرور غير صحيحة');
          setPinInput('');
        }
      });
    } else {
      setIsLocked(false);
      broadcastChannelRef.current?.postMessage('UNLOCK');
    }
  };

  // Filter products by name, SKU, or accord/note properties
  const filteredProducts = products.filter(p => 
    p.nameAr.toLowerCase().includes(search.toLowerCase()) || 
    p.sku.toLowerCase().includes(search.toLowerCase()) ||
    (p.nameEn && p.nameEn.toLowerCase().includes(search.toLowerCase()))
  );

  const handleSelectProduct = (product: ProductItem) => {
    setSelectedProduct(product);
  };

  const handleAddVariant = (variant: ProductVariant) => {
    if (!selectedProduct) return;
    
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
    return Math.round(discVal * 1000);
  };

  const getTax = () => {
    if (!taxEnabled) return 0;
    const afterDiscount = Math.max(0, getSubtotal() - getDiscount());
    if (pricesIncludeTax) {
      return Math.round(afterDiscount * (taxRate / (100 + taxRate)));
    } else {
      return Math.round(afterDiscount * (taxRate / 100));
    }
  };

  const getGrandTotal = () => {
    const afterDiscount = Math.max(0, getSubtotal() - getDiscount());
    if (taxEnabled && !pricesIncludeTax) {
      return afterDiscount + getTax();
    }
    return afterDiscount;
  };

  const getChange = () => {
    const tender = parseFloat(amountTendered) || 0;
    const tenderFils = Math.round(tender * 1000);
    const total = getGrandTotal();
    return Math.max(0, tenderFils - total);
  };

  const formatCountdown = (seconds: number) => {
    const hrs = Math.floor(seconds / 3600);
    const mins = Math.floor((seconds % 3600) / 60);
    const secs = seconds % 60;
    return `${hrs.toString().padStart(2, '0')}:${mins.toString().padStart(2, '0')}:${secs.toString().padStart(2, '0')}`;
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
      discount: getDiscount(),
      amountTendered: paymentMethod === 'CASH' ? (parseFloat(amountTendered) || 0) * 1000 : getGrandTotal()
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
    <div className="flex flex-col w-full h-full relative" dir="rtl">
      

      <div className="flex-1 flex flex-col md:flex-row w-full overflow-hidden">
        
        {/* Mobile screen tabs */}
        <div className="md:hidden flex border-b border-[var(--color-ivory-200)] bg-white sticky top-0 z-10 shrink-0">
          <button
            onClick={() => setMobileTab('catalog')}
            className={`flex-1 text-center py-3 font-bold text-sm border-b-2 transition-colors ${
              mobileTab === 'catalog'
                ? 'border-[var(--color-charcoal-900)] text-[var(--color-charcoal-900)]'
                : 'border-transparent text-zinc-500'
            }`}
          >
            قائمة العطور
          </button>
          <button
            onClick={() => setMobileTab('cart')}
            className={`flex-1 text-center py-3 font-bold text-sm border-b-2 transition-colors relative ${
              mobileTab === 'cart'
                ? 'border-[var(--color-charcoal-900)] text-[var(--color-charcoal-900)]'
                : 'border-transparent text-zinc-500'
            }`}
          >
            سلة المشتريات ({cart.reduce((sum, item) => sum + item.quantity, 0)})
          </button>
        </div>

        {/* LEFT COLUMN: Catalog List (60% width on Desktop) */}
        <div
          className={`flex-grow md:w-[60%] flex flex-col p-4 md:p-6 overflow-hidden ${
            mobileTab === 'catalog' ? 'flex' : 'hidden md:flex'
          }`}
        >
          <div className="flex gap-4 mb-4 shrink-0">
            <input 
              type="text" 
              value={search}
              onChange={(e) => setSearch(e.target.value)}
              placeholder="بحث بالاسم أو SKU..." 
              className="flex-grow border border-[var(--color-ivory-200)] bg-white rounded px-4 py-3 outline-none text-sm focus:ring-2 focus:ring-[var(--color-champagne-600)]"
            />
          </div>

          <div className="flex-grow overflow-y-auto grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-4 gap-3 pb-2">
            {filteredProducts.map((product) => {
              const lowestPrice = product.variants.length > 0
                ? Math.min(...product.variants.map((v: any) => v.price))
                : 0;

              return (
                <button 
                  key={product.id} 
                  onClick={() => handleSelectProduct(product)}
                  className="bg-white rounded-lg border border-[var(--color-ivory-200)] shadow-sm hover:border-[var(--color-champagne-600)] hover:shadow transition-all text-right flex flex-col justify-between active:scale-95 duration-100 animate-fade-in overflow-hidden h-48"
                >
                  <div className="w-full h-28 bg-zinc-50 relative flex items-center justify-center border-b border-zinc-100 overflow-hidden">
                    {product.imageUrl ? (
                       <img src={product.imageUrl} alt={product.nameAr} className="max-w-full h-full object-cover" />
                    ) : (
                       <div className="w-8 h-8 rounded-full bg-zinc-200 flex items-center justify-center">
                         <span className="text-zinc-400 font-bold text-xs">صورة</span>
                       </div>
                    )}
                  </div>
                  
                  <div className="p-3 flex flex-col justify-between flex-1 w-full">
                    <span className="font-bold text-zinc-900 text-xs md:text-sm line-clamp-1 leading-tight">
                      {product.nameAr}
                    </span>
                    
                    <div className="mt-1 w-full pt-1.5 border-t border-zinc-50 flex justify-between items-end">
                      <span className="text-[var(--color-champagne-600)] font-bold text-xs">
                        {(lowestPrice / 1000).toFixed(3)} د.أ
                      </span>
                      <span className="text-[10px] text-zinc-400">
                        {product.variants.length} أحجام
                      </span>
                    </div>
                  </div>
                </button>
              );
            })}
          </div>
        </div>

        {/* RIGHT COLUMN: Cart & Checkout Panel (40% width on Desktop) */}
        <div
          className={`w-full md:w-[40%] md:max-w-md bg-white border-r border-[var(--color-ivory-200)] flex flex-col h-full shadow-lg ${
            mobileTab === 'cart' ? 'flex' : 'hidden md:flex'
          }`}
        >
          <div className="p-3 border-b border-zinc-100 shrink-0">
            <input 
              type="text" 
              value={customerName}
              onChange={(e) => setCustomerName(e.target.value)}
              placeholder="اسم العميل" 
              className="w-full border border-zinc-300 rounded px-3 py-2 text-sm outline-none focus:ring-2 focus:ring-[var(--color-champagne-600)]"
            />
          </div>

          <div className="flex-grow overflow-y-auto p-3 space-y-3">
            {cart.map((item) => (
              <div key={item.variantId} className="flex gap-3 border-b pb-3 text-xs md:text-sm">
                <div className="flex-grow">
                  <h4 className="font-bold text-zinc-900">{item.name}</h4>
                  <p className="text-[10px] text-zinc-500">{item.size} | SKU: {item.sku}</p>
                  
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
                      {((item.price * item.quantity) / 1000).toFixed(3)} د.أ
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
              <div className="h-full flex flex-col items-center justify-center text-zinc-400 py-12">
                <span className="text-xs">السلة فارغة</span>
              </div>
            )}
          </div>

          {/* Checkout Totals & Submit */}
          <div className="bg-zinc-50 p-4 border-t space-y-3 shrink-0">
            <div className="space-y-2 text-xs md:text-sm text-zinc-600">
              <div className="flex justify-between">
                <span>المجموع الفرعي</span>
                <span>{(getSubtotal() / 1000).toFixed(3)} د.أ</span>
              </div>
              <div className="flex justify-between items-center">
                <span>الخصم المسموح (بالدينار)</span>
                <input 
                  type="number" 
                  step="0.1"
                  value={discountAmount}
                  onChange={(e) => setDiscountAmount(e.target.value)}
                  className="w-20 border border-zinc-300 rounded px-2 py-0.5 text-left text-xs outline-none focus:ring-1 focus:ring-[var(--color-champagne-600)]"
                />
              </div>
              {taxEnabled && (
                <div className="flex justify-between">
                  <span>ضريبة المبيعات ({taxRate}%)</span>
                  <span>{(getTax() / 1000).toFixed(3)} د.أ</span>
                </div>
              )}
              <div className="flex justify-between text-base font-bold text-zinc-900 pt-1.5 border-t">
                <span>الإجمالي الكلي</span>
                <span className="text-lg text-[var(--color-charcoal-900)]">
                  {(getGrandTotal() / 1000).toFixed(3)} د.أ
                </span>
              </div>
            </div>

            <div className="grid grid-cols-2 gap-3 text-xs md:text-sm font-bold">
              <button
                onClick={() => setPaymentMethod('CASH')}
                className={`py-2 border rounded transition-colors ${paymentMethod === 'CASH' ? 'bg-[var(--color-charcoal-900)] text-white border-transparent' : 'bg-white text-zinc-700 border-zinc-300'}`}
              >
                نقدي
              </button>
              <button
                onClick={() => setPaymentMethod('CARD')}
                className={`py-2 border rounded transition-colors ${paymentMethod === 'CARD' ? 'bg-[var(--color-charcoal-900)] text-white border-transparent' : 'bg-white text-zinc-700 border-zinc-300'}`}
              >
                بطاقة
              </button>
            </div>

            {paymentMethod === 'CASH' && (
              <div className="space-y-2 text-xs border-t pt-2">
                <div className="flex justify-between items-center">
                  <span>المبلغ المستلم نقداً</span>
                  <input 
                    type="number" 
                    step="0.01"
                    value={amountTendered}
                    onChange={(e) => setAmountTendered(e.target.value)}
                    placeholder="0.00"
                    className="w-24 border border-zinc-300 rounded px-2 py-1 text-left outline-none focus:ring-1 focus:ring-[var(--color-champagne-600)]"
                  />
                </div>
                <div className="flex justify-between font-bold text-amber-700">
                  <span>الباقي للعميل</span>
                  <span>{(getChange() / 1000).toFixed(3)} د.أ</span>
                </div>
              </div>
            )}

            <button
              onClick={handleCheckout}
              disabled={isPending || cart.length === 0}
              className="w-full bg-[var(--color-charcoal-900)] hover:bg-[var(--color-charcoal-800)] text-white font-bold py-3 rounded transition-colors disabled:opacity-50 text-base"
            >
              {isPending ? 'جاري الدفع...' : 'تأكيد الدفع وإصدار الفاتورة'}
            </button>
          </div>
        </div>
      </div>

      {/* PRODUCT DETAILS & NOTES DIALOG DRAWER */}
      {selectedProduct && (
        <div className="fixed inset-0 bg-black/60 z-50 flex items-end md:items-center justify-center p-0 md:p-4 animate-fade-in">
          <div className="bg-white rounded-t-2xl md:rounded-lg p-6 max-w-lg w-full shadow-2xl space-y-4 max-h-[85vh] overflow-y-auto">
            <div className="flex justify-between items-start border-b pb-3">
              <div>
                <h3 className="text-xl font-bold text-[var(--color-charcoal-900)]">{selectedProduct.nameAr}</h3>
                <span className="text-[10px] text-zinc-400">SKU: {selectedProduct.sku}</span>
              </div>
              <button
                onClick={() => setSelectedProduct(null)}
                className="text-zinc-400 hover:text-zinc-600 text-xl font-bold px-2"
              >
                <X className="w-5 h-5" />
              </button>
            </div>

            {selectedProduct.shortDescription && (
              <p className="text-xs text-zinc-650 leading-relaxed bg-zinc-50 p-2.5 rounded border border-zinc-100">
                {selectedProduct.shortDescription}
              </p>
            )}

            {/* Accords Breakdown Section */}
            <div>
              <h4 className="text-xs font-bold text-neutral-800 mb-2">المكونات العطرية الأساسية (Main Accords)</h4>
              
            </div>



            {/* Variant Size selector buttons */}
            <div className="space-y-2 pt-3 border-t">
              <h4 className="text-xs font-bold text-neutral-800">اختر الحجم للإضافة للسلة:</h4>
              <div className="grid grid-cols-2 gap-3">
                {selectedProduct.variants.map((v) => (
                  <button
                    key={v.id}
                    onClick={() => handleAddVariant(v)}
                    disabled={!v.isActive || selectedProduct.stockLiters <= 0}
                    className="flex flex-col items-center justify-center p-3 border border-zinc-200 rounded-lg hover:border-[var(--color-champagne-600)] hover:bg-neutral-50/30 transition-all text-center disabled:opacity-40 active:scale-95"
                  >
                    <span className="font-bold text-zinc-900 text-sm">{v.size}</span>
                    <span className="text-xs text-[var(--color-champagne-600)] font-bold mt-1">{(v.price / 1000).toFixed(3)} د.أ</span>
                    
                  </button>
                ))}
              </div>
            </div>
          </div>
        </div>
      )}

      {/* SCREEN LOCK OVERLAY PROMPT */}
      {isLocked && (
        <div className="fixed inset-0 bg-neutral-950/95 z-55 flex flex-col items-center justify-center p-6 text-white text-center">
          <div className="max-w-sm w-full space-y-6">
            <div className="space-y-2">
              <h2 className="text-2xl font-bold font-heading text-[var(--color-champagne-400)]">شاشة POS مقفلة</h2>
              <p className="text-xs text-neutral-400">يرجى إدخال كلمة المرور للمتابعة</p>
            </div>

            <div className="space-y-4">
              <input
                type="password"
                value={pinInput}
                onChange={(e) => setPinInput(e.target.value)}
                onKeyDown={(e) => e.key === 'Enter' && handleUnlockAction()}
                placeholder="كلمة المرور"
                className="w-full text-center tracking-widest text-2xl bg-neutral-900 border border-neutral-700 rounded py-3 outline-none text-white focus:border-[var(--color-champagne-600)]"
              />
              <div className="grid grid-cols-2 gap-3">
                <button
                  onClick={handleUnlockAction}
                  disabled={isPending}
                  className="bg-[var(--color-charcoal-900)] hover:bg-[var(--color-charcoal-800)] text-white py-3 rounded font-bold text-sm transition-colors disabled:opacity-50"
                >
                  {isPending ? 'جاري التحقق...' : 'فتح الشاشة'}
                </button>
                <button
                  onClick={handleLogoutAction}
                  className="bg-red-950/60 hover:bg-red-900 text-red-300 hover:text-white py-3 rounded font-bold text-sm transition-colors"
                >
                  خروج
                </button>
              </div>
            </div>
          </div>
        </div>
      )}

      {/* INACTIVITY SHUTTER IDLE PRIVACY OVERLAY */}
      {isIdle && (
        <div className="fixed inset-0 bg-neutral-950/98 z-54 flex flex-col items-center justify-center p-6 text-white text-center animate-fade-in select-none">
          <div className="max-w-md w-full space-y-8 flex flex-col items-center">
            {/* Transparent Dahab Logo Rendering */}
            <div className="w-48 h-48 flex items-center justify-center drop-shadow-2xl">
              <img
                src="/logo.png"
                alt="Dahab Perfumes Logo"
                onError={(e) => {
                  (e.target as HTMLElement).style.display = 'none';
                }}
                className="max-h-full max-w-full object-contain filter brightness-110"
              />
            </div>

            <div className="space-y-2">
              {posIdleShowClock && (
                <h1 className="text-4xl md:text-5xl font-mono tracking-wider font-extrabold text-[var(--color-champagne-400)]">{currentTime}</h1>
              )}
              {posIdleShowDate && (
                <p className="text-sm md:text-base text-neutral-400 font-medium">{currentDate}</p>
              )}
            </div>

            <div className="space-y-2">
              <div className="text-xl font-bold text-neutral-200">
                انقر للمتابعة
              </div>
              <div className="text-sm text-neutral-450" dir="ltr">
                Click to continue
              </div>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
export default POSCashierWorkspace;
