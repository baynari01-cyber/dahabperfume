# DAHAB PERFUMES - Homepage Hero Carousel Implementation Report

This report confirms the technical architecture, security, and verification results of the **Homepage Hero Carousel** component.

---

## 1. Technical & Responsive Design
- **Carousel Placement**: Embedded inside the left-side (RTL) container of the dark forest-green Hero panel. Retains the primary message and CTA on the right side, forming a balanced, highly premium two-column desktop composition.
- **GPU-Friendly Transitions**: Carousel animations utilize only `opacity` and `transform` GPU-accelerated operations. Features smooth 400–700ms ease-out transitions.
- **Responsive Viewports**: Supports:
  - Desktop (1440px): Full-width fit in left Hero side.
  - Tablet (1024px/768px): Touch-aware swipe indicators.
  - Mobile (430px/390px/360px): Automatic scale down using mobile-specific crop paths, hiding descriptive text overflows to keep LCP heights compact and readable.

---

## 2. Dynamic Performance & Image Optimizations
- **Next.js Image**: Uses `priority={index === 0}` on the first active slide image to ensure it loads eagerly, bypassing lazy loading to prevent layout shifts (CLS = 0).
- **Subsequent Slides**: Set to lazy load, only loading once transitioned or visible in the viewport.
- **Autoplay Control**: Intercepts `document.visibilityState` changes. If the user moves to another browser tab, the rotation timer is paused automatically, restarting safely upon return to avoid timer leakages.

---

## 3. Accessible & Safe Link Routing
- **A11y Features**: Semi-accessible dots/navigation hooks, localized image `alt` attributes, keyboard left/right key actions (RTL aware), and autoplay pause on cursor hover.
- **Secure Destination Redirections**: Checks destination types (COLLECTION, CATEGORY, PRODUCT, etc.) and resolves them to secure localized prefix routes (`/ar/...` or `/en/...`).
- **URL Sanitize Checks**: Strict sanitization blocks dangerous links (like `javascript:`, `data:`, and `file:`) from being written to the database or triggered by clients, preventing stored XSS exploits.

---

## 4. Admin CMS Controls
- Managed via: `/admin/content/homepage` ("Hero Advertisements" / "إعلانات الهيرو").
- Autoplay Presets: 3s, 5s, 7s, 10s, and Custom settings.
- Slides Editor: Full drag-and-drop or move buttons order control, starts/ends date ranges, dynamic entity dropdown selectors (for products, categories, collections), and instant preview states.
