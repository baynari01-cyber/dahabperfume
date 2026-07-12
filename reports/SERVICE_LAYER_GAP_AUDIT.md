# SERVICE LAYER GAP AUDIT

This audit reviews service-oriented operations and structural separations.

| Service Name | Current Equivalent | Classification | Action Required |
| :--- | :--- | :--- | :--- |
| **Product Service** | `src/actions/settings-crud.ts` (CRUD) | **ALIGNED_AND_VERIFIED** | Enforces validations in actions. |
| **Category Service** | `src/actions/settings-crud.ts` (CRUD) | **ALIGNED_AND_VERIFIED** | Enforces validations. |
| **Collection Service**| `src/actions/settings-crud.ts` (CRUD) | **ALIGNED_AND_VERIFIED** | Enforces validations. |
| **Accord Service** | `src/actions/settings-crud.ts` (CRUD) | **ALIGNED_AND_VERIFIED** | Enforces validations. |
| **Pricing Service** | `src/actions/settings-crud.ts` | **ALIGNED_AND_VERIFIED** | Global pricing checks. |
| **Finished Inventory**| `src/actions/pos.ts` | **ALIGNED_AND_VERIFIED** | Handles atomic stock deductions. |
| **Liquid Inventory** | `src/actions/pos.ts` | **ALIGNED_AND_VERIFIED** | Handles ML stock decrements. |
| **Raw Material** | `src/actions/inventory-count.ts` | **ALIGNED_AND_VERIFIED** | Logs component increments/decrements. |
| **Formula Service** | `src/actions/pos.ts` | **ALIGNED_AND_VERIFIED** | Checks active formula validation. |
| **Availability** | `src/actions/homepage-cms.ts` | **ALIGNED_AND_VERIFIED** | Calculates limits in storefront & POS. |
| **Sale Service** | `src/actions/pos.ts` | **ALIGNED_AND_VERIFIED** | Shared between Admin Counter & POS. |
| **Payment Service** | `src/actions/pos.ts` | **ALIGNED_AND_VERIFIED** | Processes credit/cash payments. |
| **Invoice Service** | `src/actions/pos.ts` | **ALIGNED_AND_VERIFIED** | Generates snapshot documents. |
| **Return Service** | `src/actions/pos.ts` | **ALIGNED_AND_VERIFIED** | Returns products/reverses transactions. |
| **Order Service** | `src/actions/pos.ts` | **ALIGNED_AND_VERIFIED** | Resolves storefront orders lifecycle. |
| **Shift Service** | `src/actions/pos.ts` | **ALIGNED_AND_VERIFIED** | Open/close shifts & cash logs. |
| **Count Service** | `src/actions/inventory-count.ts` | **ALIGNED_AND_VERIFIED** | Blind count logic, approvals. |
| **Import Service** | `src/actions/settings-crud.ts` | **ALIGNED_AND_VERIFIED** | Idempotency importer commands. |
| **Report Service** | `src/actions/pos.ts` | **ALIGNED_AND_VERIFIED** | Detailed metrics calculation. |
| **Settings Service** | `src/actions/settings.ts` | **ALIGNED_AND_VERIFIED** | Global registry variables. |
| **Auth Service** | `src/actions/auth.ts` | **ALIGNED_AND_VERIFIED** | Cookie sessions & lockouts. |
| **Permission Service**| `src/lib/dal.ts` | **ALIGNED_AND_VERIFIED** | Checks permission overrides. |
| **Audit Service** | `src/lib/auth.ts` | **ALIGNED_AND_VERIFIED** | Creates security logs. |
| **Media Service** | `src/actions/settings-crud.ts` | **PENDING_EXTERNAL_CREDENTIALS**| Supabase storage configuration. |
| **Cache Service** | Redis Client | **ALIGNED_NOT_VERIFIED** | Redis cached responses mapping. |
