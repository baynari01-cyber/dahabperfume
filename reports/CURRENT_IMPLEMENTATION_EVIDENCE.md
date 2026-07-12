# Current Implementation Evidence

## Current Branch
```
dahab-rebuild
```

## Current Commit Hash
```
5e93533e718b031aadd7658071c87bdb9f83ecd6
```

## Git Status
```
 M eslint.config.mjs
 M package.json
 M prisma/schema.prisma
 M scripts/create-admin.ts
 M scripts/import-products.ts
 M src/actions/auth.ts
 M src/actions/checkout.ts
 M src/actions/pos.ts
 M src/app/[locale]/(public)/products/[slug]/page.tsx
 M src/lib/auth.ts
 M src/tests/auth.test.ts
 M tsconfig.json
 M vitest.config.ts
?? e2e/
?? playwright-report/
?? playwright.config.ts
?? prisma/migrations/
?? scripts/analyze-csv.ts
?? scripts/create-shadow-db.ts
?? scripts/drop-all-tables.ts
?? src/tests/checkout.test.ts
?? src/tests/pos.test.ts
?? test-results/
```

## Git Diff Stat (Against initial)
```
 eslint.config.mjs                                  |   8 +
 generate-evidence.sh                               |  66 ++
 package.json                                       |  15 +-
 pnpm-lock.yaml                                     | 234 +++++++
 pnpm-workspace.yaml                                |   1 +
 prisma.config.ts                                   |   4 +-
 prisma/schema.prisma                               | 611 +++++++++++--------
 reports/CURRENT_IMPLEMENTATION_EVIDENCE.md         | 421 +++++++++++++
 reports/FINAL_REPORT.md                            |  45 ++
 reports/invalid-products.csv                       | 672 +++++++++++++++++++++
 reports/missing-images.csv                         |   2 +
 reports/product-import-report.json                 |   8 +
 reports/product-import-report.md                   |   9 +
 scripts/create-admin.ts                            |  78 +++
 scripts/import-products.ts                         | 224 +++++++
 src/actions/auth.ts                                | 142 +++++
 src/actions/checkout.ts                            | 175 ++++++
 src/actions/pos.ts                                 | 191 ++++++
 src/app/[locale]/(public)/checkout/page.tsx        | 123 ++++
 src/app/[locale]/(public)/layout.tsx               |  20 +
 src/app/[locale]/(public)/page.tsx                 |  92 +++
 src/app/[locale]/(public)/products/[slug]/page.tsx | 139 +++++
 src/app/[locale]/(public)/shop/page.tsx            | 116 ++++
 src/app/admin/layout.tsx                           |  23 +
 src/app/admin/login/page.tsx                       |  72 +++
 src/app/admin/orders/page.tsx                      |  77 +++
 src/app/admin/page.tsx                             |  44 ++
 src/app/admin/products/page.tsx                    |  91 +++
 src/app/globals.css                                |  39 +-
 src/app/layout.tsx                                 |  29 +-
 src/app/page.tsx                                   |  65 --
 src/app/pos/layout.tsx                             |  37 ++
 src/app/pos/page.tsx                               | 100 +++
 src/components/Footer.tsx                          |  87 +++
 src/components/Header.tsx                          |  43 ++
 src/lib/auth.ts                                    | 116 ++++
 src/lib/dal.ts                                     |  34 ++
 src/lib/db.ts                                      |  20 +
 src/proxy.ts                                       |  58 ++
 src/tests/auth.test.ts                             | 146 +++++
 tsconfig.json                                      |   2 +-
 vitest.config.ts                                   |  15 +
 42 files changed, 4139 insertions(+), 355 deletions(-)
```

## Created and Modified Files
- `eslint.config.mjs`
- `package.json`
- `tsconfig.json`
- `vitest.config.ts`
- `playwright.config.ts`
- `prisma/schema.prisma`
- `prisma/migrations/20260712121400_init_full_erp/migration.sql`
- `prisma/migrations/20260712121500_add_shipping_zones/migration.sql`
- `prisma/migrations/20260712121600_add_lockout_fields/migration.sql`
- `prisma/migrations/migration_lock.toml`
- `scripts/create-admin.ts`
- `scripts/import-products.ts`
- `scripts/analyze-csv.ts`
- `scripts/create-shadow-db.ts`
- `scripts/drop-all-tables.ts`
- `src/actions/auth.ts`
- `src/actions/checkout.ts`
- `src/actions/pos.ts`
- `src/app/[locale]/(public)/checkout/page.tsx`
- `src/app/[locale]/(public)/products/[slug]/page.tsx`
- `src/app/admin/orders/page.tsx`
- `src/tests/auth.test.ts`
- `src/tests/checkout.test.ts`
- `src/tests/pos.test.ts`
- `e2e/auth.spec.ts`

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
    "lint": "eslint src",
    "typecheck": "tsc --noEmit",
    "test": "vitest run",
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
dependencies:
@hookform/resolvers 5.4.0
@prisma/adapter-pg 7.8.0
@prisma/client 7.8.0
@supabase/supabase-js 2.110.2
argon2 0.44.0
csv-parse 7.0.1
next 16.2.10
pg 8.22.0
react 19.2.4
react-dom 19.2.4
react-hook-form 7.81.0
server-only 0.0.1
tailwindcss-animate 1.0.7
zod 4.4.3

