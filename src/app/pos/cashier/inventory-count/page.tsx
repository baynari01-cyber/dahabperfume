import React from 'react';
import { requireAuth } from '@/lib/dal';
import { prisma } from '@/lib/db';
import { getEmployeeCountSession } from '@/actions/inventory-count';
import { POSCashierInventoryCountForm } from '@/components/POSCashierInventoryCountForm';

export default async function POSCashierInventoryCountPage() {
  const session = await requireAuth();
  const employeeId = session.employeeId;

  // Find the active count session assigned to this cashier
  const activeSession = await prisma.inventoryCountSession.findFirst({
    where: {
      assignedEmployeeId: employeeId,
      status: { in: ['ASSIGNED', 'IN_PROGRESS', 'DRAFT'] }
    },
    orderBy: { createdAt: 'desc' }
  });

  if (!activeSession) {
    return (
      <div className="min-h-screen bg-[var(--color-ivory-100)] flex items-center justify-center p-6" dir="rtl">
        <div className="bg-white p-8 rounded-xl border border-[var(--color-ivory-200)] shadow-md max-w-md w-full text-center space-y-4">
          <div className="w-16 h-16 bg-neutral-100 rounded-full flex items-center justify-center mx-auto text-neutral-450">
            ✓
          </div>
          <h1 className="text-xl font-bold font-heading text-[var(--color-forest-900)]">لا توجد عمليات جرد معلقة</h1>
          <p className="text-xs text-zinc-500">لا يوجد تكليف جرد نشط مسند لحسابك في الوقت الحالي. سيظهر أي تكليف جديد هنا فور إنشائه من لوحة الإدارة.</p>
        </div>
      </div>
    );
  }

  // Load employee-facing session details (blind count values applied automatically)
  const countSession = await getEmployeeCountSession(activeSession.id);

  return (
    <div className="min-h-screen bg-[var(--color-ivory-100)] py-6 px-4 md:px-8">
      <div className="max-w-3xl mx-auto space-y-6">
        <div>
          <h1 className="text-xl font-bold font-heading text-[var(--color-forest-900)]">إجراء جرد ومطابقة المخزون</h1>
          <p className="text-xs text-zinc-500 mt-1">المرجع: {countSession.reference} | العنوان: {countSession.title}</p>
        </div>

        <POSCashierInventoryCountForm countSession={countSession} />
      </div>
    </div>
  );
}
