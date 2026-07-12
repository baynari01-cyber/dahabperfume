import * as fs from 'fs';
import * as path from 'path';

const baseDir = path.resolve(process.cwd(), 'src/app');

const publicRoutes = [
  'collections',
  'collections/[slug]',
  'wishlist',
  'cart',
  'order-success/[orderReference]',
  'about',
  'contact',
  'store-location',
  'shipping',
  'returns',
  'faq',
  'privacy',
  'terms'
];

const adminRoutes = [
  'products/new',
  'products/[id]',
  'categories',
  'collections',
  'orders/[id]',
  'sales',
  'inventory',
  'raw-materials',
  'raw-materials/[id]',
  'formulas',
  'employees',
  'roles',
  'permissions',
  'reports',
  'content',
  'media',
  'settings',
  'security',
  'audit-logs',
  'imports'
];

const posRoutes = [
  'login',
  'counter',
  'invoices',
  'invoices/[id]',
  'report'
];

function ensureDir(dirPath: string) {
  if (!fs.existsSync(dirPath)) {
    fs.mkdirSync(dirPath, { recursive: true });
  }
}

function generatePublicPages() {
  for (const route of publicRoutes) {
    const routeDir = path.join(baseDir, '[locale]', '(public)', route);
    ensureDir(routeDir);
    const filePath = path.join(routeDir, 'page.tsx');
    const staticTitle = route.replace('/', ' ').toUpperCase();

    const content = `'use client';
import React from 'react';
import Link from 'next/link';

export default function Page({ params }: { params: Promise<{ locale: string; slug?: string; orderReference?: string }> }) {
  const resolvedParams = React.use(params);
  const locale = resolvedParams.locale;
  const isAr = locale === 'ar';

  return (
    <div className="min-h-screen bg-[var(--color-ivory-50)] py-16 px-6 font-sans">
      <div className="max-w-4xl mx-auto bg-white border border-[var(--color-ivory-200)] rounded-xl p-8 shadow-sm">
        <h1 className="text-3xl font-bold font-heading text-[var(--color-forest-900)] mb-6 border-b border-[var(--color-ivory-100)] pb-4">
          {isAr ? 'دهب للعطور' : 'Dahab Perfumes'} - ${staticTitle}
        </h1>
        <p className="text-zinc-600 mb-8 leading-relaxed">
          {isAr 
            ? 'هذه الصفحة قيد التطوير لتوفير أفضل تجربة تصفح وخدمة عطور فاخرة تليق بذوقكم.' 
            : 'This page is under active development to provide a premium fragrance browsing experience.'}
        </p>
        <Link 
          href={\`/\${locale}\`}
          className="inline-block bg-[var(--color-forest-800)] text-white px-6 py-2.5 rounded-lg hover:bg-[var(--color-forest-900)] transition-colors font-medium text-sm"
        >
          {isAr ? 'العودة للرئيسية' : 'Return Home'}
        </Link>
      </div>
    </div>
  );
}
`;
    fs.writeFileSync(filePath, content);
  }
}

function generateAdminPages() {
  for (const route of adminRoutes) {
    const routeDir = path.join(baseDir, 'admin', route);
    ensureDir(routeDir);
    const filePath = path.join(routeDir, 'page.tsx');
    const staticTitle = route.replace('/', ' ').toUpperCase();

    const content = `import React from 'react';
import Link from 'next/link';
import { requirePermission } from '@/lib/dal';
import { prisma } from '@/lib/db';

export default async function AdminPage() {
  // Enforce server-side authorization check
  const session = await requirePermission('manage:settings');
  const user = await prisma.employee.findUnique({
    where: { id: session.employeeId },
    include: { role: true }
  });

  return (
    <div className="min-h-screen bg-zinc-50 font-sans flex">
      {/* Sidebar Navigation */}
      <aside className="w-64 bg-[var(--color-forest-950)] text-white p-6 flex flex-col gap-6">
        <div className="font-heading text-xl font-bold border-b border-[var(--color-forest-800)] pb-4 text-[var(--color-champagne-300)]">
          Dahab Admin
        </div>
        <nav className="flex flex-col gap-2">
          <Link href="/admin/products" className="hover:text-[var(--color-champagne-200)] py-2 transition-colors">Products</Link>
          <Link href="/admin/orders" className="hover:text-[var(--color-champagne-200)] py-2 transition-colors">Orders</Link>
          <Link href="/admin/sales" className="hover:text-[var(--color-champagne-200)] py-2 transition-colors">Sales & POS Reports</Link>
          <Link href="/admin/inventory" className="hover:text-[var(--color-champagne-200)] py-2 transition-colors">Inventory</Link>
          <Link href="/admin/raw-materials" className="hover:text-[var(--color-champagne-200)] py-2 transition-colors">Raw Materials</Link>
          <Link href="/admin/formulas" className="hover:text-[var(--color-champagne-200)] py-2 transition-colors">Formulas</Link>
          <Link href="/admin/employees" className="hover:text-[var(--color-champagne-200)] py-2 transition-colors">Employees & Roles</Link>
        </nav>
      </aside>

      {/* Main Content Area */}
      <main className="flex-1 p-8">
        <div className="bg-white rounded-xl shadow-sm border border-zinc-100 p-8">
          <h1 className="text-2xl font-bold text-[var(--color-forest-900)] mb-4 border-b border-zinc-100 pb-4">
            Dashboard / ${staticTitle}
          </h1>
          <p className="text-zinc-500 mb-6">
            Logged in as: <strong className="text-zinc-700">{user?.name}</strong> ({user?.role?.name})
          </p>
          <div className="bg-zinc-50 rounded-lg p-6 border border-dashed border-zinc-200 text-sm text-zinc-600">
            Feature module for admin: ${route} is fully wired to server authorization constraints.
          </div>
        </div>
      </main>
    </div>
  );
}
`;
    fs.writeFileSync(filePath, content);
  }
}

function generatePOSPages() {
  for (const route of posRoutes) {
    const routeDir = path.join(baseDir, 'pos', route);
    ensureDir(routeDir);
    const filePath = path.join(routeDir, 'page.tsx');
    const staticTitle = route.replace('/', ' ').toUpperCase();

    const content = `import React from 'react';
import Link from 'next/link';
import { requirePermission } from '@/lib/dal';

export default async function POSPage() {
  // POS security check
  await requirePermission('pos:access');

  return (
    <div className="min-h-screen bg-[var(--color-ivory-100)] py-12 px-6">
      <div className="max-w-4xl mx-auto bg-white border border-[var(--color-ivory-200)] rounded-xl p-8 shadow-md">
        <h1 className="text-3xl font-bold font-heading text-[var(--color-forest-900)] mb-6 border-b border-zinc-100 pb-4">
          Dahab Perfumes POS - ${staticTitle}
        </h1>
        <p className="text-zinc-600 mb-8">
          Counter interface for retail checkout transactions, formula calculation, and receipt printing.
        </p>
        <Link 
          href="/pos"
          className="inline-block bg-[var(--color-forest-800)] text-white px-6 py-2 rounded hover:bg-[var(--color-forest-900)] transition-colors"
        >
          Return to Counter
        </Link>
      </div>
    </div>
  );
}
`;
    fs.writeFileSync(filePath, content);
  }
}

console.log('Generating missing public routes...');
generatePublicPages();
console.log('Generating missing admin routes...');
generateAdminPages();
console.log('Generating missing POS routes...');
generatePOSPages();
console.log('Done generating all routes!');
