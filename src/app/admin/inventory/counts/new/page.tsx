import React from 'react';
import Link from 'next/link';
import { requireAuth, requirePermission } from '@/lib/dal';
import { AdminSidebar } from '@/components/AdminSidebar';
import { prisma } from '@/lib/db';
import { createCountSession } from '@/actions/inventory-count';
import { redirect } from 'next/navigation';

export default async function AdminNewCountSessionPage() {
  const session = await requireAuth();
  await requirePermission('inventory.counts.create');

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

    redirect('/admin/inventory/counts');
  }

  return (
    <div className="flex min-h-screen bg-[var(--color-ivory-100)] text-zinc-800" dir="rtl">
      <AdminSidebar employeeName={session.employee.name} />
      
      <main className="flex-grow p-6 md:p-12 w-full max-w-4xl mx-auto space-y-6">
        <div>
          <h1 className="text-2xl font-bold font-heading text-[var(--color-forest-900)]">تكليف جرد جديد</h1>
          <p className="text-xs text-zinc-500 mt-1">تحديد الموظف المسؤول ونطاق مطابقة الكميات.</p>
        </div>

        <form action={handleCreateSession} className="bg-white p-6 rounded-lg border border-[var(--color-ivory-200)] shadow-sm space-y-6">
          <div className="space-y-2">
            <label className="text-xs font-bold text-zinc-650">عنوان طلب الجرد</label>
            <input 
              type="text" 
              name="title" 
              placeholder="مثال: جرد الربع الثاني، جرد المخزن السائل الرئيسي" 
              required 
              className="w-full border border-zinc-300 rounded p-2 text-xs outline-none focus:ring-1 focus:ring-[var(--color-champagne-600)] bg-white"
            />
          </div>

          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            <div className="space-y-2">
              <label className="text-xs font-bold text-zinc-650">الموظف المسؤول</label>
              <select name="assignedEmployeeId" required className="w-full border border-zinc-300 rounded p-2 text-xs outline-none focus:ring-1 focus:ring-[var(--color-champagne-600)] bg-white">
                {employees.map(emp => (
                  <option key={emp.id} value={emp.id}>{emp.name}</option>
                ))}
              </select>
            </div>

            <div className="space-y-2">
              <label className="text-xs font-bold text-zinc-650">نطاق جرد المواد</label>
              <select name="scopeType" required className="w-full border border-zinc-300 rounded p-2 text-xs outline-none focus:ring-1 focus:ring-[var(--color-champagne-600)] bg-white">
                <option value="ALL">كل عطور المتجر والمنفذ</option>
                <option value="LIQUID">عطور الصب والمستودع السائل فقط</option>
              </select>
            </div>
          </div>

          <div className="space-y-2">
            <label className="text-xs font-bold text-zinc-650">ملاحظات أو توجيهات إدارية</label>
            <textarea 
              name="notes" 
              rows={4}
              placeholder="يرجى إحصاء الزجاجات والتأكد من وزن البراميل..."
              className="w-full border border-zinc-300 rounded p-2 text-xs outline-none focus:ring-1 focus:ring-[var(--color-champagne-600)] bg-white"
            />
          </div>

          <div className="flex gap-4">
            <button 
              type="submit" 
              className="bg-[var(--color-forest-800)] hover:bg-[var(--color-forest-900)] text-white font-bold px-6 py-2.5 rounded text-xs transition-colors shadow-md"
            >
              بدء طلب الجرد وتكليف الموظف
            </button>
            <Link
              href="/admin/inventory/counts"
              className="bg-neutral-100 hover:bg-neutral-200 text-zinc-700 font-bold px-6 py-2.5 rounded text-xs transition-colors text-center"
            >
              إلغاء العودة للخلف
            </Link>
          </div>
        </form>
      </main>
    </div>
  );
}
