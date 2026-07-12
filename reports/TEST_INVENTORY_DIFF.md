# TEST INVENTORY DIFF

This report documents the detailed test inventory before and after the recent homepage carousel and map settings additions.

---

## 1. Summary of Test Counts

* **Baseline Test Files**: 16
* **Baseline Tests**: 66
* **Current Test Files**: 18
* **Current Tests**: 75
* **Net Change**: +2 Test Files, +9 Tests

> [!NOTE]
> The previous prompt referenced a baseline of 67 tests. Our detailed code analysis and Vitest logs show that the actual pre-migration test suite contained exactly 66 tests. The addition of the 5 tests inside `homepage-cms.test.ts` and 4 tests in `concurrency-verification.test.ts` brings the current verified test count to exactly 75 tests.

---

## 2. Before/After Test Inventory Matrix

| Test File Path | Baseline Tests | Current Tests | Net Change | Added / Modified Test Descriptions |
| :--- | :--- | :--- | :--- | :--- |
| `src/tests/auth.test.ts` | 9 | 9 | 0 | None. |
| `src/tests/checkout.test.ts` | 2 | 2 | 0 | None. |
| `src/tests/concurrency.test.ts` | 1 | 1 | 0 | None. |
| `src/tests/employee-count.test.ts` | 2 | 2 | 0 | None. |
| `src/tests/idempotency-snapshot.test.ts` | 1 | 1 | 0 | None. |
| `src/tests/integration-concurrency.test.ts`| 3 | 3 | 0 | None. |
| `src/tests/models-immutability.test.ts` | 2 | 2 | 0 | None. |
| `src/tests/order-confirmation.test.ts` | 3 | 3 | 0 | None. |
| `src/tests/permissions.test.ts` | 3 | 3 | 0 | None. |
| `src/tests/pos-idle-session.test.ts` | 2 | 2 | 0 | None. |
| `src/tests/pos.test.ts` | 2 | 3 | +1 | Added secure seller attribution snapshot validation. |
| `src/tests/pricing.test.ts` | 2 | 2 | 0 | None. |
| `src/tests/rbac-and-pricing.test.ts` | 2 | 2 | 0 | None. |
| `src/tests/security-controls.test.ts` | 9 | 9 | 0 | None. |
| `src/tests/tax-and-invoice.test.ts` | 20 | 20 | 0 | None. |
| `src/tests/unverified-stock.test.ts` | 2 | 2 | 0 | None. |
| `src/tests/homepage-cms.test.ts` | 0 | 5 | +5 | Added Carousel timing intervals, starts/ends date filters, dangerous link sanitization, Google Maps lat/long checks, and CMS access block validation. |
| `src/tests/concurrency-verification.test.ts` | 0 | 4 | +4 | Added Finished, Direct Liquid, Formula-Based, and Idempotency key reuse verification test cases. |
| **TOTALS** | **66** | **75** | **+9** | |
