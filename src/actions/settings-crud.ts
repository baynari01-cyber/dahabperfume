'use server';

import { prisma } from '@/lib/db';
import { requirePermission } from '@/lib/dal';

/**
 * Common helper to save a settings object to SiteSettings key.
 */
async function saveSiteSettings(key: string, value: any, adminId: string, actionName: string) {
  const session = await requirePermission('manage:settings');
  const stringValue = JSON.stringify(value);

  const before = await prisma.siteSettings.findUnique({ where: { key } });
  
  await prisma.siteSettings.upsert({
    where: { key },
    update: { value: stringValue },
    create: { key, value: stringValue }
  });

  // Record audit log
  await prisma.auditLog.create({
    data: {
      employeeId: session.employeeId,
      action: actionName,
      entityType: 'SiteSettings',
      entityId: key,
      details: JSON.stringify({ before: before?.value || null, after: stringValue })
    }
  });

  return { success: true };
}

/**
 * Common helper to get a settings object.
 */
async function getSiteSettings<T>(key: string, defaultValue: T): Promise<T> {
  const settings = await prisma.siteSettings.findUnique({ where: { key } });
  if (!settings) return defaultValue;
  try {
    return JSON.parse(settings.value) as T;
  } catch {
    return defaultValue;
  }
}

// 1. Tax Settings
export async function getTaxSettings() {
  const settings = await prisma.globalPricingSettings.findUnique({ where: { id: '1' } });
  return {
    taxEnabled: settings?.taxEnabled ?? false,
    taxRate: settings?.taxRate ?? 0.0,
    pricesIncludeTax: settings?.pricesIncludeTax ?? true
  };
}

export async function updateTaxSettings(data: { taxEnabled: boolean; taxRate: number; pricesIncludeTax: boolean }, adminId: string) {
  try {
    const session = await requirePermission('manage:settings');
    const before = await prisma.globalPricingSettings.findUnique({ where: { id: '1' } });

    await prisma.globalPricingSettings.upsert({
      where: { id: '1' },
      update: {
        taxEnabled: data.taxEnabled,
        taxRate: data.taxRate,
        pricesIncludeTax: data.pricesIncludeTax
      },
      create: {
        id: '1',
        taxEnabled: data.taxEnabled,
        taxRate: data.taxRate,
        pricesIncludeTax: data.pricesIncludeTax
      }
    });

    await prisma.auditLog.create({
      data: {
        employeeId: session.employeeId,
        action: 'TAX_SETTINGS_UPDATED',
        entityType: 'GlobalPricingSettings',
        entityId: '1',
        details: JSON.stringify({ before, after: data })
      }
    });

    return { success: true };
  } catch (error: any) {
    return { success: false, error: error.message || 'فشل حفظ إعدادات الضريبة' };
  }
}

// 2. Shipping Settings
export async function getShippingZones() {
  return await prisma.shippingZone.findMany({
    orderBy: { nameAr: 'asc' }
  });
}

export async function updateShippingZone(data: { id?: string; nameAr: string; nameEn: string; fee: number; estimatedDeliveryTime: string; isEnabled: boolean }) {
  try {
    const session = await requirePermission('manage:settings');
    
    if (data.id) {
      const zone = await prisma.shippingZone.update({
        where: { id: data.id },
        data: {
          nameAr: data.nameAr,
          nameEn: data.nameEn,
          fee: data.fee,
          estimatedDeliveryTime: data.estimatedDeliveryTime,
          isEnabled: data.isEnabled
        }
      });
      await prisma.auditLog.create({
        data: {
          employeeId: session.employeeId,
          action: 'SHIPPING_ZONE_UPDATED',
          entityType: 'ShippingZone',
          entityId: zone.id,
          details: JSON.stringify(zone)
        }
      });
    } else {
      const zone = await prisma.shippingZone.create({
        data: {
          nameAr: data.nameAr,
          nameEn: data.nameEn,
          fee: data.fee,
          estimatedDeliveryTime: data.estimatedDeliveryTime,
          isEnabled: data.isEnabled
        }
      });
      await prisma.auditLog.create({
        data: {
          employeeId: session.employeeId,
          action: 'SHIPPING_ZONE_CREATED',
          entityType: 'ShippingZone',
          entityId: zone.id,
          details: JSON.stringify(zone)
        }
      });
    }
    return { success: true };
  } catch (error: any) {
    return { success: false, error: error.message || 'فشل حفظ منطقة الشحن' };
  }
}

export async function deleteShippingZone(id: string) {
  try {
    const session = await requirePermission('manage:settings');
    await prisma.shippingZone.delete({ where: { id } });
    await prisma.auditLog.create({
      data: {
        employeeId: session.employeeId,
        action: 'SHIPPING_ZONE_DELETED',
        entityType: 'ShippingZone',
        entityId: id,
        details: null
      }
    });
    return { success: true };
  } catch (error: any) {
    return { success: false, error: error.message || 'فشل حذف منطقة الشحن' };
  }
}

