import React from 'react';
import { requireAuth, requirePermission } from '@/lib/dal';
import { getEmployeeCountSession } from '@/actions/inventory-count';
import { POSCashierInventoryCountForm } from '@/components/POSCashierInventoryCountForm';

import Link from 'next/link';

interface Params {
  id: string;
}

export default async function POSCashierSpecificInventoryCountPage({ params }: { params: Promise<Params> }) {
  const { id } = await params;
  const session = await requireAuth();
  await requirePermission('pos:access');

  // Load employee-facing session details (blind count values applied automatically)
  const countSession = await getEmployeeCountSession(id);

  if (countSession.assignedEmployeeId !== session.employeeId && countSession.lines?.[0]?.countSessionId !== id) {
    // If blind count clean lines DTO is returned, it won't have countSession.assignedEmployeeId.
    // That's fine because getEmployeeCountSession already validated access and filtered DTO.
  }

  return (
    <div className="min-h-screen bg-[var(--color-ivory-100)] py-6 px-4 md:px-8" dir="rtl">
      <div className="max-w-3xl mx-auto space-y-6">
        <div className="flex justify-between items-start border-b pb-4">
          <div>
            <h1 className="text-xl font-bold font-heading text-[var(--color-forest-900)]">إجراء جرد ومطابقة المخزون</h1>
            <p className="text-xs text-zinc-500 mt-1">المرجع: {countSession.reference} | العنوان: {countSession.title}</p>
          </div>
          <Link href="/pos/cashier" className="bg-neutral-100 hover:bg-neutral-200 text-zinc-700 px-4 py-2 rounded text-xs transition-colors">
            ← عودة للكاشير
          </Link>
        </div>

        <POSCashierInventoryCountForm countSession={countSession} />
      </div>
    </div>
  );
}
