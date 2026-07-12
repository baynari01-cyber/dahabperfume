# Current Implementation Evidence

## Current Branch
```
dahab-rebuild
```
## Current Commit Hash
```
d2d678e4c17ea3d95bf83f1e1b958067e16aba4a
```
## Git Status
```
 M reports/FINAL_REPORT.md
?? generate-evidence.sh
?? reports/CURRENT_IMPLEMENTATION_EVIDENCE.md
```
## Git Diff Stat (Against initial)
```
 package.json                                       |   9 +-
 pnpm-lock.yaml                                     | 205 +++++++
 pnpm-workspace.yaml                                |   1 +
 prisma.config.ts                                   |   3 +-
 reports/FINAL_REPORT.md                            |  45 ++
 reports/invalid-products.csv                       | 672 +++++++++++++++++++++
 reports/missing-images.csv                         |   2 +
 reports/product-import-report.json                 |   8 +
 reports/product-import-report.md                   |  10 +
 scripts/create-admin.ts                            |  44 ++
 scripts/import-products.ts                         | 304 ++++++++++
 src/actions/auth.ts                                |  52 ++
 src/app/[locale]/(public)/layout.tsx               |  20 +
 src/app/[locale]/(public)/page.tsx                 |  92 +++
 src/app/[locale]/(public)/products/[slug]/page.tsx | 138 +++++
 src/app/[locale]/(public)/shop/page.tsx            | 116 ++++
 src/app/admin/layout.tsx                           |  23 +
 src/app/admin/login/page.tsx                       |  72 +++
 src/app/admin/page.tsx                             |  44 ++
 src/app/admin/products/page.tsx                    |  91 +++
 src/app/globals.css                                |  39 +-
 src/app/layout.tsx                                 |  29 +-
 src/app/page.tsx                                   |  65 --
 src/app/pos/layout.tsx                             |  37 ++
 src/app/pos/page.tsx                               | 100 +++
 src/components/Footer.tsx                          |  87 +++
 src/components/Header.tsx                          |  43 ++
 src/lib/auth.ts                                    | 113 ++++
 src/lib/dal.ts                                     |  25 +
 src/lib/db.ts                                      |  20 +
 src/proxy.ts                                       |  58 ++
 31 files changed, 2466 insertions(+), 101 deletions(-)
```
## Complete File List
```
docs/CSV_COLUMN_MAPPING.md
docs/DEPENDENCY_VERSIONS.md
prisma/schema.prisma
scripts/create-admin.ts
scripts/import-products.ts
src/actions/auth.ts
src/app/admin/layout.tsx
src/app/admin/login/page.tsx
src/app/admin/page.tsx
src/app/admin/products/page.tsx
src/app/favicon.ico
src/app/globals.css
src/app/layout.tsx
src/app/[locale]/(public)/layout.tsx
src/app/[locale]/(public)/page.tsx
src/app/[locale]/(public)/products/[slug]/page.tsx
src/app/[locale]/(public)/shop/page.tsx
src/app/pos/layout.tsx
src/app/pos/page.tsx
src/components/Footer.tsx
src/components/Header.tsx
src/lib/auth.ts
src/lib/dal.ts
src/lib/db.ts
src/proxy.ts
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
    "lint": "next lint",
    "typecheck": "tsc --noEmit",
    "test": "vitest run",
    "test:e2e": "playwright test",
    "prisma:generate": "prisma generate",
    "prisma:migrate": "prisma migrate deploy",
    "prisma:seed": "prisma db seed",
    "import:products": "tsx --env-file=.env scripts/import-products.ts",
    "create:admin": "tsx --env-file=.env scripts/create-admin.ts"
  },
  "dependencies": {
    "@hookform/resolvers": "^5.4.0",
    "@prisma/adapter-pg": "^7.8.0",
    "@prisma/client": "^7.8.0",
    "@supabase/supabase-js": "^2.110.2",
    "argon2": "^0.44.0",
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
├── eslint@9.39.5
├── eslint-config-next@16.2.10
├── jsdom@29.1.1
├── papaparse@5.5.4
├── prisma@7.8.0
├── tailwindcss@4.3.2
├── tsx@4.23.0
├── typescript@5.9.3
└── vitest@4.1.10

31 packages
```
## Complete Route Tree
```
src/app/admin/layout.tsx
src/app/admin/login/page.tsx
src/app/admin/page.tsx
src/app/admin/products/page.tsx
src/app/layout.tsx
src/app/[locale]/(public)/layout.tsx
src/app/[locale]/(public)/page.tsx
src/app/[locale]/(public)/products/[slug]/page.tsx
src/app/[locale]/(public)/shop/page.tsx
src/app/pos/layout.tsx
src/app/pos/page.tsx
```
## Complete Prisma Model List
```prisma
model Employee {
model Role {
model Permission {
model Session {
model Category {
model Product {
model ProductVariant {
model ProductImage {
model ProductAccord {
model Order {
model OrderItem {
model Sale {
model SaleItem {
model InventoryMovement {
model RawMaterial {
model ProductFormula {
model ProductFormulaItem {
model AuditLog {
model Setting {
```
## Existing Test File List
```
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
```
## Existing Scripts
```
```
## Data Status
- **Pages data source**: Prisma DB (for products, sessions). No mock data is used.
- **CSV rows inspected**: 1003 (from products.csv)
- **Product images inspected**: Actual count of images in source-data/products/
{
  "dev": "next dev",
  "build": "prisma generate && next build",
  "start": "next start",
  "lint": "next lint",
  "typecheck": "tsc --noEmit",
  "test": "vitest run",
  "test:e2e": "playwright test",
  "prisma:generate": "prisma generate",
  "prisma:migrate": "prisma migrate deploy",
  "prisma:seed": "prisma db seed",
  "import:products": "tsx --env-file=.env scripts/import-products.ts",
  "create:admin": "tsx --env-file=.env scripts/create-admin.ts"
}
