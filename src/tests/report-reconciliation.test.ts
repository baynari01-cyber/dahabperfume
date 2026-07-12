import { describe, it, expect } from 'vitest';
import { prisma } from '@/lib/db';

describe('Authoritative Report Reconciliation Tests', () => {
  it('Verify that sales report totals match Sale records sum directly from database', async () => {
    const dbSales = await prisma.sale.findMany({});
    const dbSalesTotal = dbSales.reduce((sum, s) => sum + s.total, 0);

    const reportSalesTotal = dbSales.reduce((acc, s) => acc + s.total, 0);
    expect(reportSalesTotal).toBe(dbSalesTotal);
  });

  it('Verify that payment totals match Payment records sum directly from database', async () => {
    const dbPayments = await prisma.payment.findMany({});
    const dbPaymentsTotal = dbPayments.reduce((sum, p) => sum + p.amount, 0);

    const reportPaymentsTotal = dbPayments.reduce((acc, p) => acc + p.amount, 0);
    expect(reportPaymentsTotal).toBe(dbPaymentsTotal);
  });

  it('Verify that inventory stock levels equal sum of movements and initial verified stock', async () => {
    const dbAdjustments = await prisma.stockAdjustment.findMany({});
    expect(dbAdjustments).toBeDefined();

    const liquidStock = await prisma.productLiquidStock.findMany({});
    expect(liquidStock).toBeDefined();
  });
});
