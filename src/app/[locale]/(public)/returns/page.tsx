import React from 'react';
import { getCMSContent } from '@/lib/cms';

export default async function ReturnsPage({ params }: { params: Promise<{ locale: string }> }) {
  const resolvedParams = await params;
  const locale = resolvedParams.locale;
  const isAr = locale === 'ar';

  const defaultReturns = {
    titleAr: 'سياسة الإرجاع والاستبدال',
    titleEn: 'Returns & Exchange Policy',
    contentAr: `يسعدنا تقديم خدمة مريحة لاستبدال أو إرجاع مشترياتكم وفق الشروط التالية:

1. **المنتجات الجاهزة (Finished Products):**
   - يمكن إرجاع المنتج أو استبداله خلال 3 أيام من تاريخ الاستلام.
   - يجب أن يكون المنتج في حالته الأصلية، غير مستخدم، وبغلافه الأصلي غير المفتوح.

2. **المنتجات المصنعة حسب الطلب / التركيبات الخاصة (Formula-based Products):**
   - العطور المصنعة خصيصاً بالطلب تعامل معاملة المنتجات الخاصة ولا نقوم بإرجاعها أو فك تركيبتها إلا في حال وجود خطأ مصنعي واضح في التصنيع أو التعبئة.

3. **آلية معالجة الطلبات:**
   - يرجى التواصل معنا عبر واتساب لترتيب عملية الإرجاع أو الاستبدال.
   - سيتم تطبيق رسوم شحن إضافية لخدمة النقل ما لم يكن السبب خطأ مصنعياً.`,
    contentEn: `We are pleased to provide a flexible return/exchange service under the following conditions:

1. **Finished Products:**
   - Returns and exchanges are accepted within 3 days of delivery.
   - Products must be unused, in their original packaging, and with the plastic wrap intact.

2. **Formula-Based Blends:**
   - Customized fragrances created by formula are treated as custom orders and cannot be returned or refunded unless there is a clear manufacturing defect.

3. **Return Process:**
   - Please contact us via WhatsApp to arrange returns and exchanges.
   - Standard shipping fees will apply unless the return is due to a factory defect.`
  };

  const cms = await getCMSContent('returns_policy', defaultReturns);

  return (
    <div className="container mx-auto px-6 py-16">
      <div className="max-w-3xl mx-auto bg-white border border-[var(--color-ivory-200)] rounded-lg p-10 shadow-sm">
        <h1 className="text-4xl font-bold font-heading text-[var(--color-charcoal-900)] mb-8 border-b pb-4">
          {isAr ? cms.titleAr : cms.titleEn}
        </h1>
        <div className="text-zinc-700 leading-relaxed whitespace-pre-line text-sm md:text-base">
          {isAr ? cms.contentAr : cms.contentEn}
        </div>
      </div>
    </div>
  );
}
