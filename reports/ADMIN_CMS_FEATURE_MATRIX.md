# Dahab Perfumes - Admin CMS Feature Matrix

This matrix traces all homepage editor configuration actions, permissions, audit logging, and validation criteria.

| Feature Area | Action Description | Permission Key | Zod Validation | Audit Log Code | Notes |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Hero Carousel** | Retrieve autoplay & layout parameters | N/A (Public/Read) | N/A | N/A | Cached queries |
| **Hero Carousel** | Update speed intervals & navigation flags | `manage:settings` | `carouselSettingsSchema` | `UPDATE_HERO_CAROUSEL_SETTINGS` | Instantly flushes page paths |
| **Hero Slides** | Create a new promotion slide | `manage:settings` | `slideInputSchema` | `CREATE_HERO_SLIDE` | Rejects non-HTTPS external URLs |
| **Hero Slides** | Edit slide headers, images, or links | `manage:settings` | `slideInputSchema` | `UPDATE_HERO_SLIDE` | Validates relative localized routes |
| **Hero Slides** | Delete an unused promotion slide | `manage:settings` | UUID validator | `DELETE_HERO_SLIDE` | Safe DB delete cascades |
| **Hero Slides** | Reorder slides list sorting | `manage:settings` | Array of UUIDs | `REORDER_HERO_SLIDES` | Transacted bulk display updates |
| **Store Map** | Retrieve showroom coordinate parameters | N/A (Public/Read) | N/A | N/A | Cached queries |
| **Store Map** | Update coordinates, phone, or embed links | `manage:settings` | `locationSettingsSchema` | `UPDATE_STORE_LOCATION_SETTINGS` | Sanitizes dangerous URLs |
