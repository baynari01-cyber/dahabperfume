# DATA MODEL COMPATIBILITY MATRIX

This matrix maps database schema definitions to DAHAB PERFUMES reference models.

| Reference Concept | Prisma Model | Database Field | Classification | Migration Risk |
| :--- | :--- | :--- | :--- | :--- |
| **Product** | `Product` | `id`, `sku`, `nameAr`, `nameEn`, etc. | **ALIGNED_AND_VERIFIED** | None. Field mapping matches. |
| **ProductVariant** | `ProductVariant` | `id`, `sizeMl`, `price` (fils), `stock` | **ALIGNED_AND_VERIFIED** | None. Fils is used as integer. |
| **RawMaterial** | `RawMaterial` | `id`, `sku`, `nameAr`, `currentQtyMl` | **ALIGNED_AND_VERIFIED** | None. Milliliters and grams tracked. |
| **ProductFormula** | `ProductFormula` | `id`, `productId`, `version`, `isActive` | **ALIGNED_AND_VERIFIED** | None. One active formula per size. |
| **InventoryMovement**| `InventoryMovement` | `id`, `variantId`, `qtyBefore`, `qtyAfter` | **ALIGNED_AND_VERIFIED** | None. Logs finished products. |
| **RawMaterialMovement**| `RawMaterialMovement` | `id`, `rawMaterialId`, `qtyChange` | **ALIGNED_AND_VERIFIED** | None. Logs formula components. |
| **Sale** | `Sale` | `id`, `invoiceNumber`, `sellerNameSnapshot` | **ALIGNED_AND_VERIFIED** | None. Immutable snapshots recorded. |
| **Order** | `Order` | `id`, `orderNumber`, `customerPhone` | **ALIGNED_AND_VERIFIED** | None. Online checkouts registered. |
| **Employee** | `Employee` | `id`, `email`, `passwordHash`, `roleId` | **ALIGNED_AND_VERIFIED** | None. Custom Argon2id setup. |
| **SiteSettings** | `SiteSettings` | `id`, `key`, `value` | **ALIGNED_AND_VERIFIED** | None. Core parameters registered. |
| **AuditLog** | `AuditLog` | `id`, `employeeId`, `action`, `details` | **ALIGNED_AND_VERIFIED** | None. Tracks sensitive operations. |
