// @vitest-environment node
import { describe, it, expect, beforeAll, vi } from 'vitest';
vi.mock('server-only', () => ({}));
vi.mock('@/lib/dal', () => {
  return {
    requirePermission: vi.fn(async () => {
      return { employeeId: 'tax-test-emp-id', employee: { role: { name: 'Admin' } } };
    }),
    requireAuth: vi.fn(async () => {
      return { employeeId: 'tax-test-emp-id', employee: { role: { name: 'Admin' } } };
    })
  };
});

import { prisma } from '@/lib/db';
import { processPOSCheckout } from '@/actions/pos';
import { confirmStorefrontOrder, recordInvoicePayment, recordInvoiceRefund } from '@/actions/orders';

describe('Tax Settings & Invoice snapshots', () => {
  let employeeId: string;
  let variantId: string;
  let productId: string;
  let categoryId: string;

  // Separation test variables
  let sepVariantId: string;
  let sepProductId: string;
  let sepCategoryId: string;

  beforeAll(async () => {
    try {
      // Cascadely clean existing test data to prevent FK violations
      await prisma.invoice.deleteMany({
      where: {
        OR: [
          { sale: { items: { some: { sku: { in: ['TAX-0001-50ml', 'SEP-0001-50ml'] } } } } },
          { order: { reference: { in: ['ORD-TEST-SEP-1', 'ORD-SHIPPING-TAX-1', 'ORD-PAY-COLLECT-1', 'ORD-REFUND-TEST-1'] } } }
        ]
      }
    });
    await prisma.payment.deleteMany({
      where: { sale: { items: { some: { sku: { in: ['TAX-0001-50ml', 'SEP-0001-50ml'] } } } } }
    });
    await prisma.saleItem.deleteMany({
      where: { sku: { in: ['TAX-0001-50ml', 'SEP-0001-50ml'] } }
    });
    await prisma.sale.deleteMany({
      where: { items: { some: { sku: { in: ['TAX-0001-50ml', 'SEP-0001-50ml'] } } } }
    });
    await prisma.orderItem.deleteMany({
      where: { sku: { in: ['TAX-0001-50ml', 'SEP-0001-50ml'] } }
    });
    await prisma.orderStatusHistory.deleteMany({
      where: { order: { reference: { in: ['ORD-TEST-SEP-1', 'ORD-SHIPPING-TAX-1', 'ORD-PAY-COLLECT-1', 'ORD-REFUND-TEST-1'] } } }
    });
    await prisma.order.deleteMany({
      where: { reference: { in: ['ORD-TEST-SEP-1', 'ORD-SHIPPING-TAX-1', 'ORD-PAY-COLLECT-1', 'ORD-REFUND-TEST-1'] } }
    });
    await prisma.productVariant.deleteMany({ where: { sku: { in: ['TAX-0001-50ml', 'SEP-0001-50ml'] } } });
    await prisma.product.deleteMany({ where: { sku: { in: ['TAX-0001', 'SEP-0001'] } } });
    await prisma.category.deleteMany({ where: { slug: { in: ['test-category', 'order-sep-cat'] } } });

    // Clean up employee references
    await prisma.invoice.deleteMany({ where: { sale: { employeeId: 'tax-test-emp-id' } } });
    await prisma.payment.deleteMany({ where: { sale: { employeeId: 'tax-test-emp-id' } } });
    await prisma.saleItem.deleteMany({ where: { sale: { employeeId: 'tax-test-emp-id' } } });
    await prisma.sale.deleteMany({ where: { employeeId: 'tax-test-emp-id' } });
    await prisma.inventoryMovement.deleteMany({ where: { employeeId: 'tax-test-emp-id' } });
    await prisma.auditLog.deleteMany({ where: { employeeId: 'tax-test-emp-id' } });
    await prisma.employee.deleteMany({ where: { id: 'tax-test-emp-id' } });
    await prisma.employee.deleteMany({ where: { email: 'tax-test@dahab.local' } });

    // Setup minimal DB mock records for test runs
    const role = await prisma.role.upsert({
      where: { name: 'Admin' },
      update: {},
      create: { name: 'Admin' }
    });

    const emp = await prisma.employee.upsert({
      where: { email: 'tax-test@dahab.local' },
      update: {},
      create: {
        id: 'tax-test-emp-id',
        email: 'tax-test@dahab.local',
        name: 'Tax Test Employee',
        passwordHash: 'hashedpwd',
        roleId: role.id
      }
    });
    employeeId = emp.id;

    // Initialize Tax pricing setting
    await prisma.globalPricingSettings.upsert({
      where: { id: '1' },
      update: {
        taxEnabled: false,
        taxRate: 0.0,
        pricesIncludeTax: true
      },
      create: {
        id: '1',
        taxEnabled: false,
        taxRate: 0.0,
        pricesIncludeTax: true
      }
    });

    // 1. Initialize Tax test variant
    const cat = await prisma.category.create({
      data: { name: 'Test Category', slug: 'test-category' }
    });
    categoryId = cat.id;

    const prod = await prisma.product.create({
      data: {
        nameAr: 'عطر الفحص الضريبي',
        nameEn: 'Tax Test Perfume',
        sku: 'TAX-0001',
        slug: 'tax-test-perfume',
        categoryId: cat.id,
        isVisible: true
      }
    });
    productId = prod.id;

    const variant = await prisma.productVariant.create({
      data: {
        productId: prod.id,
        sku: 'TAX-0001-50ml',
        size: '50ml',
        price: 1000, // 10 JOD in fils
        stock: 100,
        isActive: true,
        usesGlobalPricing: false
      }
    });
    variantId = variant.id;

    // 2. Initialize Separation test variant
    const sepCat = await prisma.category.create({
      data: { name: 'Order Separation Cat', slug: 'order-sep-cat' }
    });
    sepCategoryId = sepCat.id;

    const sepProd = await prisma.product.create({
      data: {
        nameAr: 'عطر الفصل',
        nameEn: 'Separation Perfume',
        sku: 'SEP-0001',
        slug: 'sep-perfume',
        categoryId: sepCat.id,
        isVisible: true
      }
    });
    sepProductId = sepProd.id;

    const sepVariant = await prisma.productVariant.create({
      data: {
        productId: sepProd.id,
        sku: 'SEP-0001-50ml',
        size: '50ml',
        price: 1000,
        stock: 50,
        isActive: true,
        usesGlobalPricing: false
      }
    });
    sepVariantId = sepVariant.id;
    } catch (err) {
      console.error('TAX AND INVOICE TEST SETUP ERROR:', err);
      throw err;
    }
  });

  it('Tax-disabled: POS checkout totals equal official variant prices', async () => {
    // Disable tax
    await prisma.globalPricingSettings.update({
      where: { id: '1' },
      data: { taxEnabled: false, taxRate: 16.0, pricesIncludeTax: true }
    });

    const res = await processPOSCheckout({
      items: [{ variantId, sku: 'TAX-0001-50ml', quantity: 2 }],
      customerName: 'Cash customer',
      paymentMethod: 'CASH',
      amountTendered: 2000
    });

    if (!res.success) {
      throw new Error(`POS CHECKOUT ERROR 1: ${res.error}`);
    }
    expect(res.success).toBe(true);
    if (res.success) {
      const invoice = await prisma.invoice.findUnique({
        where: { saleId: res.saleId }
      });
      expect(invoice).not.toBeNull();
      expect(invoice?.taxModeSnapshot).toBe('DISABLED');
      expect(invoice?.taxAmountFils).toBe(0);
      expect(invoice?.grossTotalFils).toBe(2000); // 2 items x 1000 = 2000 fils
      expect(invoice?.netSubtotalFils).toBe(2000);
    }
  });

  it('Inclusive tax: does not increase the final total', async () => {
    // Enable inclusive tax
    await prisma.globalPricingSettings.update({
      where: { id: '1' },
      data: { taxEnabled: true, taxRate: 16.0, pricesIncludeTax: true }
    });

    const res = await processPOSCheckout({
      items: [{ variantId, sku: 'TAX-0001-50ml', quantity: 2 }],
      customerName: 'Cash customer',
      paymentMethod: 'CASH',
      amountTendered: 2000
    });

    expect(res.success).toBe(true);
    if (res.success) {
      const invoice = await prisma.invoice.findUnique({
        where: { saleId: res.saleId }
      });
      expect(invoice).not.toBeNull();
      expect(invoice?.taxModeSnapshot).toBe('INCLUSIVE');
      expect(invoice?.pricesIncludeTaxSnapshot).toBe(true);
      expect(invoice?.grossTotalFils).toBe(2000); // Does not increase!
      // taxAmount = 2000 - Math.round(2000 / 1.16) = 2000 - 1724 = 276
      expect(invoice?.taxAmountFils).toBe(276);
      expect(invoice?.netSubtotalFils).toBe(1724);
    }
  });

  it('Exclusive tax: applies on top of selling price when explicitly configured', async () => {
    // Enable exclusive tax
    await prisma.globalPricingSettings.update({
      where: { id: '1' },
      data: { taxEnabled: true, taxRate: 16.0, pricesIncludeTax: false }
    });

    const res = await processPOSCheckout({
      items: [{ variantId, sku: 'TAX-0001-50ml', quantity: 2 }],
      customerName: 'Cash customer',
      paymentMethod: 'CASH',
      amountTendered: 2320
    });

    if (!res.success) {
      throw new Error(`POS CHECKOUT ERROR 3: ${res.error}`);
    }
    expect(res.success).toBe(true);
    if (res.success) {
      const invoice = await prisma.invoice.findUnique({
        where: { saleId: res.saleId }
      });
      expect(invoice).not.toBeNull();
      expect(invoice?.taxModeSnapshot).toBe('EXCLUSIVE');
      expect(invoice?.pricesIncludeTaxSnapshot).toBe(false);
      expect(invoice?.netSubtotalFils).toBe(2000);
      // taxAmount = 2000 * 0.16 = 320 fils
      expect(invoice?.taxAmountFils).toBe(320);
      expect(invoice?.grossTotalFils).toBe(2320); // 2000 + 320 = 2320 fils
    }
  });

  it('Historical invoices do not change after global tax settings change', async () => {
    // 1. Create exclusive tax invoice
    await prisma.globalPricingSettings.update({
      where: { id: '1' },
      data: { taxEnabled: true, taxRate: 16.0, pricesIncludeTax: false }
    });

    const res = await processPOSCheckout({
      items: [{ variantId, sku: 'TAX-0001-50ml', quantity: 1 }],
      customerName: 'History test customer',
      paymentMethod: 'CASH',
      amountTendered: 1160
    });

    if (!res.success) {
      throw new Error(`POS CHECKOUT ERROR 4: ${res.error}`);
    }
    expect(res.success).toBe(true);
    let invoiceId = '';
    if (res.success) {
      const invoice = await prisma.invoice.findUnique({
        where: { saleId: res.saleId }
      });
      invoiceId = invoice!.id;
      expect(invoice?.taxAmountFils).toBe(160);
      expect(invoice?.grossTotalFils).toBe(1160);
    }

    // 2. Change global tax settings to disabled
    await prisma.globalPricingSettings.update({
      where: { id: '1' },
      data: { taxEnabled: false, taxRate: 0.0 }
    });

    // 3. Reload historical invoice and verify it is unchanged
    const reloaded = await prisma.invoice.findUnique({
      where: { id: invoiceId }
    });
    expect(reloaded?.taxRateSnapshot).toBe(16.0);
    expect(reloaded?.taxModeSnapshot).toBe('EXCLUSIVE');
    expect(reloaded?.taxAmountFils).toBe(160);
    expect(reloaded?.grossTotalFils).toBe(1160);
  });

  it('Storefront order creation does NOT generate an Invoice, but confirmation does', async () => {
    // 1. Create storefront order (simulate processCheckout manually to bypass HTTP session requirement)
    const order = await prisma.order.create({
      data: {
        reference: 'ORD-TEST-SEP-1',
        customerName: 'Separation Customer',
        customerPhone: '0799999999',
        status: 'AWAITING_WHATSAPP',
        totalAmount: 1000,
        shippingCost: 0,
        items: {
          create: [{
            productId: sepProductId,
            variantId: sepVariantId,
            sku: 'SEP-0001-50ml',
            name: 'عطر الفصل',
            size: '50ml',
            quantity: 1,
            unitPrice: 1000,
            total: 1000
          }]
        }
      }
    });

    // Verify order exists but no invoice links to it
    const orderBefore = await prisma.order.findUnique({
      where: { id: order.id },
      include: { invoice: true }
    });
    expect(orderBefore?.invoice).toBeNull();
    expect(orderBefore?.status).toBe('AWAITING_WHATSAPP');

    // 2. Confirm the order using authorized action
    const confirmRes = await confirmStorefrontOrder(order.id);
    expect(confirmRes.success).toBe(true);

    // Verify order is now CONFIRMED and has a linked Invoice
    const orderAfter = await prisma.order.findUnique({
      where: { id: order.id },
      include: { invoice: true }
    });
    expect(orderAfter?.status).toBe('CONFIRMED');
    expect(orderAfter?.invoice).not.toBeNull();
    expect(orderAfter?.invoice?.orderId).toBe(order.id);
    expect(orderAfter?.invoice?.number).toContain('INV-ORD-');
  });

  describe('Accounting Integrity & Split Payments', () => {
    it('Cash-only exact payment: cashApplied = total, cashTendered = total, changeDue = 0', async () => {
      // 1 JOD variant (1000 fils)
      await prisma.globalPricingSettings.update({
        where: { id: '1' },
        data: { taxEnabled: false, taxRate: 16.0, pricesIncludeTax: true }
      });

      const res = await processPOSCheckout({
        items: [{ variantId, sku: 'TAX-0001-50ml', quantity: 1 }],
        payments: [{ method: 'CASH', amount: 1000, amountTendered: 1000 }]
      });
      if (!res.success) throw new Error(`Checkout failed: ${res.error}`);
      
      const invoice = await prisma.invoice.findUnique({ where: { saleId: res.saleId } });
      expect(invoice?.cashAppliedFils).toBe(1000);
      expect(invoice?.cashTenderedFils).toBe(1000);
      expect(invoice?.changeDueFils).toBe(0);
      expect(invoice?.grossTotalFils).toBe(1000);
    });

    it('Cash-only overpayment with change: cashApplied = total, cashTendered > total, changeDue > 0', async () => {
      await prisma.globalPricingSettings.update({
        where: { id: '1' },
        data: { taxEnabled: false, taxRate: 16.0, pricesIncludeTax: true }
      });

      const res = await processPOSCheckout({
        items: [{ variantId, sku: 'TAX-0001-50ml', quantity: 1 }],
        payments: [{ method: 'CASH', amount: 1000, amountTendered: 1500 }]
      });
      if (!res.success) throw new Error(`Checkout failed: ${res.error}`);

      const invoice = await prisma.invoice.findUnique({ where: { saleId: res.saleId } });
      expect(invoice?.cashAppliedFils).toBe(1000);
      expect(invoice?.cashTenderedFils).toBe(1500);
      expect(invoice?.changeDueFils).toBe(500);
      expect(invoice?.grossTotalFils).toBe(1000);
    });

    it('Card-only payment: cardApplied = total, cashTendered = 0, changeDue = 0', async () => {
      await prisma.globalPricingSettings.update({
        where: { id: '1' },
        data: { taxEnabled: false, taxRate: 16.0, pricesIncludeTax: true }
      });

      const res = await processPOSCheckout({
        items: [{ variantId, sku: 'TAX-0001-50ml', quantity: 1 }],
        payments: [{ method: 'CARD', amount: 1000, terminalRef: 'TERM-1234' }]
      });
      if (!res.success) throw new Error(`Checkout failed: ${res.error}`);

      const invoice = await prisma.invoice.findUnique({ where: { saleId: res.saleId } });
      expect(invoice?.cardAppliedFils).toBe(1000);
      expect(invoice?.cashTenderedFils).toBe(0);
      expect(invoice?.changeDueFils).toBe(0);
      expect(invoice?.grossTotalFils).toBe(1000);
      
      const p = await prisma.payment.findFirst({ where: { saleId: res.saleId } });
      expect(p?.method).toBe('CARD');
      expect(p?.terminalRef).toBe('TERM-1234');
      expect(p?.amount).toBe(1000);
    });

    it('Cash/card split exact payment: cashApplied + cardApplied = total', async () => {
      await prisma.globalPricingSettings.update({
        where: { id: '1' },
        data: { taxEnabled: false, taxRate: 16.0, pricesIncludeTax: true }
      });

      const res = await processPOSCheckout({
        items: [{ variantId, sku: 'TAX-0001-50ml', quantity: 1 }],
        payments: [
          { method: 'CASH', amount: 600, amountTendered: 600 },
          { method: 'CARD', amount: 400 }
        ]
      });
      if (!res.success) throw new Error(`Checkout failed: ${res.error}`);

      const invoice = await prisma.invoice.findUnique({ where: { saleId: res.saleId } });
      expect(invoice?.cashAppliedFils).toBe(600);
      expect(invoice?.cardAppliedFils).toBe(400);
      expect(invoice?.cashTenderedFils).toBe(600);
      expect(invoice?.changeDueFils).toBe(0);
      expect(invoice?.grossTotalFils).toBe(1000);

      const payments = await prisma.payment.findMany({ where: { saleId: res.saleId } });
      const totalPaymentsApplied = payments.reduce((sum, pay) => sum + pay.amount, 0);
      expect(totalPaymentsApplied).toBe(1000);
    });

    it('Cash/card split with cash over-tender: change calculated correctly from cash portion only', async () => {
      await prisma.globalPricingSettings.update({
        where: { id: '1' },
        data: { taxEnabled: false, taxRate: 16.0, pricesIncludeTax: true }
      });

      const res = await processPOSCheckout({
        items: [{ variantId, sku: 'TAX-0001-50ml', quantity: 1 }],
        payments: [
          { method: 'CASH', amount: 600, amountTendered: 1000 },
          { method: 'CARD', amount: 400 }
        ]
      });
      if (!res.success) throw new Error(`Checkout failed: ${res.error}`);

      const invoice = await prisma.invoice.findUnique({ where: { saleId: res.saleId } });
      expect(invoice?.cashAppliedFils).toBe(600);
      expect(invoice?.cardAppliedFils).toBe(400);
      expect(invoice?.cashTenderedFils).toBe(1000);
      expect(invoice?.changeDueFils).toBe(400); // 1000 cashTendered - 600 cashApplied = 400 changeDue
      expect(invoice?.grossTotalFils).toBe(1000);
    });

    it('Underpayment rejection: fails when applied payment is less than total', async () => {
      await prisma.globalPricingSettings.update({
        where: { id: '1' },
        data: { taxEnabled: false, taxRate: 16.0, pricesIncludeTax: true }
      });

      const res = await processPOSCheckout({
        items: [{ variantId, sku: 'TAX-0001-50ml', quantity: 1 }],
        payments: [
          { method: 'CASH', amount: 500 },
          { method: 'CARD', amount: 400 }
        ]
      });
      expect(res.success).toBe(false);
      expect(res.error).toContain('مجموع المبالغ المدفوعة لا يساوي إجمالي الفاتورة');
    });

    it('Applied payment exceeding invoice rejection: fails when applied payment is more than total', async () => {
      await prisma.globalPricingSettings.update({
        where: { id: '1' },
        data: { taxEnabled: false, taxRate: 16.0, pricesIncludeTax: true }
      });

      const res = await processPOSCheckout({
        items: [{ variantId, sku: 'TAX-0001-50ml', quantity: 1 }],
        payments: [
          { method: 'CASH', amount: 700 },
          { method: 'CARD', amount: 400 }
        ]
      });
      expect(res.success).toBe(false);
      expect(res.error).toContain('مجموع المبالغ المدفوعة لا يساوي إجمالي الفاتورة');
    });

    it('Tendered cash not counted as revenue (assert payment amount equals applied amount, not tendered)', async () => {
      await prisma.globalPricingSettings.update({
        where: { id: '1' },
        data: { taxEnabled: false, taxRate: 16.0, pricesIncludeTax: true }
      });

      const res = await processPOSCheckout({
        items: [{ variantId, sku: 'TAX-0001-50ml', quantity: 1 }],
        payments: [{ method: 'CASH', amount: 1000, amountTendered: 1500 }]
      });
      if (!res.success) throw new Error(`Checkout failed: ${res.error}`);

      const payments = await prisma.payment.findMany({ where: { saleId: res.saleId } });
      expect(payments.length).toBe(1);
      expect(payments[0].amount).toBe(1000); // applied amount is 1000
      expect(payments[0].amountTendered).toBe(1500); // tendered amount is 1500
    });
  });

  describe('Rounding and Fractional Fils (0%, 8%, 16% taxes)', () => {
    it('Exclusive 8% tax with fraction rounding: total = netSubtotal + tax', async () => {
      await prisma.globalPricingSettings.update({
        where: { id: '1' },
        data: { taxEnabled: true, taxRate: 8.0, pricesIncludeTax: false }
      });

      const res = await processPOSCheckout({
        items: [{ variantId, sku: 'TAX-0001-50ml', quantity: 1 }],
        payments: [{ method: 'CASH', amount: 1080, amountTendered: 1080 }]
      });
      if (!res.success) throw new Error(`Checkout failed: ${res.error}`);

      const invoice = await prisma.invoice.findUnique({ where: { saleId: res.saleId } });
      expect(invoice?.taxModeSnapshot).toBe('EXCLUSIVE');
      expect(invoice?.netSubtotalFils).toBe(1000);
      expect(invoice?.taxAmountFils).toBe(80);
      expect(invoice?.grossTotalFils).toBe(1080);
    });

    it('Inclusive 16% tax rounding fraction: grossTotal remains variant price, subtotal + tax = grossTotal', async () => {
      await prisma.globalPricingSettings.update({
        where: { id: '1' },
        data: { taxEnabled: true, taxRate: 16.0, pricesIncludeTax: true }
      });

      const res = await processPOSCheckout({
        items: [{ variantId, sku: 'TAX-0001-50ml', quantity: 1 }],
        payments: [{ method: 'CASH', amount: 1000, amountTendered: 1000 }]
      });
      if (!res.success) throw new Error(`Checkout failed: ${res.error}`);

      const invoice = await prisma.invoice.findUnique({ where: { saleId: res.saleId } });
      expect(invoice?.taxModeSnapshot).toBe('INCLUSIVE');
      expect(invoice?.grossTotalFils).toBe(1000);
      expect(invoice?.taxAmountFils).toBe(138);
      expect(invoice?.netSubtotalFils).toBe(862);
      expect(invoice!.netSubtotalFils + invoice!.taxAmountFils).toBe(invoice?.grossTotalFils);
    });

    it('Multiple items and quantities with 16% exclusive tax rounding', async () => {
      await prisma.globalPricingSettings.update({
        where: { id: '1' },
        data: { taxEnabled: true, taxRate: 16.0, pricesIncludeTax: false }
      });

      const res = await processPOSCheckout({
        items: [{ variantId, sku: 'TAX-0001-50ml', quantity: 2 }],
        payments: [{ method: 'CASH', amount: 2320, amountTendered: 2320 }]
      });
      if (!res.success) throw new Error(`Checkout failed: ${res.error}`);

      const invoice = await prisma.invoice.findUnique({ where: { saleId: res.saleId } });
      expect(invoice?.taxModeSnapshot).toBe('EXCLUSIVE');
      expect(invoice?.netSubtotalFils).toBe(2000);
      expect(invoice?.taxAmountFils).toBe(320);
      expect(invoice?.grossTotalFils).toBe(2320);
    });
  });

  describe('Discount, Shipping, Payment Collection and Refunds', () => {
    it('Discount plus tax: discount applies before tax', async () => {
      await prisma.globalPricingSettings.update({
        where: { id: '1' },
        data: { taxEnabled: true, taxRate: 16.0, pricesIncludeTax: false }
      });

      const res = await processPOSCheckout({
        items: [{ variantId, sku: 'TAX-0001-50ml', quantity: 1 }],
        discount: 200,
        payments: [{ method: 'CASH', amount: 928, amountTendered: 928 }]
      });
      if (!res.success) throw new Error(`Checkout failed: ${res.error}`);

      const invoice = await prisma.invoice.findUnique({ where: { saleId: res.saleId } });
      expect(invoice?.discountAmountFils).toBe(200);
      expect(invoice?.netSubtotalFils).toBe(800);
      expect(invoice?.taxAmountFils).toBe(128);
      expect(invoice?.grossTotalFils).toBe(928);
    });

    it('Shipping plus tax: shipping added after tax calculation', async () => {
      await prisma.globalPricingSettings.update({
        where: { id: '1' },
        data: { taxEnabled: true, taxRate: 16.0, pricesIncludeTax: false }
      });

      const order = await prisma.order.create({
        data: {
          reference: 'ORD-SHIPPING-TAX-1',
          customerName: 'Shipping Tax Customer',
          customerPhone: '0799999999',
          status: 'AWAITING_WHATSAPP',
          totalAmount: 4000,
          shippingCost: 3000,
          items: {
            create: [{
              productId: sepProductId,
              variantId: sepVariantId,
              sku: 'SEP-0001-50ml',
              name: 'عطر الفصل',
              size: '50ml',
              quantity: 1,
              unitPrice: 1000,
              total: 1000
            }]
          }
        }
      });

      const confirmRes = await confirmStorefrontOrder(order.id);
      expect(confirmRes.success).toBe(true);

      const invoice = await prisma.invoice.findUnique({
        where: { orderId: order.id }
      });
      expect(invoice?.shippingAmountFils).toBe(3000);
      expect(invoice?.netSubtotalFils).toBe(1000);
      expect(invoice?.taxAmountFils).toBe(160);
      expect(invoice?.grossTotalFils).toBe(4160);
      expect(invoice?.paymentStatus).toBe('COD_PENDING');
    });

    it('Payment collection changes status to PAID', async () => {
      // Reset tax settings to disabled
      await prisma.globalPricingSettings.update({
        where: { id: '1' },
        data: { taxEnabled: false, taxRate: 0.0, pricesIncludeTax: true }
      });

      const order = await prisma.order.create({
        data: {
          reference: 'ORD-PAY-COLLECT-1',
          customerName: 'Collection Customer',
          customerPhone: '0799999999',
          status: 'AWAITING_WHATSAPP',
          totalAmount: 1000,
          shippingCost: 0,
          items: {
            create: [{
              productId: sepProductId,
              variantId: sepVariantId,
              sku: 'SEP-0001-50ml',
              name: 'عطر الفصل',
              size: '50ml',
              quantity: 1,
              unitPrice: 1000,
              total: 1000
            }]
          }
        }
      });

      await confirmStorefrontOrder(order.id);
      const invoice = await prisma.invoice.findUnique({ where: { orderId: order.id } });
      expect(invoice?.paymentStatus).toBe('COD_PENDING');

      const payRes = await recordInvoicePayment(invoice!.id, 1000, 'CASH', 'tax-test-emp-id', 1000);
      expect(payRes.success).toBe(true);

      const updatedInvoice = await prisma.invoice.findUnique({ where: { id: invoice!.id } });
      expect(updatedInvoice?.paymentStatus).toBe('PAID');
      expect(updatedInvoice?.cashAppliedFils).toBe(1000);
      expect(updatedInvoice?.cashTenderedFils).toBe(1000);
      expect(updatedInvoice?.changeDueFils).toBe(0);

      const updatedOrder = await prisma.order.findUnique({ where: { id: order.id } });
      expect(updatedOrder?.paymentStatus).toBe('PAID');
    });

    it('Partial refund changes status to PARTIALLY_REFUNDED and full refund to REFUNDED', async () => {
      // Reset tax settings to disabled
      await prisma.globalPricingSettings.update({
        where: { id: '1' },
        data: { taxEnabled: false, taxRate: 0.0, pricesIncludeTax: true }
      });

      const order = await prisma.order.create({
        data: {
          reference: 'ORD-REFUND-TEST-1',
          customerName: 'Refund Customer',
          customerPhone: '0799999999',
          status: 'AWAITING_WHATSAPP',
          totalAmount: 1000,
          shippingCost: 0,
          items: {
            create: [{
              productId: sepProductId,
              variantId: sepVariantId,
              sku: 'SEP-0001-50ml',
              name: 'عطر الفصل',
              size: '50ml',
              quantity: 1,
              unitPrice: 1000,
              total: 1000
            }]
          }
        }
      });

      await confirmStorefrontOrder(order.id);
      const invoice = await prisma.invoice.findUnique({ where: { orderId: order.id } });

      await recordInvoicePayment(invoice!.id, 1000, 'CASH', 'tax-test-emp-id', 1000);

      const refund1 = await recordInvoiceRefund(invoice!.id, 400, 'tax-test-emp-id');
      expect(refund1.success).toBe(true);
      
      const invoicePartiallyRefunded = await prisma.invoice.findUnique({ where: { id: invoice!.id } });
      expect(invoicePartiallyRefunded?.paymentStatus).toBe('PARTIALLY_REFUNDED');

      const refund2 = await recordInvoiceRefund(invoice!.id, 1000, 'tax-test-emp-id');
      expect(refund2.success).toBe(true);

      const invoiceFullyRefunded = await prisma.invoice.findUnique({ where: { id: invoice!.id } });
      expect(invoiceFullyRefunded?.paymentStatus).toBe('REFUNDED');
    });
  });
});
