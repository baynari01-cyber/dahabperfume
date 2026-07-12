# Dahab Perfumes - Route Inventory

This report lists all storefront, admin, and POS routes, classifying them by verification status and mapping them directly to source page files and associated server actions or services.

## Classifications
* **`IMPLEMENTED_AND_VERIFIED`**: Full backend and frontend coverage, successfully verified by unit/integration tests and local runs.
* **`PENDING_EXTERNAL_CREDENTIALS`**: Fully implemented code path, pending external production API tokens (e.g. Supabase Storage/CDN bucket provisioning, public WhatsApp API routing).

---

## 1. Storefront Routes

| Route Pattern | Source Page File | Associated Action / Service | Classification | Notes |
| :--- | :--- | :--- | :--- | :--- |
| `/[locale]` | `/[locale]/(public)/page.tsx` | N/A (Static Component) | `IMPLEMENTED_AND_VERIFIED` | Localization root landing page (defaults to `/ar`) |
| `/[locale]/shop` | `/[locale]/(public)/shop/page.tsx` | `prisma.product.findMany` | `IMPLEMENTED_AND_VERIFIED` | Lists public variants and stock status |
| `/[locale]/products/[slug]` | `/[locale]/(public)/products/[slug]/page.tsx` | `prisma.product.findUnique` | `IMPLEMENTED_AND_VERIFIED` | Product detail view with size selector |
| `/[locale]/collections` | `/[locale]/(public)/collections/page.tsx` | `prisma.collection.findMany` | `IMPLEMENTED_AND_VERIFIED` | Collections list view |
| `/[locale]/collections/[slug]` | `/[locale]/(public)/collections/[slug]/page.tsx` | `prisma.collection.findUnique` | `IMPLEMENTED_AND_VERIFIED` | Displays products in a specific collection |
| `/[locale]/wishlist` | `/[locale]/(public)/wishlist/page.tsx` | Client LocalStorage (no DB writes) | `IMPLEMENTED_AND_VERIFIED` | Client-side wishlist display |
| `/[locale]/cart` | `/[locale]/(public)/cart/page.tsx` | Client LocalStorage (no DB writes) | `IMPLEMENTED_AND_VERIFIED` | Client-side cart summary |
| `/[locale]/checkout` | `/[locale]/(public)/checkout/page.tsx` | `processCheckout` Server Action | `IMPLEMENTED_AND_VERIFIED` | Storefront checkout with shipping zone fee fetch |
| `/[locale]/order-success/[orderReference]` | `/[locale]/(public)/order-success/[orderReference]/page.tsx` | `prisma.order.findUnique` | `IMPLEMENTED_AND_VERIFIED` | Displays Order Summary. Does NOT generate Invoice. |
| `/[locale]/about` | `/[locale]/(public)/about/page.tsx` | `prisma.siteSettings.findUnique` | `IMPLEMENTED_AND_VERIFIED` | Brand story static CMS content |
| `/[locale]/contact` | `/[locale]/(public)/contact/page.tsx` | `prisma.siteSettings.findUnique` | `IMPLEMENTED_AND_VERIFIED` | Contact information static CMS content |
| `/[locale]/store-location` | `/[locale]/(public)/store-location/page.tsx` | `prisma.siteSettings.findUnique` | `IMPLEMENTED_AND_VERIFIED` | Store location and directions view |
| `/[locale]/shipping` | `/[locale]/(public)/shipping/page.tsx` | `prisma.siteSettings.findUnique` | `IMPLEMENTED_AND_VERIFIED` | Shipping policy static CMS content |
| `/[locale]/returns` | `/[locale]/(public)/returns/page.tsx` | `prisma.siteSettings.findUnique` | `IMPLEMENTED_AND_VERIFIED` | Returns policy static CMS content |
| `/[locale]/faq` | `/[locale]/(public)/faq/page.tsx` | `prisma.siteSettings.findUnique` | `IMPLEMENTED_AND_VERIFIED` | FAQs view |
| `/[locale]/privacy` | `/[locale]/(public)/privacy/page.tsx` | `prisma.siteSettings.findUnique` | `IMPLEMENTED_AND_VERIFIED` | Privacy policy view |
| `/[locale]/terms` | `/[locale]/(public)/terms/page.tsx` | `prisma.siteSettings.findUnique` | `IMPLEMENTED_AND_VERIFIED` | Terms of service view |

---

## 2. Admin Routes (Protected by session cookies & DAL permission checks)

