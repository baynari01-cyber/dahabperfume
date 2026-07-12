# WORKFLOW CONFORMANCE MATRIX

This matrix logs DAHAB PERFUMES workflow adherence to the reference specifications.

| Core Workflow | Technical Entry Point | Transaction Boundary | Classification | Notes |
| :--- | :--- | :--- | :--- | :--- |
| **FINISHED_PRODUCT Sale** | `processPOSCheckout` Action | Prisma Transaction | **ALIGNED_AND_VERIFIED** | Unit stock deduction, movement creation. |
| **DIRECT_LIQUID Sale** | `processPOSCheckout` Action | Prisma Transaction | **ALIGNED_AND_VERIFIED** | Milliliter deduction, negative check guards. |
| **FORMULA_BASED Sale** | `processPOSCheckout` Action | Prisma Transaction | **ALIGNED_AND_VERIFIED** | Active formula fetch, components aggregation. |
| **Production Capacity** | `AvailabilityService` | Read-only calculation | **ALIGNED_AND_VERIFIED** | Capacity based on minimum raw material ratio. |
| **Storefront Checkout** | `processCheckout` Action | Prisma DB Write | **ALIGNED_AND_VERIFIED** | Creates pending order; does NOT deduct stock. |
| **Order Confirmation** | `confirmStorefrontOrder` Action | Prisma Transaction | **ALIGNED_AND_VERIFIED** | Deducts stock, generates invoice. |
| **Online Order Cancel** | `cancelStorefrontOrder` Action | Prisma Transaction | **ALIGNED_AND_VERIFIED** | Creates compensating stock movement. |
| **Importer Pipeline** | `ImportService` | Staging Job & Transaction | **ALIGNED_AND_VERIFIED** | Dry Run, batch parsing, idempotent upserts. |
| **Shifts & Cash Recon** | `openShift` / `closeShift` | Prisma DB Write | **ALIGNED_AND_VERIFIED** | Shift logs, expected cash reconciliation. |
| **Blind Count counting** | `submitInventoryCount` | Read-only DTO filter | **ALIGNED_AND_VERIFIED** | Hides expected stock values from employee view. |
| **Stale Count Protection**| `approveInventoryCount` | Prisma Transaction | **ALIGNED_AND_VERIFIED** | Version checks reject stale approvals. |
| **Audit Logging** | `AuditLog` model creation | Implicit DB writes | **ALIGNED_AND_VERIFIED** | Logs action metadata (IP, user agent, actor). |
| **POS Idle Overlay** | `POSCashierWorkspace` client | Client-side state | **ALIGNED_AND_VERIFIED** | Inactivity tracking without session termination. |
