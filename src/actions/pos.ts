'use server';

import { prisma } from '@/lib/db';
import { requirePermission } from '@/lib/dal';
import crypto from 'crypto';

export async function processPOSCheckout(data: any): Promise<
  | { success: true; saleId: string; reference: string; total: number; error?: never }
  | { success: false; error: string; saleId?: never; reference?: never; total?: never }
> {
  const session = await requirePermission('pos:access');
  const employeeId = session.employeeId;

  const { items, customerName, paymentMethod, amountTendered } = data;

  if (!items || items.length === 0) {
    return { success: false, error: 'السلة فارغة' };
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
            const requiredQty = formulaItem.quantity * quantity;

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
                notes: `POS Sale Formula consumption`
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
          if (variant.stock < quantity) {
            throw new Error(`مخزون غير كافٍ للمنتج (SKU: ${variant.sku}). المتاح أقل من الكمية المطلوبة.`);
          }

          // Decrement variant stock
          await tx.productVariant.update({
            where: { id: variant.id },
            data: { stock: { decrement: quantity } }
          });
        }

        // Log final product inventory movement
        await tx.inventoryMovement.create({
          data: {
            sku: variant.sku,
            type: 'SALE',
            quantity: -quantity,
            employeeId,
            reference: 'POS_SALE'
          }
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

      // Update Consumption records to link to Sale ID
      await tx.consumptionRecord.updateMany({
        where: { saleId: null },
        data: { saleId: sale.id }
      });

      return { success: true as const, saleId: sale.id, reference: sale.reference, total: grandTotal };
    });

    return saleResult;

  } catch (error: any) {
    return { success: false, error: error.message || 'حدث خطأ غير معروف' };
  }
}
