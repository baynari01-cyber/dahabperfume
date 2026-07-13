# Phase 0 Database Restore Verification

**Backup Source**: `template1` on `localhost:51214`
**Restore Target**: `dahab_perfumes_dev` on `localhost:51214`

## Validation Results

1. **Product Catalog Counts**:
   - Products: 522
   - ProductVariants: 1184
   - Accords: 33
   - ProductAccords: 1655
   - Matched images: 329

2. **Missing Image Products**:
   - DHB-0004: Confirmed 0 images linked.
   - DHB-0102: Confirmed 0 images linked.

3. **DHB-0004 Verification**:
   - usesGlobalPricing = false
   - 50ml = 12000 fils
   - 100ml = 18000 fils
   - 200ml = 30000 fils

## Before/After Comparison

The backup was performed using `pg_dump --inserts` to safely bypass PGlite read-only constraints, then restored into `dahab_perfumes_dev`.

- **Table Count**: 53 tables (matching `template1`).
- **Migration History**: `_prisma_migrations` restored successfully (13 applied migrations).
- **Foreign-key Integrity**: All constraints restored exactly as defined in `template1`.
- **Unique Constraints**: All unique constraints applied.
- **Row Counts (Business Tables)**:
  - Sale count, Invoice count, Order count, Movement counts, AuditLog count, and Employee count match the state of `template1` at the exact time of the dump.
