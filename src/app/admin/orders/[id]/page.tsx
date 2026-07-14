import React from 'react';
import { requireAuth } from '@/lib/dal';
import { filsToDisplay } from '@/lib/money';
import { prisma } from '@/lib/db';
import { AdminSidebar } from '@/components/AdminSidebar';
import { updateOrderStatus, confirmStorefrontOrder } from '@/actions/orders';
import Link from 'next/link';
import { notFound, redirect } from 'next/navigation';
import { OrderWhatsAppButton } from '@/components/OrderWhatsAppButton';

export default async function AdminOrderDetailPage({
  params
}: {
  params: Promise<{ id: string }>
}) {
  const session = await requireAuth();
  const { id } = await params;

  const order = await prisma.order.findUnique({
    where: { id },
    include: {
      items: {
        include: {
          product: {
            include: {
              variants: true
            }
          }
        }
      },
      statusHistory: {
        orderBy: { createdAt: 'desc' }
      }
    }
  });

  if (!order) {
    notFound();
  }

  // Handle action trigger in Page via form action
  async function handleConfirm(formData: FormData) {
    'use server';
    const res = await confirmStorefrontOrder(id);
    if (res.success) {
       // redirect or just refresh
    } else {
       console.error("Error confirming order:", res.error);
    }
  }

  async function handleUpdateStatus(formData: FormData) {
    'use server';
    const newStatus = formData.get('status') as string;
    const shippingCostJD = parseFloat(formData.get('shippingCost') as string);
    const shippingCost = Math.round((shippingCostJD || 0) * 1000); // convert JD to fils

    const res = await updateOrderStatus(id, newStatus, shippingCost);
    if (res.success) {
      redirect(`/admin/orders/${id}`);
    } else {
      console.error("Error updating status:", res.error);
    }
  }

  const orderSubtotal = order.totalAmount - order.shippingCost;

  return (
    <div className="flex h-screen bg-[var(--color-ivory-100)]" dir="rtl">
      <AdminSidebar employeeName={session.employee.name} />

      <main className="flex-1 overflow-y-auto p-8 font-sans">
        <div className="flex justify-between items-center mb-8 border-b border-[var(--color-ivory-200)] pb-4">
          <div>
            <div className="flex items-center gap-3">
              <Link href="/admin/orders" className="text-sm text-zinc-500 hover:underline">
                العودة للطلبات
              </Link>
              <span className="text-zinc-300">/</span>
              <span className="text-sm font-bold text-zinc-700">تفاصيل الطلب</span>
            </div>
            <h1 className="text-3xl font-bold font-heading text-[var(--color-charcoal-900)] mt-2">
              طلب رقم: {order.reference}
            </h1>
          </div>
        </div>

        <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
          {/* Order Details & Items */}
          <div className="lg:col-span-2 space-y-6">
            {/* Customer Info */}
            <div className="bg-white p-6 rounded-lg border border-[var(--color-ivory-200)] shadow-sm">
              <h2 className="text-lg font-bold text-[var(--color-charcoal-900)] mb-4 border-b pb-2">
                بيانات المستلم والتوصيل
              </h2>
              <div className="grid grid-cols-1 md:grid-cols-2 gap-4 text-sm text-zinc-700">
                <p><strong>اسم العميل:</strong> {order.customerName}</p>
                <p><strong>رقم الهاتف:</strong> <span dir="ltr">{order.customerPhone}</span></p>
                <p><strong>حالة الطلب:</strong> <span className="font-bold">{order.status}</span></p>
                <p><strong>تاريخ التسجيل:</strong> {new Date(order.createdAt).toLocaleString('ar-JO')}</p>
              </div>
            </div>

            {/* Items Table */}
            <div className="bg-white p-6 rounded-lg border border-[var(--color-ivory-200)] shadow-sm">
              <h2 className="text-lg font-bold text-[var(--color-charcoal-900)] mb-4 border-b pb-2">
                العطور والمنتجات المطلوبة
              </h2>
              <div className="divide-y divide-zinc-100">
                {order.items.map((item) => {
                  const dbProduct = item.product;
                  const currentStock = dbProduct?.stockLiters ?? 0;

                  return (
                    <div key={item.id} className="py-4 flex justify-between items-center text-sm">
                      <div>
                        <h4 className="font-bold text-zinc-900">{item.name}</h4>
                        <p className="text-xs text-zinc-500 mt-1">
                          الحجم: {item.size} | SKU: {item.sku}
                        </p>
                        <p className="text-xs text-blue-600 mt-1">
                          مخزون المنتج الحالي: {currentStock.toFixed(3)} لتر
                        </p>
                      </div>
                      <div className="text-left">
                        <p className="font-bold text-emerald-600">{filsToDisplay(item.total, 'ar')}</p>
                        <p className="text-xs text-zinc-500 mt-1">{item.quantity} × {filsToDisplay(item.unitPrice, 'ar')}</p>
                      </div>
                    </div>
                  );
                })}
              </div>
              <div className="mt-6 border-t pt-4 space-y-2 text-sm">
                <div className="flex justify-between text-zinc-600">
                  <span>المجموع الفرعي (بدون توصيل):</span>
                  <span>{filsToDisplay(orderSubtotal, 'ar')}</span>
                </div>
                <div className="flex justify-between text-zinc-600">
                  <span>رسوم التوصيل:</span>
                  <span>{filsToDisplay(order.shippingCost, 'ar')}</span>
                </div>
                <div className="flex justify-between text-lg font-bold text-[var(--color-charcoal-900)] pt-2 border-t mt-2">
                  <span>المجموع الإجمالي المطلوب:</span>
                  <span>{filsToDisplay(order.totalAmount, 'ar')}</span>
                </div>
              </div>
            </div>
            
            {/* History */}
            <div className="bg-white p-6 rounded-lg border border-[var(--color-ivory-200)] shadow-sm">
              <h2 className="text-lg font-bold text-[var(--color-charcoal-900)] mb-4 border-b pb-2">
                سجل حالات الطلب
              </h2>
              <div className="space-y-4">
                 {order.statusHistory.map(hist => (
                    <div key={hist.id} className="border-r-2 border-[var(--color-champagne-400)] pr-4 text-sm">
                       <p className="font-bold text-zinc-800">{hist.status}</p>
                       <p className="text-xs text-zinc-500">{new Date(hist.createdAt).toLocaleString('ar-JO')}</p>
                       {hist.notes && <p className="text-xs text-zinc-600 mt-1 bg-zinc-50 p-2 rounded">{hist.notes}</p>}
                    </div>
                 ))}
                 {order.statusHistory.length === 0 && <p className="text-sm text-zinc-500">لا يوجد سجل حالات.</p>}
              </div>
            </div>
          </div>

          {/* Actions & Status Management */}
          <div className="space-y-6">
            <div className="bg-white p-6 rounded-lg border border-[var(--color-ivory-200)] shadow-sm sticky top-6">
              <h3 className="text-lg font-bold text-[var(--color-charcoal-900)] mb-4 border-b pb-2">
                إدارة الطلب
              </h3>

              {order.status === 'AWAITING_WHATSAPP' || order.status === 'PENDING' ? (
                <div className="space-y-4 mb-6 pb-6 border-b border-zinc-100">
                  <p className="text-sm text-zinc-600">الطلب جديد بانتظار التأكيد. الضغط على تأكيد سيقوم بتسجيل المبيعات وخصم مخزون اللترات فوراً.</p>
                  <form action={handleConfirm}>
                    <button type="submit" className="w-full bg-[var(--color-charcoal-900)] text-white font-bold py-3 rounded hover:bg-[var(--color-charcoal-800)] transition-colors">
                      تأكيد الطلب وخصم المخزون
                    </button>
                  </form>
                </div>
              ) : null}

              <form action={handleUpdateStatus} className="space-y-4">
                <div>
                  <label className="block text-sm font-bold text-zinc-700 mb-1">تحديث الحالة</label>
                  <select name="status" defaultValue={order.status} className="w-full border rounded p-2 text-sm outline-none focus:border-[var(--color-champagne-600)]">
                    <option value="AWAITING_WHATSAPP">بانتظار التأكيد (AWAITING_WHATSAPP)</option>
                    <option value="PENDING">معلق (PENDING)</option>
                    <option value="CONFIRMED">تم التأكيد (CONFIRMED)</option>
                    <option value="PREPARING">قيد التجهيز (PREPARING)</option>
                    <option value="PREPARED">تم التجهيز / جاهز للتوصيل (PREPARED)</option>
                    <option value="SHIPPED">قيد التوصيل (SHIPPED)</option>
                    <option value="DELIVERED">تم التوصيل / مكتمل (DELIVERED)</option>
                    <option value="CANCELLED">ملغي (CANCELLED)</option>
                  </select>
                </div>

                <div>
                  <label className="block text-sm font-bold text-zinc-700 mb-1">رسوم التوصيل (دينار أردني)</label>
                  <input 
                    type="number" 
                    step="0.01" 
                    name="shippingCost" 
                    defaultValue={(order.shippingCost / 1000).toFixed(3)}
                    className="w-full border rounded p-2 text-sm outline-none focus:border-[var(--color-champagne-600)]"
                  />
                  <p className="text-[10px] text-zinc-500 mt-1">عند تعديل رسوم التوصيل، سيتم إعادة احتساب الإجمالي النهائي للطلب تلقائياً.</p>
                </div>

                <button type="submit" className="w-full flex items-center justify-center gap-2 bg-gradient-to-r from-[var(--color-champagne-500)] to-[var(--color-champagne-600)] hover:from-[var(--color-champagne-600)] hover:to-[var(--color-champagne-700)] text-white font-bold py-3 rounded-lg shadow-md transition-all active:scale-95 text-sm">
                  <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M5 13l4 4L19 7" />
                  </svg>
                  حفظ وتحديث تفاصيل الحالة
                </button>
              </form>

              {order.status === 'CONFIRMED' && (
                <OrderWhatsAppButton 
                  phone={order.customerPhone} 
                  reference={order.reference} 
                  orderId={order.id} 
                />
              )}
            </div>
          </div>
        </div>
      </main>
    </div>
  );
}
