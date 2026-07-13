'use server';

import { prisma } from '@/lib/db';
import { requirePermission } from '@/lib/dal';
import { calculateInclusiveTax, calculateExclusiveTax } from '@/lib/money';

export async function confirmStorefrontOrder(orderId: string) {
  // 1. Require authorized permission
  const session = await requirePermission('orders.confirm');
  const employeeId = session.employeeId;

  try {
    const result = await prisma.$transaction(async (tx) => {
      // 2. Load order and check status
      const order = await tx.order.findUnique({
        where: { id: orderId },
        include: { items: true }
      });

      if (!order) {
        throw new Error('الطلب غير موجود');
      }

      if (order.status === 'CONFIRMED') {
        throw new Error('الطلب مؤكد مسبقاً');
      }

      // 3. Reload snapshot and inventory requirements, deduct atomically
      for (const item of order.items) {
        const variant = await tx.productVariant.findUnique({
          where: { id: item.variantId },
          include: { product: true }
        });

        if (!variant || !variant.isActive) {
          throw new Error(`المنتج غير متوفر (SKU: ${item.sku})`);
        }

        // Check if there is an active Formula for this product & size
        const formula = await tx.productFormula.findFirst({
          where: {
            productId: variant.productId,
            size: variant.size,
            isActive: true
          },
          include: {
            items: {
              include: {
                material: {
                  include: { stock: true }
                }
              }
            }
          }
        });

        if (formula) {
          // FORMULA_BASED deduction
          for (const formulaItem of formula.items) {
            const requiredQty = formulaItem.quantity * item.quantity;

            const currentStock = formulaItem.material.stock?.quantity || 0;
            if (currentStock < requiredQty) {
              throw new Error(
                `مخزون غير كافٍ للمادة الخام ${formulaItem.material.name} المطلوبة لتركيبة ${variant.product.nameAr}. المتاح: ${currentStock}, المطلوب: ${requiredQty}`
              );
            }

            // Decrement material stock
            await tx.rawMaterialStock.update({
              where: { materialId: formulaItem.materialId },
              data: { quantity: { decrement: requiredQty } }
            });

            // Log raw material movement
            await tx.rawMaterialMovement.create({
              data: {
                materialId: formulaItem.materialId,
                type: 'CONSUMPTION',
                quantity: -requiredQty,
                notes: `Order Confirmation Formula consumption for Order ${order.reference}`
              }
            });

            // Create Consumption record
            await tx.consumptionRecord.create({
              data: {
                materialId: formulaItem.materialId,
                quantity: requiredQty
              }
            });
          }
        } else {
          // Check finished product stock
          if (variant.stock < item.quantity) {
            throw new Error(`مخزون غير كافٍ للمنتج (SKU: ${variant.sku}). المتاح أقل من الكمية المطلوبة.`);
          }

          // Decrement variant stock
          await tx.productVariant.update({
            where: { id: variant.id },
            data: { stock: { decrement: item.quantity } }
          });
        }

        // Log final product inventory movement
        await tx.inventoryMovement.create({
          data: {
            sku: variant.sku,
            type: 'SALE',
            quantity: -item.quantity,
            employeeId,
            reference: `ORDER_CONFIRMATION_${order.reference}`
          }
        });
      }

      // 4. Load tax settings and compute totals
      const settings = await tx.globalPricingSettings.findUnique({ where: { id: '1' } });
      const taxEnabled = settings?.taxEnabled ?? false;
      const taxRate = settings?.taxRate ?? 0.0;
      const pricesIncludeTax = settings?.pricesIncludeTax ?? true;

      const subtotal = order.totalAmount - order.shippingCost;
      let taxAmount = 0;
      let calculatedSubtotal = subtotal;
      let computedTotal = subtotal;

      if (taxEnabled) {
        if (pricesIncludeTax) {
          taxAmount = calculateInclusiveTax(subtotal, taxRate);
          calculatedSubtotal = subtotal - taxAmount;
          computedTotal = subtotal;
        } else {
          taxAmount = calculateExclusiveTax(subtotal, taxRate);
          calculatedSubtotal = subtotal;
          computedTotal = subtotal + taxAmount;
        }
      } else {
        taxAmount = 0;
        calculatedSubtotal = subtotal;
        computedTotal = subtotal;
      }
      const finalTotal = computedTotal + order.shippingCost;

      // 5. Create Sale record (without payments since it is COD)
      const sale = await tx.sale.create({
        data: {
          reference: `SALE-ORD-${order.reference}`,
          employeeId,
          customerName: order.customerName,
          subtotal: calculatedSubtotal,
          tax: taxAmount,
          total: finalTotal,
          status: 'COMPLETED',
          source: 'STOREFRONT',
          items: {
            create: order.items.map(item => ({
              variantId: item.variantId,
              sku: item.sku,
              name: item.name,
              size: item.size,
              quantity: item.quantity,
              unitPrice: item.unitPrice,
              total: item.total
            }))
          }
        }
      });

      // 6. Update order status to CONFIRMED and paymentStatus to COD_PENDING
      const updatedOrder = await tx.order.update({
        where: { id: orderId },
        data: { 
          status: 'CONFIRMED',
          totalAmount: finalTotal,
          paymentStatus: 'COD_PENDING'
        }
      });

      // 7. Create Invoice with snapshots
      await tx.invoice.create({
        data: {
          orderId: order.id,
          saleId: sale.id,
          number: `INV-ORD-${order.reference}-${Date.now()}`,
          
          // Unambiguous Financial Snapshots (in Fils)
          netSubtotalFils: calculatedSubtotal,
          discountAmountFils: 0,
          shippingAmountFils: order.shippingCost,
          taxAmountFils: taxAmount,
          grossTotalFils: finalTotal,
          taxRateSnapshot: taxRate,
          taxModeSnapshot: !taxEnabled ? 'DISABLED' : (pricesIncludeTax ? 'INCLUSIVE' : 'EXCLUSIVE'),
          pricesIncludeTaxSnapshot: pricesIncludeTax,
          
          // Payment & Cash Tender/Allocation Breakdown (in Fils)
          cashAppliedFils: 0,
          cardAppliedFils: 0,
          cashTenderedFils: 0,
          changeDueFils: 0,
          paymentStatus: 'COD_PENDING',
          confirmedByEmployeeId: employeeId
        }
      });

      // 7. Write order status history
      await tx.orderStatusHistory.create({
        data: {
          orderId: order.id,
          status: 'CONFIRMED',
          notes: `Order confirmed by employee: ${employeeId}`
        }
      });

      // 8. Write audit logs
      await tx.auditLog.create({
        data: {
          employeeId,
          action: 'ORDER_CONFIRMED',
          entityType: 'Order',
          entityId: order.id,
          details: JSON.stringify({ reference: order.reference, total: finalTotal })
        }
      });

      return updatedOrder;
    });

    return { success: true, order: result };
  } catch (error: any) {
    return { error: error.message || 'حدث خطأ غير معروف' };
  }
}

