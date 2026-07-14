import React from 'react';
import { requireAuth, getEmployeePermissions } from '@/lib/dal';
import { prisma } from '@/lib/db';
import { AdminSidebar } from '@/components/AdminSidebar';
import { createEmployee, updateEmployee } from '@/actions/employees';
import { redirect } from 'next/navigation';
import Link from 'next/link';

export default async function AdminEmployeesPage({
  searchParams
}: {
  searchParams: Promise<{ action?: string; id?: string }>;
}) {
  const session = await requireAuth();
  const activePermissions = await getEmployeePermissions(session.employeeId);

  // Resolve searchParams promise
  const resolvedParams = await searchParams;
  const action = resolvedParams.action;
  const editId = resolvedParams.id;

  const roles = await prisma.role.findMany();
  let allPermissions = await prisma.permission.findMany();

  // Auto-seed missing POS permissions
  const requiredPerms = [
    { action: 'pos.orders.view', description: 'عرض طلبات المتجر في شاشة الكاشير' },
    { action: 'pos.orders.manage', description: 'إدارة وتغيير حالة طلبات المتجر في الكاشير' }
  ];
  let permAdded = false;
  for (const rp of requiredPerms) {
    if (!allPermissions.find(p => p.action === rp.action)) {
      await prisma.permission.create({ data: rp });
      permAdded = true;
    }
  }
  if (permAdded) {
    allPermissions = await prisma.permission.findMany();
  }

  // Load employee list
  const employees = await prisma.employee.findMany({
    include: {
      role: true,
      permissions: {
        include: {
          permission: true
        }
      }
    }
  });

  // Handle Edit employee load
  let editEmployee = null;
  let editEmployeePermIds: string[] = [];
  if (action === 'edit' && editId) {
    editEmployee = await prisma.employee.findUnique({
      where: { id: editId },
      include: {
        permissions: true
      }
    });
    if (editEmployee) {
      editEmployeePermIds = editEmployee.permissions.map((p) => p.permissionId);
    }
  }

  // Server Action wrappers
  async function handleSave(formData: FormData) {
    'use server';

    const empId = formData.get('id') as string;
    const name = formData.get('name') as string;
    const email = formData.get('email') as string;
    const password = formData.get('password') as string;
    const roleId = formData.get('roleId') as string;
    const isActive = formData.get('isActive') === 'true';
    
    // Collect permissions from checkbox fields
    const selectedPermissionIds: string[] = [];
    for (const p of allPermissions) {
      if (formData.get(`perm_${p.id}`) === 'on') {
        selectedPermissionIds.push(p.id);
      }
    }

    if (empId) {
      // Update
      const res = await updateEmployee({
        id: empId,
        name,
        email,
        password: password || undefined,
        roleId,
        isActive,
        selectedPermissionIds,
        adminId: session.employeeId
      });
      if (!res.success) {
        throw new Error(res.error);
      }
    } else {
      // Create
      const res = await createEmployee({
        name,
        email,
        password: password || undefined,
        roleId,
        isActive,
        selectedPermissionIds,
        bootstrapAdminId: session.employeeId
      });
      if (!res.success) {
        throw new Error(res.error);
      }
    }

    redirect('/admin/employees');
  }

  async function handleRevoke(formData: FormData) {
    'use server';
    const targetId = formData.get('targetId') as string;
    await prisma.session.deleteMany({
      where: { employeeId: targetId }
    });
    
    await prisma.auditLog.create({
      data: {
        employeeId: session.employeeId,
        action: 'SESSIONS_REVOKED',
        entityType: 'Employee',
        entityId: targetId,
        details: JSON.stringify({ reason: 'Manual session revocation by Admin' })
      }
    });

    redirect('/admin/employees');
  }

  return (
    <div className="flex flex-col md:flex-row min-h-screen bg-[var(--color-ivory-100)]" dir="rtl">
      <AdminSidebar employeeName={session.employee.name} permissions={activePermissions} />

      <main className="flex-1 p-4 md:p-8 font-sans w-full max-w-4xl mx-auto">
        {/* Header */}
        <div className="flex justify-between items-center mb-6 border-b border-[var(--color-ivory-200)] pb-4">
          <div>
            <h1 className="text-2xl md:text-3xl font-bold font-heading text-[var(--color-charcoal-900)]">
              {action === 'new' ? 'إضافة موظف جديد' : action === 'edit' ? 'تعديل بيانات الموظف' : 'إدارة الموظفين والصلاحيات'}
            </h1>
            <p className="text-zinc-650 text-xs md:text-sm mt-1">التحكم بحسابات الموظفين وصلاحياتهم المباشرة</p>
          </div>
          {!action && (
            <Link
              href="/admin/employees?action=new"
              className="bg-[var(--color-charcoal-800)] text-white text-xs md:text-sm px-4 py-2 rounded font-bold hover:bg-[var(--color-charcoal-900)] transition-colors"
            >
              + إضافة موظف
            </Link>
          )}
        </div>

        {/* Create / Edit Form */}
        {action && (action === 'new' || (action === 'edit' && editEmployee)) ? (
          <form action={handleSave} className="bg-white p-6 rounded-lg border border-[var(--color-ivory-200)] shadow-sm space-y-4">
            {editEmployee && <input type="hidden" name="id" value={editEmployee.id} />}

            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
              <div>
                <label className="block text-sm font-bold text-zinc-700 mb-1">الاسم الكامل</label>
                <input
                  type="text"
                  name="name"
                  required
                  defaultValue={editEmployee?.name || ''}
                  className="w-full border border-zinc-200 rounded px-3 py-2 text-sm outline-none focus:border-[var(--color-charcoal-800)]"
                />
              </div>

              <div>
                <label className="block text-sm font-bold text-zinc-700 mb-1">البريد الإلكتروني</label>
                <input
                  type="email"
                  name="email"
                  required
                  defaultValue={editEmployee?.email || ''}
                  className="w-full border border-zinc-200 rounded px-3 py-2 text-sm outline-none focus:border-[var(--color-charcoal-800)]"
                />
              </div>

              <div>
                <label className="block text-sm font-bold text-zinc-700 mb-1">
                  {action === 'new' ? 'كلمة المرور (تلقائي إن تُرِك فارغاً)' : 'إعادة تعيين كلمة المرور (اختياري)'}
                </label>
                <input
                  type="password"
                  name="password"
                  placeholder={action === 'new' ? 'أدخل كلمة مرور قوية' : 'اتركه فارغاً لعدم التغيير'}
                  className="w-full border border-zinc-200 rounded px-3 py-2 text-sm outline-none focus:border-[var(--color-charcoal-800)]"
                />
              </div>

              <div>
                <label className="block text-sm font-bold text-zinc-700 mb-1">الدور الوظيفي الرئيسي</label>
                <select
                  name="roleId"
                  required
                  defaultValue={editEmployee?.roleId || ''}
                  className="w-full border border-zinc-200 rounded px-3 py-2 text-sm outline-none bg-white focus:border-[var(--color-charcoal-800)]"
                >
                  <option value="">اختر الدور الوظيفي...</option>
                  {roles.map((role) => (
                    <option key={role.id} value={role.id}>
                      {role.name === 'Admin' ? 'مدير نظام (Admin)' : role.name}
                    </option>
                  ))}
                </select>
              </div>

              <div>
                <label className="block text-sm font-bold text-zinc-700 mb-1">حالة الحساب</label>
                <select
                  name="isActive"
                  required
                  defaultValue={editEmployee ? String(editEmployee.isActive) : 'true'}
                  className="w-full border border-zinc-200 rounded px-3 py-2 text-sm outline-none bg-white focus:border-[var(--color-charcoal-800)]"
                >
                  <option value="true">نشط</option>
                  <option value="false">معطل / موقف</option>
                </select>
              </div>
            </div>

            {/* Checkbox Permission Grid */}
            <div className="border-t border-zinc-100 pt-4 mt-6">
              <h3 className="text-sm font-bold text-[var(--color-charcoal-900)] mb-3">الصلاحيات المخصصة (Checkbox Permissions Override)</h3>
              <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
                {allPermissions.map((perm) => {
                  const isChecked = editEmployeePermIds.includes(perm.id);
                  return (
                    <label
                      key={perm.id}
                      className="flex items-center gap-3 p-3 rounded border border-zinc-100 bg-zinc-50/50 hover:bg-zinc-50 cursor-pointer transition-colors"
                    >
                      <input
                        type="checkbox"
                        name={`perm_${perm.id}`}
                        defaultChecked={isChecked}
                        className="h-4.5 w-4.5 rounded border-zinc-300 text-[var(--color-charcoal-800)] focus:ring-[var(--color-charcoal-800)]"
                      />
                      <div>
                        <p className="text-sm font-bold text-zinc-800">
                          {perm.action === 'pos:access' ? 'صلاحية الكاشير (POS Access)' :
                           perm.action === 'pos.orders.view' ? 'عرض طلبات المتجر في الـ POS' :
                           perm.action === 'pos.orders.manage' ? 'إدارة حالات طلبات المتجر في الـ POS' :
                           perm.action === 'manage:products' ? 'إدارة المنتجات والأسعار' :
                           perm.action === 'manage:orders' ? 'إدارة الطلبات والفواتير' :
                           perm.action === 'manage:inventory' ? 'إدارة المخزون والتركيبات' :
                           perm.action === 'manage:settings' ? 'إدارة إعدادات النظام والموظفين' : perm.action}
                        </p>
                        <p className="text-xs text-zinc-500 mt-0.5">{perm.description || 'تخويل الموظف للقيام بالعمليات البرمجية لهذه الصلاحية'}</p>
                      </div>
                    </label>
                  );
                })}
              </div>
            </div>

            <div className="flex gap-3 justify-end pt-4 border-t border-zinc-100 mt-6">
              <Link
                href="/admin/employees"
                className="bg-zinc-100 text-zinc-700 text-xs md:text-sm px-4 py-2 rounded font-bold hover:bg-zinc-200 transition-colors"
              >
                إلغاء
              </Link>
              <button
                type="submit"
                className="bg-[var(--color-charcoal-800)] text-white text-xs md:text-sm px-5 py-2 rounded font-bold hover:bg-[var(--color-charcoal-900)] transition-colors"
              >
                حفظ التغييرات
              </button>
            </div>
          </form>
        ) : (
          /* Mobile Card List Layout (Integrated with user request) */
          <div className="space-y-4">
            {employees.map((emp) => (
              <div
                key={emp.id}
                className="bg-white p-4 rounded-lg border border-[var(--color-ivory-200)] shadow-sm space-y-3 relative"
              >
                <div className="flex justify-between items-start">
                  <div>
                    <h3 className="font-bold text-zinc-950 text-base">{emp.name}</h3>
                    <p className="text-zinc-500 text-xs font-mono mt-0.5">{emp.email}</p>
                  </div>
                  <span className={`inline-flex px-2 py-0.5 rounded text-xs font-bold ${emp.isActive ? 'bg-green-100 text-green-800' : 'bg-red-100 text-red-800'}`}>
                    {emp.isActive ? 'نشط' : 'معطل'}
                  </span>
                </div>

                <div className="flex flex-wrap gap-2 text-xs pt-1">
                  <span className="bg-[var(--color-ivory-200)] px-2 py-0.5 rounded font-bold text-[var(--color-charcoal-900)]">
                    الدور: {emp.role.name === 'Admin' ? 'مدير نظام (Admin)' : emp.role.name}
                  </span>
                  
                  {emp.permissions.map((ep) => (
                    <span key={ep.permissionId} className="bg-emerald-50 text-emerald-800 border border-emerald-100 px-2 py-0.5 rounded font-bold">
                      {ep.permission.action === 'pos:access' ? 'الكاشير' : ep.permission.action.split(':')[1] || ep.permission.action}
                    </span>
                  ))}
                </div>

                <div className="flex gap-2 pt-3 border-t border-zinc-100 justify-end">
                  <form action={handleRevoke} className="inline-block">
                    <input type="hidden" name="targetId" value={emp.id} />
                    <button
                      type="submit"
                      className="text-xs text-red-600 hover:text-red-700 bg-red-50 hover:bg-red-100 px-3 py-1.5 rounded font-bold transition-colors"
                    >
                      إلغاء الجلسات
                    </button>
                  </form>
                  <Link
                    href={`/admin/employees?action=edit&id=${emp.id}`}
                    className="text-xs text-[var(--color-charcoal-800)] bg-[var(--color-ivory-200)] hover:bg-[var(--color-champagne-200)] px-4 py-1.5 rounded font-bold transition-colors"
                  >
                    تعديل
                  </Link>
                </div>
              </div>
            ))}

            {employees.length === 0 && (
              <div className="bg-white p-8 text-center rounded-lg border border-[var(--color-ivory-200)] text-zinc-500">
                لا يوجد موظفون مسجلون.
              </div>
            )}
          </div>
        )}
      </main>
    </div>
  );
}
