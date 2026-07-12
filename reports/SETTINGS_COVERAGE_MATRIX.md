# SETTINGS COVERAGE MATRIX

This matrix tracks the compliance, database representation, schema validation, and runtime enforcement for all Dahab Perfumes configuration settings.

---

## 1. Settings Runtime Specifications

| Setting Key / Field | Database Key / Model | Validation Schema | Admin Page Route | Permission Key | Runtime Consumer | Audit Event Name | Verification Test Case |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **Global Pricing** | `global_size_prices` (`SiteSettings`) | Map of `size` (string) to `price` (int) | `/admin/settings/pricing` | `settings.pricing` | central price updater | `GLOBAL_PRICING_UPDATED` | `rbac-and-pricing.test.ts` |
| **Custom Pricing** | `usesGlobalPricing` (`ProductVariant`) | `z.boolean()` | `/admin/products/[id]` | `products.edit` | POS price calculator | `PRODUCT_UPDATED` | `rbac-and-pricing.test.ts` |
| **Tax** | `GlobalPricingSettings` model | `z.object({...})` | `/admin/settings/tax` | `settings.tax` | Checkout calculator | `TAX_SETTINGS_UPDATED` | `tax-and-invoice.test.ts` |
| **Shipping** | `ShippingZone` model | `z.object({...})` | `/admin/settings/shipping` | `settings.shipping` | Checkout shipping | `SHIPPING_ZONE_CREATED` | `checkout.test.ts` |
| **POS Idle Duration** | `posIdleTimeoutMinutes` in `pos_settings` | `z.number().min(1).max(60)` | `/admin/settings/pos` | `settings.pos` | Idle lockout timer | `POS_SETTINGS_UPDATED` | `pos-idle-session.test.ts` |
| **POS Session Duration**| `posSessionMaxHours` in `pos_settings` | `z.number().min(1).max(24)` | `/admin/settings/pos` | `settings.pos` | Session validation check | `POS_SETTINGS_UPDATED` | `pos-idle-session.test.ts` |
| **Formula Policy** | `formula_policy` (`SiteSettings`) | `z.object({...})` | `/admin/settings/inventory`| `settings.inventory` | Formula consumption engine | `INVENTORY_SETTINGS_UPDATED` | `concurrency-verification.test.ts` |
| **Inventory Threshold** | `inventory_threshold` (`SiteSettings`) | `z.object({...})` | `/admin/settings/inventory`| `settings.inventory` | Threshold warning checks | `INVENTORY_SETTINGS_UPDATED` | `unverified-stock.test.ts` |
| **Checkout Policy** | `checkout_policy` (`SiteSettings`) | `z.object({...})` | `/admin/settings/pos` | `settings.pos` | Checkout process flow | `POS_SETTINGS_UPDATED` | `pos.test.ts` |
| **WhatsApp** | `whatsapp_order_settings` (`SiteSettings`) | `z.object({...})` | `/admin/settings/localization`| `settings.local` | Storefront WhatsApp link | `LOCALIZATION_UPDATED` | `checkout.test.ts` |
| **Invoice Settings** | `invoice_settings` (`SiteSettings`) | `z.object({...})` | `/admin/settings/tax` | `settings.tax` | Invoice generator | `TAX_SETTINGS_UPDATED` | `tax-and-invoice.test.ts` |
| **Import Policy** | `import_policy` (`SiteSettings`) | `z.object({...})` | `/admin/settings/backups` | `settings.backups` | Importer execution rules | `BACKUP_SETTINGS_UPDATED` | `admin-imports.test.ts` |
| **Cache Settings** | `cache_settings` (`SiteSettings`) | `z.object({...})` | `/admin/settings/security` | `settings.security` | Cache version counter | `CACHE_SETTINGS_UPDATED` | `cache-invalidation.test.ts` |
| **Maps** | `StoreLocationSettings` model | `z.object({...})` | `/admin/content/homepage` | `content.homepage` | Homepage footer map component | `STORE_LOCATION_UPDATED` | `homepage-cms.test.ts` |
| **Hero Carousel** | `HomepageHeroCarouselSettings` model | `z.object({...})` | `/admin/content/homepage` | `content.homepage` | Public Carousel component | `UPDATE_HERO_CAROUSEL_SETTINGS` | `homepage-cms.test.ts` |
| **SEO** | `seo_settings` (`SiteSettings`) | `z.object({...})` | `/admin/settings/seo` | `settings.seo` | Public layout meta tags | `SEO_SETTINGS_UPDATED` | `checkout.test.ts` |
