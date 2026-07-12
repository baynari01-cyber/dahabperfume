# DAHAB PERFUMES - Admin & POS Cashier Gap Audit

## Overview
This gap audit reviews the existing codebase to identify missing routes, components, authentication flows, and business features against the target operational requirements.

---

## 1. Authentication & Session Control Gaps
* ** Opaque HttpOnly Sessions**: The current rebuild uses cookie-based authentication, but we must verify session rotation, absolute session limits, idle timeout enforcement, and revocation on password/role changes.
* **MFA (TOTP)**: Missing TOTP enrollment, verification, and recovery code hashing in the authentication flow.
* **Progressive Delay & Brute-Force Lockout**: Missing account locking logic and persistent rate limiting (compatible with Vercel serverless) for failed login attempts.

---

## 2. Admin Portal Route & Layout Gaps
* **Mobile-First Layouts**: The admin page sidebar and top header are primarily built for desktop display. As the system will be run entirely on mobile phones, we must implement fully responsive, mobile-first collapsible navigation and gesture-friendly lists/cards.
* **Employee Management (`/admin/employees`)**: Currently only displays a static list. Forms for creating/editing employees, locking accounts, resetting passwords, and custom permissions (via checkboxes) are missing.
* **Roles & Permissions Management (`/admin/roles`, `/admin/permissions`)**: Basic layouts exist but lack server action wiring and visual permission control grids.
* **Pricing Settings (`/admin/settings/pricing`)**: Need to support global price modification for 50ml, 100ml, and 200ml variant sizes globally, as requested by the user, rather than only editing variants individually.
* **Other Settings Paths**: Settings sub-routes (tax, shipping, pos, security, backups) are placeholders and must be implemented.

---

## 3. POS Cashier System Gaps
* **Cashier Page Route**: Target route `/pos` or `/pos/counter` needs to be verified for mobile optimization.
* **Shift Management**: Missing Shift Open/Close endpoints, cash declaration, variance threshold tracking, and manager approvals.
* **Held Sales**: POS cart suspend/resume features are currently not persisted.
