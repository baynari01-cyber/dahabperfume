'use server';

import { prisma } from '@/lib/db';
import { z } from 'zod';
import crypto from 'crypto';

const checkoutSchema = z.object({
  customerName: z.string().min(2),
  customerPhone: z.string().min(8),
  items: z.string() // JSON string of [{ productId, variantId, quantity }]
});

export async function processCheckout(prevState: any, formData: FormData) {
  const parsed = checkoutSchema.safeParse(Object.fromEntries(formData));
  
  if (!parsed.success) {
    return { error: 'يرجى التحقق من المدخلات' };
  }

  const { customerName, customerPhone, items: itemsJson } = parsed.data;
  
  let parsedItems;
  try {
    parsedItems = JSON.parse(itemsJson);
    if (!Array.isArray(parsedItems) || parsedItems.length === 0) {
      throw new Error();
    }
  } catch (e) {
    return { error: 'السلة فارغة أو غير صالحة' };
  }

  // 1. Reload prices from PostgreSQL
  let totalAmount = 0;
  const orderItemsData = [];
  
  for (const item of parsedItems) {
    const { productId, variantId, quantity } = item;
    
    if (quantity <= 0) continue;

    const variant = await prisma.productVariant.findUnique({
      where: { id: variantId },
      include: { product: true }
    });

    if (!variant || variant.productId !== productId || !variant.isActive) {
      return { error: 'أحد المنتجات غير متوفر' };
    }

    const unitPrice = variant.price;
    const total = unitPrice * quantity;
    totalAmount += total;

    orderItemsData.push({
      productId: variant.productId,
      variantId: variant.id,
      sku: variant.sku,
      name: variant.product.nameAr,
      size: variant.size,
      quantity,
      unitPrice,
      total
    });
  }

  // Calculate Shipping (Flat 3 JOD for example, or free if > 50 JOD)
  // Let's check GlobalPricingSettings
  const shippingCost = totalAmount > 5000 ? 0 : 300; // 50.00 JOD
  const grandTotal = totalAmount + shippingCost;

  // 2. Create AWAITING_WHATSAPP order inside a transaction
  const reference = `ORD-${crypto.randomBytes(4).toString('hex').toUpperCase()}`;

  const order = await prisma.$transaction(async (tx) => {
    const newOrder = await tx.order.create({
      data: {
        reference,
        customerName,
        customerPhone,
        status: 'AWAITING_WHATSAPP',
        totalAmount: grandTotal,
        shippingCost,
        items: {
          create: orderItemsData
        },
        statusHistory: {
          create: {
            status: 'AWAITING_WHATSAPP',
            notes: 'Order initiated via Web Checkout'
          }
        }
      }
    });
    return newOrder;
  });

  // 3. Generate secure WhatsApp message
  let message = `مرحباً دهب للعطور،\nأود تأكيد طلبي الجديد رقم: ${reference}\n\n`;
  message += `الاسم: ${customerName}\n`;
  message += `رقم الهاتف: ${customerPhone}\n\n`;
  message += `تفاصيل الطلب:\n`;
  
  for (const item of orderItemsData) {
    message += `- ${item.name} (${item.size}) x${item.quantity} = ${(item.total / 100).toFixed(2)} د.أ\n`;
  }
  
  message += `\nرسوم التوصيل: ${(shippingCost / 100).toFixed(2)} د.أ\n`;
  message += `الإجمالي: ${(grandTotal / 100).toFixed(2)} د.أ\n\n`;
  message += `شكراً لكم.`;

  const encodedMessage = encodeURIComponent(message);
  const whatsappUrl = `https://wa.me/962777778886?text=${encodedMessage}`;

  return {
    success: true,
    reference,
    whatsappUrl
  };
}
