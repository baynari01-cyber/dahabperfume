# CSV COLUMN MAPPING

This document maps the columns from `source-data/products.csv` to the Prisma schema.

| CSV Column | Prisma Model / Field | Type | Notes |
| :--- | :--- | :--- | :--- |
| `SKU` | `Product.sku` | String (Unique) | Primary business identifier. |
| `اسم العطر` | `Product.nameAr` | String | Default Arabic name. |
| `Inspired By` | `Product.inspiredBy` | String? | Internal reference, not published. |
| `التصنيف الرئيسي` | `Category` / `Product.categoryId` | Relation | `رجالي`, `نسائي`, `عود`, `مكس`. |
| `الجنس` | `Product.gender` | Enum `Gender` | `MALE`, `FEMALE`, `UNISEX`. |
| `الموسم` | `Product.season` | Enum `Season` | `SUMMER`, `WINTER`, `ALL_SEASONS`. |
| `العائلة العطرية` | `Product.family` | String | E.g. "أروماتك، حمضي، خشبي". |
| `البصمة العطرية 1` | `ProductAccord.name` | Relation | Mapped to dictionary, priority 1. |
| `قوة البصمة 1` | `ProductAccord.value` | Int/Float | Strength percentage. |
| `البصمة العطرية 2` | `ProductAccord.name` | Relation | Mapped to dictionary, priority 2. |
| `قوة البصمة 2` | `ProductAccord.value` | Int/Float | Strength percentage. |
| `البصمة العطرية 3` | `ProductAccord.name` | Relation | Mapped to dictionary, priority 3. |
| `قوة البصمة 3` | `ProductAccord.value` | Int/Float | Strength percentage. |
| `البصمة العطرية 4` | `ProductAccord.name` | Relation | Mapped to dictionary, priority 4. |
| `قوة البصمة 4` | `ProductAccord.value` | Int/Float | Strength percentage. |
| `البصمة العطرية 5` | `ProductAccord.name` | Relation | Mapped to dictionary, priority 5. |
| `قوة البصمة 5` | `ProductAccord.value` | Int/Float | Strength percentage. |
| `الكلمات المفتاحية` | `Product.keywords` | String | SEO/Search keywords. |
| `المخزون الكلي` | `InventoryMovement` | DB Record | Initial `STOCK_IN` movement. |
| `حد تنبيه المخزون` | `Product.lowStockThreshold` | Int | Alerts Admin when reached. |
| `يستخدم الأسعار العامة؟` | `Product.useGlobalPricing` | Boolean | If true, ignore custom prices. |
| `سعر 50ml خاص` | `ProductVariant.price` | Int | Stored in minor currency. |
| `سعر 100ml خاص` | `ProductVariant.price` | Int | Stored in minor currency. |
| `سعر 200ml خاص` | `ProductVariant.price` | Int | Stored in minor currency. |
| `اسم الصورة` | `ProductImage.url` | Relation | Needs Supabase match. |
| `ظاهر بالموقع؟` | `Product.isVisible` | Boolean | True if "نعم". |
| `مميز بالواجهة؟` | `Product.isFeatured` | Boolean | True if "نعم". |
| `وصف قصير` | `Product.shortDescription` | String | Storefront description. |
| `ملاحظات` | `Product.adminNotes` | String? | Private notes. |
