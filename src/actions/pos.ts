'use server';

import { prisma } from '@/lib/db';
import { requirePermission } from '@/lib/dal';
import crypto from 'crypto';

export async function processPOSCheckout(data: any) {
  const session = await requirePermission('pos:access');
  const employeeId = session.employeeId;

  const { items, customerName, paymentMethod, amountTendered } = data;

  if (!items || items.length === 0) {
    return { error: 'السلة فارغة' };
  }

  try {
    const saleResult = await prisma.$transaction(async (tx) => {
      let subtotal = 0;
      const saleItemsData = [];

      for (const item of items) {
        const { variantId, quantity } = item;
        const variant = await tx.productVariant.findUnique({
          where: { id: variantId },
          include: { product: true }
        });

        if (!variant || !variant.isActive) {
          throw new Error(`المنتج غير متوفر (SKU: ${item.sku})`);
        }

        // Deduct inventory
        if (variant.stock < quantity) {
          throw new Error(`مخزون غير كافٍ للمنتج (SKU: ${item.sku}). المتاح: ${variant.stock}`);
        }

        await tx.productVariant.update({
          where: { id: variant.id },
          data: { stock: variant.stock - quantity }
        });

        const unitPrice = variant.price;
        const total = unitPrice * quantity;
        subtotal += total;

        saleItemsData.push({
          variantId: variant.id,
          sku: variant.sku,
          name: variant.product.nameAr,
          size: variant.size,
          quantity,
          unitPrice,
          total
        });
        
        // Log inventory movement
        await tx.inventoryMovement.create({
          data: {
            sku: variant.sku,
            type: 'SALE',
            quantity: -quantity,
            employeeId,
            reference: 'POS_SALE'
          }
        });
      }

      // Check global pricing settings for tax rate
      const settings = await tx.globalPricingSettings.findUnique({ where: { id: '1' } });
      const taxRate = settings?.taxRate || 16.0;
      
      const taxAmount = Math.round(subtotal * (taxRate / 100));
      const grandTotal = subtotal + taxAmount;
      
      const reference = `POS-${crypto.randomBytes(4).toString('hex').toUpperCase()}`;

      // Create Sale
      const sale = await tx.sale.create({
        data: {
          reference,
          employeeId,
          customerName: customerName || 'عميل نقدي',
          subtotal,
          tax: taxAmount,
          total: grandTotal,
          status: 'COMPLETED',
          source: 'POS',
          items: {
            create: saleItemsData
          },
          payments: {
            create: {
              method: paymentMethod || 'CASH',
              amount: grandTotal,
              amountTendered: amountTendered || grandTotal
            }
          }
        }
      });

      // Create Invoice
      await tx.invoice.create({
        data: {
          saleId: sale.id,
          number: `INV-${Date.now()}`
        }
      });

      // Audit Log
      await tx.auditLog.create({
        data: {
          employeeId,
          action: 'SALE_COMPLETED',
          entityType: 'Sale',
          entityId: sale.id,
          details: JSON.stringify({ items: items.length, total: grandTotal })
        }
      });

      return { success: true, saleId: sale.id, reference: sale.reference, total: grandTotal };
    });

    return saleResult;

  } catch (error: any) {
    return { error: error.message || 'حدث خطأ غير معروف' };
  }
}
