# Raw Material Quantity Migration Plan

## Overview
The current `RawMaterialStock` and `RawMaterialMovement` tables use `Float` for `quantity`. This allows fractional precision but introduces potential floating-point rounding errors which are unacceptable in strict inventory environments.

## Current Float Fields
1. `RawMaterialStock.quantity` (Float)
2. `RawMaterialMovement.quantity` (Float)
3. `ProductFormulaItem.quantity` (Float)
4. `ConsumptionRecord.quantityUsed` (Float)

## Unit Analysis
- Materials are usually measured in **grams (g)**, **milliliters (ml)**, or **pieces (pcs)**.
- Existing fractional values in the system typically represent sub-gram amounts (e.g., `0.5` grams).
- Smallest practical unit: **milligrams (mg)** or **microliters (μl)**.

## Conversion Strategy
- **Option A**: Convert everything to integers representing the smallest unit (e.g., multiply by 1000 to store milligrams).
  - *Pros*: Integer math, no precision loss.
  - *Cons*: Requires application-side division (similar to the fils model).
- **Option B**: Use Prisma `Decimal` type.
  - *Pros*: Native support for exact fractional arithmetic. Maps directly to PostgreSQL `DECIMAL`/`NUMERIC`.
  - *Cons*: Slower than integers, returns as `Decimal` objects in JS requiring `.toNumber()` or `.toString()`.

**Recommendation**: Use **Prisma `Decimal`** with `precision: 10, scale: 3` (e.g., up to 9,999,999.999). This accurately preserves `0.001` precision (milligrams) while keeping standard metric notation in the database and application layer.

## Backfill Strategy
1. **No existing values will be rounded or converted during Phase 0**.
2. Create a new migration to change the column types from `Double Precision` (Float) to `Decimal(10,3)`.
   - PostgreSQL can automatically cast `float8` to `numeric` without data loss, provided no values exceed the scale limits.

## Rollback Strategy
If precision loss occurs, the backup taken in Phase 0 must be restored into `dahab_perfumes_dev` using `pg_restore`.
