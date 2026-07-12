# Dahab Perfumes - Feature Matrix

This report indexes the core business features of the ERP system, indicating implementation status, exact source code files, and server action/service integrations.

## Classifications
* **`IMPLEMENTED_AND_VERIFIED`**: Feature is fully functional, with database, schema, and API service layers locally integrated and validated by Vitest.
* **`PENDING_EXTERNAL_CREDENTIALS`**: Code path is fully complete and locally simulated/verified, awaiting production API keys/credentials for deployment stage testing.

---

## 1. Authentication & Security

| Feature Name | Associated Source Code File | Associated Action / Service | Classification | Notes |
| :--- | :--- | :--- | :--- | :--- |
| **Argon2id Password Hashing** | `src/lib/auth.ts` | `hashPassword`, `verifyPassword` | `IMPLEMENTED_AND_VERIFIED` | Full encoded hash storage with parameter support |
| **Custom Session Architecture** | `src/lib/auth.ts`, `src/lib/dal.ts` | `createSession`, `getCurrentSession` | `IMPLEMENTED_AND_VERIFIED` | SHA-256 db lookup of cryptographically secure session cookies |
| **Server-Side Access Control** | `src/lib/dal.ts` | `requirePermission` | `IMPLEMENTED_AND_VERIFIED` | Granular permission boundary checks for employee roles |

---

## 2. Storefront Core & Checkout

| Feature Name | Associated Source Code File | Associated Action / Service | Classification | Notes |
| :--- | :--- | :--- | :--- | :--- |
| **Cart & Pricing Engine** | `src/actions/checkout.ts` | `processCheckout` | `IMPLEMENTED_AND_VERIFIED` | Recalculates selling prices and variant-specific values |
| **WhatsApp Redirection** | `src/actions/checkout.ts` | `processCheckout` | `IMPLEMENTED_AND_VERIFIED` | Compiles order templates, returns wa.me URL |
| **Idempotency Checkout Guard** | `src/actions/checkout.ts` | `processCheckout` (idempotency checks) | `IMPLEMENTED_AND_VERIFIED` | Prevents duplicate order creation via cached client UUIDs |
| **Order vs Invoice Boundary** | `src/actions/orders.ts` | `confirmStorefrontOrder` | `IMPLEMENTED_AND_VERIFIED` | Invoices are NOT created during storefront checkout; generated ONLY upon admin order confirmation |

---

## 3. POS System

| Feature Name | Associated Source Code File | Associated Action / Service | Classification | Notes |
| :--- | :--- | :--- | :--- | :--- |
| **POS Cart Checkout** | `src/actions/pos.ts` | `processPOSCheckout` | `IMPLEMENTED_AND_VERIFIED` | Creates completed Sale, updates inventory, creates Invoice |
| **Split Payments Validation** | `src/actions/pos.ts` | `processPOSCheckout` (split check) | `IMPLEMENTED_AND_VERIFIED` | Cash & card stored separately, matches total, rejects underpayments |
| **Invoice Snapshots** | `src/actions/pos.ts`, `src/actions/orders.ts` | `prisma.invoice.create` | `IMPLEMENTED_AND_VERIFIED` | Captures tax-rates, subtotals, and values immutably |
| **Cash Change Calculation** | `src/actions/pos.ts` | `processPOSCheckout` (tendered calculation) | `IMPLEMENTED_AND_VERIFIED` | Computes change from cash tendered strictly |

---

## 4. Inventory, Recipes & Raw Materials

| Feature Name | Associated Source Code File | Associated Action / Service | Classification | Notes |
| :--- | :--- | :--- | :--- | :--- |
| **Finished Product Deduction** | `src/actions/pos.ts`, `src/actions/orders.ts` | `prisma.productVariant.update` | `IMPLEMENTED_AND_VERIFIED` | Decrements physical finished product variant stock |
| **Formula-Based Deduction** | `src/actions/pos.ts`, `src/actions/orders.ts` | `prisma.rawMaterialStock.update` | `IMPLEMENTED_AND_VERIFIED` | Consumes raw oils/materials atomically per variant recipe |
| **Negative Stock Prevention** | `src/actions/pos.ts`, `src/actions/orders.ts` | `prisma.$transaction` locking | `IMPLEMENTED_AND_VERIFIED` | Prevents checkouts if stocks fall below requested quantity |
| **Unverified Stock POS Policy** | `src/actions/pos.ts` | `processPOSCheckout` (unverified check) | `IMPLEMENTED_AND_VERIFIED` | POS blocks sale of unverified items unless manager overrides |
| **Unverified Manager Override** | `src/actions/pos.ts` | `overrideUnverifiedStock` Action | `IMPLEMENTED_AND_VERIFIED` | Logs audit records of overrides with cashier notes |

---

## 5. Tax & Pricing Configurations

| Feature Name | Associated Source Code File | Associated Action / Service | Classification | Notes |
| :--- | :--- | :--- | :--- | :--- |
| **Tax-Disabled Pricing** | `src/actions/pos.ts`, `src/actions/orders.ts` | `prisma.globalPricingSettings.findUnique` | `IMPLEMENTED_AND_VERIFIED` | Totals equal variant catalog prices when tax is disabled |
| **Inclusive Tax Math** | `src/actions/pos.ts`, `src/actions/orders.ts` | `prisma.globalPricingSettings.findUnique` | `IMPLEMENTED_AND_VERIFIED` | Total remains constant, tax calculated inside: `total - total / (1 + rate)` |
| **Exclusive Tax Math** | `src/actions/pos.ts`, `src/actions/orders.ts` | `prisma.globalPricingSettings.findUnique` | `IMPLEMENTED_AND_VERIFIED` | Adds tax on top: `total = subtotal * (1 + rate)` |
| **Fail-Closed Fallbacks** | `src/actions/checkout.ts`, `src/actions/pos.ts` | `processCheckout`, `processPOSCheckout` | `IMPLEMENTED_AND_VERIFIED` | Missing settings fail checkout operations in production |

---

## 6. Catalog Importer & Media Storage

| Feature Name | Associated Source Code File | Associated Action / Service | Classification | Notes |
| :--- | :--- | :--- | :--- | :--- |
| **Resumable CSV Parser** | `scripts/import-products.ts` | `parseProductsCSV` | `IMPLEMENTED_AND_VERIFIED` | Idempotent importer with chunk commits and duplicates logs |
| **Supabase Storage Uploads** | `src/lib/storage.ts` | `uploadProductImage` | `PENDING_EXTERNAL_CREDENTIALS` | Uploads optimized derivative assets to storage bucket |