export async function recordInvoicePayment(
  invoiceId: string,
  amount: number,
  method: 'CASH' | 'CARD',
  employeeId: string,
  amountTendered?: number,
  terminalRef?: string
): Promise<{ success: boolean; error?: string }> {
  try {
    await requirePermission('manage_orders');

    const result = await prisma.$transaction(async (tx) => {
      const invoice = await tx.invoice.findUnique({
        where: { id: invoiceId },
        include: { order: true, sale: true }
      });

      if (!invoice) throw new Error('الفاتورة غير موجودة');
      if (invoice.paymentStatus === 'PAID') throw new Error('الفاتورة مدفوعة بالكامل بالفعل');

      const saleId = invoice.saleId;
      if (!saleId) throw new Error('لا يمكن تسجيل دفعة لفاتورة غير مرتبطة بعملية بيع');

      // Create Payment record
      await tx.payment.create({
        data: {
          saleId,
          method,
          amount,
          amountTendered: method === 'CASH' ? (amountTendered ?? amount) : null,
          terminalRef: method === 'CARD' ? (terminalRef || null) : null
        }
      });

      // Calculate total applied payments so far
      const payments = await tx.payment.findMany({ where: { saleId } });
      const totalPayments = payments.reduce((sum, p) => sum + p.amount, 0);

      // Check if invoice is paid
      let newStatus = 'PARTIALLY_PAID';
      if (totalPayments >= invoice.grossTotalFils) {
        newStatus = 'PAID';
      }

      // Update invoice fields
      const cashApplied = invoice.cashAppliedFils + (method === 'CASH' ? amount : 0);
      const cardApplied = invoice.cardAppliedFils + (method === 'CARD' ? amount : 0);
      const cashTendered = invoice.cashTenderedFils + (method === 'CASH' ? (amountTendered ?? amount) : 0);
      const changeDue = Math.max(0, cashTendered - cashApplied);

      await tx.invoice.update({
        where: { id: invoiceId },
        data: {
          cashAppliedFils: cashApplied,
          cardAppliedFils: cardApplied,
          cashTenderedFils: cashTendered,
          changeDueFils: changeDue,
          paymentStatus: newStatus
        }
      });

      if (invoice.orderId) {
        await tx.order.update({
          where: { id: invoice.orderId },
          data: { paymentStatus: newStatus }
        });
      }

      return { success: true };
    });

    return result;
  } catch (error: any) {
    return { success: false, error: error.message };
  }
}

export async function recordInvoiceRefund(
  invoiceId: string,
  amount: number,
  employeeId: string
): Promise<{ success: boolean; error?: string }> {
  try {
    await requirePermission('manage_orders');

    const result = await prisma.$transaction(async (tx) => {
      const invoice = await tx.invoice.findUnique({
        where: { id: invoiceId }
      });

      if (!invoice) throw new Error('الفاتورة غير موجودة');

      let newStatus = 'PARTIALLY_REFUNDED';
      if (amount >= invoice.grossTotalFils) {
        newStatus = 'REFUNDED';
      }

      await tx.invoice.update({
        where: { id: invoiceId },
        data: { paymentStatus: newStatus }
      });

      if (invoice.orderId) {
        await tx.order.update({
          where: { id: invoice.orderId },
          data: { paymentStatus: newStatus }
        });
      }

      return { success: true };
    });

    return result;
  } catch (error: any) {
    return { success: false, error: error.message };
  }
}
