'use client';

import React, { useTransition } from 'react';

interface Props {
  orderId: string;
  status: string;
  phone: string;
  reference: string;
  shippingCostFils: number;
  updateStatusAction: (orderId: string, status: string, shippingCost: number) => Promise<any>;
}

export function AdminOrderQuickActions({ 
  orderId,
  status,
  phone,
  reference,
  shippingCostFils,
  updateStatusAction
}: Props) {
  const [isPending, startTransition] = useTransition();

  const handleUpdate = (newStatus: string, openWhatsApp: boolean = false) => {
    if (openWhatsApp) {
      const msg = encodeURIComponent(`مرحباً بك في دهب للعطور 🌟.\nتم تأكيد طلبك والبدء بتجهيزه! رقم الطلب: #${reference}\nيمكنك استعراض الفاتورة الرسمية عبر الرابط التالي:\n${window.location.origin}/ar/invoice/${orderId}`);
      const cleanPhone = phone.replace(/\D/g, '');
      window.open(`https://wa.me/${cleanPhone}?text=${msg}`, '_blank');
    }

    startTransition(async () => {
      await updateStatusAction(orderId, newStatus, shippingCostFils);
    });
  };

  return (
    <div className="flex flex-col gap-3">
      {(status === 'PENDING' || status === 'CONFIRMED' || status === 'AWAITING_WHATSAPP') && (
        <>
          <button 
            onClick={() => handleUpdate('PREPARING', true)}
            disabled={isPending}
            className="bg-blue-600 hover:bg-blue-700 disabled:opacity-50 text-white font-bold py-3 px-4 rounded shadow-sm text-sm flex items-center justify-center gap-2 w-full transition-colors"
          >
            بدء التجهيز وتأكيد واتساب
            <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
               <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
            </svg>
          </button>
          <button 
            onClick={() => handleUpdate('CANCELLED', false)}
            disabled={isPending}
            className="bg-red-50 text-red-600 hover:bg-red-100 border border-red-200 disabled:opacity-50 font-bold py-2.5 px-4 rounded shadow-sm text-sm w-full transition-colors"
          >
            إلغاء الطلب (إرجاع للمخزون)
          </button>
        </>
      )}
      {(status === 'PREPARING' || status === 'PREPARED') && (
        <button 
          onClick={() => handleUpdate('SHIPPED', false)}
          disabled={isPending}
          className="bg-orange-500 hover:bg-orange-600 disabled:opacity-50 text-white font-bold py-3 px-4 rounded shadow-sm text-sm w-full transition-colors"
        >
          تسليم لمندوب التوصيل
        </button>
      )}
      {status === 'SHIPPED' && (
        <button 
          onClick={() => handleUpdate('DELIVERED', false)}
          disabled={isPending}
          className="bg-emerald-600 hover:bg-emerald-700 disabled:opacity-50 text-white font-bold py-3 px-4 rounded shadow-sm text-sm w-full transition-colors"
        >
          تم التسليم (طلب مكتمل)
        </button>
      )}
    </div>
  );
}
