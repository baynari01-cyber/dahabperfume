import React from 'react';
import { requireAuth, requirePermission } from '@/lib/dal';
import { prisma } from '@/lib/db';
import { POSCashierWorkspace } from '@/components/POSCashierWorkspace';

export default async function POSCashierPage() {
  // 1. Authorize permission
  const session = await requirePermission('pos:access');
  const employeeId = session.employeeId;

  // 2. Fetch active cashier info
  const employee = await prisma.employee.findUnique({
    where: { id: employeeId },
    include: { role: true }
  });

  if (!employee) {
    throw new Error('الموظف غير موجود');
  }

  // 3. Fetch all products, including accords, notes, and variants
  const productsRaw = await prisma.product.findMany({
    where: { isVisible: true },
    include: {
      category: true,
      variants: {
        where: { isActive: true }
      },
      notes: {
        orderBy: { displayOrder: 'asc' }
      },
      accords: {
        include: {
          accord: true
        },
        orderBy: { order: 'asc' }
      },
      liquidStock: true
    }
  });

  // Map to matching types for workspace component
  const products = productsRaw.map(p => ({
    id: p.id,
    nameAr: p.nameAr,
    nameEn: p.nameEn,
    sku: p.sku,
    shortDescription: p.shortDescription,
    stockStatus: p.stockStatus,
    inventoryMode: p.inventoryMode,
    category: { name: p.category.name },
    variants: p.variants,
    notes: p.notes,
    accords: p.accords.map(pa => ({
      value: pa.value,
      accord: {
        name: pa.accord.name,
        color: pa.accord.color
      }
    }))
  }));

  // 4. Fetch site settings
  const settingsRecords = await prisma.siteSettings.findMany();
  const settingsMap = new Map(settingsRecords.map(s => [s.key, s.value]));

  const taxEnabled = settingsMap.get('tax_enabled') === 'true';
  const taxRate = parseFloat(settingsMap.get('tax_rate') || '0');
  const pricesIncludeTax = settingsMap.get('prices_include_tax') !== 'false';

  // Load custom JSON-backed POS settings
  const posSettingsRecord = settingsRecords.find(s => s.key === 'pos_settings');
  let posSettings = {
    requireShiftToSell: true,
    defaultIdleLockSeconds: 240,
    allowManagerOverride: true,
    posIdleEnabled: true,
    posIdleTimeoutMinutes: 4,
    posIdleShowClock: true,
    posIdleShowDate: true,
    posIdleRequirePin: false,
    posIdleMessageAr: 'شاشة خمول مؤقتة - يرجى الضغط للمتابعة',
    posIdleMessageEn: 'Idle screen - Please press to continue',
    posSessionLifetimeHours: 15
  };
  if (posSettingsRecord) {
    try {
      posSettings = JSON.parse(posSettingsRecord.value);
    } catch {}
  }

  // 5. Calculate absolute session expiry time based on posSessionLifetimeHours
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
    <div className="h-full bg-[var(--color-ivory-100)]">
      <POSCashierWorkspace
        products={products}
        settings={{
          taxEnabled,
          taxRate,
          pricesIncludeTax,
          ...posSettings
        }}
        cashierName={employee.name}
        sessionExpiresAt={sessionExpiresAt}
      />
    </div>
  );
}