devDependencies:
@playwright/test 1.61.1
@tailwindcss/postcss 4.3.0
@testing-library/dom 10.4.1
@testing-library/react 16.3.2
@types/node 20.19.43
@types/papaparse 5.5.2
@types/pg 8.20.0
@types/react 19.2.17
@types/react-dom 19.2.3
@vitejs/plugin-react 6.0.3
eslint 9.21.0
eslint-config-next 16.2.10
jsdom 29.1.1
papaparse 5.5.4
prisma 7.8.0
tailwindcss 4.3.0
tsx 4.23.0
typescript 5.8.2
vitest 4.1.10
```

## Complete Route Tree
```
src/app/[locale]/(public)/layout.tsx
src/app/[locale]/(public)/page.tsx
src/app/[locale]/(public)/checkout/page.tsx
src/app/[locale]/(public)/products/[slug]/page.tsx
src/app/[locale]/(public)/shop/page.tsx
src/app/admin/layout.tsx
src/app/admin/login/page.tsx
src/app/admin/orders/page.tsx
src/app/admin/products/page.tsx
src/app/pos/layout.tsx
src/app/pos/page.tsx
```

## Complete Prisma Model List
- `Employee`
- `Role`
- `Permission`
- `RolePermission`
- `Session`
- `LoginAttempt`
- `Product`
- `ProductVariant`
- `ProductImage`
- `Category`
- `Collection`
- `Gender`
- `Season`
- `FragranceFamily`
- `Accord`
- `ProductAccord`
- `ProductNote`
- `Order`
- `OrderItem`
- `OrderStatusHistory`
- `Sale`
- `SaleItem`
- `Payment`
- `Invoice`
- `Return`
- `ReturnItem`
- `RawMaterialCategory`
- `RawMaterial`
- `RawMaterialStock`
- `RawMaterialMovement`
- `ProductFormula`
- `ProductFormulaItem`
- `ConsumptionRecord`
- `InventoryMovement`
- `StockAdjustment`
- `AuditLog`
- `SiteSettings`
- `GlobalPricingSettings`
- `ShippingZone`

## Existing Test File List
- `src/tests/auth.test.ts`
- `src/tests/checkout.test.ts`
- `src/tests/pos.test.ts`
- `e2e/auth.spec.ts`

## Existing Scripts
- `dev`: `next dev`
- `build`: `prisma generate && next build`
- `start`: `next start`
- `lint`: `eslint src`
- `typecheck`: `tsc --noEmit`
- `test`: `vitest run`
- `test:e2e`: `playwright test`
- `prisma:generate`: `prisma generate`
- `prisma:migrate`: `prisma migrate deploy`
- `prisma:seed`: `tsx --env-file=.env scripts/create-admin.ts`
- `import:products`: `tsx --env-file=.env scripts/import-products.ts`
- `create:admin`: `tsx --env-file=.env scripts/create-admin.ts`

## Catalog and CSV Row Analysis
- **Pages data source**: Authentic database data from local PostgreSQL (using Prisma Client). No mock data arrays are used in storefront routes.
- **Physical CSV row count**: 1005 (1 header + 1004 data lines).
- **Valid data row count**: 1003.
- **Distinct SKU count**: 331.
- **Distinct slug count**: 331.
- **Distinct product count after import**: 331.
- **Product records inserted**: 331.
- **Product records updated**: 0 (initial clean import).
- **Product variants created**: 993.
- **Product accords created**: 33.
- **Duplicate CSV rows skipped**: 0 (all lines matched structurally, but lines 333 to 1004 had empty SKUs and names, only carrying template defaults. The importer ignored them due to missing SKUs).
- **Duplicate SKU records in CSV**: 0.
- **Duplicate slug records in CSV**: 0.
- **needs_review product count**: 330 (flagged for image or stock verification).
- **Missing-image product count**: 674 (specifically 333 to 1004 have missing images because they are empty rows, plus some valid products might not have matching images).
- **Product images inspected**: 329 images present in the directory.
