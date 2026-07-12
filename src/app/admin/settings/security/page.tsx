import React from 'react';
import { requireAuth } from '@/lib/dal';
import { AdminSidebar } from '@/components/AdminSidebar';
import { getSecuritySettings, updateSecuritySettings } from '@/actions/settings-crud';

export default async function SecuritySettingsPage() {
  const session = await requireAuth();
  const settings = await getSecuritySettings();

  async function handleSave(formData: FormData) {
    'use server';
    const passwordMinLength = parseInt(formData.get('passwordMinLength') as string || '15');
    const requireMFA = formData.get('requireMFA') === 'true';
    const maxLoginAttempts = parseInt(formData.get('maxLoginAttempts') as string || '5');

    await updateSecuritySettings({ passwordMinLength, requireMFA, maxLoginAttempts }, session.employeeId);
  }

  return (
    <div className="flex min-h-screen bg-[var(--color-ivory-100)] text-zinc-800">
      <AdminSidebar employeeName={session.employee.name} />
      <main className="flex-1 p-6 md:p-12 font-sans w-full max-w-4xl mx-auto">
        <h1 className="text-2xl font-bold font-heading text-[var(--color-forest-900)] mb-4">إعدادات الأمان والسرية</h1>
        <form action={handleSave} className="bg-white p-6 rounded shadow-sm border border-[var(--color-ivory-200)] flex flex-col gap-6">
          <div className="flex flex-col gap-1">
            <label htmlFor="passwordMinLength" className="text-sm font-bold">الحد الأدنى لطول كلمة المرور (أحرف)</label>
            <input type="number" name="passwordMinLength" id="passwordMinLength" defaultValue={settings.passwordMinLength} min="15" className="border border-zinc-200 rounded p-2 text-sm" />
          </div>
          <div className="flex items-center gap-3">
            <input type="checkbox" name="requireMFA" id="requireMFA" value="true" defaultChecked={settings.requireMFA} className="w-5 h-5 accent-[var(--color-forest-800)]" />
            <label htmlFor="requireMFA" className="font-bold">إلزام التحقق بخطوتين (MFA/TOTP) للمدراء</label>
          </div>
          <div className="flex flex-col gap-1">
            <label htmlFor="maxLoginAttempts" className="text-sm font-bold">الحد الأقصى لمحاولات تسجيل الدخول قبل قفل الحساب</label>
            <input type="number" name="maxLoginAttempts" id="maxLoginAttempts" defaultValue={settings.maxLoginAttempts} className="border border-zinc-200 rounded p-2 text-sm" />
          </div>
          <button type="submit" className="bg-[var(--color-forest-800)] text-white font-bold p-3 rounded hover:bg-[var(--color-forest-900)] transition-colors mt-4">حفظ إعدادات الأمان</button>
        </form>
      </main>
    </div>
  );
}
