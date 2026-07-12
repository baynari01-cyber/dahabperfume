# ROUTE COMPATIBILITY MATRIX

This matrix validates the conformance of Next.js route boundaries to the specification.

| Route Path | Module / Area | Required Separations | Classification | Notes |
| :--- | :--- | :--- | :--- | :--- |
| `/[locale]` | Storefront | Public access, no admin leaks | **ALIGNED_AND_VERIFIED** | Local business details only. |
| `/[locale]/shop` | Storefront | Public listings, no raw formula costs | **ALIGNED_AND_VERIFIED** | Displays status indicators. |
| `/admin/*` | Admin UI | Session cookies, `manage:settings` / RBAC | **ALIGNED_AND_VERIFIED** | Total control panels. |
| `/pos/*` | POS UI | POS credentials, cashier layout | **ALIGNED_AND_VERIFIED** | `/pos` redirects to cashier. |
| `/pos/cashier` | POS UI | Canonical cash desk operating room | **ALIGNED_AND_VERIFIED** | Handles shift, counts, register. |
| `/pos/counter` | POS UI | Backward compatibility redirects | **ALIGNED_AND_VERIFIED** | Redirects statefully to cashier. |
| `/admin/login/mfa` | Admin Auth | MFA security validation page | **ALIGNED_AND_VERIFIED** | Resolves session credentials. |
| `/admin/content/homepage`| Admin CMS | Hero Carousel and Store Map CMS | **ALIGNED_AND_VERIFIED** | Manages slides and coordinates. |
