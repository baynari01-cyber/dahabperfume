import React from 'react';
import Link from 'next/link';
import { requireAuth } from '@/lib/dal';
import { AdminSidebar } from '@/components/AdminSidebar';
import { prisma } from '@/lib/db';
import { createCountSession, approveCountSession } from '@/actions/inventory-count';
import { revalidatePath } from 'next/cache';

export default async function AdminInventoryCountsPage() {
  const session = await requireAuth();

  // Load count sessions
  const countSessions = await prisma.inventoryCountSession.findMany({
    include: {
      assignedEmployee: true,
      lines: true
    },
    orderBy: { createdAt: 'desc' }
  });

  // Load employees for assignment
  const employees = await prisma.employee.findMany({
    where: { isActive: true },
    orderBy: { name: 'asc' }
  });

  async function handleCreateSession(formData: FormData) {
    'use server';
    const title = formData.get('title') as string;
    const assignedEmployeeId = formData.get('assignedEmployeeId') as string;
    const scopeType = formData.get('scopeType') as 'ALL' | 'LIQUID' | 'CATEGORY' | 'SPECIFIC';
    const notes = formData.get('notes') as string;

    if (!title || !assignedEmployeeId) return;

    await createCountSession({
      title,
      assignedEmployeeId,
      scopeType,
      notes
    });

    revalidatePath('/admin/inventory/counts');
  }

  async function handleApprove(formData: FormData) {
    'use server';
    const sessionId = formData.get('sessionId') as string;
    const managerNotes = formData.get('managerNotes') as string;

    if (!sessionId) return;

    try {
      await approveCountSession(sessionId, managerNotes);
    } catch (e: any) {
      // Typically we'd handle error display, for this admin action we reload
    }
    revalidatePath('/admin/inventory/counts');
  }

  return (
    <div className="flex min-h-screen bg-[var(--color-ivory-100)] text-zinc-800" dir="rtl">
      <AdminSidebar employeeName={session.employee.name} />
      
      <main className="flex-1 p-6 md:p-12 w-full max-w-6xl mx-auto space-y-8 font-sans">
        {/* 1. Create Session Link Button */}
        <div className="flex justify-between items-center">
          <div>
            <h1 className="text-2xl font-bold font-heading text-[var(--color-forest-900)]">إدارة جرد ومطابقة المخزون</h1>
            <p className="text-xs text-zinc-500 mt-1">إنشاء طلبات الجرد، ومراجعة الفروقات واعتماد تسويات الكميات.</p>
          </div>
          <Link
            href="/admin/inventory/counts/new"
            className="bg-[var(--color-forest-800)] hover:bg-[var(--color-forest-900)] text-white font-bold px-4 py-2 rounded text-xs transition-colors shadow-sm"
          >
            + تكليف جرد جديد
          </Link>
        </div>

        {/* 2. Count Sessions List */}
        <div className="bg-white rounded-lg border border-[var(--color-ivory-200)] shadow-sm overflow-hidden">
          <div className="px-6 py-4 border-b border-[var(--color-ivory-100)] flex justify-between items-center bg-zinc-50/50">
            <h2 className="text-sm font-bold text-[var(--color-forest-800)]">طلبات وجلسات الجرد الحالية</h2>
          </div>

          <div className="overflow-x-auto">
            <table className="w-full text-right border-collapse text-xs">
              <thead>
                <tr className="bg-zinc-50 text-zinc-500 font-bold border-b border-zinc-100">
                  <th className="p-4">المرجع</th>
                  <th className="p-4">العنوان</th>
                  <th className="p-4">المسؤول</th>
                  <th className="p-4">الحالة</th>
                  <th className="p-4">عدد البنود</th>
                  <th className="p-4">التاريخ</th>
                  <th className="p-4 text-left">الإجراءات</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-zinc-100">
                {countSessions.map(session => (
                  <tr key={session.id} className="hover:bg-zinc-50/50">
                    <td className="p-4 font-mono font-bold text-zinc-950">
                      <a href={`/admin/inventory/counts/${session.id}`} className="hover:underline text-[var(--color-champagne-600)]">
                        {session.reference}
                      </a>
                    </td>
                    <td className="p-4 font-medium">
                      <a href={`/admin/inventory/counts/${session.id}`} className="hover:underline">
                        {session.title}
                      </a>
                    </td>
                    <td className="p-4">{session.assignedEmployee.name}</td>
                    <td className="p-4">
                      <span className={`px-2 py-0.5 rounded text-[10px] font-bold ${
                        session.status === 'APPROVED' ? 'bg-green-100 text-green-800' :
                        session.status === 'RECOUNT_REQUIRED' ? 'bg-red-100 text-red-800' :
                        session.status === 'SUBMITTED' ? 'bg-blue-100 text-blue-800' : 'bg-amber-100 text-amber-800'
                      }`}>
                        {session.status}
                      </span>
                    </td>
                    <td className="p-4">{session.lines.length}</td>
                    <td className="p-4 text-zinc-400">{new Date(session.createdAt).toLocaleDateString('ar-JO')}</td>
                    <td className="p-4 text-left">
                      <a
                        href={`/admin/inventory/counts/${session.id}`}
                        className="bg-neutral-100 hover:bg-neutral-250 text-zinc-700 font-bold px-3 py-1 rounded text-[10px] transition-colors"
                      >
                        عرض التفاصيل والمطابقة
                      </a>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>
      </main>
    </div>
  );
}
