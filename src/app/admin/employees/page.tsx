import React from 'react';
import { requireAuth } from '@/lib/dal';
import { prisma } from '@/lib/db';
import { AdminSidebar } from '@/components/AdminSidebar';

export default async function AdminEmployeesPage() {
  const session = await requireAuth();

  const employees = await prisma.employee.findMany({
    include: {
      role: true
    }
  });

  return (
    <div className="flex h-screen bg-[var(--color-ivory-100)]" dir="rtl">
      <AdminSidebar employeeName={session.employee.name} />

      <main className="flex-1 overflow-y-auto p-8 font-sans">
        <div className="flex justify-between items-center mb-8 border-b border-[var(--color-ivory-200)] pb-4">
          <div>
            <h1 className="text-3xl font-bold font-heading text-[var(--color-forest-900)]">
              الموظفين والصلاحيات
            </h1>
            <p className="text-zinc-650 mt-1">التحكم بحسابات الموظفين، الأدوار القيادية، والصلاحيات على النظام</p>
          </div>
        </div>

        <div className="bg-white rounded-lg shadow-sm border border-[var(--color-ivory-200)] overflow-hidden">
          <table className="w-full text-right border-collapse">
            <thead className="bg-zinc-50 border-b border-zinc-200">
              <tr className="text-sm font-bold text-zinc-700">
                <th className="px-6 py-4">اسم الموظف</th>
                <th className="px-6 py-4">البريد الإلكتروني</th>
                <th className="px-6 py-4">الدور الوظيفي</th>
                <th className="px-6 py-4">تاريخ الإنشاء</th>
                <th className="px-6 py-4">حالة الحساب</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-zinc-100">
              {employees.map((emp) => (
                <tr key={emp.id} className="hover:bg-zinc-50/50 transition-colors text-zinc-650">
                  <td className="px-6 py-4 font-bold text-zinc-900">{emp.name}</td>
                  <td className="px-6 py-4 font-mono text-sm">{emp.email}</td>
                  <td className="px-6 py-4">
                    <span className="bg-[var(--color-ivory-200)] px-2.5 py-0.5 rounded text-xs font-bold text-[var(--color-forest-900)]">
                      {emp.role.name}
                    </span>
                  </td>
                  <td className="px-6 py-4 text-sm">
                    {new Date(emp.createdAt).toLocaleDateString('ar-JO')}
                  </td>
                  <td className="px-6 py-4">
                    <span className={`inline-flex px-2 py-0.5 rounded text-xs font-bold ${emp.isActive ? 'bg-green-100 text-green-800' : 'bg-red-100 text-red-800'}`}>
                      {emp.isActive ? 'نشط' : 'معطل'}
                    </span>
                  </td>
                </tr>
              ))}

              {employees.length === 0 && (
                <tr>
                  <td colSpan={5} className="px-6 py-12 text-center text-zinc-500">
                    لا يوجد موظفون مسجلون.
                  </td>
                </tr>
              )}
            </tbody>
          </table>
        </div>
      </main>
    </div>
  );
}
