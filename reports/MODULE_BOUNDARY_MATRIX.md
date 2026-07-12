# MODULE BOUNDARY MATRIX

This matrix tracks the compliance status of each logical business module boundary.

| Business Module | Directory / Code Boundary | Classification | Notes |
| :--- | :--- | :--- | :--- |
| **Storefront** | `src/app/[locale]/(public)/*` | **ALIGNED_AND_VERIFIED** | Decoupled client-facing views. |
| **Admin** | `src/app/admin/*` | **ALIGNED_AND_VERIFIED** | Restricted to admin roles. |
| **POS** | `src/app/pos/*`, `/pos/cashier` | **ALIGNED_AND_VERIFIED** | Main POS operating interface. |
| **Authentication** | `src/actions/auth.ts`, `src/lib/auth.ts` | **ALIGNED_AND_VERIFIED** | Cookie-based security. |
| **Authorization** | `src/lib/dal.ts` | **ALIGNED_AND_VERIFIED** | Enforces granular overrides. |
| **Employee Accounts** | `src/actions/employees.ts` | **ALIGNED_AND_VERIFIED** | Full CRUD capabilities. |
| **Product Catalog** | `src/app/admin/products/*`, Prisma | **ALIGNED_AND_VERIFIED** | Products schema definition. |
| **Categories** | `src/app/admin/categories/*` | **ALIGNED_AND_VERIFIED** | Category database boundaries. |
| **Collections** | `src/app/admin/collections/*` | **ALIGNED_AND_VERIFIED** | Collection management. |
| **Fragrance Accords** | `reports/fragrance-accords` | **ALIGNED_AND_VERIFIED** | Color-coded display panels. |
| **Pricing** | `src/actions/settings-crud.ts` | **ALIGNED_AND_VERIFIED** | Integer JOD fils representation. |
| **Finished Product Inventory** | `src/actions/pos.ts` | **ALIGNED_AND_VERIFIED** | Multi-variant unit counts. |
| **Direct Liquid Inventory** | `src/actions/pos.ts`, Prisma | **ALIGNED_AND_VERIFIED** | Direct ML deductions. |
| **Raw Material Inventory** | `src/actions/inventory-count.ts` | **ALIGNED_AND_VERIFIED** | Formula stock components. |
| **Product Formulas** | `src/actions/pos.ts`, Prisma | **ALIGNED_AND_VERIFIED** | Component ratio definitions. |
| **Availability** | `src/actions/homepage-cms.ts` | **ALIGNED_AND_VERIFIED** | Floor/min capacity checks. |
| **Sales** | `src/actions/pos.ts` | **ALIGNED_AND_VERIFIED** | Sale items snapshots. |
| **Payments** | `src/actions/pos.ts` | **ALIGNED_AND_VERIFIED** | Split payments processing. |
| **Invoices** | `src/actions/pos.ts` | **ALIGNED_AND_VERIFIED** | Thermal receipt generation. |
| **Returns** | `src/actions/pos.ts` | **ALIGNED_AND_VERIFIED** | Inventory restoration. |
| **Orders** | `src/actions/pos.ts` | **ALIGNED_AND_VERIFIED** | Storefront WhatsApp checkout. |
| **Shifts** | `src/actions/pos.ts` | **ALIGNED_AND_VERIFIED** | Session cash reconciliations. |
| **Employee Counts** | `src/actions/inventory-count.ts` | **ALIGNED_AND_VERIFIED** | Blind count stock version checks. |
| **Imports** | `src/actions/settings-crud.ts` | **ALIGNED_AND_VERIFIED** | Dry Run batch transactions. |
| **Reports** | `src/app/admin/reports/*` | **ALIGNED_AND_VERIFIED** | Detailed employee performance. |
| **CMS** | `src/actions/homepage-cms.ts` | **ALIGNED_AND_VERIFIED** | Hero slide carousel editor. |
| **Settings** | `src/actions/settings.ts` | **ALIGNED_AND_VERIFIED** | App config keys registry. |
| **Audit** | `src/lib/auth.ts`, Prisma | **ALIGNED_AND_VERIFIED** | Immutable action logs. |
| **Security** | `src/lib/totp.ts`, `src/lib/rate-limit.ts`| **ALIGNED_AND_VERIFIED** | Lockouts and CSRF checks. |
| **Caching** | Redis adapter | **ALIGNED_NOT_VERIFIED** | Public reads cache pipeline. |
| **Media** | Supabase Storage adapter | **PENDING_EXTERNAL_CREDENTIALS** | CDN bucket configurations. |
| **Integrations** | Maps, WhatsApp links | **ALIGNED_AND_VERIFIED** | External endpoints. |
