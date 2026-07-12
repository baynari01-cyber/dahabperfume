import React from 'react';
import { requireAuth } from '@/lib/dal';
import { prisma } from '@/lib/db';
import { AdminSidebar } from '@/components/AdminSidebar';
import { confirmStorefrontOrder } from '@/actions/orders';
import Link from 'next/link';
import { notFound } from 'next/navigation';

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
    // Note: in Server Actions under Next.js 16/15, we can return results or redirect
    if (res.success) {
      // Re-fetch/refresh or redirect
    }
  }

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
            <h1 className="text-3xl font-bold font-heading text-[var(--color-forest-900)] mt-2">
              طلب رقم: {order.reference}
            </h1>
          </div>
        </div>

        <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
          {/* Order Details & Items */}
          <div className="lg:col-span-2 space-y-6">
            {/* Customer Info */}
            <div className="bg-white p-6 rounded-lg border border-[var(--color-ivory-200)] shadow-sm">
              <h2 className="text-lg font-bold text-[var(--color-forest-900)] mb-4 border-b pb-2">
                بيانات المستلم والتوصيل
              </h2>
              <div className="grid grid-cols-1 md:grid-cols-2 gap-4 text-sm text-zinc-700">
                <p><strong>اسم العميل:</strong> {order.customerName}</p>
                <p><strong>رقم الهاتف:</strong> {order.customerPhone}</p>
                <p><strong>حالة التوصيل الحالية:</strong> {order.status}</p>
                <p><strong>تاريخ التسجيل:</strong> {new Date(order.createdAt).toLocaleString('ar-JO')}</p>
              </div>
            </div>

            {/* Items Table */}
            <div className="bg-white p-6 rounded-lg border border-[var(--color-ivory-200)] shadow-sm">
              <h2 className="text-lg font-bold text-[var(--color-forest-900)] mb-4 border-b pb-2">
                العطور والمنتجات المطلوبة
              </h2>
              <div className="divide-y divide-zinc-100">
                {order.items.map((item) => {
                  const dbProduct = item.product;
                  const dbVariant = dbProduct?.variants.find(v => v.id === item.variantId);
                  const currentStock = dbVariant?.stock ?? 0;
                  const isUnverified = dbProduct?.stockStatus === 'UNVERIFIED';

                  return (
                    <div key={item.id} className="py-4 flex justify-between items-center text-sm">
                      <div>
                        <h4 className="font-bold text-zinc-900">{item.name}</h4>
                        <p className="text-xs text-zinc-500 mt-1">
                          الحجم: {item.size} | SKU: {item.sku}
                        </p>
                        <div className="mt-2 flex items-center gap-3">
                          {isUnverified ? (
                            <span className="bg-amber-100 text-amber-800 px-2 py-0.5 rounded text-[10px] font-bold">
                              بانتظار التحقق من المخزن (UNVERIFIED)
                            </span>
                          ) : (
                            <span className="bg-green-100 text-green-800 px-2 py-0.5 rounded text-[10px] font-bold">
                              مخزون مسجل: {currentStock}
                            </span>
                          )}
                        </div>
                      </div>
                      
                      <div className="text-left font-bold text-zinc-700">
                        <span>{item.quantity} × {(item.unitPrice / 100).toFixed(2)} د.أ</span>
                        <span className="block text-zinc-900 mt-1">
                          {((item.unitPrice * item.quantity) / 100).toFixed(2)} د.أ
                        </span>
                      </div>
                    </div>
                  );
                })}
              </div>
              
              {/* Financial summary */}
              <div className="border-t border-zinc-200 mt-6 pt-4 space-y-2 text-sm text-zinc-700">
                <div className="flex justify-between">
                  <span>رسوم التوصيل:</span>
                  <span>{(order.shippingCost / 100).toFixed(2)} د.أ</span>
                </div>
                <div className="flex justify-between text-lg font-bold text-[var(--color-forest-900)] pt-2 border-t">
                  <span>الإجمالي الكلي:</span>
                  <span>{(order.totalAmount / 100).toFixed(2)} د.أ</span>
                </div>
              </div>
            </div>
          </div>

          {/* Action sidebar */}
          <div className="space-y-6">
            <div className="bg-white p-6 rounded-lg border border-[var(--color-ivory-200)] shadow-sm">
              <h3 className="text-lg font-bold text-[var(--color-forest-900)] mb-4 border-b pb-2">
                تأكيد ومعالجة الطلب
              </h3>
              
              {order.status === 'CONFIRMED' ? (
                <div className="p-4 bg-green-50 text-green-800 rounded font-bold text-center text-sm border border-green-200">
                  تم تأكيد هذا الطلب مسبقاً بنجاح ومزامنة المخازن.
                </div>
              ) : (
                <div className="space-y-4">
                  <p className="text-xs text-zinc-500 leading-relaxed">
                    عند تأكيد الطلب، سيقوم النظام بالخصم التلقائي والآمن لكميات المواد الخام والمنتجات الجاهزة من المخازن بموثوقية كاملة.
                  </p>
                  
                  <form action={handleConfirm}>
                    <button
                      type="submit"
                      className="w-full bg-[var(--color-forest-900)] hover:bg-[var(--color-forest-800)] text-white py-3 rounded font-bold transition-colors text-sm"
                    >
                      تأكيد الطلب وخصم المخزون
                    </button>
                  </form>
                </div>
              )}
            </div>
          </div>
        </div>
      </main>
    </div>
  );
}
