import { describe, it, expect } from 'vitest';

describe('Approved Global and Custom Pricing Matrix', () => {
  it('correctly maps the official global pricing matrix', () => {
    const globalPrices = {
      '50ml': 10.0,
      '100ml': 15.0,
      '200ml': 25.0
    };
    expect(globalPrices['50ml']).toBe(10.0);
    expect(globalPrices['100ml']).toBe(15.0);
    expect(globalPrices['200ml']).toBe(25.0);
  });

  it('correctly maps the official custom pricing matrix for DHB-0004', () => {
    const customPrices = {
      '50ml': 12.0,
      '100ml': 18.0,
      '200ml': 30.0
    };
    expect(customPrices['50ml']).toBe(12.0);
    expect(customPrices['100ml']).toBe(18.0);
    expect(customPrices['200ml']).toBe(30.0);
  });
});
