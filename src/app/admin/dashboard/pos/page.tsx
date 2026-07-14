import React from 'react';
import { requireAuth } from '@/lib/dal';
import { prisma } from '@/lib/db';
import { AdminSidebar } from '@/components/AdminSidebar';
import { POSCashierWorkspace } from '@/components/POSCashierWorkspace';

export default async function AdminPOSPage() {
  const session = await requireAuth();
  
  // Verify Admin POS access
  // Even admins need basic pos settings
  const employeeId = session.employee.id;

  // Fetch all products, including accords, notes, and variants
  const productsRaw = await prisma.product.findMany({
    where: { isVisible: true },
    include: {
      variants: {
        where: { isActive: true }
      },
      images: {
        where: { isMain: true },
        take: 1
      }
    }
  });

  const products = productsRaw.map(p => ({
    id: p.id,
    nameAr: p.nameAr,
    nameEn: p.nameEn,
    sku: p.sku,
    shortDescription: p.shortDescription,
    stockStatus: p.stockStatus,
    variants: p.variants,
    stockLiters: p.stockLiters,
    imageUrl: p.images?.[0]?.url
  }));

  const settingsRecords = await prisma.siteSettings.findMany();
  const settingsMap = new Map(settingsRecords.map(s => [s.key, s.value]));

  const taxEnabled = settingsMap.get('tax_enabled') === 'true';
  const taxRate = parseFloat(settingsMap.get('tax_rate') || '0');
  const pricesIncludeTax = settingsMap.get('prices_include_tax') !== 'false';

  const posSettingsRecord = settingsRecords.find(s => s.key === 'pos_settings');
  let posSettings = {
    requireShiftToSell: true,
    defaultIdleLockSeconds: 240,
    allowManagerOverride: true,
    posIdleEnabled: false, // disable idle lock for admin dashboard
    posSessionLifetimeHours: 15
  };
  
  if (posSettingsRecord) {
    try {
      const parsed = JSON.parse(posSettingsRecord.value);
      posSettings = { ...posSettings, ...parsed, posIdleEnabled: false };
    } catch {}
  }

  const userSession = await prisma.session.findFirst({
    where: { employeeId },
    orderBy: { createdAt: 'desc' }
  });
  
  const rawDate = userSession ? userSession.createdAt : new Date();
  const sessionCreatedAt = new Date(rawDate);
  const hours = Number(posSettings?.posSessionLifetimeHours) || 15;
  const lifetimeMs = hours * 60 * 60 * 1000;
  
  let sessionExpiresAt = new Date().toISOString();
  if (sessionCreatedAt instanceof Date && !isNaN(sessionCreatedAt.getTime())) {
    try {
      const expiresDate = new Date(sessionCreatedAt.getTime() + lifetimeMs);
      if (!isNaN(expiresDate.getTime())) {
        sessionExpiresAt = expiresDate.toISOString();
      }
    } catch {}
  }

  return (
    <div className="flex flex-col md:flex-row h-screen bg-[var(--color-ivory-100)] overflow-hidden" dir="rtl">
      <AdminSidebar employeeName={session.employee.name} />

      <main className="flex-1 overflow-hidden font-sans relative">
        <POSCashierWorkspace
          products={products}
          settings={{
            taxEnabled,
            taxRate,
            pricesIncludeTax,
            ...posSettings
          }}
          cashierName={session.employee.name}
          sessionExpiresAt={sessionExpiresAt}
        />
      </main>
    </div>
  );
}
