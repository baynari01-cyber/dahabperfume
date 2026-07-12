# DAHAB PERFUMES - Admin & POS Feature Matrix

| ID | Feature Area | Mobile Compatibility | Role-Based Permission Requirement | DB Tables Involved |
|----|--------------|----------------------|-----------------------------------|--------------------|
| FEAT-01 | Admin Dashboard Overview | Responsive grids, mobile widgets | `dashboard.view` | `Sale`, `Order`, `ProductVariant` |
| FEAT-02 | Employee Accounts CRUD | Fully mobile-optimized forms | `employees.create`, `employees.update` | `Employee`, `Role`, `Permission` |
| FEAT-03 | Direct Checkbox Permissions | Multi-select checkbox groups | `permissions.manage` | `EmployeePermission` (Proposed) |
| FEAT-04 | Global Pricing Settings | Mobile-friendly pricing overrides | `settings.pricing` | `GlobalPricingSettings`, `ProductVariant` |
| FEAT-05 | POS Counter Interface | Mobile-first touch cart & barcode | `pos.access` | `Sale`, `SaleItem`, `Invoice`, `Payment` |
| FEAT-06 | Shift Opening/Closing | Handheld cash input wizard | `pos.open_shift`, `pos.close_shift` | `Shift` (Proposed) |
| FEAT-07 | Audit Event Timeline | Collapsible mobile timeline | `audit_logs.view` | `AuditLog` |