// 3. POS Settings
export interface POSSettings {
  requireShiftToSell: boolean;
  defaultIdleLockSeconds: number;
  allowManagerOverride: boolean;
  posIdleEnabled: boolean;
  posIdleTimeoutMinutes: number;
  posIdleShowClock: boolean;
  posIdleShowDate: boolean;
  posIdleRequirePin: boolean;
  posIdleMessageAr: string;
  posIdleMessageEn: string;
  posSessionLifetimeHours: number;
}
export async function getPOSSettings(): Promise<POSSettings> {
  return await getSiteSettings<POSSettings>('pos_settings', {
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
  });
}
export async function updatePOSSettings(data: POSSettings, adminId: string) {
  const session = await requirePermission('settings.pos');

  if (data.posIdleTimeoutMinutes < 1 || data.posIdleTimeoutMinutes > 60) {
    throw new Error('مهلة الخمول يجب أن تكون بين دقيقة و 60 دقيقة');
  }
  if (data.posSessionLifetimeHours < 1 || data.posSessionLifetimeHours > 24) {
    throw new Error('عمر الجلسة يجب أن يكون بين ساعة و 24 ساعة');
  }

  const key = 'pos_settings';
  const stringValue = JSON.stringify(data);
  const before = await prisma.siteSettings.findUnique({ where: { key } });
  
  await prisma.siteSettings.upsert({
    where: { key },
    update: { value: stringValue },
    create: { key, value: stringValue }
  });

  await prisma.auditLog.create({
    data: {
      employeeId: session.employeeId,
      action: 'POS_SETTINGS_UPDATED',
      entityType: 'SiteSettings',
      entityId: key,
      details: JSON.stringify({ before: before?.value ? JSON.parse(before.value) : null, after: data })
    }
  });

  return { success: true };
}

// 4. Security Settings
export interface SecuritySettings {
  passwordMinLength: number;
  requireMFA: boolean;
  maxLoginAttempts: number;
}
export async function getSecuritySettings(): Promise<SecuritySettings> {
  return await getSiteSettings<SecuritySettings>('security_settings', {
    passwordMinLength: 15,
    requireMFA: true,
    maxLoginAttempts: 5
  });
}
export async function updateSecuritySettings(data: SecuritySettings, adminId: string) {
  return await saveSiteSettings('security_settings', data, adminId, 'SECURITY_SETTINGS_UPDATED');
}

// 5. Backups Settings
export async function triggerBackupDownload() {
  const session = await requirePermission('manage:settings');
  const categories = await prisma.category.findMany();
  const products = await prisma.product.findMany();
  const variants = await prisma.productVariant.findMany();

  const backupData = {
    timestamp: new Date().toISOString(),
    categories,
    products,
    variants
  };

  await prisma.auditLog.create({
    data: {
      employeeId: session.employeeId,
      action: 'DATABASE_BACKUP_EXPORTED',
      entityType: 'SystemBackup',
      entityId: 'export',
      details: JSON.stringify({ itemsCount: products.length })
    }
  });

  return JSON.stringify(backupData, null, 2);
}

// 6. Notifications Settings
export interface NotificationsSettings {
  whatsappNotifications: boolean;
  whatsappNumber: string;
  emailAlerts: boolean;
}
export async function getNotificationsSettings(): Promise<NotificationsSettings> {
  return await getSiteSettings<NotificationsSettings>('notifications_settings', {
    whatsappNotifications: false,
    whatsappNumber: '',
    emailAlerts: false
  });
}
export async function updateNotificationsSettings(data: NotificationsSettings, adminId: string) {
  return await saveSiteSettings('notifications_settings', data, adminId, 'NOTIFICATIONS_SETTINGS_UPDATED');
}

// 7. Integrations Settings
export interface IntegrationsSettings {
  supabaseStorageUrl: string;
  whatsappGatewayApiKey: string;
}
export async function getIntegrationsSettings(): Promise<IntegrationsSettings> {
  return await getSiteSettings<IntegrationsSettings>('integrations_settings', {
    supabaseStorageUrl: '',
    whatsappGatewayApiKey: ''
  });
}
export async function updateIntegrationsSettings(data: IntegrationsSettings, adminId: string) {
  return await saveSiteSettings('integrations_settings', data, adminId, 'INTEGRATIONS_SETTINGS_UPDATED');
}

// 8. SEO Settings
export interface SEOSettings {
  metaTitleAr: string;
  metaTitleEn: string;
  metaDescriptionAr: string;
  metaDescriptionEn: string;
}
export async function getSEOSettings(): Promise<SEOSettings> {
  return await getSiteSettings<SEOSettings>('seo_settings', {
    metaTitleAr: 'دهب للعطور',
    metaTitleEn: 'Dahab Perfumes',
    metaDescriptionAr: 'متجر عطور دهب الفاخرة عطور فرنسية بجودة عالية وأسعار منافسة',
    metaDescriptionEn: 'Luxury Dahab Perfumes online store'
  });
}
export async function updateSEOSettings(data: SEOSettings, adminId: string) {
  return await saveSiteSettings('seo_settings', data, adminId, 'SEO_SETTINGS_UPDATED');
}

// 9. Localization Settings
export interface LocalizationSettings {
  defaultLocale: string;
  supportedLocales: string[];
}
export async function getLocalizationSettings(): Promise<LocalizationSettings> {
  return await getSiteSettings<LocalizationSettings>('localization_settings', {
    defaultLocale: 'ar',
    supportedLocales: ['ar', 'en']
  });
}
export async function updateLocalizationSettings(data: LocalizationSettings, adminId: string) {
  return await saveSiteSettings('localization_settings', data, adminId, 'LOCALIZATION_SETTINGS_UPDATED');
}
