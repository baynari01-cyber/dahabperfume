'use server';

import { prisma } from '@/lib/db';
import { requirePermission } from '@/lib/dal';

export async function confirmStorefrontOrder(orderId: string) {
  // 1. Require authorized permission
  const session = await requirePermission('pos:access');
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

      // 4. Update order status to CONFIRMED
      const updatedOrder = await tx.order.update({
        where: { id: orderId },
        data: { status: 'CONFIRMED' }
      });

      // 5. Write order status history
      await tx.orderStatusHistory.create({
        data: {
          orderId: order.id,
          status: 'CONFIRMED',
          notes: `Order confirmed by employee: ${employeeId}`
        }
      });

      // 6. Write audit logs
      await tx.auditLog.create({
        data: {
          employeeId,
          action: 'ORDER_CONFIRMED',
          entityType: 'Order',
          entityId: order.id,
          details: JSON.stringify({ reference: order.reference, total: order.totalAmount })
        }
      });

      return updatedOrder;
    });

    return { success: true, order: result };
  } catch (error: any) {
    return { error: error.message || 'حدث خطأ غير معروف' };
  }
}