| Route Pattern | Source Page File | Associated Action / Service | Classification | Notes |
| :--- | :--- | :--- | :--- | :--- |
| `/admin/login` | `/admin/login/page.tsx` | `login` (session creation action) | `IMPLEMENTED_AND_VERIFIED` | Custom server-side session token authentication |
| `/admin/login/mfa` | `/admin/login/mfa/page.tsx` | `verifyMfaLogin` (OTP check action) | `IMPLEMENTED_AND_VERIFIED` | Verification route for TOTP or emergency recovery codes |
| `/admin` | `/admin/page.tsx` | `requirePermission('manage:settings')` | `IMPLEMENTED_AND_VERIFIED` | Admin landing summary panel dashboard |
| `/admin/products` | `/admin/products/page.tsx` | `requirePermission('manage:settings')` | `IMPLEMENTED_AND_VERIFIED` | Lists products with active status filters |
| `/admin/products/new` | `/admin/products/new/page.tsx` | `createProduct` Action | `IMPLEMENTED_AND_VERIFIED` | Forms to add new product and variants |
| `/admin/products/[id]` | `/admin/products/[id]/page.tsx` | `updateProduct` Action | `IMPLEMENTED_AND_VERIFIED` | Form to edit product details |
| `/admin/categories` | `/admin/categories/page.tsx` | `requirePermission('manage:settings')` | `IMPLEMENTED_AND_VERIFIED` | Product category administration panel |
| `/admin/collections` | `/admin/collections/page.tsx` | `requirePermission('manage:settings')` | `IMPLEMENTED_AND_VERIFIED` | Collection administration panel |
| `/admin/orders` | `/admin/orders/page.tsx` | `requirePermission('pos:access')` | `IMPLEMENTED_AND_VERIFIED` | Lists storefront orders (`AWAITING_WHATSAPP`) |
| `/admin/orders/[id]` | `/admin/orders/[id]/page.tsx` | `confirmStorefrontOrder` Action | `IMPLEMENTED_AND_VERIFIED` | Order detail view; confirmation triggers stock deduction & Invoice |
| `/admin/sales` | `/admin/sales/page.tsx` | `requirePermission('void:sales')` | `IMPLEMENTED_AND_VERIFIED` | Lists completed sales with voiding capabilities |
| `/admin/inventory` | `/admin/inventory/page.tsx` | `requirePermission('manage:settings')` | `IMPLEMENTED_AND_VERIFIED` | Stock management panel for variants |
| `/admin/raw-materials` | `/admin/raw-materials/page.tsx` | `requirePermission('manage:settings')` | `IMPLEMENTED_AND_VERIFIED` | Raw material stock dashboard for formulas |
| `/admin/raw-materials/[id]` | `/admin/raw-materials/[id]/page.tsx` | `requirePermission('manage:settings')` | `IMPLEMENTED_AND_VERIFIED` | Raw material history detail view |
| `/admin/formulas` | `/admin/formulas/page.tsx` | `requirePermission('manage:settings')` | `IMPLEMENTED_AND_VERIFIED` | Formula recipes definition view |
| `/admin/employees` | `/admin/employees/page.tsx` | `requirePermission('manage:employees')` | `IMPLEMENTED_AND_VERIFIED` | Staff user account administration |
| `/admin/roles` | `/admin/roles/page.tsx` | `requirePermission('manage:employees')` | `IMPLEMENTED_AND_VERIFIED` | Security role administration panel |
| `/admin/permissions` | `/admin/permissions/page.tsx` | `requirePermission('manage:employees')` | `IMPLEMENTED_AND_VERIFIED` | System permission definitions mapping |
| `/admin/reports` | `/admin/reports/page.tsx` | `requirePermission('pos:access')` | `IMPLEMENTED_AND_VERIFIED` | Sales report metrics |
| `/admin/reports/employees` | `/admin/reports/employees/page.tsx` | `requirePermission('reports.employees')` | `IMPLEMENTED_AND_VERIFIED` | Sales performance totals and ticket sizing report |
| `/admin/reports/inventory-counts` | `/admin/reports/inventory-counts/page.tsx` | `requirePermission('reports.inventory_counts')` | `IMPLEMENTED_AND_VERIFIED` | Inventory variances and stale counting rates report |
| `/admin/content` | `/admin/content/page.tsx` | `requirePermission('manage:settings')` | `IMPLEMENTED_AND_VERIFIED` | CMS components styling / content editing |
| `/admin/content/homepage` | `/admin/content/homepage/page.tsx` | `requirePermission('manage:settings')` | `IMPLEMENTED_AND_VERIFIED` | CMS panel for homepage slides and location map configs |
| `/admin/media` | `/admin/media/page.tsx` | `requirePermission('manage:settings')` | `PENDING_EXTERNAL_CREDENTIALS` | Media uploads to Supabase Storage bucket |
| `/admin/settings` | `/admin/settings/page.tsx` | `requirePermission('manage:settings')` | `IMPLEMENTED_AND_VERIFIED` | Pricing rules, tax parameters, business configuration |
| `/admin/settings/pos` | `/admin/settings/pos/page.tsx` | `requirePermission('settings.pos')` | `IMPLEMENTED_AND_VERIFIED` | Shutter overlays and timeout duration settings |
| `/admin/settings/inventory` | `/admin/settings/inventory/page.tsx` | `requirePermission('manage:settings')` | `IMPLEMENTED_AND_VERIFIED` | Manages stocktaking configurations like blind counting |
| `/admin/security` | `/admin/security/page.tsx` | `requirePermission('manage:settings')` | `IMPLEMENTED_AND_VERIFIED` | Global security configurations |
| `/admin/audit-logs` | `/admin/audit-logs/page.tsx` | `requirePermission('manage:settings')` | `IMPLEMENTED_AND_VERIFIED` | Chronological audit log tracker |
| `/admin/imports` | `/admin/imports/page.tsx` | `requirePermission('manage:settings')` | `IMPLEMENTED_AND_VERIFIED` | Resumable importer controls |
| `/admin/inventory/counts` | `/admin/inventory/counts/page.tsx` | `requirePermission('inventory.counts.review')` | `IMPLEMENTED_AND_VERIFIED` | Lists and manages count sessions & approvals |
| `/admin/inventory/counts/new` | `/admin/inventory/counts/new/page.tsx` | `requirePermission('inventory.counts.create')` | `IMPLEMENTED_AND_VERIFIED` | Creates dynamic count sessions for staff |
| `/admin/inventory/counts/[id]` | `/admin/inventory/counts/[id]/page.tsx` | `requirePermission('inventory.counts.review')` | `IMPLEMENTED_AND_VERIFIED` | Visualizes count variances and approves session corrections |

