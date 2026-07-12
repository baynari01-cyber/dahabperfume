# VERIFIED SERVICE CALL GRAPH

This report documents the verified architectural call chains and source files for Dahab Perfumes sales processing, confirming that zero duplicate inventory logic is spread across UI components or pages.

---

## 1. Call Chain Paths

### POS Cashier Sale
- **Source Route/Page**: `/pos/cashier` ([src/app/pos/cashier/page.tsx](file:///home/moayad/Desktop/main%20avtivity/dahab-perfumes/src/app/pos/cashier/page.tsx))
- **Interactive Component**: `POSCashierWorkspace` ([src/components/POSCashierWorkspace.tsx](file:///home/moayad/Desktop/main%20avtivity/dahab-perfumes/src/components/POSCashierWorkspace.tsx))
- **Server Action**: `processPOSCheckout` ([src/actions/pos.ts](file:///home/moayad/Desktop/main%20avtivity/dahab-perfumes/src/actions/pos.ts))
- **Transaction Block**: `prisma.$transaction` inside `processPOSCheckout` performing stock deductions (bypassing any cached site settings).

### Online Order Confirmation
- **Source Route/Page**: `/admin/orders` ([src/app/admin/orders/page.tsx](file:///home/moayad/Desktop/main%20avtivity/dahab-perfumes/src/app/admin/orders/page.tsx))
- **Server Action**: `confirmStorefrontOrder` ([src/actions/orders.ts](file:///home/moayad/Desktop/main%20avtivity/dahab-perfumes/src/actions/orders.ts))
- **Transaction Block**: `prisma.$transaction` inside `confirmStorefrontOrder` performing unit deductions.

### POS Retail Counter Sale
- **Source Route/Page**: `/pos` ([src/app/pos/page.tsx](file:///home/moayad/Desktop/main%20avtivity/dahab-perfumes/src/app/pos/page.tsx))
- **Interactive Component**: `POSCounter` ([src/components/POSCounter.tsx](file:///home/moayad/Desktop/main%20avtivity/dahab-perfumes/src/components/POSCounter.tsx))
- **Server Action**: `processPOSCheckout` ([src/actions/pos.ts](file:///home/moayad/Desktop/main%20avtivity/dahab-perfumes/src/actions/pos.ts))

---

## 2. Shared Transaction Logic Verification

> [!IMPORTANT]
> **No Duplicate Inventory Logic**: All stock deductions (Finished Product, Direct Liquid, and Formula-based) are centralized in [src/actions/pos.ts](file:///home/moayad/Desktop/main%20avtivity/dahab-perfumes/src/actions/pos.ts). Page components merely collect client input and trigger the server actions.
