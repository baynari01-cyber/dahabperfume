# Current Implementation Evidence

## Current Branch
```
dahab-rebuild
```
## Current Commit Hash
```
53bd9dc6a90c826b36598a84c729498299242506
```
## Git Status
```
 M playwright-report/index.html
 M prisma/schema.prisma
 M reports/ADMIN_POS_CURRENT_GAP_AUDIT.md
 M reports/CURRENT_IMPLEMENTATION_EVIDENCE.md
 M reports/ROUTE_INVENTORY.md
 M reports/product-import-report.md
 D scripts/check-prices.ts
 M scripts/import-products.ts
 M src/actions/employees.ts
 M src/actions/pos.ts
 M src/actions/settings.ts
 M src/app/pos/layout.tsx
 M src/app/pos/page.tsx
 M src/components/AdminSidebar.tsx
 M src/lib/auth.ts
 M src/lib/dal.ts
 M src/lib/db.ts
 M src/tests/auth.test.ts
 M src/tests/integration-concurrency.test.ts
 M src/tests/rbac-and-pricing.test.ts
 M src/tests/tax-and-invoice.test.ts
?? prisma/migrations/20260712173000_add_advanced_security_and_pos_models/
?? prisma/migrations/20260712173100_add_session_last_activity/
?? prisma/migrations/20260712180205_add_liquid_inventory_and_counts/
?? public/logo-dahab.jpg
?? src/actions/inventory-count.ts
?? src/actions/settings-crud.ts
?? src/app/admin/inventory/counts/
?? src/app/admin/settings/backups/
?? src/app/admin/settings/integrations/
?? src/app/admin/settings/inventory/
?? src/app/admin/settings/localization/
?? src/app/admin/settings/notifications/
?? src/app/admin/settings/pos/
?? src/app/admin/settings/security/
?? src/app/admin/settings/seo/
?? src/app/admin/settings/shipping/
?? src/app/admin/settings/tax/
?? src/app/pos/cashier/
?? src/components/MainAccordsBars.tsx
?? src/components/POSCashierInventoryCountForm.tsx
?? src/components/POSCashierWorkspace.tsx
?? src/lib/password-policy.ts
?? src/lib/rate-limit.ts
?? src/lib/totp.ts
?? src/tests/employee-count.test.ts
?? src/tests/pos-idle-session.test.ts
?? src/tests/security-controls.test.ts
```
## Git Diff Stat (Against initial)
```
 .gitignore                                         |   2 +
 e2e/auth.spec.ts                                   |  18 +
 e2e/comprehensive.spec.ts                          |  74 ++
 eslint.config.mjs                                  |  12 +
 generate-evidence.sh                               |  66 ++
 next.config.ts                                     |  10 +-
 package.json                                       |  19 +-
 playwright-report/index.html                       |  90 +++
 playwright.config.ts                               |  26 +
 pnpm-lock.yaml                                     | 234 ++++++
 pnpm-workspace.yaml                                |   1 +
 prisma.config.ts                                   |   4 +-
 .../20260712121400_init_full_erp/migration.sql     | 616 ++++++++++++++++
 .../migration.sql                                  |  13 +
 .../migration.sql                                  |   4 +
 .../migration.sql                                  |   6 +
 .../migration.sql                                  |   5 +
 .../migration.sql                                  |  12 +
 .../migration.sql                                  |   9 +
 .../migration.sql                                  |  17 +
 .../migration.sql                                  |  21 +
 .../migration.sql                                  |  18 +
 prisma/migrations/migration_lock.toml              |   3 +
 prisma/schema.prisma                               | 800 ++++++++++++++-------
 reports/ADMIN_POS_CURRENT_GAP_AUDIT.md             |  25 +
 reports/ADMIN_POS_FEATURE_MATRIX.md                |  11 +
 reports/ADMIN_POS_SECURITY_CONTROL_MATRIX.md       |  14 +
 reports/CURRENT_IMPLEMENTATION_EVIDENCE.md         |  63 ++
 reports/FEATURE_MATRIX.md                          |  71 ++
 reports/FINAL_REPORT.md                            |  57 ++
 reports/ROUTE_INVENTORY.md                         |  79 ++
 reports/invalid-products.csv                       |   0
 reports/missing-images.csv                         |   2 +
 reports/product-import-report.json                 |   8 +
 reports/product-import-report.md                   |  14 +
 reports/skipped-template-rows.csv                  | 672 +++++++++++++++++
 reports/walkthrough.md                             |  88 +++
 scripts/analyze-csv-notes.ts                       |  41 ++
 scripts/analyze-csv.ts                             |  84 +++
 scripts/analyze-import.ts                          |  77 ++
 scripts/check-csv-cols.ts                          |  23 +
 scripts/check-reasons.ts                           |  22 +
 scripts/count-visible.ts                           |  19 +
 scripts/create-admin.ts                            | 194 +++++
 scripts/create-shadow-db.ts                        |  19 +
 scripts/db-counts.ts                               |  47 ++
 scripts/drop-all-tables.ts                         |  25 +
 scripts/generate-routes.ts                         | 206 ++++++
 scripts/import-products.ts                         | 295 ++++++++
 src/actions/auth.ts                                | 142 ++++
 src/actions/checkout.ts                            | 208 ++++++
 src/actions/employees.ts                           | 361 ++++++++++
 src/actions/orders.ts                              | 353 +++++++++
 src/actions/pos.ts                                 | 639 ++++++++++++++++
 src/actions/settings.ts                            |  91 +++
 src/app/[locale]/(public)/about/page.tsx           |  55 ++
 src/app/[locale]/(public)/cart/page.tsx            | 165 +++++
 src/app/[locale]/(public)/checkout/page.tsx        | 226 ++++++
 .../[locale]/(public)/collections/[slug]/page.tsx  | 102 +++
 src/app/[locale]/(public)/collections/page.tsx     |  66 ++
 src/app/[locale]/(public)/contact/page.tsx         | 100 +++
 src/app/[locale]/(public)/faq/page.tsx             |  54 ++
 src/app/[locale]/(public)/layout.tsx               |  25 +
 .../order-success/[orderReference]/page.tsx        |  95 +++
 src/app/[locale]/(public)/page.tsx                 |  92 +++
 src/app/[locale]/(public)/privacy/page.tsx         |  52 ++
 src/app/[locale]/(public)/products/[slug]/page.tsx | 151 ++++
 src/app/[locale]/(public)/returns/page.tsx         |  52 ++
 src/app/[locale]/(public)/shipping/page.tsx        |  69 ++
 src/app/[locale]/(public)/shop/page.tsx            | 116 +++
 src/app/[locale]/(public)/store-location/page.tsx  |  50 ++
 src/app/[locale]/(public)/terms/page.tsx           |  52 ++
 src/app/[locale]/(public)/wishlist/page.tsx        | 104 +++
 src/app/admin/audit-logs/page.tsx                  |  73 ++
 src/app/admin/categories/page.tsx                  |  89 +++
 src/app/admin/collections/page.tsx                 |  87 +++
 src/app/admin/content/page.tsx                     | 136 ++++
 src/app/admin/employees/page.tsx                   | 326 +++++++++
 src/app/admin/formulas/page.tsx                    |  81 +++
 src/app/admin/imports/page.tsx                     |  41 ++
 src/app/admin/inventory/page.tsx                   |  75 ++
 src/app/admin/layout.tsx                           |  28 +
 src/app/admin/login/page.tsx                       |  72 ++
 src/app/admin/media/page.tsx                       |  48 ++
 src/app/admin/orders/[id]/page.tsx                 | 172 +++++
 src/app/admin/orders/page.tsx                      |  85 +++
 src/app/admin/page.tsx                             | 128 ++++
 src/app/admin/permissions/page.tsx                 |  48 ++
 src/app/admin/products/[id]/page.tsx               |  48 ++
 src/app/admin/products/new/page.tsx                |  48 ++
 src/app/admin/products/page.tsx                    | 103 +++
 src/app/admin/raw-materials/[id]/page.tsx          |  48 ++
 src/app/admin/raw-materials/page.tsx               |  81 +++
 src/app/admin/reports/page.tsx                     |  90 +++
 src/app/admin/roles/page.tsx                       |  48 ++
 src/app/admin/sales/page.tsx                       |  84 +++
 src/app/admin/security/page.tsx                    |  48 ++
 src/app/admin/settings/page.tsx                    |  63 ++
 src/app/admin/settings/pricing/page.tsx            | 105 +++
 src/app/api/auth/permissions/route.ts              |  16 +
 src/app/api/shipping-zones/route.ts                |  14 +
 src/app/globals.css                                |  39 +-
 src/app/layout.tsx                                 |  29 +-
 src/app/page.tsx                                   |  65 --
 src/app/pos/counter/page.tsx                       |  27 +
 src/app/pos/invoices/[id]/page.tsx                 |  27 +
 src/app/pos/invoices/page.tsx                      |  27 +
 src/app/pos/layout.tsx                             | 100 +++
 src/app/pos/login/page.tsx                         |  27 +
 src/app/pos/page.tsx                               |   5 +
 src/app/pos/report/page.tsx                        |  27 +
 src/components/AdminSidebar.tsx                    | 130 ++++
 src/components/Footer.tsx                          |  87 +++
 src/components/Header.tsx                          |  43 ++
 src/components/POSCounter.tsx                      | 471 ++++++++++++
 src/lib/auth.ts                                    | 155 ++++
 src/lib/cms.ts                                     |  20 +
 src/lib/dal.ts                                     |  93 +++
 src/lib/db.ts                                      |  29 +
 src/lib/money.ts                                   | 114 +++
 src/proxy.ts                                       |  58 ++
 src/tests/auth.test.ts                             | 152 ++++
 src/tests/checkout.test.ts                         | 114 +++
 src/tests/concurrency.test.ts                      |  73 ++
 src/tests/idempotency-snapshot.test.ts             |  88 +++
 src/tests/integration-concurrency.test.ts          | 316 ++++++++
 src/tests/models-immutability.test.ts              |  32 +
 src/tests/order-confirmation.test.ts               | 163 +++++
 src/tests/permissions.test.ts                      |  33 +
 src/tests/pos.test.ts                              | 174 +++++
 src/tests/pricing.test.ts                          |  25 +
 src/tests/rbac-and-pricing.test.ts                 | 180 +++++
 src/tests/tax-and-invoice.test.ts                  | 744 +++++++++++++++++++
 src/tests/unverified-stock.test.ts                 |  40 ++
 test-results/.last-run.json                        |   4 +
 tsconfig.e2e.json                                  |  12 +
 tsconfig.json                                      |   2 +-
 vitest.config.ts                                   |  15 +
 138 files changed, 13331 insertions(+), 350 deletions(-)
```
## Complete File List
```
docs/CSV_COLUMN_MAPPING.md
docs/DEPENDENCY_VERSIONS.md
prisma/migrations/20260712121400_init_full_erp/migration.sql
prisma/migrations/20260712121500_add_shipping_zones/migration.sql
prisma/migrations/20260712121600_add_lockout_fields/migration.sql
prisma/migrations/20260712121700_add_idempotency_to_order/migration.sql
prisma/migrations/20260712121800_add_review_and_stock_status_fields/migration.sql
prisma/migrations/20260712133140_add_tax_settings_and_invoice_snapshots/migration.sql
prisma/migrations/20260712133200_link_invoice_to_order/migration.sql
prisma/migrations/20260712134706_add_accounting_integrity_fields/migration.sql
prisma/migrations/20260712165500_rename_invoice_fields_to_fils/migration.sql
prisma/migrations/20260712171500_add_employee_permissions_and_pins/migration.sql
prisma/migrations/20260712173000_add_advanced_security_and_pos_models/migration.sql
prisma/migrations/20260712173100_add_session_last_activity/migration.sql
prisma/migrations/20260712180205_add_liquid_inventory_and_counts/migration.sql
prisma/migrations/migration_lock.toml
prisma/schema.prisma
scripts/analyze-csv-notes.ts
scripts/analyze-csv.ts
scripts/analyze-import.ts
scripts/check-csv-cols.ts
scripts/check-reasons.ts
scripts/count-visible.ts
scripts/create-admin.ts
scripts/create-shadow-db.ts
scripts/db-counts.ts
scripts/drop-all-tables.ts
scripts/generate-routes.ts
scripts/import-products.ts
src/actions/auth.ts
src/actions/checkout.ts
src/actions/employees.ts
src/actions/inventory-count.ts
src/actions/orders.ts
src/actions/pos.ts
src/actions/settings-crud.ts
src/actions/settings.ts
src/app/admin/audit-logs/page.tsx
src/app/admin/categories/page.tsx
src/app/admin/collections/page.tsx
src/app/admin/content/page.tsx
src/app/admin/employees/page.tsx
src/app/admin/formulas/page.tsx
src/app/admin/imports/page.tsx
src/app/admin/inventory/counts/page.tsx
src/app/admin/inventory/page.tsx
src/app/admin/layout.tsx
src/app/admin/login/page.tsx
src/app/admin/media/page.tsx
src/app/admin/orders/[id]/page.tsx
src/app/admin/orders/page.tsx
src/app/admin/page.tsx
src/app/admin/permissions/page.tsx
src/app/admin/products/[id]/page.tsx
src/app/admin/products/new/page.tsx
src/app/admin/products/page.tsx
src/app/admin/raw-materials/[id]/page.tsx
src/app/admin/raw-materials/page.tsx
src/app/admin/reports/page.tsx
src/app/admin/roles/page.tsx
src/app/admin/sales/page.tsx
src/app/admin/security/page.tsx
src/app/admin/settings/backups/page.tsx
src/app/admin/settings/integrations/page.tsx
src/app/admin/settings/inventory/page.tsx
src/app/admin/settings/localization/page.tsx
src/app/admin/settings/notifications/page.tsx
src/app/admin/settings/page.tsx
src/app/admin/settings/pos/page.tsx
src/app/admin/settings/pricing/page.tsx
src/app/admin/settings/security/page.tsx
src/app/admin/settings/seo/page.tsx
src/app/admin/settings/shipping/page.tsx
src/app/admin/settings/tax/page.tsx
src/app/api/auth/permissions/route.ts
src/app/api/shipping-zones/route.ts
src/app/favicon.ico
src/app/globals.css
src/app/layout.tsx
src/app/[locale]/(public)/about/page.tsx
src/app/[locale]/(public)/cart/page.tsx
src/app/[locale]/(public)/checkout/page.tsx
src/app/[locale]/(public)/collections/page.tsx
src/app/[locale]/(public)/collections/[slug]/page.tsx
src/app/[locale]/(public)/contact/page.tsx
src/app/[locale]/(public)/faq/page.tsx
src/app/[locale]/(public)/layout.tsx
src/app/[locale]/(public)/order-success/[orderReference]/page.tsx
src/app/[locale]/(public)/page.tsx
src/app/[locale]/(public)/privacy/page.tsx
src/app/[locale]/(public)/products/[slug]/page.tsx
src/app/[locale]/(public)/returns/page.tsx
src/app/[locale]/(public)/shipping/page.tsx
src/app/[locale]/(public)/shop/page.tsx
src/app/[locale]/(public)/store-location/page.tsx
src/app/[locale]/(public)/terms/page.tsx
src/app/[locale]/(public)/wishlist/page.tsx
src/app/pos/cashier/inventory-count/page.tsx
src/app/pos/cashier/page.tsx
src/app/pos/counter/page.tsx
src/app/pos/invoices/[id]/page.tsx
src/app/pos/invoices/page.tsx
src/app/pos/layout.tsx
src/app/pos/login/page.tsx
src/app/pos/page.tsx
src/app/pos/report/page.tsx
src/components/AdminSidebar.tsx
src/components/Footer.tsx
src/components/Header.tsx
src/components/MainAccordsBars.tsx
src/components/POSCashierInventoryCountForm.tsx
src/components/POSCashierWorkspace.tsx
src/components/POSCounter.tsx
src/lib/auth.ts
src/lib/cms.ts
src/lib/dal.ts
src/lib/db.ts
src/lib/money.ts
src/lib/password-policy.ts
src/lib/rate-limit.ts
src/lib/totp.ts
src/proxy.ts
src/tests/auth.test.ts
src/tests/checkout.test.ts
src/tests/concurrency.test.ts
src/tests/employee-count.test.ts
src/tests/idempotency-snapshot.test.ts
src/tests/integration-concurrency.test.ts
src/tests/models-immutability.test.ts
src/tests/order-confirmation.test.ts
src/tests/permissions.test.ts
src/tests/pos-idle-session.test.ts
src/tests/pos.test.ts
src/tests/pricing.test.ts
src/tests/rbac-and-pricing.test.ts
src/tests/security-controls.test.ts
src/tests/tax-and-invoice.test.ts
src/tests/unverified-stock.test.ts
```
## package.json
```json
{
  "name": "dahab-perfumes",
  "version": "0.1.0",
  "private": true,
  "scripts": {
    "dev": "next dev",
    "build": "prisma generate && next build",
    "start": "next start",
    "lint": "eslint .",
    "typecheck": "tsc --noEmit",
    "typecheck:e2e": "tsc --noEmit -p tsconfig.e2e.json",
    "test": "pnpm test:migrate && node --env-file=.env node_modules/vitest/vitest.mjs run --pool=forks --fileParallelism=false",
    "test:migrate": "DATABASE_URL=postgres://postgres:postgres@localhost:51214/dahab_test?sslmode=disable DIRECT_URL=postgres://postgres:postgres@localhost:51214/dahab_test?sslmode=disable prisma migrate deploy",
    "test:e2e": "playwright test",
    "prisma:generate": "prisma generate",
    "prisma:migrate": "prisma migrate deploy",
    "prisma:seed": "tsx --env-file=.env scripts/create-admin.ts",
    "import:products": "tsx --env-file=.env scripts/import-products.ts",
    "create:admin": "tsx --env-file=.env scripts/create-admin.ts"
  },
  "dependencies": {
    "@hookform/resolvers": "^5.4.0",
    "@prisma/adapter-pg": "^7.8.0",
    "@prisma/client": "^7.8.0",
    "@supabase/supabase-js": "^2.110.2",
    "argon2": "^0.44.0",
    "csv-parse": "^7.0.1",
    "next": "16.2.10",
    "pg": "^8.22.0",
    "react": "19.2.4",
    "react-dom": "19.2.4",
    "react-hook-form": "^7.81.0",
    "server-only": "^0.0.1",
    "tailwindcss-animate": "^1.0.7",
    "zod": "^4.4.3"
  },
  "devDependencies": {
    "@playwright/test": "^1.61.1",
    "@tailwindcss/postcss": "^4",
    "@testing-library/dom": "^10.4.1",
    "@testing-library/react": "^16.3.2",
    "@types/node": "^20",
    "@types/papaparse": "^5.5.2",
    "@types/pg": "^8.20.0",
    "@types/react": "^19",
    "@types/react-dom": "^19",
    "@vitejs/plugin-react": "^6.0.3",
    "eslint": "^9",
    "eslint-config-next": "16.2.10",
    "jsdom": "^29.1.1",
    "papaparse": "^5.5.4",
    "prisma": "^7.8.0",
    "tailwindcss": "^4",
    "tsx": "^4.23.0",
    "typescript": "^5",
    "vitest": "^4.1.10"
  }
}
```
## pnpm list --depth=0
```
Legend: production dependency, optional only, dev only

dahab-perfumes@0.1.0 /home/moayad/Desktop/main avtivity/dahab-perfumes (PRIVATE)
│
│   dependencies:
├── @hookform/resolvers@5.4.0
├── @prisma/adapter-pg@7.8.0
├── @prisma/client@7.8.0
├── @supabase/supabase-js@2.110.2
├── argon2@0.44.0
├── csv-parse@7.0.1
├── next@16.2.10
├── pg@8.22.0
├── react@19.2.4
├── react-dom@19.2.4
├── react-hook-form@7.81.0
├── server-only@0.0.1
├── tailwindcss-animate@1.0.7
├── zod@4.4.3
│
│   devDependencies:
├── @playwright/test@1.61.1
├── @tailwindcss/postcss@4.3.2
├── @testing-library/dom@10.4.1
├── @testing-library/react@16.3.2
├── @types/node@20.19.43
├── @types/papaparse@5.5.2
├── @types/pg@8.20.0
├── @types/react@19.2.17
├── @types/react-dom@19.2.3
├── @vitejs/plugin-react@6.0.3
├── eslint@9.39.5
├── eslint-config-next@16.2.10
├── jsdom@29.1.1
├── papaparse@5.5.4
├── prisma@7.8.0
├── tailwindcss@4.3.2
├── tsx@4.23.0
├── typescript@5.9.3
└── vitest@4.1.10

33 packages
```
## Complete Route Tree
```
src/app/admin/audit-logs/page.tsx
src/app/admin/categories/page.tsx
src/app/admin/collections/page.tsx
src/app/admin/content/page.tsx
src/app/admin/employees/page.tsx
src/app/admin/formulas/page.tsx
src/app/admin/imports/page.tsx
src/app/admin/inventory/counts/page.tsx
src/app/admin/inventory/page.tsx
src/app/admin/layout.tsx
src/app/admin/login/page.tsx
src/app/admin/media/page.tsx
src/app/admin/orders/[id]/page.tsx
src/app/admin/orders/page.tsx
src/app/admin/page.tsx
src/app/admin/permissions/page.tsx
src/app/admin/products/[id]/page.tsx
src/app/admin/products/new/page.tsx
src/app/admin/products/page.tsx
src/app/admin/raw-materials/[id]/page.tsx
src/app/admin/raw-materials/page.tsx
src/app/admin/reports/page.tsx
src/app/admin/roles/page.tsx
src/app/admin/sales/page.tsx
src/app/admin/security/page.tsx
src/app/admin/settings/backups/page.tsx
src/app/admin/settings/integrations/page.tsx
src/app/admin/settings/inventory/page.tsx
src/app/admin/settings/localization/page.tsx
src/app/admin/settings/notifications/page.tsx
src/app/admin/settings/page.tsx
src/app/admin/settings/pos/page.tsx
src/app/admin/settings/pricing/page.tsx
src/app/admin/settings/security/page.tsx
src/app/admin/settings/seo/page.tsx
src/app/admin/settings/shipping/page.tsx
src/app/admin/settings/tax/page.tsx
src/app/layout.tsx
src/app/[locale]/(public)/about/page.tsx
src/app/[locale]/(public)/cart/page.tsx
src/app/[locale]/(public)/checkout/page.tsx
src/app/[locale]/(public)/collections/page.tsx
src/app/[locale]/(public)/collections/[slug]/page.tsx
src/app/[locale]/(public)/contact/page.tsx
src/app/[locale]/(public)/faq/page.tsx
src/app/[locale]/(public)/layout.tsx
src/app/[locale]/(public)/order-success/[orderReference]/page.tsx
src/app/[locale]/(public)/page.tsx
src/app/[locale]/(public)/privacy/page.tsx
src/app/[locale]/(public)/products/[slug]/page.tsx
src/app/[locale]/(public)/returns/page.tsx
src/app/[locale]/(public)/shipping/page.tsx
src/app/[locale]/(public)/shop/page.tsx
src/app/[locale]/(public)/store-location/page.tsx
src/app/[locale]/(public)/terms/page.tsx
src/app/[locale]/(public)/wishlist/page.tsx
src/app/pos/cashier/inventory-count/page.tsx
src/app/pos/cashier/page.tsx
src/app/pos/counter/page.tsx
src/app/pos/invoices/[id]/page.tsx
src/app/pos/invoices/page.tsx
src/app/pos/layout.tsx
src/app/pos/login/page.tsx
src/app/pos/page.tsx
src/app/pos/report/page.tsx
```
## Complete Prisma Model List
```prisma
model Employee {
model EmployeePermission {
model Role {
model Permission {
model RolePermission {
model Session {
model LoginAttempt {
model Product {
model ProductVariant {
model ProductImage {
model Category {
model Collection {
model Gender {
model Season {
model FragranceFamily {
model Accord {
model ProductAccord {
model ProductNote {
model Order {
model OrderItem {
model OrderStatusHistory {
model Sale {
model SaleItem {
model Payment {
model Invoice {
model Return {
model ReturnItem {
model RawMaterialCategory {
model RawMaterial {
model RawMaterialStock {
model RawMaterialMovement {
model ProductFormula {
model ProductFormulaItem {
model ConsumptionRecord {
model InventoryMovement {
model StockAdjustment {
model AuditLog {
model SiteSettings {
model GlobalPricingSettings {
model ShippingZone {
model RateLimitEvent {
model Shift {
model HeldSale {
model ProductLiquidStock {
model ProductLiquidMovement {
model InventoryCountSession {
model InventoryCountLine {
```
## Existing Test File List
```
./e2e/auth.spec.ts
./e2e/comprehensive.spec.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/discriminated-unions.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/recursive-types.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/nullable.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/file.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/nested-refine.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/lazy.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/error.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/string-formats.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/codec-examples.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/preprocess-types.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/promise.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/pickomit.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/registries.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/default.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/error-utils.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/async-refinements.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/transform.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/from-json-schema.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/bigint.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/readonly.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/nonoptional.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/partial.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/custom.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/primitive.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/locales_ro.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/function.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/locales_ka.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/optional.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/number.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/prefault.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/coalesce.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/apply.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/base.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/catch.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/json.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/datetime.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/string.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/object.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/literal.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/standard-schema.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/preprocess.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/template-literal.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/hash.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/continuability.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/detached-methods.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/nan.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/instanceof.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/generics.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/refine.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/intersection.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/description.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/to-json-schema.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/date.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/coerce.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/codec.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/assignability.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/stringbool.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/fix-json-issue.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/async-parsing.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/pipe.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/index.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/set.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/array.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/firstparty.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/union.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/enum.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/anyunknown.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/map.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/prototypes.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/void.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/record.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/to-json-schema-methods.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/tuple.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/validations.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/brand.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/jitless-allows-eval.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/global-config.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/url.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/classic/tests/describe-meta-checks.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/core/tests/record-constructor.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/core/tests/locales/en.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/core/tests/locales/tr.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/core/tests/locales/fr.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/core/tests/locales/nl.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/core/tests/locales/be.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/core/tests/locales/he.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/core/tests/locales/el.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/core/tests/locales/es.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/core/tests/locales/ru.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/core/tests/locales/hr.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/core/tests/locales/uz.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/core/tests/recursive-tuples.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/core/tests/index.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/core/tests/extend.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/mini/tests/recursive-types.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/mini/tests/computed.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/mini/tests/checks.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/mini/tests/error.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/mini/tests/functions.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/mini/tests/number.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/mini/tests/apply.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/mini/tests/string.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/mini/tests/object.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/mini/tests/standard-schema.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/mini/tests/codec.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/mini/tests/assignability.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/mini/tests/index.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/mini/tests/prototypes.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v4/mini/tests/brand.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v3/tests/discriminated-unions.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v3/tests/all-errors.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v3/tests/nullable.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v3/tests/safeparse.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v3/tests/error.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v3/tests/promise.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v3/tests/pickomit.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v3/tests/default.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v3/tests/async-refinements.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v3/tests/bigint.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v3/tests/readonly.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v3/tests/custom.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v3/tests/primitive.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v3/tests/complex.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v3/tests/function.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v3/tests/optional.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v3/tests/number.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v3/tests/base.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v3/tests/catch.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v3/tests/object-in-es5-env.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v3/tests/language-server.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v3/tests/string.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v3/tests/object.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v3/tests/literal.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v3/tests/parser.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v3/tests/standard-schema.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v3/tests/preprocess.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v3/tests/deepmasking.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v3/tests/nativeEnum.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v3/tests/nan.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v3/tests/instanceof.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v3/tests/generics.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v3/tests/refine.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v3/tests/transformer.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v3/tests/intersection.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v3/tests/description.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v3/tests/partials.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v3/tests/unions.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v3/tests/pipeline.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v3/tests/branded.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v3/tests/object-augmentation.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v3/tests/date.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v3/tests/coerce.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v3/tests/async-parsing.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v3/tests/set.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v3/tests/array.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v3/tests/parseUtil.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v3/tests/firstparty.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v3/tests/mocker.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v3/tests/enum.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v3/tests/anyunknown.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v3/tests/masking.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v3/tests/map.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v3/tests/firstpartyschematypes.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v3/tests/void.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v3/tests/record.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v3/tests/tuple.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v3/tests/validations.test.ts
./node_modules/.pnpm/zod@4.4.3/node_modules/zod/src/v3/tests/recursive.test.ts
./node_modules/.pnpm/tsconfig-paths@3.15.0/node_modules/tsconfig-paths/src/__tests__/match-path-sync.test.ts
./node_modules/.pnpm/tsconfig-paths@3.15.0/node_modules/tsconfig-paths/src/__tests__/try-path.test.ts
./node_modules/.pnpm/tsconfig-paths@3.15.0/node_modules/tsconfig-paths/src/__tests__/tsconfig-loader.test.ts
./node_modules/.pnpm/tsconfig-paths@3.15.0/node_modules/tsconfig-paths/src/__tests__/match-path-async.test.ts
./node_modules/.pnpm/tsconfig-paths@3.15.0/node_modules/tsconfig-paths/src/__tests__/config-loader.test.ts
./node_modules/.pnpm/tsconfig-paths@3.15.0/node_modules/tsconfig-paths/src/__tests__/filesystem.test.ts
./node_modules/.pnpm/tsconfig-paths@3.15.0/node_modules/tsconfig-paths/src/__tests__/mapping-entry.test.ts
./node_modules/.pnpm/@electric-sql+pglite-socket@0.1.1_@electric-sql+pglite@0.4.1/node_modules/@electric-sql/pglite-socket/tests/query-with-node-pg.test.ts
./node_modules/.pnpm/@electric-sql+pglite-socket@0.1.1_@electric-sql+pglite@0.4.1/node_modules/@electric-sql/pglite-socket/tests/server.test.ts
./node_modules/.pnpm/@electric-sql+pglite-socket@0.1.1_@electric-sql+pglite@0.4.1/node_modules/@electric-sql/pglite-socket/tests/index.test.ts
./node_modules/.pnpm/@electric-sql+pglite-socket@0.1.1_@electric-sql+pglite@0.4.1/node_modules/@electric-sql/pglite-socket/tests/query-with-postgres-js.test.ts
./node_modules/.pnpm/pg-protocol@1.15.0/node_modules/pg-protocol/src/inbound-parser.test.ts
./node_modules/.pnpm/pg-protocol@1.15.0/node_modules/pg-protocol/src/outbound-serializer.test.ts
./node_modules/.pnpm/@electric-sql+pglite-tools@0.3.1_@electric-sql+pglite@0.4.1/node_modules/@electric-sql/pglite-tools/tests/pg_dump.test.ts
./src/tests/order-confirmation.test.ts
./src/tests/rbac-and-pricing.test.ts
./src/tests/security-controls.test.ts
./src/tests/concurrency.test.ts
./src/tests/unverified-stock.test.ts
./src/tests/pos.test.ts
./src/tests/idempotency-snapshot.test.ts
./src/tests/permissions.test.ts
./src/tests/auth.test.ts
./src/tests/pricing.test.ts
./src/tests/pos-idle-session.test.ts
./src/tests/tax-and-invoice.test.ts
./src/tests/employee-count.test.ts
./src/tests/integration-concurrency.test.ts
./src/tests/checkout.test.ts
./src/tests/models-immutability.test.ts
```
## Existing Scripts
```
```
## Data Status
- **Pages data source**: Prisma DB (for products, sessions). No mock data is used.
- **CSV rows inspected**: 1003 (from products.csv)
- **Product images inspected**: Actual count of images in source-data/products/
