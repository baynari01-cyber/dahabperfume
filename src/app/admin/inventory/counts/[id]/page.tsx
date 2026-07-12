import React from 'react';
import Link from 'next/link';
import { requireAuth, requirePermission } from '@/lib/dal';
import { AdminSidebar } from '@/components/AdminSidebar';
import { prisma } from '@/lib/db';
import { approveCountSession } from '@/actions/inventory-count';
import { redirect } from 'next/navigation';

interface Params {
  id: string;
}

export default async function AdminCountSessionDetailPage({ params }: { params: Promise<Params> }) {
  const { id } = await params;
  const session = await requireAuth();
  await requirePermission('inventory.counts.review');

  const countSession = await prisma.inventoryCountSession.findUnique({
    where: { id },
    include: {
      assignedEmployee: true,
      lines: {
        include: {
          product: true
        }
      }
    }
  });

  if (!countSession) {
    return (
      <div className="min-h-screen bg-[var(--color-ivory-100)] flex items-center justify-center p-6" dir="rtl">
        <div className="bg-white p-8 rounded-xl border shadow text-center space-y-4">
          <h1 className="text-xl font-bold text-red-650">طلب الجرد غير موجود</h1>
          <Link href="/admin/inventory/counts" className="inline-block bg-[var(--color-forest-800)] text-white px-4 py-2 rounded text-xs">العودة لجلسات الجرد</Link>
        </div>
      </div>
    );
  }

  const isAssignedToSelf = countSession.assignedEmployeeId === session.employeeId;

  async function handleApproveAction(formData: FormData) {
    'use server';
    const managerNotes = formData.get('managerNotes') as string;
    try {
      await approveCountSession(id, managerNotes);
      redirect('/admin/inventory/counts');
    } catch (e: any) {
      // Redirect or reload with error
      redirect(`/admin/inventory/counts/${id}?error=${encodeURIComponent(e.message)}`);
    }
  }

  return (
    <div className="flex min-h-screen bg-[var(--color-ivory-100)] text-zinc-800" dir="rtl">
      <AdminSidebar employeeName={session.employee.name} />

      <main className="flex-grow p-6 md:p-12 w-full max-w-6xl mx-auto space-y-6">
        <div className="flex justify-between items-start border-b pb-4">
          <div>
            <h1 className="text-2xl font-bold font-heading text-[var(--color-forest-900)]">تفاصيل جلسة الجرد والمطابقة</h1>
            <p className="text-xs text-zinc-500 mt-1">المرجع: {countSession.reference} | الحالة: {countSession.status}</p>
          </div>
          <Link href="/admin/inventory/counts" className="bg-neutral-100 hover:bg-neutral-200 text-zinc-700 px-4 py-2 rounded text-xs transition-colors">
            ← عودة
          </Link>
        </div>

        {/* Informative banners */}
        {countSession.status === 'RECOUNT_REQUIRED' && (
          <div className="bg-amber-50 border border-amber-250 p-4 rounded text-xs text-amber-900 leading-relaxed">
            ⚠️ <strong>تنبيه الوردية المتداخلة:</strong> تم إيقاف اعتماد هذا الجرد بسبب حركات مبيعات أو تعديلات مخزنية طارئة حدثت بالتوازي. يرجى التكليف بـ <strong>إعادة جرد</strong> البنود المتأثرة.
          </div>
        )}

        {isAssignedToSelf && countSession.status === 'SUBMITTED' && (
          <div className="bg-red-50 border border-red-250 p-4 rounded text-xs text-red-950">
            ⚠️ <strong>منع الموافقة الذاتية:</strong> لقد قمت بإحصاء هذا الجرد بنفسك. تنفيذاً لسياسات الرقابة الثنائية وسجل الصلاحيات، يجب على مدير أو مشرف آخر مراجعة واعتماد هذا الجرد.
          </div>
        )}

        {/* Lines details table */}
        <div className="bg-white rounded-lg border border-[var(--color-ivory-200)] shadow-sm overflow-hidden">
          <div className="px-6 py-4 border-b bg-zinc-50/50">
            <h2 className="text-sm font-bold text-[var(--color-forest-800)]">قائمة بنود الجرد ومقارنة الفروقات</h2>
          </div>

          <table className="w-full text-right border-collapse text-xs">
            <thead>
              <tr className="bg-zinc-50 text-zinc-500 font-bold border-b">
                <th className="p-4">المنتج</th>
                <th className="p-4">SKU</th>
                <th className="p-4">النمط</th>
                <th className="p-4">الكمية المتوقعة</th>
                <th className="p-4">الكمية الفعلية</th>
                <th className="p-4">الفارق (Variance)</th>
                <th className="p-4">الحالة</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-zinc-150">
              {countSession.lines.map(line => {
                const isLiquid = line.inventoryMode === 'DIRECT_LIQUID';
                const expected = isLiquid ? `${line.expectedQuantityMlSnapshot} مل` : `${line.expectedUnitsSnapshot} علب`;
                const counted = isLiquid ? `${line.countedQuantityMl} مل` : `${line.countedUnits} علب`;
                
                const variance = isLiquid ? line.varianceMl : (line.varianceUnits ?? 0);
                const varianceText = variance > 0 ? `+${variance}` : `${variance}`;
                const varianceColor = variance === 0 ? 'text-zinc-500' : variance > 0 ? 'text-green-700 font-bold' : 'text-red-750 font-bold';

                return (
                  <tr key={line.id} className="hover:bg-zinc-50/30">
                    <td className="p-4 font-medium">{line.product.nameAr}</td>
                    <td className="p-4 font-mono">{line.product.sku}</td>
                    <td className="p-4 text-zinc-550">{isLiquid ? 'صب/سائل' : 'منتج مغلق'}</td>
                    <td className="p-4 text-zinc-500 font-bold">{expected}</td>
                    <td className="p-4 text-zinc-900 font-bold">{counted}</td>
                    <td className={`p-4 ${varianceColor}`}>{varianceText}</td>
                    <td className="p-4">
                      <span className={`px-2 py-0.5 rounded text-[10px] font-bold ${
                        line.countStatus === 'STALE' ? 'bg-red-100 text-red-800' :
                        line.countStatus === 'COUNTED' ? 'bg-blue-100 text-blue-800' : 'bg-amber-100 text-amber-800'
                      }`}>
                        {line.countStatus}
                      </span>
                    </td>
                  </tr>
                );
              })}
            </tbody>
          </table>
        </div>

        {/* Form to approve count session */}
        {countSession.status === 'SUBMITTED' && (
          <div className="bg-white p-6 rounded-lg border border-[var(--color-ivory-200)] shadow-sm space-y-4">
            <h2 className="text-sm font-bold text-[var(--color-forest-800)] border-b pb-2">اتخاذ قرار الاعتماد والمطابقة</h2>
            
            <form action={handleApproveAction} className="space-y-4">
              <div className="space-y-2">
                <label className="text-xs font-bold text-zinc-650">ملاحظات مراجعة المدير</label>
                <textarea 
                  name="managerNotes" 
                  rows={3}
                  placeholder="ملاحظات الاعتماد وتوجيهات فروقات المطابقة..."
                  className="w-full border border-zinc-300 rounded p-2 text-xs outline-none focus:ring-1 focus:ring-[var(--color-champagne-600)]"
                />
              </div>

              <div className="flex gap-4">
                <button
                  type="submit"
                  disabled={isAssignedToSelf}
                  className="bg-green-600 hover:bg-green-700 text-white font-bold px-6 py-2.5 rounded text-xs transition-colors shadow disabled:opacity-40"
                >
                  تأكيد مطابقة المخازن وتعديل الأرصدة
                </button>
                <Link
                  href="/admin/inventory/counts"
                  className="bg-neutral-100 hover:bg-neutral-200 text-zinc-700 font-bold px-6 py-2.5 rounded text-xs transition-colors text-center"
                >
                  إلغاء
                </Link>
              </div>
            </form>
          </div>
        )}
      </main>
    </div>
  );
}