---

## 3. POS Routes (Protected by session cookies & POS role permission check)

| Route Pattern | Source Page File | Associated Action / Service | Classification | Notes |
| :--- | :--- | :--- | :--- | :--- |
| `/pos/login` | `/pos/login/page.tsx` | `login` (session creation action) | `IMPLEMENTED_AND_VERIFIED` | Custom server-side session token authentication for POS cashiers |
| `/pos` | `/pos/page.tsx` | `requirePermission('pos:access')` | `IMPLEMENTED_AND_VERIFIED` | Redirects cashiers to POS counter |
| `/pos/cashier` | `/pos/cashier/page.tsx` | `requirePermission('pos:access')` | `IMPLEMENTED_AND_VERIFIED` | Mobile-optimized Cashier POS layout with activity and idle controls |
| `/pos/cashier/inventory-count` | `/pos/cashier/inventory-count/page.tsx` | `requirePermission('pos:access')` | `IMPLEMENTED_AND_VERIFIED` | In-store inventory stocktaking form with auto Liter-to-ML converter |
| `/pos/cashier/inventory-count/[id]` | `/pos/cashier/inventory-count/[id]/page.tsx` | `requirePermission('pos:access')` | `IMPLEMENTED_AND_VERIFIED` | Dynamic count session form with blind expected stock mask |
| `/pos/counter` | `/pos/counter/page.tsx` | `processPOSCheckout` Action | `IMPLEMENTED_AND_VERIFIED` | Redirects to canonical `/pos/cashier` |
| `/pos/invoices` | `/pos/invoices/page.tsx` | `requirePermission('pos:access')` | `IMPLEMENTED_AND_VERIFIED` | Chronological list of generated invoices with thermal preview triggers |
| `/pos/invoices/[id]` | `/pos/invoices/[id]/page.tsx` | `requirePermission('pos:access')` | `IMPLEMENTED_AND_VERIFIED` | Thermal receipt rendering page (printable receipt) |
| `/pos/report` | `/pos/report/page.tsx` | `requirePermission('pos:access')` | `IMPLEMENTED_AND_VERIFIED` | Cashier shift reports |
