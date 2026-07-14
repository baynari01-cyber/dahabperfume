'use client';

import { useState } from 'react';
import { filsToDisplay } from '@/lib/money';

export function ProductVariantSelector({ 
  variants, 
  locale,
  product,
  mainImage
}: { 
  variants: any[], 
  locale: string,
  product: any,
  mainImage?: string
}) {
  const [selectedVariant, setSelectedVariant] = useState<any | null>(null);
  const [quantity, setQuantity] = useState(1);
  const [added, setAdded] = useState(false);

  const handleAddToCart = () => {
    if (!selectedVariant) return;
    
    try {
      const saved = localStorage.getItem('dahab_cart');
      const cartItems = saved ? JSON.parse(saved) : [];
      
      const existingItem = cartItems.find((item: any) => item.variantId === selectedVariant.id);
      
      if (existingItem) {
        existingItem.quantity += quantity;
      } else {
        cartItems.push({
          productId: product.id,
          variantId: selectedVariant.id,
          sku: selectedVariant.sku,
          name: locale === 'ar' ? product.nameAr : product.nameEn,
          size: selectedVariant.size,
          price: selectedVariant.price,
          quantity: quantity,
          image: mainImage || null
        });
      }
      
      localStorage.setItem('dahab_cart', JSON.stringify(cartItems));
      
      // Trigger a storage event manually so Header can update
      window.dispatchEvent(new Event('storage'));
      
      setAdded(true);
      setTimeout(() => setAdded(false), 2000);
    } catch (e) {
      console.error('Failed to add to cart', e);
    }
  };

  return (
    <>
      <div className="text-2xl font-bold text-[var(--color-champagne-600)] mb-2 h-10 flex items-center">
        {selectedVariant ? (
          filsToDisplay(selectedVariant.price, locale === 'ar' ? 'ar' : 'en')
        ) : (
          <span className="text-lg text-zinc-500 font-normal">
            {locale === 'ar' ? 'الرجاء تحديد الحجم لعرض السعر' : 'Please select a size to view price'}
          </span>
        )}
      </div>

      {/* Size Selector */}
      <div className="mb-8 mt-6">
        <h3 className="text-sm font-bold text-[var(--color-charcoal-900)] mb-3">
          {locale === 'ar' ? 'الحجم' : 'Size'}
        </h3>
        <div className="flex flex-wrap gap-3">
          {variants.map((variant) => (
            <button
              key={variant.id}
              onClick={() => setSelectedVariant(variant)}
              className={`px-6 py-2 border-2 rounded-md transition-colors text-sm font-bold ${
                selectedVariant?.id === variant.id
                  ? 'bg-[var(--color-champagne-600)] border-[var(--color-champagne-600)] text-white'
                  : 'border-[var(--color-champagne-600)] text-[var(--color-charcoal-900)] hover:bg-[var(--color-champagne-50)]'
              }`}
            >
              {variant.size}
            </button>
          ))}
          {variants.length === 0 && (
            <span className="text-sm text-zinc-500">
              {locale === 'ar' ? 'لا توجد أحجام متاحة' : 'No sizes available'}
            </span>
          )}
        </div>
      </div>

      {/* Quantity & Add to Cart */}
      <div className="flex items-center gap-4 mb-12">
        <div className="flex items-center border border-[var(--color-charcoal-900)] rounded-md">
          <button 
            onClick={() => setQuantity(Math.max(1, quantity - 1))}
            className="px-4 py-3 hover:bg-[var(--color-ivory-200)] text-[var(--color-charcoal-900)] transition-colors"
          >
            -
          </button>
          <span className="w-12 text-center font-bold text-[var(--color-charcoal-900)]">{quantity}</span>
          <button 
            onClick={() => setQuantity(quantity + 1)}
            className="px-4 py-3 hover:bg-[var(--color-ivory-200)] text-[var(--color-charcoal-900)] transition-colors"
          >
            +
          </button>
        </div>
        <button 
          disabled={!selectedVariant}
          onClick={handleAddToCart}
          className="flex-1 bg-[var(--color-charcoal-900)] hover:bg-[var(--color-charcoal-800)] disabled:opacity-50 disabled:cursor-not-allowed text-white font-bold py-3 rounded-md transition-colors"
        >
          {added ? (locale === 'ar' ? 'تمت الإضافة بنجاح!' : 'Added Successfully!') : (locale === 'ar' ? 'أضف إلى السلة' : 'Add to Cart')}
        </button>
      </div>
    </>
  );
}
