'use client';

import React, { useState } from 'react';
import Link from 'next/link';
import { logout } from '@/actions/auth';

interface AdminSidebarProps {
  employeeName: string;
  permissions?: string[]; // permissions list of the logged-in employee
}

export function AdminSidebar({ employeeName, permissions = [] }: AdminSidebarProps) {
  const [isOpen, setIsOpen] = useState(false);
  const [activePermissions, setActivePermissions] = useState<string[]>(permissions);

  React.useEffect(() => {
    if (permissions && permissions.length > 0) {
      setActivePermissions(permissions);
    } else {
      fetch('/api/auth/permissions')
        .then((res) => res.json())
        .then((perms) => {
          if (Array.isArray(perms)) {
            setActivePermissions(perms);
          }
        })
        .catch(() => {});
    }
  }, [permissions]);

  const allLinks = [
    { href: '/admin', label: 'لوحة التحكم', permission: null },
    { href: '/admin/products', label: 'المنتجات والأسعار', permission: 'manage:products' },
    { href: '/admin/categories', label: 'تصنيفات العطور', permission: 'manage:products' },
    { href: '/admin/collections', label: 'المجموعات التسويقية', permission: 'manage:products' },
    { href: '/admin/orders', label: 'طلبات المتجر', permission: 'manage:orders' },
    { href: '/admin/sales', label: 'المبيعات والفواتير', permission: 'manage:orders' },
    { href: '/admin/inventory', label: 'حركة المخزون', permission: 'manage:inventory' },
    { href: '/admin/inventory/counts', label: 'مطابقة وجرد المخزون', permission: 'manage:inventory' },
    { href: '/admin/raw-materials', label: 'المواد الخام', permission: 'manage:inventory' },
    { href: '/admin/formulas', label: 'تركيبات العطور', permission: 'manage:inventory' },
    { href: '/admin/employees', label: 'الموظفين والصلاحيات', permission: 'manage:settings' },
    { href: '/admin/reports', label: 'التقارير والإحصائيات', permission: 'manage:settings' },
    { href: '/admin/content', label: 'المحتوى والمدونة (CMS)', permission: 'manage:settings' },
    { href: '/admin/imports', label: 'سجلات الاستيراد', permission: 'manage:settings' },
    { href: '/admin/audit-logs', label: 'سجل العمليات (Audit)', permission: 'manage:settings' },
    { href: '/admin/settings', label: 'الإعدادات العامة', permission: 'manage:settings' }
  ];

  // Filter links based on employee permissions.
  // If permission is null, it's public. If it matches, show it.
  const filteredLinks = allLinks.filter(
    (link) => !link.permission || activePermissions.includes(link.permission)
  );

  return (
    <>
      {/* Mobile Top Header containing Hamburger Toggle */}
      <div className="md:hidden flex items-center justify-between bg-[var(--color-forest-900)] text-white px-4 py-3 sticky top-0 z-40 w-full shadow-md border-b border-[var(--color-champagne-600)]">
        <span className="font-heading font-bold text-lg text-[var(--color-champagne-400)]">
          دهب للعطور
        </span>
        <button
          onClick={() => setIsOpen(!isOpen)}
          className="p-2 text-zinc-100 focus:outline-none hover:text-[var(--color-champagne-400)]"
          aria-label="Toggle Menu"
        >
          <svg className="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            {isOpen ? (
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
            ) : (
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 6h16M4 12h16M4 18h16" />
            )}
          </svg>
        </button>
      </div>

      {/* Backdrop for mobile view */}
      {isOpen && (
        <div
          className="md:hidden fixed inset-0 bg-black/50 z-30 transition-opacity"
          onClick={() => setIsOpen(false)}
        />
      )}

      {/* Sidebar Content container */}
      <aside
        className={`fixed md:sticky top-0 right-0 z-30 w-64 bg-[var(--color-forest-900)] text-white flex flex-col h-screen font-sans border-l-4 border-[var(--color-champagne-600)] transition-transform duration-300 transform md:transform-none ${
          isOpen ? 'translate-x-0' : 'translate-x-full md:translate-x-0'
        }`}
        dir="rtl"
      >
        {/* Brand Header */}
        <div className="p-6 border-b border-[var(--color-forest-800)] flex flex-col items-center">
          <span className="font-heading font-bold text-2xl tracking-widest text-[var(--color-champagne-400)] mb-1">
            دهب للعطور
          </span>
          <span className="text-xs text-zinc-400">لوحة الإدارة والتحكم</span>
        </div>

        {/* Employee Welcome & Log Out */}
        <div className="p-4 border-b border-[var(--color-forest-800)] text-xs text-zinc-300 flex justify-between items-center">
          <span className="truncate max-w-[120px]">مرحباً، {employeeName}</span>
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
          {filteredLinks.map((link) => (
            <Link
              key={link.href}
              href={link.href}
              onClick={() => setIsOpen(false)}
              className="block px-4 py-2.5 rounded hover:bg-[var(--color-forest-800)] text-sm font-medium transition-colors text-zinc-200 hover:text-white"
            >
              {link.label}
            </Link>
          ))}
        </nav>
      </aside>
    </>
  );
}
