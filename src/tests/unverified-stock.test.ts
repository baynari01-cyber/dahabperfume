import { describe, it, expect } from 'vitest';

interface CartItem {
  name: string;
  sku: string;
  stockStatus: 'VERIFIED' | 'UNVERIFIED';
}

function getStockDisplay(item: CartItem, locale: 'ar' | 'en'): string {
  if (item.stockStatus === 'UNVERIFIED') {
    return locale === 'ar' 
      ? 'بانتظار تأكيد التوفر في المخزن عند الطلب' 
      : 'Availability confirmed upon request';
  }
  return locale === 'ar' ? 'متوفر في المخزن' : 'In Stock';
}

describe('StockStatus = UNVERIFIED Business Policy', () => {
  it('Displays availability confirmation message instead of positive quantities for UNVERIFIED status', () => {
    const item: CartItem = {
      name: 'عطر دهب الفاخر',
      sku: 'DHB-0001-50ml',
      stockStatus: 'UNVERIFIED'
    };

    expect(getStockDisplay(item, 'ar')).toBe('بانتظار تأكيد التوفر في المخزن عند الطلب');
    expect(getStockDisplay(item, 'en')).toBe('Availability confirmed upon request');
  });

  it('Displays positive standard stock message for VERIFIED items', () => {
    const item: CartItem = {
      name: 'عطر دهب الفاخر',
      sku: 'DHB-0001-50ml',
      stockStatus: 'VERIFIED'
    };

    expect(getStockDisplay(item, 'ar')).toBe('متوفر في المخزن');
    expect(getStockDisplay(item, 'en')).toBe('In Stock');
  });
});
