# DAHAB PERFUMES - Homepage Store Map Implementation Report

This report confirms the technical architecture, security, performance, and verification results of the **Homepage Store Location & Map Section** component.

---

## 1. Store Location Layout
- **Visual Identity**: Tailored in Ivory background, Forest Green frames, and Champagne text details. Uses subtle spacing, borders, and rounded corners matching the store's visual identity guidelines.
- **Two-Column Desktop**: Displays store contact details on the left, and location maps card on the right.
- **Mobile Stack**: Details are stacked first, followed by a full-width location maps preview box.

---

## 2. Click-to-Load Privacy & Performance Showcase
- **Deferred Loading**: To protect user privacy and avoid loading heavy third-party Google Maps iframe assets during initial page speed audits, the map utilizes a **Click-to-Load** placeholder card.
- **Branded Placeholder**: Displays location badges, store address description, and an interactive "عرض الخريطة التفاعلية / Load Interactive Map" button.
- **Active Loading**: Clicking the button sets `loadMap = true`, swapping the placeholder with the interactive maps iframe.
- **Scroll Friendly**: Maps iframe utilizes lazy-loading and has custom pointers configuration so it does not block public page scrolling or intercept scroll events on mobile devices.

---

## 3. Dynamic Database Configuration
- Settings are loaded directly from the `StoreLocationSettings` table:
  - `storeName` (default "Dahab Perfumes")
  - `addressAr`, `addressEn`
  - `latitude`, `longitude` (validated within -90 to +90 and -180 to +180 ranges)
  - `mapPlaceUrl`, `mapEmbedUrl` (HTTPS validated only)
  - `phone`, `whatsapp` (international code formats validated)
  - `locationSectionEnabled`, `directionsButtonEnabled`

---

## 4. Local Business SEO Schema Integration
- Dynamically outputs structured JSON-LD data for LocalBusiness/PerfumeStore:
  ```html
  <script type="application/ld+json">
  {
    "@context": "https://schema.org",
    "@type": "PerfumeStore",
    "name": "Dahab Perfumes",
    "telephone": "0790123456",
    ...
  }
  ```
  Enhances public search engine visibility using verified database fields.
