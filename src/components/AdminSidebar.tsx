import React from 'react';
import Link from 'next/link';
import { logout } from '@/actions/auth';

interface AdminSidebarProps {
  employeeName: string;
}

export function AdminSidebar({ employeeName }: AdminSidebarProps) {
  const links = [
    { href: '/admin', label: 'لوحة التحكم' },
    { href: '/admin/products', label: 'المنتجات والأسعار' },
    { href: '/admin/categories', label: 'تصنيفات العطور' },
    { href: '/admin/collections', label: 'المجموعات التسويقية' },
    { href: '/admin/orders', label: 'طلبات المتجر' },
    { href: '/admin/sales', label: 'المبيعات والفواتير' },
    { href: '/admin/inventory', label: 'حركة المخزون' },
    { href: '/admin/raw-materials', label: 'المواد الخام' },
    { href: '/admin/formulas', label: 'تركيبات العطور' },
    { href: '/admin/employees', label: 'الموظفين والصلاحيات' },
    { href: '/admin/reports', label: 'التقارير والإحصائيات' },
    { href: '/admin/content', label: 'المحتوى والمدونة (CMS)' },
    { href: '/admin/imports', label: 'سجلات الاستيراد' },
    { href: '/admin/audit-logs', label: 'سجل العمليات (Audit)' },
    { href: '/admin/settings', label: 'الإعدادات العامة' }
  ];

  return (
    <aside className="w-64 bg-[var(--color-forest-900)] text-white flex flex-col h-screen sticky top-0 font-sans border-l-4 border-[var(--color-champagne-600)]" dir="rtl">
      {/* Brand Header */}
      <div className="p-6 border-b border-[var(--color-forest-800)] flex flex-col items-center">
        <span className="font-heading font-bold text-2xl tracking-widest text-[var(--color-champagne-400)] mb-1">
          دهب للعطور
        </span>
        <span className="text-xs text-zinc-400">لوحة الإدارة والتحكم</span>
      </div>

      {/* Employee Welcome & Log Out */}
      <div className="p-4 border-b border-[var(--color-forest-800)] text-xs text-zinc-300 flex justify-between items-center">
        <span>مرحباً، {employeeName}</span>
        <form action={logout}>
          <button 
            type="submit" 
            className="text-[var(--color-champagne-400)] hover:text-white underline font-bold"
          >
            خروج
          </button>
        </form>
      </div>

      {/* Nav Links */}
      <nav className="flex-1 overflow-y-auto p-4 space-y-1">
        {links.map((link) => (
          <Link
            key={link.href}
            href={link.href}
            className="block px-4 py-2.5 rounded hover:bg-[var(--color-forest-800)] text-sm font-medium transition-colors text-zinc-200 hover:text-white"
          >
            {link.label}
          </Link>
        ))}
      </nav>
    </aside>
  );
}
