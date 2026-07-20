--
-- PostgreSQL database dump
--

\restrict ezdAOLVbwy3PyYC14YhhUH5mUxJ0IkoxpIFJLfytLY82BWKFROviuewhVZaakZ0

-- Dumped from database version 17.6
-- Dumped by pg_dump version 18.4 (Debian 18.4-1+b1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE IF EXISTS ONLY public."Shift" DROP CONSTRAINT IF EXISTS "Shift_employeeId_fkey";
ALTER TABLE IF EXISTS ONLY public."Session" DROP CONSTRAINT IF EXISTS "Session_employeeId_fkey";
ALTER TABLE IF EXISTS ONLY public."Sale" DROP CONSTRAINT IF EXISTS "Sale_soldByEmployeeId_fkey";
ALTER TABLE IF EXISTS ONLY public."Sale" DROP CONSTRAINT IF EXISTS "Sale_employeeId_fkey";
ALTER TABLE IF EXISTS ONLY public."SaleItem" DROP CONSTRAINT IF EXISTS "SaleItem_variantId_fkey";
ALTER TABLE IF EXISTS ONLY public."SaleItem" DROP CONSTRAINT IF EXISTS "SaleItem_saleId_fkey";
ALTER TABLE IF EXISTS ONLY public."RolePermission" DROP CONSTRAINT IF EXISTS "RolePermission_roleId_fkey";
ALTER TABLE IF EXISTS ONLY public."RolePermission" DROP CONSTRAINT IF EXISTS "RolePermission_permissionId_fkey";
ALTER TABLE IF EXISTS ONLY public."Return" DROP CONSTRAINT IF EXISTS "Return_saleId_fkey";
ALTER TABLE IF EXISTS ONLY public."Return" DROP CONSTRAINT IF EXISTS "Return_employeeId_fkey";
ALTER TABLE IF EXISTS ONLY public."ReturnItem" DROP CONSTRAINT IF EXISTS "ReturnItem_variantId_fkey";
ALTER TABLE IF EXISTS ONLY public."ReturnItem" DROP CONSTRAINT IF EXISTS "ReturnItem_returnId_fkey";
ALTER TABLE IF EXISTS ONLY public."Product" DROP CONSTRAINT IF EXISTS "Product_seasonId_fkey";
ALTER TABLE IF EXISTS ONLY public."Product" DROP CONSTRAINT IF EXISTS "Product_genderId_fkey";
ALTER TABLE IF EXISTS ONLY public."Product" DROP CONSTRAINT IF EXISTS "Product_familyId_fkey";
ALTER TABLE IF EXISTS ONLY public."Product" DROP CONSTRAINT IF EXISTS "Product_categoryId_fkey";
ALTER TABLE IF EXISTS ONLY public."ProductVariant" DROP CONSTRAINT IF EXISTS "ProductVariant_productId_fkey";
ALTER TABLE IF EXISTS ONLY public."ProductNote" DROP CONSTRAINT IF EXISTS "ProductNote_productId_fkey";
ALTER TABLE IF EXISTS ONLY public."ProductImage" DROP CONSTRAINT IF EXISTS "ProductImage_productId_fkey";
ALTER TABLE IF EXISTS ONLY public."ProductAccord" DROP CONSTRAINT IF EXISTS "ProductAccord_productId_fkey";
ALTER TABLE IF EXISTS ONLY public."ProductAccord" DROP CONSTRAINT IF EXISTS "ProductAccord_accordId_fkey";
ALTER TABLE IF EXISTS ONLY public."PendingMfaChallenge" DROP CONSTRAINT IF EXISTS "PendingMfaChallenge_employeeId_fkey";
ALTER TABLE IF EXISTS ONLY public."Payment" DROP CONSTRAINT IF EXISTS "Payment_saleId_fkey";
ALTER TABLE IF EXISTS ONLY public."OrderStatusHistory" DROP CONSTRAINT IF EXISTS "OrderStatusHistory_orderId_fkey";
ALTER TABLE IF EXISTS ONLY public."OrderItem" DROP CONSTRAINT IF EXISTS "OrderItem_productId_fkey";
ALTER TABLE IF EXISTS ONLY public."OrderItem" DROP CONSTRAINT IF EXISTS "OrderItem_orderId_fkey";
ALTER TABLE IF EXISTS ONLY public."LoginAttempt" DROP CONSTRAINT IF EXISTS "LoginAttempt_employeeId_fkey";
ALTER TABLE IF EXISTS ONLY public."Invoice" DROP CONSTRAINT IF EXISTS "Invoice_saleId_fkey";
ALTER TABLE IF EXISTS ONLY public."Invoice" DROP CONSTRAINT IF EXISTS "Invoice_orderId_fkey";
ALTER TABLE IF EXISTS ONLY public."InventoryMovement" DROP CONSTRAINT IF EXISTS "InventoryMovement_employeeId_fkey";
ALTER TABLE IF EXISTS ONLY public."ImportJob" DROP CONSTRAINT IF EXISTS "ImportJob_employeeId_fkey";
ALTER TABLE IF EXISTS ONLY public."ImportJobRow" DROP CONSTRAINT IF EXISTS "ImportJobRow_jobId_fkey";
ALTER TABLE IF EXISTS ONLY public."HomepageHeroSlide" DROP CONSTRAINT IF EXISTS "HomepageHeroSlide_productId_fkey";
ALTER TABLE IF EXISTS ONLY public."HomepageHeroSlide" DROP CONSTRAINT IF EXISTS "HomepageHeroSlide_categoryId_fkey";
ALTER TABLE IF EXISTS ONLY public."HeldSale" DROP CONSTRAINT IF EXISTS "HeldSale_employeeId_fkey";
ALTER TABLE IF EXISTS ONLY public."Employee" DROP CONSTRAINT IF EXISTS "Employee_roleId_fkey";
ALTER TABLE IF EXISTS ONLY public."EmployeePermission" DROP CONSTRAINT IF EXISTS "EmployeePermission_permissionId_fkey";
ALTER TABLE IF EXISTS ONLY public."EmployeePermission" DROP CONSTRAINT IF EXISTS "EmployeePermission_employeeId_fkey";
ALTER TABLE IF EXISTS ONLY public."AuditLog" DROP CONSTRAINT IF EXISTS "AuditLog_employeeId_fkey";
DROP INDEX IF EXISTS public."Season_name_key";
DROP INDEX IF EXISTS public."Sale_reference_key";
DROP INDEX IF EXISTS public."Sale_idempotencyKey_key";
DROP INDEX IF EXISTS public."Role_name_key";
DROP INDEX IF EXISTS public."Product_slug_key";
DROP INDEX IF EXISTS public."Product_sku_key";
DROP INDEX IF EXISTS public."ProductVariant_sku_key";
DROP INDEX IF EXISTS public."ProductVariant_sku_idx";
DROP INDEX IF EXISTS public."Permission_action_key";
DROP INDEX IF EXISTS public."PendingMfaChallenge_token_key";
DROP INDEX IF EXISTS public."PendingMfaChallenge_employeeId_key";
DROP INDEX IF EXISTS public."Order_reference_key";
DROP INDEX IF EXISTS public."Order_idempotencyKey_key";
DROP INDEX IF EXISTS public."Invoice_saleId_key";
DROP INDEX IF EXISTS public."Invoice_orderId_key";
DROP INDEX IF EXISTS public."Invoice_number_key";
DROP INDEX IF EXISTS public."HomepageHeroSlide_startsAt_idx";
DROP INDEX IF EXISTS public."HomepageHeroSlide_isEnabled_idx";
DROP INDEX IF EXISTS public."HomepageHeroSlide_endsAt_idx";
DROP INDEX IF EXISTS public."HomepageHeroSlide_displayOrder_idx";
DROP INDEX IF EXISTS public."Gender_name_key";
DROP INDEX IF EXISTS public."FragranceFamily_name_key";
DROP INDEX IF EXISTS public."Employee_email_key";
DROP INDEX IF EXISTS public."Category_slug_key";
DROP INDEX IF EXISTS public."Accord_name_key";
ALTER TABLE IF EXISTS ONLY public._prisma_migrations DROP CONSTRAINT IF EXISTS _prisma_migrations_pkey;
ALTER TABLE IF EXISTS ONLY public."StoreLocationSettings" DROP CONSTRAINT IF EXISTS "StoreLocationSettings_pkey";
ALTER TABLE IF EXISTS ONLY public."StockAdjustment" DROP CONSTRAINT IF EXISTS "StockAdjustment_pkey";
ALTER TABLE IF EXISTS ONLY public."SiteSettings" DROP CONSTRAINT IF EXISTS "SiteSettings_pkey";
ALTER TABLE IF EXISTS ONLY public."ShippingZone" DROP CONSTRAINT IF EXISTS "ShippingZone_pkey";
ALTER TABLE IF EXISTS ONLY public."Shift" DROP CONSTRAINT IF EXISTS "Shift_pkey";
ALTER TABLE IF EXISTS ONLY public."Session" DROP CONSTRAINT IF EXISTS "Session_pkey";
ALTER TABLE IF EXISTS ONLY public."Season" DROP CONSTRAINT IF EXISTS "Season_pkey";
ALTER TABLE IF EXISTS ONLY public."Sale" DROP CONSTRAINT IF EXISTS "Sale_pkey";
ALTER TABLE IF EXISTS ONLY public."SaleItem" DROP CONSTRAINT IF EXISTS "SaleItem_pkey";
ALTER TABLE IF EXISTS ONLY public."Role" DROP CONSTRAINT IF EXISTS "Role_pkey";
ALTER TABLE IF EXISTS ONLY public."RolePermission" DROP CONSTRAINT IF EXISTS "RolePermission_pkey";
ALTER TABLE IF EXISTS ONLY public."Return" DROP CONSTRAINT IF EXISTS "Return_pkey";
ALTER TABLE IF EXISTS ONLY public."ReturnItem" DROP CONSTRAINT IF EXISTS "ReturnItem_pkey";
ALTER TABLE IF EXISTS ONLY public."RateLimitEvent" DROP CONSTRAINT IF EXISTS "RateLimitEvent_pkey";
ALTER TABLE IF EXISTS ONLY public."Product" DROP CONSTRAINT IF EXISTS "Product_pkey";
ALTER TABLE IF EXISTS ONLY public."ProductVariant" DROP CONSTRAINT IF EXISTS "ProductVariant_pkey";
ALTER TABLE IF EXISTS ONLY public."ProductNote" DROP CONSTRAINT IF EXISTS "ProductNote_pkey";
ALTER TABLE IF EXISTS ONLY public."ProductImage" DROP CONSTRAINT IF EXISTS "ProductImage_pkey";
ALTER TABLE IF EXISTS ONLY public."ProductAccord" DROP CONSTRAINT IF EXISTS "ProductAccord_pkey";
ALTER TABLE IF EXISTS ONLY public."Permission" DROP CONSTRAINT IF EXISTS "Permission_pkey";
ALTER TABLE IF EXISTS ONLY public."PendingMfaChallenge" DROP CONSTRAINT IF EXISTS "PendingMfaChallenge_pkey";
ALTER TABLE IF EXISTS ONLY public."Payment" DROP CONSTRAINT IF EXISTS "Payment_pkey";
ALTER TABLE IF EXISTS ONLY public."Order" DROP CONSTRAINT IF EXISTS "Order_pkey";
ALTER TABLE IF EXISTS ONLY public."OrderStatusHistory" DROP CONSTRAINT IF EXISTS "OrderStatusHistory_pkey";
ALTER TABLE IF EXISTS ONLY public."OrderItem" DROP CONSTRAINT IF EXISTS "OrderItem_pkey";
ALTER TABLE IF EXISTS ONLY public."LoginAttempt" DROP CONSTRAINT IF EXISTS "LoginAttempt_pkey";
ALTER TABLE IF EXISTS ONLY public."Invoice" DROP CONSTRAINT IF EXISTS "Invoice_pkey";
ALTER TABLE IF EXISTS ONLY public."InventoryMovement" DROP CONSTRAINT IF EXISTS "InventoryMovement_pkey";
ALTER TABLE IF EXISTS ONLY public."ImportJob" DROP CONSTRAINT IF EXISTS "ImportJob_pkey";
ALTER TABLE IF EXISTS ONLY public."ImportJobRow" DROP CONSTRAINT IF EXISTS "ImportJobRow_pkey";
ALTER TABLE IF EXISTS ONLY public."HomepageHeroSlide" DROP CONSTRAINT IF EXISTS "HomepageHeroSlide_pkey";
ALTER TABLE IF EXISTS ONLY public."HomepageHeroCarouselSettings" DROP CONSTRAINT IF EXISTS "HomepageHeroCarouselSettings_pkey";
ALTER TABLE IF EXISTS ONLY public."HeldSale" DROP CONSTRAINT IF EXISTS "HeldSale_pkey";
ALTER TABLE IF EXISTS ONLY public."GlobalPricingSettings" DROP CONSTRAINT IF EXISTS "GlobalPricingSettings_pkey";
ALTER TABLE IF EXISTS ONLY public."Gender" DROP CONSTRAINT IF EXISTS "Gender_pkey";
ALTER TABLE IF EXISTS ONLY public."FragranceFamily" DROP CONSTRAINT IF EXISTS "FragranceFamily_pkey";
ALTER TABLE IF EXISTS ONLY public."Employee" DROP CONSTRAINT IF EXISTS "Employee_pkey";
ALTER TABLE IF EXISTS ONLY public."EmployeePermission" DROP CONSTRAINT IF EXISTS "EmployeePermission_pkey";
ALTER TABLE IF EXISTS ONLY public."Category" DROP CONSTRAINT IF EXISTS "Category_pkey";
ALTER TABLE IF EXISTS ONLY public."AuditLog" DROP CONSTRAINT IF EXISTS "AuditLog_pkey";
ALTER TABLE IF EXISTS ONLY public."Accord" DROP CONSTRAINT IF EXISTS "Accord_pkey";
DROP TABLE IF EXISTS public._prisma_migrations;
DROP TABLE IF EXISTS public."StoreLocationSettings";
DROP TABLE IF EXISTS public."StockAdjustment";
DROP TABLE IF EXISTS public."SiteSettings";
DROP TABLE IF EXISTS public."ShippingZone";
DROP TABLE IF EXISTS public."Shift";
DROP TABLE IF EXISTS public."Session";
DROP TABLE IF EXISTS public."Season";
DROP TABLE IF EXISTS public."SaleItem";
DROP TABLE IF EXISTS public."Sale";
DROP TABLE IF EXISTS public."RolePermission";
DROP TABLE IF EXISTS public."Role";
DROP TABLE IF EXISTS public."ReturnItem";
DROP TABLE IF EXISTS public."Return";
DROP TABLE IF EXISTS public."RateLimitEvent";
DROP TABLE IF EXISTS public."ProductVariant";
DROP TABLE IF EXISTS public."ProductNote";
DROP TABLE IF EXISTS public."ProductImage";
DROP TABLE IF EXISTS public."ProductAccord";
DROP TABLE IF EXISTS public."Product";
DROP TABLE IF EXISTS public."Permission";
DROP TABLE IF EXISTS public."PendingMfaChallenge";
DROP TABLE IF EXISTS public."Payment";
DROP TABLE IF EXISTS public."OrderStatusHistory";
DROP TABLE IF EXISTS public."OrderItem";
DROP TABLE IF EXISTS public."Order";
DROP TABLE IF EXISTS public."LoginAttempt";
DROP TABLE IF EXISTS public."Invoice";
DROP TABLE IF EXISTS public."InventoryMovement";
DROP TABLE IF EXISTS public."ImportJobRow";
DROP TABLE IF EXISTS public."ImportJob";
DROP TABLE IF EXISTS public."HomepageHeroSlide";
DROP TABLE IF EXISTS public."HomepageHeroCarouselSettings";
DROP TABLE IF EXISTS public."HeldSale";
DROP TABLE IF EXISTS public."GlobalPricingSettings";
DROP TABLE IF EXISTS public."Gender";
DROP TABLE IF EXISTS public."FragranceFamily";
DROP TABLE IF EXISTS public."EmployeePermission";
DROP TABLE IF EXISTS public."Employee";
DROP TABLE IF EXISTS public."Category";
DROP TABLE IF EXISTS public."AuditLog";
DROP TABLE IF EXISTS public."Accord";
DROP FUNCTION IF EXISTS public.rls_auto_enable();
DROP SCHEMA IF EXISTS public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: rls_auto_enable(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.rls_auto_enable() RETURNS event_trigger
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'pg_catalog'
    AS $$
DECLARE
  cmd record;
BEGIN
  FOR cmd IN
    SELECT *
    FROM pg_event_trigger_ddl_commands()
    WHERE command_tag IN ('CREATE TABLE', 'CREATE TABLE AS', 'SELECT INTO')
      AND object_type IN ('table','partitioned table')
  LOOP
     IF cmd.schema_name IS NOT NULL AND cmd.schema_name IN ('public') AND cmd.schema_name NOT IN ('pg_catalog','information_schema') AND cmd.schema_name NOT LIKE 'pg_toast%' AND cmd.schema_name NOT LIKE 'pg_temp%' THEN
      BEGIN
        EXECUTE format('alter table if exists %s enable row level security', cmd.object_identity);
        RAISE LOG 'rls_auto_enable: enabled RLS on %', cmd.object_identity;
      EXCEPTION
        WHEN OTHERS THEN
          RAISE LOG 'rls_auto_enable: failed to enable RLS on %', cmd.object_identity;
      END;
     ELSE
        RAISE LOG 'rls_auto_enable: skip % (either system schema or not in enforced list: %.)', cmd.object_identity, cmd.schema_name;
     END IF;
  END LOOP;
END;
$$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Accord; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Accord" (
    id text NOT NULL,
    name text NOT NULL,
    color text
);


--
-- Name: AuditLog; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."AuditLog" (
    id text NOT NULL,
    "employeeId" text,
    action text NOT NULL,
    "entityType" text NOT NULL,
    "entityId" text NOT NULL,
    details text,
    "ipAddress" text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: Category; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Category" (
    id text NOT NULL,
    slug text NOT NULL,
    name text NOT NULL,
    description text,
    "imagePath" text
);


--
-- Name: Employee; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Employee" (
    id text NOT NULL,
    email text NOT NULL,
    name text NOT NULL,
    "passwordHash" text NOT NULL,
    "isActive" boolean DEFAULT true NOT NULL,
    "roleId" text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "failedAttempts" integer DEFAULT 0 NOT NULL,
    "lockoutUntil" timestamp(3) without time zone,
    "bootstrapCredential" boolean DEFAULT false NOT NULL,
    "mustChangePassword" boolean DEFAULT false NOT NULL,
    "pinHash" text,
    "mfaEnabled" boolean DEFAULT false NOT NULL,
    "mfaRecoveryCodes" text,
    "mfaSecret" text
);


--
-- Name: EmployeePermission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."EmployeePermission" (
    "employeeId" text NOT NULL,
    "permissionId" text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    effect text DEFAULT 'ALLOW'::text NOT NULL,
    "expiresAt" timestamp(3) without time zone,
    "grantedByEmployeeId" text NOT NULL,
    reason text,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


--
-- Name: FragranceFamily; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."FragranceFamily" (
    id text NOT NULL,
    name text NOT NULL
);


--
-- Name: Gender; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Gender" (
    id text NOT NULL,
    name text NOT NULL
);


--
-- Name: GlobalPricingSettings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."GlobalPricingSettings" (
    id text DEFAULT '1'::text NOT NULL,
    "taxRate" double precision DEFAULT 0.0 NOT NULL,
    "currencyCode" text DEFAULT 'JOD'::text NOT NULL,
    "currencySymbol" text DEFAULT 'د.أ'::text NOT NULL,
    "pricesIncludeTax" boolean DEFAULT true NOT NULL,
    "taxEnabled" boolean DEFAULT false NOT NULL
);


--
-- Name: HeldSale; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."HeldSale" (
    id text NOT NULL,
    label text NOT NULL,
    "customerName" text,
    "customerPhone" text,
    reason text,
    "employeeId" text NOT NULL,
    "cartData" text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


--
-- Name: HomepageHeroCarouselSettings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."HomepageHeroCarouselSettings" (
    id text DEFAULT 'default'::text NOT NULL,
    enabled boolean DEFAULT true NOT NULL,
    "autoplayEnabled" boolean DEFAULT true NOT NULL,
    "autoplayIntervalMs" integer DEFAULT 5000 NOT NULL,
    "pauseOnHover" boolean DEFAULT true NOT NULL,
    "showIndicators" boolean DEFAULT true NOT NULL,
    "showNavigation" boolean DEFAULT true NOT NULL,
    "transitionType" text DEFAULT 'FADE'::text NOT NULL,
    "updatedByEmployeeId" text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


--
-- Name: HomepageHeroSlide; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."HomepageHeroSlide" (
    id text NOT NULL,
    "titleAr" text NOT NULL,
    "titleEn" text NOT NULL,
    "descriptionAr" text NOT NULL,
    "descriptionEn" text NOT NULL,
    "eyebrowAr" text,
    "eyebrowEn" text,
    "ctaAr" text,
    "ctaEn" text,
    "imageDesktopPath" text NOT NULL,
    "imageMobilePath" text NOT NULL,
    "altAr" text NOT NULL,
    "altEn" text NOT NULL,
    "destinationType" text NOT NULL,
    "productId" text,
    "categoryId" text,
    "internalPath" text,
    "externalUrl" text,
    "displayOrder" integer DEFAULT 0 NOT NULL,
    "isEnabled" boolean DEFAULT true NOT NULL,
    "startsAt" timestamp(3) without time zone,
    "endsAt" timestamp(3) without time zone,
    "openInNewTab" boolean DEFAULT false NOT NULL,
    "overlayStrength" double precision DEFAULT 0.4 NOT NULL,
    "textPosition" text DEFAULT 'CENTER'::text NOT NULL,
    "createdByEmployeeId" text,
    "updatedByEmployeeId" text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


--
-- Name: ImportJob; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."ImportJob" (
    id text NOT NULL,
    status text NOT NULL,
    "fileName" text NOT NULL,
    "fileType" text NOT NULL,
    "totalRows" integer NOT NULL,
    "successRows" integer DEFAULT 0 NOT NULL,
    "failedRows" integer DEFAULT 0 NOT NULL,
    "skippedRows" integer DEFAULT 0 NOT NULL,
    "confirmedBy" text,
    "startedAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "completedAt" timestamp(3) without time zone,
    "errorSummary" text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "employeeId" text NOT NULL
);


--
-- Name: ImportJobRow; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."ImportJobRow" (
    id text NOT NULL,
    "jobId" text NOT NULL,
    "rowNumber" integer NOT NULL,
    sku text,
    "nameAr" text,
    "rawData" text,
    "normalizedData" text,
    status text NOT NULL,
    "errorMessage" text,
    warnings text,
    "resultStatus" text,
    "entityReference" text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: InventoryMovement; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."InventoryMovement" (
    id text NOT NULL,
    sku text NOT NULL,
    type text NOT NULL,
    quantity integer NOT NULL,
    "employeeId" text NOT NULL,
    reference text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "quantityAfter" integer DEFAULT 0 NOT NULL,
    "quantityBefore" integer DEFAULT 0 NOT NULL
);


--
-- Name: Invoice; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Invoice" (
    id text NOT NULL,
    "saleId" text,
    number text NOT NULL,
    "taxId" text,
    printed integer DEFAULT 0 NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "orderId" text,
    "confirmedByEmployeeId" text,
    "paymentStatus" text DEFAULT 'UNPAID'::text NOT NULL,
    "pricesIncludeTaxSnapshot" boolean DEFAULT true NOT NULL,
    "taxModeSnapshot" text DEFAULT 'DISABLED'::text NOT NULL,
    "taxRateSnapshot" double precision DEFAULT 0.0 NOT NULL,
    "cardAppliedFils" integer DEFAULT 0 NOT NULL,
    "cashAppliedFils" integer DEFAULT 0 NOT NULL,
    "cashTenderedFils" integer DEFAULT 0 NOT NULL,
    "changeDueFils" integer DEFAULT 0 NOT NULL,
    "discountAmountFils" integer DEFAULT 0 NOT NULL,
    "grossTotalFils" integer DEFAULT 0 NOT NULL,
    "netSubtotalFils" integer DEFAULT 0 NOT NULL,
    "shippingAmountFils" integer DEFAULT 0 NOT NULL,
    "taxAmountFils" integer DEFAULT 0 NOT NULL,
    "cashierNameSnapshot" text,
    "cashierRoleSnapshot" text
);


--
-- Name: LoginAttempt; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."LoginAttempt" (
    id text NOT NULL,
    email text NOT NULL,
    "ipAddress" text,
    "userAgent" text,
    success boolean NOT NULL,
    "employeeId" text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: Order; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Order" (
    id text NOT NULL,
    reference text NOT NULL,
    "customerName" text NOT NULL,
    "customerPhone" text NOT NULL,
    status text NOT NULL,
    "totalAmount" integer NOT NULL,
    "shippingCost" integer NOT NULL,
    notes text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "idempotencyKey" text,
    "paymentStatus" text DEFAULT 'UNPAID'::text NOT NULL
);


--
-- Name: OrderItem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."OrderItem" (
    id text NOT NULL,
    "orderId" text NOT NULL,
    "productId" text NOT NULL,
    "variantId" text NOT NULL,
    sku text NOT NULL,
    name text NOT NULL,
    size text NOT NULL,
    quantity integer NOT NULL,
    "unitPrice" integer NOT NULL,
    total integer NOT NULL
);


--
-- Name: OrderStatusHistory; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."OrderStatusHistory" (
    id text NOT NULL,
    "orderId" text NOT NULL,
    status text NOT NULL,
    notes text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: Payment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Payment" (
    id text NOT NULL,
    "saleId" text NOT NULL,
    method text NOT NULL,
    amount integer NOT NULL,
    "amountTendered" integer,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "terminalRef" text
);


--
-- Name: PendingMfaChallenge; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."PendingMfaChallenge" (
    id text NOT NULL,
    "employeeId" text NOT NULL,
    token text NOT NULL,
    "expiresAt" timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: Permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Permission" (
    id text NOT NULL,
    action text NOT NULL,
    description text
);


--
-- Name: Product; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Product" (
    id text NOT NULL,
    slug text NOT NULL,
    "nameAr" text NOT NULL,
    "nameEn" text NOT NULL,
    sku text NOT NULL,
    "shortDescription" text,
    "longDescription" text,
    "categoryId" text NOT NULL,
    "genderId" text,
    "seasonId" text,
    "familyId" text,
    "isVisible" boolean DEFAULT true NOT NULL,
    "isFeatured" boolean DEFAULT false NOT NULL,
    "featuredOrder" integer DEFAULT 0 NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "needsReview" boolean DEFAULT false NOT NULL,
    "reviewReasons" text,
    "stockStatus" text DEFAULT 'UNVERIFIED'::text NOT NULL,
    "notesStatus" text DEFAULT 'VERIFIED'::text NOT NULL,
    "stockLiters" double precision DEFAULT 1.0 NOT NULL
);


--
-- Name: ProductAccord; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."ProductAccord" (
    "productId" text NOT NULL,
    "accordId" text NOT NULL,
    value integer NOT NULL,
    "order" integer DEFAULT 0 NOT NULL
);


--
-- Name: ProductImage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."ProductImage" (
    id text NOT NULL,
    "productId" text NOT NULL,
    url text NOT NULL,
    alt text,
    "isMain" boolean DEFAULT false NOT NULL,
    "order" integer DEFAULT 0 NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: ProductNote; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."ProductNote" (
    id text NOT NULL,
    "productId" text NOT NULL,
    "displayOrder" integer DEFAULT 0 NOT NULL,
    "nameAr" text NOT NULL,
    "nameEn" text NOT NULL,
    "noteType" text NOT NULL
);


--
-- Name: ProductVariant; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."ProductVariant" (
    id text NOT NULL,
    "productId" text NOT NULL,
    size text NOT NULL,
    sku text NOT NULL,
    price integer NOT NULL,
    "compareAt" integer,
    "isActive" boolean DEFAULT true NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "usesGlobalPricing" boolean DEFAULT true NOT NULL
);


--
-- Name: RateLimitEvent; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."RateLimitEvent" (
    id text NOT NULL,
    key text NOT NULL,
    route text NOT NULL,
    points integer DEFAULT 1 NOT NULL,
    "expireAt" timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: Return; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Return" (
    id text NOT NULL,
    "saleId" text NOT NULL,
    "employeeId" text NOT NULL,
    reason text,
    "totalAmount" integer NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "approvedByEmployeeId" text,
    "refundMethod" text DEFAULT 'CASH'::text,
    "stockMovementRef" text
);


--
-- Name: ReturnItem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."ReturnItem" (
    id text NOT NULL,
    "returnId" text NOT NULL,
    "variantId" text NOT NULL,
    quantity integer NOT NULL,
    amount integer NOT NULL
);


--
-- Name: Role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Role" (
    id text NOT NULL,
    name text NOT NULL,
    description text
);


--
-- Name: RolePermission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."RolePermission" (
    "roleId" text NOT NULL,
    "permissionId" text NOT NULL
);


--
-- Name: Sale; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Sale" (
    id text NOT NULL,
    reference text NOT NULL,
    "employeeId" text NOT NULL,
    "customerName" text DEFAULT 'عميل نقدي'::text,
    subtotal integer NOT NULL,
    tax integer NOT NULL,
    discount integer DEFAULT 0 NOT NULL,
    total integer NOT NULL,
    status text NOT NULL,
    source text DEFAULT 'POS'::text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "completedAt" timestamp(3) without time zone,
    "saleSource" text DEFAULT 'POS'::text NOT NULL,
    "sellerEmailSnapshot" text,
    "sellerEmployeeCodeSnapshot" text,
    "sellerNameSnapshot" text,
    "sellerRoleSnapshot" text,
    "sessionId" text,
    "shiftId" text,
    "soldByEmployeeId" text,
    "terminalId" text,
    "idempotencyKey" text
);


--
-- Name: SaleItem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."SaleItem" (
    id text NOT NULL,
    "saleId" text NOT NULL,
    "variantId" text NOT NULL,
    sku text NOT NULL,
    name text NOT NULL,
    size text NOT NULL,
    quantity integer NOT NULL,
    "unitPrice" integer NOT NULL,
    total integer NOT NULL
);


--
-- Name: Season; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Season" (
    id text NOT NULL,
    name text NOT NULL
);


--
-- Name: Session; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Session" (
    id text NOT NULL,
    "employeeId" text NOT NULL,
    "expiresAt" timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "lastActivityAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: Shift; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Shift" (
    id text NOT NULL,
    "employeeId" text NOT NULL,
    "openingCashFils" integer NOT NULL,
    "expectedCashFils" integer,
    "actualCashFils" integer,
    "varianceFils" integer,
    "cardRecordedFils" integer,
    "refundFils" integer,
    status text DEFAULT 'OPEN'::text NOT NULL,
    notes text,
    "terminalId" text NOT NULL,
    "approvedByEmployeeId" text,
    "openedAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "closedAt" timestamp(3) without time zone
);


--
-- Name: ShippingZone; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."ShippingZone" (
    id text NOT NULL,
    "nameAr" text NOT NULL,
    "nameEn" text NOT NULL,
    fee integer NOT NULL,
    "estimatedDeliveryTime" text NOT NULL,
    "isEnabled" boolean DEFAULT true NOT NULL,
    "freeShippingThreshold" integer
);


--
-- Name: SiteSettings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."SiteSettings" (
    key text NOT NULL,
    value text NOT NULL
);


--
-- Name: StockAdjustment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."StockAdjustment" (
    id text NOT NULL,
    sku text NOT NULL,
    "oldStock" integer NOT NULL,
    "newStock" integer NOT NULL,
    reason text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: StoreLocationSettings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."StoreLocationSettings" (
    id text DEFAULT 'default'::text NOT NULL,
    "storeName" text DEFAULT 'Dahab Perfumes'::text NOT NULL,
    "addressAr" text NOT NULL,
    "addressEn" text NOT NULL,
    latitude double precision NOT NULL,
    longitude double precision NOT NULL,
    "mapPlaceUrl" text NOT NULL,
    "mapEmbedUrl" text NOT NULL,
    phone text NOT NULL,
    whatsapp text NOT NULL,
    "openingHours" text NOT NULL,
    "locationSectionEnabled" boolean DEFAULT true NOT NULL,
    "directionsButtonEnabled" boolean DEFAULT true NOT NULL,
    "mapZoom" integer DEFAULT 15 NOT NULL,
    "mapLabelAr" text,
    "mapLabelEn" text,
    "sectionOrder" integer DEFAULT 10 NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


--
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


--
-- Data for Name: Accord; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Accord" (id, name, color) FROM stdin;
89219724-7107-4ccf-9ccf-bb20d439a10f	منعش	\N
d4cf402c-1804-4bfc-af25-6b60196102a1	حمضي	\N
32b8ae1f-2a7e-4065-bea2-6392a15348c5	أروماتك	\N
3141f563-5039-48a5-a7f1-eac9c29e38ba	توابل	\N
10a93b7f-37f4-470c-a39e-e442b5437113	خشبي	\N
e41bfae9-b3a5-4661-a420-290d6c27da35	فانيلا	\N
b72bef64-da93-42a8-8393-c920aafd58fa	قهوة	\N
4dc1bfcb-877c-4be4-ab69-b5e9659b5630	حلو	\N
f0cf3fdd-ff21-48d5-92b6-f278db34a47b	دافئ	\N
e3fea1ab-20c7-45c0-8be6-0538353d16b3	زهري	\N
e55153a9-7d48-4956-9a15-f11205b95aa5	عود	\N
1626400a-0417-4ff8-bfed-d89ef198074f	شرقي	\N
ec62c48b-a0fe-44b8-b10f-31472c3ce534	عنبر	\N
a7f6bb93-d636-4796-be63-43d918d69ad5	ياسمين	\N
07724f54-22ff-4ddb-8eff-6bdef36ab0bc	ناعم	\N
495b763f-161e-4f28-818a-ae7ddb91c774	أخضر	\N
65f3f958-a668-479f-83aa-f2b0b9bb8236	مسك	\N
16f221cc-38cc-4dc0-8a26-1cff4bc731db	بودري	\N
6a657f15-2638-4401-a4cb-1cb3d78446be	فواكه	\N
58174674-9bd1-4df8-8c10-9a50cd10b947	بحري	\N
fd3ecda2-df68-461e-a1ca-5b56479e7ad8	عسل	\N
71232d6e-c5b8-4c28-89df-276a5f6aeb7d	باتشولي	\N
05650238-fd2f-492d-a3cf-48e1fed78e5b	ورد	\N
1c54233e-0ea1-46d3-b0be-0c74fc14ddb2	قوي	\N
fb7494b3-479c-4f1a-a828-b3c2daed6ffb	كاكاو	\N
7879e3d8-bf89-4140-b863-4761ec613c4c	جلدي	\N
2d0c0b9b-9ce0-45f5-9a7a-c3229017eecd	ألديهيد	\N
57844de5-c7e7-490b-8c70-9cd373df44b2	مكسرات	\N
f1fb6be8-89b9-4f13-b609-6a3565dd92b3	ترابي	\N
115f5980-ab14-44c8-baba-abda4e614d84	جوز هند	\N
26742fe4-2f0d-4219-ac58-8a4b998c74de	بخور	\N
836b42f0-d917-47ba-8dc7-bf4189c01f89	مالح	\N
3fdac98c-68d0-4abe-a48f-baefdfd0ddd3	مائي	\N
a4d72e96-a556-4a7c-95e8-d95f3e689b20	تبغي	\N
6f53cc68-8d00-48a8-8137-76051eaabd3f	لافندر	\N
60aea58c-7c6f-469c-9b77-5c4be6d53627	صندل	\N
a4f798bc-096d-453b-8500-7b6972445ef0	شيبر	\N
8448bdf8-bd41-4744-ba6e-c41e04e8d943	ملحي	\N
c0d57ce2-2d49-4f6b-b6f2-4c1703cfc233	أبيض زهري	\N
a583b16a-ebc0-4862-94e8-e865d460d43b	كريمي	\N
ea568ffc-763b-43ce-9a4b-b336681549de	زهرة البرتقال	\N
a325ce68-df8f-4a68-b099-177438f808ab	حشيشي	\N
a4b479b4-db92-441b-8212-bb252a3eab17	دخاني	\N
190b252f-496d-4bb5-b806-6d53b901219f	أناناس	\N
5f82665b-b506-4c6f-8a44-a7b0995d6154	زنجبيل	\N
f7359039-5a58-4d5a-b8db-6554711779b7	أوركيد	\N
bfe0311d-ea78-47ea-aeae-f79796ea244b	رم	\N
218052d5-b081-4493-8a9e-4930165074eb	ويسكي	\N
7229e940-e527-493a-8873-88fa0e32b911	طازج	\N
390ad509-80c0-437a-a112-3af1739f0328	استوائي	\N
fb9a0faa-a040-4a28-bc20-071d9478f86e	فاكهي	\N
070f1fad-3607-4af4-8bed-7b9a048b9462	سكر	\N
db1725c8-4559-481a-b000-6138cf655ca2	مانجو	\N
4d70c0f8-46bd-4387-909a-ca7dd78144d4	ليتشي	\N
6a1a5fb1-7ba0-466e-8a3d-ffe566e37050	تفاح	\N
dd848e96-9cb9-4f64-aa5b-347aae129fd0	توت	\N
b82523a2-bf3a-4e7e-ab75-733b68c863ac	ليمون	\N
b6778cfa-3b15-42ac-9866-0e92279cdf0e	كراميل	\N
6da5e4f3-3920-4f6c-9bb0-e501af6c5a81	كرز	\N
3ecaafca-c58f-46ff-a4e4-04857f267270	لوز	\N
1d27fb4b-f609-4c06-bde0-417e4ad0fccd	جوز الهند	\N
8d60a1e7-8e37-4f80-8204-d80744eeb5ee	شاي	\N
8b242d94-26f4-4347-8476-f79bccc7c051	أمبروكسان	\N
e0d53d64-bd08-43b0-a7f4-8946d726fe10	سوسن	\N
aa41fdb2-8138-41df-8269-5ec82f857a25	فلفلي	\N
ed7e663b-cf6c-4394-aa41-5efa7e75b1aa	بلسم	\N
dadef46b-479a-4249-98bd-959633a032fb	برتقال	\N
ea863799-f2ad-49ac-8ce7-07d67eb225a0	قرفة	\N
2bd72a45-07e2-46e0-9363-6e31351791e4	نظيف	\N
00c23f76-407c-4121-8bd1-8f7f9e533c9f	خوخ	\N
5051e95d-93a2-4c5a-b1ed-854b13b067f8	زعفران	\N
2f78c0dd-da66-47ed-af29-d2e1303f4ef0	أنيماليك	\N
7e33f833-8ab4-42d4-98bb-4cf932cb7da8	موز	\N
cd0894a4-ad94-4a87-a548-49c139603812	لبني	\N
43b9d7ac-cfcd-4c7a-889c-1227fc5eb054	توت أزرق	\N
b8ed2748-5ca5-475c-bc47-2e463d76d090	رمان	\N
9b7b03b1-3ed4-462d-92b9-3877c3e8d0d4	فراولة	\N
c965d659-44e9-443f-bb3e-89932581e023	صابون	\N
92080976-a730-44bd-bdb0-8ad5229e5de5	راتنجي	\N
25348e0f-a2de-4168-8f6d-87d4c4c998d9	تونكا	\N
4031d5c5-af03-4d75-8844-965a2c3055e9	جاف	\N
1fda1184-8063-4cb8-9811-9e3eb0557ab2	فيتيفر	\N
f8b8d0cd-1a77-4469-8bb6-d0b2b16e4a5f	كحوليات	\N
cc8f7fcc-e3c2-45a4-ad9d-84c0bb88a6d1	كستناء	\N
0768a2a1-6fca-4185-886e-e3b50c4461f3	شوكولاتة	\N
4adb04c8-1c7c-40d5-ac83-49b1a81b6afe	بنفسج	\N
cb7c0202-da9a-4d2f-addc-d40e7ca47f00	كمثرى	\N
b4338480-41d3-4dd3-b138-fd5679aec084	أعشاب	\N
28de1521-b5bf-4e11-bff4-fe54855a7fa8	مارشميلو	\N
04da25e9-b3fb-4492-9358-237e42875ca2	معدني	\N
81cc0733-3b0d-4f4b-84aa-03610b8d30ac	برالين	\N
\.


--
-- Data for Name: AuditLog; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."AuditLog" (id, "employeeId", action, "entityType", "entityId", details, "ipAddress", "createdAt") FROM stdin;
b5f111ad-471f-44f2-a53e-236cb6ded5b0	41b50e80-2df9-4834-9042-f383be8ec7b0	SESSION_CREATED	Session	41b50e80-2df9-4834-9042-f383be8ec7b0	\N	37.220.124.80	2026-07-13 21:54:56.365
70734155-65ef-49c6-be19-9e6ffca991a1	41b50e80-2df9-4834-9042-f383be8ec7b0	SESSION_CREATED	Session	41b50e80-2df9-4834-9042-f383be8ec7b0	\N	::1	2026-07-14 06:58:11.154
37f91192-c4b0-40ba-9c9a-2fddadbfc5ac	41b50e80-2df9-4834-9042-f383be8ec7b0	EMPLOYEE_UPDATED	Employee	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	{"name":"Local Cashier","email":"cashier@dahabperfume.local"}	::1	2026-07-14 07:12:54.053
1b60b481-9a87-45f5-be75-9215e97e1490	41b50e80-2df9-4834-9042-f383be8ec7b0	EMPLOYEE_UPDATED	Employee	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	{"name":"Local Cashier","email":"cashier@dahabperfume.local"}	::1	2026-07-14 07:14:30.5
d7ee1409-e394-4749-9a1e-67b852f3473a	41b50e80-2df9-4834-9042-f383be8ec7b0	SESSION_REVOKED	Session	91501ccc616a6785859ae7390bdbd05efbfda97b441516f40685e429aff7520d	User logged out	::1	2026-07-14 07:14:38.358
1fda1adf-18b1-4139-9763-7f3bfe701244	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	SESSION_CREATED	Session	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	\N	::1	2026-07-14 07:14:46.475
b5586cea-146d-4bc3-b063-3296efc68de7	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	SESSION_REVOKED	Session	6ee4ae4cef09e71219dfd10134663a163d3e7cf15e3547abad16c98dd7e300f0	User logged out	::1	2026-07-14 07:21:34.734
05bdef15-097c-44ec-b2bf-ad55a3d3fea6	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	SESSION_CREATED	Session	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	\N	::1	2026-07-14 07:26:11.667
79a8cc62-9f06-489a-86fc-24df4190fdef	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	SESSION_REVOKED	Session	df2231a651bc7b181e3198fe6d7a0606f62c8f11d2f40885dd52cf2d3ebf6aff	User logged out	::1	2026-07-14 07:51:05.761
b5d3b530-736d-4ce5-8ac2-5b3c2f12b544	41b50e80-2df9-4834-9042-f383be8ec7b0	SESSION_CREATED	Session	41b50e80-2df9-4834-9042-f383be8ec7b0	\N	::1	2026-07-14 07:51:51.617
33ec3508-b36f-4f78-8b92-fc98ae180efb	41b50e80-2df9-4834-9042-f383be8ec7b0	SESSION_REVOKED	Session	41377ecea18435a962ad465f49f5d640778c800ffc608c60c701417f7635a92a	User logged out	::1	2026-07-14 08:09:25.581
dfb5c9fa-9154-4a48-bb98-138d0a04f614	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	SESSION_CREATED	Session	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	\N	::1	2026-07-14 08:44:31.971
0f6c169a-fa8a-47cb-8114-6d86cae938ce	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	SALE_COMPLETED	Sale	9117a89a-a099-4677-954c-3c60178dcf31	{"items":1,"total":15000,"seller":"Local Cashier"}	\N	2026-07-14 08:45:36.855
29d02a8e-b7a7-4245-89c0-5ee5ab5598dc	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	SESSION_REVOKED	Session	0b85fac82661d387a10063ed9425c3d6e2be9f4d3db60f882f8ea54b547d02ec	User logged out	::1	2026-07-14 09:39:25.784
2b2ebc56-5a9d-40af-9b7f-78e98e1aec09	41b50e80-2df9-4834-9042-f383be8ec7b0	SESSION_CREATED	Session	41b50e80-2df9-4834-9042-f383be8ec7b0	\N	::1	2026-07-14 09:39:33.439
a69e0e9c-29d1-4f78-af7c-650320b5b6e4	41b50e80-2df9-4834-9042-f383be8ec7b0	EMPLOYEE_UPDATED	Employee	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	{"name":"Local Cashier","email":"cashier@dahabperfume.local"}	::1	2026-07-14 09:40:41.058
21d2f80a-af6f-418f-8b8b-e496faba3954	41b50e80-2df9-4834-9042-f383be8ec7b0	SESSION_REVOKED	Session	25445eb75e1ab0ead9ec1af0a35bfd79efcd8dd71ca9947f73d98d2e8b6feb48	User logged out	::1	2026-07-14 09:40:58.259
8d7d1ec3-9d55-499e-affd-6afb4580a564	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	SESSION_CREATED	Session	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	\N	::1	2026-07-14 09:41:04.561
dd5fae96-5f6f-447d-95de-5f5c64b765c8	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	SESSION_REVOKED	Session	3c29171354b2d938e6099031f957dae41a484f3ed94eb460a48376a5cb3a3552	User logged out	::1	2026-07-14 09:52:31.847
347d8bdb-6f9c-4ee1-ad44-6e9d17862634	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	SESSION_CREATED	Session	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	\N	::1	2026-07-14 09:52:41.418
800cbdde-e08c-4b4d-ba53-c2bc386d3c13	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	SESSION_REVOKED	Session	db5ed91fbfb346e5c7085c40d699ebd1c81cb79cd939aa3446f71af68e346b3b	User logged out	::1	2026-07-14 09:52:55.465
89281fda-4199-4cf8-ab22-ed273a9e8952	4c5a899c-e6e8-45bb-9829-3db589243422	SESSION_CREATED	Session	4c5a899c-e6e8-45bb-9829-3db589243422	\N	::1	2026-07-14 09:53:03.166
913df101-ff68-406c-81db-2e5c40820db5	4c5a899c-e6e8-45bb-9829-3db589243422	SESSION_REVOKED	Session	e1e3e45e6d89b4a8df0447eecc36520a94600a3d4253c3aaae6898889d565bba	User logged out	::1	2026-07-14 09:54:44.934
2ce82597-a719-4765-92dc-8ccabe7e32e8	41b50e80-2df9-4834-9042-f383be8ec7b0	SESSION_CREATED	Session	41b50e80-2df9-4834-9042-f383be8ec7b0	\N	::1	2026-07-14 09:55:00.656
9571e6ce-6c72-408d-9f11-0d5481959871	41b50e80-2df9-4834-9042-f383be8ec7b0	SESSION_CREATED	Session	41b50e80-2df9-4834-9042-f383be8ec7b0	\N	::1	2026-07-14 10:39:20.083
895bac35-4bd3-426e-8dd2-69bd822260de	41b50e80-2df9-4834-9042-f383be8ec7b0	SESSION_CREATED	Session	41b50e80-2df9-4834-9042-f383be8ec7b0	\N	::1	2026-07-14 14:44:12.222
a6edf2fd-5c2a-4e12-9a4e-59a6476a29e3	41b50e80-2df9-4834-9042-f383be8ec7b0	SALE_COMPLETED	Sale	b86d1e63-d6e4-4076-b133-d152aa587f7f	{"items":2,"total":25000,"seller":"System Admin"}	\N	2026-07-14 14:56:44.901
e6f31eea-68b9-42a0-9a17-c84f977e9523	41b50e80-2df9-4834-9042-f383be8ec7b0	ORDER_CONFIRMED	Order	30fab56a-36f8-4f51-9ff6-e7c75bcd06d0	{"reference":"ORD-84DC4874","total":18000}	\N	2026-07-14 15:08:23.826
0208ba77-4bea-44ea-a662-c7683ff0c8a1	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	SESSION_CREATED	Session	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	\N	::1	2026-07-14 15:11:25.693
94ca36fc-8756-4ca0-92cc-4fe9866ef248	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	SESSION_REVOKED	Session	0d4e068760abe0e0bd746af7cfa4317e0dad7e2f5cdfb3fd45fff597c63bb6d7	User logged out	::1	2026-07-14 17:40:44.397
64a33799-bd2a-497a-ad4c-6039d4438081	41b50e80-2df9-4834-9042-f383be8ec7b0	SESSION_CREATED	Session	41b50e80-2df9-4834-9042-f383be8ec7b0	\N	::1	2026-07-14 17:40:56.557
7c44ec04-dc4f-45b4-b702-74320e23de55	41b50e80-2df9-4834-9042-f383be8ec7b0	SESSION_CREATED	Session	41b50e80-2df9-4834-9042-f383be8ec7b0	\N	176.29.18.233	2026-07-14 19:32:22.098
520ff279-3c1d-4ccc-b9a6-2b2c4872fd9d	41b50e80-2df9-4834-9042-f383be8ec7b0	SESSION_CREATED	Session	41b50e80-2df9-4834-9042-f383be8ec7b0	\N	176.29.209.65	2026-07-14 20:24:43.619
f9f87dbd-fc23-4b1b-b646-0d5e1f83359c	41b50e80-2df9-4834-9042-f383be8ec7b0	SESSION_CREATED	Session	41b50e80-2df9-4834-9042-f383be8ec7b0	\N	176.29.18.233	2026-07-14 20:25:16.802
747bb09a-1e5d-4ae9-92c3-bbe83c1509a3	41b50e80-2df9-4834-9042-f383be8ec7b0	SESSION_CREATED	Session	41b50e80-2df9-4834-9042-f383be8ec7b0	\N	176.29.171.173	2026-07-14 20:44:26.357
b797d369-2114-4812-9be2-64c7dba96bf0	41b50e80-2df9-4834-9042-f383be8ec7b0	SESSION_CREATED	Session	41b50e80-2df9-4834-9042-f383be8ec7b0	\N	::1	2026-07-14 21:35:47.452
41baafd5-1359-4c07-a929-70c96707614e	41b50e80-2df9-4834-9042-f383be8ec7b0	SESSION_REVOKED	Session	40b8d35231ae953493cfb8dcca68169432f36ba393cded7629e25602586ca317	User logged out	::1	2026-07-14 21:37:51.44
cce77215-012d-4a60-851d-d7d078005f67	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	SESSION_CREATED	Session	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	\N	::1	2026-07-14 21:38:17.345
d2e90413-c464-49be-a9d1-4218b2f34d61	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	SALE_COMPLETED	Sale	eef54d1d-a399-42fe-92b9-ab3dc5dfccd9	{"items":2,"total":25000,"seller":"Local Cashier"}	\N	2026-07-14 21:45:54.339
1c469e01-3490-492f-92f8-700d75bab260	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	SESSION_REVOKED	Session	81fdf8cdd96e12e635ef9d858da03f3a91afa03553073ad17b6660c84c1889e7	User logged out	::1	2026-07-14 22:01:58.116
c1b1ac39-c33a-4acf-a68d-70334881ec7b	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	SESSION_CREATED	Session	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	\N	176.29.209.65	2026-07-14 22:02:56.325
b5612966-29d1-47d2-9fe2-b4a7391381ab	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	SESSION_REVOKED	Session	e207766be313f6ad5b0d07ed1517fe8dc6ba7578bdba772956d99ecd603405d3	User logged out	176.29.209.65	2026-07-14 22:07:27.871
4a8115d1-0126-4ea7-ad41-0e0caf1e1621	41b50e80-2df9-4834-9042-f383be8ec7b0	SESSION_CREATED	Session	41b50e80-2df9-4834-9042-f383be8ec7b0	\N	37.220.124.80	2026-07-14 22:08:08.894
c8f9650f-c459-42b7-9f21-55116dfe6d33	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	SESSION_REVOKED	Session	3a4adaa2d9567bf5b5181a967de1508f2e89f049bf41c2c3095c535a94be45df	User logged out	176.29.209.65	2026-07-14 22:05:57.399
008f41ef-ac5b-4e37-9a4f-8d049a6961bd	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	SESSION_CREATED	Session	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	\N	176.29.209.65	2026-07-14 22:06:47.907
d9a60043-47bc-424e-baf5-430af253758e	41b50e80-2df9-4834-9042-f383be8ec7b0	LOGIN_FAILURE	Employee	41b50e80-2df9-4834-9042-f383be8ec7b0	{"failedAttempts":1}	37.220.124.80	2026-07-14 22:09:22.425
ace2c267-923c-4fcb-8e58-4994189fd14f	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	SESSION_CREATED	Session	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	\N	37.220.124.80	2026-07-14 22:09:39.737
45f48a4d-4f11-4463-bc84-d6eeafa9ee99	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	SESSION_CREATED	Session	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	\N	176.29.209.65	2026-07-14 22:09:58.762
4bf195c7-f772-4197-8d72-5b08fae8b5a1	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	SALE_COMPLETED	Sale	5ff571f6-24c1-4312-bde6-0de366daa7b7	{"items":1,"total":10000,"seller":"Local Cashier"}	\N	2026-07-14 22:10:08.246
f0592900-b7c9-427e-a97b-5038df9fc1ca	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	SESSION_REVOKED	Session	0413d547869d694b35660a254b4ca412b9458cd16210834f320272b64c487c95	User logged out	37.220.124.80	2026-07-14 22:34:16.861
5cdaeec7-b251-407f-9654-a5e290765901	41b50e80-2df9-4834-9042-f383be8ec7b0	SESSION_CREATED	Session	41b50e80-2df9-4834-9042-f383be8ec7b0	\N	37.220.124.80	2026-07-14 22:34:25.113
e28fe67d-ba69-4c57-9904-9351e48be48c	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	SESSION_REVOKED	Session	5db916fa72b527426ea5464db90305d7655c2e550fa03db5d9dbabc161c21739	User logged out	176.29.209.65	2026-07-14 22:35:15.822
f2fd9517-1cdf-4690-bcfb-a36857b32a31	41b50e80-2df9-4834-9042-f383be8ec7b0	SESSION_CREATED	Session	41b50e80-2df9-4834-9042-f383be8ec7b0	\N	176.29.209.65	2026-07-14 22:35:35.375
4321be3c-6985-4bb8-9d3c-680db6b061e2	41b50e80-2df9-4834-9042-f383be8ec7b0	SESSION_CREATED	Session	41b50e80-2df9-4834-9042-f383be8ec7b0	\N	176.29.3.100	2026-07-15 06:12:52.737
5e760725-73b4-4078-9367-a133f2339d20	41b50e80-2df9-4834-9042-f383be8ec7b0	SESSION_CREATED	Session	41b50e80-2df9-4834-9042-f383be8ec7b0	\N	176.29.209.65	2026-07-15 07:04:27.481
d059fe51-3a45-4198-bd9d-81202dc8e826	41b50e80-2df9-4834-9042-f383be8ec7b0	SESSION_CREATED	Session	41b50e80-2df9-4834-9042-f383be8ec7b0	\N	::1	2026-07-15 07:47:09.693
8e9a5794-07fa-414f-b89d-2b9c6d184877	41b50e80-2df9-4834-9042-f383be8ec7b0	SESSION_REVOKED	Session	95edbef5cdfc0533219df67b6dc12df459b03e324768b7129ce825b82bf971cd	User logged out	::1	2026-07-15 07:47:58.984
4a359d9d-0855-4b74-a238-9aece02d1b07	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	SESSION_CREATED	Session	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	\N	::1	2026-07-15 07:54:48.976
6b354fc7-3e9a-4f89-a012-3edc6554adec	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	SESSION_CREATED	Session	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	\N	::1	2026-07-15 07:55:30.389
f50821dd-8bb1-4128-9f06-a8a2c396b176	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	SESSION_REVOKED	Session	92814ba690cf07bb080994712d2e834906474bc55cf08bb64e8ea684127bf2db	User logged out	::1	2026-07-15 07:58:53.518
6df3cb04-995d-445e-82d0-31eb652f85eb	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	SESSION_CREATED	Session	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	\N	::1	2026-07-15 07:59:55.018
5b65d24a-9b24-4665-ba64-fad84cc92bfe	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	SESSION_REVOKED	Session	9a5d11dd669287f8fb298090430db0989b675935c436f1b79137c3bff7335559	User logged out	::1	2026-07-15 08:00:30.438
84887864-8bd5-41f8-a1d0-e2afd580a3cb	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	SESSION_CREATED	Session	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	\N	::1	2026-07-15 08:03:18.151
e25b1460-0093-479c-a441-2bbf65a0be7e	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	SESSION_REVOKED	Session	55f455542262037ae31e00c9f0e5f19b941e46a731c29091d3a98af2afdb8758	User logged out	::1	2026-07-15 08:03:45.567
5a795ba5-09b2-431c-ba4e-3896b21e025c	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	SESSION_CREATED	Session	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	\N	::1	2026-07-15 08:04:04.302
ad2386e5-079e-4293-bc26-bbb64de7af68	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	SESSION_REVOKED	Session	00b74ac619d61c0c11fee3ca13d9237062d6b038683779075162330450b7861a	User logged out	::1	2026-07-15 08:21:04.205
b806b116-3461-42b2-8b80-d38041b08a3d	41b50e80-2df9-4834-9042-f383be8ec7b0	SESSION_CREATED	Session	41b50e80-2df9-4834-9042-f383be8ec7b0	\N	::1	2026-07-15 08:21:19.656
5c38619c-d409-46a4-95bf-eb6bb22f2d66	41b50e80-2df9-4834-9042-f383be8ec7b0	SESSION_REVOKED	Session	4c430c65eb145f2e13d8a6c39da108cc1621d5f513e5299bd8869f12158ff532	User logged out	::1	2026-07-15 08:22:14.853
fee743d8-4ae4-4621-b0f4-48ba73fc7ca6	4c5a899c-e6e8-45bb-9829-3db589243422	SESSION_CREATED	Session	4c5a899c-e6e8-45bb-9829-3db589243422	\N	::1	2026-07-15 08:22:19.838
8886f5b6-521b-4ec5-a65d-4f5d0c01601d	4c5a899c-e6e8-45bb-9829-3db589243422	INVENTORY_SETTINGS_UPDATED	SiteSettings	inventory_settings	{"before":null,"after":"{\\"lowStockThreshold\\":1.083}"}	::1	2026-07-15 08:35:39.634
7ec5faa7-5d3e-40e9-919f-805d4f6be53b	4c5a899c-e6e8-45bb-9829-3db589243422	INVENTORY_SETTINGS_UPDATED	SiteSettings	inventory_settings	{"before":"{\\"lowStockThreshold\\":1.083}","after":"{\\"lowStockThreshold\\":900}"}	::1	2026-07-15 08:36:05.984
116f1fe7-5727-4ed5-9373-1bcbb78dbdd7	4c5a899c-e6e8-45bb-9829-3db589243422	INVENTORY_SETTINGS_UPDATED	SiteSettings	inventory_settings	{"before":"{\\"lowStockThreshold\\":900}","after":"{\\"lowStockThreshold\\":0.9}"}	::1	2026-07-15 08:36:23.85
776dd41c-0c56-45e8-9d77-ede4d8bc2c6a	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	SESSION_CREATED	Session	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	\N	::1	2026-07-15 08:37:45.96
50cb07d7-b53d-488d-96c5-60d6773f8c5e	41b50e80-2df9-4834-9042-f383be8ec7b0	SESSION_CREATED	Session	41b50e80-2df9-4834-9042-f383be8ec7b0	\N	176.29.209.65	2026-07-15 10:52:50.076
81ec5e67-6684-4584-86dc-14870a76bcbe	41b50e80-2df9-4834-9042-f383be8ec7b0	CREATE_HERO_SLIDE	HomepageHeroSlide	49f458be-688d-4d05-8878-359eb341d58d	{"id":"49f458be-688d-4d05-8878-359eb341d58d","titleAr":"تشكيلة الصيف الجديدة","titleEn":"New sammer collectiiom","descriptionAr":"","descriptionEn":"","eyebrowAr":"","eyebrowEn":"","ctaAr":"","ctaEn":"","imageDesktopPath":"https://veazstnewxdrvqjltayg.supabase.co/storage/v1/object/public/uploads/1784114316397-keu2enp.mp4","imageMobilePath":"https://veazstnewxdrvqjltayg.supabase.co/storage/v1/object/public/uploads/1784114331430-jyxtzcl.mp4","altAr":"","altEn":"","destinationType":"INTERNAL_ROUTE","productId":null,"categoryId":null,"internalPath":"/collections","externalUrl":"","displayOrder":0,"isEnabled":true,"startsAt":null,"endsAt":null,"openInNewTab":false,"overlayStrength":0.4,"textPosition":"CENTER","createdByEmployeeId":"41b50e80-2df9-4834-9042-f383be8ec7b0","updatedByEmployeeId":"41b50e80-2df9-4834-9042-f383be8ec7b0","createdAt":"2026-07-15T11:25:22.791Z","updatedAt":"2026-07-15T11:25:22.791Z"}	\N	2026-07-15 11:25:22.986
d016bd66-0b21-4922-b9a7-a5981132216a	41b50e80-2df9-4834-9042-f383be8ec7b0	SESSION_CREATED	Session	41b50e80-2df9-4834-9042-f383be8ec7b0	\N	176.29.166.179	2026-07-16 18:15:17.793
657488ce-d2ce-4052-956e-d9e5c8356ea8	41b50e80-2df9-4834-9042-f383be8ec7b0	SESSION_CREATED	Session	41b50e80-2df9-4834-9042-f383be8ec7b0	\N	176.29.121.11	2026-07-19 10:21:19.456
aa7549c8-1f59-41d1-9283-bdfe0e3f439e	41b50e80-2df9-4834-9042-f383be8ec7b0	SALE_COMPLETED	Sale	53b4f3a4-5860-4557-a438-dce24edbae10	{"items":1,"total":20000,"seller":"System Admin"}	\N	2026-07-19 10:22:24.479
528a3f4c-bcff-406f-9013-025413d0cf29	41b50e80-2df9-4834-9042-f383be8ec7b0	CREATE_HERO_SLIDE	HomepageHeroSlide	8dc897c2-a308-4ebe-90d7-3a1e1b16bf9c	{"id":"8dc897c2-a308-4ebe-90d7-3a1e1b16bf9c","titleAr":"ننننن","titleEn":"ببب","descriptionAr":"","descriptionEn":"","eyebrowAr":"","eyebrowEn":"","ctaAr":"","ctaEn":"","imageDesktopPath":"https://veazstnewxdrvqjltayg.supabase.co/storage/v1/object/public/uploads/1784114840609-flfawct.mp4","imageMobilePath":"https://veazstnewxdrvqjltayg.supabase.co/storage/v1/object/public/uploads/1784114851098-ciw33iu.mp4","altAr":"","altEn":"","destinationType":"CATEGORY","productId":null,"categoryId":"9fd094e0-a53f-40ad-aef8-7e54f7bfd170","internalPath":"","externalUrl":"","displayOrder":0,"isEnabled":true,"startsAt":null,"endsAt":null,"openInNewTab":false,"overlayStrength":0.4,"textPosition":"CENTER","createdByEmployeeId":"41b50e80-2df9-4834-9042-f383be8ec7b0","updatedByEmployeeId":"41b50e80-2df9-4834-9042-f383be8ec7b0","createdAt":"2026-07-15T11:28:04.482Z","updatedAt":"2026-07-15T11:28:04.482Z"}	\N	2026-07-15 11:28:04.666
edc97480-2ccd-4834-b2ca-992faee906d7	41b50e80-2df9-4834-9042-f383be8ec7b0	SESSION_CREATED	Session	41b50e80-2df9-4834-9042-f383be8ec7b0	\N	176.29.157.249	2026-07-15 20:59:51.254
634f620d-b50c-4342-a6af-57b75ac5cf4a	41b50e80-2df9-4834-9042-f383be8ec7b0	SESSION_CREATED	Session	41b50e80-2df9-4834-9042-f383be8ec7b0	\N	37.220.124.80	2026-07-16 14:59:16.503
20641fda-6cba-4ff3-b550-ab85b0cfa0a3	41b50e80-2df9-4834-9042-f383be8ec7b0	SESSION_CREATED	Session	41b50e80-2df9-4834-9042-f383be8ec7b0	\N	176.29.209.65	2026-07-16 14:59:43.933
87b7538b-18ca-43ae-a832-ac47925b76ff	41b50e80-2df9-4834-9042-f383be8ec7b0	GLOBAL_PRICING_UPDATED	GlobalPricingSettings	1	{"size":"50ml","priceInFils":8000,"updatedCount":9}	\N	2026-07-16 15:00:55.494
cdf342ff-7fc2-4062-b516-f93714a1fb0d	41b50e80-2df9-4834-9042-f383be8ec7b0	GLOBAL_PRICING_UPDATED	GlobalPricingSettings	1	{"size":"100ml","priceInFils":12000,"updatedCount":9}	\N	2026-07-16 15:00:57.627
42a91463-0371-4816-b28f-d50a6a6695f2	41b50e80-2df9-4834-9042-f383be8ec7b0	GLOBAL_PRICING_UPDATED	GlobalPricingSettings	1	{"size":"200ml","priceInFils":20000,"updatedCount":10}	\N	2026-07-16 15:00:59.743
71b3416d-df6f-4694-9709-afbb79b6b562	41b50e80-2df9-4834-9042-f383be8ec7b0	ORDER_CONFIRMED	Order	a7080dc4-04a3-4b52-9a5a-763740f91f39	{"reference":"ORD-D7268C78","total":28000}	\N	2026-07-16 15:06:02.777
2b6ed64e-e5b2-441f-9c06-be8430853a26	41b50e80-2df9-4834-9042-f383be8ec7b0	SALE_COMPLETED	Sale	a3c69d75-536f-4c89-b707-84e40266d169	{"items":1,"total":12000,"seller":"System Admin"}	\N	2026-07-16 15:08:22.839
297e10ba-53f5-4e85-889b-3c40b3d0981b	41b50e80-2df9-4834-9042-f383be8ec7b0	GLOBAL_PRICING_UPDATED	GlobalPricingSettings	1	{"size":"50ml","priceInFils":8000,"updatedCount":323}	\N	2026-07-16 15:16:38.629
6d02fcbc-30f5-45fd-99ef-ac49a391d805	41b50e80-2df9-4834-9042-f383be8ec7b0	GLOBAL_PRICING_UPDATED	GlobalPricingSettings	1	{"size":"100ml","priceInFils":12000,"updatedCount":324}	\N	2026-07-16 15:16:40.691
e3475193-27af-450c-be16-2e36dd768e87	41b50e80-2df9-4834-9042-f383be8ec7b0	GLOBAL_PRICING_UPDATED	GlobalPricingSettings	1	{"size":"200ml","priceInFils":20000,"updatedCount":324}	\N	2026-07-16 15:16:42.76
45c86ee4-83c2-4d4d-b06e-b341a158aa94	41b50e80-2df9-4834-9042-f383be8ec7b0	SALE_COMPLETED	Sale	c840f4a4-4a2a-41a4-b68f-0b9192119357	{"items":2,"total":32000,"seller":"System Admin"}	\N	2026-07-16 15:17:25.921
6c7f6d39-fd06-4f48-b8f9-b8d332a99ecb	41b50e80-2df9-4834-9042-f383be8ec7b0	SALE_COMPLETED	Sale	b6a55738-bb90-4ffe-8c3b-3f820f2c5314	{"items":1,"total":20000,"seller":"System Admin"}	\N	2026-07-16 15:17:45.794
a484fc23-75c9-47af-8415-406922bb28b8	41b50e80-2df9-4834-9042-f383be8ec7b0	SALE_COMPLETED	Sale	2e17e59a-8b3f-4c6f-90ba-d0dd28da55ea	{"items":1,"total":20000,"seller":"System Admin"}	\N	2026-07-16 15:36:19.918
5b925e43-cf1c-484d-b394-7cbba639dcee	41b50e80-2df9-4834-9042-f383be8ec7b0	GLOBAL_PRICING_UPDATED	GlobalPricingSettings	1	{"size":"50ml","priceInFils":8000,"updatedCount":469}	\N	2026-07-16 15:36:37.577
117111cc-6198-4022-a051-8da11e875e00	41b50e80-2df9-4834-9042-f383be8ec7b0	GLOBAL_PRICING_UPDATED	GlobalPricingSettings	1	{"size":"100ml","priceInFils":12000,"updatedCount":469}	\N	2026-07-16 15:36:39.672
e5f4e96d-10ee-4a1e-bf23-02bf72f03fb7	41b50e80-2df9-4834-9042-f383be8ec7b0	GLOBAL_PRICING_UPDATED	GlobalPricingSettings	1	{"size":"200ml","priceInFils":20000,"updatedCount":469}	\N	2026-07-16 15:36:41.838
5003df74-8287-4333-8b34-eaa421514bc8	41b50e80-2df9-4834-9042-f383be8ec7b0	GLOBAL_PRICING_UPDATED	GlobalPricingSettings	1	{"size":"50ml","priceInFils":8000,"updatedCount":469}	\N	2026-07-16 15:40:34.772
db53bdfa-10a8-4273-894a-fe2433afbcbb	41b50e80-2df9-4834-9042-f383be8ec7b0	GLOBAL_PRICING_UPDATED	GlobalPricingSettings	1	{"size":"100ml","priceInFils":12000,"updatedCount":469}	\N	2026-07-16 15:40:36.906
26a4e214-77c4-4e4e-a101-6c2c2d754a71	41b50e80-2df9-4834-9042-f383be8ec7b0	GLOBAL_PRICING_UPDATED	GlobalPricingSettings	1	{"size":"200ml","priceInFils":20000,"updatedCount":469}	\N	2026-07-16 15:40:39.036
f9237121-c3cd-4cdb-8c51-4aec8b7970fd	41b50e80-2df9-4834-9042-f383be8ec7b0	SESSION_CREATED	Session	41b50e80-2df9-4834-9042-f383be8ec7b0	\N	176.29.166.179	2026-07-16 16:14:21.371
f86d9006-8a4f-4406-b86f-f555b24837fc	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	SESSION_CREATED	Session	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	\N	176.29.166.179	2026-07-16 16:16:59.646
eac20cea-d0f8-4e66-bd5d-1ae36781549e	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	SALE_COMPLETED	Sale	ed990345-87e9-4483-97df-63d6845eea5c	{"items":2,"total":40000,"seller":"Local Cashier"}	\N	2026-07-16 16:19:00.631
4280e740-b99e-4397-8555-384927072b0d	41b50e80-2df9-4834-9042-f383be8ec7b0	CREATE_HERO_SLIDE	HomepageHeroSlide	e31c2775-ee23-4f89-a137-e61907e1d171	{"id":"e31c2775-ee23-4f89-a137-e61907e1d171","titleAr":"تشكيلة الصيف الجديدة ","titleEn":"New Sammar Collection","descriptionAr":"انقر للاختيار","descriptionEn":"","eyebrowAr":"","eyebrowEn":"","ctaAr":"","ctaEn":"","imageDesktopPath":"https://veazstnewxdrvqjltayg.supabase.co/storage/v1/object/public/uploads/1784218733728-0xxr7du.mp4","imageMobilePath":"/slide-placeholder-mobile.jpg","altAr":"","altEn":"","destinationType":"INTERNAL_ROUTE","productId":null,"categoryId":null,"internalPath":"/collections","externalUrl":"","displayOrder":0,"isEnabled":true,"startsAt":null,"endsAt":null,"openInNewTab":false,"overlayStrength":0.4,"textPosition":"CENTER","createdByEmployeeId":"41b50e80-2df9-4834-9042-f383be8ec7b0","updatedByEmployeeId":"41b50e80-2df9-4834-9042-f383be8ec7b0","createdAt":"2026-07-16T16:20:58.611Z","updatedAt":"2026-07-16T16:20:58.611Z"}	\N	2026-07-16 16:20:58.893
fb498c1e-9ebe-4016-9beb-f614424d9ba3	41b50e80-2df9-4834-9042-f383be8ec7b0	CREATE_HERO_SLIDE	HomepageHeroSlide	9f500a43-642a-469e-ba70-1edb90a96508	{"id":"9f500a43-642a-469e-ba70-1edb90a96508","titleAr":"تشكيلة الصيف الجديدة ","titleEn":"New Summer Collection","descriptionAr":"","descriptionEn":"","eyebrowAr":"","eyebrowEn":"","ctaAr":"","ctaEn":"","imageDesktopPath":"https://veazstnewxdrvqjltayg.supabase.co/storage/v1/object/public/uploads/1784218867477-lk97skw.mp4","imageMobilePath":"/slide-placeholder-mobile.jpg","altAr":"","altEn":"","destinationType":"INTERNAL_ROUTE","productId":null,"categoryId":null,"internalPath":"/collections","externalUrl":"","displayOrder":0,"isEnabled":true,"startsAt":null,"endsAt":null,"openInNewTab":false,"overlayStrength":0.4,"textPosition":"CENTER","createdByEmployeeId":"41b50e80-2df9-4834-9042-f383be8ec7b0","updatedByEmployeeId":"41b50e80-2df9-4834-9042-f383be8ec7b0","createdAt":"2026-07-16T16:22:11.298Z","updatedAt":"2026-07-16T16:22:11.298Z"}	\N	2026-07-16 16:22:11.574
d4e7046c-c417-4bbf-943b-22b6df29da46	41b50e80-2df9-4834-9042-f383be8ec7b0	SESSION_CREATED	Session	41b50e80-2df9-4834-9042-f383be8ec7b0	\N	176.29.209.65	2026-07-19 11:18:57.358
ff528c6e-81de-4cb1-ad6c-4cfe13cdfc5a	41b50e80-2df9-4834-9042-f383be8ec7b0	SESSION_CREATED	Session	41b50e80-2df9-4834-9042-f383be8ec7b0	\N	176.29.57.18	2026-07-19 12:35:32.413
1b71b3fe-0537-4f23-b0b2-0f699ac0ba63	41b50e80-2df9-4834-9042-f383be8ec7b0	SESSION_CREATED	Session	41b50e80-2df9-4834-9042-f383be8ec7b0	\N	176.29.57.18	2026-07-19 12:35:38.066
85524c3d-f5a2-4385-a7f0-a27f45b18865	41b50e80-2df9-4834-9042-f383be8ec7b0	SESSION_CREATED	Session	41b50e80-2df9-4834-9042-f383be8ec7b0	\N	176.29.209.65	2026-07-19 13:45:31.207
78e2c538-6742-462f-b7e8-655aa92c2581	41b50e80-2df9-4834-9042-f383be8ec7b0	SESSION_CREATED	Session	41b50e80-2df9-4834-9042-f383be8ec7b0	\N	37.220.124.80	2026-07-19 14:37:10.383
111bdb81-a7f1-4d24-be6a-00adbbde46c1	41b50e80-2df9-4834-9042-f383be8ec7b0	SESSION_CREATED	Session	41b50e80-2df9-4834-9042-f383be8ec7b0	\N	37.220.124.80	2026-07-19 14:59:05.389
104262ac-b7ba-4ccc-b3ef-dafbc6fb37f0	41b50e80-2df9-4834-9042-f383be8ec7b0	SESSION_CREATED	Session	41b50e80-2df9-4834-9042-f383be8ec7b0	\N	176.29.209.65	2026-07-19 15:14:39.737
414225b1-f4ea-40ee-a8e3-430efe61a790	41b50e80-2df9-4834-9042-f383be8ec7b0	SESSION_CREATED	Session	41b50e80-2df9-4834-9042-f383be8ec7b0	\N	176.29.57.18	2026-07-19 15:33:34.072
dc2b7dd9-86c6-471c-ad6f-efc20203ff7b	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	SESSION_CREATED	Session	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	\N	176.29.57.18	2026-07-19 15:41:27.875
dceca71b-9c9c-42e8-a070-5e82e7f104b9	41b50e80-2df9-4834-9042-f383be8ec7b0	SESSION_CREATED	Session	41b50e80-2df9-4834-9042-f383be8ec7b0	\N	176.29.57.18	2026-07-19 15:42:01.688
e59aa9a1-502f-416b-b973-5f8971fdc50d	41b50e80-2df9-4834-9042-f383be8ec7b0	SALE_COMPLETED	Sale	b9408e69-1fbc-4219-963f-b4ac4dab06e9	{"items":1,"total":6500,"seller":"System Admin"}	\N	2026-07-19 15:50:09.399
c4dd61bb-ba5a-4886-9e78-0cc4c33526c8	41b50e80-2df9-4834-9042-f383be8ec7b0	SESSION_CREATED	Session	41b50e80-2df9-4834-9042-f383be8ec7b0	\N	176.29.57.18	2026-07-19 16:42:44.671
04dd31bb-d475-43d3-8c24-19aaca210649	41b50e80-2df9-4834-9042-f383be8ec7b0	INVENTORY_SETTINGS_UPDATED	SiteSettings	inventory_settings	{"before":"{\\"lowStockThreshold\\":0.9}","after":"{\\"lowStockThreshold\\":0.05}"}	176.29.57.18	2026-07-19 16:51:00.979
1833f762-3753-4aac-af50-30edccce1788	41b50e80-2df9-4834-9042-f383be8ec7b0	SALE_COMPLETED	Sale	bb83c1fb-9116-4c41-b815-e5eba79167a1	{"items":1,"total":20000,"seller":"System Admin"}	\N	2026-07-19 17:09:13.776
a6b2426e-9a66-4ccd-a8f7-ca23b2ad8ba2	41b50e80-2df9-4834-9042-f383be8ec7b0	SESSION_CREATED	Session	41b50e80-2df9-4834-9042-f383be8ec7b0	\N	176.29.209.65	2026-07-20 15:04:15.548
\.


--
-- Data for Name: Category; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Category" (id, slug, name, description, "imagePath") FROM stdin;
ea324c79-43e4-4750-8b5f-8c30f78b159e	رجالي	رجالي	\N	\N
3875d144-bed6-4f94-8383-049aaa6c59bd	نسائي	نسائي	\N	\N
26e988b4-46fb-4100-a190-0ed4a7d72d34	عود	عود	\N	\N
f472cc49-84a5-4267-95bf-9e9b03db2a08	فاخر	فاخر	\N	\N
62d74b01-a106-4074-92a8-a56b4b99ab40	مكس	مكس	\N	\N
\.


--
-- Data for Name: Employee; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Employee" (id, email, name, "passwordHash", "isActive", "roleId", "createdAt", "updatedAt", "failedAttempts", "lockoutUntil", "bootstrapCredential", "mustChangePassword", "pinHash", "mfaEnabled", "mfaRecoveryCodes", "mfaSecret") FROM stdin;
8a0eca09-7ea1-4c06-b131-e2df2d50c12c	cashier@dahab.com	كاشير الفرع	$argon2id$v=19$m=65536,t=3,p=4$yh2JMdEQ1ptgQ9dP47OMjA$iSlR/ajyR3PGlCKx8I20PkmIgW1jXT/0P2Vlf3i4cIM	t	5eb877a4-75bc-4c89-92a4-c1384e3903d8	2026-07-14 21:57:54.089	2026-07-14 21:58:16.838	0	\N	f	f	$argon2id$v=19$m=65536,t=3,p=4$e/gyVtctRFzDTAHxvkELSA$LlmwQJ9ZYaIzytGuU7La6vjwRWGXD82y9rWFBdFQ3Wk	f	\N	\N
a772e23b-4a8d-4ace-94dc-bf40a9291f2e	cashier@dahabperfume.local	Local Cashier	$argon2id$v=19$m=65536,t=3,p=4$xCJ18Aig/CfXQWlUdFL2hQ$acuYhABWfmhuL5ujNYg+pTIeCJR+3USz9wJPzFbdKIk	t	457e87e1-50cd-4dda-b108-ac460a1ed577	2026-07-13 21:46:01.79	2026-07-19 15:41:27.873	0	\N	t	t	\N	f	\N	\N
41b50e80-2df9-4834-9042-f383be8ec7b0	system@dahab.local	System Admin	$argon2id$v=19$m=65536,t=3,p=4$8pm1dPE7SEDLG4D04ZfYjg$3tvsz6+YHVXYXDmtuQSGPn0D7aB9cYStHJfTVRoRS50	t	92c1db3d-1bd7-49a7-ac08-aa3b223bdfea	2026-07-13 21:45:56.181	2026-07-20 15:04:15.546	0	\N	f	f	\N	f	\N	\N
4c5a899c-e6e8-45bb-9829-3db589243422	admin@dahabperfume.local	Local Admin	$argon2id$v=19$m=65536,t=3,p=4$oWrzw8rHkZHP6zCcHzaHpA$5nEF3frIJVAdCCfQKVzwsc5yTyGm/rLHX6FlFLs00ok	t	92c1db3d-1bd7-49a7-ac08-aa3b223bdfea	2026-07-13 21:45:57.736	2026-07-15 08:22:19.838	0	\N	t	t	\N	f	\N	\N
\.


--
-- Data for Name: EmployeePermission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."EmployeePermission" ("employeeId", "permissionId", "createdAt", effect, "expiresAt", "grantedByEmployeeId", reason, "updatedAt") FROM stdin;
a772e23b-4a8d-4ace-94dc-bf40a9291f2e	924fc95e-c26e-4c39-b3f2-83af37dea0f8	2026-07-14 09:40:40.119	ALLOW	\N	41b50e80-2df9-4834-9042-f383be8ec7b0	Direct Admin Assignment	2026-07-14 09:40:40.119
a772e23b-4a8d-4ace-94dc-bf40a9291f2e	2cc0b58e-f492-46dc-955c-4786b6f60512	2026-07-14 09:40:40.119	ALLOW	\N	41b50e80-2df9-4834-9042-f383be8ec7b0	Direct Admin Assignment	2026-07-14 09:40:40.119
a772e23b-4a8d-4ace-94dc-bf40a9291f2e	85a1b0b9-04cd-41f7-bfcd-86a86014cbec	2026-07-14 09:40:40.119	ALLOW	\N	41b50e80-2df9-4834-9042-f383be8ec7b0	Direct Admin Assignment	2026-07-14 09:40:40.119
a772e23b-4a8d-4ace-94dc-bf40a9291f2e	e3657242-d9e8-4635-a714-e33cb2fd0f61	2026-07-14 09:40:40.119	ALLOW	\N	41b50e80-2df9-4834-9042-f383be8ec7b0	Direct Admin Assignment	2026-07-14 09:40:40.119
8a0eca09-7ea1-4c06-b131-e2df2d50c12c	2cc0b58e-f492-46dc-955c-4786b6f60512	2026-07-14 21:58:17.582	ALLOW	\N	8a0eca09-7ea1-4c06-b131-e2df2d50c12c	Default cashier POS access	2026-07-14 21:58:17.582
\.


--
-- Data for Name: FragranceFamily; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."FragranceFamily" (id, name) FROM stdin;
23cd02cb-ce77-4bfe-9026-f2faab1109ba	أروماتك، حمضي، خشبي
dbacd355-cb1b-4667-9aa1-70b6f21e81b7	حلو، زهري، دافئ
dccab504-3627-4507-995b-a7c0b3d49a19	عود، شرقي، عنبر
65e1feb8-c0f2-4ee5-a769-98f475d9ac7e	زهري، خشبي، عنبر
37d9b4c5-5024-4ae0-ae41-029b6081d694	فانيلا، منعش، زهري
d50ad458-b4fc-4d8b-a69c-e56f502be3b0	زهري، منعش، أخضر
3cbeebe2-1fd3-46d1-b0a7-90cdcf1585c6	زهري، حمضي، فانيلا
ea599b27-346d-403e-bff1-ea3e02dcbc88	زهري، فواكه، بودري
7ac9c0f9-134c-4515-bacf-9b2a254f5646	فانيلا، زهري، دافئ
e3317efc-95aa-477f-bb07-92ed95a2372b	فواكه، زهري، بحري
b8b9be4f-7a90-4cd0-81d8-f71d1be413ba	زهري، عسل، دافئ
e7bab132-58db-462f-be68-241a0cfb71af	فواكه، زهري، خشبي
588c48fd-2dbe-4265-9d9e-c188e4c79685	زهري، شرقي، فانيلا
d7cfce6d-6062-461f-a8ea-180775824756	فواكه, حمضي, فانيلا
6363f08b-89b2-4c45-9d1e-4fec2a32b2ed	زهري، فواكه، مسك
f5ecdfb8-b963-4def-bf90-ee4f20f111bc	زهري، فواكه، حمضي
03f67098-2b12-4a51-8307-26ddfa7f1a90	بودري، زهري، فواكه
8863dae1-d79b-44ee-8205-24347218db2d	فواكه، زهري، حلو
fbcac733-ec30-45ab-afad-bed1b68c25e4	فواكه، زهري، منعش
71c9fc88-2452-4478-b1b0-1440980530bd	زهري، مسك، ناعم
68dce486-15a5-41b7-801b-7a51839e6718	فواكه، زهري، مسك
0cf0739c-0014-404a-82ff-68b0c5126e67	حلو، فانيلا، فواكه
58a47922-431f-4c54-b902-57313692c18f	حلو، فواكه، فانيلا
0f3f0284-2f5f-46d5-baa9-5d1530a80cd8	فواكه، حلو، حمضي
bf2dce4d-06f4-4565-8ee7-1d77be813b66	شرقي، حلو، فانيلا
22e991fe-a953-4a40-8574-36d5f1c1609b	فواكه، حلو، دافئ
e904e1cb-bc67-45a9-a96b-31d514527411	فواكه، زهري، فانيلا
1fdfe318-018a-49c0-b164-74a0baad0a72	زهري، مسك، منعش
9c70bd66-3ef6-490a-b6a3-596340ad8856	زهري، فواكه، ناعم
0cf70ef6-deae-46e7-94a8-48fdc8896aa0	فواكه، فانيلا، خشبي
c5090b09-8992-4d3d-b05c-76cee0a0f037	بودري، زهري، ناعم
579cf094-dfbf-4088-b588-9dd640e41d28	زهري، حلو، عنبر
31962865-2662-4079-9c11-dff116a6259f	زهري، حلو، دافئ
d58c0308-8f48-4d69-aea0-da7ce2d3e254	شرقي، حلو، خشبي
79c4fc65-12ff-4a25-be4a-caa1f54324bb	زهري، مسك، بودري
739a2139-8ff4-4bda-9966-539dab4ce193	حلو، فانيلا، بودري
374874b7-0c69-4b05-9032-5805aeb06c97	حلو، فواكه، زهري
f4bf219f-39a3-4722-a6e3-91a7a593364b	منعش، فواكه، زهري
d2871147-562c-4d81-a3c7-58dc0f67053b	زهري، مسك، أخضر
590e3ad1-747a-43e1-b9e3-3efa426cf9d1	حلو، فواكه، دافئ
79d5fc87-0611-4b22-a53f-196efc6cc093	زهري، فواكه، منعش
e2bdf3b1-c08a-469b-980c-d248be3ec4b9	حلو، فواكه، توابل
23954756-186e-4942-84e3-07d8a8b69733	حلو، زهري، فانيلا
3da57818-e495-4235-a58a-3eb9099e3bdd	حلو، فانيلا، دافئ
b7d730a2-dc24-4357-a110-1809fdf51c40	حلو، فواكه، منعش
171be19a-ca88-4585-8f5e-88c69f8aff53	فواكه، دافئ، خشبي
55d39187-cc00-4ea3-83b8-abd614c0eef6	فواكه، حلو، زهري
adeb86d4-22ba-4a6b-8d56-3c1fd2f50d24	حلو، فانيلا، توابل
959f65d9-a5d3-4ae9-9d0b-e276853fa7cf	حلو، شرقي، فواكه
5ebf6a3d-63a9-4622-9453-2b510b2ab20d	منعش، زهري، حمضي
b56da027-aaac-42d3-af23-800a717473f5	فواكه، زهري، حمضي
56e2f21e-a24e-4ee6-bd1b-f20038518558	زهري، باتشولي، منعش
86379d33-5d24-4ec2-9f04-2818a627bfa4	حمضي، منعش، خشبي
9b4e3e97-e402-4fc7-a2c2-39f7662cc44a	فانيلا، حلو، دافئ
c4b1ab5f-d645-4cfb-af75-d1738c843945	بودري، مسك، ناعم
97db8ca7-3586-4020-8c18-fa4f6896efe8	زهري، حمضي، مسك
c01c285c-8cad-4cce-b71c-2740264b52e6	فانيلا، زهري، باتشولي
05b8c34f-5118-4803-bc9d-80d7066d20ab	فانيلا، زهري، بودري
bc74a6d2-8142-42c7-bb84-a0baf76afd46	حلو، دافئ، كاكاو
9a04132f-a486-4d64-8015-39d0c61ce36b	زهري، فانيلا، دافئ
fe554c46-2be0-4809-8a7a-cac06af4ca20	زهري، ناعم، منعش
56a80d47-4569-4d90-a5e5-c9deebc1e2a0	زهري، حلو، فواكه
7f23b36b-c55c-4e94-8f36-757b12396d0c	زهري، توابل، دافئ
e4d6f4c5-b964-46e6-b01a-bf2257eae3c1	حلو، فواكه، باتشولي
36fc8a8f-e410-4576-bb9c-f0cb4881aed4	زهري، حمضي، خشبي
70113ada-1fdc-4a6b-b28b-d1f877be1e8f	عود، شرقي، جلدي
34043d63-b89d-474e-a43f-cb4e800b2ba3	زهري، حمضي، منعش
ce8e6c78-35a3-4673-a33d-fbc8b1c022d7	فواكه، فانيلا، دافئ
8bb1c828-a66f-4ff8-bbe6-ad3a00b95fa0	حلو، فانيلا، حمضي
aad32845-786f-4a91-b29e-0898331d4b8d	حلو، دافئ، شرقي
996d49c0-0aec-438a-b84f-434f51c26ec4	فواكه، منعش، بحري
964cc1ea-e8af-45c4-a96a-63add1e80c14	فواكه، حمضي، خشبي
af13e7f8-71bd-4899-a0c6-e68c9d82de14	منعش، زهري، خشبي
9fc738f6-fd4f-4347-b8e8-60cb66c3fb51	زهري، خشبي، ناعم
e9fc9ae9-bd8a-4ef6-8b96-1c326a777b94	زهري، حمضي، أخضر
1bc2496e-4d07-4722-8114-4fa68623aac9	بودري، ألديهيد، زهري
255a8e50-0cef-40a8-8d6a-54a1bfa3eda3	حلو، باتشولي، زهري
4379c839-78ef-466f-ac2d-125b5a556a09	حلو، دافئ، توابل
e853c3c8-c0bc-46dc-a695-926f266aafd7	حلو، توابل، منعش
09d977dd-8c56-4451-98c8-2408d741def6	بودري، فانيلا، مسك
8a14e08b-0bd8-4f75-820a-73f7ec1fa820	زهري، حلو، شرقي
48d6e4f0-dea5-4aae-83cb-8d0f2b35c286	فانيلا، دافئ، زهري
04f41f82-a809-4997-84d5-ef7b12230bf3	زهري، حلو، باتشولي
2fa6c608-80bf-48ec-b356-92504920c5a3	زهري، حلو، توابل
434fedfa-1e6b-4fe8-84c8-d3ab2332043c	منعش، فواكه، أخضر
bb1221d1-a973-41f7-9463-8e527df76797	حمضي، زهري، مسك
5a24b8e6-20da-4e81-8048-d5e8af784922	بحري، منعش، زهري
51136283-a3d2-4836-8ec3-c6032f679cb1	بودري، زهري، فانيلا
906ad035-91a5-4fe1-a952-05823522c6ac	حلو، دافئ، جوز هند
397c4fa8-867b-42f2-bd92-fd838d2537f3	حمضي، باتشولي، زهري
d918b9a2-4613-42c8-9cdc-f9b2622f5f1d	شرقي، خشبي، حلو
e1f15c53-3d35-473c-9cc1-866295425fc9	باتشولي، زهري، دافئ
d75b99d5-51af-4de6-b85d-8e624f42ed5e	حمضي، منعش، فواكه
bf415944-2f79-4ae1-bbcc-95ce450d8770	زهري، مسك، جلدي
08c339ca-e698-4c25-b6ab-9c991431cd4c	توابل، زهري، دافئ
516024f6-c08d-46d1-86f9-645f4087480b	فانيلا، حلو، مسك
a4744bbb-7bfd-4eae-a718-a43d828dca85	حلو، زهري، فواكه
bd31f9a6-533b-42aa-8f47-90e62b090715	حلو، دافئ، زهري
988b6faf-a987-4716-ab09-30cf69746431	زهري، حلو، فانيلا
07e648c0-0b87-4d8c-b279-78c540cf5cf3	زهري، توابل، منعش
1aac4ed1-9ff0-4a5a-8086-54b4a01bfe47	فواكه، زهري، دافئ
ddd1d91c-5c09-412f-b938-db48acdac024	فواكه، حلو، باتشولي
efd988b9-4b86-48bf-b1b4-58607c8b2b35	فانيلا، حلو، زهري
1327867d-511d-4598-96d7-c9cd9dd9c6de	فانيلا، أروماتك، زهري
0edf36a2-00f6-4b96-ba92-a27ba822f387	مسك، زهري، ناعم
1b9c945e-6d91-413c-9c67-9568e174f5f3	بودري، مسك، زهري
83fb1561-91af-4138-8656-180dddc9381a	بودري، زهري، دافئ
3da5312c-0af4-4e59-b0ad-8eeb70d9fa17	مسك، زهري، باتشولي
eb3d7c89-1ff2-4551-a553-e3bc7481c410	مسك، زهري، دافئ
77c53957-6010-46c1-a1bc-5fdc860833e6	حلو، فواكه، حمضي
ca015821-8ce2-4a8a-8fbc-6852e4d53383	فواكه، توابل، دافئ
6c238c82-0aad-48f1-9fa8-c5daecba81d8	بحري، زهري، منعش
153bc492-d0fa-42d6-8ba2-0a7fc516cfe8	زهري، بودري، جلدي
f5fa056a-9891-43f6-a8cd-3ada17a62c66	حمضي، زهري، منعش
bff637d0-aec0-44e6-8d4e-8ad78ab947fa	بحري، حمضي، خشبي
b5f7dca2-d1ff-4bc6-bf42-29a5e30c20ea	شرقي، دافئ، توابل
3463e1c1-c649-40eb-87ee-d4e21d94159c	بحري، توابل، دافئ
e98337f4-cc57-43ae-ab6c-7050c578a699	حمضي، توابل، دافئ
b669b759-3b36-4678-9eb3-a6b655b8ad2c	حمضي، بحري، منعش
81674482-44d7-4c7b-840a-41b2e477a455	توابل، خشبية، دافئة
71f40926-1dfe-47b1-a82e-c3ccc1c78377	شرقية، دافئة، توابل
91c400b3-ea89-4f70-85f7-9705f51b39a0	توابل، جلدي، دافئ
86473976-ca97-4f39-b02f-8006a5675429	حلو، جلدي، دافئ
343079b1-ac32-48b7-882a-7bff605973c9	زهري، منعش، مسك
234bd967-6aa3-4c9a-bdb3-2d42dda1742f	أخضر، توابل، جلدي
24f64784-fb23-41ae-a0d3-bbe52d8b3c33	حمضي، توابل، منعش
09356d45-cdbe-438f-b6a6-0462db2f4a7d	جلدي، حمضي، دافئ
5447e64b-92fe-4c71-a932-31a0ff1a072e	منعش، حمضي، زهري
01fa1386-49c4-4794-b0d6-c15026d2039f	بحري، حمضي، منعش
13e702ee-13dd-4366-90ee-98d3afc13155	حلو، دافئ، فانيلا
99890cc6-651c-4e1b-9856-ff665d04d89c	حمضي، خشبية، دافئة
472f8d38-a518-4c80-985e-807d3b095643	أروماتك، منعش، خشبي
93539e25-7737-439b-96f0-5fe67115fd8c	حمضي، زهري، دافئ
35d83e52-5c67-4bf4-ab3e-f1b22f4cc12e	خشبي، زهري، ناعم
783ddc39-4e79-4961-ac0a-7f37058187d5	حلو، دافئ، خشبي
61a34f82-bb0e-43f9-ab9d-df509dae581d	حلو، توابل، خشبي
87eb85f9-82dc-4b19-aeac-22f0ff4e85c9	خشبي، جلدي، دافئ
693aada7-58ca-4914-abaf-e7bea863cee6	شرقي، حلو، دافئ
4ff7b39e-5a9f-4cdc-bd4e-b69bdf32dd25	خشبي، منعش، مالح
56c1ed18-715b-459d-971f-0fed5aaf7ad4	حمضي، منعش، أخضر
329f2ed4-d413-451e-9f0f-8c1a205a3c72	بحري، منعش، جلدي
0724bb7a-19f7-4c2e-bce7-2a7495adc482	توابل، دافئ، جلدي
e8137618-0f88-404b-b02f-4026c0b78868	خشبي، توابل، منعش
fc6d36bc-cb24-4d76-acc7-512877e16ab3	بودري، زهري، منعش
cb26e338-4ae8-4dc6-bde5-ac98c5e9b3e7	حمضي، أروماتك، حلو
db28bbe4-82cb-41ea-aae7-2e66f8f73238	توابل، دافئ، حلو
3894ff07-f0c8-4c02-97f6-2cea17b9f8da	بحري، منعش، أروماتك
eebd8df9-62a4-4776-ae80-f44f87fe7471	أخضر، منعش، مسك
05b94a45-7685-4cae-aa4c-254a2e2ba4c3	أروماتك، حلو، دافئ
bc7cd308-88f3-43d4-834b-1f2f52924704	حلو، توابل، دافئ
3a8726fb-9783-489d-bf8f-5e68ba196687	منعش، توابل، دافئ
789332c4-9490-4a0b-b649-9e9b1ccc4399	منعش، حمضي، فواكه
83122c5b-4562-43d3-8272-5619ff34020a	منعش، توابل، خشبي
fea0ee67-0f6f-45f1-a3ad-31b7fcb2c206	حمضي، ترابي، خشبي
05612fd2-46d5-4d0c-bdb0-1f93ffc0fd34	خشبي، جلدي, دافئ
ef0047bf-5fe8-4b92-9110-1effce9f8419	حمضي، أروماتك، خشبي
149c544b-5063-4db0-ac7b-51feaf3e8449	أخضر، منعش، خشبي
75e88640-d6d9-4e0b-b86d-66dc86de76ee	منعش، فواكه، خشبي
8f7a9ff1-b862-404b-841f-df670cd04138	بودري، حلو، دافئ
4c0155bc-2c3b-4f7a-95cc-06415610270e	خشبي، أروماتك، حلو
812a3529-671d-4a3a-806a-1d63f07c897a	جلدي، دافئ، توابل
9bd8eb7b-0ef5-4399-8f51-d39227cd47c4	أخضر، جلدي، منعش
a78280b1-ab5c-411b-be06-d4158df9ba00	أخضر، منعش، أروماتك
b6d8ceb0-6804-470b-9795-73394a223737	بحري، منعش، فواكه
cafc7aaf-5e45-445f-85be-90904c8ada5b	أروماتك، أخضر، جلدي
aa9c9d7e-00ab-447d-bc52-a33a21ca927d	حلو، منعش، فانيلا
a855ceb4-5188-4ef7-aa77-5cbebe991f7d	حمضي، منعش، بحري
657f5793-f690-4c37-840e-087b15e237b4	فواكه، أروماتك، توابل
fe2300e9-e7d2-49f5-83cc-9d37cb81c0c2	توابل، فواكه، جلدي
04c8ef92-b754-4652-a5ab-2a19c18c9073	شرقي، خشبي، توابل
cca8557d-cf0a-40e7-a844-b7b97ca98fb9	مسك، منعش، خشبي
695fd344-ffed-40f0-a36b-9050efcafd69	حمضي، منعش، مسك
47ee89a8-4656-414e-8ee0-b50a501da18d	جلدي، حلو، دافئ
6380d6ef-8411-4e7b-b574-f5d253001385	حلو، دافئ، أروماتك
86895f97-0f1b-4820-8fda-c94f4ee76a9a	حمضي، دافئ، خشبي
fec44987-89ed-4b5e-b1e4-dcbaedc90704	توابل، دافئ، أروماتك
2a33c55b-21d8-4d9e-a520-9dabc1e776af	منعش، أروماتك، خشبي
bc6bff2b-1732-4a17-8d4a-da03e4ddf6cf	حلو، أروماتك، فواكه
9781c890-0782-4997-a095-523133e5f04f	حمضي، زهري، حلو
110bcabf-bd0b-47c2-89ed-5032d3ac64f0	جلدي، توابل، دافئ
43e123c2-a3bc-4833-8072-5251601b6eb9	بحري، منعش، أخضر
b5f9df0a-3e4c-4219-81eb-e0c48141efe5	توابل، منعش، خشبي
a2d70cb8-0d7b-4d53-a2a1-0c96dfd8c2e5	منعش، خشبي، مسك
034d7a73-0d34-4beb-8224-407917b71783	حمضي، أروماتك، منعش
6cdeafd0-e664-4bfe-b733-6f647bc84640	بحري، منعش، ترابي
e0202d2c-70a8-4946-82b9-7ab426d8dcbd	خشبي، توابل، دافئ
f4d18153-f01c-4ee1-9dcb-9e066ff28b33	زهري، فانيلا، منعش
647ea3b0-bedd-460a-a26c-31c649095589	جلدي، أروماتك، دافئ
ad3fe7e3-276a-4780-bb86-3ca8675f78b0	أروماتك، توابل، خشبي
b62bfd9a-ff66-4c27-b5d2-f4c384601755	شرقي، زهري، توابل
c638969a-1f55-4101-b842-12959b765fe4	بحري، منعش، مسك
fcfb82d7-5d66-481d-ad6b-3dcdc9c7ae1a	فواكه، منعش، خشبي
1b99cb18-86fd-45f4-b3f6-d112a46174fd	بحري، أروماتك، خشبي
8b48b1e9-4fee-4642-b3cf-33f185bc0d75	حمضي، منعش، توابل
be6fd238-f164-4c18-a857-9acf561b6cf1	توابل، دافئ، خشبي
97c2be19-ae53-4739-959f-911d724aedba	توابل، أروماتك، دافئ
2f399245-1a66-4d90-a58a-61561624dcf0	منعش، توابل، حمضي
80639e5a-992e-4d2e-942f-1473278ec37b	أخضر، منعش، حمضي
fabf7ff5-e5e3-4295-a7fd-a40d1d9cf116	بحري، منعش، حمضي
5b2b169f-227f-49c8-9dd1-61cc7ed6b0af	حمضي، زهري، جلدي
3d33c5b2-b3d1-441c-98ed-047910e8b750	حلو، أروماتك، دافئ
e82826f4-88ec-473e-a82a-aef755a91786	شرقي، أروماتك، منعش
825d1052-989d-47c2-8af4-9e113a5d75d9	توابل، دافئ، شرقي
9185d651-5bea-42f3-8b9d-afdbd72dc920	أروماتك، جلدي، ترابي
a53528ff-76f0-418d-a01e-6bbfc2b3c96b	حمضي، توابل، حلو
c39d8af1-0d6f-4d30-8e6c-131bf8003ce5	تبغي، حلو، حمضي
c37cd5a4-143d-44da-812a-57e4bd4816ff	عود، زهري، عنبر
c804bfc3-cea5-4e6c-ae9b-df1380261163	خشبي، زهري، شرقي
6fb6a7bc-b7da-4db3-9173-7d4b06dd913f	زهري، خشبي، حمضي
6a498893-46c5-418c-8681-7d2e2583b7f9	بحري، مسك
9826b3c3-abcd-4200-8f87-51565386e59e	زهري، حلو
809e382b-7961-48ee-b065-54734c3f2c94	زهري، عنبر، شرقي
70c3ed41-d44d-45fc-bac1-6a8356ebc460	عود، شرقي، خشبي
78374c00-4fff-4221-b313-79f1000e267a	خشبي، حمضي
a9c5dee8-0d68-41e6-b21c-4d158d5509ca	حلو، شرقي، خشبي
33d0212c-bc66-4110-a35f-e63a5f349765	عود، زهري، حلو
2e745396-3825-4886-b823-f570f1f72750	شرقي، عنبر، عود
633eb004-96b4-4c8d-80e3-90509bd490ae	حلو، زهري
ec0c5172-bbf7-4c24-865a-b8b741c5515b	تبغي، عود، شرقي
567064fb-f8a9-4cd7-8201-eb5e5a09b9c9	جلدي، عنبر، شرقي
fe0a28e6-584c-453c-96c1-f14475a9502c	عود، عنبر، مسك
46a05814-9e99-4583-a99a-4888993ac60b	زهري، مسك، شرقي
d7ee7f59-ca59-4153-aa88-d6253776cd9d	عنبر، حلو، عود
2ded4d61-d1d3-45aa-b898-b9b438cc5b25	عود، زهري، مسك
758abe9c-f12e-4edc-9151-111ba3d762b6	فواكه، عود، جلدي
d6eb6693-8afb-4f66-8e7e-602c14ebee8f	حلو، عنبر، مسك
6f40b271-1c95-4258-b8bd-b98419b14c33	فواكه، حلو
0748af35-c3ca-4010-8aea-ae4af64c4def	فواكه، حلو، مسك
75c01a70-9ecd-4d6e-9bcd-f59ac6c5bfc8	حمضي، حلو
21a0ad07-e952-4911-8cf3-486f7873e895	فواكه، حمضي، مسك
24d1f80f-822a-4071-828a-123131c24718	عنبر، حلو، مسك
9f9bac48-7427-4be5-b6dd-96c385132db0	خشبي، عنبر، شرقي
7bd072e4-4ffd-420d-8bdf-17fca204c170	زهري، مسك، حلو
aa7ce6ba-dabd-4d62-bf2b-ebe0d8f9fd21	خشبي، مسك، حمضي
57840ef0-005e-417b-ba07-8b318e13ec77	عود، خشبي، شرقي
b1af6c47-39d8-4528-b400-0c6c82e59727	حلو، خشبي
b8c01dd7-8415-4eee-979c-e5796ed63357	تبغي، حلو، شرقي
bd92a615-65f0-4ef5-9aba-51ab03e7ccb6	زهري، مسك، عنبر
122acbbd-210d-450b-83e2-d11823326529	حلو، فواكه، مسك
01a1d4f4-88ad-48e1-85ab-21ffed71a368	تبغي، شرقي، حلو
fb43f478-f89b-4400-abf9-b6afe710b471	عود، زهري، جلدي
5f68e9aa-8219-4d4f-8181-f4c4b40f8eee	عود، عنبر، شرقي
a4592969-ead0-4e39-a7ee-88550efb0a63	حمضي
bff06f82-9427-4c1e-8112-185261c4178c	زهري، خشبي، مسك
0f0a930a-cc39-45ae-b4f4-8f0e955443ac	عنبر، مسك
e08563fa-f126-4fc5-84ae-ba83b6623d84	حمضي، بحري
124f771d-9390-4a09-8118-16b894768f96	عود، خشبي، زهري
af13b3a6-ba06-4874-89a8-dd2358cc056d	شرقي، حمضي، خشبي
cb07ea0c-a695-422c-b4b6-905b32e28b99	حلو، عنبر
ad0e4d7c-43d8-4b81-9c1b-53706f6c61c9	زهري، فواكه، حلو
52794348-26ce-4440-98b7-5d5db4f6a49f	زهري، فواكه، بحري
6bd6c242-e39e-4234-b678-3d6a8fa85650	مسك، زهري، حمضي
0d2a3e1c-c334-43fb-a89e-52d87b47d5e2	شرقي، عنبر، جلدي
37167a54-afab-488f-94d8-fa36e1ccf1d2	عنبر، فواكه، خشبي
35ff6631-e19b-4710-ac71-e47effb275e4	مسك، زهري، عنبر
e3d56a18-cc20-48b5-b8c6-ffac045e0252	حلو
d9ed961b-792a-433f-ac3b-da42dc5d37d8	مسك، حلو، فواكه
ac963f59-2832-4f10-9e6d-d60b32fe1bd2	مسك، عنبر، خشبي
4d55cdec-8fb2-4fb6-86f1-ad87c6419fc3	مسك، زهري
70bfade4-b5e9-44f3-b21f-c56783b9049e	مسك، فواكه، حلو
850e8a1c-9dd3-415a-8c5e-a3d987ad16aa	مسك، عنبر، حلو
05cf46cf-7015-4d9b-869c-05921c43327f	حلو، مسك
36dc0045-2317-42f2-a223-a3f201d9992b	مسك، جلدي، عنبر
daf7c774-4665-4cce-8ce1-cc6078b9ca94	حلو، عنبر، شرقي
fd7aae23-8a11-4fc6-af84-4c835c186a15	عنبر، شرقي، زهري
5e9f5dd2-e432-4d90-8473-c0a5f4d3d633	عنبر، خشبي، حلو
dfadab1d-d7cc-43a3-9163-7d6ce2a6940c	زهري، شرقي، عنبر
73c34ac6-4246-4c15-8fd4-2fbe1980a2cd	خشبي، مسك، فواكه
3e8e153b-547e-494a-b8d2-66e9f0bbd06d	حمضي، شرقي، خشبي
59477fa0-bcf1-404e-8db7-4b6c2d418db3	شرقي، خشبي، عنبر
2081c470-d37c-4266-8957-fe46c2862d91	شرقي، حلو، عنبر
31845506-dd6a-434a-b3b4-81d475baa5c1	عنبر، خشبي
12681f33-087a-4664-83e7-c26a3f08da3e	شرقي، تبغي، خشبي
7d95e3ee-9342-4d07-bef0-ebdef2235d7f	زهري، جلدي، خشبي
7203fb86-02ff-4d21-b635-41b5ddf341d5	جلدي، شرقي، عنبر
eb735750-80fc-4302-b17e-4edf6532f275	شرقي، خشبي
1dfc7cc5-0034-48e2-8ef3-9b07d9349f22	خشبي، مسك، عنبر
82afd46a-3d54-4ec8-a48e-fbeda9cad867	عود، شرقي، زهري
164747fd-ce80-47e9-9781-7d2af402e7f5	عود، جلدي، شرقي
355ee5ef-8269-4bf9-9657-86ecbd2257ef	عود، خشبي، عنبر
5ee2e39a-7f4b-469a-8bb7-fd9f1ff6247d	تبغي، جلدي، عنبر
18096b42-cc7d-4889-8fe7-8a2e4985dcbb	عنبر، زهري، حمضي
984f8f6e-e321-475a-adc4-08db65972893	شرقي، عود، عنبر
e715ad54-9c4c-4739-859e-0ec571d1dbb7	تبغي، حلو
81a5c807-3887-4884-8673-f92ac5255d1b	عنبر، شرقي، حلو
68341ac3-e685-48a7-94d7-ce06a044f234	حلو، جلدي، زهري
4de6df8b-52fa-4099-843b-e3d6e7fef000	خشبي، زهري، جلدي
1dbbf6be-9d42-4867-9c2e-53564cffdbb9	جلدي، حلو، شرقي
c2177830-fb30-41cb-a511-86dc819ab57f	حمضي، مسك، عنبر
7e70a695-4282-425e-9355-d0af5fabe3c1	مسك، خشبي، زهري
13b9fd2d-c819-43b6-a47f-5d080279ee9f	شرقي، جلدي، فواكه
639c7966-5236-4fa1-a3e6-6a1172318e9f	زهري، خشبي، شرقي
c7c2bc88-2c9d-4e13-b885-4f35179e441e	جلدي، عنبر، حلو
89be0798-b5ad-49ad-804a-e0e66f8fd768	عود، شرقي، مسك
6b0852eb-0765-4323-a4d8-b3f8a69daae1	حمضي، خشبي، مسك
b200be6a-1bb6-413d-b6bb-38b98d9acbcd	عود، خشبي، حلو
b9f6b64b-d342-4a13-bba3-4fc29f53ec56	شرقي، زهري، حلو
201e13b6-eb01-4abf-b592-c8a9d20e6e1e	حمضي، فواكه، مسك
9ee7912b-26f8-4d40-ad6a-f16cc07b6301	شرقي، خشبي، مسك
1eba2bee-fd7e-4f50-8532-f6a4c4c685ba	حمضي، مسك، خشبي
e0176c26-d2d6-4bc6-bcbf-bbbf7ea25e5c	عنبر، زهري، مسك
b95b6053-08d7-40ac-b383-ae43e9bb7c6d	بحري، حمضي، مسك
c8872534-793a-4d06-bade-b23fb12da689	زهري، عنبر، مسك
893ccdc0-0e5b-45df-b154-74bac560d820	حمضي، خشبي، شرقي
9ff688bd-23b1-40ac-80d4-5130fc2fc711	جلدي، عود، شرقي
\.


--
-- Data for Name: Gender; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Gender" (id, name) FROM stdin;
92fcd610-5dfa-489c-a894-ce8e7687c361	رجالي
2e1d252f-3122-489a-a44b-c687c07ef1a0	نسائي
55719cb3-2581-4ade-854f-d90e64e837ea	مكس
\.


--
-- Data for Name: GlobalPricingSettings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."GlobalPricingSettings" (id, "taxRate", "currencyCode", "currencySymbol", "pricesIncludeTax", "taxEnabled") FROM stdin;
1	16	JOD	د.أ	t	f
\.


--
-- Data for Name: HeldSale; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."HeldSale" (id, label, "customerName", "customerPhone", reason, "employeeId", "cartData", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: HomepageHeroCarouselSettings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."HomepageHeroCarouselSettings" (id, enabled, "autoplayEnabled", "autoplayIntervalMs", "pauseOnHover", "showIndicators", "showNavigation", "transitionType", "updatedByEmployeeId", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: HomepageHeroSlide; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."HomepageHeroSlide" (id, "titleAr", "titleEn", "descriptionAr", "descriptionEn", "eyebrowAr", "eyebrowEn", "ctaAr", "ctaEn", "imageDesktopPath", "imageMobilePath", "altAr", "altEn", "destinationType", "productId", "categoryId", "internalPath", "externalUrl", "displayOrder", "isEnabled", "startsAt", "endsAt", "openInNewTab", "overlayStrength", "textPosition", "createdByEmployeeId", "updatedByEmployeeId", "createdAt", "updatedAt") FROM stdin;
e31c2775-ee23-4f89-a137-e61907e1d171	تشكيلة الصيف الجديدة 	New Sammar Collection	انقر للاختيار						https://veazstnewxdrvqjltayg.supabase.co/storage/v1/object/public/uploads/1784218733728-0xxr7du.mp4	/slide-placeholder-mobile.jpg			INTERNAL_ROUTE	\N	\N	/collections		0	t	\N	\N	f	0.4	CENTER	41b50e80-2df9-4834-9042-f383be8ec7b0	41b50e80-2df9-4834-9042-f383be8ec7b0	2026-07-16 16:20:58.611	2026-07-16 16:20:58.611
9f500a43-642a-469e-ba70-1edb90a96508	تشكيلة الصيف الجديدة 	New Summer Collection							https://veazstnewxdrvqjltayg.supabase.co/storage/v1/object/public/uploads/1784218867477-lk97skw.mp4	/slide-placeholder-mobile.jpg			INTERNAL_ROUTE	\N	\N	/collections		0	t	\N	\N	f	0.4	CENTER	41b50e80-2df9-4834-9042-f383be8ec7b0	41b50e80-2df9-4834-9042-f383be8ec7b0	2026-07-16 16:22:11.298	2026-07-16 16:22:11.298
\.


--
-- Data for Name: ImportJob; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ImportJob" (id, status, "fileName", "fileType", "totalRows", "successRows", "failedRows", "skippedRows", "confirmedBy", "startedAt", "completedAt", "errorSummary", "createdAt", "updatedAt", "employeeId") FROM stdin;
\.


--
-- Data for Name: ImportJobRow; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ImportJobRow" (id, "jobId", "rowNumber", sku, "nameAr", "rawData", "normalizedData", status, "errorMessage", warnings, "resultStatus", "entityReference", "createdAt") FROM stdin;
\.


--
-- Data for Name: InventoryMovement; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."InventoryMovement" (id, sku, type, quantity, "employeeId", reference, "createdAt", "quantityAfter", "quantityBefore") FROM stdin;
2b620367-d327-49bb-867c-ea612352f443	CLA-001-50	SALE	-1	41b50e80-2df9-4834-9042-f383be8ec7b0	ORDER_CONFIRMATION_ORD-84DC4874	2026-07-14 15:08:21.707	3	3
595bbde6-ad32-45de-9fb7-b4c4e722c4ab	DHB-0068-50ML	SALE	-1	41b50e80-2df9-4834-9042-f383be8ec7b0	ORDER_CONFIRMATION_ORD-D7268C78	2026-07-16 15:06:00.512	0	1
a2b1caf6-dcdb-4314-a5c8-668446f847f2	DHB-0068-100ML	SALE	-1	41b50e80-2df9-4834-9042-f383be8ec7b0	ORDER_CONFIRMATION_ORD-D7268C78	2026-07-16 15:06:01.257	0	0
\.


--
-- Data for Name: Invoice; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Invoice" (id, "saleId", number, "taxId", printed, "createdAt", "orderId", "confirmedByEmployeeId", "paymentStatus", "pricesIncludeTaxSnapshot", "taxModeSnapshot", "taxRateSnapshot", "cardAppliedFils", "cashAppliedFils", "cashTenderedFils", "changeDueFils", "discountAmountFils", "grossTotalFils", "netSubtotalFils", "shippingAmountFils", "taxAmountFils", "cashierNameSnapshot", "cashierRoleSnapshot") FROM stdin;
cddeea9b-4681-4210-ba73-6d7b77466f12	9117a89a-a099-4677-954c-3c60178dcf31	INV-1784018736572	\N	0	2026-07-14 08:45:36.578	\N	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	PAID	t	DISABLED	16	0	15000	15000	0	0	15000	15000	0	0	Local Cashier	Cashier
bb93b4e8-6d7f-4bb3-b998-e1913d9e0ab9	b86d1e63-d6e4-4076-b133-d152aa587f7f	INV-1784041004619	\N	0	2026-07-14 14:56:44.627	\N	41b50e80-2df9-4834-9042-f383be8ec7b0	PAID	t	DISABLED	16	0	25000	25000	0	0	25000	25000	0	0	System Admin	Admin
cf9c7c01-646c-4d44-a7c2-0a27fea96e18	7b2bf7d8-c64d-4748-963b-b64194dad9d1	INV-ORD-ORD-84DC4874-1784041703295	\N	0	2026-07-14 15:08:23.3	30fab56a-36f8-4f51-9ff6-e7c75bcd06d0	41b50e80-2df9-4834-9042-f383be8ec7b0	COD_PENDING	t	DISABLED	16	0	0	0	0	0	18000	15000	3000	0	\N	\N
48d1c2d2-3701-476d-8d5b-8422df17c03c	eef54d1d-a399-42fe-92b9-ab3dc5dfccd9	INV-1784065554053	\N	0	2026-07-14 21:45:54.062	\N	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	PAID	t	DISABLED	16	0	25000	25000	0	0	25000	25000	0	0	Local Cashier	Cashier
19c14f70-5e34-4ce4-9130-3a4676b1e75a	5ff571f6-24c1-4312-bde6-0de366daa7b7	INV-1784067008053	\N	0	2026-07-14 22:10:08.056	\N	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	PAID	t	DISABLED	16	0	10000	122000	112000	0	10000	10000	0	0	Local Cashier	Cashier
0586f59a-7645-44bb-b827-5196a96e7953	f8a85ca9-6054-49bf-9213-eaa3a05ea788	INV-ORD-ORD-D7268C78-1784214362395	\N	0	2026-07-16 15:06:02.397	a7080dc4-04a3-4b52-9a5a-763740f91f39	41b50e80-2df9-4834-9042-f383be8ec7b0	COD_PENDING	t	DISABLED	16	0	0	0	0	0	28000	25000	3000	0	\N	\N
a515ac4e-9a70-4861-8e78-6993231633bc	a3c69d75-536f-4c89-b707-84e40266d169	INV-1784214502662	\N	0	2026-07-16 15:08:22.664	\N	41b50e80-2df9-4834-9042-f383be8ec7b0	PAID	t	DISABLED	16	0	12000	12000	0	0	12000	12000	0	0	System Admin	Admin
7f26023c-bd79-4c09-baa9-69c26a58999f	c840f4a4-4a2a-41a4-b68f-0b9192119357	INV-1784215045731	\N	0	2026-07-16 15:17:25.734	\N	41b50e80-2df9-4834-9042-f383be8ec7b0	PAID	t	DISABLED	16	0	32000	40000	8000	0	32000	32000	0	0	System Admin	Admin
44132d66-1ddf-41a5-8dbc-2deac0c94a10	b6a55738-bb90-4ffe-8c3b-3f820f2c5314	INV-1784215065609	\N	0	2026-07-16 15:17:45.612	\N	41b50e80-2df9-4834-9042-f383be8ec7b0	PAID	t	DISABLED	16	20000	0	0	0	0	20000	20000	0	0	System Admin	Admin
03ab56ac-3934-4f7f-94ca-69c0262a6492	2e17e59a-8b3f-4c6f-90ba-d0dd28da55ea	INV-1784216179727	\N	0	2026-07-16 15:36:19.729	\N	41b50e80-2df9-4834-9042-f383be8ec7b0	PAID	t	DISABLED	16	0	20000	45000	25000	0	20000	20000	0	0	System Admin	Admin
c16b4454-2538-40db-b658-2ea224de6c94	ed990345-87e9-4483-97df-63d6845eea5c	INV-1784218740434	\N	0	2026-07-16 16:19:00.437	\N	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	PAID	t	DISABLED	16	0	40000	40000	0	0	40000	40000	0	0	Local Cashier	Cashier
5b3a2d87-d0fa-4360-a235-f27270be7479	53b4f3a4-5860-4557-a438-dce24edbae10	INV-1784456544282	\N	0	2026-07-19 10:22:24.284	\N	41b50e80-2df9-4834-9042-f383be8ec7b0	PAID	t	DISABLED	16	0	20000	20000	0	0	20000	20000	0	0	System Admin	Admin
d850f638-617e-4a1e-8f60-975c5fb22754	b9408e69-1fbc-4219-963f-b4ac4dab06e9	INV-1784476209206	\N	0	2026-07-19 15:50:09.208	\N	41b50e80-2df9-4834-9042-f383be8ec7b0	PAID	t	DISABLED	16	0	6500	10000	3500	1500	6500	6500	0	0	System Admin	Admin
d50be97a-b2c6-47c6-ab68-060b0f98dc62	bb83c1fb-9116-4c41-b815-e5eba79167a1	INV-1784480953578	\N	0	2026-07-19 17:09:13.58	\N	41b50e80-2df9-4834-9042-f383be8ec7b0	PAID	t	DISABLED	16	0	20000	22000	2000	0	20000	20000	0	0	System Admin	Admin
\.


--
-- Data for Name: LoginAttempt; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."LoginAttempt" (id, email, "ipAddress", "userAgent", success, "employeeId", "createdAt") FROM stdin;
5cea3300-c3f6-449d-a124-6d382c95a69c	system@dahab.local	37.220.124.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0	t	41b50e80-2df9-4834-9042-f383be8ec7b0	2026-07-13 21:54:56.174
931e4f72-5e80-4a0a-89a3-4ba3fd6c729a	system@dahab.local	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	t	41b50e80-2df9-4834-9042-f383be8ec7b0	2026-07-14 06:58:10.887
65ed58eb-3d45-4abd-8424-d66d00e6bbe6	cashier@dahabperfume.local	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	t	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	2026-07-14 07:14:46.151
625ad2dd-b484-4a5f-af2b-83c912430228	cashier@dahabperfume.local	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	t	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	2026-07-14 07:26:11.401
285d6ee8-9a44-45aa-a0fe-ae2fee057edc	system@dahab.local	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	t	41b50e80-2df9-4834-9042-f383be8ec7b0	2026-07-14 07:51:51.353
b0bd86cb-318f-4b0f-b39e-baff2d2a0d45	cashier@dahabperfume.local	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	t	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	2026-07-14 08:44:31.701
6fed62b0-438c-420e-a624-08a1cc1757f6	system@dahab.local	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	t	41b50e80-2df9-4834-9042-f383be8ec7b0	2026-07-14 09:39:33.153
aa2225a7-51f9-4f63-8fe0-b81330896a1d	cashier@dahabperfume.local	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	t	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	2026-07-14 09:41:04.223
abd027b6-a924-47ae-b1f2-7430d71dc7be	cashier@dahabperfume.local	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	t	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	2026-07-14 09:52:41.124
03971edd-3a92-4812-9814-7358bdb75ebb	admin@dahabperfume.local	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	t	4c5a899c-e6e8-45bb-9829-3db589243422	2026-07-14 09:53:02.892
78ce9030-8970-41f5-acbc-cbf70ac87b1c	system@dahab.local	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	t	41b50e80-2df9-4834-9042-f383be8ec7b0	2026-07-14 09:55:00.391
c6f04fd9-4f17-4c5c-b0d3-218e4e32ce04	system@dahab.local	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	t	41b50e80-2df9-4834-9042-f383be8ec7b0	2026-07-14 10:39:19.755
4e15e313-b4be-4be8-ac50-5624a39d6a65	system@dahab.local	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	t	41b50e80-2df9-4834-9042-f383be8ec7b0	2026-07-14 14:44:11.944
37b64965-e676-4a2a-a471-0ba0f579dab6	cashier@dahabperfume.local	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	t	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	2026-07-14 15:11:25.22
c45b5361-458b-4def-9fa4-43faa08094ba	system@dahab.local	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	t	41b50e80-2df9-4834-9042-f383be8ec7b0	2026-07-14 17:40:56.233
69355611-9df5-45f4-8b61-b2421528c3db	system@dahab.local	176.29.18.233	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0	t	41b50e80-2df9-4834-9042-f383be8ec7b0	2026-07-14 19:32:21.917
3e0c319f-e3ad-4df8-b8ff-087237f8d7d9	system@dahab.local	176.29.209.65	Mozilla/5.0 (Linux; Android 15; Pixel 9) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Mobile Safari/537.36	t	41b50e80-2df9-4834-9042-f383be8ec7b0	2026-07-14 20:24:43.435
19d04157-a41c-41fc-b9bc-665f25381fdf	system@dahab.local	176.29.18.233	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0	t	41b50e80-2df9-4834-9042-f383be8ec7b0	2026-07-14 20:25:16.623
9fd4cf18-096c-4ffe-ae7f-2ca03284c196	system@dahab.local	176.29.171.173	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/30.0 Chrome/143.0.0.0 Mobile Safari/537.36	t	41b50e80-2df9-4834-9042-f383be8ec7b0	2026-07-14 20:44:26.176
ede97e3a-c1c1-4070-811d-7030c6f7f523	system@dahab.local	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	t	41b50e80-2df9-4834-9042-f383be8ec7b0	2026-07-14 21:35:47.174
8a3260c7-70c8-4557-95b2-c7582d4d3910	cashier@dahabperfume.local	::1	Mozilla/5.0 (Linux; Android 15; Pixel 9) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Mobile Safari/537.36	t	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	2026-07-14 21:38:17.074
65e66611-2781-489a-9683-e20f9756e672	cashier@dahabperfume.local	176.29.209.65	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	t	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	2026-07-14 22:02:56.138
242aa2f6-690a-4ff7-bacc-9a5dc3259d80	cashier@dahabperfume.local	176.29.209.65	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	t	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	2026-07-14 22:06:47.726
f22c4901-0a13-47dc-abc6-298787255c70	system@dahab.local	37.220.124.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0	t	41b50e80-2df9-4834-9042-f383be8ec7b0	2026-07-14 22:08:08.713
4668a28e-a88b-4e30-b9ed-5dd201ef0989	system@dahab.local	37.220.124.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0	f	41b50e80-2df9-4834-9042-f383be8ec7b0	2026-07-14 22:09:22.242
5bca3382-c52f-440d-a8ea-02b913d4f763	cashier@dahabperfume.local	37.220.124.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0	t	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	2026-07-14 22:09:39.551
866a0339-ad4c-412a-b12e-8492064feaed	cashier@dahabperfume.local	176.29.209.65	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	t	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	2026-07-14 22:09:58.578
340f3dd1-f8e5-4bcc-a15c-0e27eacfdb26	system@dahab.local	37.220.124.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0	t	41b50e80-2df9-4834-9042-f383be8ec7b0	2026-07-14 22:34:24.921
d43c9693-917f-4590-80df-ade4cd2db752	system@dahab.local	176.29.209.65	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	t	41b50e80-2df9-4834-9042-f383be8ec7b0	2026-07-14 22:35:35.194
ddb6b32a-29c7-48e7-bcfc-338091b149fc	system@dahab.local	176.29.3.100	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0	t	41b50e80-2df9-4834-9042-f383be8ec7b0	2026-07-15 06:12:52.546
1afbc7ca-be5e-4f05-a678-d51c75353078	system@dahab.local	176.29.209.65	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	t	41b50e80-2df9-4834-9042-f383be8ec7b0	2026-07-15 07:04:27.292
0f537d65-0c96-4d26-9fb9-85d478eb76fd	system@dahab.local	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	t	41b50e80-2df9-4834-9042-f383be8ec7b0	2026-07-15 07:47:09.418
0bb86ba4-4129-4865-8217-0b103622e6f6	cashier@dahabperfume.local	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	t	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	2026-07-15 07:54:48.641
de4c5ff8-f58a-4aa0-b227-473e17598040	cashier@dahabperfume.local	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	t	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	2026-07-15 07:55:30.112
807ac7d7-8464-4e8c-b6a6-bd4fc12d45ea	cashier@dahabperfume.local	::1	Mozilla/5.0 (Linux; Android 15; Pixel 9) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Mobile Safari/537.36	t	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	2026-07-15 07:59:55.018
b12a5a8b-dfc0-4050-b2ae-074a55ac54ce	cashier@dahabperfume.local	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	t	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	2026-07-15 08:03:18.151
87cd7f59-aae8-4046-832e-957d0a5c0e6a	cashier@dahabperfume.local	::1	Mozilla/5.0 (Linux; Android 15; Pixel 9) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Mobile Safari/537.36	t	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	2026-07-15 08:04:04.301
391e03c4-7211-44cb-afa9-51f71f07e1c6	system@dahab.local	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	t	41b50e80-2df9-4834-9042-f383be8ec7b0	2026-07-15 08:21:19.656
f52bb411-37d9-4ea9-a5f4-b6188146f8c7	admin@dahabperfume.local	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	t	4c5a899c-e6e8-45bb-9829-3db589243422	2026-07-15 08:22:19.838
48e9d820-db34-43ed-b542-f6706823648c	cashier@dahabperfume.local	::1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	t	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	2026-07-15 08:37:45.96
9bd5bf26-bed3-466c-8a63-477db13a1f9b	system@dahab.local	176.29.209.65	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	t	41b50e80-2df9-4834-9042-f383be8ec7b0	2026-07-15 10:52:50.076
f231bb6e-a1c5-4a73-abff-39703e0286f5	system@dahab.local	176.29.157.249	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/30.0 Chrome/143.0.0.0 Mobile Safari/537.36	t	41b50e80-2df9-4834-9042-f383be8ec7b0	2026-07-15 20:59:51.254
ad1458d0-0b01-40eb-a5e9-7b2f604dee86	system@dahab.local	37.220.124.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0	t	41b50e80-2df9-4834-9042-f383be8ec7b0	2026-07-16 14:59:16.503
da775d39-fb98-467c-9fc2-563a2c1e70fb	system@dahab.local	176.29.209.65	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	t	41b50e80-2df9-4834-9042-f383be8ec7b0	2026-07-16 14:59:43.933
21bb2c43-174b-4bcc-a664-85a96c3f30b2	system@dahab.local	176.29.166.179	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0	t	41b50e80-2df9-4834-9042-f383be8ec7b0	2026-07-16 16:14:21.371
4eb1c37f-40fe-4538-a2d2-ee07b94918aa	cashier@dahabperfume.local	176.29.166.179	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0	t	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	2026-07-16 16:16:59.646
54192a2c-19f8-44bc-9790-c4f645bcb96b	system@dahab.local	176.29.166.179	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0	t	41b50e80-2df9-4834-9042-f383be8ec7b0	2026-07-16 18:15:17.793
c01d6c92-4550-4baf-83b8-bc8a311dbd31	system@dahab.local	176.29.121.11	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0	t	41b50e80-2df9-4834-9042-f383be8ec7b0	2026-07-19 10:21:19.456
cfa71caf-a388-486c-a47f-d255e6965a30	system@dahab.local	176.29.209.65	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	t	41b50e80-2df9-4834-9042-f383be8ec7b0	2026-07-19 11:18:57.358
5ea8b847-d10e-4410-b7a2-06d563d2817e	system@dahab.local	176.29.57.18	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0	t	41b50e80-2df9-4834-9042-f383be8ec7b0	2026-07-19 12:35:32.413
3ca3f948-7ed1-471e-ba94-c7874429575c	system@dahab.local	176.29.57.18	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0	t	41b50e80-2df9-4834-9042-f383be8ec7b0	2026-07-19 12:35:38.066
01615d55-d5b3-4684-b9db-35d8cb7380a7	system@dahab.local	176.29.209.65	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	t	41b50e80-2df9-4834-9042-f383be8ec7b0	2026-07-19 13:45:31.207
3aa477b9-ea7c-4e4b-a224-a3464260e06d	system@dahab.local	37.220.124.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0	t	41b50e80-2df9-4834-9042-f383be8ec7b0	2026-07-19 14:37:10.383
ddb54fc4-3f4b-4f85-b0c2-a9c3b4446ec3	system@dahab.local	37.220.124.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0	t	41b50e80-2df9-4834-9042-f383be8ec7b0	2026-07-19 14:37:44.425
cf100c8d-fefa-46f9-a91c-49a080a84c5d	system@dahab.local	37.220.124.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0	t	41b50e80-2df9-4834-9042-f383be8ec7b0	2026-07-19 14:59:05.389
663b1c3c-32d7-4201-8df0-380772b2b756	system@dahab.local	176.29.209.65	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	t	41b50e80-2df9-4834-9042-f383be8ec7b0	2026-07-19 15:14:39.737
d6a44a80-18f9-49c1-946f-0d6968a5aa82	system@dahab.local	176.29.57.18	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0	t	41b50e80-2df9-4834-9042-f383be8ec7b0	2026-07-19 15:33:34.072
61fc1a94-3f4b-4adc-8d29-62da0a7db08c	cashier@dahabperfume.local	176.29.57.18	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	t	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	2026-07-19 15:41:27.875
501516cb-961a-4ebc-9df0-c68c0ad8e522	system@dahab.local	176.29.57.18	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	t	41b50e80-2df9-4834-9042-f383be8ec7b0	2026-07-19 15:42:01.688
0fc884a9-fda5-4de9-be96-c66005364f0b	system@dahab.local	176.29.57.18	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	t	41b50e80-2df9-4834-9042-f383be8ec7b0	2026-07-19 16:42:44.671
7e57dc85-310b-4711-8590-aae797687871	system@dahab.local	176.29.209.65	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	t	41b50e80-2df9-4834-9042-f383be8ec7b0	2026-07-20 15:04:15.548
\.


--
-- Data for Name: Order; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Order" (id, reference, "customerName", "customerPhone", status, "totalAmount", "shippingCost", notes, "createdAt", "updatedAt", "idempotencyKey", "paymentStatus") FROM stdin;
f0339905-da3a-469a-8a74-57b7bb13aceb	ORD-B2334C97	مؤيد 	0795406137	CANCELLED	153000	3000	العنوان: الشارع (الفروسية)، البناية (12)، الشقة/الطابق (12)	2026-07-14 22:13:42.226	2026-07-14 22:16:17.274	\N	UNPAID
30fab56a-36f8-4f51-9ff6-e7c75bcd06d0	ORD-84DC4874	مممم	0795406137	DELIVERED	18000	3000	\N	2026-07-14 15:07:12.671	2026-07-15 07:14:40.46	\N	COD_PENDING
a7080dc4-04a3-4b52-9a5a-763740f91f39	ORD-D7268C78	نايف 	0795406137	PREPARING	28000	3000	العنوان: الشارع (الفروسية)، البناية (12)، الشقة/الطابق (12)	2026-07-16 15:05:31.112	2026-07-19 15:51:01.431	\N	COD_PENDING
6f464fac-102e-4fb1-a8e7-2f9b986d6b6f	ORD-3CAC46D5	مؤيد 	0795406137	SHIPPED	23000	3000	العنوان: الشارع (الفروسية)، البناية (12)، الشقة/الطابق (12)	2026-07-19 13:46:34.764	2026-07-19 16:48:54.132	\N	UNPAID
\.


--
-- Data for Name: OrderItem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."OrderItem" (id, "orderId", "productId", "variantId", sku, name, size, quantity, "unitPrice", total) FROM stdin;
0b9e934e-4efa-4f4b-bbf6-c4ff0746fe93	a7080dc4-04a3-4b52-9a5a-763740f91f39	93e4e0f3-0b00-4dfc-a8b1-8c016ab4cbe7	c42627a8-dfd4-464b-852f-22e54f1a1c08	DHB-0068-50ML	تريزور ميد نايت لانوي	50ml	1	10000	10000
3ed039b4-22a2-4668-b535-756bdc5f83ac	a7080dc4-04a3-4b52-9a5a-763740f91f39	93e4e0f3-0b00-4dfc-a8b1-8c016ab4cbe7	9147630c-0d25-47d0-8b74-6692535bbb48	DHB-0068-100ML	تريزور ميد نايت لانوي	100ml	1	15000	15000
57cc472c-6885-4742-b81e-f8cad8b1e4f8	6f464fac-102e-4fb1-a8e7-2f9b986d6b6f	53017bb5-499a-4e04-8e64-d38ecad10cd6	0199c780-d1a1-4900-a800-99b521dee4c7	DHB-0002-200ML	سوفاج	200ml	1	20000	20000
\.


--
-- Data for Name: OrderStatusHistory; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."OrderStatusHistory" (id, "orderId", status, notes, "createdAt") FROM stdin;
178494a0-c90b-4026-8317-925909032abf	30fab56a-36f8-4f51-9ff6-e7c75bcd06d0	AWAITING_WHATSAPP	Order initiated via Web Checkout. Zone: البلقاء	2026-07-14 15:07:12.671
ede46fdc-878f-49a7-b9ec-8cc039e7fe1c	30fab56a-36f8-4f51-9ff6-e7c75bcd06d0	CONFIRMED	Order confirmed by employee: 41b50e80-2df9-4834-9042-f383be8ec7b0	2026-07-14 15:08:23.562
4a5ddaea-ac6f-4405-86e0-7c6dd6a1e86b	30fab56a-36f8-4f51-9ff6-e7c75bcd06d0	PREPARING	تم التعديل بواسطة موظف POS	2026-07-14 15:21:15.688
4680b967-cc4d-41b6-ba42-41be6bc660f7	30fab56a-36f8-4f51-9ff6-e7c75bcd06d0	SHIPPED	تم التعديل بواسطة موظف POS	2026-07-14 17:02:09.684
85a709f0-fc42-43da-85f9-f31e1a2e9ea4	30fab56a-36f8-4f51-9ff6-e7c75bcd06d0	DELIVERED	تم التعديل بواسطة موظف POS	2026-07-14 17:09:32.734
4d243db6-c649-489a-b62b-98d083d6a0e8	f0339905-da3a-469a-8a74-57b7bb13aceb	AWAITING_WHATSAPP	Order initiated via Web Checkout. Zone: البلقاء. العنوان: الشارع (الفروسية)، البناية (12)، الشقة/الطابق (12)	2026-07-14 22:13:42.226
e3f6eec8-4f7a-450c-b6df-c4a2e1fd19a7	f0339905-da3a-469a-8a74-57b7bb13aceb	CANCELLED	تم التعديل بواسطة موظف POS	2026-07-14 22:16:17.459
dd488aef-0358-4112-b952-f438c8b78f30	30fab56a-36f8-4f51-9ff6-e7c75bcd06d0	DELIVERED	تم تحديث الحالة إلى DELIVERED ورسوم التوصيل إلى 3000	2026-07-15 07:14:40.648
f560ff09-b62c-4f6b-9d8f-2ee4e70f7cd2	a7080dc4-04a3-4b52-9a5a-763740f91f39	AWAITING_WHATSAPP	Order initiated via Web Checkout. Zone: عمان. العنوان: الشارع (الفروسية)، البناية (12)، الشقة/الطابق (12)	2026-07-16 15:05:31.112
7ebad398-033f-4e31-9e26-9b47d2034a51	a7080dc4-04a3-4b52-9a5a-763740f91f39	CONFIRMED	Order confirmed by employee: 41b50e80-2df9-4834-9042-f383be8ec7b0	2026-07-16 15:06:02.591
79732cd0-355c-472a-85a7-acf7a9d96126	6f464fac-102e-4fb1-a8e7-2f9b986d6b6f	AWAITING_WHATSAPP	Order initiated via Web Checkout. Zone: إربد. العنوان: الشارع (الفروسية)، البناية (12)، الشقة/الطابق (12)	2026-07-19 13:46:34.764
a3a24f80-5b3c-4f68-8d58-84c23610bd0d	6f464fac-102e-4fb1-a8e7-2f9b986d6b6f	PREPARING	تم تحديث الحالة إلى PREPARING ورسوم التوصيل إلى 3000	2026-07-19 15:15:20.667
c793a97c-6d24-472e-b211-a5ccfb103004	a7080dc4-04a3-4b52-9a5a-763740f91f39	PREPARING	تم التعديل بواسطة موظف POS	2026-07-19 15:51:01.617
f26f433a-db43-432d-9987-a175dcd3ef91	6f464fac-102e-4fb1-a8e7-2f9b986d6b6f	SHIPPED	تم تحديث الحالة إلى SHIPPED ورسوم التوصيل إلى 3000	2026-07-19 16:48:47.302
b00a388a-cbed-49fd-830b-871aeb5bb028	6f464fac-102e-4fb1-a8e7-2f9b986d6b6f	SHIPPED	تم تحديث الحالة إلى SHIPPED ورسوم التوصيل إلى 3000	2026-07-19 16:48:54.317
\.


--
-- Data for Name: Payment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Payment" (id, "saleId", method, amount, "amountTendered", "createdAt", "terminalRef") FROM stdin;
488a6c5a-fc72-4e0e-82da-9f19e7e811aa	9117a89a-a099-4677-954c-3c60178dcf31	CASH	15000	15000	2026-07-14 08:45:35.271	\N
45f91408-145c-48fd-bb17-af1ddd98498d	b86d1e63-d6e4-4076-b133-d152aa587f7f	CASH	25000	25000	2026-07-14 14:56:43.279	\N
c338d0b0-d1a9-4d96-9b29-519a71ce40c7	eef54d1d-a399-42fe-92b9-ab3dc5dfccd9	CASH	25000	25000	2026-07-14 21:45:52.738	\N
75b35172-6635-4c93-b02d-7ddef83e8a5f	5ff571f6-24c1-4312-bde6-0de366daa7b7	CASH	10000	122000	2026-07-14 22:10:07.314	\N
fedfc4b8-5f0f-404c-bdf6-06d12af1dad0	a3c69d75-536f-4c89-b707-84e40266d169	CASH	12000	12000	2026-07-16 15:08:21.963	\N
ee7713e6-8059-4d1d-a14f-b8664e239cb3	c840f4a4-4a2a-41a4-b68f-0b9192119357	CASH	32000	40000	2026-07-16 15:17:24.989	\N
8bae52e2-5792-4f26-969f-047baf295a83	b6a55738-bb90-4ffe-8c3b-3f820f2c5314	CARD	20000	\N	2026-07-16 15:17:44.887	\N
d34045d6-b0d6-41b3-a081-1db6e2fae72b	2e17e59a-8b3f-4c6f-90ba-d0dd28da55ea	CASH	20000	45000	2026-07-16 15:36:18.997	\N
62de9e66-228a-4fb8-9748-d3bd30be5ffa	ed990345-87e9-4483-97df-63d6845eea5c	CASH	40000	40000	2026-07-16 16:18:59.688	\N
8389793d-4532-4120-bc03-61a1a9f4ea1f	53b4f3a4-5860-4557-a438-dce24edbae10	CASH	20000	20000	2026-07-19 10:22:23.528	\N
7b94b6af-ed5f-427c-8cb9-d9dd76e5a58c	b9408e69-1fbc-4219-963f-b4ac4dab06e9	CASH	6500	10000	2026-07-19 15:50:08.457	\N
bb97a03f-6cd8-469a-8812-1dc8be63b80d	bb83c1fb-9116-4c41-b815-e5eba79167a1	CASH	20000	22000	2026-07-19 17:09:12.821	\N
\.


--
-- Data for Name: PendingMfaChallenge; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."PendingMfaChallenge" (id, "employeeId", token, "expiresAt", "createdAt") FROM stdin;
\.


--
-- Data for Name: Permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Permission" (id, action, description) FROM stdin;
66aa65d8-c177-4810-996a-6f533068ef98	manage:products	\N
b1a0875a-9523-4f96-98ea-864e1d6b2f65	manage:orders	\N
924fc95e-c26e-4c39-b3f2-83af37dea0f8	orders.confirm	\N
2cc0b58e-f492-46dc-955c-4786b6f60512	pos:access	\N
6677f381-8430-4854-bc5d-e6576cc18e45	manage:inventory	\N
665e7916-6e00-4b1e-8bf7-ecb7354732da	manage:settings	\N
85a1b0b9-04cd-41f7-bfcd-86a86014cbec	pos.orders.view	عرض طلبات المتجر في شاشة الكاشير
e3657242-d9e8-4635-a714-e33cb2fd0f61	pos.orders.manage	إدارة وتغيير حالة طلبات المتجر في الكاشير
\.


--
-- Data for Name: Product; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Product" (id, slug, "nameAr", "nameEn", sku, "shortDescription", "longDescription", "categoryId", "genderId", "seasonId", "familyId", "isVisible", "isFeatured", "featuredOrder", "createdAt", "updatedAt", "needsReview", "reviewReasons", "stockStatus", "notesStatus", "stockLiters") FROM stdin;
67e8a831-9640-4800-9594-271fd03cf74c	you-dhb-0030	You	Giorgio Armani Because It's You	DHB-0030	عطر نسائي متألق وجذاب يمزج بين حلاوة التوت البري ونضارة زهر البرتقال مع قلب من الورد الجوري وقاعدة مسكية دافئة من الفانيلا.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	e904e1cb-bc67-45a9-a96b-31d514527411	t	f	0	2026-07-16 15:01:55.644	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
38976821-8d3a-45f6-9ead-9da7672e60ff	%D8%A8%D9%8A-%D8%AF%D9%8A%D9%84%D9%8A%D8%B4%D9%8A%D8%B3-dhb-0043	بي ديليشيس	DKNY Be Delicious	DHB-0043	عطر نسائي منعش وحيوي يفوح بعبير التفاح الأخضر والخيار المنعش مع باقة زهرية ناعمة وقاعدة خشبية خفيفة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	f4bf219f-39a3-4722-a6e3-91a7a593364b	t	f	0	2026-07-16 15:02:42.534	2026-07-19 15:50:08.067	f	\N	VERIFIED	VERIFIED	0.95
4f50b3a7-eb39-4495-8a2c-9d0ef9131f00	%D8%A8%D9%88%D8%B3-%D9%81%D9%8A%D9%85%D9%8A-dhb-0048	بوس فيمي	Hugo Boss Femme	DHB-0048	عطر نسائي ناعم ومنعش يجسد الأنوثة بباقة متألقة من أزهار الفريزيا والياسمين مع لمسة فاكهية ونهاية مسكية هادئة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	79d5fc87-0611-4b22-a53f-196efc6cc093	t	f	0	2026-07-16 15:02:57.563	2026-07-19 17:09:12.418	f	\N	VERIFIED	VERIFIED	0.8
fb9b2e8f-1669-4904-a271-c7645985fbe6	%D8%A8%D9%84%D8%A7%D9%83-xs-dhb-0051	بلاك X.s	Paco Rabanne Black XS for Her	DHB-0051	عطر نسائي جريء ودافئ يجمع بين حموضة التوت البري وحلاوة الكاكاو مع لمسة حارة من الفلفل الوردي وقاعدة من الباتشولي والفانيلا.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	e2bdf3b1-c08a-469b-980c-d248be3ec4b9	t	f	0	2026-07-16 15:03:06.286	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
31659561-fd1b-4790-9188-cec150ddf740	%D8%AC%D9%88%D8%AA%D8%B4%D9%8A-%D9%81%D9%84%D9%88%D8%B1%D8%A7-%D8%AC%D8%A7%D8%B1%D8%AF%D9%8A%D9%86%D9%8A%D8%A7-dhb-0079	جوتشي فلورا جاردينيا	Gucci Flora Gorgeous Gardenia	DHB-0079	عطر نسائي أنثوي ومبهج يمزج بين عبير زهور الغاردينيا الساحرة وحلاوة السكر البني مع نفحات منعشة من كمثرى السفرجل والتوت الأحمر.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	56a80d47-4569-4d90-a5e5-c9deebc1e2a0	t	f	0	2026-07-16 15:04:27.573	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
8d4029da-96d1-4eec-8b78-6762b4ff7f82	%D8%AF%D9%8A%D9%83%D8%A7%D8%AF%D9%8A%D9%86%D8%B3-dhb-0094	ديكادينس	Marc Jacobs Decadence	DHB-0094	عطر نسائي شرقي فخم يتميز بنفحات دافئة من البرقوق الإيطالي والزعفران الثمين مع قلب من السوسن والورد وقاعدة عنبرية خشبية غنية وثابتة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	aad32845-786f-4a91-b29e-0898331d4b8d	t	f	0	2026-07-16 15:05:08.358	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
064c5488-1c71-4707-bca8-9506854f0b5e	%D8%A8%D8%A7%D8%B4%D9%86-si-dhb-0104	باشن Si	Giorgio Armani Sì Passione	DHB-0104	عطر نسائي أنيق وجريء يجمع بين حميمية الفواكه كالتوت الأسود والكمثرى وعبير الورد الأنثوي مع قاعدة فانيلا دافئة وحسية.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	e904e1cb-bc67-45a9-a96b-31d514527411	t	f	0	2026-07-16 15:05:37.785	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
6993eab3-d31c-4e3b-990b-f90609b12376	%D8%AF%D9%88%D9%86%D8%A7-dhb-0118	دونا	Valentino Donna	DHB-0118	عطر نسائي كلاسيكي فخم يجمع بين أناقة الورد الإيطالي والسوسن البودري مع قاعدة دافئة من الجلود الناعمة والباتشولي.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	153bc492-d0fa-42d6-8ba2-0a7fc516cfe8	t	f	0	2026-07-16 15:06:19.709	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
6f994bb6-d2bf-48f8-a0b0-e2a5a246bfd1	%D8%A8%D8%B1%D8%A8%D8%B1%D9%8A-%D9%87%D9%8A%D8%B1-%D8%A7%D9%84%D9%83%D8%B3%D9%8A%D8%B1-dhb-0090	بربري هير الكسير	Burberry Her Elixir de Parfum	DHB-0090	عطر نسائي كريمي شديد الجاذبية يفوح بعبير الفواكه الحمراء كالفراولة والتوت الأسود مع قلب من الياسمين وقاعدة عنبرية فانيلا غنية.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	58a47922-431f-4c54-b902-57313692c18f	t	f	0	2026-07-16 15:04:57.338	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
47998914-eb19-4aba-9a3b-c2760e9d9967	%D9%83%D8%B1%D8%B3%D8%AA%D8%A7%D9%84-%D9%86%D9%88%D8%A7%D8%B1-dhb-0132	كرستال نوار	Versace Crystal Noir	DHB-0132	عطر نسائي شرقي فخم يتميز بنكهة جوز الهند الكريمة ودفء التوابل كالزنجبيل والفلفل مع أزهار الغاردينيا وقاعدة عنبرية عميقة وثابتة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	906ad035-91a5-4fe1-a952-05823522c6ac	t	f	0	2026-07-16 15:07:02.715	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
76bede9b-42da-4e9e-997f-f5b3907397d0	%D9%84%D8%A7%D9%86%D8%AA%D8%B1%D9%88%D8%AF%D9%8A%D8%AA-%D8%B1%D9%88%D8%AC-dhb-0143	لانتروديت روج	Givenchy L'Interdit Rouge	DHB-0143	عطر نسائي حار وحسي يمزج بين انتعاش البرتقال الأحمر وحرارة الزنجبيل والفلفل مع قلب زهري من مسك الروم وقاعدة من خشب الصندل والباتشولي.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	08c339ca-e698-4c25-b6ab-9c991431cd4c	t	f	0	2026-07-16 15:07:34.299	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
0fbc106f-ec7f-4a5b-a6b5-3921a845a82b	%D9%85%D8%B3-%D8%AF%D9%8A%D9%88%D8%B1-%D8%A8%D9%88%D9%83%D9%8A%D9%87-dhb-0154	مس ديور بوكيه	Dior Miss Dior Blooming Bouquet	DHB-0154	عطر نسائي ناعم ومنعش يجسد رقة بتلات الفاوانيا والورد الدمشقي مع انتعاش البرغموت وقاعدة مخملية من المسك الأبيض.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	1fdfe318-018a-49c0-b164-74a0baad0a72	t	f	0	2026-07-16 15:08:05.147	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
63da88db-96e9-458b-ad10-10d9d0206609	%D9%86%D8%B1%D8%B3%D9%8A%D8%B3%D9%88-%D8%B1%D9%88%D8%AC-dhb-0165	نرسيسو روج	Narciso Rodriguez Narciso Rouge	DHB-0165	عطر نسائي دافئ ومغرٍ يتميز بلون العاطفة الحمراء، يجمع بين نعومة السوسن البودري والورد الجوري مع قلب مسكي دافئ وقاعدة من التونكا وخشب الأرز.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	83fb1561-91af-4138-8656-180dddc9381a	t	f	0	2026-07-16 15:08:38.247	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
84137263-8a01-4584-affe-6d5035ef1244	%D8%AA%D9%88%D9%8A%D9%84%D9%8A-dhb-0177	تويلي	Hermès Twilly d'Hermès	DHB-0177	عطر نسائي أنيق وجريء يمزج بحيوية بين حرارة الزنجبيل وجاذبية مسك الروم وقاعدة كريمية دافئة من خشب الصندل.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	08c339ca-e698-4c25-b6ab-9c991431cd4c	t	f	0	2026-07-16 15:09:13.106	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
7a542bf6-eaf0-4077-b374-60dea2563c8c	%D8%A7%D9%88%D9%85%D9%88-dhb-0190	اومو	Valentino Uomo	DHB-0190	عطر رجالي شرقي شهي يمزج بين انتعاش البرغموت وحلاوة البندق والشوكولاته والقهوة المحمصة مع قاعدة كلاسيكية دافئة من الجلود والأخشاب.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	86473976-ca97-4f39-b02f-8006a5675429	t	f	0	2026-07-16 15:09:51.687	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
ed508f36-74a7-4304-b24e-9c50c5e101b2	%D8%A7%D8%A8%D8%B3%D9%88%D9%84%D9%88-you-dhb-0203	ابسولو You	Giorgio Armani Stronger With You Absolutely	DHB-0203	عطر رجالي شرقي دافئ يتميز بتوليفة ملكية تدمج بين نكهة الرم واللافندر وحلاوة الكستناء مع قاعدة غنية بمركب الفانيلا والباتشولي.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	aad32845-786f-4a91-b29e-0898331d4b8d	t	f	0	2026-07-16 15:10:26.496	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
08332624-be68-4d6f-b34d-9af66ff3bb6f	%D8%A8%D9%88%D8%B1%D9%86-%D8%A7%D9%86-%D8%B1%D9%88%D9%85%D8%A7-dhb-0216	بورن ان روما	Valentino Uomo Born In Roma	DHB-0216	عطر رجالي عصري وأنيق يجمع بين نضارة أوراق البنفسج وملح البحر المعدني وحرارة الزنجبيل وقاعدة خشبية دافئة من نجيل الهند.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	4ff7b39e-5a9f-4cdc-bd4e-b69bdf32dd25	t	f	0	2026-07-16 15:11:05.064	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
b1ee6554-205e-4306-bf77-cae0c6d30752	%D8%A8%D9%88%D9%84%D9%88-%D8%B3%D8%A8%D9%88%D8%B1%D8%AA-dhb-0217	بولو سبورت	Ralph Lauren Polo Sport	DHB-0217	عطر رجالي رياضي بارد ومنعش للغاية يفوح بنضارة النعناع والليمون والخزامى (اللافندر) مع أوراق النيرولي وقاعدة مسكية صندلية.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	56c1ed18-715b-459d-971f-0fed5aaf7ad4	t	f	0	2026-07-16 15:11:08.444	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
af8899cf-4ee6-4101-a640-3cd0f0c61870	%D8%A8%D8%B1%D8%A7%D8%B1%D8%A7-%D9%87%D9%88%D9%85-dhb-0228	برارا هوم	Prada L'Homme	DHB-0228	عطر رجالي أنيق يفيض بالنظافة والانتعاش، يرتكز على نعومة زهرة السوسن البودرية والنيرولي مع قاعدة دافئة من العنبر وخشب الصندل.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	fc6d36bc-cb24-4d76-acc7-512877e16ab3	t	f	0	2026-07-16 15:11:40.169	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
2a20229e-a62d-4427-9950-3e1846971720	%D8%AC%D9%88%D8%AA%D8%B4%D9%8A-%D8%AC%D9%84%D8%AA%D9%8A-dhb-0241	جوتشي جلتي	Gucci Guilty Pour Homme	DHB-0241	عطر رجالي أنيق يفوح بنضارة ليمون أمالفي وعبير اللافندر وزهر البرتقال مع قاعدة خشبية دافئة وثابتة من خشب الأرز والباتشولي.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	ef0047bf-5fe8-4b92-9110-1effce9f8419	t	f	0	2026-07-16 15:12:20.566	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
6d13868d-2e0f-41f9-a25a-6ca609740b50	%D8%AF%D9%86%D9%87%D9%84-%D8%AF%D9%8A%D8%B2%D8%A7%D9%8A%D8%B1-dhb-0254	دنهل ديزاير	Alfred Dunhill Desire for a Man	DHB-0254	عطر رجالي شرقي فواح يتميز بحلاوة التفاح الأحمر الناضج والليمون المنعش مع قلب من خشب التيك وقاعدة دافئة من الفانيلا والباتشولي.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	22e991fe-a953-4a40-8574-36d5f1c1609b	t	f	0	2026-07-16 15:12:58.525	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
8a55e6a6-c88d-4c6d-88e7-d4d07dca202b	%D8%B0%D8%A7-%D9%88%D9%86-dhb-0266	ذا ون	Dolce & Gabbana The One for Men	DHB-0266	عطر رجالي دافئ وجذاب للإطلالات الراقية، يمزج بين حرارة الهيل والزنجبيل وقشر الجريب فروت مع قاعدة غنية وثابتة من العنبر والتبغ وخشب الأرز.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	db28bbe4-82cb-41ea-aae7-2e66f8f73238	t	f	0	2026-07-16 15:13:32.002	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
59a459d0-4195-4186-9b29-4a801aa14872	%D8%B0%D8%A7-%D8%B3%D9%86%D8%AA-dhb-0267	ذا سنت	Hugo Boss Boss The Scent	DHB-0267	عطر رجالي شرقي حسي يتميز بنكهة فاكهة المانينكا الاستوائية وحرارة الزنجبيل مع عبير اللافندر وقاعدة دافئة من الجلود الناعمة والأخشاب.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	fe2300e9-e7d2-49f5-83cc-9d37cb81c0c2	t	f	0	2026-07-16 15:13:35.085	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
12a3d9a1-c44e-4fdf-aaf8-4eec621794b8	%D8%B3%D9%83%D9%84%D8%A8%D8%B4%D8%B1-dhb-0278	سكلبشر	Nikos Sculpture pour Homme	DHB-0278	عطر رجالي صيفي منعش يمزج بجمال بين نضارة ليمون البحر المتوسط وعبير زهر البرتقال الرقيق وقاعدة دافئة وحلوة من التونكا والعنبر.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	9781c890-0782-4997-a095-523133e5f04f	t	f	0	2026-07-16 15:14:09.596	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
62caf1c8-0aed-4178-8905-e2973a1d16ce	%D9%85%D8%B6%D8%A7%D9%88%D9%8A-%D8%AC%D9%88%D9%84%D8%AF-dhb-0290	مضاوي جولد	Arabian Oud Madawi Gold Edition	DHB-0290	عطر شرقي فاخر للجنسين من العربية للعود، يمزج بجمال بين حلاوة الدراق والكمثرى والأناناس وقلب من الياسمين مع قاعدة غنية من المسك وخشب الصندل والعنبر.	\N	26e988b4-46fb-4100-a190-0ed4a7d72d34	55719cb3-2581-4ade-854f-d90e64e837ea	3ef45d89-f354-4984-a4d8-308b605a9b0e	22e991fe-a953-4a40-8574-36d5f1c1609b	t	f	0	2026-07-16 15:14:45.34	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
5fdd1f1f-324f-4fee-9186-fd01bab67c16	%D8%AC%D9%88%D8%AA%D8%B4%D9%8A-%D8%A8%D9%84%D9%88%D9%85-%D8%A7%D9%86%D8%AA%D8%B3-dhb-0291	جوتشي بلوم انتس	Gucci Bloom Intense	DHB-0291	عطر نسائي حسي ومكثف يتميز بعبير أزهار مسك الروم والياسمين مع دفء الباتشولي ولمسة كريمية ناعمة من جوز الهند.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	31962865-2662-4079-9c11-dff116a6259f	t	f	0	2026-07-16 15:14:48.219	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
4edadee5-1848-452a-9dec-461df9ed5d93	%D9%83%D9%88%D8%A8%D8%B1%D8%A7-dhb-0302	كوبرا	Jeanne Arthes Cobra	DHB-0302	عطر شرقي كلاسيكي مهيب يتميز بنفحات مسك الروم والياسمين مع مزيج حار من التوابل الدافئة وقاعدة غنية من خشب الصندل والفانيلا.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	b62bfd9a-ff66-4c27-b5d2-f4c384601755	t	f	0	2026-07-16 15:15:21.374	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
3ea1c578-aacf-41b2-96e9-42c5f6cba8a0	%D9%83%D8%B1%D9%8A%D8%AF-%D9%88%D8%A7%D9%8A%D8%AA-dhb-0303	كريد وايت	Creed Silver Mountain Water	DHB-0303	عطر أروماتك فاخر ومنعش للجنسين يجسد نقاء جبال الألب السويسرية، يمزج بين حيوية الشاي الأخضر والتوت الأسود وقاعدة مخملية من المسك والصندل.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	c638969a-1f55-4101-b842-12959b765fe4	t	f	0	2026-07-16 15:15:24.448	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
40f16b29-f1e3-44aa-a386-08afa2d89ae3	%D9%84%D8%A7%D9%83%D9%88%D8%B3%D8%AA-%D9%88%D8%A7%D9%8A%D8%AA-dhb-0316	لاكوست وايت	Lacoste L.12.12 Blanc	DHB-0316	عطر رجالي صيفي منعش يفوح بعبير الجريب فروت وإكليل الجبل وقلب زهري أنيق من مسك الروم واليلانغ مع قاعدة دافئة من الجلد السويدي.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	5b2b169f-227f-49c8-9dd1-61cc7ed6b0af	t	f	0	2026-07-16 15:16:06.301	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
da07c0cc-32ce-4700-be29-b45490da697f	%D8%AF%D9%8A%D9%88%D8%B4%D9%8A%D9%86-dhb-0093	ديڤوشين	Dolce & Gabbana Devotion	DHB-0093	عطر نسائي شهي وفريد يتميز بافتتاحية منعشة من الليمون المحلى وحلوى البانيتوني مع قلب من زهر البرتقال وقاعدة دافئة ومكثفة من الفانيلا.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	8bb1c828-a66f-4ff8-bbe6-ad3a00b95fa0	t	f	0	2026-07-16 15:05:04.891	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
d69f3606-a366-4aa1-aa3a-1dfc81dfe501	%D9%87%D9%88%D8%AC%D9%88-%D8%A7%D9%86%D8%B1%D8%AC%D8%A7%D9%8A%D8%B2-dhb-0326	هوجو انرجايز	Hugo Boss Hugo Energise	DHB-0326	عطر رجالي صيفي منعش بطابع حيوي يفوح بنضارة الحمضيات كالليمون والبرتقال وحرارة الفلفل الوردي والنعناع مع قاعدة خشبية دافئة.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	24f64784-fb23-41ae-a0d3-bbe52d8b3c33	t	f	0	2026-07-16 15:16:39.968	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
05f759bd-1f4f-4c05-a48c-8a2254e4e6b0	%D9%85%D8%A7%D8%B1%D8%AA%D9%86%D9%8A%D9%83-dhb-0358	مارتنيك	Qissa Martinique	DHB-0358	عطر فاخر بطابع استوائي، فاكهي، حمضي، يتوازن مع لمسات مسك، خشبي ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	55719cb3-2581-4ade-854f-d90e64e837ea	28c9117e-5e1b-489a-828e-9813acc326ff	21a0ad07-e952-4911-8cf3-486f7873e895	t	f	0	2026-07-16 15:18:34.872	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
d506b07e-7e0c-48f6-90cc-85cb01c1dfcf	%D9%88%D9%86-%D8%A3%D9%86%D8%AF-%D8%A3%D9%88%D9%86%D9%84%D9%8A-dhb-0359	ون أند أونلي	Qissa One and Only	DHB-0359	عطر فاخر بطابع عنبر، فانيلا، مسك، يتوازن مع لمسات زهري، خشبي ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	f472cc49-84a5-4267-95bf-9e9b03db2a08	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	24d1f80f-822a-4071-828a-123131c24718	t	f	0	2026-07-16 15:18:37.79	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
4c28cde6-9244-4748-8da3-a164a1d3a560	%D8%A3%D9%85%D8%A8%D8%B1%D9%8A%D9%87-%D9%86%D9%88%D9%85%D8%A7%D8%AF-dhb-0371	أمبريه نوماد	Louis Vuitton Ombre Nomade	DHB-0371	عطر فاخر بطابع عود، عنبر، دخاني، يتوازن مع لمسات ورد، جلدي ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	26e988b4-46fb-4100-a190-0ed4a7d72d34	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	5f68e9aa-8219-4d4f-8181-f4c4b40f8eee	t	f	0	2026-07-16 15:19:20.822	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
92dc9eec-c14b-4985-8142-540ca06308b2	%D9%83%D8%A7%D9%84%D8%A7%D9%86-dhb-0377	كالان	Parfums de Marly Kalan	DHB-0377	عطر فاخر بطابع توابل، حمضي، خشبي، يتوازن مع لمسات لافندر، عنبر ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	f472cc49-84a5-4267-95bf-9e9b03db2a08	55719cb3-2581-4ade-854f-d90e64e837ea	3ef45d89-f354-4984-a4d8-308b605a9b0e	af13b3a6-ba06-4874-89a8-dd2358cc056d	t	f	0	2026-07-16 15:19:44.498	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
cae436e6-d154-411a-b8bb-60ba4296386e	%D8%B5%D8%A8%D8%A7%D9%8A%D8%A7-dhb-0102	صبايا	Al-Rehab Sabaya	DHB-0102	عطر نسائي حيوي ومنعش يمزج بسلاسة بين عبير الورد الجوري ونضارة الحمضيات مع نوتات خضراء تمنحه طابعاً طبيعياً رقيقاً.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	e9fc9ae9-bd8a-4ef6-8b96-1c326a777b94	t	f	0	2026-07-16 15:05:30.921	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
cfab21bb-400c-4884-aba9-a08668026a8c	%D8%B9%D9%88%D8%AF-%D9%85%D8%A7%D8%B1%D9%83%D9%88%D8%AC%D8%A7-dhb-0352	عود ماركوجا	Dahab Oud Maracuja	DHB-0352	عطر فاخر بطابع استوائي، عود، جلدي، يتوازن مع لمسات فاكهي، دخاني ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	26e988b4-46fb-4100-a190-0ed4a7d72d34	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	758abe9c-f12e-4edc-9151-111ba3d762b6	t	f	0	2026-07-16 15:18:09.994	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
e247941c-13bb-4492-b6aa-5d2ffb4a9697	%D8%A8%D9%84-%D8%AC%D9%88%D8%B3%D9%8A-dhb-0355	آبل جوسي	Kayali Eden Juicy Apple	DHB-0355	عطر فاخر بطابع تفاح، فاكهي، توت، يتوازن مع لمسات حلو، مسك ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	62d74b01-a106-4074-92a8-a56b4b99ab40	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	0748af35-c3ca-4010-8aea-ae4af64c4def	t	f	0	2026-07-16 15:18:22.452	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
491e9b15-3ab0-4131-b469-e645cbafe7be	%D9%85%D8%B6%D8%A7%D9%88%D9%8A-dhb-0383	مضاوي	Arabian Oud Madawi	DHB-0383	عطر فاخر بطابع فاكهي، خوخ، ورد، يتوازن مع لمسات مسك، عنبر ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	f472cc49-84a5-4267-95bf-9e9b03db2a08	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	68dce486-15a5-41b7-801b-7a51839e6718	t	f	0	2026-07-16 15:20:05.598	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
a0c92910-dd21-4ce4-88b5-228809a08fb2	%D9%83%D9%84%D9%85%D8%A7%D8%AA-dhb-0387	كلمات	Arabian Oud Kalemat	DHB-0387	عطر فاخر بطابع عنبر، عسل، فاكهي، يتوازن مع لمسات خشبي، مسك ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	f472cc49-84a5-4267-95bf-9e9b03db2a08	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	37167a54-afab-488f-94d8-fa36e1ccf1d2	t	f	0	2026-07-16 15:20:20.795	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
3e360ffd-8f9f-48af-a987-4a3bb3cc9102	%D9%87%D8%A8%D9%8A%D8%B3%D9%83%D9%88%D8%B3-dhb-0388	هبيسكوس	Dahab Hibiscus	DHB-0388	عطر فاخر بطابع زهري، فاكهي، توت، يتوازن مع لمسات مسك، طازج ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	55719cb3-2581-4ade-854f-d90e64e837ea	28c9117e-5e1b-489a-828e-9813acc326ff	6363f08b-89b2-4c45-9d1e-4fec2a32b2ed	t	f	0	2026-07-16 15:20:23.463	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
2a547bff-0235-4fdf-a781-b2cc21af4ca6	%D9%85%D8%B3%D9%83-%D8%A8%D8%A7%D9%88%D8%AF%D8%B1-dhb-0401	مسك باودر	Abdul Samad Al Qurashi مسك باودر	DHB-0401	عطر فاخر بطابع بودري، مسك، نظيف، يتوازن مع لمسات زهري، ناعم ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	55719cb3-2581-4ade-854f-d90e64e837ea	3ef45d89-f354-4984-a4d8-308b605a9b0e	4d55cdec-8fb2-4fb6-86f1-ad87c6419fc3	t	f	0	2026-07-16 15:21:08.993	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
5f437268-78fa-4e79-a194-8e918581a503	%D8%AE%D9%85%D8%B1%D8%A9-dhb-0406	خمرة	Lattafa Khamrah	DHB-0406	عطر فاخر بطابع قرفة، حلو، فانيلا، يتوازن مع لمسات عنبر، توابل ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	f472cc49-84a5-4267-95bf-9e9b03db2a08	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	daf7c774-4665-4cce-8ce1-cc6078b9ca94	t	f	0	2026-07-16 15:21:24.006	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
dc2133c5-d8e7-4a0b-b4f4-dd006eb087a9	%D8%B1%D8%AB%D8%B1-dhb-0416	آرثر	Penhaligon's The World According to Arthur	DHB-0416	عطر فاخر بطابع بخور، فانيلا، عنبر، يتوازن مع لمسات توابل، خشبي ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	f472cc49-84a5-4267-95bf-9e9b03db2a08	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	2081c470-d37c-4266-8957-fe46c2862d91	t	f	0	2026-07-16 15:21:59.227	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
29c9ddae-afd0-4702-9732-c9dd05409ca7	%D8%A8%D8%A7%D9%8A-%D8%B0%D8%A7-%D9%81%D8%A7%D9%8A%D8%B1-%D8%A8%D9%84%D9%8A%D8%B3-dhb-0432	باي ذا فاير بليس	Maison Margiela Replica By the Fireplace	DHB-0432	عطر فاخر بطابع دخاني، كستناء، فانيلا، يتوازن مع لمسات خشبي، توابل ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	f472cc49-84a5-4267-95bf-9e9b03db2a08	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	d58c0308-8f48-4d69-aea0-da7ce2d3e254	t	f	0	2026-07-16 15:22:50.782	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
83116a6a-142c-4b23-930e-65722bf0a07b	%D9%85%D9%88%D9%87%D8%A7%D9%81%D9%8A-%D8%AC%D9%88%D8%B3%D8%AA-dhb-0446	موهافي جوست	Byredo Mojave Ghost	DHB-0446	عطر فاخر بطابع مسك، خشبي، زهري، يتوازن مع لمسات فاكهي، بودري ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	55719cb3-2581-4ade-854f-d90e64e837ea	3ef45d89-f354-4984-a4d8-308b605a9b0e	7e70a695-4282-425e-9355-d0af5fabe3c1	t	f	0	2026-07-16 15:23:30.856	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
57cf1c9b-bcfa-44d9-b581-035028d4b6f8	%D8%AA%D9%8A%D8%B1%D9%88%D9%86%D9%8A-dhb-0414	تيروني	Orto Parisi Terroni	DHB-0414	عطر فاخر بطابع دخاني، ترابي، خشبي، يتوازن مع لمسات عنبر، راتنجي ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	f472cc49-84a5-4267-95bf-9e9b03db2a08	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	59477fa0-bcf1-404e-8db7-4b6c2d418db3	t	f	0	2026-07-16 15:21:51.072	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
0b454968-cf9d-4c1b-abd8-5f3e0f945adc	%D9%84%D9%88%D8%B1%D8%AF-%D8%AC%D9%88%D8%B1%D8%AC-dhb-0417	لورد جورج	Penhaligon's The Tragedy of Lord George	DHB-0417	عطر فاخر بطابع رم، تونكا، عنبر، يتوازن مع لمسات لافندر، خشبي ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	f472cc49-84a5-4267-95bf-9e9b03db2a08	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	31845506-dd6a-434a-b3b4-81d475baa5c1	t	f	0	2026-07-16 15:22:02.369	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
2ac6555e-0733-4b97-844b-78699d204d4d	%D9%85%D8%B3%D8%AA%D8%B1-%D8%B3%D8%A7%D9%85-dhb-0418	مستر سام	Penhaligon's The Blazing Mr Sam	DHB-0418	عطر فاخر بطابع توابل، تبغي، خشبي، يتوازن مع لمسات باتشولي، عنبر ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	f472cc49-84a5-4267-95bf-9e9b03db2a08	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	12681f33-087a-4664-83e7-c26a3f08da3e	t	f	0	2026-07-16 15:22:07.352	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
35c2337d-e95e-4ae1-a3f2-1665b4976aea	%D8%B0%D8%A7-%D8%AF%D9%88%D9%83-dhb-0419	ذا دوك	Penhaligon's Much Ado About The Duke	DHB-0419	عطر فاخر بطابع ورد، جلدي، فلفلي، يتوازن مع لمسات خشبي، جاف ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	f472cc49-84a5-4267-95bf-9e9b03db2a08	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	7d95e3ee-9342-4d07-bef0-ebdef2235d7f	t	f	0	2026-07-16 15:22:11.794	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
f05c2b56-41ba-4ec1-8cc3-9f8f0b1f8607	%D9%85%D8%B3%D8%AA%D8%B1-%D8%AB%D9%88%D9%85%D8%B3%D9%88%D9%86-dhb-0420	مستر ثومسون	Penhaligon's Terrible Teddy / Mr Thompson	DHB-0420	عطر فاخر بطابع جلدي، بخور، عنبر، يتوازن مع لمسات توابل، خشبي ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	f472cc49-84a5-4267-95bf-9e9b03db2a08	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	7203fb86-02ff-4d21-b635-41b5ddf341d5	t	f	0	2026-07-16 15:22:15.214	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
3efda889-e47d-4e4a-a031-df3cf1959823	%D8%B0%D8%A7-%D8%A5%D9%86%D9%8A%D9%85%D9%8A%D8%AA%D8%A8%D9%84-dhb-0421	ذا إنيميتبل	Penhaligon's The Inimitable William Penhaligon	DHB-0421	عطر فاخر بطابع فيتيفر، بخور، خشبي، يتوازن مع لمسات ياسمين، أمبروكسان ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	62d74b01-a106-4074-92a8-a56b4b99ab40	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	eb735750-80fc-4302-b17e-4edf6532f275	t	f	0	2026-07-16 15:22:18.56	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
8f5a737b-4122-4e72-b68d-d22363b7f3bb	%D8%B5%D9%86%D8%AF%D9%84-dhb-0422	صندل	Royal Sandalwood	DHB-0422	عطر فاخر بطابع صندل، خشبي، كريمي، يتوازن مع لمسات مسك، عنبر ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	f472cc49-84a5-4267-95bf-9e9b03db2a08	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	1dfc7cc5-0034-48e2-8ef3-9b07d9349f22	t	f	0	2026-07-16 15:22:22.327	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
ffc9fa3a-300b-4f16-ae34-05217b887280	%D8%B9%D9%88%D8%AF-%D8%AA%D8%B1%D8%AA%D9%8A%D9%84-dhb-0423	عود ترتيل	Arabian Oud Oud Tarteel	DHB-0423	عطر فاخر بطابع عود، بخور، ورد، يتوازن مع لمسات عنبر، خشبي ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	26e988b4-46fb-4100-a190-0ed4a7d72d34	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	82afd46a-3d54-4ec8-a48e-fbeda9cad867	t	f	0	2026-07-16 15:22:25.421	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
f302d48a-6e27-4e81-b46a-725c5024a4a5	%D8%B4%D9%8A-%D8%B9%D9%88%D8%AF-dhb-0424	شيّ عود	Junaid Shay Oud	DHB-0424	عطر فاخر بطابع شاي، عود، توابل، يتوازن مع لمسات عنبر، خشبي ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	26e988b4-46fb-4100-a190-0ed4a7d72d34	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	dccab504-3627-4507-995b-a7c0b3d49a19	t	f	0	2026-07-16 15:22:28.085	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
4ba18694-2e09-413d-9406-9050f623540f	%D8%A8%D9%88%D8%B1%D9%86-%D8%A7%D9%86-%D8%B1%D9%88%D9%85%D8%A7-%D8%A7%D9%86%D8%AA%D8%B3-dhb-0117	بورن ان روما انتس	Valentino Donna Born In Roma Intense	DHB-0117	عطر نسائي شرقي مكثف ودافئ للغاية يرتكز على ثلاثية دافئة من الفانيلا والجاوي مع عبير أزهار الياسمين الأنثوي وجاذبية العنبر.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	48d6e4f0-dea5-4aae-83cb-8d0f2b35c286	t	f	0	2026-07-16 15:06:17.004	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
477898f2-01cc-4cee-8672-faea3786d6a4	%D8%A8%D9%88%D8%B1%D9%86-%D8%A7%D9%86-%D8%B1%D9%88%D9%85%D8%A7-%D8%A7%D9%83%D8%B3%D8%AA%D8%B1%D8%A7-%D8%AF%D9%88%D8%B2-dhb-0119	بورن ان روما اكسترا دوز	Valentino Donna Born in Roma Extradose	DHB-0119	عطر نسائي شرقي مكثف ذو تركيز عالٍ وفوحان استثنائي، يمزج بين دفء الفانيلا ونكهة الرم الفاخرة مع حلاوة التوت الأسود والأخشاب الداكنة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	3da57818-e495-4235-a58a-3eb9099e3bdd	t	f	0	2026-07-16 15:06:22.792	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
6a0f6f75-6de5-4e9b-863d-d9c7aa5a18f0	%D8%B9%D9%88%D8%AF-%D8%AE%D9%86%D8%AC%D8%B1-dhb-0425	عود خنجر	Khanjar Oud	DHB-0425	عطر فاخر بطابع عود، جلدي، زعفران، يتوازن مع لمسات دخاني، خشبي ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	26e988b4-46fb-4100-a190-0ed4a7d72d34	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	164747fd-ce80-47e9-9781-7d2af402e7f5	t	f	0	2026-07-16 15:22:31.053	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
ee04f101-b607-4ee7-81d4-d311d0ab312b	%D8%B9%D9%88%D8%AF-%D8%B2%D8%B9%D9%81%D8%B1%D8%A7%D9%86-dhb-0426	عود زعفران	Dahab Oud Saffron	DHB-0426	عطر فاخر بطابع عود، زعفران، عنبر، يتوازن مع لمسات جلدي، دافئ ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	26e988b4-46fb-4100-a190-0ed4a7d72d34	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	dccab504-3627-4507-995b-a7c0b3d49a19	t	f	0	2026-07-16 15:22:33.822	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
ff44fb09-7713-4a5f-a831-e3ba2fb1a992	%D8%B9%D9%88%D8%AF-%D8%A8%D8%A7%D8%AA%D8%B4%D9%88%D9%84%D9%8A-dhb-0427	عود باتشولي	Dahab Oud Patchouli	DHB-0427	عطر فاخر بطابع عود، باتشولي، خشبي، يتوازن مع لمسات دخاني، عنبر ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	26e988b4-46fb-4100-a190-0ed4a7d72d34	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	57840ef0-005e-417b-ba07-8b318e13ec77	t	f	0	2026-07-16 15:22:36.519	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
659df86c-cea1-459c-9e9f-2df775204f2c	%D8%B9%D9%88%D8%AF-%D8%B1%D9%88%D8%B2-dhb-0428	عود روز	Dahab Oud Rose	DHB-0428	عطر فاخر بطابع عود، ورد، عنبر، يتوازن مع لمسات دافئ، خشبي ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	26e988b4-46fb-4100-a190-0ed4a7d72d34	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	c37cd5a4-143d-44da-812a-57e4bd4816ff	t	f	0	2026-07-16 15:22:39.542	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
b6fe8f53-aade-4915-9eff-0e671fa904ae	%D8%B3%D9%86%D9%8A%D9%83-%D9%81%D9%88%D9%8A%D8%B3-dhb-0433	سنيك فويس	Gucci The Voice of the Snake	DHB-0433	عطر فاخر بطابع عود، باتشولي، زعفران، يتوازن مع لمسات دخاني، خشبي ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	26e988b4-46fb-4100-a190-0ed4a7d72d34	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	57840ef0-005e-417b-ba07-8b318e13ec77	t	f	0	2026-07-16 15:22:53.671	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
e2ff5d78-74e7-4bdf-be25-08804796ca26	%D8%B9%D9%86%D8%A8%D8%B1-%D9%86%D9%88%D8%AA-dhb-0434	عنبر نوت	Dior Ambre Nuit	DHB-0434	عطر فاخر بطابع عنبر، ورد، حمضي، يتوازن مع لمسات دافئ، فلفلي ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	f472cc49-84a5-4267-95bf-9e9b03db2a08	55719cb3-2581-4ade-854f-d90e64e837ea	3ef45d89-f354-4984-a4d8-308b605a9b0e	18096b42-cc7d-4889-8fe7-8a2e4985dcbb	t	f	0	2026-07-16 15:22:56.551	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
db23f5a3-26c4-42ed-b209-9c884e21b45d	%D8%A3%D8%B1%D8%A8%D9%8A%D8%A7%D9%86-%D8%AA%D9%88%D9%86%D9%83%D8%A7-dhb-0435	أربيان تونكا	Montale Arabians Tonka	DHB-0435	عطر فاخر بطابع تونكا، زعفران، عود، يتوازن مع لمسات عنبر، حلو ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	26e988b4-46fb-4100-a190-0ed4a7d72d34	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	984f8f6e-e321-475a-adc4-08db65972893	t	f	0	2026-07-16 15:22:59.491	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
d48b933b-b1c5-4a1b-8f3d-beff03f3751d	%D9%81%D8%A7%D9%86%D9%8A%D9%84%D8%A7-%D8%A3%D9%88%D8%B1%D9%83%D9%8A%D8%AF-dhb-0436	فانيلا أوركيد	Van Cleef & Arpels Orchidee Vanille	DHB-0436	عطر فاخر بطابع فانيلا، أوركيد، شوكولاتة، يتوازن مع لمسات لوز، حلو ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	62d74b01-a106-4074-92a8-a56b4b99ab40	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	e3d56a18-cc20-48b5-b8c6-ffac045e0252	t	f	0	2026-07-16 15:23:02.024	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
d2862041-da7d-4bd6-a2b8-d04cccded51a	%D8%B9%D9%88%D8%AF-%D9%85%D8%A7%D8%B1%D9%83%D9%88%D8%AC%D8%A7-dhb-0437	عود ماركوجا	Maison Crivelli Oud Maracuja	DHB-0437	عطر فاخر بطابع استوائي، عود، جلدي، يتوازن مع لمسات فاكهي، دخاني ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	26e988b4-46fb-4100-a190-0ed4a7d72d34	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	758abe9c-f12e-4edc-9151-111ba3d762b6	t	f	0	2026-07-16 15:23:05.06	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
7c24a04a-ebf6-46dd-9901-b990b1256737	%D8%B3%D8%A7%D9%8A%D8%AF-%D8%A5%D9%81%D9%8A%D9%83%D8%AA-dhb-0438	سايد إفيكت	Initio Side Effect	DHB-0438	عطر فاخر بطابع رم، تبغي، فانيلا، يتوازن مع لمسات قرفة، دافئ ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	f472cc49-84a5-4267-95bf-9e9b03db2a08	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	e715ad54-9c4c-4739-859e-0ec571d1dbb7	t	f	0	2026-07-16 15:23:08.228	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
798238eb-5828-4dc2-ab17-9d1cfa155707	%D8%A3%D9%85%D8%A8%D8%A7%D8%AF%D9%8A%D8%A7-dhb-0439	أمباديا	BDK Ambadia	DHB-0439	عطر فاخر بطابع عنبر، زعفران، فانيلا، يتوازن مع لمسات خشبي، مسك ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	f472cc49-84a5-4267-95bf-9e9b03db2a08	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	81a5c807-3887-4884-8673-f92ac5255d1b	t	f	0	2026-07-16 15:23:11.377	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
eadd89e8-76eb-4100-8697-129659c9d61f	%D8%A8%D9%8A%D8%B1%D8%A8%D9%88%D8%B3-50-dhb-0440	بيربوس 50	Amouage Purpose 50	DHB-0440	عطر فاخر بطابع بخور، توابل، خشبي، يتوازن مع لمسات عنبر، جلدي ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	f472cc49-84a5-4267-95bf-9e9b03db2a08	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	59477fa0-bcf1-404e-8db7-4b6c2d418db3	t	f	0	2026-07-16 15:23:13.795	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
7bf105e4-aa67-41e6-bb33-307472564c0b	%D9%85%D9%8A%D9%84%D9%88%D8%B1-%D8%B3%D9%83%D9%8A%D9%88%D8%B1-dhb-0441	ميلور سكيور	BDK Miller Secure	DHB-0441	عطر فاخر بطابع مسك، عنبر، خشبي، يتوازن مع لمسات فانيلا، بودري ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	f472cc49-84a5-4267-95bf-9e9b03db2a08	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	ac963f59-2832-4f10-9e6d-d60b32fe1bd2	t	f	0	2026-07-16 15:23:16.324	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
f11894e2-357c-4128-89c8-2ac34c71feb6	%D9%81%D8%A7%D9%86%D9%8A%D9%84%D8%A7-%D9%84%D9%8A%D8%B0%D8%B1-dhb-0442	فانيلا ليذر	BDK Vanille Leather	DHB-0442	عطر فاخر بطابع فانيلا، جلدي، أبيض زهري، يتوازن مع لمسات دافئ، توابل ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	f472cc49-84a5-4267-95bf-9e9b03db2a08	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	68341ac3-e685-48a7-94d7-ce06a044f234	t	f	0	2026-07-16 15:23:19.064	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
68110403-5d36-468a-a7f2-9fd010036c20	%D8%A3%D9%88%D8%B1%D9%83%D9%8A%D8%AF-%D9%84%D9%8A%D8%B0%D8%B1-dhb-0444	أوركيد ليذر	Van Cleef & Arpels Orchid Leather	DHB-0444	عطر فاخر بطابع جلدي، أوركيد، فانيلا، يتوازن مع لمسات بخور، توابل ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	f472cc49-84a5-4267-95bf-9e9b03db2a08	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	1dbbf6be-9d42-4867-9c2e-53564cffdbb9	t	f	0	2026-07-16 15:23:24.695	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
590e9aa4-3eea-4831-95ab-c21afee31529	%D9%83%D8%B1%D8%B4-%D8%A3%D9%88%D9%86-%D9%85%D9%8A-dhb-0447	كرش أون مي	Unique'e Luxury Crush On Me	DHB-0447	عطر فاخر بطابع كراميل، قهوة، فانيلا، يتوازن مع لمسات عنبر، حلو ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	f472cc49-84a5-4267-95bf-9e9b03db2a08	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	cb07ea0c-a695-422c-b4b6-905b32e28b99	t	f	0	2026-07-16 15:23:33.996	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
18139491-0ad4-419d-9dd6-dd23a666d319	%D8%A8%D9%84%D8%A7%D9%83-%D8%B3%D8%A7%D9%81%D8%B1%D9%88%D9%86-dhb-0448	بلاك سافرون	Byredo Black Saffron	DHB-0448	عطر فاخر بطابع زعفران، جلدي، فاكهي، يتوازن مع لمسات بنفسج، خشبي ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	f472cc49-84a5-4267-95bf-9e9b03db2a08	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	13b9fd2d-c819-43b6-a47f-5d080279ee9f	t	f	0	2026-07-16 15:23:36.973	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
c44b7b50-00bf-4b45-b82a-a24d0afb72e7	%D8%A8%D9%88%D8%A7-%D8%A5%D9%85%D8%A8%D8%B1%D9%8A%D8%A7%D9%84-dhb-0449	بوا إمبريال	Essential Parfums Bois Imperial	DHB-0449	عطر فاخر بطابع خشبي، أخضر، حمضي، يتوازن مع لمسات باتشولي، فيتيفر ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	55719cb3-2581-4ade-854f-d90e64e837ea	28c9117e-5e1b-489a-828e-9813acc326ff	78374c00-4fff-4221-b313-79f1000e267a	t	f	0	2026-07-16 15:23:39.989	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
4a22f5c8-ec6e-4aab-b1d9-80ee6036ee4c	%D8%A8%D9%88%D8%B1%D8%AA%D8%B1%D9%8A%D9%87-%D8%A3%D9%88%D9%81-%D9%84%D9%8A%D8%AF%D9%8A-dhb-0450	بورتريه أوف ليدي	Frederic Malle Portrait of a Lady	DHB-0450	عطر فاخر بطابع ورد، باتشولي، توابل، يتوازن مع لمسات بخور، فاكهي ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	62d74b01-a106-4074-92a8-a56b4b99ab40	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	639c7966-5236-4fa1-a3e6-6a1172318e9f	t	f	0	2026-07-16 15:23:43.227	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
70a64667-e3cc-4295-a254-bcf640a0e6af	%D8%A3%D9%88-%D8%AF%D9%8A-%D8%A3%D9%85%D8%A8%D8%B1%D9%8A%D9%87-dhb-0451	أو دي أمبريه	Tom Ford Eau d'Ombre Leather	DHB-0451	عطر فاخر بطابع جلدي، عنبر، فانيلا، يتوازن مع لمسات توابل، خشبي ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	f472cc49-84a5-4267-95bf-9e9b03db2a08	92fcd610-5dfa-489c-a894-ce8e7687c361	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	c7c2bc88-2c9d-4e13-b885-4f35179e441e	t	f	0	2026-07-16 15:23:46.648	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
26084fee-3ad3-4da4-a968-ea106c688060	%D8%A7%D9%84%D9%88%D8%B9%D8%AF-dhb-0452	الوعد	Frederic Malle The Promise	DHB-0452	عطر فاخر بطابع ورد، باتشولي، توابل، يتوازن مع لمسات عنبر، خشبي ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	f472cc49-84a5-4267-95bf-9e9b03db2a08	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	639c7966-5236-4fa1-a3e6-6a1172318e9f	t	f	0	2026-07-16 15:23:49.355	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
86bc3716-45d2-4d17-abd1-870bf8ba319e	%D9%81%D8%A7%D9%84%D9%83%D8%A7%D8%B1-dhb-0453	فالكار	Bvlgari Le Gemme Falkar	DHB-0453	عطر فاخر بطابع عود، زعفران، مسك، يتوازن مع لمسات جلدي، دخاني ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	26e988b4-46fb-4100-a190-0ed4a7d72d34	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	89be0798-b5ad-49ad-804a-e0e66f8fd768	t	f	0	2026-07-16 15:23:52.77	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
1955b6cf-5a80-4942-9158-f6fa057edb21	%D8%AA%D8%A7%D9%8A%D8%BA%D8%B1-dhb-0454	تايغر	Bvlgari Le Gemme Tygar	DHB-0454	عطر فاخر بطابع حمضي، أمبروكسان، خشبي، يتوازن مع لمسات طازج، مسك ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	28c9117e-5e1b-489a-828e-9813acc326ff	6b0852eb-0765-4323-a4d8-b3f8a69daae1	t	f	0	2026-07-16 15:23:55.706	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
e3e755d3-1bff-4e3f-ac05-7345f1af1562	%D8%A3%D9%84%D9%83%D8%B3%D9%86%D8%AF%D8%B1%D9%8A%D8%A7-2-dhb-0455	ألكسندريا 2	Xerjoff Alexandria II	DHB-0455	عطر فاخر بطابع عود، لافندر، قرفة، يتوازن مع لمسات خشبي، فانيلا ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	26e988b4-46fb-4100-a190-0ed4a7d72d34	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	b200be6a-1bb6-413d-b6bb-38b98d9acbcd	t	f	0	2026-07-16 15:23:58.67	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
ec4d69a7-4074-4ba6-a546-2abfa0a9bac4	%D8%AC%D8%A7%D9%8A%D8%AF%D9%86%D8%B3-46-dhb-0456	جايدنس 46	Amouage Guidance 46	DHB-0456	عطر فاخر بطابع كمثرى، بخور، ورد، يتوازن مع لمسات فانيلا، عنبر ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	f472cc49-84a5-4267-95bf-9e9b03db2a08	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	b9f6b64b-d342-4a13-bba3-4fc29f53ec56	t	f	0	2026-07-16 15:24:01.891	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
fe8c5d8c-a21e-4c9f-9e7b-9d57f7470ecf	%D8%A8%D8%A7%D8%B3%D9%8A%D9%81%D9%8A%D9%83-%D8%AA%D8%B4%D9%8A%D9%84-dhb-0457	باسيفيك تشيل	Louis Vuitton Pacific Chill	DHB-0457	عطر فاخر بطابع حمضي، فاكهي، أعشاب، يتوازن مع لمسات طازج، مسك ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	55719cb3-2581-4ade-854f-d90e64e837ea	28c9117e-5e1b-489a-828e-9813acc326ff	201e13b6-eb01-4abf-b592-c8a9d20e6e1e	t	f	0	2026-07-16 15:24:05.266	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
8f922038-e240-4d69-9174-7485ad0d07b2	ch-dhb-0111	CH	Carolina Herrera CH for Women	DHB-0111	عطر نسائي كلاسيكي راقٍ يمزج بين حمضيات البرغموت والليمون المنعشة وحلاوة الشوكولاته الفاخرة والقرفة مع لمسة جلدية دافئة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	e853c3c8-c0bc-46dc-a695-926f266aafd7	t	f	0	2026-07-16 15:05:59.985	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	0.9
904ce087-3ae9-49d3-936e-ae6885300c67	%D8%B9%D9%88%D8%AF-%D8%AE%D8%B4%D8%A8-dhb-0429	عود خشب	Dahab Oud Wood	DHB-0429	عطر فاخر بطابع عود، خشبي، صندل، يتوازن مع لمسات عنبر، توابل ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	26e988b4-46fb-4100-a190-0ed4a7d72d34	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	355ee5ef-8269-4bf9-9657-86ecbd2257ef	t	f	0	2026-07-16 15:22:42.521	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
8b936488-54bb-4aef-aa2b-9d9fc982a6a1	%D9%83%D9%88%D8%AA%D8%A7%D9%8A-dhb-0430	كوتاي	Unique'e Luxury Kutay	DHB-0430	عطر فاخر بطابع تبغي، كراميل، كحوليات، يتوازن مع لمسات جلدي، عنبر ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	f472cc49-84a5-4267-95bf-9e9b03db2a08	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	5ee2e39a-7f4b-469a-8bb7-fd9f1ff6247d	t	f	0	2026-07-16 15:22:45.271	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
5f1d7567-fb6e-4723-8539-5bda84fc358a	%D9%85%D9%88%D9%86-%D9%84%D8%A7%D9%8A%D8%AA-%D8%A8%D8%A7%D8%AA%D8%B4%D9%88%D9%84%D9%8A-dhb-0443	مون لايت باتشولي	Van Cleef & Arpels Moonlight Patchouli	DHB-0443	عطر فاخر بطابع باتشولي، ورد، كاكاو، يتوازن مع لمسات جلدي، خشبي ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	f472cc49-84a5-4267-95bf-9e9b03db2a08	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	4de6df8b-52fa-4099-843b-e3d6e7fef000	t	f	0	2026-07-16 15:23:21.946	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
c9fbd1bd-4c2a-42af-81c1-dc8b39ae8eb2	%D9%85%D8%A7%D8%AC%D9%8A%D9%83-dhb-0458	ماجيك	Al Jazeera Magic	DHB-0458	عطر فاخر بطابع عنبر، فانيلا، مسك، يتوازن مع لمسات زهري، حلو ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	f472cc49-84a5-4267-95bf-9e9b03db2a08	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	24d1f80f-822a-4071-828a-123131c24718	t	f	0	2026-07-16 15:24:08.441	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
40c0d3a1-48cf-43c0-b34e-2b240cd76b5b	%D8%A8%D9%84%D8%A7%D9%83-%D9%81%D8%A7%D9%86%D8%AA%D9%88%D9%85-dhb-0459	بلاك فانتوم	Kilian Black Phantom	DHB-0459	عطر فاخر بطابع قهوة، رم، كراميل، يتوازن مع لمسات لوز، صندل ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	62d74b01-a106-4074-92a8-a56b4b99ab40	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	9ee7912b-26f8-4d40-ad6a-f16cc07b6301	t	f	0	2026-07-16 15:24:11.572	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
ccdd4abb-c33f-4d7d-afca-22a5dd296732	%D8%AF%D9%88%D9%86%D8%AA-%D8%A8%D9%8A-%D8%B4%D8%A7%D9%8A-dhb-0460	دونت بي شاي	Kilian Love Don't Be Shy	DHB-0460	عطر فاخر بطابع زهرة البرتقال، مارشميلو، فانيلا، يتوازن مع لمسات كراميل، زهري ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	633eb004-96b4-4c8d-80e3-90509bd490ae	t	f	0	2026-07-16 15:24:14.547	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
9de02cb9-4c91-4e88-8846-dfed0c164ed6	%D9%86%D9%85%D8%A8%D8%B1-4-dhb-0461	نمبر 4	Thomas Kosmala No. 4 Apres L'Amour	DHB-0461	عطر فاخر بطابع حمضي، أمبروكسان، مسك، يتوازن مع لمسات خشبي، طازج ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	55719cb3-2581-4ade-854f-d90e64e837ea	28c9117e-5e1b-489a-828e-9813acc326ff	1eba2bee-fd7e-4f50-8532-f6a4c4c685ba	t	f	0	2026-07-16 15:24:18.282	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
6aae35b5-ae16-4a75-bc9f-d6d75a3ea804	%D8%A3%D9%88%D8%B1%D9%86%D9%8A%D8%AA-%D9%85%D9%88%D9%86-dhb-0462	أورنيت مون	Thomas Kosmala Ornate Moon	DHB-0462	عطر فاخر بطابع عنبر، زهري، مسك، يتوازن مع لمسات فانيلا، خشبي ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	f472cc49-84a5-4267-95bf-9e9b03db2a08	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	e0176c26-d2d6-4bc6-bcbf-bbbf7ea25e5c	t	f	0	2026-07-16 15:24:21.529	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
7670908f-7917-4255-8e6d-26d3f47d859f	%D8%B9%D9%88%D8%AF-%D9%83%D8%A7%D9%84%D8%A7%D9%83%D8%A7%D8%B3-dhb-0463	عود كالاكاس	Junaid Oud Kalakas	DHB-0463	عطر فاخر بطابع عود، بخور، عنبر، يتوازن مع لمسات جلدي، خشبي ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	26e988b4-46fb-4100-a190-0ed4a7d72d34	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	dccab504-3627-4507-995b-a7c0b3d49a19	t	f	0	2026-07-16 15:24:24.327	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
00a5a149-1fa5-479f-9d97-2f6736bed2f8	%D8%A3%D9%83%D9%88%D8%A7-%D8%AF%D9%8A-%D8%AC%D9%8A%D9%88-%D8%A8%D8%B1%D9%88%D9%81%D9%88%D9%86%D8%AF%D9%88-dhb-0464	أكوا دي جيو بروفوندو	Giorgio Armani Acqua di Gio Profondo	DHB-0464	عطر فاخر بطابع بحري، حمضي، أروماتك، يتوازن مع لمسات مسك، خشبي ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	28c9117e-5e1b-489a-828e-9813acc326ff	b95b6053-08d7-40ac-b383-ae43e9bb7c6d	t	f	0	2026-07-16 15:24:27.712	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
d865d0cb-37de-443f-9674-fe12eac045cf	%D8%B3%D9%88%D9%86%D8%AC-%D8%A5%D9%86-%D8%B0%D8%A7-%D9%88%D9%8A%D9%86%D8%AF-dhb-0465	سونج إن ذا ويند	Thomas Kosmala Song In The Wind	DHB-0465	عطر فاخر بطابع زهري، عنبر، مسك، يتوازن مع لمسات خشبي، حلو ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	f472cc49-84a5-4267-95bf-9e9b03db2a08	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	c8872534-793a-4d06-bade-b23fb12da689	t	f	0	2026-07-16 15:24:30.765	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
d4913078-04bd-4947-bdd0-e1ed5348dcf4	%D8%AA%D9%8A%D8%B1-%D8%AF%D9%8A-%D9%87%D9%8A%D8%B1%D9%85%D8%B3-dhb-0466	تير دي هيرمس	Hermes Terre d'Hermes	DHB-0466	عطر فاخر بطابع حمضي، معدني، فيتيفر، يتوازن مع لمسات خشبي، توابل ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	28c9117e-5e1b-489a-828e-9813acc326ff	893ccdc0-0e5b-45df-b154-74bac560d820	t	f	0	2026-07-16 15:24:34.257	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
8710a3af-739b-4817-aceb-3d3eca0566d3	%D9%84%D8%A7%D9%86%D8%AA%D8%B1%D9%88%D8%AF%D9%8A%D8%AA-%D8%A5%D9%86%D8%AA%D8%B3-dhb-0142	لانتروديت إنتس	Givenchy L'Interdit Intense	DHB-0142	عطر نسائي شرقي غامض ومكثف يفتتح بلمسة من الفلفل الأسود مع قلب من مسك الروم والسمسم وقاعدة دافئة من الفانيلا السوداء والباتشولي.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	4379c839-78ef-466f-ac2d-125b5a556a09	t	f	0	2026-07-16 15:07:31.039	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
4d017fe5-f486-4d0a-b1de-21ddcc5b9256	%D9%85%D8%B3-%D8%AF%D9%8A%D9%88%D8%B1-dhb-0153	مس ديور	Dior Miss Dior Eau de Parfum (2021)	DHB-0153	عطر نسائي رقيق وراقٍ يفوح بعبير الورد الجوري والفاوانيا الناعمة مع لمسات حلوة من الخوخ والدراق وقاعدة مسكية من الفانيلا.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	988b6faf-a987-4716-ab09-30cf69746431	t	f	0	2026-07-16 15:08:01.654	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
72d1e17a-edc0-463b-a895-8c4f442b3c5e	%D9%86%D8%B1%D8%B3%D9%8A%D8%B3%D9%88-%D8%A8%D9%88%D8%AF%D8%B1%D9%8A%D9%87-dhb-0164	نرسيسو بودريه	Narciso Rodriguez Narciso Poudree	DHB-0164	عطر نسائي مخملي ناعم للغاية بطابع بودري راقٍ يمزج بين ياسمين سامباك والورد الجوري وقلب من المسك الحسي وقاعدة خشبية من الأرز الأبيض.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	1b9c945e-6d91-413c-9c67-9568e174f5f3	t	f	0	2026-07-16 15:08:34.721	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
7f30029f-092c-4c95-82f5-9a39690b3f4c	%D8%A7%D8%B3%D9%85%D9%8A%D8%A7%D9%83%D9%8A-%D8%A8%D9%88%D8%B1-%D9%81%D9%8A%D9%85-dhb-0176	اسمياكي بور فيم	Issey Miyake L'Eau d'Issey for Women	DHB-0176	عطر نسائي أيقوني منعش بطابع مائي نقي، يفوح بعبير أزهار اللوتس المائية والزنبق والفريزيا مع نفحات بحرية باردة وقاعدة خشبية ناعمة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	6c238c82-0aad-48f1-9fa8-c5daecba81d8	t	f	0	2026-07-16 15:09:10.565	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
359618ae-76db-47d0-b416-3f2874d42184	%D8%A7%D9%86%D8%AA%D9%86%D8%B3%D9%84%D9%8A-you-dhb-0202	انتنسلي You	Giorgio Armani Stronger With You Intensely	DHB-0202	عطر رجالي شرقي دافئ وشهي للغاية يتميز بنكهة التوفي والكراميل الذائب الممزوجة بحرارة القرفة والقاعدة الكريمية للفانيلا والتونكا.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	13e702ee-13dd-4366-90ee-98d3afc13155	t	f	0	2026-07-16 15:10:24.086	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
efc1a8bb-203a-4dc6-8ddc-5de529b07d7e	%D8%A8%D9%84%D8%A7%D9%83-%D8%A7%D9%88%D8%B1%D9%83%D9%8A%D8%AF-dhb-0215	بلاك اوركيد	Tom Ford Black Orchid	DHB-0215	عطر شرقي فخم وغامض للجنسين، يمزج بين حلاوة الشوكولاته المكسيكية الداكنة ونقاء زهور الأوركيد السوداء مع البخور الباتشولي الدافئ.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	55719cb3-2581-4ade-854f-d90e64e837ea	3ef45d89-f354-4984-a4d8-308b605a9b0e	693aada7-58ca-4914-abaf-e7bea863cee6	t	f	0	2026-07-16 15:11:02.159	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
10df2330-c31b-454b-8f35-8e4ee05ca445	%D9%84%D9%88%D9%81%D8%B1%D8%B2-dhb-0431	لوفرز	Louis Vuitton Lovers	DHB-0431	عطر فاخر بطابع أخضر، خشبي، حمضي، يتوازن مع لمسات زنجبيل، صندل ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	55719cb3-2581-4ade-854f-d90e64e837ea	28c9117e-5e1b-489a-828e-9813acc326ff	78374c00-4fff-4221-b313-79f1000e267a	t	f	0	2026-07-16 15:22:48.157	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
0c50de65-748d-4d12-8885-296f2c5c7b0b	%D8%A7%D9%84%D9%8A%D9%86-dhb-0005	الين	Thierry Mugler Alien	DHB-0005	عطر نسائي غامض وجذاب يرتكز على عبير الياسمين الساحر مع دفء العنبر واللمسات الخشبية الفاخرة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	65e1feb8-c0f2-4ee5-a769-98f475d9ac7e	t	f	0	2026-07-16 15:00:35.237	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
81a26ad3-7d36-484e-90c2-c9674528bd93	%D8%A7%D8%AA%D9%8A%D8%B1%D9%86%D8%AA%D9%8A-dhb-0007	اتيرنتي	Calvin Klein Eternity for Women	DHB-0007	عطر نسائي كلاسيكي يفيض بالانتعاش والنقاء عبر باقة غنية من الزهور البيضاء واللمسات الخشبية المنعشة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	d50ad458-b4fc-4d8b-a69c-e56f502be3b0	t	f	0	2026-07-16 15:00:41.261	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	0.8
86df4db3-9546-458e-812d-987ad735f122	%D8%A7%D9%88%D8%B1%D8%BA%D9%86%D8%B2%D8%A7-dhb-0014	اورغنزا	Givenchy Organza	DHB-0014	عطر نسائي كلاسيكي فاخر يمزج بنعومة فائقة بين عبير زهور الياسمين ومسك الروم وقاعدة دافئة من الفانيلا وجوزة الطيب.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	588c48fd-2dbe-4265-9d9e-c188e4c79685	t	f	0	2026-07-16 15:01:07.058	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
d732c139-274b-48d9-8f4b-bf6d776a789c	%D8%A7%D8%AF%D9%83%D8%AA-%D8%AF%D9%8A%D9%88%D8%B1-dhb-0010	ادكت ديور	Dior Addict Eau de Parfum	DHB-0010	عطر نسائي دافئ وساحر ينبض بعبير زهور ملكة الليل والياسمين مع قاعدة شرقية مكثفة من الفانيلا.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	7ac9c0f9-134c-4515-bacf-9b2a254f5646	t	f	0	2026-07-16 15:00:51.777	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
53017bb5-499a-4e04-8e64-d38ecad10cd6	%D8%B3%D9%88%D9%81%D8%A7%D8%AC-dhb-0002	سوفاج	Dior Sauvage	DHB-0002	عطر رجالي فواح ومنعش بنفحات أروماتيكية وحمضية جذابة مع طابع خشبي فاخر.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	28c9117e-5e1b-489a-828e-9813acc326ff	23cd02cb-ce77-4bfe-9026-f2faab1109ba	t	f	0	2026-07-16 15:00:21.126	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
df7b65c9-eb8d-46ee-a00a-fe2312ab53fb	%D8%A8%D9%84%D8%A7%D9%83-%D8%A7%D9%88%D8%A8%D9%8A%D9%88%D9%85-dhb-0003	بلاك اوبيوم	Yves Saint Laurent Black Opium	DHB-0003	عطر نسائي دافئ وساحر يمزج بين فخامة حبوب القهوة وجاذبية الفانيلا الحلوة مع لمسة زهرية ناعمة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	dbacd355-cb1b-4667-9aa1-70b6f21e81b7	t	f	0	2026-07-16 15:00:26.341	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
b7e13877-b96e-45b0-bac1-571371854018	%D8%B9%D9%88%D8%AF-%D9%85%D9%84%D9%83%D9%8A-dhb-0004	عود ملكي	عود ملكي	DHB-0004	عطر شرقي فاخر وثابت يجسد فخامة العود الملكي الممزوج بملامح دافئة من العنبر والتوابل الشرقية.	\N	26e988b4-46fb-4100-a190-0ed4a7d72d34	55719cb3-2581-4ade-854f-d90e64e837ea	3ef45d89-f354-4984-a4d8-308b605a9b0e	dccab504-3627-4507-995b-a7c0b3d49a19	t	f	0	2026-07-16 15:00:31.696	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
0f06ee55-2363-4bad-96fc-64e55d6f8be7	%D8%A7%D9%84%D9%88%D9%85%D8%A8%D9%8A%D8%A7-dhb-0006	الومبيا	Paco Rabanne Olympea	DHB-0006	عطر نسائي أنيق يجسد الأنوثة بنفحات الفانيلا الدافئة الممزوجة بانتعاش الياسمين المائي والزنجبيل.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	37d9b4c5-5024-4ae0-ae41-029b6081d694	t	f	0	2026-07-16 15:00:38.257	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
9457ded1-6ca4-4506-947a-835e8cdc38ea	%D8%A7%D8%B1%D9%85%D8%A7%D9%86%D9%8A-%D9%83%D9%88%D8%AF-dhb-0008	ارماني كود	Giorgio Armani Armani Code for Women	DHB-0008	عطر نسائي حسي وجذاب يجمع بين انتعاش زهر البرتقال وحلاوة العسل وقاعدة دافئة من الفانيلا.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	3cbeebe2-1fd3-46d1-b0a7-90cdcf1585c6	t	f	0	2026-07-16 15:00:44.83	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
3b2eee4a-cede-428c-a508-ddb936d9789b	%D8%A7%D8%B3%D9%83%D9%8A%D8%A8-dhb-0011	اسكيب	Calvin Klein Escape for Women	DHB-0011	عطر نسائي كلاسيكي منعش يمزج بين عبير الفواكه الاستوائية والبابونج مع نفحات بحرية هادئة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	e3317efc-95aa-477f-bb07-92ed95a2372b	t	f	0	2026-07-16 15:00:56.035	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
e5462083-202c-4a22-b9db-c036eb0cf1c9	%D8%A7%D9%84%D9%8A-%D8%B5%D8%B9%D8%A8-%D8%A8%D9%8A%D8%B1%D9%81%D9%8A%D9%88%D9%85-dhb-0012	الي صعب بيرفيوم	Elie Saab Le Parfum	DHB-0012	عطر نسائي راقٍ ومشرق يحتفي بزهر البرتقال الأفريقي والياسمين مع قلب دافئ وعذب من عسل الورد.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	b8b9be4f-7a90-4cd0-81d8-f71d1be413ba	t	f	0	2026-07-16 15:00:59.466	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	0.8
9c969ede-7504-409f-a07a-61f8c2bf1ace	%D8%A7%D9%8A%D9%88%D8%B1%D9%8A%D8%A7-dhb-0013	ايڤوريا	Calvin Klein Euphoria for Women	DHB-0013	عطر نسائي غامض وجذاب يفتتح بنفحات الرمان المنعشة مع قلب من زهور الأوركيد وقاعدة خشبية عنبرية دافئة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	e7bab132-58db-462f-be68-241a0cfb71af	t	f	0	2026-07-16 15:01:03.515	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
36b5c8eb-cbbd-498b-8565-a70a5f0a525f	%D8%A7%D8%B3%D9%83%D8%A7%D8%AF%D8%A7-%D8%B4%D9%8A%D8%B1%D9%8A-dhb-0029	اسكادا شيري	Escada Cherry in the Air	DHB-0029	عطر نسائي منعش ولذيذ يفوح بعبير الكرز الأحمر الحامض وحلاوة المارشملو مع لمسة دافئة من خشب الصندل.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	22e991fe-a953-4a40-8574-36d5f1c1609b	t	f	0	2026-07-16 15:01:52.684	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
88b9c3ea-f9aa-44a8-aa88-1d2dfa87051c	%D8%A8%D9%88%D9%86-%D8%A8%D9%88%D9%86-dhb-0042	بون بون	Viktor & Rolf Bonbon	DHB-0042	عطر نسائي حلو وشهي يرتكز على جاذبية الكراميل مع نفحات فاكهية منعشة من الخوخ والبرتقال وقاعدة عنبرية دافئة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	374874b7-0c69-4b05-9032-5805aeb06c97	t	f	0	2026-07-16 15:02:39.504	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
055fa60c-9764-45b3-8d78-2737f584df4d	%D8%A7%D8%B3%D9%83%D8%A7%D8%AF%D8%A7-%D9%83%D9%88%D9%84%D9%8A%D9%83%D8%B4%D9%86-dhb-0027	اسكادا كوليكشن	Escada Collection	DHB-0027	عطر نسائي شرقي دافئ يتميز بنفحات عذبة من الكراميل وعسل النحل مع قاعدة غنية من الفانيلا وخشب الصندل.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	bf2dce4d-06f4-4565-8ee7-1d77be813b66	t	f	0	2026-07-16 15:01:47.386	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
eb8df122-2c9a-4f22-b82a-0db35ef110be	%D8%A7%D9%85%D9%88%D8%B1-%D8%A7%D9%85%D9%88%D8%B1-dhb-0016	امور امور	Cacharel Amor Amor	DHB-0016	عطر نسائي مبهج وحيوي يفوح بنفحات حمضية منعشة من الجريب فروت والبرتقال مع قلب زهري فاكهي وقاعدة ناعمة من الفانيلا.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	d7cfce6d-6062-461f-a8ea-180775824756	t	f	0	2026-07-16 15:01:14.152	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
d578595b-6705-491f-ba0d-31b5f82f2872	%D8%A7%D9%86%D8%AC%D9%84-%D8%AC%D9%88%D9%84%D8%AF-dhb-0018	انجل جولد	Victoria's Secret Angel Gold	DHB-0018	عطر نسائي منعش ومشرق يمزج بين حلاوة الإجاص وانتعاش البرغموت مع باقة زهرية من الغاردينيا وقاعدة مسكية هادئة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	f5ecdfb8-b963-4def-bf90-ee4f20f111bc	t	f	0	2026-07-16 15:01:20.319	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
e3b4b7f4-c601-4482-8935-319780b2b08a	%D8%A7%D9%86%D8%B3%D9%88%D9%84%D9%86%D8%B3-dhb-0019	انسولنس	Guerlain Insolence Eau de Parfum	DHB-0019	عطر نسائي ساحر ومهيب يتميز بنفحات بودرية كثيفة من البنفسج والسوسن مع لمسة حلوة من التوت الأحمر.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	03f67098-2b12-4a51-8307-26ddfa7f1a90	t	f	0	2026-07-16 15:01:23.371	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
23d36c92-f6d1-424b-a130-eff65b3470a5	%D8%A7%D9%86%D8%AC%D9%84-%D9%86%D9%88%D8%A7-dhb-0020	انجل نوڤا	Thierry Mugler Angel Nova	DHB-0020	عطر نسائي حيوي ومغرٍ يفتتح بنفحات فاكهية حلوة من التوت الأحمر مع قلب من الورد وقاعدة خشبية دافئة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	8863dae1-d79b-44ee-8205-24347218db2d	t	f	0	2026-07-16 15:01:26.385	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
a8a9664b-20ea-4c42-a1ab-4a428fc294b4	%D8%A3%D9%86%D9%81%D9%8A-%D9%85%D9%8A-dhb-0021	أنفي مي	Gucci Envy Me	DHB-0021	عطر نسائي منعش ومبهج يجمع بين عبير الفاوانيا والياسمين ونفحات الفواكه الوردي مع قاعدة ناعمة من المسك الأبيض.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	fbcac733-ec30-45ab-afad-bed1b68c25e4	t	f	0	2026-07-16 15:01:29.62	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
067b8a8b-6ed6-4401-b45c-351cad2d7ddb	%D8%A7%D9%88%D9%84-%D8%A7%D9%88%D9%81-%D9%85%D9%8A-dhb-0022	اول اوف مي	Narciso Rodriguez All of Me	DHB-0022	عطر نسائي عصري يحتفي بجمال الورد والجرانيوم مع قاعدة غنية ومخملية من المسك الأبيض المميز.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	71c9fc88-2452-4478-b1b0-1440980530bd	t	f	0	2026-07-16 15:01:32.641	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
044315ac-09de-4042-bab6-b234ed0f310c	%D8%A7%D8%B3%D9%86%D8%B4%D9%88%D8%A7%D9%84-dhb-0023	اسنشوال	Johan B Sensual	DHB-0023	عطر نسائي ناعم يتميز بمزيج حيوي من الفواكه الاستوائية والأزهار الرقيقة مع لمسة دافئة من المسك والباتشولي.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	68dce486-15a5-41b7-801b-7a51839e6718	t	f	0	2026-07-16 15:01:35.656	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
280fb2cf-d23f-49bb-a9ec-606c342c0599	%D8%A7%D8%B3%D9%83%D8%A7%D8%AF%D8%A7-%D9%85%D8%BA%D9%86%D9%8A%D8%B3%D9%8A%D9%88%D9%85-dhb-0024	اسكادا مغنيسيوم	Escada Magnetism	DHB-0024	عطر نسائي دافئ وحلو للغاية يمزج بين كراميل الفانيلا اللذيذ والتوت الأحمر مع باقة زهرية شرقية ساحرة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	0cf0739c-0014-404a-82ff-68b0c5126e67	t	f	0	2026-07-16 15:01:38.618	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
c4172c9e-75b5-4946-8832-deea55117532	%D8%A7%D8%B3%D9%83%D8%A7%D8%AF%D8%A7-%D9%83%D8%A7%D9%86%D8%AF%D9%8A-%D9%84-dhb-0025	اسكادا كاندي لڤ	Escada Candy Love	DHB-0025	عطر نسائي مبهج وحلو بنفحات غزل البنات اللذيذة والتفاح المغطى بالكراميل مع قلب من ورود سنتيفوليا الناعمة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	58a47922-431f-4c54-b902-57313692c18f	t	f	0	2026-07-16 15:01:41.641	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
a3995d5e-7d74-4485-878e-7cc51d1090bf	%D8%A7%D8%B3%D9%83%D8%A7%D8%AF%D8%A7-%D8%AA%D8%A7%D8%AC-dhb-0026	اسكادا تاج	Escada Taj Sunset	DHB-0026	عطر نسائي استوائي منعش يفوح برائحة المانجو الناضجة وجوز الهند والدراق مع قاعدة دافئة من المسك وخشب الصندل.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	0f3f0284-2f5f-46d5-baa9-5d1530a80cd8	t	f	0	2026-07-16 15:01:44.632	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
4621d0cd-1f1f-4401-8682-ce3d8eca0422	%D8%A7%D8%B3%D9%83%D8%A7%D8%AF%D8%A7-%D8%B3%D9%83%D8%B3%D9%8A-%D8%AC%D8%B1%D8%A7%D9%81%D9%8A%D8%AA-dhb-0028	اسكادا سكسي جرافيت	Escada Sexy Graffiti	DHB-0028	عطر نسائي منعش ومبهج يفوح بعبير الفواكه الحمراء الاستوائية كالفراولة والتوت مع باقة زهرية ناعمة وقاعدة مسكية.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	fbcac733-ec30-45ab-afad-bed1b68c25e4	t	f	0	2026-07-16 15:01:49.839	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
c7b5b7e5-cdd5-45e5-bb69-63cfefed4251	%D8%A8%D9%88%D8%B3-%D8%A7%D9%88%D8%B1%D9%86%D8%AC-dhb-0047	بوس اورنج	Hugo Boss Boss Orange for Women	DHB-0047	عطر نسائي منعش ومشرق يفتتح بنفحات التفاح الأحمر الحلوة مع قلب من زهور البرتقال البيضاء وقاعدة دافئة من الفانيلا وخشب الصندل.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	fbcac733-ec30-45ab-afad-bed1b68c25e4	t	f	0	2026-07-16 15:02:54.577	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
6796549a-4d47-4746-a463-09c282b32182	%D8%A7%D9%8A%D8%AF%D9%88%D9%84-dhb-0031	ايدول	Lancome Idole	DHB-0031	عطر نسائي رقيق ونظيف يحتفي بجمال الورد التركي والياسمين مع لمسة فاكهية حلوة وقاعدة ناعمة من المسك الأبيض.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	1fdfe318-018a-49c0-b164-74a0baad0a72	t	f	0	2026-07-16 15:02:00.995	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
dcf5fdcd-9837-48e8-8335-7a245acd9c37	%D8%A7%D9%8A%D9%88%D8%AF%D9%8A-%D9%85%D9%88%D8%B2%D9%8A%D9%84-%D8%B1%D9%88%D8%B2-dhb-0032	ايودي موزيل روز	Givenchy Eaudemoiselle de Givenchy Rose à la Folie	DHB-0032	عطر نسائي رومانسي وأنيق يجمع بين انتعاش ورد الشاي ونكهة التفاح المكرمل مع قاعدة ناعمة من المسك.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	9c70bd66-3ef6-490a-b6a3-596340ad8856	t	f	0	2026-07-16 15:02:04.378	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
312a8838-da3b-45cc-afe4-bdb61d487252	%D8%A7%D8%B1%D8%B2%D8%B3%D8%AA%D8%A8%D9%84-dhb-0033	ارزستبل	Givenchy Irresistible	DHB-0033	عطر نسائي جذاب وناعم يتميز بعبير الورد والزنبق مع لمسة فاكهية حلوة وقاعدة خشبية مسكية دافئة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	6363f08b-89b2-4c45-9d1e-4fec2a32b2ed	t	f	0	2026-07-16 15:02:07.174	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
1fe93fdd-e1f4-4653-be71-8f563d0b566c	%D8%A8%D9%88%D8%B3-%D8%A7%D9%84%D9%8A-dhb-0034	بوس اليڤ	Hugo Boss Alive	DHB-0034	عطر نسائي حيوي وجذاب ينبض بنفحات الفواكه الطازجة كالتفاح والخوخ مع لمسة دافئة من القرفة والفانيلا والأخشاب الثمينة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	0cf70ef6-deae-46e7-94a8-48fdc8896aa0	t	f	0	2026-07-16 15:02:10.538	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
ff492e6a-9f3a-4013-bff9-371914b060e3	%D8%A8%D8%B1%D8%A8%D8%B1%D9%8A-%D8%A8%D9%88%D8%AF%D9%8A-dhb-0035	بربري بودي	Burberry Body	DHB-0035	عطر نسائي دافئ وناعم يتميز بلمسات بودرية حسية تجمع بين الخوخ والورد الجوري وقاعدة غنية بخشب الصندل والمسك.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	c5090b09-8992-4d3d-b05c-76cee0a0f037	t	f	0	2026-07-16 15:02:13.806	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
ba8a5af6-892c-4fc3-99db-d04e3e3fc452	%D8%A8%D8%B1%D8%A7%D8%AF%D9%88%D9%83%D8%B3-dhb-0036	برادوكس	Prada Paradoxe	DHB-0036	عطر نسائي زهري حسي يجمع بين حيوية زهر البرتقال والياسمين ودفء العنبر والمسك مع لمسة حلوة من الفانيلا.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	579cf094-dfbf-4088-b588-9dd640e41d28	t	f	0	2026-07-16 15:02:17.531	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
397115ec-f4e5-4414-839b-67d8aaf0d3be	%D8%A8%D8%B1%D8%A7%D8%AF%D9%88%D9%83%D8%B3-%D8%A5%D9%86%D8%AA%D9%86%D8%B3-dhb-0037	برادوكس إنتنس	Prada Paradoxe Intense	DHB-0037	عطر نسائي عميق ومكثف يتميز بنفحات ياسمين غنية مع قاعدة دافئة من العنبر وطحلب البلوط وحلاوة الفانيلا المركزة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	31962865-2662-4079-9c11-dff116a6259f	t	f	0	2026-07-16 15:02:20.918	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
3efc65e3-0315-47e4-aaa4-f3979b8d3a7b	%D8%A8%D8%B1%D8%A7%D8%AF%D9%88%D9%83%D8%B3-%D8%B1%D8%A7%D8%AF%D9%8A%D8%A7%D8%B1-%D8%A5%D8%B3%D9%8A%D9%86%D8%B3-dhb-0038	برادوكس راديار إسينس	Prada Paradoxe Radical Essence	DHB-0038	عطر نسائي شرقي دافئ ومبتكر يجمع بين حيوية زهر البرتقال ونكهة الفستق المملح الفريدة مع قاعدة مخملية من خشب الصندل.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	d58c0308-8f48-4d69-aea0-da7ce2d3e254	t	f	0	2026-07-16 15:02:25.068	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
81de114f-b777-47a6-bcf5-e330ca90337b	%D8%A8%D9%84%D9%88-%D9%84%D9%8A%D8%AF%D9%8A-dhb-0039	بلو ليدي	Rasasi Blue Lady	DHB-0039	عطر نسائي كلاسيكي غني يفوح بباقة دافئة من زهور الياسمين ومسك الروم مع لمسة بودرية حسية ونفحات خشبية ومسكية ثابتة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	79c4fc65-12ff-4a25-be4a-caa1f54324bb	t	f	0	2026-07-16 15:02:30.531	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
035a49c9-3768-457d-aff4-9e2b206026d2	%D8%A8%D8%B1%D8%A7%D8%AF%D8%A7-%D9%83%D8%A7%D9%86%D8%AF%D9%8A-dhb-0040	برادا كاندي	Prada Candy	DHB-0040	عطر نسائي حلو ودافئ يتميز بطابع شرقي شهي يمزج بين الكراميل اللذيذ والمسك الحسي وقاعدة ناعمة من الفانيلا والجاوي.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	739a2139-8ff4-4bda-9966-539dab4ce193	t	f	0	2026-07-16 15:02:33.584	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
4bb8b556-298d-4ca8-ae89-102b6665d712	%D8%A8%D9%84%D8%A7%D9%8A-%D9%81%D9%88%D8%B1-%D9%87%D9%8A%D8%B1-dhb-0041	بلاي فور هير	Givenchy Play For Her	DHB-0041	عطر نسائي مبهج وحسي يمزج بين حلاوة الدراق الأبيض وزهور الأوركيد وقاعدة دافئة من خشب الصندل والمسك.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	8863dae1-d79b-44ee-8205-24347218db2d	t	f	0	2026-07-16 15:02:36.431	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
e850daba-9bef-4315-a514-27cb52d08d12	%D8%A8%D9%86%D8%AF%D9%88%D8%B1%D8%A7-dhb-0044	بندورا	J. Casanova Pandora	DHB-0044	عطر نسائي كلاسيكي عريق يتميز بنقاء الزهور البيضاء وأزهار السوسن مع نفحات خضراء منعشة وقاعدة دافئة من المسك وخشب الصندل.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	d2871147-562c-4d81-a3c7-58dc0f67053b	t	f	0	2026-07-16 15:02:45.895	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
723e5cc1-fc70-499a-9dd3-6a3b6656e95c	%D8%A8%D9%84%D8%A7%D9%83-%D8%A7%D8%A8%D9%8A%D9%88%D9%85-dhb-0045	بلاك ابيوم	Yves Saint Laurent Black Opium	DHB-0045	عطر نسائي دافئ وساحر يمزج بين فخامة حبوب القهوة وجاذبية الفانيلا الحلوة مع لمسة زهرية ناعمة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	dbacd355-cb1b-4667-9aa1-70b6f21e81b7	t	f	0	2026-07-16 15:02:48.587	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
44ea09e5-6635-4b8c-bb71-e8c3170a869b	%D8%A8%D9%84%D8%A7%D9%83-%D8%A7%D8%A8%D9%8A%D9%88%D9%85-%D8%B1%D9%8A%D8%AF-dhb-0046	بلاك ابيوم ريد	Yves Saint Laurent Black Opium Over Red	DHB-0046	عطر نسائي حسي ودافئ يجمع بين حلاوة الكرز الأحمر وجاذبية القهوة السوداء مع قاعدة غنية بقرون الفانيلا والباتشولي.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	590e3ad1-747a-43e1-b9e3-3efa426cf9d1	t	f	0	2026-07-16 15:02:51.806	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
6ebeb9b9-bb1e-4aae-a2c0-5b29b3294b12	%D8%A8%D8%B1%D8%A7%D9%8A%D8%AA-%D9%83%D8%B1%D8%B3%D8%AA%D8%A7%D9%84-dhb-0050	برايت كرستال	Versace Bright Crystal	DHB-0050	عطر نسائي منعش وساحر يمزج بين حيوية الرمان وثمار اليوزو مع قلب غني بزهور الفاوانيا واللوتس وقاعدة مسكية رقيقة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	79d5fc87-0611-4b22-a53f-196efc6cc093	t	f	0	2026-07-16 15:03:03.067	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
bfed6bb8-b8ac-4eb6-91c6-3573e728987f	%D8%AC%D9%88%D8%AF-%D8%AC%D9%8A%D8%B1%D9%84-%D8%A8%D9%84%D8%B4-%D8%A7%D9%84%D9%83%D8%B3%D9%8A%D8%B1-dhb-0072	جود جيرل بلش الكسير	Carolina Herrera Good Girl Blush Elixir	DHB-0072	عطر نسائي فاخر وجذاب يمزج بين حلاوة الفانيلا وأناقة الورد والإيلنغ مع قاعدة ترابية دافئة ومكثفة من الباتشولي.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	c01c285c-8cad-4cce-b71c-2740264b52e6	t	f	0	2026-07-16 15:04:07.991	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
9130e65e-2416-4133-ba17-ac151fc19dcc	%D8%AC%D9%88%D8%AF-%D8%AC%D9%8A%D8%B1%D9%84-%D8%A8%D9%84%D8%B4-dhb-0073	جود جيرل بلش	Carolina Herrera Good Girl Blush	DHB-0073	عطر نسائي رقيق يتميز بعبير الفاوانيا والإيلنغ الأنثوي مع قلب بودري وقاعدة دافئة وحلوة من الفانيلا.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	05b8c34f-5118-4803-bc9d-80d7066d20ab	t	f	0	2026-07-16 15:04:10.659	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
4cda3b3d-edf6-4743-9fe2-c97114628d65	%D8%AC%D9%88%D8%AF-%D8%AC%D9%8A%D8%B1%D9%84-dhb-0074	جود جيرل	Carolina Herrera Good Girl	DHB-0074	عطر نسائي حسي وغامض يمزج بين دفء حبوب الكاكاو والتونكا وجاذبية الياسمين ومسك الروم بطابع فخم ومثير.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	bc74a6d2-8142-42c7-bb84-a0baf76afd46	t	f	0	2026-07-16 15:04:13.595	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
e3d2d948-92b2-426d-b792-2769a000bd19	%D8%AC%D9%88%D8%AF-%D8%AC%D9%8A%D8%B1%D9%84-%D8%B3%D9%88%D8%A8%D8%B1%D9%8A%D9%85-dhb-0075	جود جيرل سوبريم	Carolina Herrera Good Girl Supreme	DHB-0075	عطر نسائي شرقي شهي يمزج بين حيوية التوت البري وعمق التونكا الدافئة مع لمسة أنثوية من ياسمين سامباك.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	590e3ad1-747a-43e1-b9e3-3efa426cf9d1	t	f	0	2026-07-16 15:04:16.405	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
1ace4014-b9df-4dbc-83f0-cb336ab3154f	%D8%AC%D8%A7%D8%AF%D9%88%D8%B1-dhb-0076	جادور	Dior J'adore	DHB-0076	عطر نسائي أيقوني فاخر يحتفي بالأنوثة عبر باقة ذهبية متألقة من الياسمين والورد مع لمسة فاكهية منعشة من الإجاص والدراق وقاعدة مسكية ناعمة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	79d5fc87-0611-4b22-a53f-196efc6cc093	t	f	0	2026-07-16 15:04:19.003	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
3a21e5ec-28c0-4f84-9e28-716ffaaf708b	%D8%AC%D8%A7%D8%AF%D9%88%D8%B1-%D9%84%D9%88%D8%B1-dhb-0077	جادور لور	Dior J'adore L'Or	DHB-0077	عطر نسائي شرقي زهري دافئ يفيض بفخامة أزهار الياسمين والورد ولمسة حلوة من التوت وقاعدة كريمية من الفانيلا والتونكا.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	9a04132f-a486-4d64-8015-39d0c61ce36b	t	f	0	2026-07-16 15:04:21.958	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
f00a2fe6-3317-4679-b60f-98da548f091a	%D8%AC%D9%88%D8%AA%D8%B4%D9%8A-%D8%A8%D9%84%D9%88%D9%85-dhb-0078	جوتشي بلوم	Gucci Bloom	DHB-0078	عطر نسائي ناعم وراقٍ يجسد روعة باقة من الزهور البيضاء الفواحة كمستخلص مسك الروم وبراعم الياسمين الطبيعي.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	fe554c46-2be0-4809-8a7a-cac06af4ca20	t	f	0	2026-07-16 15:04:24.735	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
1e4ba0bb-3695-44f6-a6e6-05b27af98c82	%D8%A8%D9%8A%D9%86%D9%83-%D8%B4%D9%88%D8%BA%D8%B1-dhb-0049	بينك شوغر	Aquolina Pink Sugar	DHB-0049	عطر نسائي شهي وفائق الحلاوة يفوح برائحة غزل البنات والكراميل الممزوج بالتوت الأحمر مع لمسة دافئة من الفانيلا.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	0cf0739c-0014-404a-82ff-68b0c5126e67	t	f	0	2026-07-16 15:03:00.285	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
52ad51f7-28b8-424b-8b33-2ec3540ccf94	%D8%A8%D9%84%D8%A7%D9%83-xs-%D8%A8%D9%8A%D9%88%D8%B1-dhb-0052	بلاك X.s بيور	Paco Rabanne Pure XS for Her	DHB-0052	عطر نسائي حسي ومثير يتميز بمزيج جريء وفريد يجمع بين حلاوة الفانيلا ونكهة الفشار المقرمش مع عبير أزهار الإيلنغ وقاعدة مسكية دافئة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	23954756-186e-4942-84e3-07d8a8b69733	t	f	0	2026-07-16 15:03:08.973	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
a74a511c-771a-4ced-ba3b-7b100ac108d2	%D8%A8%D9%88%D9%8A%D8%B2%D9%86-%D8%AC%D9%8A%D8%B1%D9%84-dhb-0053	بويزن جيرل	Dior Poison Girl	DHB-0053	عطر نسائي جذاب وشهي يفتتح بنفحات منعشة من البرتقال المر ليمهد الطريق لقلب دافئ من اللوز وقاعدة حلوة ومكثفة من فانيلا مدغشقر والجاوي.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	3da57818-e495-4235-a58a-3eb9099e3bdd	t	f	0	2026-07-16 15:03:12.05	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
ba802919-7fce-4546-a59b-14bd0460b0d0	%D8%A8%D9%88%D9%8A%D8%B2%D9%86-%D8%A8%D9%8A%D9%88%D8%B1-dhb-0054	بويزن بيور	Dior Pure Poison	DHB-0054	عطر نسائي راقٍ ونظيف يحتفي بجمال الزهور البيضاء كالياسمين والغاردينيا مع نضارة الحمضيات وقاعدة دافئة وثابتة من خشب الصندل والمسك الأبيض.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	1fdfe318-018a-49c0-b164-74a0baad0a72	t	f	0	2026-07-16 15:03:14.802	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
2f20daca-1e33-43e9-bfce-5f462f9aad1f	%D8%A8%D8%A7%D8%B1%D9%8A%D8%B3-%D9%87%D9%8A%D9%84%D8%AA%D9%88%D9%86-dhb-0055	باريس هيلتون	Paris Hilton for Women	DHB-0055	عطر نسائي منعش ومشرق يفوح بعبير فواكه الصيف اللذيذة كالشمام والدراق والتفاح الأخضر مع باقة زهرية ناعمة من الفريزيا والياسمين.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	fbcac733-ec30-45ab-afad-bed1b68c25e4	t	f	0	2026-07-16 15:03:17.562	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
ce4d51f0-433e-460a-a208-621c3e8f4b19	%D8%A5%D9%8A%D9%88%D8%B3%D9%88-%D8%B3%D9%83%D8%B3%D9%8A-dhb-0056	إيوسو سكسي	Victoria's Secret Eau So Sexy	DHB-0056	عطر نسائي حلو ومنعش يمزج بين نضارة التفاح الأخضر والبرغموت وحلاوة الكريمة المخفوقة بطابع ناعم ومبهج.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	b7d730a2-dc24-4357-a110-1809fdf51c40	t	f	0	2026-07-16 15:03:20.776	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
d3b56ea8-5e1a-4d0f-9eeb-66a8f17d70f0	%D9%86%D8%A7%D9%8A%D8%AA-dhb-0057	نايت	Victoria's Secret Night	DHB-0057	عطر نسائي دافئ وحسي يمزج بين حلاوة البرقوق والتفاح ونفحات الأزهار النادرة مع قاعدة خشبية مسكية غنية.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	171be19a-ca88-4585-8f5e-88c69f8aff53	t	f	0	2026-07-16 15:03:23.831	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
ab0fdb66-51a5-4cfd-b076-79828c0b717e	%D8%A8%D9%85%D8%A8-%D8%B4%D9%8A%D9%84-dhb-0058	بمب شيل	Victoria's Secret Bombshell	DHB-0058	عطر نسائي منعش ومشرق يفوح بنفحات فاكهية استوائية من الباشون فروت والبرتقال مع قلب من زهور الفاوانيا وقاعدة مسكية ناعمة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	fbcac733-ec30-45ab-afad-bed1b68c25e4	t	f	0	2026-07-16 15:03:26.6	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
7dc66a03-4d0f-4276-869e-09b2c818f7e1	%D8%A8%D9%8A%D9%88%D8%B1-%D8%B3%D8%AF%D9%8A%D9%83%D8%B4%D9%8A%D9%86-dhb-0059	بيور سديكشين	Victoria's Secret Pure Seduction	DHB-0059	عطر نسائي مبهج فائق الجاذبية يجمع بين حلاوة البرقوق الأحمر وعصير الشمام مع عبير زهور الفريزيا الناعمة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	55d39187-cc00-4ea3-83b8-abd614c0eef6	t	f	0	2026-07-16 15:03:29.606	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
153c7004-3501-4bee-866f-3af4678025f6	212-%D8%B3%D9%83%D8%B3%D9%8A-dhb-0060	212 سكسي	Carolina Herrera 212 Sexy	DHB-0060	عطر نسائي حسي وجذاب يمزج بنعومة بين حلاوة غزل البنات والفانيلا ونفحات الفلفل الوردي الحار مع قاعدة مسكية دافئة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	adeb86d4-22ba-4a6b-8d56-3c1fd2f50d24	t	f	0	2026-07-16 15:03:32.573	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
d9093e0e-6e25-4196-b413-4a49b34b4bfe	212-vip-dhb-0061	212 VIP	Carolina Herrera 212 VIP	DHB-0061	عطر نسائي شرقي حسي وجريء يمزج بين عبير الباشون فروت والمسك وقاعدة غنية ودافئة من الفانيلا.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	959f65d9-a5d3-4ae9-9d0b-e276853fa7cf	t	f	0	2026-07-16 15:03:35.588	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
93e4e0f3-0b00-4dfc-a8b1-8c016ab4cbe7	%D8%AA%D8%B1%D9%8A%D8%B2%D9%88%D8%B1-%D9%85%D9%8A%D8%AF-%D9%86%D8%A7%D9%8A%D8%AA-%D9%84%D8%A7%D9%86%D9%88%D9%8A-dhb-0068	تريزور ميد نايت لانوي	Lancome La Nuit Tresor	DHB-0068	عطر نسائي شرقي دافئ وشهي للغاية يتميز بنفحات الفراولة والكمثرى مع قلب من الورد الأسود وقاعدة غنية بالكراميل والجاوي واللبان.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	590e3ad1-747a-43e1-b9e3-3efa426cf9d1	t	f	0	2026-07-16 15:03:56.358	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	0.85
0ddb987e-77d8-400b-baa1-a69b620cc9bc	%D8%AC%D9%88%D8%AA%D8%B4%D9%8A-%D8%AC%D9%84%D8%AA%D9%8A-dhb-0080	جوتشي جلتي	Gucci Guilty for Women	DHB-0080	عطر نسائي كلاسيكي جذاب يمزج بين عبير زهور الليلك والدراق وحرارة الفلفل الوردي مع قاعدة دافئة من العنبر والباتشولي.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	7f23b36b-c55c-4e94-8f36-757b12396d0c	t	f	0	2026-07-16 15:04:30.767	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
0f66d56c-fbca-4d6d-b35e-09420861c1fd	%D8%AC%D9%88%D8%AA%D8%B4%D9%8A-%D9%81%D9%84%D9%88%D8%B1%D8%A7-dhb-0081	جوتشي فلورا	Gucci Flora	DHB-0081	عطر نسائي ناعم وراقٍ يفتتح بنفحات الحمضيات والفاوانيا المنعشة مع قلب من زهور الأوسمانثوس وقاعدة دافئة من خشب الصندل.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	f5ecdfb8-b963-4def-bf90-ee4f20f111bc	t	f	0	2026-07-16 15:04:33.502	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
945bbd94-7fe1-4bfb-87c7-11c873ee3af7	%D8%AC%D9%88%D8%AA%D8%B4%D9%8A-%D8%B1%D8%B4-dhb-0082	جوتشي رش	Gucci Rush	DHB-0082	عطر نسائي مغوٍ وجريء يرتكز على حلاوة الدراق الأبيض الفاتنة والغاردينيا مع لمسة توابل دافئة وقاعدة ترابية قوية من الباتشولي.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	e4d6f4c5-b964-46e6-b01a-bf2257eae3c1	t	f	0	2026-07-16 15:04:36.162	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
65fb337a-a8fe-436b-b5d5-8cc4cf67e822	%D8%AC%D9%88%D8%AA%D8%B4%D9%8A-%D8%A8%D8%A7%D9%85%D8%A8%D9%88-dhb-0083	جوتشي بامبو	Gucci Bamboo	DHB-0083	عطر نسائي أنيق ومتوازن يحتفي بعبير زنابق الدار البيضاء وأزهار البرتقال مع نضارة البرغموت وقاعدة مخملية من خشب الصندل.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	36fc8a8f-e410-4576-bb9c-f0cb4881aed4	t	f	0	2026-07-16 15:04:38.81	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
e9a4ffde-feb3-41c5-ae79-54cf6b1ca96b	%D8%AC%D9%88%D8%AA%D8%B4%D9%8A-%D8%B9%D9%88%D8%AF-%D8%A7%D9%86%D8%AA%D8%B3-dhb-0084	جوتشي عود انتس	Gucci Intense Oud	DHB-0084	عطر شرقي فاخر ومهيب يتميز بتركيز عميق يجمع بين فخامة العود وحرارة البخور ولمسات الجلود الفاخرة بطابع ملكي ثابت.	\N	26e988b4-46fb-4100-a190-0ed4a7d72d34	55719cb3-2581-4ade-854f-d90e64e837ea	3ef45d89-f354-4984-a4d8-308b605a9b0e	70113ada-1fdc-4a6b-b28b-d1f877be1e8f	t	f	0	2026-07-16 15:04:42.051	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
5e8065e9-d4a8-4b18-9a8f-864de258ed66	%D8%AC%D8%A7%D8%A8%D8%B1%D9%8A%D9%84-dhb-0085	جابريل	Chanel Gabrielle	DHB-0085	عطر نسائي مشرق وفياض بالأنوثة يجمع بين نضارة الحمضيات وعبير زهر البرتقال والياسمين مع قلب كريمي مسكي رقيق.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	34043d63-b89d-474e-a43f-cb4e800b2ba3	t	f	0	2026-07-16 15:04:45.005	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
ab073824-be87-4b52-8c45-22212449408b	%D8%B0%D8%A7-%D8%B3%D9%86%D8%AA-dhb-0086	ذا سنت	Hugo Boss The Scent for Her	DHB-0086	عطر نسائي ناعم وحيوي يمزج بين حلاوة الخوخ المعسل وأناقة زهور الفريزيا وقاعدة دافئة وشهية من حبوب الكاكاو المحمصة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	55d39187-cc00-4ea3-83b8-abd614c0eef6	t	f	0	2026-07-16 15:04:47.395	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
986881ad-1775-40e0-83d4-c281ff40abad	%D8%A7%D9%88%D9%86%D9%84%D9%8A-%D8%B0%D8%A7-%D9%88%D9%86-dhb-0087	اونلي ذا ون	Dolce & Gabbana The Only One	DHB-0087	عطر نسائي ساحر ومبتكر يتميز بتباين فريد بين نفحات القهوة الدافئة والبنفسج البودري مع قاعدة شهية من الكراميل والفانيلا.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	739a2139-8ff4-4bda-9966-539dab4ce193	t	f	0	2026-07-16 15:04:49.79	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
031207ac-912b-4c24-a80b-d121f5c9cdc3	%D8%AC%D9%8A%D8%B1%D9%84-%D8%A7%D9%88%D9%81-%D9%86%D8%A7%D9%88-dhb-0088	جيرل اوف ناو	Elie Saab Girl of Now	DHB-0088	عطر نسائي شهي ودافئ ينبض بحلاوة اللوز والفستق الحلبي مع نفحات زهر البرتقال والكمثرى وقاعدة غنية من التونكا والفانيلا.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	0cf0739c-0014-404a-82ff-68b0c5126e67	t	f	0	2026-07-16 15:04:52.189	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
daafce23-50c9-423e-8d3f-8602da604567	%D8%B0%D8%A7-%D9%88%D9%86-dhb-0089	ذا ون	Dolce & Gabbana The One for Women	DHB-0089	عطر نسائي دافئ وراقٍ يمزج بين حلاوة الدراق وثمار الليتشي مع زنابق الوادي وقاعدة حسية غنية بالفانيلا والعنبر.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	ce8e6c78-35a3-4673-a33d-fbc8b1c022d7	t	f	0	2026-07-16 15:04:54.886	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
196d0da9-174f-47bb-95cd-10ac089fa6ef	%D8%AA%D9%88%D9%85%D9%8A-%D8%AC%D9%8A%D8%B1%D9%84-dhb-0062	تومي جيرل	Tommy Hilfiger Tommy Girl	DHB-0062	عطر نسائي منعش ومفعم بالنشاط يفوح بعبير الياسمين البري وأزهار الكاميليا مع نضارة الليمون والنعناع المنعش.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	5ebf6a3d-63a9-4622-9453-2b510b2ab20d	t	f	0	2026-07-16 15:03:38.855	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
41a9d464-7d13-4cdd-9f6b-de11a694a2cf	%D8%AA%D8%A7%D8%AA%D8%B4-%D8%A7%D9%88%D9%81-%D8%A8%D9%8A%D9%86%D9%83-dhb-0063	تاتش اوف بينك	Lacoste Touch of Pink	DHB-0063	عطر نسائي حيوي ومنعش يمزج بين حمضية البرتقال الأحمر وحلاوة الدراق مع قلب زهري ناعم وقاعدة دافئة من الفانيلا.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	b56da027-aaac-42d3-af23-800a717473f5	t	f	0	2026-07-16 15:03:41.991	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
aa34a7e3-727d-4e19-9d1c-7d94b2cf6f13	%D8%AA%D8%B4%D8%A7%D9%86%D8%B3-dhb-0064	تشانس	Chanel Chance	DHB-0064	عطر نسائي كلاسيكي فاخر يجمع بين دفء الباتشولي وحرارة الفلفل الوردي مع عبير الياسمين ونضارة الحمضيات.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	56e2f21e-a24e-4ee6-bd1b-f20038518558	t	f	0	2026-07-16 15:03:45.266	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
43d65d7e-b90d-42ca-ae91-8b22a67ab0da	%D8%AA%D8%B4%D8%A7%D9%86%D8%B3-%D8%AA%D9%86%D8%AF%D8%B1-dhb-0065	تشانس تندر	Chanel Chance Eau Tendre	DHB-0065	عطر نسائي رقيق ومنعش يتميز بنفحات فاكهية ناعمة من السفرجل والجريب فروت مع قلب زهري من الياسمين وقاعدة مسكية دافئة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	79d5fc87-0611-4b22-a53f-196efc6cc093	t	f	0	2026-07-16 15:03:47.974	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
40726f06-c62b-46f8-b1d8-d92b02a31d77	%D8%AA%D8%B4%D8%A7%D9%86%D8%B3-%D9%81%D8%B1%D9%8A%D8%B4-dhb-0066	تشانس فريش	Chanel Chance Eau Fraiche	DHB-0066	عطر نسائي منعش ومفعم بالحيوية يجمع بين حدة الليمون ودفء خشب الأرز والباتشولي مع باقة زهرية مائية رقيقة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	86379d33-5d24-4ec2-9f04-2818a627bfa4	t	f	0	2026-07-16 15:03:50.938	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
35e7f742-681f-4b0f-b429-cd4dfa3231d3	%D8%AA%D8%B1%D8%B2%D9%8A%D9%88%D8%B1-%D9%85%D9%8A%D8%AF-%D9%86%D8%A7%D9%8A%D8%AA-%D8%B1%D9%88%D8%B2-dhb-0067	ترزيور ميد نايت روز	Lancome Tresor Midnight Rose	DHB-0067	عطر نسائي حسي وساحر يمزج بين حلاوة التوت العليق الأحمر وعبير الورد الجوري مع لمسة دافئة من خشب الأرز والمسك.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	55d39187-cc00-4ea3-83b8-abd614c0eef6	t	f	0	2026-07-16 15:03:53.669	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
af4e4b85-9bcd-4a9b-a172-1d9c7e7b9954	%D8%AC%D9%88%D8%AF%D9%8A%D8%B3-dhb-0069	جوديس	Burberry Goddess	DHB-0069	عطر نسائي دافئ وراقي يرتكز على ثلاثية فريدة من الفانيلا الغنية الممزوجة بلمسة من الخزامى (اللافندر) وقاعدة خشبية ناعمة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	9b4e3e97-e402-4fc7-a2c2-39f7662cc44a	t	f	0	2026-07-16 15:03:59.386	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
60cb819e-a78e-4fac-897b-30166e63fc97	%D8%AC%D9%88%D9%86%D8%B3%D9%88%D9%86-dhb-0070	جونسون	Johnson's Baby Powder scent	DHB-0070	عطر نسائي ناعم للغاية يفوح برائحة النظافة المنعشة وبودرة الأطفال الكلاسيكية مع لمسة رقيقة من الورد والمسك الأبيض.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	c4b1ab5f-d645-4cfb-af75-d1738c843945	t	f	0	2026-07-16 15:04:02.393	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
0df63608-7a9b-4dc7-9166-4ae3f1614388	%D8%AC%D9%88%D9%8A-dhb-0071	جويّ	Dior Joy	DHB-0071	عطر نسائي مبهج ومشرق يمزج بين انتعاش الحمضيات وجاذبية الورد الجوري والياسمين مع قاعدة خشبية مسكية دافئة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	97db8ca7-3586-4020-8c18-fa4f6896efe8	t	f	0	2026-07-16 15:04:05.329	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
9fcfb7f1-4b02-4d85-9d6e-9f6d30050467	%D8%A8%D8%B1%D8%A8%D8%B1%D9%8A-%D9%87%D9%8A%D8%B1-dhb-0091	بربري هير	Burberry Her Eau de Parfum	DHB-0091	عطر نسائي حيوي ومنعش يتميز بانفجار عطري من ثمار التوت البري والفراولة والكرز مع قلب زهري ناعم وقاعدة خشبية مسكية.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	fbcac733-ec30-45ab-afad-bed1b68c25e4	t	f	0	2026-07-16 15:04:59.705	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
4c67a538-fc47-460f-bc48-c95e279c5e9d	%D8%B4%D9%8A%D8%B1-%D8%A8%D9%8A%D9%88%D8%AA%D9%8A-dhb-0092	شير بيوتي	Calvin Klein Sheer Beauty	DHB-0092	عطر نسائي ناعم ومنعش يمزج بين حلاوة الدراق والتوت الأحمر مع عبير الفاوانيا الوردية والياسمين وقاعدة مسكية رقيقة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	fbcac733-ec30-45ab-afad-bed1b68c25e4	t	f	0	2026-07-16 15:05:02.162	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
78efa338-9c4f-4fb2-b9ce-c6764f91adea	l3-dhb-0095	L.3	Dolce & Gabbana L'Imperatrice 3	DHB-0095	عطر نسائي مائي منعش يفوح بعبير البطيخ الأحمر الحلو والكيوي المنعش مع باقة أزهار رقيقة وقاعدة مسكية خفيفة تناسب الصيف.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	996d49c0-0aec-438a-b84f-434f51c26ec4	t	f	0	2026-07-16 15:05:11.04	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
e6ded678-e1f9-4fb6-9a91-62bff43db19f	g3-dhb-0096	G.3	Dolce & Gabbana L'Imperatrice 3	DHB-0096	عطر نسائي مائي منعش يفوح بعبير البطيخ الأحمر الحلو والكيوي المنعش مع باقة أزهار رقيقة وقاعدة مسكية خفيفة تناسب الصيف.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	996d49c0-0aec-438a-b84f-434f51c26ec4	t	f	0	2026-07-16 15:05:13.548	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
48effdc1-6343-4a8e-aca2-101fe013fd72	%D9%83%D9%88%D9%8A%D9%86-dhb-0097	كوين	Dolce & Gabbana Q	DHB-0097	عطر نسائي ملكي منعش يمزج بين حمضية الليمون الصقلي وحلاوة الكرز الأحمر مع قاعدة دافئة وقوية من خشب الأرز.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	964cc1ea-e8af-45c4-a96a-63add1e80c14	t	f	0	2026-07-16 15:05:16.637	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
1e57282b-dc0e-479f-9d2a-3d37929477bb	%D8%A8%D8%B1%D8%A7%D8%AF%D9%8A%D8%B3%D9%88-dhb-0098	براديسو	Roberto Cavalli Paradiso	DHB-0098	عطر نسائي منعش ومشرق يجسد أجواء الجزر الإيطالية بنفحات الياسمين الساحرة مع انتعاش الحمضيات وقاعدة خشبية من الصنوبر والسرو.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	af13e7f8-71bd-4899-a0c6-e68c9d82de14	t	f	0	2026-07-16 15:05:19.79	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
4c817412-00d4-478d-bebc-40a3d76a085e	%D8%B1%D8%A8%D9%8A%D8%B1%D8%AA%D9%88-%D9%83%D8%A7%D9%84%D9%8A-dhb-0099	ربيرتو كڤالي	Roberto Cavalli Eau de Parfum	DHB-0099	عطر نسائي شرقي زهري دافئ وراقٍ يتميز بعبير زهر البرتقال الحسي وحرارة الفلفل الوردي مع قاعدة غنية من التونكا والجاوي والفانيلا.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	31962865-2662-4079-9c11-dff116a6259f	t	f	0	2026-07-16 15:05:22.97	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
2871ddbb-2671-4d9a-9dd7-5202d2e81e7f	%D8%AC%D8%B3%D8%AA-dhb-0100	جست	Roberto Cavalli Just Cavalli	DHB-0100	عطر نسائي حسي وناعم يفتتح بنفحات النيرولي المشرقة مع قلب غني من أزهار التياري وقاعدة خشبية دافئة من خشب الورد.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	9fc738f6-fd4f-4347-b8e8-60cb66c3fb51	t	f	0	2026-07-16 15:05:25.639	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
bc1dc5b9-e07d-41bb-944a-6a75e0f2462f	%D8%B4%D8%A7%D9%86%D9%8A%D9%84-5-dhb-0103	شانيل 5	Chanel No. 5	DHB-0103	عطر نسائي أيقوني كلاسيكي يتميز بتوليفة فريدة من الألديهيدات البراقة والزهور البيضاء البودرية مع قاعدة خشبية دافئة من خشب الصندل.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	1bc2496e-4d07-4722-8114-4fa68623aac9	t	f	0	2026-07-16 15:05:33.747	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
04a92a24-3e48-4d18-8d47-1b4d07ac827f	si-dhb-0106	Si	Giorgio Armani Sì	DHB-0106	عطر نسائي أيقوني يجمع بين الأناقة والجاذبية، بفضل افتتاحيته من أوراق القرفة الصينية وقلبه النابض بالورد الجوري وقاعدة الباتشولي والفانيلا الدافئة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	e4d6f4c5-b964-46e6-b01a-bf2257eae3c1	t	f	0	2026-07-16 15:05:44.954	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
a3c1e88a-5ac7-4bb9-80bb-6e8b07d07060	%D8%B3%D9%8A%D9%86%D9%85%D8%A7-dhb-0107	سينما	Yves Saint Laurent Cinema	DHB-0107	عطر نسائي كلاسيكي فاخر يجسد بريق النجمات بفضل مزيج زهور اللوز والياسمين مع كليمنتين منعش وقاعدة دافئة من الفانيلا والعنبر.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	23954756-186e-4942-84e3-07d8a8b69733	t	f	0	2026-07-16 15:05:47.482	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
2d697d0a-30d0-4388-a0f5-ca1201ffe541	%D8%B3%D9%88-%D8%B3%D9%83%D8%A7%D9%86%D8%AF%D9%84-dhb-0108	سو سكاندل	Jean Paul Gaultier So Scandal!	DHB-0108	عطر نسائي جريء وفاتن يمزج بين حلاوة التوت البري ونضارة زهور البرتقال وياسمين سامباك مع نوتة حليبية كريمية فريدة ومثيرة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	56a80d47-4569-4d90-a5e5-c9deebc1e2a0	t	f	0	2026-07-16 15:05:51.438	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
8323296c-8ed6-4243-9234-54a2b6e6114c	%D8%B3%D9%83%D8%A7%D9%86%D8%AF%D9%84-dhb-0109	سكاندل	Jean Paul Gaultier Scandal	DHB-0109	عطر نسائي حلو ومثير يتميز بنوتة عسل النحل والكراميل المكثف الممزوج بنضارة البرتقال الأحمر وقاعدة ترابية غنية من الباتشولي.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	255a8e50-0cef-40a8-8d6a-54a1bfa3eda3	t	f	0	2026-07-16 15:05:54.301	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
bb352e30-0643-4ab2-9d43-b6ef7bb59e7d	%D8%A8%D9%84%D8%A7%D9%83-si-dhb-0105	بلاك Si	Giorgio Armani Sì Intense	DHB-0105	عطر نسائي شرقي فخم ومكثف يفوح بعبير غني من ثمار العليق والبرغموت مع قلب زهري دافئ وقاعدة عميقة من الباتشولي والفانيلا.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	e4d6f4c5-b964-46e6-b01a-bf2257eae3c1	t	f	0	2026-07-16 15:05:40.838	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
1b364c0b-662e-4cd5-954c-6bfee2b2c366	%D8%B3%D9%83%D8%A7%D9%86%D8%AF%D9%84-%D9%86%D8%A7%D9%8A%D8%AA-dhb-0110	سكاندل نايت	Jean Paul Gaultier Scandal By Night	DHB-0110	عطر نسائي حسي ودافئ يتميز بتوليفة حلوة مكثفة تجمع عسل النحل والكرز والتونكا مع عبير مسك الروم والباتشولي الأنيق.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	4379c839-78ef-466f-ac2d-125b5a556a09	t	f	0	2026-07-16 15:05:56.964	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
b0716a17-fde6-4187-81e6-2e50de59786e	%D8%B3%D8%AC%D9%86%D8%A7%D8%AA%D9%88%D8%B1-dhb-0112	سجناتور	Montblanc Signature	DHB-0112	عطر نسائي ناعم يفيض بالنظافة والأنوثة، يرتكز على دفء المسك الأبيض والفانيلا مع قلب زهري منعش من الماغنوليا واليوسفي.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	09d977dd-8c56-4451-98c8-2408d741def6	t	f	0	2026-07-16 15:06:02.655	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
2aecd3d7-0c14-40fc-9a02-5aa742da6901	%D8%B3%D9%88%D8%A8%D8%B1%D9%8A%D9%85-%D8%A8%D9%88%D9%83%D9%8A%D9%87-dhb-0113	سوبريم بوكيه	Yves Saint Laurent Supreme Bouquet	DHB-0113	عطر شرقي زهري فاخر ومثالي للجنسين، يحتفي بنقاء مسك الروم وأزهار الإيلنغ مع دفء العنبر والمسك بطابع راقٍ وجذاب.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	55719cb3-2581-4ade-854f-d90e64e837ea	3ef45d89-f354-4984-a4d8-308b605a9b0e	8a14e08b-0bd8-4f75-820a-73f7ec1fa820	t	f	0	2026-07-16 15:06:06.274	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
e08da125-5766-41a1-bdd6-c9ca9df0b92c	%D9%88%D9%83%D8%A7-%D9%8A%D9%81%D8%A7-dhb-0114	ڤوكا ڤيفا	Valentino Voce Viva	DHB-0114	عطر نسائي دافئ وراقٍ يجمع بين نضارة الماندرين والبرغموت وقلب متألق من زهر البرتقال مع قاعدة كريمية من الفانيلا والمسك.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	3cbeebe2-1fd3-46d1-b0a7-90cdcf1585c6	t	f	0	2026-07-16 15:06:08.957	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
34b9d907-e77d-4dcf-8251-06b07fa60aa0	%D9%84%D8%A7%D9%86%D8%AA%D9%8A%D9%86%D9%88-%D8%A8%D9%8A%D9%86%D9%83-dhb-0115	ڤلانتينو بينك	Valentino Valentina Pink	DHB-0115	عطر نسائي مبهج فائق الأنوثة يفتتح بحلاوة الفراولة والتوت الأسود مع باقة زهرية من الفاوانيا والورد وقاعدة شهية من الشوكولاته والبرالين.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	374874b7-0c69-4b05-9032-5805aeb06c97	t	f	0	2026-07-16 15:06:11.47	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
9034bc0f-5328-4dd3-b722-916bf17b239e	%D8%A8%D9%88%D8%B1%D9%86-%D8%A7%D9%86-%D8%B1%D9%88%D9%85%D8%A7-dhb-0116	بورن ان روما	Valentino Donna Born In Roma	DHB-0116	عطر نسائي أنيق وحديث يجمع بين أزهار الياسمين الثلاثية وجاذبية التوت الأسود مع قاعدة دافئة من فانيلا البوربون الغنية.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	7ac9c0f9-134c-4515-bacf-9b2a254f5646	t	f	0	2026-07-16 15:06:14.343	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
2b0e1194-769e-4c6e-b225-af46fe33848c	%D9%81%D8%A7%D9%86%D9%8A%D8%AA%D8%A7%D8%B2-dhb-0120	فانيتاز	Versace Vanitas	DHB-0120	عطر نسائي زهري منعش وأنيق يجمع بين نضارة الليمون وقلب متألق من زهرة التياري الاستوائية والفريزيا وقاعدة خشبية ناعمة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	34043d63-b89d-474e-a43f-cb4e800b2ba3	t	f	0	2026-07-16 15:06:25.752	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
6b1cde3b-7614-4f26-9c6a-e05a03cfe1f9	%D8%A7%D9%86%D9%8A%D9%84%D8%A7-dhb-0121	ڤانيلا	Chopard Vanille de Madagascar	DHB-0121	عطر نسائي شرقي فخم يرتكز على فخامة فانيلا مدغشقر الطبيعية الممزوجة بحلاوة الكراميل واللوز المر بطابع كريمي دافئ وساحر.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	9b4e3e97-e402-4fc7-a2c2-39f7662cc44a	t	f	0	2026-07-16 15:06:28.746	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
0cbe8336-1932-47a2-b470-90af69e93b25	%D8%AF%D9%8A%D9%84%D8%A7%D9%86-%D8%A8%D9%84%D9%88-dhb-0122	ديلان بلو	Versace Dylan Blue Pour Femme	DHB-0122	عطر نسائي منعش ومشرق يمزج بين حلاوة التفاح الأخضر والدراق ونفحات الياسمين والورد مع قاعدة مسكية خشبية أنيقة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	fbcac733-ec30-45ab-afad-bed1b68c25e4	t	f	0	2026-07-16 15:06:31.943	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
a563f573-f08e-4450-bf46-cc26967c13c6	%D9%81%D9%84%D9%88%D8%B1-%D8%A8%D9%85%D8%A8-dhb-0123	فلور بمب	Viktor & Rolf Flowerbomb	DHB-0123	عطر نسائي حسي وشهير يتميز بانفجار باقة من الزهور الفاخرة كالياسمين والأوركيد والورد مع قاعدة دافئة من الباتشولي والفانيلا.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	04f41f82-a809-4997-84d5-ef7b12230bf3	t	f	0	2026-07-16 15:06:36.249	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
fcf0c6ed-2798-4aee-b5fc-62978a63cbd3	%D9%8A%D9%81%D8%A7-%D9%84%D8%AC%D9%88%D8%B3%D9%8A-dhb-0124	ڤيفا لجوسي	Juicy Couture Viva la Juicy	DHB-0124	عطر نسائي حلو وشهي يجمع بين عصير التوت البري المنعش وقلب من زهور الغاردينيا وقاعدة غنية بالكراميل الذائب والبرالين والفانيلا.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	58a47922-431f-4c54-b902-57313692c18f	t	f	0	2026-07-16 15:06:40.603	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
8b600535-5657-4c05-a48a-59321a0ac0ab	%D9%83%D9%84%D9%88%D9%8A-%D9%86%D9%8A%D8%B1%D8%B3%D9%8A%D8%B3-dhb-0125	كلوي نيرسيس	Chloé Chloe Narcisse	DHB-0125	عطر نسائي كلاسيكي دافئ يتميز بنوتات زهور النرجس والقرنفل الغنية الممزوجة بحلاوة المشمش والدراق مع قاعدة خشبية دافئة وثابتة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	2fa6c608-80bf-48ec-b356-92504920c5a3	t	f	0	2026-07-16 15:06:43.632	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
f8751a4b-64a0-4878-ad63-704933f3f41f	%D9%83%D9%84%D9%88%D9%8A-%D9%86%D9%88%D9%85%D8%A7%D8%AF-dhb-0126	كلوي نوماد	Chloé Nomade	DHB-0126	عطر نسائي عصري بطابع ترابي منعش يمزج بين حلاوة برقوق ميرابيل وعبير زهور الفريزيا الناعمة مع قاعدة رطبة ونظيفة من طحلب البلوط.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	434fedfa-1e6b-4fe8-84c8-d3ab2332043c	t	f	0	2026-07-16 15:06:46.305	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
c78c89fd-baf2-41b8-a4fd-ec1df6fbf32f	%D8%B1%D8%B2%D8%A7%D8%AA%D8%B4%D9%8A-%D8%A7%D9%8A%D8%B1%D9%88%D8%B3-dhb-0127	ڤرزاتشي ايروس	Versace Eros Pour Femme	DHB-0127	عطر نسائي حمضي زهري منعش يمزج بين حيوية الليمون الصقلي والرمان وقلب من أزهار الياسمين وقاعدة مسكية خشبية دافئة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	bb1221d1-a973-41f7-9463-8e527df76797	t	f	0	2026-07-16 15:06:48.973	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
4ff689b4-a6fa-4912-aeb6-4f230ff633a3	kool-water-dhb-0128	kool water	Davidoff Cool Water for Women	DHB-0128	عطر نسائي صيفي منعش بطابع مائي يفوح بنفحات الشمام والليمون مع قلب رقيق من أزهار اللوتس والزنبق وقاعدة مسكية باردة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	5a24b8e6-20da-4e81-8048-d5e8af784922	t	f	0	2026-07-16 15:06:51.706	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
d7696520-73d0-4473-babc-fa0d1f3df150	%D9%83%D8%A7%D8%B3%D9%8A%D9%84%D9%8A%D8%A7-dhb-0129	كاسيليا	Pacoma Cassilia	DHB-0129	عطر نسائي كلاسيكي أنيق يتميز بتوليفة فاكهية حلوة من الدراق والمشمش والتوت مع باقة من الورد والياسمين وقاعدة دافئة من الفانيلا.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	8863dae1-d79b-44ee-8205-24347218db2d	t	f	0	2026-07-16 15:06:54.127	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
b8fab72a-155f-4392-bc00-93da631ca1a6	%D9%83%D8%A7%D9%84%D9%88%D8%B1%D9%8A%D9%86%D8%A7-%D9%87%D8%B1%D9%8A%D8%B1%D8%A7-dhb-0130	كالورينا هريرا	Carolina Herrera for Women (1988)	DHB-0130	عطر نسائي كلاسيكي فاخر يمثل الهوية الأولى للدار، يرتكز على فخامة مسك الروم والياسمين مع حلاوة المشمش وقاعدة عنبرية خشبية دافئة وثابتة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	31962865-2662-4079-9c11-dff116a6259f	t	f	0	2026-07-16 15:06:57.231	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
dfcdeaa5-756e-4dcf-8cdb-bd2bab3b377b	%D9%83%D9%86%D8%B2%D9%88-%D9%81%D9%84%D9%88%D8%B1-dhb-0131	كنزو فلور	Kenzo Flower by Kenzo	DHB-0131	عطر نسائي ناعم للغاية بطابع بودري فريد يمزج بين أزهار الورد البلغاري والبنفسج وحلاوة الفانيلا وقاعدة دافئة من المسك الأبيض.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	51136283-a3d2-4836-8ec3-c6032f679cb1	t	f	0	2026-07-16 15:06:59.99	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
3bed23fb-b4bc-4699-9192-586f02c0405e	%D9%83%D9%88%D9%83%D9%88-%D9%85%D8%AF%D9%85%D9%88%D8%B2%D9%8A%D9%84-dhb-0133	كوكو مدموزيل	Chanel Coco Mademoiselle	DHB-0133	عطر نسائي أنيق للغاية يفوح بنضارة البرتقال والبرغموت وقلب أنثوي من الورد والياسمين وقاعدة دافئة وثابتة من الباتشولي والمسك.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	397c4fa8-867b-42f2-bd92-fd838d2537f3	t	f	0	2026-07-16 15:07:05.391	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
f03d5a97-0539-4692-8841-af7a070ee27a	%D9%83%D9%88%D8%B1%D9%85%D8%A7%D9%86%D8%AF%D9%84-dhb-0134	كورماندل	Chanel Coromandel	DHB-0134	عطر شرقي خشبي فاخر للجنسين من مجموعة شانيل الخاصة، يمزج بين دفء الباتشولي وحلاوة الشوكولاته البيضاء مع لمسة بخور شرقية غامضة وساحرة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	55719cb3-2581-4ade-854f-d90e64e837ea	3ef45d89-f354-4984-a4d8-308b605a9b0e	d918b9a2-4613-42c8-9cdc-f9b2622f5f1d	t	f	0	2026-07-16 15:07:08.159	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
7d1d7ad0-8f9a-4f49-a517-df10b3136560	%D9%83%D9%88%D9%83%D9%88-%D8%B4%D8%A7%D9%86%D9%8A%D9%84-%D9%86%D9%88%D8%A7%D8%B1-dhb-0135	كوكو شانيل نوار	Chanel Coco Noir	DHB-0135	عطر نسائي غامض وجذاب يفتتح بانتعاش الجريب فروت والبرغموت ليمهد لقلب من الورد والجرانيوم وقاعدة دافئة من الباتشولي وخشب الصندل والفانيلا.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	e1f15c53-3d35-473c-9cc1-866295425fc9	t	f	0	2026-07-16 15:07:10.813	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
ecb05f78-c3dc-4c3f-aeb9-ad7985bd34e5	%D9%84%D8%A7%D9%8A%D8%AA-%D8%A8%D9%84%D9%88-dhb-0136	لايت بلو	Dolce & Gabbana Light Blue for Women	DHB-0136	عطر نسائي صيفي منعش للغاية يجسد حيوية البحر المتوسط بمزيج من الليمون الحامض والتفاح الأخضر المقرمش وقاعدة خشبية ناعمة من خشب الأرز.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	d75b99d5-51af-4de6-b85d-8e624f42ed5e	t	f	0	2026-07-16 15:07:14.25	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
d0ca3ed4-4f2e-44cb-a494-f1076499dedc	%D9%84%D9%8A%D8%A8%D8%B1%D8%A7-dhb-0137	ليبرا	Yves Saint Laurent Libre	DHB-0137	عطر نسائي أنيق يمثل الحرية بمزيج فريد يجمع بين الخزامى (اللافندر) الفرنسي ونضارة زهر البرتقال المغربي وقاعدة دافئة من الفانيلا والمسك.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	3cbeebe2-1fd3-46d1-b0a7-90cdcf1585c6	t	f	0	2026-07-16 15:07:16.681	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
ce88f95e-01cc-4d2e-be0b-35d52bc297e9	%D9%84%D9%8A%D8%A8%D8%B1%D8%A7-%D8%A5%D9%86%D8%AA%D8%B3-dhb-0138	ليبرا إنتس	Yves Saint Laurent Libre Intense	DHB-0138	عطر نسائي شرقي مكثف ودافئ يعيد صياغة مفهوم الحرية بتركيز أعلى من الفانيلا والتونكا واللافندر مع عبير زهر البرتقال والأوركيد الساحر.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	3da57818-e495-4235-a58a-3eb9099e3bdd	t	f	0	2026-07-16 15:07:19.424	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
b7895678-6a6a-4273-ac01-a42aa7a1dc95	%D9%83%D8%A7%D8%B1%D8%A7%D8%AA-dhb-0139	كارات	Cartier Carat	DHB-0139	عطر نسائي ناعم ومشرق يجسد ألوان قوس قزح من خلال باقة سباعية من الأزهار كالبنفسج والزنبق والنرجس والياقوتية مع نوتات خضراء منعشة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	d50ad458-b4fc-4d8b-a69c-e56f502be3b0	t	f	0	2026-07-16 15:07:21.864	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
3c5563bf-8bcf-42f5-a50b-28ad63938d4d	%D9%84%D8%A7%D8%A8%D8%A7%D9%86%D8%AA%D9%8A%D8%B1-dhb-0140	لابانتير	Cartier La Panthere	DHB-0140	عطر نسائي فاخر ومهيب يمزج بين حيوية الفواكه المجففة وجاذبية زهور الغاردينيا مع قاعدة دافئة من المسك والجلود الناعمة والباتشولي.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	bf415944-2f79-4ae1-bbcc-95ce450d8770	t	f	0	2026-07-16 15:07:24.789	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
79864c5e-5f95-442f-8c8d-8c093066ee5b	%D9%84%D8%A7%D9%86%D8%AA%D8%B1%D9%88%D8%AF%D9%8A%D8%AA-dhb-0141	لانتروديت	Givenchy L'Interdit	DHB-0141	عطر نسائي أنيق وجريء يدعو لتجاوز الحدود، بفضل مزيج مسك الروم والياسمين وزهر البرتقال مع كمثرى حلوة وقاعدة دافئة من الباتشولي.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	31962865-2662-4079-9c11-dff116a6259f	t	f	0	2026-07-16 15:07:27.978	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
48102744-674a-4139-9202-b5309f6408d6	%D8%AC%D9%88%D8%A8-dhb-0250	جوب	Joop! Homme	DHB-0250	عطر رجالي شرقي حلو يتميز بفوحانه القوي، يجمع بين حرارة القرفة ونضارة زهر البرتقال مع قاعدة دافئة وحلوة من الفانيلا والعسل والعنبر.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	bc7cd308-88f3-43d4-834b-1f2f52924704	t	f	0	2026-07-16 15:12:47.049	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
ba231572-151a-4d38-a492-7a0fd966042a	%D9%84%D8%A7%D9%81%D9%8A%D9%87-%D8%A8%D9%84-dhb-0144	لافيه بل	Lancome La Vie Est Belle	DHB-0144	عطر نسائي حلو وشهير يفيض بالسعادة والجمال، يمزج بين حلاوة البرالين والفانيلا مع ثمار الكمثرى والتوت وقاعدة دافئة من الباتشولي.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	e4d6f4c5-b964-46e6-b01a-bf2257eae3c1	t	f	0	2026-07-16 15:07:36.857	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
0c8953b6-de1b-4a36-afc0-486388246612	%D9%84%D8%A7%D9%81%D9%8A%D9%87-%D8%A8%D9%84-%D8%A7%D9%86%D9%8A%D9%84%D8%A7-dhb-0145	لافيه بل ڤانيلا	Lancome La Vie Est Belle Vanille Nude	DHB-0145	عطر نسائي دافئ وناعم للغاية يرتكز على نفحات فانيلا البوربون الغنية والمسك الأبيض مع قلب من الياسمين وقاعدة خشبية كريمية من خشب الصندل.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	516024f6-c08d-46d1-86f9-645f4087480b	t	f	0	2026-07-16 15:07:39.809	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
03889b15-9788-44d9-8fad-327ad9f3f429	%D9%84%D9%88-%D8%B3%D8%AA%D9%88%D8%B1%D9%8A-dhb-0146	لوڤ ستوري	Chloe Love Story	DHB-0146	عطر نسائي منعش ورقيق يجسد أجواء قصص الحب الباريسية، يفوح بعبير زهر البرتقال والنيرولي المشرق مع باقة زهرية وقاعدة مسكية ناعمة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	34043d63-b89d-474e-a43f-cb4e800b2ba3	t	f	0	2026-07-16 15:07:42.225	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
b6d4d2c2-184e-411a-a953-31b8a48f13d5	%D9%84%D9%8A%D8%AF%D9%8A-%D8%A7%D9%85%D8%A8%D9%84%D9%8A%D9%85-dhb-0147	ليدي امبليم	Montblanc Lady Emblem	DHB-0147	عطر نسائي أنثوي ناعم يمزج بين حلاوة الدراق ومربى الورد الأحمر وتوت العليق مع قلب زهري دافئ وقاعدة مسكية رقيقة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	8863dae1-d79b-44ee-8205-24347218db2d	t	f	0	2026-07-16 15:07:45.108	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
dde8e905-12bb-4a7b-ba55-f5016baeafb8	%D9%84%D8%A7-%D8%A8%D9%8A%D9%84-dhb-0148	لا بيل	Jean Paul Gaultier La Belle	DHB-0148	عطر نسائي دافئ وشهي للغاية يجمع بجرأة بين حلاوة الكمثرى المخبوزة وعبق نجيل الهند (الفتيفير) وقاعدة مكثفة من الفانيلا الجذابة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	3da57818-e495-4235-a58a-3eb9099e3bdd	t	f	0	2026-07-16 15:07:47.48	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
9d4b8003-45af-4967-9bd3-4a134a8ea251	%D9%84%D9%8A%D8%AF%D9%8A-%D9%85%D9%84%D9%8A%D9%88%D9%86-dhb-0149	ليدي مليون	Paco Rabanne Lady Million	DHB-0149	عطر نسائي حسي وجذاب يجمع بين عسل النحل والكرز الأبيض وتوت العليق البري مع قلب متألق من أزهار الياسمين وزهر البرتقال وقاعدة دافئة من الباتشولي.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	a4744bbb-7bfd-4eae-a718-a43d828dca85	t	f	0	2026-07-16 15:07:50.289	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
b4958433-28ae-4cf7-b922-68e31a061fd0	%D9%84%D9%8A%D8%AF%D9%8A-%D9%85%D9%84%D9%8A%D9%88%D9%86-%D8%AC%D9%88%D9%84%D8%AF-dhb-0150	ليدي مليون جولد	Paco Rabanne Million Gold for Her	DHB-0150	عطر نسائي ذهبي فاخر ومسكي يمزج بين عبير أزهار الإيلنغ والياسمين والورد وحلاوة الكمثرى المنعشة مع قاعدة دافئة من الفانيلا والمسك.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	6363f08b-89b2-4c45-9d1e-4fec2a32b2ed	t	f	0	2026-07-16 15:07:52.698	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
8622cbf7-674e-4327-8745-58e0e8610e04	%D9%85%D8%A7%D9%8A-%D8%A8%D8%B1%D8%A8%D8%B1%D9%8A-dhb-0151	ماي بربري	Burberry My Burberry	DHB-0151	عطر نسائي زهري أنيق يفوح بعبير أزهار البازلاء الحلوة والفريزيا مع نكهة السفرجل الذهبي المنعشة وقاعدة ترابية دافئة من الباتشولي والورد.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	79d5fc87-0611-4b22-a53f-196efc6cc093	t	f	0	2026-07-16 15:07:55.308	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
c1c65875-789f-42a8-80e7-cba95705cd95	%D9%85%D8%A7%D9%8A-%D8%A8%D8%B1%D8%A8%D8%B1%D9%8A-%D8%A8%D9%84%D8%A7%D9%83-dhb-0152	ماي بربري بلاك	Burberry My Burberry Black	DHB-0152	عطر نسائي شرقي دافئ وراقٍ يجمع بين حلاوة الدراق الناضج وجاذبية ياسمين سامباك مع قاعدة عنبرية مكثفة من الباتشولي والورد.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	bd31f9a6-533b-42aa-8f47-90e62b090715	t	f	0	2026-07-16 15:07:58.255	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
4392706b-317c-4bac-867a-39b77e001b11	%D9%87%D8%A7%D8%B4%D9%8A%D9%81%D8%A7%D8%AA-dhb-0341	هاشيفات	Nishane Hacivat	DHB-0341	عطر فاخر بطابع أناناس، شيبر، خشبي، يتوازن مع لمسات حمضي، باتشولي ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	28c9117e-5e1b-489a-828e-9813acc326ff	78374c00-4fff-4221-b313-79f1000e267a	t	f	0	2026-07-16 15:17:31.245	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
6b95192d-3e8d-4c94-8b61-f61c421275be	%D9%85%D8%B3-%D8%AF%D9%8A%D9%88%D8%B1-%D8%B4%D9%8A%D8%B1%D9%8A-dhb-0155	مس ديور شيري	Dior Miss Dior Cherie	DHB-0155	عطر نسائي أيقوني شهير يمزج بجرأة بين حلاوة الفراولة والكرز ونكهة الفشار بالكراميل مع قلب زهري ناعم وقاعدة غنية بالباتشولي.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	e4d6f4c5-b964-46e6-b01a-bf2257eae3c1	t	f	0	2026-07-16 15:08:08.128	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
b02ca448-2a46-4038-9a94-6834dc62e633	%D9%85%D9%8A%D8%B1%D9%83%D9%84-dhb-0156	ميركل	Lancome Miracle	DHB-0156	عطر نسائي حيوي ومنعش يمزج بين حلاوة ثمار الليتشي وعبير زهور الفريزيا مع نفحات توابل دافئة من الزنجبيل والفلفل وقاعدة مسكية.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	07e648c0-0b87-4d8c-b279-78c540cf5cf3	t	f	0	2026-07-16 15:08:12.296	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
ebbb8897-6a67-4516-80b4-bc0d509ef9df	%D9%85%D8%A7%D8%B1%D9%84%D9%8A%D9%86-dhb-0157	مارلين	Marilyn by Marilyn Miglin	DHB-0157	عطر نسائي كلاسيكي دافئ يمزج بنعومة بين حلاوة الدراق والمشمش وعبير الورد ومسك الروم مع قاعدة غنية وثابتة من العنبر والمسك وخشب الصندل.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	1aac4ed1-9ff0-4a5a-8086-54b4a01bfe47	t	f	0	2026-07-16 15:08:15.898	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
ca90d0f7-11fb-4777-a4e8-2ab9455518b2	%D9%85%D8%A7%D9%8A-%D9%88%D8%A7%D9%8A-dhb-0158	ماي واي	Giorgio Armani My Way	DHB-0158	عطر نسائي عصري ومشرق يفتتح بنضارة البرغموت وزهر البرتقال مع قلب أنثوي فواح من مسك الروم والياسمين وقاعدة دافئة من الفانيلا والمسك الأبيض.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	3cbeebe2-1fd3-46d1-b0a7-90cdcf1585c6	t	f	0	2026-07-16 15:08:18.334	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
d7651e66-34ac-45dc-99e7-4b7804a68c1a	%D9%85%D9%88%D9%86-%D8%A8%D8%A7%D8%B1%D9%8A%D8%B3-dhb-0159	مون باريس	Yves Saint Laurent Mon Paris	DHB-0159	عطر نسائي حسي ومثير يتميز بانفجار فاكهي حلو من الفراولة والتوت والكمثرى مع قلب من الياسمين والفاوانيا وقاعدة ترابية غنية من الباتشولي والمسك.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	ddd1d91c-5c09-412f-b938-db48acdac024	t	f	0	2026-07-16 15:08:21.006	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
bafb0778-bd98-4348-ba4b-a3c4e82431de	%D9%85%D8%A7%D9%86%D9%81%D9%8A%D8%B3%D8%AA%D9%88-dhb-0160	مانفيستو	Yves Saint Laurent Manifesto	DHB-0160	عطر نسائي شرقي فخم يتميز بحلاوة التونكا والفانيلا الممزوجة بنفحات الياسمين والتوت الأسود وقاعدة خشبية كريمية من خشب الصندل.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	efd988b9-4b86-48bf-b1b4-58607c8b2b35	t	f	0	2026-07-16 15:08:23.777	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
60cc4b18-0c60-48f9-b316-63ff370b385c	%D9%85%D9%88%D9%86-%D8%AC%D9%8A%D8%B1%D9%84%D8%A7%D9%86-dhb-0161	مون جيرلان	Guerlain Mon Guerlain	DHB-0161	عطر نسائي دافئ وراقي للغاية يجمع بنعومة فريدة بين الخزامى (اللافندر) الفرنسي ونقاء الياسمين الهندي مع قاعدة غنية وكريمية من فانيلا تاهيتي وخشب الصندل.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	1327867d-511d-4598-96d7-c9cd9dd9c6de	t	f	0	2026-07-16 15:08:26.632	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
7ab5fa67-e6ab-4f39-8866-a4428bbfaa0b	%D9%85%D9%88%D8%AF%D8%B1%D9%86-%D9%85%D9%8A%D9%88%D8%B3-dhb-0162	مودرن ميوس	Estee Lauder Modern Muse	DHB-0162	عطر نسائي أنيق وعصري يحتفي بالياسمين الفواح والزهور البيضاء مع دفء المسك والباتشولي وخشب الأرز بطابع ناعم وجذاب.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	1fdfe318-018a-49c0-b164-74a0baad0a72	t	f	0	2026-07-16 15:08:29.067	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
d5eee1e4-a2d3-4ee6-b859-3f86e722d166	%D9%86%D8%B1%D8%B3%D9%8A%D8%B3%D9%88-%D9%85%D8%B3%D9%83-dhb-0163	نرسيسو مسك	Narciso Rodriguez Pure Musc for Her	DHB-0163	عطر نسائي رائع يفيض بالنظافة والأنوثة، يرتكز بجمال استثنائي على المسك الأبيض النقي والزهور البيضاء وقاعدة مخملية دافئة من الكشمير والأخشاب الناعمة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	0edf36a2-00f6-4b96-ba92-a27ba822f387	t	f	0	2026-07-16 15:08:31.84	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
a1291b8c-5711-4a1d-a42a-6d6405881ac8	%D9%87%D8%A7%D8%A8%D9%8A%D9%86%D9%88%D8%B3-dhb-0173	هابينوس	Lancome Hypnose	DHB-0173	عطر نسائي حسي وساحر يرتكز على جاذبية زهرة الآلام الاستوائية وأزهار الياسمين والغاردينيا مع قاعدة غنية ودافئة من الفانيلا ونجيل الهند.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	7ac9c0f9-134c-4515-bacf-9b2a254f5646	t	f	0	2026-07-16 15:09:02.383	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
cda6797a-59e1-40d2-a514-6844b8a36b91	%D9%86%D8%B1%D8%B3%D9%8A%D8%B3%D9%88-%D9%81%D9%88%D8%B1-%D9%87%D9%8A%D8%B1-%D8%A8%D9%84%D8%A7%D9%83-dhb-0166	نرسيسو فور هير  بلاك	Narciso Rodriguez For Her EDT (Black Bottle)	DHB-0166	عطر نسائي أيقوني راقٍ يتميز بجاذبية المسك البارزة والزهور كالأوسمانثوس وزهر البرتقال مع قاعدة دافئة وثابتة من الباتشولي والعنبر.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	3da5312c-0af4-4e59-b0ad-8eeb70d9fa17	t	f	0	2026-07-16 15:08:41.65	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
85e52a66-84c6-48ee-9eab-d648b3aa68ce	%D9%86%D8%B1%D8%B3%D9%8A%D8%B3%D9%88-%D9%81%D9%88%D8%B1-%D9%87%D9%8A%D8%B1-%D8%A8%D9%8A%D9%86%D9%83-dhb-0167	نرسيسو  فور هير بينك	Narciso Rodriguez For Her EDP (Pink Bottle)	DHB-0167	عطر نسائي فائق الأنوثة والجاذبية يمزج بنعومة بالغة بين عبير الورد الجوري وحلاوة الدراق وقلب مسكي حسي دافئ مع قاعدة من الباتشولي.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	eb3d7c89-1ff2-4551-a553-e3bc7481c410	t	f	0	2026-07-16 15:08:45.025	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
74752fc6-8ebb-4939-a83f-cb2d34f9d687	%D9%86%D8%B1%D8%B3%D9%8A%D8%B3%D9%88-%D8%A7%D9%85%D8%A8%D8%B1%D9%8A%D9%87-dhb-0168	نرسيسو امبريه	Narciso Rodriguez Narciso Ambree	DHB-0168	عطر نسائي دافئ وراقي يجسد حرارة الشمس بمزيج من أزهار الفرانجيباني والإيلنغ والمسك مع قاعدة دافئة من العنبر والفانيلا وخشب الكشمير.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	31962865-2662-4079-9c11-dff116a6259f	t	f	0	2026-07-16 15:08:48.774	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
5d142616-2772-4ab5-a2ae-e7fbed159c58	%D9%8A%D8%A7%D8%B1%D8%A7-dhb-0169	يارا	Lattafa Yara	DHB-0169	عطر نسائي شهير مفعم بالأنوثة يمزج بين حلاوة الفانيلا والنوتات الجورماند اللذيذة ونضارة الفواكه الاستوائية والأوركيد وقاعدة مسكية رقيقة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	58a47922-431f-4c54-b902-57313692c18f	t	f	0	2026-07-16 15:08:51.76	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
147267f5-ad6b-46d1-afc8-16d5c7b78579	%D9%86%D9%8A%D9%86%D8%A7-%D8%A8%D8%A7%D9%8A-%D9%86%D9%8A%D9%86%D8%A7-dhb-0170	نينا باي نينا	Nina Ricci Nina	DHB-0170	عطر نسائي مبهج يتميز بنكهة التفاح والكراميل وحلوى البرالين مع انتعاش ليمون الكي والبرغموت وقاعدة مسكية خشبية ناعمة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	77c53957-6010-46c1-a1bc-5fdc860833e6	t	f	0	2026-07-16 15:08:54.801	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
32dbefd4-7297-4427-94b6-312f83f3f7c8	%D9%87%D8%A7%D8%A8%D9%86%D9%88%D8%AA%D9%8A%D9%83-%D8%A8%D9%88%D9%8A%D8%B2%D9%86-dhb-0171	هابنوتيك بويزن	Dior Hypnotic Poison	DHB-0171	عطر نسائي حسي وساحر للغاية يجمع بين مرارة اللوز وحلاوة جوز الهند مع قلب من زهور الياسمين وقاعدة غنية من فانيلا البوربون والمسك.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	9b4e3e97-e402-4fc7-a2c2-39f7662cc44a	t	f	0	2026-07-16 15:08:57.316	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
3d140776-c6a6-46c0-9874-981ed5dd1b1b	%D9%87%D9%88%D8%AC%D9%88-%D8%A8%D9%88%D8%B3-dhb-0172	هوجو بوس	Hugo Boss Hugo Woman	DHB-0172	عطر نسائي حيوي ومنعش يمزج بين حيوية فواكه الصيف كالتفاح الأخضر والشمام والدراق وباقة زهرية ناعمة مع قاعدة خشبية دافئة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	fbcac733-ec30-45ab-afad-bed1b68c25e4	t	f	0	2026-07-16 15:08:59.978	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
ec2e2064-9f20-47c5-873b-399ed108cb6b	%D9%88%D9%8A%D9%83-%D8%A7%D9%86%D8%AF-dhb-0174	ويك اند	Burberry Weekend for Women	DHB-0174	عطر نسائي منعش ومبهج للغاية يفوح بعبير فواكه الخوخ والدراق ونفحات زهرية رقيقة من الياقوتية والسوسن والورد مع لمسة صندل ومسك.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	fbcac733-ec30-45ab-afad-bed1b68c25e4	t	f	0	2026-07-16 15:09:05.113	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
ba6d90f2-e97e-49ad-b85b-a199a6d64bfe	%D9%87%D9%88%D8%AA-%D9%83%D9%88%D8%AA%D9%88%D8%B1-dhb-0175	هوت كوتور	Givenchy Hot Couture	DHB-0175	عطر نسائي شرقي فخم يمزج بجرأة بين حلاوة التوت العليق وحرارة الفلفل الأسود مع قلب من زهور الماغنوليا وقاعدة عنبرية خشبية غنية وثابتة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	ca015821-8ce2-4a8a-8fbc-6852e4d53383	t	f	0	2026-07-16 15:09:07.902	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
fce5624c-1c57-45d1-ac5d-2bb5d3b840b0	%D9%86%D9%8A-dhb-0342	آني	Nishane Ani	DHB-0342	عطر فاخر بطابع فانيلا، توابل، زنجبيل، يتوازن مع لمسات دافئ، خشبي ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	62d74b01-a106-4074-92a8-a56b4b99ab40	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	a9c5dee8-0d68-41e6-b21c-4d158d5509ca	t	f	0	2026-07-16 15:17:36.432	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
e5ac8511-2698-40df-8625-d70612e9439a	%D8%B1%D9%88%D8%AC-%D8%AA%D8%B1%D8%A7%D9%81%D9%84%D8%AC%D8%A7%D8%B1-dhb-0178	روج  ترافلجار	Dior Rouge Trafalgar	DHB-0178	عطر نسائي منعش ومبهج يفوح بعبير الفواكه الحمراء كالفراولة والكرز مع لمسة حمضيات وقاعدة مسكية خشبية رقيقة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	fbcac733-ec30-45ab-afad-bed1b68c25e4	t	f	0	2026-07-16 15:09:16.353	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
2480a1fe-8e81-4efc-9dbc-a995a0025622	%D8%AC%D9%88%D8%AA%D8%B4%D9%8A-%D8%A8%D9%84%D9%88%D9%85-%D8%A7%D9%86%D8%AA%D8%B3-dhb-0179	جوتشي بلوم انتس	Gucci Bloom Intense	DHB-0179	عطر نسائي حسي ومكثف يتميز بعبير أزهار مسك الروم والياسمين مع دفء الباتشولي ولمسة كريمية ناعمة من جوز الهند.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	31962865-2662-4079-9c11-dff116a6259f	t	f	0	2026-07-16 15:09:19.566	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
6a5cf2a6-e87d-4cc2-9062-b523922b4cb7	%D9%8A%D8%A7%D9%84%D9%88-%D8%AF%D8%A7%D9%8A%D9%85%D9%88%D9%86%D8%AF-dhb-0180	يالو دايموند	Versace Yellow Diamond	DHB-0180	عطر نسائي مشرق ومنعش كأشعة الشمس يمزج بين حمضية الليمون وحلاوة الإجاص مع عبير أزهار الميموزا وقاعدة مسكية رقيقة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	f5fa056a-9891-43f6-a8cd-3ada17a62c66	t	f	0	2026-07-16 15:09:22.574	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
7013dcaa-b40f-43d9-a2fb-e25459b56cd9	%D8%A7%D9%86%D9%81%D9%83%D8%AA%D9%88%D8%B3-dhb-0181	انفكتوس	Paco Rabanne Invictus	DHB-0181	عطر رجالي منعش ومفعم بالحيوية يجسد القوة بمزيج من النوتات البحرية الباردة وقشر الجريب فروت مع قاعدة خشبية دافئة من العنبر.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	bff637d0-aec0-44e6-8d4e-8ad78ab947fa	t	f	0	2026-07-16 15:09:25.262	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
4ad4be79-66cf-4e94-88cd-9ac109049507	%D8%A7%D9%86%D9%81%D9%83%D8%AA%D9%88%D8%B3-%D8%A7%D9%86%D8%AA%D8%B3-dhb-0182	انفكتوس انتس	Paco Rabanne Invictus Intense	DHB-0182	عطر رجالي شرقي مكثف يمزج بين دفء العنبر وحرارة الفلفل الأسود مع عبير زهر البرتقال بطابع حسي وقوي ثابت.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	b5f7dca2-d1ff-4bc6-bf42-29a5e30c20ea	t	f	0	2026-07-16 15:09:28.614	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
30056426-cb6c-4a98-8e00-8c839e350b07	%D8%A7%D9%86%D9%81%D9%83%D8%AA%D9%88%D8%B3-%D9%84%D9%8A%D8%AC%D9%86%D8%AF-dhb-0183	انفكتوس ليجند	Paco Rabanne Invictus Legend	DHB-0183	عطر رجالي مائي حار يتميز بنفحات ملح البحر وجوز الهند المنعشة مع حرارة التوابل وقاعدة خشبية دافئة وثابتة من العنبر الأحمر.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	3463e1c1-c649-40eb-87ee-d4e21d94159c	t	f	0	2026-07-16 15:09:31.776	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
36e49cfe-f6b4-4efc-965f-908b2495e261	%D8%A7%D9%86%D9%81%D9%83%D8%AA%D9%88%D8%B3-%D8%A7%D9%84%D9%83%D8%B3%D9%8A%D8%B1-dhb-0184	انفكتوس  الكسير	Paco Rabanne Invictus Victory Elixir	DHB-0184	عطر رجالي شرقي فاخر ذو ثبات استثنائي، يجمع بين حلوى الفانيلا والتونكا الدافئة وعبير البخور واللافندر بطابع فخم وجذاب.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	3da57818-e495-4235-a58a-3eb9099e3bdd	t	f	0	2026-07-16 15:09:34.392	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
2e421b80-2bba-40cb-9271-2f374778fe6c	%D8%A7%D9%84%D9%88%D8%B1-%D9%87%D9%88%D9%85-dhb-0185	الور هوم	Chanel Allure Homme	DHB-0185	عطر رجالي كلاسيكي راقٍ يمزج بين نضارة الحمضيات وحرارة الزنجبيل مع قلب زهري دافئ وقاعدة خشبية كريمية من الفانيلا والصندل.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	e98337f4-cc57-43ae-ab6c-7050c578a699	t	f	0	2026-07-16 15:09:37.396	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
951765db-c632-4eb1-8ccd-a365ee9a98c3	%D8%A7%D9%84%D9%88%D8%B1-%D8%B3%D8%A8%D9%88%D8%B1%D8%AA-dhb-0186	الور سبورت	Chanel Allure Homme Sport	DHB-0186	عطر رجالي رياضي حيوي يمزج بين نضارة الماندرين والنوتات البحرية المنعشة مع قاعدة دافئة وثابتة من فانيلا التونكا والمسك الأبيض.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	b669b759-3b36-4678-9eb3-a6b655b8ad2c	t	f	0	2026-07-16 15:09:40.396	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
a301ce1b-44ea-4ca7-9682-153f2283ece0	%D8%A7%D9%8A%D9%88%D8%B1%D9%8A%D8%A7-dhb-0187	ايڤوريا	Calvin Klein Euphoria Men	DHB-0187	عطر رجالي شرقي خشبي يمزج بين حرارة الزنجبيل والفلفل ونضارة الريحان الأسود مع قاعدة دافئة من العنبر والجلود الفاخرة.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	81674482-44d7-4c7b-840a-41b2e477a455	t	f	0	2026-07-16 15:09:43.114	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
30d74977-3ab5-4047-a372-e7a0dbd3e797	%D8%A7%D9%8A%D9%88%D8%B1%D9%8A%D8%A7-%D8%A7%D9%86%D8%AA%D8%B3-dhb-0188	ايڤوريا انتس	Calvin Klein Euphoria Men Intense	DHB-0188	عطر رجالي شرقي دافئ يتميز بتوليفة مكثفة تجمع بين توابل الزنجبيل والفلفل ونفحات الراتنجات الفاخرة كالمر واللبان مع العنبر والعود.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	71f40926-1dfe-47b1-a82e-c3ccc1c78377	t	f	0	2026-07-16 15:09:45.788	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
57bda1da-5b8e-461b-8940-757a8130c09b	%D8%A7%D9%84%D9%88%D8%B3%D8%A7%D9%85-dhb-0191	الوسام	Rasasi Al Wisam Day	DHB-0191	عطر رجالي شرقي عصري ومنعش يتميز بنفحات الورد واللافندر المشرقة مع قاعدة خشبية دافئة وثابتة من خشب الصندل والمسك الأبيض.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	343079b1-ac32-48b7-882a-7bff605973c9	t	f	0	2026-07-16 15:09:54.47	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
57a1037a-d639-458f-8007-6b9ecfaa947a	%D8%A7%D8%B1%D8%A7%D9%85%D9%8A%D8%B3-%D8%AF%D9%8A%D9%86-dhb-0192	اراميس ديڤن	Aramis Devin	DHB-0192	عطر رجالي كلاسيكي عتيق بطابع عشبي قوي يمزج بين نضارة أوراق الصنوبر والريحان وحرارة القرفة مع قاعدة دافئة من الجلود وطحلب البلوط.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	234bd967-6aa3-4c9a-bdb3-2d42dda1742f	t	f	0	2026-07-16 15:09:57.429	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
4b7caf97-02eb-478a-8388-d16bc59a5596	%D8%A7%D8%B3%D9%85%D9%8A%D8%A7%D9%83%D9%8A-dhb-0193	اسمياكي	Issey Miyake L'Eau d'Issey pour Homme	DHB-0193	عطر رجالي منعش ومشرق يتميز بنفحات ليمون اليوزو الياباني والبرغموت وجوزة الطيب مع قلب زهري مائي وقاعدة خشبية ناعمة من خشب الصندل.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	86379d33-5d24-4ec2-9f04-2818a627bfa4	t	f	0	2026-07-16 15:10:00.224	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
19133cd0-67a4-4de4-9809-4db49357d487	%D8%A7%D9%88%D8%A8%D9%86-dhb-0194	اوبن	Roger & Gallet Open	DHB-0194	عطر رجالي كلاسيكي قوي يمزج بين انتعاش الليمون واللافندر ونفحات الزعتر والميرمية العشبية مع قاعدة دافئة من التبغ ونجيل الهند.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	91c400b3-ea89-4f70-85f7-9705f51b39a0	t	f	0	2026-07-16 15:10:02.66	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
8335f285-1a61-47f4-b02a-dbd8e8c2b926	%D8%A7%D9%86-%D9%85%D9%88%D8%B4%D9%86-dhb-0195	ان موشن	Hugo Boss Boss in Motion	DHB-0195	عطر رجالي منعش ومفعم بالطاقة الحركية يفوح بعبير البرتقال والريحان وحرارة القرفة والفلفل الوردي مع قاعدة دافئة من خشب الصندل والمسك.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	24f64784-fb23-41ae-a0d3-bbe52d8b3c33	t	f	0	2026-07-16 15:10:05.324	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
3383c1ab-88c0-4958-bacf-0b1491a1e761	%D8%A7%D9%88%D9%86%D9%84%D9%8A-%D8%B0%D8%A7-%D8%A8%D8%B1%D9%8A-dhb-0196	اونلي ذا بريڤ	Diesel Only The Brave	DHB-0196	عطر رجالي قوي وجريء يفتتح بانتعاش الليمون والماندرين وقلب من أوراق البنفسج وقاعدة دافئة وثابتة من الجلود والعنبر وخشب الأرز.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	09356d45-cdbe-438f-b6a6-0462db2f4a7d	t	f	0	2026-07-16 15:10:08.121	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
79ddcaec-0056-4c94-9e75-5bd97a6e6f9a	%D8%A7%D8%AA%D9%8A%D8%B1%D9%86%D8%AA%D9%8A-dhb-0197	اتيرنتي	Calvin Klein Eternity for Men	DHB-0197	عطر رجالي منعش وكلاسيكي مميز يمزج بين عبير اللافندر والليمون ونضارة الريحان والميرمية مع قاعدة دافئة من خشب الصندل والمسك.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	5447e64b-92fe-4c71-a932-31a0ff1a072e	t	f	0	2026-07-16 15:10:10.794	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
5deccc48-e4c5-4936-9a4c-31eb581dc9e7	%D8%A7%D9%83%D9%88%D8%A7-%D8%AF%D9%8A-%D8%AC%D9%8A%D9%88-dhb-0198	اكوا دي جيو	Giorgio Armani Acqua Di Gio Men	DHB-0198	عطر رجالي صيفي أيقوني يجسد انتعاش البحر، يمزج بين النوتات البحرية المالحة وحموضة الليمون مع قلب من إكليل الجبل وقاعدة مسكية دافئة.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	01fa1386-49c4-4794-b0d6-c15026d2039f	t	f	0	2026-07-16 15:10:13.663	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
83dbdeed-94db-4832-a9c0-63aa1132c9da	%D8%AA%D9%88%D8%A8%D8%A7%D9%83%D9%88-you-dhb-0199	توباكو You	Giorgio Armani Stronger With You Tobacco	DHB-0199	عطر رجالي دافئ ومهيب يمزج بجرأة بين حلاوة الكستناء والفانيلا مع رائحة التبغ الغنية وحرارة التوابل الشرقية الفاخرة.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	4379c839-78ef-466f-ac2d-125b5a556a09	t	f	0	2026-07-16 15:10:16.196	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
65c5ad19-2d58-4550-ac70-364c5816d0b5	%D8%B9%D9%86%D8%A8%D8%B1-you-dhb-0200	عنبر You	Giorgio Armani Stronger With You Amber	DHB-0200	عطر رجالي شرقي فاخر ودافئ يجمع بين جاذبية العنبر السائل ونقاء اللافندر وقاعدة كريمية حلوة من فانيلا البوربون الغنية.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	13e702ee-13dd-4366-90ee-98d3afc13155	t	f	0	2026-07-16 15:10:18.932	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
6aad7fb3-5e37-46e0-accb-ffbf2c121ecf	you-dhb-0201	You	Giorgio Armani Stronger With You	DHB-0201	عطر رجالي شرقي حسي يمزج بين حرارة الهيل والفلفل الوردي وحلاوة الكستناء المحمص مع قاعدة دافئة من الفانيلا والأخشاب الداكنة.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	4379c839-78ef-466f-ac2d-125b5a556a09	t	f	0	2026-07-16 15:10:21.441	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
ce22f643-10a3-48bf-97ec-c4d322ef4105	%D8%A7%D9%83%D8%B3%D8%A8%D9%84%D9%88%D8%B1-dhb-0204	اكسبلور	Montblanc Explorer	DHB-0204	عطر رجالي عصري وراقٍ يفتتح ببرودة البرغموت والفلفل الوردي مع قلب ترابي من نجيل الهند وقاعدة دافئة من الأمبروكسان والجلود.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	99890cc6-651c-4e1b-9856-ff665d04d89c	t	f	0	2026-07-16 15:10:29.407	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
cebfe037-5ac4-4b4f-bafa-18734995b3ca	xs-dhb-0205	X.S	Paco Rabanne XS for Men	DHB-0205	عطر رجالي منعش كلاسيكي يجمع بين نضارة النعناع وإكليل الجبل والليمون مع باقة عشبية وقاعدة دافئة من خشب الأرز والمسك.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	472f8d38-a518-4c80-985e-807d3b095643	t	f	0	2026-07-16 15:10:32.158	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
c35771e0-e11f-4dbd-b762-c5488c8e503e	%D8%A8%D9%84%D8%A7%D9%83-xs-%D9%84%D9%83%D8%B2%D8%B3-dhb-0206	بلاك X.S لكزس	Paco Rabanne Black XS L'Exces for Him	DHB-0206	عطر رجالي حسي ومنعش يتميز بافتتاحية حمضية من ليمون أمالفي واللافندر مع نوتات بحرية وقاعدة دافئة من الباتشولي والعنبر.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	93539e25-7737-439b-96f0-5fe67115fd8c	t	f	0	2026-07-16 15:10:36.173	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
a8fc89dd-4102-431f-8339-9e65b9d27074	%D8%A8%D9%84%D8%A7%D9%83-xs-%D8%A8%D9%8A%D9%88%D8%B1-dhb-0207	بلاك X.S بيور	Paco Rabanne Pure XS for Him	DHB-0207	عطر رجالي دافئ وحسي يمزج بين حرارة الزنجبيل وحلاوة الفانيلا والقرفة مع قاعدة دافئة وثابتة من الجلود والعنبر والمر.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	4379c839-78ef-466f-ac2d-125b5a556a09	t	f	0	2026-07-16 15:10:38.645	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
e6b0d9f7-4026-4c28-8916-df4a5c8fdc26	%D8%A8%D9%88%D8%B3-%D8%A7%D9%86%D9%84%D9%85%D8%AA%D9%8A%D8%AF-dhb-0208	بوس انلمتيد	Hugo Boss Boss Bottled Unlimited	DHB-0208	عطر رجالي منعش وحيوي يفوح بنضارة أوراق النعناع وحلاوة الأناناس الاستوائي مع قاعدة دافئة من المسك الأبيض وخشب الصندل.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	434fedfa-1e6b-4fe8-84c8-d3ab2332043c	t	f	0	2026-07-16 15:10:41.101	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
de83ece8-c147-480d-b414-ee6dfa9c77f4	%D8%A8%D9%88%D8%B3-%D8%A8%D9%88%D8%AA%D9%8A%D9%84%D8%AF-%D9%86%D8%A7%D9%8A%D8%AA-dhb-0209	بوس بوتيلد نايت	Hugo Boss Boss Bottled Night	DHB-0209	عطر رجالي غامض وجذاب للإطلالات المسائية، يمزج بين عبير الخزامى (اللافندر) والبنفسج وقاعدة دافئة من الأخشاب الثمينة والمسك.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	35d83e52-5c67-4bf4-ab3e-f1b22f4cc12e	t	f	0	2026-07-16 15:10:43.981	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
82e672a8-9569-4510-b45d-4e4d5a6a0872	%D8%A8%D9%88%D8%B3-%D8%A7%D9%88%D8%B1%D8%A7%D9%86%D8%AC-dhb-0210	بوس اورانج	Hugo Boss Boss Orange for Men	DHB-0210	عطر رجالي مبهج ودافئ يجمع بين حلاوة التفاح الأحمر ونضارة الكزبرة مع قلب من البخور وقاعدة دافئة من الفانيلا والأخشاب.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	783ddc39-4e79-4961-ac0a-7f37058187d5	t	f	0	2026-07-16 15:10:46.764	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
42b49c6a-f7d8-45bd-98dd-0f5ba1ebac25	%D8%A8%D9%88%D8%B3-%D8%A8%D9%88%D8%AA%D9%8A%D9%84%D8%AF-dhb-0211	بوس بوتيلد	Hugo Boss Boss Bottled	DHB-0211	عطر رجالي كلاسيكي راقٍ ومميز يمزج بين حلاوة التفاح وحرارة القرفة والقرنفل مع قاعدة خشبية دافئة من الصندل والأرز والفانيلا.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	61a34f82-bb0e-43f9-ab9d-df509dae581d	t	f	0	2026-07-16 15:10:49.54	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
09b097c8-8987-49af-99cf-f8fcbf184a92	%D8%A8%D9%84%D8%A7%D8%AA%D9%8A%D9%86%D9%8A%D9%88%D9%85-dhb-0212	بلاتينيوم	Chanel Egoiste Platinum	DHB-0212	عطر رجالي كلاسيكي منعش وجذاب يمزج بين عبير اللافندر وإكليل الجبل ونضارة الميرمية مع قاعدة خشبية دافئة من الصندل ونجيل الهند.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	af13e7f8-71bd-4899-a0c6-e68c9d82de14	t	f	0	2026-07-16 15:10:52.412	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
0441d386-bf83-46d6-850b-bc8c5ce4a7d0	%D8%A8%D9%84%D9%88-%D8%AF%D9%8A-%D8%B4%D8%A7%D9%86%D9%8A%D9%84-dhb-0213	بلو دي شانيل	Chanel Bleu de Chanel	DHB-0213	عطر رجالي أيقوني فاخر يفتتح بنضارة الجريب فروت والنعناع والزنجبيل مع لمسة بخور غامضة وقاعدة دافئة من خشب الصندل والأرز.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	86379d33-5d24-4ec2-9f04-2818a627bfa4	t	f	0	2026-07-16 15:10:55.184	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
1080ddd7-489b-4716-9004-190708d9493e	%D8%A8%D9%88%D9%84%D9%88-%D8%A7%D9%83%D8%B3%D8%A8%D9%84%D9%88%D8%B1-dhb-0214	بولو اكسبلور	Ralph Lauren Polo Explorer	DHB-0214	عطر رجالي خشبي دافئ يتميز بنفحات الصنوبر والكزبرة وجوزة الطيب مع انتعاش الماندرين وقاعدة دافئة وثابتة من الجلود والباتشولي.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	87eb85f9-82dc-4b19-aeac-22f0ff4e85c9	t	f	0	2026-07-16 15:10:58.871	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
d919cac4-3d0e-46d3-abfd-39405ff00d2e	%D8%A8%D9%88%D9%84%D9%88-%D8%A8%D9%84%D8%A7%D9%83-dhb-0218	بولو بلاك	Ralph Lauren Polo Black	DHB-0218	عطر رجالي فخم وجذاب يمزج بنعومة غير تقليدية بين عبير المانجو المثلجة واليوسفي المنعش وقاعدة دافئة من خشب الصندل والتونكا.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	171be19a-ca88-4585-8f5e-88c69f8aff53	t	f	0	2026-07-16 15:11:11.102	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
21fea75f-8b80-48c9-8a52-f3b835a33dc0	%D8%A8%D9%88%D9%84%D9%88-%D8%B1%D9%8A%D8%AF-dhb-0219	بولو ريد	Ralph Lauren Polo Red	DHB-0219	عطر رجالي حار وجريء يتميز بلون الجاذبية الحمراء، يجمع بين حلاوة التوت البري والليمون الإيطالي وحرارة الزعفران وقاعدة دافئة من القهوة والأخشاب.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	e98337f4-cc57-43ae-ab6c-7050c578a699	t	f	0	2026-07-16 15:11:13.721	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
b2321149-dcf9-40ef-83c7-b80d6ed56162	%D8%A8%D9%88%D9%84%D9%88-%D8%A8%D9%84%D9%88-dhb-0220	بولو بلو	Ralph Lauren Polo Blue	DHB-0220	عطر رجالي صيفي منعش يفوح ببرودة الخيار والشمام واليوسفي مع قلب من الريحان والميرمية وقاعدة دافئة من الجلد السويدي والمسك.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	329f2ed4-d413-451e-9f0f-8c1a205a3c72	t	f	0	2026-07-16 15:11:16.739	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
8cbc5b78-6a80-4248-a218-28ef9f032a83	%D8%A8%D9%88%D9%84%D8%BA%D8%A7%D8%B1%D9%8A-%D8%A7%D9%83%D9%88%D8%A7-dhb-0221	بولغاري اكوا	Bvlgari Aqva Pour Homme	DHB-0221	عطر رجالي صيفي منعش وبارد يفوح بعبير اليوسفي وأوراق البرتقال المر وقلب مائي من الأعشاب البحرية واللافندر وقاعدة خشبية عنبرية.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	01fa1386-49c4-4794-b0d6-c15026d2039f	t	f	0	2026-07-16 15:11:19.498	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
e182e4b2-4fcb-4706-a454-4fc4774dabfc	%D8%A8%D8%B1%D8%A8%D8%B1%D9%8A-%D9%87%D9%8A%D8%B1%D9%88-dhb-0223	بربري هيرو	Burberry Hero	DHB-0223	عطر رجالي عصري أنيق يجمع بين نضارة البرغموت وثمار العرعر وحرارة الفلفل الأسود مع قاعدة خشبية قوية من خشب الأرز الثلاثي.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	e8137618-0f88-404b-b02f-4026c0b78868	t	f	0	2026-07-16 15:11:26.069	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
3b7f7d83-9e8d-4e86-941d-48ebd74ce50d	%D8%A8%D9%84%D9%88-%D9%84%D9%8A%D8%A8%D9%84-dhb-0224	بلو ليبل	Givenchy Pour Homme Blue Label	DHB-0224	عطر رجالي منعش ومشرق يمزج بين حمضية الجريب فروت والبرغموت وحرارة الفلفل والهيل مع قاعدة خشبية دافئة من نجيل الهند والأرز.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	24f64784-fb23-41ae-a0d3-bbe52d8b3c33	t	f	0	2026-07-16 15:11:28.938	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
43494570-705a-4197-9dd7-fff7505dd335	%D8%AC%D9%8A%D9%81%D9%86%D8%B4%D9%8A-%D8%A8%D8%A7%D9%8A-dhb-0225	جيفنشي باي	Givenchy Pi	DHB-0225	عطر رجالي شرقي فخم يرتكز على حلاوة الفانيلا واللوز المر الدافئة الممزوجة بنضارة اليوسفي وإكليل الجبل وقاعدة من التونكا والجاوي.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	3da57818-e495-4235-a58a-3eb9099e3bdd	t	f	0	2026-07-16 15:11:31.565	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
2b8a4d23-039b-4e32-a1e6-f8e28728733c	%D8%AC%D9%8A%D9%81%D9%86%D8%B4%D9%8A-%D8%A8%D9%84%D8%A7%D9%8A-dhb-0226	جيفنشي بلاي	Givenchy Play for Him	DHB-0226	عطر رجالي حيوي وحديث يمزج بين حمضية الجريب فروت والبرغموت وحرارة الفلفل الأسود مع نوتات خشب الأميريس وقاعدة من نجيل الهند.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	e98337f4-cc57-43ae-ab6c-7050c578a699	t	f	0	2026-07-16 15:11:34.428	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
5a9c924e-72eb-4ce3-8d8c-eabc915bdd42	%D8%B2%D8%B9%D9%81%D8%B1%D8%A7%D9%86-dhb-0386	زعفران	Dahab Saffron	DHB-0386	عطر فاخر بطابع زعفران، عنبر، جلدي، يتوازن مع لمسات دافئ، خشبي ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	f472cc49-84a5-4267-95bf-9e9b03db2a08	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	0d2a3e1c-c334-43fb-a89e-52d87b47d5e2	t	f	0	2026-07-16 15:20:17.693	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
757f5ca5-6987-439d-adf7-d2c7404911e9	%D8%A8%D9%84%D9%88-%D8%AC%D9%8A%D9%86%D8%B2-dhb-0229	بلو جينز	Versace Blue Jeans	DHB-0229	عطر رجالي كلاسيكي منعش يتميز بتوليفة غنية من الحمضيات واللافندر واليانسون مع قاعدة حلوة دافئة من الفانيلا وخشب الصندل والتونكا.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	cb26e338-4ae8-4dc6-bde5-ac98c5e9b3e7	t	f	0	2026-07-16 15:11:43.233	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
ff1a0c73-a68a-45f1-bc58-542660d04108	%D8%A8%D8%A7%D8%AF-%D8%A8%D9%88%D9%8A-dhb-0230	باد بوي	Carolina Herrera Bad Boy	DHB-0230	عطر رجالي شرقي فخم يتميز بمزيج حار من الفلفل الأسود والأبيض ونضارة الميرمية مع قاعدة حلوة دافئة من الكاكاو وتونكا الأخشاب.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	db28bbe4-82cb-41ea-aae7-2e66f8f73238	t	f	0	2026-07-16 15:11:45.988	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
b8f49443-825f-402d-8a87-98df3f13322d	%D8%A8%D9%86%D8%AA%D9%84%D9%8A-%D8%A7%D8%B2%D8%A7%D8%B1%D9%88-dhb-0231	بنتلي ازارو	Bentley for Men Azure	DHB-0231	عطر رجالي منعش يتميز بطابع مائي حيوي يمزج بين حلاوة الأناناس ونضارة أوراق البنفسج والشاي الأخضر وقاعدة خشبية ناعمة من الكشمير.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	3894ff07-f0c8-4c02-97f6-2cea17b9f8da	t	f	0	2026-07-16 15:11:48.99	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
27028cb6-61cc-4664-9d15-c39bef00eced	212-dhb-0232	212	Carolina Herrera 212 Men	DHB-0232	عطر رجالي صيفي كلاسيكي يفيض بالنقاء والحيوية، يمزج بين النوتات العشبية الخضراء وحمضية الجريب فروت وحرارة الزنجبيل وقاعدة مسكية صندلية.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	eebd8df9-62a4-4776-ae80-f44f87fe7471	t	f	0	2026-07-16 15:11:52.164	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
9ab9be03-ca2d-49c0-9e18-a16f15f96d35	212-vip-black-dhb-0233	212 VIP Black	Carolina Herrera 212 VIP Black	DHB-0233	عطر رجالي شرقي فخم وغامض يمزج بين حيوية نبات الأفسنتين واللافندر وقاعدة حلوة دافئة من الفانيلا السوداء والمسك الحسي.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	05b94a45-7685-4cae-aa4c-254a2e2ba4c3	t	f	0	2026-07-16 15:11:55.249	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
6bdbb989-d52c-46ae-9fb6-a7ace9089b6d	212-sexy-dhb-0234	212 Sexy	Carolina Herrera 212 Sexy Men	DHB-0234	عطر رجالي حسي وجذاب يجمع بين دفء الهيل والفلفل وحلاوة الفانيلا والتونكا مع قاعدة خشبية كريمية من خشب الصندل والعنبر.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	bc7cd308-88f3-43d4-834b-1f2f52924704	t	f	0	2026-07-16 15:11:58.456	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
ae7bca18-fd4d-4ec3-bb28-3b2734da687b	212-vip-dhb-0235	212 VIP	Carolina Herrera 212 VIP Men	DHB-0235	عطر رجالي حيوي وجذاب يفتتح بحيوية ثمار الباشون فروت والنعناع والزنجبيل مع قاعدة دافئة من الجلود والعنبر والأخشاب الداكنة.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	3a8726fb-9783-489d-bf8f-5e68ba196687	t	f	0	2026-07-16 15:12:01.701	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
e60a4b7d-e652-4115-9310-04dae4a2f227	%D9%86%D9%88%D8%A7%D8%B1-%D8%A7%D9%83%D8%B3%D8%AA%D8%B1%D9%8A%D9%85-dhb-0236	نوار اكستريم	Tom Ford Noir Extreme	DHB-0236	عطر رجالي شرقي فاخر بطابع شهي، يمزج بين حلاوة حلوى الكولفي الهندية والفانيلا وحرارة الهيل والزعفران مع قاعدة عنبرية خشبية غنية.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	4379c839-78ef-466f-ac2d-125b5a556a09	t	f	0	2026-07-16 15:12:04.869	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
a1f0ff8c-81d4-48bf-b7c2-bc297b29bab8	%D8%AA%D9%88%D9%85%D9%8A-%D8%A8%D9%88%D9%8A-dhb-0237	تومي بوي	Tommy Hilfiger Tommy	DHB-0237	عطر رجالي صيفي كلاسيكي مفعم بالانتعاش والحيوية، يمزج بين أوراق النعناع والجريب فروت وحلاوة التفاح وقاعدة دافئة من خشب القيقب والعنبر.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	789332c4-9490-4a0b-b649-9e9b1ccc4399	t	f	0	2026-07-16 15:12:07.959	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
d851ea0e-5b15-48d4-8d3c-c07e0836a988	%D8%AA%D8%B4%D9%8A%D9%83-dhb-0238	تشيك	Carolina Herrera Chic For Men	DHB-0238	عطر رجالي منعش ومميز يمزج بين حيوية البطيخ الأحمر المنعش وحرارة الهيل والقرفة والفلفل الأسود مع قاعدة خشبية دافئة من الصندل والأرز.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	83122c5b-4562-43d3-8272-5619ff34020a	t	f	0	2026-07-16 15:12:11.133	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
0e34cefc-9cc3-4e13-b25a-2a1b01bbd4c2	%D8%AA%D9%8A%D8%B1%D9%8A-%D8%AF%D9%8A-%D9%87%D9%8A%D8%B1%D9%85%D8%B3-dhb-0239	تيري دي هيرمس	Hermès Terre d'Hermès	DHB-0239	عطر رجالي ترابي فاخر ذو طابع معدني فريد، يفوح بنضارة البرتقال والجريب فروت مع حدة الفلفل الأسود وقاعدة خشبية دافئة من الأرز ونجيل الهند.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	fea0ee67-0f6f-45f1-a3ad-31b7fcb2c206	t	f	0	2026-07-16 15:12:14.195	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
00f161f6-53e4-4191-85b2-81e573898f95	%D8%AC%D9%88%D8%AA%D8%B4%D9%8A-%D8%AC%D9%84%D8%AA%D9%8A-%D8%A7%D9%84%D9%83%D8%B3%D9%8A%D8%B1-dhb-0242	جوتشي جلتي الكسير	Gucci Guilty Elixir de Parfum pour Homme	DHB-0242	عطر رجالي شرقي فخم ذو ثبات استثنائي، يجمع بين عبير زهر البرتقال ونعومة السوسن البودرية وحلاوة الفانيلا والجاوي الدافئة.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	31962865-2662-4079-9c11-dff116a6259f	t	f	0	2026-07-16 15:12:23.397	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
71cb70a1-52af-43b0-b06b-5a51225a84a6	%D9%83%D8%B1%D9%8A%D8%AF-%D8%A8%D9%84%D8%A7%D9%83-dhb-0243	كريد بلاك	Creed Green Irish Tweed	DHB-0243	عطر رجالي كلاسيكي منعش يتميز بطابع عشبي أخضر، يفوح بعبير الفيربينا والليمون وأوراق البنفسج مع قاعدة خشبية فاخرة من خشب الصندل والعنبر.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	149c544b-5063-4db0-ac7b-51feaf3e8449	t	f	0	2026-07-16 15:12:26.486	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
bcfbe8d4-46e1-43cd-aa18-f2aad6130d19	%D8%AC%D8%A7%D9%83%D9%88%D8%A7%D8%B1-%D8%A8%D9%84%D8%A7%D9%83-dhb-0244	جاكوار بلاك	Jaguar Classic Black	DHB-0244	عطر رجالي منعش يتميز بتوليفة حيوية من التفاح الأخضر والشاي الأسود مع حرارة الهيل وقاعدة خشبية مسكية ناعمة وثابتة.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	75e88640-d6d9-4e0b-b86d-66dc86de76ee	t	f	0	2026-07-16 15:12:29.541	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
cd839cb5-2ab8-4312-9208-7949f79474c4	%D8%AC%D9%83%D9%85%D9%88-dhb-0245	جكمو	Jacomo de Jacomo	DHB-0245	عطر رجالي كلاسيكي حار يتميز بنفحات دافئة من القرنفل والقرفة وجوزة الطيب مع قاعدة رجولية قوية من الجلود وطحلب البلوط.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	91c400b3-ea89-4f70-85f7-9705f51b39a0	t	f	0	2026-07-16 15:12:32.649	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
944dfaa0-f4f3-4dd8-9ed0-bd48dc76424f	%D8%AC%D9%86%D8%AA%D9%84-%D9%85%D8%A7%D9%86-dhb-0246	جنتل مان	Givenchy Gentleman Eau de Parfum	DHB-0246	عطر رجالي شرقي فاخر يتميز بنعومة زهرة السوسن البودرية وحرارة الفلفل الأسود مع قاعدة دافئة من الفانيلا والباتشولي وبلسم تولو.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	8f7a9ff1-b862-404b-841f-df670cd04138	t	f	0	2026-07-16 15:12:35.689	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
3ff9c784-ccd9-4adb-a793-a8cee2e525c3	%D8%AC%D9%8A%D9%86%D8%B4%D9%8A-%D8%A8%D9%84%D8%A7%D9%8A-dhb-0247	جيڤنشي بلاي	Givenchy Play for Him	DHB-0247	عطر رجالي حيوي وحديث يمزج بين حمضية الجريب فروت والبرغموت وحرارة الفلفل الأسود مع نوتات خشب الأميريس وقاعدة من نجيل الهند.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	e98337f4-cc57-43ae-ab6c-7050c578a699	t	f	0	2026-07-16 15:12:38.418	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
1a6602ed-b11a-488e-a848-8f621dd1e5e8	%D8%AC%D9%86%D8%AA%D9%84-%D9%85%D8%A7%D9%86-%D8%B3%D9%88%D8%B3%D9%8A%D8%AA%D9%8A-dhb-0248	جنتل مان سوسيتي	Givenchy Gentleman Society	DHB-0248	عطر رجالي خشبي فاخر يمزج بين نضارة الميرمية والهيل وقلب زهري من النرجس البري مع قاعدة دافئة من نجيل الهند والفانيلا وخشب الصندل.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	4c0155bc-2c3b-4f7a-95cc-06415610270e	t	f	0	2026-07-16 15:12:41.444	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
f4ae23f0-da72-4b5e-80d2-eac5adff8d2d	%D8%AC%D9%86%D8%AA%D9%84-%D9%85%D8%A7%D9%86-%D8%A7%D9%88%D9%86%D9%84%D9%8A-%D8%A7%D9%86%D8%AA%D9%86%D8%B3-dhb-0249	جنتل مان اونلي انتنس	Givenchy Gentlemen Only Intense	DHB-0249	عطر رجالي خشبي دافئ يتميز بتوليفة مكثفة تجمع بين فخامة الجلود والبخور وحرارة الفلفل الأسود مع قاعدة دافئة من العنبر والباتشولي والتونكا.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	812a3529-671d-4a3a-806a-1d63f07c897a	t	f	0	2026-07-16 15:12:44.389	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
0a8afc61-f4f1-4199-9fca-50acb7fd6901	%D8%AF%D9%86%D9%87%D9%84-%D8%A8%D9%84%D8%A7%D9%83-dhb-0251	دنهل بلاك	Alfred Dunhill Dunhill Black	DHB-0251	عطر رجالي عشبي أنيق يفتتح بعبير أوراق القراص الخضراء واللافندر مع قلب زهري ناعم وقاعدة دافئة من الجلد السويدي والأخشاب.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	9bd8eb7b-0ef5-4399-8f51-d39227cd47c4	t	f	0	2026-07-16 15:12:50.028	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
ebf46448-a544-4310-be0d-422ef7a4cb8e	%D8%AF%D9%86%D9%87%D9%84-%D9%81%D8%B1%D9%8A%D8%B4-dhb-0252	دنهل فريش	Alfred Dunhill Dunhill Fresh	DHB-0252	عطر رجالي صيفي منعش للغاية بطابع عشبي نقي، يمزج بين نضارة أوراق النعناع والريحان والميرمية مع قاعدة خشبية ناعمة من الأرز والباتشولي.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	a78280b1-ab5c-411b-be06-d4158df9ba00	t	f	0	2026-07-16 15:12:53.093	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
b1b782a4-1c73-42fc-a864-120b7dcdb6d6	%D8%AF%D9%86%D9%87%D9%84-%D8%AF%D9%8A%D8%B2%D8%A7%D9%8A%D8%B1-%D8%A8%D9%84%D9%88-dhb-0255	دنهل ديزاير بلو	Alfred Dunhill Desire Blue	DHB-0255	عطر رجالي صيفي منعش بطابع مائي يمزج بين حلاوة ثمار الليتشي الاستوائية والنوتات البحرية وزهرة اللوتس وقاعدة دافئة من التونكا والعنبر.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	b6d8ceb0-6804-470b-9795-73394a223737	t	f	0	2026-07-16 15:13:01.633	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
59110147-0dd3-4c94-b06c-f80a08d09dc2	%D8%AF%D8%A7%D8%B1%D8%AC-dhb-0256	دارج	Rasasi Daarej pour Homme	DHB-0256	عطر شرقي دافئ وشهير للغاية للرجال، يمزج بين توابل الكمون والهيل ونقاء الورد مع قاعدة حلوة وغنية من الفانيلا والتونكا وخشب الصندل.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	4379c839-78ef-466f-ac2d-125b5a556a09	t	f	0	2026-07-16 15:13:04.152	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
8c4c41bf-b35f-464b-be5f-11e7ebe18569	%D8%AF%D8%B1%D8%A7%D9%83%D8%A7%D8%B1-dhb-0257	دراكار	Guy Laroche Drakkar Noir	DHB-0257	عطر رجالي كلاسيكي عتيق ذو طابع رجولي بارز، يمزج بين الخزامى (اللافندر) وإكليل الجبل والريحان مع قاعدة دافئة من الجلود وطحلب البلوط والأخشاب.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	cafc7aaf-5e45-445f-85be-90904c8ada5b	t	f	0	2026-07-16 15:13:06.945	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
cb400a40-b9b3-49b4-a1d5-90cd684a69d2	%D8%B1%D8%B2%D8%A7%D8%AA%D8%B4%D9%8A-%D8%AF%D9%8A%D9%84%D8%A7%D9%86-%D8%A8%D9%84%D9%88-dhb-0258	ڤرزاتشي ديلان بلو	Versace Pour Homme Dylan Blue	DHB-0258	عطر رجالي عصري وجذاب يفوح بنضارة البرغموت والجريب فروت والنوتات المائية مع قلب من الأمبروكسان وقاعدة دافئة من البخور والتونكا والمسك.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	b669b759-3b36-4678-9eb3-a6b655b8ad2c	t	f	0	2026-07-16 15:13:09.438	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
2e09f8a6-623b-4612-a9f4-4c1fc8b85d1a	%D8%B1%D8%B2%D8%A7%D8%AA%D8%B4%D9%8A-%D8%A7%D9%8A%D8%B1%D9%88%D8%B3-dhb-0259	ڤرزاتشي ايروس	Versace Eros Pour Homme	DHB-0259	عطر رجالي حيوي وجذاب يتميز بفوحانه الرائع، يفتتح بنضارة أوراق النعناع والتفاح الأخضر مع قلب من التونكا وقاعدة غنية من الفانيلا والأرز.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	aa9c9d7e-00ab-447d-bc52-a33a21ca927d	t	f	0	2026-07-16 15:13:12.513	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
b0bc5542-772e-4673-9b0b-08a1ff1cd72d	%D8%B1%D8%B2%D8%A7%D8%AA%D8%B4%D9%8A-%D9%85%D8%A7%D9%86-dhb-0260	ڤرزاتشي مان	Versace Man Eau Fraiche	DHB-0260	عطر رجالي صيفي منعش للغاية يفوح بنضارة الليمون الأصفر وثمار الكارامبولا الاستوائية مع قلب من خشب الأرز وقاعدة مسكية مائية باردة.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	a855ceb4-5188-4ef7-aa77-5cbebe991f7d	t	f	0	2026-07-16 15:13:15.605	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
85d4e3e0-0d70-40f0-9136-a796dedee9e6	%D8%AF%D9%8A%D8%B2%D9%84-dhb-0261	ديزل	Diesel Fuel for Life Homme	DHB-0261	عطر رجالي حيوي وجذاب يتميز بتوليفة غير تقليدية تدمج بين حرارة اليانسون وعبير اللافندر مع نكهة التوت الحلوة وقاعدة خشبية ناعمة.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	657f5793-f690-4c37-840e-087b15e237b4	t	f	0	2026-07-16 15:13:18.469	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
022a4e77-f3c0-4504-9d5a-e2e12d178fb7	%D8%AF%D9%8A%D9%88%D8%B1-%D9%87%D9%88%D9%85-%D8%B3%D8%A8%D9%88%D8%B1%D8%AA-dhb-0262	ديور هوم سبورت	Dior Homme Sport	DHB-0262	عطر رجالي رياضي راقٍ يتميز بنضارة الليمون والبرغموت مع حيوية الألديهيدات وراتنج الإيليماني وقاعدة خشبية عنبرية دافئة وثابتة.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	86379d33-5d24-4ec2-9f04-2818a627bfa4	t	f	0	2026-07-16 15:13:21.212	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
fbb2f6c1-a13d-42e9-8af9-3327159f0a8c	%D8%AF%D9%88%D9%84%D8%AA%D8%B4%D9%8A-%D8%B3%D8%A8%D9%88%D8%B1%D8%AA-dhb-0263	دولتشي سبورت	Dolce & Gabbana The One Sport	DHB-0263	عطر رجالي صيفي منعش للغاية بطابع مائي، يمزج بين البرودة المائية ونضارة إكليل الجبل والهيل وقاعدة مسكية خشبية خفيفة.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	3894ff07-f0c8-4c02-97f6-2cea17b9f8da	t	f	0	2026-07-16 15:13:24.027	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
a275de9a-5f98-4ee6-8a04-415330eb7c9b	%D8%AF%D9%88%D9%84%D8%AA%D8%B4%D9%8A-k-dhb-0264	دولتشي K	K by Dolce & Gabbana	DHB-0264	عطر رجالي عصري أنيق يفتتح بحيوية البرتقال الأحمر وثمار العرعر مع حرارة الفلفل الحار وقاعدة خشبية ترابية من الأرز ونجيل الهند.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	ef0047bf-5fe8-4b92-9110-1effce9f8419	t	f	0	2026-07-16 15:13:26.609	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
47a8028b-d94e-4f27-b0b7-56a2ae1e8bae	%D8%BA%D8%A8%D8%A7%D8%B1-%D8%A7%D9%84%D8%B0%D9%87%D8%A8-dhb-0268	غبار الذهب	Abdul Khaliq Saeed Gobar Al Zahab	DHB-0268	عطر شرقي كلاسيكي فاخر يفوح بعبق التراث العربي، يمزج بين فخامة دهن العود والزعفران الحار وقلب من الورد مع قاعدة دافئة من العنبر والباتشولي.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	04c8ef92-b754-4652-a5ab-2a19c18c9073	t	f	0	2026-07-16 15:13:37.868	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
fc4e72d9-de13-42f3-a44a-529a89e1e2d4	%D8%B2%D8%BA%D8%A8%D8%A7%D8%B1-%D8%A7%D9%84%D9%81%D8%B6%D8%A9-dhb-0269	زغبار الفضة	Abdul Khaliq Saeed Gobar Al Feda	DHB-0269	عطر شرقي منعش يتميز بطابعه النظيف والراقي، يمزج بين نقاء المسك الأبيض ودفء خشب الصندل مع نفحات حمضية وتوابل منعشة وقاعدة خشبية.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	cca8557d-cf0a-40e7-a844-b7b97ca98fb9	t	f	0	2026-07-16 15:13:40.881	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
7333c793-92dc-4d5a-b91a-0b3dcd894eb2	ck-1-dhb-0270	CK 1	Calvin Klein CK One	DHB-0270	عطر حمضي منعش للجنسين يجسد روح البساطة والانتعاش، يمزج بين حموضة الليمون والبرغموت والنوتات الخضراء مع قلب زهري رقيق وقاعدة مسكية باردة.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	55719cb3-2581-4ade-854f-d90e64e837ea	3ef45d89-f354-4984-a4d8-308b605a9b0e	695fd344-ffed-40f0-a36b-9050efcafd69	t	f	0	2026-07-16 15:13:43.998	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
2d7e52f0-0a83-46fd-908e-3bad0d6f2ebd	ch-dhb-0271	CH	Carolina Herrera CH Men	DHB-0271	عطر رجالي شرقي فخم يتميز بتوليفة فريدة تجمع بين حلاوة السكر وعبق الجلود الفاخرة والزعفران مع نضارة عشبية وقاعدة عنبرية دافئة.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	47ee89a8-4656-414e-8ee0-b50a501da18d	t	f	0	2026-07-16 15:13:47.457	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
94daadee-0da8-419b-a232-88f91dfdefa5	%D8%B3%D9%83%D8%A7%D9%86%D8%AF%D9%84-dhb-0272	سكاندل	Jean Paul Gaultier Scandal Pour Homme	DHB-0272	عطر رجالي شرقي دافئ وشهي للغاية، يمزج بين حلاوة الكراميل والتونكا ونضارة الميرمية واليوسفي مع قاعدة خشبية ترابية من نجيل الهند.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	6380d6ef-8411-4e7b-b574-f5d253001385	t	f	0	2026-07-16 15:13:50.621	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
d2a0f31c-8663-49d1-9132-0c3005d100e9	%D8%B3%D9%88%D9%81%D8%A7%D8%AC-%D8%A7%D9%84%D9%83%D8%B3%D9%8A%D8%B1-dhb-0274	سوفاج الكسير	Dior Sauvage Elixir	DHB-0274	عطر رجالي حار وفخم للغاية ذو حضور مهيب، يمزج بين حرارة القرفة والهيل وجوزة الطيب مع عرق السوس واللافندر وقاعدة صندلية دافئة وثابتة.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	fec44987-89ed-4b5e-b1e4-dcbaedc90704	t	f	0	2026-07-16 15:13:57.699	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
30a7e534-d700-4613-b061-6e9085db3e96	%D8%B3%D9%88%D9%81%D8%A7%D8%AC-%D9%81%D9%88%D8%B1%D8%AA%D9%8A-dhb-0275	سوفاج فورتي	Dior Sauvage Eau Forte	DHB-0275	عطر رجالي شرقي منعش ومبتكر يمثل القوة المائية، يمزج بين حيوية التوابل الباردة واللافندر الأبيض مع قاعدة خشبية مسكية دافئة وثابتة.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	2a33c55b-21d8-4d9e-a520-9dabc1e776af	t	f	0	2026-07-16 15:14:00.699	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
5c508d38-7c4b-4b8f-aeb1-f9e125d225bd	%D8%B3%D8%A8%D8%A7%D9%8A%D8%B3-%D8%A8%D9%85%D8%A8-dhb-0276	سبايس بمب	Viktor & Rolf Spicebomb	DHB-0276	عطر رجالي شرقي حار يتميز بانفجار عطري من التوابل كالفلفل الوردي والزعفران والقرفة مع نفحات غنية من التنبك والجلود والأخشاب الدافئة.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	0724bb7a-19f7-4c2e-bce7-2a7495adc482	t	f	0	2026-07-16 15:14:03.63	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
740d30b9-8169-48b7-b8db-77db73c7f15b	%D8%B9%D9%88%D8%AF-%D8%A3%D8%A8%D9%8A%D8%B6-dhb-0351	عود أبيض	Rasasi Oudh Al Abiyad	DHB-0351	عطر فاخر بطابع عود، أبيض زهري، مسك، يتوازن مع لمسات عنبر، خشبي ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	26e988b4-46fb-4100-a190-0ed4a7d72d34	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	2ded4d61-d1d3-45aa-b898-b9b438cc5b25	t	f	0	2026-07-16 15:18:06.967	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
1b4f0479-08ff-4fb7-a48c-8d7d1a9319d7	%D8%B3%D8%A8%D9%84%D8%A7%D9%86%D8%AF%D8%AF-dhb-0279	سبلاندد	Laura Mars Splendid	DHB-0279	عطر رجالي أروماتك منعش يتميز بتوليفة حيوية من الحمضيات واللافندر ونضارة الأعشاب مع قاعدة خشبية مسكية ناعمة ومناسبة للاستخدام اليومي.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	472f8d38-a518-4c80-985e-807d3b095643	t	f	0	2026-07-16 15:14:12.254	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
59dfaf31-6b17-4d0a-a15d-81cb250f40e4	%D8%B4%D8%A7%D9%85%D8%A8%D9%8A%D9%88%D9%86-%D8%AF%D8%A7%D9%81%D9%8A%D8%AF%D9%88%D9%81-dhb-0280	شامبيون دافيدوف	Davidoff Champion	DHB-0280	عطر رجالي صيفي منعش بطابع رياضي، يمزج بين حمضية الليمون والبرغموت ونضارة الميرمية مع قاعدة خشبية دافئة من خشب الأرز وطحلب البلوط.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	86379d33-5d24-4ec2-9f04-2818a627bfa4	t	f	0	2026-07-16 15:14:15.115	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
cb7b75da-eca0-4e78-bbfa-5a01bf0eb4fb	%D9%81%D9%86%D8%AF%D9%8A-%D9%85%D8%A7%D9%86-dhb-0281	فندي مان	Fendi Uomo	DHB-0281	عطر رجالي كلاسيكي راقٍ يتميز بطابع جلدي دافئ، يمزج بين حرارة التوابل واللافندر مع قاعدة ترابية غنية من الجلود والباتشولي ونجيل الهند.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	110bcabf-bd0b-47c2-89ed-5032d3ac64f0	t	f	0	2026-07-16 15:14:18.326	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
0a6ef255-7fab-4a0b-b69a-3a95b77894b6	%D9%81%D9%88%D9%8A%D8%A7%D8%AC-dhb-0282	فوياج	Nautica Voyage	DHB-0282	عطر رجالي صيفي منعش للغاية بطابع مائي، يفوح بعبير التفاح الأخضر والأوراق الخضراء المنعشة مع زهرة اللوتس وقاعدة مسكية خشبية باردة.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	43e123c2-a3bc-4833-8072-5251601b6eb9	t	f	0	2026-07-16 15:14:21.469	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
ffa99d71-5c66-485b-962e-60b1383fd7a6	%D9%83%D8%B1%D9%8A%D8%AF-%D9%81%D8%A7%D9%8A%D9%83%D9%86%D8%AC-dhb-0283	كريد فايكنج	Creed Viking	DHB-0283	عطر رجالي شرقي حار يتميز بنشاطه وقوته، يمزج بين حرارة الفلفل الوردي والقرنفل وانتعاش النعناع البارد مع قاعدة خشبية فاخرة من الصندل.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	b5f9df0a-3e4c-4219-81eb-e0c48141efe5	t	f	0	2026-07-16 15:14:24.492	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
cc317f86-9b40-436e-92ef-0f0eab00699a	%D9%85%D8%A7%D9%8A-%D8%B3%D9%8A%D9%84%D9%81-dhb-0284	ماي سيلف	MYSLF Yves Saint Laurent	DHB-0284	عطر رجالي عصري وأنيق يجمع بنعومة فريدة بين نضارة البرغموت الإيطالي وجاذبية زهر البرتقال مع قاعدة خشبية دافئة من الأمبروكسان والباتشولي.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	34043d63-b89d-474e-a43f-cb4e800b2ba3	t	f	0	2026-07-16 15:14:27.411	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
31cc7a30-cd6a-4095-9662-2e562b960e4f	%D9%85%D8%A7%D8%B1%D9%8A%D9%88-dhb-0285	ماريو	Dahab House Blend / Mario (Requires Clarification)	DHB-0285	عطر رجالي مميز بطابع خاص، يحتاج إلى مراجعة مع العميل لتحديد تفاصيله ونوع المزيج العطري المطلوب بدقة.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	a2d70cb8-0d7b-4d53-a2a1-0c96dfd8c2e5	t	f	0	2026-07-16 15:14:30.489	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
7eb16ed2-8737-4b3a-8e55-76aa65f55ea6	%D9%88%D9%86-%D9%85%D9%84%D9%8A%D9%88%D9%86-%D8%AC%D9%88%D9%84%D8%AF-dhb-0286	ون مليون جولد	Paco Rabanne Million Gold for Him	DHB-0286	عطر رجالي شرقي خشبي فاخر يفوح بنضارة الماندرين والهيل الحار مع قاعدة خشبية دافئة وكريمية من خشب الصندل والأرز.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	86895f97-0f1b-4820-8fda-c94f4ee76a9a	t	f	0	2026-07-16 15:14:33.438	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
1c13ab6e-6ce7-4c70-bd84-9f8bf4373d75	%D8%A8%D9%88%D8%B1%D9%86-%D8%A7%D9%86-%D8%B1%D9%88%D9%85%D8%A7-%D8%A7%D9%83%D8%B3%D8%AA%D8%B1%D8%A7-%D8%AF%D9%88%D8%B2-dhb-0287	بورن ان روما اكسترا دوز	Valentino Uomo Born In Roma Intense	DHB-0287	عطر رجالي شرقي دافئ يتميز بتركيزه المكثف، يمزج بين عبير اللافندر والميرمية وحرارة الزنجبيل مع قاعدة حلوة دافئة من الفانيلا.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	6380d6ef-8411-4e7b-b574-f5d253001385	t	f	0	2026-07-16 15:14:36.145	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
f6d65d00-7f47-4b55-8590-fdab9ce175aa	%D9%81%D9%87%D8%B1%D9%86%D9%87%D8%A7%D9%8A%D8%AA-dhb-0299	فهرنهايت	Dior Fahrenheit	DHB-0299	عطر رجالي كلاسيكي مهيب يتميز بنوتة الجلود البارزة وأوراق البنفسج وجوزة الطيب مع قاعدة خشبية دافئة وثابتة من الأرز ونجيل الهند والباتشولي.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	647ea3b0-bedd-460a-a26c-31c649095589	t	f	0	2026-07-16 15:15:12.157	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
b6891f3b-5f33-4b05-8ae5-e5d8deea26a9	%D9%86%D8%B1%D8%B3%D9%8A%D8%B3%D9%88-%D9%83%D8%B1%D9%8A%D8%B3%D8%AA%D8%A7%D9%84-dhb-0292	نرسيسو كريستال	Narciso Rodriguez Narciso Eau de Parfum Cristal	DHB-0292	عطر نسائي ناعم وراقٍ يتميز بالنقاء، يمزج بين عبير الفريزيا والورد الجوري وزهر البرتقال مع قلب مسكي دافئ وقاعدة مخملية من الكشمير.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	71c9fc88-2452-4478-b1b0-1440980530bd	t	f	0	2026-07-16 15:14:51	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
be44a0c2-782d-4834-ac0a-83de9f1db9db	%D8%A7%D9%8A%D9%88%D8%B1%D9%8A%D8%A7-%D9%84%D9%8A%D9%83%D9%88%D9%8A%D8%AF-%D8%AC%D9%88%D9%84%D8%AF-dhb-0293	ايڤوريا ليكويد جولد	Calvin Klein Liquid Gold Euphoria Men	DHB-0293	عطر رجالي شرقي خشبي فاخر يتميز بتوليفة مكثفة، يمزج بين حرارة الفلفل الأسود والزعفران الثمين وقاعدة دافئة وثابتة من خشب الصندل.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	e0202d2c-70a8-4946-82b9-7ab426d8dcbd	t	f	0	2026-07-16 15:14:54.347	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
d36eded5-b156-431d-b081-6542eb328e72	%D8%A7%D8%B1%D9%85%D8%A7%D9%86%D9%8A-%D9%83%D9%88%D8%AF-%D8%A8%D8%B1%D9%88%D9%81%D9%88%D9%85%D9%88-dhb-0294	ارماني كود بروفومو	Giorgio Armani Armani Code Profumo	DHB-0294	عطر رجالي شرقي فخم يتميز بحلاوة التونكا وجاذبية العنبر والجلود الممزوجة بحرارة الهيل وجوزة الطيب وزهر البرتقال بطابع دافئ وقوي.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	4379c839-78ef-466f-ac2d-125b5a556a09	t	f	0	2026-07-16 15:14:57.32	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
c5932bdc-6417-41a4-a3ff-1f50c74710a6	%D8%A7%D9%83%D9%88%D8%A7-%D8%AF%D9%8A-%D8%AC%D9%8A%D9%88-%D8%A8%D8%B1%D9%88%D9%81%D9%88%D9%86%D8%AF%D9%88-dhb-0295	اكوا دي جيو بروفوندو	Giorgio Armani Acqua Di Gio Profondo	DHB-0295	عطر رجالي صيفي منعش للغاية بطابع بحري داكن، يمزج بين النوتات المائية المالحة وحمضية الماندرين مع قلب من إكليل الجبل وقاعدة مسكية.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	3894ff07-f0c8-4c02-97f6-2cea17b9f8da	t	f	0	2026-07-16 15:15:00.284	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
afb5363d-7f58-4914-8c91-3273be4edf73	%D9%81%D8%B1%D8%B2%D8%A7%D8%AA%D8%B4%D9%8A-%D8%A7%D9%8A%D8%B1%D9%88%D8%B3-dhb-0296	فرزاتشي ايروس	Versace Eros Pour Homme	DHB-0296	عطر رجالي حيوي وجذاب يتميز بفوحانه الرائع، يفتتح بنضارة أوراق النعناع والتفاح الأخضر مع قلب من التونكا وقاعدة غنية من الفانيلا والأرز.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	aa9c9d7e-00ab-447d-bc52-a33a21ca927d	t	f	0	2026-07-16 15:15:03.25	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
4f5a298c-8b10-4cd4-8fbc-e97640007ee2	%D9%81%D8%B1%D8%B2%D8%A7%D8%AA%D8%B4%D9%8A-%D9%85%D8%A7%D9%86-dhb-0297	فرزاتشي مان	Versace Man Eau Fraiche	DHB-0297	عطر رجالي صيفي منعش للغاية يفوح بنضارة الليمون الأصفر وثمار الكارامبولا الاستوائية مع قلب من خشب الأرز وقاعدة مسكية مائية باردة.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	a855ceb4-5188-4ef7-aa77-5cbebe991f7d	t	f	0	2026-07-16 15:15:06.094	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
9a7be05b-90aa-4416-a136-864793f53174	%D9%81%D9%87%D8%B1%D9%86%D9%87%D8%A7%D9%8A%D8%AA32-dhb-0298	فهرنهايت32	Dior Fahrenheit 32	DHB-0298	عطر رجالي كلاسيكي فريد ومنعش يجمع بنقاء مذهل بين نضارة زهر البرتقال المغربي وحلاوة الفانيلا الدافئة مع لمسة ترابية من نجيل الهند.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	f4d18153-f01c-4ee1-9dcb-9e066ff28b33	t	f	0	2026-07-16 15:15:09.253	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
8a1a3ee2-53d8-4d82-bdfa-8536f274a554	%D9%83%D8%A7%D8%B1%D8%AA%D9%8A%D8%B1-%D8%A8%D8%A7%D8%B4%D8%A7-dhb-0300	كارتير باشا	Cartier Pasha de Cartier	DHB-0300	عطر رجالي كلاسيكي فاخر يفوح بعبير الخزامى (اللافندر) والنعناع والكزبرة مع قلب من الكروية وقاعدة خشبية دافئة من خشب الصندل وطحلب البلوط.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	ad3fe7e3-276a-4780-bb86-3ca8675f78b0	t	f	0	2026-07-16 15:15:15.12	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
4842b000-f95f-41e2-a84c-1ed94570969a	%D9%83%D8%B1%D9%8A%D8%AF-%D8%A7%D9%81%D9%86%D8%AA%D9%88%D8%B3-dhb-0304	كريد افنتوس	Creed Aventus	DHB-0304	عطر رجالي فاخر ذو حضور أسطوري، يمزج بين حلاوة الأناناس الاستوائي والتفاح ونفحات خشب البتولا الدخانية مع قاعدة مسكية عنبرية ثابتة.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	fcfb82d7-5d66-481d-ad6b-3dcdc9c7ae1a	t	f	0	2026-07-16 15:15:27.52	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
f45e847d-b184-445a-bdfe-b4727456655a	%D9%83%D9%88%D9%84-%D9%88%D8%A7%D8%AA%D9%8A%D8%B1-dhb-0305	كول واتير	Davidoff Cool Water for Men	DHB-0305	عطر رجالي صيفي منعش بطابع بحري أيقوني، يمزج بين برودة النوتات البحرية والنعناع واللافندر مع قاعدة خشبية دافئة من الصندل والأرز والمسك.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	3894ff07-f0c8-4c02-97f6-2cea17b9f8da	t	f	0	2026-07-16 15:15:30.449	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
27cb9ac7-885f-4658-8d5f-f6f16d855bb8	%D9%83%D8%B1%D9%88%D9%85-%D9%84%D9%8A%D8%AC%D9%86%D8%AF-dhb-0306	كروم ليجند	Azzaro Chrome Legend	DHB-0306	عطر رجالي صيفي منعش للغاية يجمع بنقاء بين حلاوة التفاح الأخضر المقرمش ونضارة الشاي والبرتقال المر وقاعدة خشبية مسكية ثابتة.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	434fedfa-1e6b-4fe8-84c8-d3ab2332043c	t	f	0	2026-07-16 15:15:33.007	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
6ac269ec-1522-4180-8e5d-47d1243fac64	%D9%83%D9%86%D8%B2%D9%88-dhb-0307	كنزو	Kenzo pour Homme	DHB-0307	عطر رجالي صيفي منعش بطابع بحري كلاسيكي، يمزج بين النوتات المائية وأوراق الصنوبر والريحان وقاعدة خشبية دافئة من الصندل وطحلب البلوط.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	1b99cb18-86fd-45f4-b3f6-d112a46174fd	t	f	0	2026-07-16 15:15:36.179	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
d6219858-a813-4275-83fd-e0dc53e505b1	%D9%84%D8%A7%D9%8A%D8%AA-%D8%A8%D9%84%D9%88-dhb-0308	لايت بلو	Dolce & Gabbana Light Blue pour Homme	DHB-0308	عطر رجالي صيفي منعش للغاية يفوح بنضارة الجريب فروت والبرغموت وثمار العرعر مع لمسة توابل من الفلفل الأسود وقاعدة خشبية خفيفة.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	8b48b1e9-4fee-4642-b3cf-33f185bc0d75	t	f	0	2026-07-16 15:15:39.982	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
33b2e338-22d7-4c7e-983c-dad575a28c34	%D9%84%D9%8A%D9%84-%D9%85%D9%84%D9%83%D9%8A-dhb-0309	ليل ملكي	Dolce & Gabbana The One Royal Night	DHB-0309	عطر رجالي شرقي فخم يجسد سحر الليالي الشرقية، يمزج بين حرارة الهيل وجوزة الطيب ونضارة الريحان مع قاعدة غنية وثابتة من العنبر والصندل.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	be6fd238-f164-4c18-a857-9acf561b6cf1	t	f	0	2026-07-16 15:15:42.848	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
bbb3ffcf-bcd3-4f09-b9f8-77b881cb4668	%D9%84%D8%A7%D8%A8%D8%AF%D9%88%D8%B3-dhb-0310	لابدوس	Ted Lapidus Lapidus pour Homme	DHB-0310	عطر رجالي كلاسيكي حار وقوي للغاية، يمزج بين حلاوة العسل والأناناس وعبير التبغ والبخور الدافئ مع قاعدة رجولية مكثفة من طحلب البلوط.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	4379c839-78ef-466f-ac2d-125b5a556a09	t	f	0	2026-07-16 15:15:45.916	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
3614cc74-1402-4552-9a36-15e0f4ff832f	%D9%84%D9%8A%D8%AC%D9%86%D8%AF-dhb-0311	ليجند	Montblanc Legend	DHB-0311	عطر رجالي عصري أنيق وذو طابع حيوي، يفتتح بعبير اللافندر وحلاوة التفاح الأحمر والأناناس مع قاعدة خشبية ناعمة من خشب الصندل والتونكا.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	75e88640-d6d9-4e0b-b86d-66dc86de76ee	t	f	0	2026-07-16 15:15:48.497	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
8b55a19f-45fc-4ff4-9116-af1f72f737e1	%D9%84%D9%8A-%D9%87%D9%88%D9%85-dhb-0313	لي هوم	Yves Saint Laurent L'Homme	DHB-0313	عطر رجالي أنيق ومنعش للإطلالات اليومية، يمزج بين نضارة الزنجبيل والحمضيات مع أوراق البنفسج وقاعدة خشبية كلاسيكية ناعمة من الأرز والأخشاب.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	2f399245-1a66-4d90-a58a-61561624dcf0	t	f	0	2026-07-16 15:15:55.366	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
d1e9245e-e54d-4473-a200-109c97d64c7e	%D9%87%D9%88%D8%AC%D9%88-%D8%A8%D9%88%D8%B3-dhb-0327	هوجو بوس	Hugo Boss Hugo Man	DHB-0327	عطر رجالي كلاسيكي منعش للغاية بطابع عشبي أخضر، يفوح بنضارة التفاح الأخضر والنعناع واللافندر مع قاعدة خشبية دافئة من الصنوبر والأرز.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	a78280b1-ab5c-411b-be06-d4158df9ba00	t	f	0	2026-07-16 15:16:42.907	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
fd9d9682-64a3-49e0-aebe-546de7ee7c13	%D9%88%D9%86-%D9%85%D9%84%D9%8A%D9%88%D9%86-dhb-0328	ون مليون	Paco Rabanne 1 Million	DHB-0328	عطر رجالي شرقي فخم وجذاب يمزج ببراعة بين نضارة الماندرين والنعناع وحرارة القرفة والتوابل مع قاعدة دافئة من الجلود والعنبر.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	bc7cd308-88f3-43d4-834b-1f2f52924704	t	f	0	2026-07-16 15:16:45.616	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
0b34e06a-42aa-4a0a-9560-2065ea434cc4	%D9%88%D9%86-%D9%85%D9%84%D9%8A%D9%88%D9%86-%D9%84%D9%83%D9%8A-dhb-0329	ون مليون لكي	Paco Rabanne 1 Million Lucky	DHB-0329	عطر رجالي شرقي شهي وجذاب للغاية، يمزج بين حلاوة العسل والبرقوق ونكهة البندق المحمص مع قاعدة خشبية مخملية من خشب الكشمير والأرز.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	590e3ad1-747a-43e1-b9e3-3efa426cf9d1	t	f	0	2026-07-16 15:16:48.814	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
3e2aeceb-01db-4847-b55e-c63f32b49f34	%D9%88%D8%A7%D9%86%D8%AA%D8%AF-%D8%A8%D8%A7%D9%8A-%D9%85%D8%A7%D9%8A%D8%AA-dhb-0330	وانتد باي مايت	Azzaro Wanted by Night	DHB-0330	عطر رجالي شرقي فخم يتميز بطابع دافئ وجذاب للغاية، يمزج بين حرارة القرفة ونكهة اليوسفي مع نفحات التبغ والجلود والأرز والبخور.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	db28bbe4-82cb-41ea-aae7-2e66f8f73238	t	f	0	2026-07-16 15:16:52.299	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
ea1b54d1-f3ad-4de4-9d3d-2a14af415cad	%D9%88%D8%A7%D9%86%D8%AA%D8%AF-dhb-0331	وانتد	Azzaro Wanted	DHB-0331	عطر رجالي منعش وجذاب يفتتح بنضارة الليمون والزنجبيل وحلاوة التفاح الأخضر مع قلب من الهيل وقاعدة دافئة من التونكا ونجيل الهند.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	a53528ff-76f0-418d-a01e-6bbfc2b3c96b	t	f	0	2026-07-16 15:16:55.493	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
e4bfaa3d-14b9-471d-8e01-d3efa473d74f	%D9%85%D9%88%D8%B3%D8%AA-%D9%88%D8%A7%D9%86%D8%AA%D8%AF-dhb-0332	موست وانتد	Azzaro The Most Wanted	DHB-0332	عطر رجالي شرقي فخم يتميز بحضوره الدافئ والشهي، يجمع بين حلاوة التوفي الكريمة وحرارة الهيل وقاعدة دافئة وثابتة من الأخشاب العنبرية.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	4379c839-78ef-466f-ac2d-125b5a556a09	t	f	0	2026-07-16 15:16:58.228	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
f3843583-d836-44b8-a9cf-edd9eb3ef39a	%D9%86%D9%83%D8%B3%D9%88%D8%B3-dhb-0333	نكسوس	Xerjoff Naxos	DHB-0333	عطر فاخر بطابع تبغي، عسل، فانيلا، يتوازن مع لمسات لافندر، حمضي ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	f472cc49-84a5-4267-95bf-9e9b03db2a08	55719cb3-2581-4ade-854f-d90e64e837ea	3ef45d89-f354-4984-a4d8-308b605a9b0e	c39d8af1-0d6f-4d30-8e6c-131bf8003ce5	t	f	0	2026-07-16 15:17:02.764	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
8ce290c7-1268-4414-8a17-9c39fe75bdfd	%D8%B9%D9%88%D8%AF-%D8%A3%D8%B5%D9%81%D9%87%D8%A7%D9%86-dhb-0334	عود أصفهان	Dior Oud Ispahan	DHB-0334	عطر فاخر بطابع عود، ورد، عنبر، يتوازن مع لمسات خشبي، دافئ ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	26e988b4-46fb-4100-a190-0ed4a7d72d34	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	c37cd5a4-143d-44da-812a-57e4bd4816ff	t	f	0	2026-07-16 15:17:06.223	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
bf87b360-f6e2-49a1-804f-381c7a3367d2	%D8%B1%D9%88%D8%B2-%D9%88%D9%88%D8%AF-dhb-0335	روز وود	Dior Rosewood	DHB-0335	عطر فاخر بطابع خشبي، ورد، توابل، يتوازن مع لمسات صندل، عنبر ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	f472cc49-84a5-4267-95bf-9e9b03db2a08	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	c804bfc3-cea5-4e6c-ae9b-df1380261163	t	f	0	2026-07-16 15:17:09.545	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
e10a08bd-b188-4489-af6c-3677266a5acb	%D8%AC%D8%B1%D9%8A%D8%B3-dhb-0336	جريس	Dior Gris Dior	DHB-0336	عطر فاخر بطابع شيبر، زهري، باتشولي، يتوازن مع لمسات خشبي، حمضي ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	55719cb3-2581-4ade-854f-d90e64e837ea	28c9117e-5e1b-489a-828e-9813acc326ff	6fb6a7bc-b7da-4db3-9173-7d4b06dd913f	t	f	0	2026-07-16 15:17:12.931	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
b27bd564-a3ae-40eb-bbda-8e2113fa98e7	%D9%85%D9%8A%D8%AC%D8%A7%D9%85%D9%8A%D8%B1-dhb-0337	ميجامير	Orto Parisi Megamare	DHB-0337	عطر فاخر بطابع بحري، ملحي، مائي، يتوازن مع لمسات مسك، أخضر ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	55719cb3-2581-4ade-854f-d90e64e837ea	28c9117e-5e1b-489a-828e-9813acc326ff	6a498893-46c5-418c-8681-7d2e2583b7f9	t	f	0	2026-07-16 15:17:16.661	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
b9d2a0c2-b379-4de6-a7f6-7f1ba70cec76	%D9%84%D8%A7%D9%86%D9%88%D8%AA-%D8%AF%D9%8A-%D9%84%D8%A7%D9%87%D9%88%D9%85-dhb-0312	لانوت دي لاهوم	Yves Saint Laurent La Nuit de L'Homme	DHB-0312	عطر رجالي حسي وجذاب يفوح بحرارة الهيل وتوابل الكروية مع عبير الخزامى (اللافندر) وقاعدة خشبية راقية وثابتة من الأرز ونجيل الهند.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	97c2be19-ae53-4739-959f-911d724aedba	t	f	0	2026-07-16 15:15:51.443	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
b5d2d725-99d0-443b-8573-24461844148c	%D9%84%D8%A7%D9%83%D9%88%D8%B3%D8%AA-%D8%AA%D8%B4%D8%A7%D9%86%D9%84%D8%AC-dhb-0317	لاكوست تشانلج	Lacoste Challenge	DHB-0317	عطر رجالي رياضي مشرق يفيض بالحيوية، يمزج بين حمضية الليمون واليوسفي وحرارة الزنجبيل مع قاعدة خشبية دافئة من خشب التيك والأبنوس.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	24f64784-fb23-41ae-a0d3-bbe52d8b3c33	t	f	0	2026-07-16 15:16:08.815	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
2e5599dd-7b40-4ce7-a114-8cd24c9a4b70	%D9%85%D8%B3%D8%AA%D8%B1-%D8%A8%D8%B1%D8%A8%D8%B1%D9%8A-dhb-0318	مستر بربري	Burberry Mr. Burberry	DHB-0318	عطر رجالي عصري وراقٍ يجسد الأناقة البريطانية الكلاسيكية، يمزج بين حيوية الجريب فروت والهيل مع قاعدة خشبية دافئة من الأرز ونجيل الهند.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	ef0047bf-5fe8-4b92-9110-1effce9f8419	t	f	0	2026-07-16 15:16:12.058	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
1cf242f8-2aed-4992-8e8f-d010156c0a0f	%D9%88%D8%A7%D9%8A-dhb-0325	واي	Yves Saint Laurent Y Eau de Parfum	DHB-0325	عطر رجالي أروماتك منعش للغاية ومناسب لكل المناسبات، يمزج بين حيوية التفاح الأخضر والزنجبيل والميرمية وقاعدة خشبية عنبرية دافئة وثابتة.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	034d7a73-0d34-4beb-8224-407917b71783	t	f	0	2026-07-16 15:16:37.034	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
8feb25c6-e728-4e24-b303-8defd279762b	%D9%84%D9%8A-%D9%85%D9%8A%D9%84-dhb-0319	لي ميل	Jean Paul Gaultier Le Male	DHB-0319	عطر رجالي كلاسيكي راقٍ ومشهور للغاية بتوليفته الغنية، يجمع بين برودة النعناع واللافندر وحرارة القرفة مع قاعدة دافئة من الفانيلا والأخشاب.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	3d33c5b2-b3d1-441c-98ed-047910e8b750	t	f	0	2026-07-16 15:16:17.201	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
e1bb7c06-78d1-4a29-9862-59271f078511	%D8%A7%D9%84%D8%AA%D8%B1%D8%A7%D9%85%D9%8A%D9%84-dhb-0320	التراميل	Jean Paul Gaultier Ultra Male	DHB-0320	عطر رجالي شرقي حلو وجذاب للغاية للإطلالات الحماسية، يمزج بين حلاوة الكمثرى واللافندر وحرارة القرفة وقاعدة دافئة وثابتة من الفانيلا السوداء.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	590e3ad1-747a-43e1-b9e3-3efa426cf9d1	t	f	0	2026-07-16 15:16:20.141	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
c91f8af4-a006-4018-8c6b-2e4b1773cc62	%D9%84%D9%8A-%D9%85%D9%8A%D9%84-%D8%A7%D9%84%D9%83%D8%B3%D9%8A%D8%B1-dhb-0321	لي ميل الكسير	Jean Paul Gaultier Le Male Elixir	DHB-0321	عطر رجالي شرقي فخم بتركيز مكثف وثبات فائق، يمزج بين نقاء اللافندر والنعناع وحلاوة العسل الذائب والفانيلا مع قاعدة دافئة من التونكا والتبغ.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	aad32845-786f-4a91-b29e-0898331d4b8d	t	f	0	2026-07-16 15:16:23.258	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
59b41a3b-fd13-4878-80c5-08012a9446eb	%D9%87%D9%8A%D9%81%D9%8A%D9%86-dhb-0322	هيفين	Chopard Heaven	DHB-0322	عطر رجالي كلاسيكي نادر يتميز بطابع أروماتك ناعم، يمزج بين الخزامى (اللافندر) والليمون وأخشاب الورد مع قاعدة دافئة من العنبر والمسك والتونكا.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	e82826f4-88ec-473e-a82a-aef755a91786	t	f	0	2026-07-16 15:16:26.573	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
579447bd-e5d6-45b4-83f8-addaa6c5ea8c	%D9%88%D9%86-%D9%85%D8%A7%D9%86-%D8%B4%D9%88-dhb-0324	ون مان شو	Jacques Bogart One Man Show	DHB-0324	عطر رجالي كلاسيكي قوي بطابع رجولي مكثف، يفوح بنفحات أوراق الصنوبر والريحان وحرارة التوابل مع قاعدة دافئة من الجلود وطحلب البلوط والأخشاب.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	9185d651-5bea-42f3-8b9d-afdbd72dc920	t	f	0	2026-07-16 15:16:34.12	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
326bb60b-6441-44f8-9f10-9774e0d96ddc	%D8%B1%D9%88%D8%AC-%D9%85%D8%A7%D9%84%D8%A7%D9%83%D8%A7%D9%8A%D8%AA-dhb-0339	روج مالاكايت	Giorgio Armani Rouge Malachite	DHB-0339	عطر فاخر بطابع أبيض زهري، عنبر، دافئ، يتوازن مع لمسات كريمي، توابل ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	f472cc49-84a5-4267-95bf-9e9b03db2a08	2e1d252f-3122-489a-a44b-c687c07ef1a0	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	809e382b-7961-48ee-b065-54734c3f2c94	t	f	0	2026-07-16 15:17:23.404	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
78f666b8-a54c-41bf-ad88-388edf5fb7cd	%D8%A8%D9%84%D8%A7%D9%83-%D8%A3%D9%81%D8%BA%D8%A7%D9%86%D9%88-dhb-0340	بلاك أفغانو	Nasomatto Black Afgano	DHB-0340	عطر فاخر بطابع حشيشي، عود، دخاني، يتوازن مع لمسات خشبي، قهوة ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	26e988b4-46fb-4100-a190-0ed4a7d72d34	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	70c3ed41-d44d-45fc-bac1-6a8356ebc460	t	f	0	2026-07-16 15:17:26.596	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
14938ed6-4005-40da-a871-134ce00c28cb	%D8%B9%D9%88%D8%AF-%D8%B3%D8%A7%D8%AA%D9%86-%D9%85%D9%88%D8%AF-dhb-0343	عود ساتن مود	Maison Francis Kurkdjian Oud Satin Mood	DHB-0343	عطر فاخر بطابع عود، ورد، فانيلا، يتوازن مع لمسات بودري، عنبر ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	26e988b4-46fb-4100-a190-0ed4a7d72d34	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	33d0212c-bc66-4110-a35f-e63a5f349765	t	f	0	2026-07-16 15:17:40.587	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
0c254ff6-8827-4179-b1c5-6b8d10c324c5	%D8%A5%D9%86%D8%AA%D8%B1%D9%84%D9%88%D8%AF-dhb-0344	إنترلود	Amouage Interlude Man	DHB-0344	عطر فاخر بطابع بخور، عنبر، دخاني، يتوازن مع لمسات توابل، عود ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	26e988b4-46fb-4100-a190-0ed4a7d72d34	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	2e745396-3825-4886-b823-f570f1f72750	t	f	0	2026-07-16 15:17:43.44	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
479e2fc2-7ca0-49bd-a203-537b70bbd22f	%D9%81%D9%8A%D9%84%D9%81%D8%AA-%D8%A3%D9%88%D8%B1%D9%83%D9%8A%D8%AF-dhb-0345	فيلفت أوركيد	Tom Ford Velvet Orchid	DHB-0345	عطر فاخر بطابع أوركيد، عسل، رم، يتوازن مع لمسات فانيلا، زهري ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	633eb004-96b4-4c8d-80e3-90509bd490ae	t	f	0	2026-07-16 15:17:46.811	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
80016815-b549-4dbd-9882-1d23e036b880	%D8%AA%D9%88%D8%A8%D8%A7%D9%83%D9%88-%D8%B9%D9%88%D8%AF-dhb-0346	توباكو عود	Tom Ford Tobacco Oud	DHB-0346	عطر فاخر بطابع تبغي، عود، ويسكي، يتوازن مع لمسات دخاني، توابل ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	26e988b4-46fb-4100-a190-0ed4a7d72d34	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	ec0c5172-bbf7-4c24-865a-b8b741c5515b	t	f	0	2026-07-16 15:17:50.755	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
e2c598d0-97e7-43b4-b51d-16f04be0cc13	%D8%A3%D9%85%D8%A8%D8%B1%D9%8A%D9%87-%D9%84%D9%8A%D8%B0%D8%B1-dhb-0347	أمبريه ليذر	Tom Ford Ombre Leather	DHB-0347	عطر فاخر بطابع جلدي، عنبر، توابل، يتوازن مع لمسات زهري، خشبي ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	f472cc49-84a5-4267-95bf-9e9b03db2a08	92fcd610-5dfa-489c-a894-ce8e7687c361	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	567064fb-f8a9-4cd7-8201-eb5e5a09b9c9	t	f	0	2026-07-16 15:17:54.089	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
3c7d1aeb-77a7-460e-b9cf-87b79db7a38b	%D8%B9%D9%88%D8%AF-%D8%A7%D9%84%D8%A3%D8%B5%D9%8A%D9%84-dhb-0348	عود الأصيل	Arabian Oud Oud Al Aseel	DHB-0348	عطر فاخر بطابع عود، عنبر، مسك، يتوازن مع لمسات دخاني، خشبي ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	26e988b4-46fb-4100-a190-0ed4a7d72d34	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	fe0a28e6-584c-453c-96c1-f14475a9502c	t	f	0	2026-07-16 15:17:57.396	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
85d4b481-27a7-40b3-a1ec-cd3395a97194	%D9%88%D8%B5%D8%A7%D9%84-dhb-0349	وصال	Ajmal Wisal	DHB-0349	عطر فاخر بطابع زهري، مسك، ورد، يتوازن مع لمسات توابل، طازج ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	55719cb3-2581-4ade-854f-d90e64e837ea	28c9117e-5e1b-489a-828e-9813acc326ff	46a05814-9e99-4583-a99a-4888993ac60b	t	f	0	2026-07-16 15:18:00.391	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
f7a40dcd-62dd-417a-b2a6-15f863f10f7f	%D8%B9%D9%86%D8%A8%D8%B1-%D8%B3%D9%88%D9%8A%D8%AA-dhb-0350	عنبر سويت	Amber Sweet Oud	DHB-0350	عطر فاخر بطابع عنبر، حلو، فانيلا، يتوازن مع لمسات عود، دافئ ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	26e988b4-46fb-4100-a190-0ed4a7d72d34	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	d7ee7f59-ca59-4153-aa88-d6253776cd9d	t	f	0	2026-07-16 15:18:03.642	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
bfe66f71-0b3f-48d6-ae17-3579fa5955d2	%D9%85%D8%A7%D9%86%D8%AC%D9%88-%D9%84%D9%8A%D8%AA%D8%B4%D9%8A-dhb-0354	مانجو ليتشي	Kayali Mango Lychee	DHB-0354	عطر فاخر بطابع مانجو، ليتشي، استوائي، يتوازن مع لمسات فاكهي، حلو ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	62d74b01-a106-4074-92a8-a56b4b99ab40	2e1d252f-3122-489a-a44b-c687c07ef1a0	28c9117e-5e1b-489a-828e-9813acc326ff	6f40b271-1c95-4258-b8bd-b98419b14c33	t	f	0	2026-07-16 15:18:17.053	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
4e9f33ef-4565-4855-b62d-5cf3c43145cc	%D8%A5%D9%85%D8%A8%D8%B1%D9%8A%D8%A7%D9%84-%D9%81%D8%A7%D9%84%D9%8A-dhb-0360	إمبريال فالي	Qissa Imperial Valley	DHB-0360	عطر فاخر بطابع خشبي، عنبر، توابل، يتوازن مع لمسات مسك، دافئ ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	f472cc49-84a5-4267-95bf-9e9b03db2a08	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	9f9bac48-7427-4be5-b6dd-96c385132db0	t	f	0	2026-07-16 15:18:41.59	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
6710dad2-5d74-4fdd-b8b6-1cba5b41700d	%D9%84%D8%A7-%D9%84%D9%88%D9%86%D8%A7-dhb-0361	لا لونا	Qissa La Luna	DHB-0361	عطر فاخر بطابع زهري، مسك، فانيلا، يتوازن مع لمسات فاكهي، بودري ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	7bd072e4-4ffd-420d-8bdf-17fca204c170	t	f	0	2026-07-16 15:18:44.52	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
0a75d486-578f-4ff3-9d36-7f6f8dab6580	%D9%87%D8%AF%D8%B3%D9%88%D9%86-%D9%81%D8%A7%D9%84%D9%8A-dhb-0362	هدسون فالي	Qissa Hudson Valley	DHB-0362	عطر فاخر بطابع أخضر، خشبي، مسك، يتوازن مع لمسات حمضي، طازج ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	55719cb3-2581-4ade-854f-d90e64e837ea	28c9117e-5e1b-489a-828e-9813acc326ff	aa7ce6ba-dabd-4d62-bf2b-ebe0d8f9fd21	t	f	0	2026-07-16 15:18:47.462	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
9bc5ebc2-2d14-4cac-995a-f68644aa470f	%D8%B9%D9%88%D8%AF-%D9%88%D9%88%D8%AF-dhb-0363	عود وود	Tom Ford Oud Wood	DHB-0363	عطر فاخر بطابع عود، خشبي، توابل، يتوازن مع لمسات صندل، عنبر ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	26e988b4-46fb-4100-a190-0ed4a7d72d34	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	57840ef0-005e-417b-ba07-8b318e13ec77	t	f	0	2026-07-16 15:18:50.539	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
e049d23f-ffcb-492a-b8c8-b3c85cdf904f	%D9%84%D9%88%D8%B3%D8%AA-%D8%B4%D9%8A%D8%B1%D9%8A-dhb-0364	لوست شيري	Tom Ford Lost Cherry	DHB-0364	عطر فاخر بطابع كرز، لوز، حلو، يتوازن مع لمسات فانيلا، خشبي ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	62d74b01-a106-4074-92a8-a56b4b99ab40	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	b1af6c47-39d8-4528-b400-0c6c82e59727	t	f	0	2026-07-16 15:18:54.087	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
e9580454-bcd2-48f6-bfe5-8bebfd8bfe5f	%D8%AA%D9%88%D8%A8%D8%A7%D9%83%D9%88-%D9%81%D8%A7%D9%86%D9%8A%D9%84%D8%A7-dhb-0365	توباكو فانيلا	Tom Ford Tobacco Vanille	DHB-0365	عطر فاخر بطابع تبغي، فانيلا، توابل، يتوازن مع لمسات حلو، كاكاو ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	f472cc49-84a5-4267-95bf-9e9b03db2a08	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	b8c01dd7-8415-4eee-979c-e5796ed63357	t	f	0	2026-07-16 15:18:59.243	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
d373522a-ee6a-4a93-82c3-d097101bd6db	%D8%B1%D9%88%D8%B2-%D9%85%D8%B3%D9%83-dhb-0366	روز مسك	Montale Roses Musk	DHB-0366	عطر فاخر بطابع ورد، مسك، زهري، يتوازن مع لمسات بودري، عنبر ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	f472cc49-84a5-4267-95bf-9e9b03db2a08	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	bd92a615-65f0-4ef5-9aba-51ab03e7ccb6	t	f	0	2026-07-16 15:19:02.699	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
abfdfdef-4e7e-4c38-968c-f4d88d5d0ff4	%D9%83%D9%88%D9%83%D9%88-%D9%81%D8%A7%D9%86%D9%8A%D9%84%D8%A7-dhb-0367	كوكو فانيلا	Coco Vanille	DHB-0367	عطر فاخر بطابع جوز الهند، فانيلا، حلو، يتوازن مع لمسات استوائي، مسك ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	62d74b01-a106-4074-92a8-a56b4b99ab40	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	122acbbd-210d-450b-83e2-d11823326529	t	f	0	2026-07-16 15:19:05.86	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
43383ca1-daab-4dd3-8e8d-784a7414bf57	%D8%B1%D9%8A%D8%AF-%D8%AA%D9%88%D8%A8%D8%A7%D9%83%D9%88-dhb-0368	ريد توباكو	Red Tobacco	DHB-0368	عطر فاخر بطابع تبغي، توابل، فانيلا، يتوازن مع لمسات دافئ، عود ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	26e988b4-46fb-4100-a190-0ed4a7d72d34	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	01a1d4f4-88ad-48e1-85ab-21ffed71a368	t	f	0	2026-07-16 15:19:10.032	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
e80beb5a-00f2-4ed2-8a1e-ea66794da288	%D8%B3%D8%A7%D9%86%D8%AA%D8%A7%D9%84-%D8%B1%D9%88%D9%8A%D8%A7%D9%84-dhb-0369	سانتال رويال	Guerlain Santal Royal	DHB-0369	عطر فاخر بطابع صندل، عود، ورد، يتوازن مع لمسات جلدي، عنبر ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	26e988b4-46fb-4100-a190-0ed4a7d72d34	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	fb43f478-f89b-4400-abf9-b6afe710b471	t	f	0	2026-07-16 15:19:13.993	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
4ae3aa41-93e7-4e06-80d8-c699daf343c9	%D8%B1%D8%A7%D9%84%D9%81-dhb-0101	رالف	Ralph Lauren Ralph	DHB-0101	عطر نسائي منعش ومبهج للغاية يفوح بنفحات أوراق التفاح الأخضر والماندرين الإيطالي مع باقة ناعمة من زهور الفريزيا والماغنوليا.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	fbcac733-ec30-45ab-afad-bed1b68c25e4	t	f	0	2026-07-16 15:05:28.183	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
3a2405e4-1dd2-409e-a24f-49ba13b0b0e6	%D8%A7%D9%86-%D9%88%D8%A7%D9%8A%D8%AA-dhb-0017	ان وايت	Elie Saab Le Parfum in White	DHB-0017	عطر نسائي مشرق وجذاب يفتتح بعبير زهر البرتقال والياسمين مع لمسة منعشة من التوت الأحمر وقاعدة مسكية فاخرة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	6363f08b-89b2-4c45-9d1e-4fec2a32b2ed	t	f	0	2026-07-16 15:01:17.296	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	0.49999999999999994
3e7bbc35-a560-42bc-8617-40a3cd74827a	%D8%A5%D9%8A%D9%85%D8%AC%D9%86%D9%8A%D8%B4%D9%86-dhb-0372	إيمجنيشن	Louis Vuitton Imagination	DHB-0372	عطر فاخر بطابع حمضي، شاي، زنجبيل، يتوازن مع لمسات أمبروكسان، طازج ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	55719cb3-2581-4ade-854f-d90e64e837ea	28c9117e-5e1b-489a-828e-9813acc326ff	a4592969-ead0-4e39-a7ee-88550efb0a63	t	f	0	2026-07-16 15:19:23.923	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
4f9d493f-bab8-4ea3-8cd4-bc152ea9a2a4	%D8%B1%D9%88%D8%B2-%D8%AF%D9%8A-%D9%81%D9%8A%D9%86%D9%88%D8%B3-dhb-0373	روز دي فينوس	Louis Vuitton Rose des Vents	DHB-0373	عطر فاخر بطابع ورد، سوسن، خشبي، يتوازن مع لمسات فلفلي، مسك ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	62d74b01-a106-4074-92a8-a56b4b99ab40	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	bff06f82-9427-4c1e-8112-185261c4178c	t	f	0	2026-07-16 15:19:27.947	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
dcf4d80c-05b3-48ee-976b-30eaf422b597	%D8%B3%D8%AA%D9%8A%D9%84%D8%B1-%D8%AA%D8%A7%D9%8A%D9%85-dhb-0374	ستيلر تايم	Louis Vuitton Stellar Times	DHB-0374	عطر فاخر بطابع عنبر، زهرة البرتقال، بلسم، يتوازن مع لمسات دافئ، مسك ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	f472cc49-84a5-4267-95bf-9e9b03db2a08	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	0f0a930a-cc39-45ae-b4f4-8f0e955443ac	t	f	0	2026-07-16 15:19:32.183	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
1d080ae5-5366-49eb-b607-62616c9038fc	%D8%A3%D9%81%D8%AA%D8%B1-%D9%86%D9%88%D9%86-%D8%B3%D9%88%D9%8A%D9%85-dhb-0375	أفتر نون سويم	Louis Vuitton Afternoon Swim	DHB-0375	عطر فاخر بطابع برتقال، حمضي، طازج، يتوازن مع لمسات زنجبيل، مائي ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	55719cb3-2581-4ade-854f-d90e64e837ea	28c9117e-5e1b-489a-828e-9813acc326ff	e08563fa-f126-4fc5-84ae-ba83b6623d84	t	f	0	2026-07-16 15:19:35.732	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
06e810f1-2dba-405a-ad71-9ebda8a08c80	%D9%85%D8%A7%D8%AA%D9%8A%D8%B1-%D9%86%D9%88%D8%A7%D8%B1-dhb-0376	ماتير نوار	Louis Vuitton Matiere Noire	DHB-0376	عطر فاخر بطابع عود، باتشولي، ورد، يتوازن مع لمسات فاكهي، دخاني ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	26e988b4-46fb-4100-a190-0ed4a7d72d34	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	124f771d-9390-4a09-8118-16b894768f96	t	f	0	2026-07-16 15:19:40.794	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
66215338-6427-4b49-a126-f132ba519439	%D8%A8%D9%8A%D8%BA%D8%A7%D8%B3%D9%88%D8%B3-dhb-0378	بيغاسوس	Parfums de Marly Pegasus	DHB-0378	عطر فاخر بطابع لوز، فانيلا، لافندر، يتوازن مع لمسات صندل، عنبر ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	f472cc49-84a5-4267-95bf-9e9b03db2a08	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	cb07ea0c-a695-422c-b4b6-905b32e28b99	t	f	0	2026-07-16 15:19:47.444	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
0d0b6b8d-4567-47be-840d-933fe96498cf	%D8%A3%D9%84%D8%AB%D9%8A%D8%B1-dhb-0379	ألثير	Parfums de Marly Althair	DHB-0379	عطر فاخر بطابع فانيلا، قرفة، زهرة البرتقال، يتوازن مع لمسات حلو، خشبي ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	62d74b01-a106-4074-92a8-a56b4b99ab40	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	b1af6c47-39d8-4528-b400-0c6c82e59727	t	f	0	2026-07-16 15:19:50.237	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
e3dc48a8-58da-4025-ad51-fe1a4db093c0	%D9%83%D8%A7%D8%B1%D9%85%D9%8A%D9%86%D8%A7-dhb-0409	كارمينا	Creed Carmina	DHB-0409	عطر فاخر بطابع كرز، ورد، زعفران، يتوازن مع لمسات عنبر، مسك ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	f472cc49-84a5-4267-95bf-9e9b03db2a08	2e1d252f-3122-489a-a44b-c687c07ef1a0	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	dfadab1d-d7cc-43a3-9163-7d6ce2a6940c	t	f	0	2026-07-16 15:21:34.248	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
ed9289e2-1605-4b32-882a-13022ad8d23f	%D9%84%D9%8A%D9%85%D9%88%D9%86-%D8%B4%D9%88%D8%BA%D8%B1-dhb-0356	ليمون شوغر	Kayali Capri Lemon Sugar	DHB-0356	عطر فاخر بطابع ليمون، سكر، حمضي، يتوازن مع لمسات فانيلا، طازج ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	75c01a70-9ecd-4d6e-9bcd-f59ac6c5bfc8	t	f	0	2026-07-16 15:18:27.552	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
cdff64c6-23d9-4f6b-8a82-597f9fe21252	%D8%AC%D8%B1%D8%A7%D9%86%D8%AF-%D8%A8%D8%A7%D9%84%D9%88-dhb-0357	جراند بالو	Xerjoff Casamorati Gran Ballo	DHB-0357	عطر فاخر بطابع فاكهي، أبيض زهري، كراميل، يتوازن مع لمسات فانيلا، عنبر ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	f472cc49-84a5-4267-95bf-9e9b03db2a08	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	8863dae1-d79b-44ee-8205-24347218db2d	t	f	0	2026-07-16 15:18:30.98	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
e9eaf761-89f7-4116-8ff3-8a129cd1bd69	%D8%AF%D9%84%D9%8A%D9%86%D8%A7-%D8%A5%D9%83%D8%B3%D9%83%D9%84%D9%88%D8%B3%D9%8A%D9%81-dhb-0380	دلينا إكسكلوسيف	Parfums de Marly Delina Exclusif	DHB-0380	عطر فاخر بطابع ورد، فاكهي، فانيلا، يتوازن مع لمسات عنبر، عود ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	26e988b4-46fb-4100-a190-0ed4a7d72d34	2e1d252f-3122-489a-a44b-c687c07ef1a0	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	ad0e4d7c-43d8-4b81-9c1b-53706f6c61c9	t	f	0	2026-07-16 15:19:53.73	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
a7336368-440f-4f4b-85cd-54066467d79a	%D8%AF%D9%84%D9%8A%D9%86%D8%A7-%D9%84%D8%A7-%D8%B1%D9%88%D8%B2%D9%8A%D9%87-dhb-0381	دلينا لا روزيه	Parfums de Marly Delina La Rosee	DHB-0381	عطر فاخر بطابع ورد، فاكهي، مائي، يتوازن مع لمسات مسك، طازج ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	2e1d252f-3122-489a-a44b-c687c07ef1a0	28c9117e-5e1b-489a-828e-9813acc326ff	52794348-26ce-4440-98b7-5d5db4f6a49f	t	f	0	2026-07-16 15:19:57.427	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
613da40e-cea6-49b4-a284-360b449c48fc	%D9%81%D8%A7%D9%84%D8%A7%D9%8A%D8%A7-dhb-0382	فالايا	Parfums de Marly Valaya	DHB-0382	عطر فاخر بطابع مسك، أبيض زهري، حمضي، يتوازن مع لمسات نظيف، خشبي ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	28c9117e-5e1b-489a-828e-9813acc326ff	6bd6c242-e39e-4234-b678-3d6a8fa85650	t	f	0	2026-07-16 15:20:01.232	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
38a49429-9679-4194-af1b-287261dd0258	%D8%B9%D9%88%D8%AF-%D8%A8%D9%85%D8%AE%D8%B1-dhb-0384	عود بمخر	Abdul Samad Al Qurashi Oud Mukhallat / Oud Bakhour	DHB-0384	عطر فاخر بطابع عود، دخاني، بخور، يتوازن مع لمسات عنبر، خشبي ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	26e988b4-46fb-4100-a190-0ed4a7d72d34	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	dccab504-3627-4507-995b-a7c0b3d49a19	t	f	0	2026-07-16 15:20:10.894	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
18fe0d89-f42c-4d10-8b5e-39be04ac3fd0	%D9%85%D8%B3%D9%83-%D9%85%D9%83%D8%A9-dhb-0389	مسك مكة	Arabian Musk Makkah	DHB-0389	عطر فاخر بطابع مسك، بودري، ورد، يتوازن مع لمسات عنبر، نظيف ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	f472cc49-84a5-4267-95bf-9e9b03db2a08	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	35ff6631-e19b-4710-ac71-e47effb275e4	t	f	0	2026-07-16 15:20:26.364	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
50db0df3-bac9-4680-988f-dee91ccc20a2	%D8%B9%D9%88%D8%AF-%D9%83%D9%85%D8%A8%D9%88%D8%AF%D9%8A-dhb-0390	عود كمبودي	Cambodian Oud	DHB-0390	عطر فاخر بطابع عود، دخاني، جلدي، يتوازن مع لمسات ترابي، أنيماليك ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	26e988b4-46fb-4100-a190-0ed4a7d72d34	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	70113ada-1fdc-4a6b-b28b-d1f877be1e8f	t	f	0	2026-07-16 15:20:29.663	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
d56709d5-6cf8-44a1-b2b8-51e398ded2b6	%D8%B9%D9%88%D8%AF-%D9%83%D8%A7%D8%AF%D9%8A%D9%86%D8%B2%D8%A7-dhb-0391	عود كادينزا	Maison Crivelli Oud Cadenza	DHB-0391	عطر فاخر بطابع عود، زعفران، جلدي، يتوازن مع لمسات دخاني، فاكهي ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	26e988b4-46fb-4100-a190-0ed4a7d72d34	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	70113ada-1fdc-4a6b-b28b-d1f877be1e8f	t	f	0	2026-07-16 15:20:32.853	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
358fa7bd-95ed-470f-b25e-edd42b7691c0	%D9%85%D8%B3-%D9%84%D8%A7%D9%81%D9%8A%D8%B1%D9%86-dhb-0392	مس لافيرن	Laverne Miss Laverne	DHB-0392	عطر فاخر بطابع زهري، فاكهي، مسك، يتوازن مع لمسات بودري، حلو ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	6363f08b-89b2-4c45-9d1e-4fec2a32b2ed	t	f	0	2026-07-16 15:20:35.775	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
f98acd25-867a-495a-8f2d-bc4bc3ca21f6	%D8%A8%D9%8A%D9%86%D8%A7%D9%83%D9%88-%D9%84%D8%A7%D8%AA%D9%8A%D9%87-dhb-0394	بيناكو لاتيه	Dahab Pinaco Latte	DHB-0394	عطر فاخر بطابع جوز الهند، قهوة، لبني، يتوازن مع لمسات فانيلا، أناناس ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	62d74b01-a106-4074-92a8-a56b4b99ab40	55719cb3-2581-4ade-854f-d90e64e837ea	3ef45d89-f354-4984-a4d8-308b605a9b0e	e3d56a18-cc20-48b5-b8c6-ffac045e0252	t	f	0	2026-07-16 15:20:43.995	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
26a5b7ba-78af-4733-9d28-16ffa0ed7c14	%D9%85%D8%B3%D9%83-%D8%A8%D9%84%D9%88%D8%A8%D8%B1%D9%8A-dhb-0395	مسك بلوبري	Abdul Samad Al Qurashi مسك بلوبري	DHB-0395	عطر فاخر بطابع توت أزرق، مسك، حلو، يتوازن مع لمسات فاكهي، نظيف ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	62d74b01-a106-4074-92a8-a56b4b99ab40	55719cb3-2581-4ade-854f-d90e64e837ea	3ef45d89-f354-4984-a4d8-308b605a9b0e	d9ed961b-792a-433f-ac3b-da42dc5d37d8	t	f	0	2026-07-16 15:20:47.674	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
ac55e1ba-d972-45e5-bc02-5f6b62d13b8c	%D9%85%D8%B3%D9%83-%D8%AE%D8%A7%D8%B5-dhb-0396	مسك خاص	Abdul Samad Al Qurashi مسك خاص	DHB-0396	عطر فاخر بطابع مسك، عنبر، نظيف، يتوازن مع لمسات بودري، خشبي ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	f472cc49-84a5-4267-95bf-9e9b03db2a08	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	ac963f59-2832-4f10-9e6d-d60b32fe1bd2	t	f	0	2026-07-16 15:20:51.962	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
588d6543-eef6-4d84-b019-4d7a8b9fba06	%D9%85%D8%B3%D9%83-%D9%81%D9%8A%D8%B1%D9%88%D8%B2-dhb-0397	مسك فيروز	Abdul Samad Al Qurashi مسك فيروز	DHB-0397	عطر فاخر بطابع مسك، أخضر، طازج، يتوازن مع لمسات زهري، نظيف ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	55719cb3-2581-4ade-854f-d90e64e837ea	28c9117e-5e1b-489a-828e-9813acc326ff	4d55cdec-8fb2-4fb6-86f1-ad87c6419fc3	t	f	0	2026-07-16 15:20:55.01	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
ceaf2c6b-9581-4aa3-8bf8-c1a48ebc9c9d	%D9%85%D8%B3%D9%83-%D8%A7%D9%84%D8%B1%D9%85%D8%A7%D9%86-dhb-0398	مسك الرمان	Abdul Samad Al Qurashi مسك الرمان	DHB-0398	عطر فاخر بطابع رمان، مسك، فاكهي، يتوازن مع لمسات حلو، نظيف ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	62d74b01-a106-4074-92a8-a56b4b99ab40	55719cb3-2581-4ade-854f-d90e64e837ea	3ef45d89-f354-4984-a4d8-308b605a9b0e	70bfade4-b5e9-44f3-b21f-c56783b9049e	t	f	0	2026-07-16 15:20:58.438	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
ce703ce1-3441-4664-ab0c-3927ecd896ee	%D9%85%D8%B3%D9%83-%D9%81%D8%B1%D9%8A%D8%B2%D8%A7-dhb-0399	مسك فريزا	Abdul Samad Al Qurashi مسك فريزا	DHB-0399	عطر فاخر بطابع فراولة، مسك، حلو، يتوازن مع لمسات فاكهي، نظيف ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	62d74b01-a106-4074-92a8-a56b4b99ab40	55719cb3-2581-4ade-854f-d90e64e837ea	3ef45d89-f354-4984-a4d8-308b605a9b0e	d9ed961b-792a-433f-ac3b-da42dc5d37d8	t	f	0	2026-07-16 15:21:01.687	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
2d3f30fc-b13c-40a9-a0d2-38d75e20d311	%D9%85%D8%B3%D9%83-%D8%A3%D8%A8%D9%8A%D8%B6-dhb-0403	مسك أبيض	Abdul Samad Al Qurashi مسك أبيض	DHB-0403	عطر فاخر بطابع مسك، نظيف، بودري، يتوازن مع لمسات صابون، زهري ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	55719cb3-2581-4ade-854f-d90e64e837ea	3ef45d89-f354-4984-a4d8-308b605a9b0e	4d55cdec-8fb2-4fb6-86f1-ad87c6419fc3	t	f	0	2026-07-16 15:21:14.669	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
bcea55b8-babc-478c-9227-12b955a6fab1	%D9%85%D8%B3%D9%83-%D9%8A%D8%A7%D8%B3%D9%85%D9%8A%D9%86-dhb-0404	مسك ياسمين	Abdul Samad Al Qurashi مسك ياسمين	DHB-0404	عطر فاخر بطابع ياسمين، مسك، أبيض زهري، يتوازن مع لمسات نظيف، بودري ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	55719cb3-2581-4ade-854f-d90e64e837ea	3ef45d89-f354-4984-a4d8-308b605a9b0e	4d55cdec-8fb2-4fb6-86f1-ad87c6419fc3	t	f	0	2026-07-16 15:21:18.018	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
a1caa491-6ddc-4a60-8b8c-07666adfee35	%D9%85%D8%B3%D9%83-%D8%A3%D8%B3%D9%88%D8%AF-dhb-0405	مسك أسود	Abdul Samad Al Qurashi مسك أسود	DHB-0405	عطر فاخر بطابع مسك، جلدي، عنبر، يتوازن مع لمسات دخاني، خشبي ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	f472cc49-84a5-4267-95bf-9e9b03db2a08	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	36dc0045-2317-42f2-a223-a3f201d9992b	t	f	0	2026-07-16 15:21:20.956	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
dcb4c4c5-203c-451c-998c-888362091608	%D8%A8%D9%83%D8%B1%D8%A7%D8%AA-%D8%B1%D9%88%D8%AC-dhb-0407	بكرات روج	Maison Francis Kurkdjian Baccarat Rouge 540	DHB-0407	عطر فاخر بطابع عنبر، زعفران، أبيض زهري، يتوازن مع لمسات خشبي، حلو ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	f472cc49-84a5-4267-95bf-9e9b03db2a08	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	fd7aae23-8a11-4fc6-af84-4c835c186a15	t	f	0	2026-07-16 15:21:27.682	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
f1abe8c4-7e7c-4039-b6aa-a2a200e93f63	%D9%87%D8%A7%D9%84%D9%81%D9%8A%D8%AA%D9%8A-%D9%84%D9%8A%D8%B0%D8%B1-dhb-0467	هالفيتي ليذر	Penhaligon's Halfeti Leather	DHB-0467	عطر فاخر بطابع جلدي، عود، توابل، يتوازن مع لمسات ورد، خشبي ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	26e988b4-46fb-4100-a190-0ed4a7d72d34	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	9ff688bd-23b1-40ac-80d4-5130fc2fc711	t	f	0	2026-07-16 15:24:37.97	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
7fb0586a-3b27-4739-95ab-ed541c327bec	%D8%A3%D9%86%D8%AC%D9%84%D8%B2-%D8%B4%D9%8A%D8%B1-dhb-0468	أنجلز شير	Kilian Angels' Share	DHB-0468	عطر فاخر بطابع كحوليات، قرفة، فانيلا، يتوازن مع لمسات برالين، خشبي ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	62d74b01-a106-4074-92a8-a56b4b99ab40	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	b1af6c47-39d8-4528-b400-0c6c82e59727	t	f	0	2026-07-16 15:24:41.012	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
0cc2d0a1-fc44-49fe-a751-4ed9acbf843f	%D9%84%D9%88%D9%81-%D8%AF%D9%8A%D9%84%D8%A7%D9%8A%D8%AA-dhb-0469	لوف ديلايت	Amouage Love Delight	DHB-0469	عطر فاخر بطابع زنجبيل، كاكاو، فانيلا، يتوازن مع لمسات ورد، حلو ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	62d74b01-a106-4074-92a8-a56b4b99ab40	2e1d252f-3122-489a-a44b-c687c07ef1a0	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	633eb004-96b4-4c8d-80e3-90509bd490ae	t	f	0	2026-07-16 15:24:44.302	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
e3c7168b-1c5b-403d-a279-4230f2ccdb83	%D9%84%D9%8A-%D9%84%D9%8A%D9%88%D9%86-dhb-0470	لي ليون	Chanel Le Lion de Chanel	DHB-0470	عطر فاخر بطابع عنبر، راتنجي، فانيلا، يتوازن مع لمسات جلدي، باتشولي ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	f472cc49-84a5-4267-95bf-9e9b03db2a08	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	81a5c807-3887-4884-8673-f92ac5255d1b	t	f	0	2026-07-16 15:24:47.267	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
29dc7089-a615-475c-b033-a0fd4a59a599	%D8%B3%D8%A7%D9%81%D8%A7-dhb-0408	سافا	Qissa Niche Sava	DHB-0408	عطر فاخر بطابع عنبر، خشبي، فانيلا، يتوازن مع لمسات مسك، دافئ ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	f472cc49-84a5-4267-95bf-9e9b03db2a08	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	5e9f5dd2-e432-4d90-8473-c0a5f4d3d633	t	f	0	2026-07-16 15:21:30.583	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
30f6719f-41b5-4f60-80d2-afa6b2ccbf1f	%D8%A3%D9%81%D9%86%D8%AA%D9%88%D8%B3-%D9%87%D9%8A%D8%B1-dhb-0410	أفنتوس هير	Creed Aventus for Her	DHB-0410	عطر فاخر بطابع تفاح، فاكهي، ورد، يتوازن مع لمسات مسك، باتشولي ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	62d74b01-a106-4074-92a8-a56b4b99ab40	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	68dce486-15a5-41b7-801b-7a51839e6718	t	f	0	2026-07-16 15:21:36.672	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
f22ca276-9e1c-4865-8703-95e1ef0fce2f	%D9%83%D8%B1%D9%8A%D8%AF-%D8%A3%D9%81%D9%86%D8%AA%D9%88%D8%B3-dhb-0411	كريد أفنتوس	Creed Aventus	DHB-0411	عطر فاخر بطابع أناناس، خشبي، مسك، يتوازن مع لمسات فاكهي، شيبر ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	62d74b01-a106-4074-92a8-a56b4b99ab40	92fcd610-5dfa-489c-a894-ce8e7687c361	28c9117e-5e1b-489a-828e-9813acc326ff	73c34ac6-4246-4c15-8fd4-2fbe1980a2cd	t	f	0	2026-07-16 15:21:39.547	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
3df80641-667c-4a5f-8475-d64c8c46683a	%D8%A3%D9%81%D9%86%D8%AA%D9%88%D8%B3-%D8%A3%D8%A8%D8%B3%D9%88%D9%84%D9%88-dhb-0412	أفنتوس أبسولو	Creed Absolu Aventus	DHB-0412	عطر فاخر بطابع حمضي، توابل، خشبي، يتوازن مع لمسات باتشولي، فاكهي ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	28c9117e-5e1b-489a-828e-9813acc326ff	3e8e153b-547e-494a-b8d2-66e9f0bbd06d	t	f	0	2026-07-16 15:21:43.137	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
d8a92854-1023-4459-aab1-a174a062c549	%D8%AA%D9%88%D9%83%D8%B3%D9%8A%D8%AF%D9%88-dhb-0413	توكسيدو	Yves Saint Laurent Tuxedo	DHB-0413	عطر فاخر بطابع باتشولي، عنبر، توابل، يتوازن مع لمسات فانيلا، ورد ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	f472cc49-84a5-4267-95bf-9e9b03db2a08	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	9f9bac48-7427-4be5-b6dd-96c385132db0	t	f	0	2026-07-16 15:21:46.316	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
3249d1f8-95ac-4efb-a19a-c07713861354	%D8%A7%D8%B1%D9%85%D8%A7%D9%86%D9%8A-%D9%83%D9%88%D8%AF-dhb-0189	ارماني كود	Giorgio Armani Armani Code Men	DHB-0189	عطر رجالي شرقي فخم يمزج بنعومة بين انتعاش البرغموت وحرارة اليانسون النجمي مع قلب من زهور الزيتون وقاعدة دافئة من الجلود والتبغ والتونكا.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	91c400b3-ea89-4f70-85f7-9705f51b39a0	t	f	0	2026-07-16 15:09:48.878	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
749a3306-63b0-421e-8157-12afca50f3ef	%D8%A7%D9%84%D9%88%D8%B1-%D8%B4%D8%A7%D9%86%D9%8A%D9%84-dhb-0009	الور شانيل	Chanel Allure for Women	DHB-0009	عطر نسائي راقي يتميز بتوليفة زهرية فاكهية غنية بعبير الياسمين والدراق وقاعدة بودرية دافئة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	ea599b27-346d-403e-bff1-ea3e02dcbc88	t	f	0	2026-07-16 15:00:47.818	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	0.8
ba3c5310-aef4-4e3e-a66d-4beca03968d7	%D8%A7%D9%86%D8%AC-%D8%AF%D9%8A-%D9%85%D9%88%D9%86-dhb-0015	انج دي مون	Givenchy Ange ou Demon	DHB-0015	عطر نسائي غامض وجذاب يجمع بين نقاء الزهور البيضاء ودفء التوابل الشرقية وقاعدة غنية بالفانيلا الناعمة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	588c48fd-2dbe-4265-9d9e-c188e4c79685	t	f	0	2026-07-16 15:01:10.051	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	0.8
8fb5c757-d7cf-4a44-8707-24c27f54263b	%D8%A8%D9%88%D9%84%D8%BA%D8%A7%D8%B1%D9%8A-%D9%85%D8%A7%D9%86-%D8%A8%D9%84%D8%A7%D9%83-dhb-0222	بولغاري مان بلاك	Bvlgari Man In Black	DHB-0222	عطر رجالي شرقي فخم يتميز بتوليفة مكثفة تجمع بين نكهة الرم والتبغ وحرارة التوابل مع قلب من السوسن البودري وقاعدة جلدية دافئة وثابتة.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	0724bb7a-19f7-4c2e-bce7-2a7495adc482	t	f	0	2026-07-16 15:11:22.585	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
90538320-a765-48ba-b11e-39517b851ff8	%D8%A8%D9%88%D9%84%D8%BA%D8%A7%D8%B1%D9%8A-%D8%AA%D8%A7%D9%8A%D8%AC%D8%B1-dhb-0227	بولغاري تايجر	Bvlgari Le Gemme Tygar	DHB-0227	عطر رجالي حمضي خشبي منعش للغاية يجمع بنقاء بين حيوية الجريب فروت وحرارة الزنجبيل مع قاعدة ترابية فاخرة من خشب الأرز والأمبروكسان.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	86379d33-5d24-4ec2-9f04-2818a627bfa4	t	f	0	2026-07-16 15:11:37.055	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
ea726d02-55d5-4257-885f-7cfafa201f43	%D8%AC%D9%88%D8%AA%D8%B4%D9%8A-%D8%A8%D8%A7%D9%8A-dhb-0240	جوتشي باي	Gucci by Gucci Pour Homme	DHB-0240	عطر رجالي خشبي دافئ يفيض بالفخامة والرجولة، يمزج بين أوراق السرو والبنفسج ونفحات التبغ والجلود مع قاعدة ترابية غنية من الباتشولي والعنبر.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	05612fd2-46d5-4d0c-bdb0-1f93ffc0fd34	t	f	0	2026-07-16 15:12:17.205	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
57b46ceb-25cc-4199-8012-5bc765717a84	%D8%AF%D9%86%D9%87%D9%84-%D8%A7%D9%8A%D9%83%D9%88%D9%86-dhb-0253	دنهل ايكون	Alfred Dunhill Icon	DHB-0253	عطر رجالي فخم يمزج بنقاء بين انتعاش النيرولي والبرغموت وحرارة الفلفل الأسود والهيل مع قاعدة خشبية راقية من نجيل الهند والعود والجلود.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	24f64784-fb23-41ae-a0d3-bbe52d8b3c33	t	f	0	2026-07-16 15:12:55.538	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
a91ae67a-695a-4cdc-a537-753e7469182d	%D8%AF%D9%8A%D9%88%D8%B1-%D9%87%D9%88%D9%85-%D8%A7%D9%86%D8%AA%D8%B3-dhb-0265	ديور هوم انتس	Dior Homme Intense	DHB-0265	عطر رجالي شرقي فخم للغاية ذو طابع بودري ساحر، يرتكز على فخامة زهرة السوسن واللافندر مع حلاوة الكمثرى وقاعدة دافئة من خشب الأرز والمسك.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	83fb1561-91af-4138-8656-180dddc9381a	t	f	0	2026-07-16 15:13:29.353	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
7845df49-d2ec-4e83-8e71-ac3a4a210ffa	%D8%B3%D9%88%D9%81%D8%A7%D8%AC-%D8%A8%D9%8A%D8%B1%D9%81%D9%8A%D9%88%D9%85-dhb-0273	سوفاج بيرفيوم	Dior Sauvage Parfum	DHB-0273	عطر رجالي شرقي فخم يتميز بتركيزه العالي ونبرته الدافئة، يجمع بين نضارة الماندرين والبرغموت وقاعدة كريمية غنية من خشب الصندل والفانيلا.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	86895f97-0f1b-4820-8fda-c94f4ee76a9a	t	f	0	2026-07-16 15:13:54.567	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
e2f40d3e-b803-4edb-bee2-6b8a89aafca9	%D8%B3%D9%84%D9%81%D8%B1-%D8%B3%D9%86%D8%AA-dhb-0277	سلفر سنت	Jacques Bogart Silver Scent	DHB-0277	عطر رجالي شرقي حلو وشهير للغاية بقوته وثباته، يمزج بين عبير زهر البرتقال واللافندر وحلاوة ثمار الليتشي مع قاعدة دافئة من التونكا.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	bc6bff2b-1732-4a17-8d4a-da03e4ddf6cf	t	f	0	2026-07-16 15:14:06.724	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
654b5cd7-b1d8-478e-8930-7b1e302fd1ad	%D9%88%D8%A7%D9%8A-%D8%A7%D9%86%D8%AA%D8%B3-dhb-0288	واي انتس	Y Eau de Parfum Intense Yves Saint Laurent	DHB-0288	عطر رجالي أروماتك مكثف يتميز بنضارة الزنجبيل والبرغموت وعبير ثمار العرعر واللافندر مع قاعدة خشبية دافئة وثابتة من الباتشولي والأرز.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	034d7a73-0d34-4beb-8224-407917b71783	t	f	0	2026-07-16 15:14:39.147	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
2a992096-8c7a-41dd-98a7-2687949b3154	%D8%A7%D9%83%D9%88%D8%A7-%D8%AF%D9%8A-%D8%AC%D9%8A%D9%88-%D8%A7%D9%84%D9%83%D8%B3%D9%8A%D8%B1-dhb-0289	اكوا دي جيو الكسير	Giorgio Armani Acqua Di Gio Profondo Elixir	DHB-0289	عطر رجالي صيفي منعش للغاية بتركيز مكثف، يمزج بين برودة النوتات البحرية المالحة وعبير اللافندر مع قاعدة ترابية دافئة من الباتشولي والراتنجات.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	6cdeafd0-e664-4bfe-b733-6f647bc84640	t	f	0	2026-07-16 15:14:42.465	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
99c569c0-af20-41ab-9b5a-6274d66d1523	%D9%83%D8%A7%D8%B1%D8%AA%D9%8A%D8%B1-%D8%AF%D9%83%D9%84%D8%A7%D8%B1%D9%8A%D8%B4%D9%86-dhb-0301	كارتير دكلاريشن	Cartier Declaration	DHB-0301	عطر رجالي شرقي حار يتميز بنضارة البرتقال المر وحرارة الهيل والزنجبيل والكزبرة مع قاعدة خشبية فاخرة وثابتة من نجيل الهند والأرز.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	b5f9df0a-3e4c-4219-81eb-e0c48141efe5	t	f	0	2026-07-16 15:15:18.32	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
c67a4772-cded-4c6c-bd23-921fbc166095	%D9%84%D8%A7%D9%83%D9%88%D8%B3%D8%AA-%D8%A7%D8%B3%D9%86%D8%B4%D9%84-dhb-0314	لاكوست اسنشل	Lacoste Essential	DHB-0314	عطر رجالي صيفي منعش للغاية ومميز بنوتة عشبية، يفوح بعبير أوراق الطماطم الخضراء والماندرين مع قلب وردي حار وقاعدة من خشب الصندل.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	80639e5a-992e-4d2e-942f-1473278ec37b	t	f	0	2026-07-16 15:15:58.681	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
96d43657-16d4-4e26-90e8-c2646ed26442	%D8%A7%D8%B3%D9%86%D8%B4%D9%84-%D8%B3%D8%A8%D9%88%D8%B1%D8%AA-dhb-0315	اسنشل سبورت	Lacoste Essential Sport	DHB-0315	عطر رجالي رياضي بارد ومنعش للغاية، يمزج بين انتعاش النوتات البحرية وحموضة الجريب فروت وحرارة الزنجبيل وقاعدة مسكية ناعمة وثابتة.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	fabf7ff5-e5e3-4295-a7fd-a40d1d9cf116	t	f	0	2026-07-16 15:16:02.101	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
f42e1ed8-624f-43e1-b3e7-ab7b2de15f4c	%D9%87%D9%88%D8%AA-%D9%88%D9%88%D8%AA%D8%B1-dhb-0323	هوت ووتر	Davidoff Hot Water	DHB-0323	عطر رجالي شرقي حار يتميز بلونه الأحمر الدافئ، يمزج بين حيوية الريحان الأحمر وحرارة الفلفل الحار والجاوي وقاعدة ترابية غنية من الباتشولي.	\N	ea324c79-43e4-4750-8b5f-8c30f78b159e	92fcd610-5dfa-489c-a894-ce8e7687c361	3ef45d89-f354-4984-a4d8-308b605a9b0e	825d1052-989d-47c2-8af4-9e113a5d75d9	t	f	0	2026-07-16 15:16:31.141	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
9e99faab-0dc6-4609-9d21-399ad41cbd4c	%D9%81%D9%8A%D8%B1%D8%AA-%D9%85%D8%A7%D9%84%D8%A7%D9%83%D8%A7%D9%8A%D8%AA-dhb-0338	فيرت مالاكايت	Giorgio Armani Vert Malachite	DHB-0338	عطر فاخر بطابع أبيض زهري، كريمي، فانيلا، يتوازن مع لمسات أخضر، زهرة البرتقال ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	3875d144-bed6-4f94-8383-049aaa6c59bd	2e1d252f-3122-489a-a44b-c687c07ef1a0	3ef45d89-f354-4984-a4d8-308b605a9b0e	9826b3c3-abcd-4200-8f87-51565386e59e	t	f	0	2026-07-16 15:17:19.595	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
daa86be6-7e10-4c4f-80d6-38bdd01adc39	%D9%81%D8%A7%D9%86%D9%8A%D9%84%D8%A7-28-dhb-0353	فانيلا 28	Kayali Vanilla 28	DHB-0353	عطر فاخر بطابع فانيلا، سكر، عنبر، يتوازن مع لمسات مسك، دافئ ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	f472cc49-84a5-4267-95bf-9e9b03db2a08	2e1d252f-3122-489a-a44b-c687c07ef1a0	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	d6eb6693-8afb-4f66-8e7e-602c14ebee8f	t	f	0	2026-07-16 15:18:13.71	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
76783e87-3b7f-410f-8560-13535cbd0431	%D9%83%D9%88%D9%81%D9%8A-%D8%B9%D9%88%D8%AF-%D8%A5%D9%86%D8%AA%D9%86%D8%B3-dhb-0370	كوفي عود إنتنس	Mancera Coffee Oud Intense	DHB-0370	عطر فاخر بطابع قهوة، عود، ورد، يتوازن مع لمسات فانيلا، مسك ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	26e988b4-46fb-4100-a190-0ed4a7d72d34	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	33d0212c-bc66-4110-a35f-e63a5f349765	t	f	0	2026-07-16 15:19:17.471	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
3f3738dc-5461-4fa6-b08d-30878345c90e	%D8%A7%D9%84%D8%B1%D8%B3%D8%A7%D9%84%D8%A9-dhb-0385	الرسالة	Arabian Oud Al Resala	DHB-0385	عطر فاخر بطابع عود، ورد، عنبر، يتوازن مع لمسات زعفران، مسك ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	26e988b4-46fb-4100-a190-0ed4a7d72d34	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	c37cd5a4-143d-44da-812a-57e4bd4816ff	t	f	0	2026-07-16 15:20:13.525	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
ba4a47a1-5195-4b55-ab53-960b38e29435	%D8%B3%D9%88%D9%8A%D8%AA-%D8%A8%D9%86%D8%A7%D9%86%D8%A7-dhb-0393	سويت بنانا	Kayali Yum Boujee Marshmallow / Sweet Banana	DHB-0393	عطر فاخر بطابع موز، حلو، فانيلا، يتوازن مع لمسات فاكهي، مسك ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	62d74b01-a106-4074-92a8-a56b4b99ab40	2e1d252f-3122-489a-a44b-c687c07ef1a0	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	122acbbd-210d-450b-83e2-d11823326529	t	f	0	2026-07-16 15:20:40.346	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
7680f8c2-f9ee-4eff-a195-a4e78315d8bc	%D9%85%D8%B3%D9%83-%D8%AF%D9%87%D8%A8-dhb-0400	مسك دهب	Abdul Samad Al Qurashi مسك دهب	DHB-0400	عطر فاخر بطابع مسك، عنبر، فانيلا، يتوازن مع لمسات بودري، دافئ ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	f472cc49-84a5-4267-95bf-9e9b03db2a08	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	850e8a1c-9dd3-415a-8c5e-a3d987ad16aa	t	f	0	2026-07-16 15:21:05.28	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
69ef4e63-1dfe-4f48-bc6d-47bdb7216ad9	%D9%85%D8%B3%D9%83-%D9%81%D8%A7%D9%86%D9%8A%D9%84%D8%A7-dhb-0402	مسك فانيلا	Abdul Samad Al Qurashi مسك فانيلا	DHB-0402	عطر فاخر بطابع فانيلا، مسك، حلو، يتوازن مع لمسات بودري، دافئ ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	62d74b01-a106-4074-92a8-a56b4b99ab40	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	05cf46cf-7015-4d9b-869c-05921c43327f	t	f	0	2026-07-16 15:21:11.994	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
250519ff-2f1e-4009-8d48-c75d79f59f8f	%D9%83%D9%88%D9%86%D8%B3%D8%AA%D8%A7%D9%86%D8%B3-dhb-0415	كونستانس	Penhaligon's The Bewitching Yasmine / Changing Constance	DHB-0415	عطر فاخر بطابع كراميل، تبغي، فانيلا، يتوازن مع لمسات دافئ، توابل ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	f472cc49-84a5-4267-95bf-9e9b03db2a08	55719cb3-2581-4ade-854f-d90e64e837ea	9d676753-b84f-4ef7-84b8-1ec160e8e9a7	b8c01dd7-8415-4eee-979c-e5796ed63357	t	f	0	2026-07-16 15:21:55.104	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
ec139ac4-3c74-406b-816b-c347b1f2ad75	%D8%A8%D8%A7%D9%84-%D8%AF%D9%8A-%D8%A3%D9%81%D8%B1%D9%8A%D9%83-dhb-0445	بال دي أفريك	Byredo Bal d'Afrique	DHB-0445	عطر فاخر بطابع حمضي، فيتيفر، مسك، يتوازن مع لمسات عنبر، زهري ليعطي حضوراً واضحاً وبصمة عطرية أنيقة.	\N	f472cc49-84a5-4267-95bf-9e9b03db2a08	55719cb3-2581-4ade-854f-d90e64e837ea	3ef45d89-f354-4984-a4d8-308b605a9b0e	c2177830-fb30-41cb-a511-86dc819ab57f	t	f	0	2026-07-16 15:23:27.65	2026-07-19 15:18:35.413	f	\N	VERIFIED	VERIFIED	1
\.


--
-- Data for Name: ProductAccord; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductAccord" ("productId", "accordId", value, "order") FROM stdin;
da07c0cc-32ce-4700-be29-b45490da697f	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	95	1
da07c0cc-32ce-4700-be29-b45490da697f	d4cf402c-1804-4bfc-af25-6b60196102a1	85	2
da07c0cc-32ce-4700-be29-b45490da697f	e41bfae9-b3a5-4661-a420-290d6c27da35	80	3
da07c0cc-32ce-4700-be29-b45490da697f	e3fea1ab-20c7-45c0-8be6-0538353d16b3	75	4
da07c0cc-32ce-4700-be29-b45490da697f	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	70	5
8d4029da-96d1-4eec-8b78-6762b4ff7f82	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	90	1
8d4029da-96d1-4eec-8b78-6762b4ff7f82	1626400a-0417-4ff8-bfed-d89ef198074f	85	2
8d4029da-96d1-4eec-8b78-6762b4ff7f82	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	80	3
8d4029da-96d1-4eec-8b78-6762b4ff7f82	10a93b7f-37f4-470c-a39e-e442b5437113	75	4
8d4029da-96d1-4eec-8b78-6762b4ff7f82	1c54233e-0ea1-46d3-b0be-0c74fc14ddb2	70	5
78efa338-9c4f-4fb2-b9ce-c6764f91adea	6a657f15-2638-4401-a4cb-1cb3d78446be	95	1
78efa338-9c4f-4fb2-b9ce-c6764f91adea	89219724-7107-4ccf-9ccf-bb20d439a10f	85	2
78efa338-9c4f-4fb2-b9ce-c6764f91adea	58174674-9bd1-4df8-8c10-9a50cd10b947	80	3
78efa338-9c4f-4fb2-b9ce-c6764f91adea	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	75	4
78efa338-9c4f-4fb2-b9ce-c6764f91adea	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
e6ded678-e1f9-4fb6-9a91-62bff43db19f	6a657f15-2638-4401-a4cb-1cb3d78446be	95	1
e6ded678-e1f9-4fb6-9a91-62bff43db19f	89219724-7107-4ccf-9ccf-bb20d439a10f	85	2
e6ded678-e1f9-4fb6-9a91-62bff43db19f	58174674-9bd1-4df8-8c10-9a50cd10b947	80	3
e6ded678-e1f9-4fb6-9a91-62bff43db19f	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	75	4
e6ded678-e1f9-4fb6-9a91-62bff43db19f	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
48effdc1-6343-4a8e-aca2-101fe013fd72	6a657f15-2638-4401-a4cb-1cb3d78446be	95	1
48effdc1-6343-4a8e-aca2-101fe013fd72	d4cf402c-1804-4bfc-af25-6b60196102a1	85	2
48effdc1-6343-4a8e-aca2-101fe013fd72	10a93b7f-37f4-470c-a39e-e442b5437113	80	3
48effdc1-6343-4a8e-aca2-101fe013fd72	89219724-7107-4ccf-9ccf-bb20d439a10f	75	4
48effdc1-6343-4a8e-aca2-101fe013fd72	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	70	5
04a92a24-3e48-4d18-8d47-1b4d07ac827f	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	80	3
04a92a24-3e48-4d18-8d47-1b4d07ac827f	e3fea1ab-20c7-45c0-8be6-0538353d16b3	75	4
04a92a24-3e48-4d18-8d47-1b4d07ac827f	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	70	5
a3c1e88a-5ac7-4bb9-80bb-6e8b07d07060	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	95	1
bafb0778-bd98-4348-ba4b-a3c4e82431de	e41bfae9-b3a5-4661-a420-290d6c27da35	95	1
bafb0778-bd98-4348-ba4b-a3c4e82431de	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	85	2
bafb0778-bd98-4348-ba4b-a3c4e82431de	e3fea1ab-20c7-45c0-8be6-0538353d16b3	80	3
bafb0778-bd98-4348-ba4b-a3c4e82431de	6a657f15-2638-4401-a4cb-1cb3d78446be	75	4
bafb0778-bd98-4348-ba4b-a3c4e82431de	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
60cc4b18-0c60-48f9-b316-63ff370b385c	e41bfae9-b3a5-4661-a420-290d6c27da35	95	1
60cc4b18-0c60-48f9-b316-63ff370b385c	32b8ae1f-2a7e-4065-bea2-6392a15348c5	85	2
60cc4b18-0c60-48f9-b316-63ff370b385c	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	80	3
60cc4b18-0c60-48f9-b316-63ff370b385c	e3fea1ab-20c7-45c0-8be6-0538353d16b3	75	4
60cc4b18-0c60-48f9-b316-63ff370b385c	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
7ab5fa67-e6ab-4f39-8866-a4428bbfaa0b	e3fea1ab-20c7-45c0-8be6-0538353d16b3	95	1
7ab5fa67-e6ab-4f39-8866-a4428bbfaa0b	65f3f958-a668-479f-83aa-f2b0b9bb8236	85	2
7ab5fa67-e6ab-4f39-8866-a4428bbfaa0b	89219724-7107-4ccf-9ccf-bb20d439a10f	80	3
7ab5fa67-e6ab-4f39-8866-a4428bbfaa0b	71232d6e-c5b8-4c28-89df-276a5f6aeb7d	75	4
7ab5fa67-e6ab-4f39-8866-a4428bbfaa0b	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
d5eee1e4-a2d3-4ee6-b859-3f86e722d166	65f3f958-a668-479f-83aa-f2b0b9bb8236	95	1
d5eee1e4-a2d3-4ee6-b859-3f86e722d166	e3fea1ab-20c7-45c0-8be6-0538353d16b3	85	2
d5eee1e4-a2d3-4ee6-b859-3f86e722d166	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	80	3
d5eee1e4-a2d3-4ee6-b859-3f86e722d166	89219724-7107-4ccf-9ccf-bb20d439a10f	75	4
d5eee1e4-a2d3-4ee6-b859-3f86e722d166	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
72d1e17a-edc0-463b-a895-8c4f442b3c5e	16f221cc-38cc-4dc0-8a26-1cff4bc731db	95	1
72d1e17a-edc0-463b-a895-8c4f442b3c5e	65f3f958-a668-479f-83aa-f2b0b9bb8236	85	2
72d1e17a-edc0-463b-a895-8c4f442b3c5e	e3fea1ab-20c7-45c0-8be6-0538353d16b3	80	3
72d1e17a-edc0-463b-a895-8c4f442b3c5e	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	75	4
72d1e17a-edc0-463b-a895-8c4f442b3c5e	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
63da88db-96e9-458b-ad10-10d9d0206609	16f221cc-38cc-4dc0-8a26-1cff4bc731db	90	1
63da88db-96e9-458b-ad10-10d9d0206609	65f3f958-a668-479f-83aa-f2b0b9bb8236	85	2
63da88db-96e9-458b-ad10-10d9d0206609	e3fea1ab-20c7-45c0-8be6-0538353d16b3	80	3
63da88db-96e9-458b-ad10-10d9d0206609	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	75	4
63da88db-96e9-458b-ad10-10d9d0206609	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
cda6797a-59e1-40d2-a514-6844b8a36b91	65f3f958-a668-479f-83aa-f2b0b9bb8236	95	1
cda6797a-59e1-40d2-a514-6844b8a36b91	e3fea1ab-20c7-45c0-8be6-0538353d16b3	85	2
cda6797a-59e1-40d2-a514-6844b8a36b91	71232d6e-c5b8-4c28-89df-276a5f6aeb7d	80	3
cda6797a-59e1-40d2-a514-6844b8a36b91	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	75	4
cda6797a-59e1-40d2-a514-6844b8a36b91	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	70	5
85e52a66-84c6-48ee-9eab-d648b3aa68ce	65f3f958-a668-479f-83aa-f2b0b9bb8236	95	1
85e52a66-84c6-48ee-9eab-d648b3aa68ce	e3fea1ab-20c7-45c0-8be6-0538353d16b3	85	2
85e52a66-84c6-48ee-9eab-d648b3aa68ce	6a657f15-2638-4401-a4cb-1cb3d78446be	80	3
85e52a66-84c6-48ee-9eab-d648b3aa68ce	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	75	4
85e52a66-84c6-48ee-9eab-d648b3aa68ce	71232d6e-c5b8-4c28-89df-276a5f6aeb7d	70	5
74752fc6-8ebb-4939-a83f-cb2d34f9d687	e3fea1ab-20c7-45c0-8be6-0538353d16b3	90	1
1e57282b-dc0e-479f-9d2a-3d37929477bb	89219724-7107-4ccf-9ccf-bb20d439a10f	95	1
1e57282b-dc0e-479f-9d2a-3d37929477bb	e3fea1ab-20c7-45c0-8be6-0538353d16b3	85	2
6ac269ec-1522-4180-8e5d-47d1243fac64	89219724-7107-4ccf-9ccf-bb20d439a10f	95	1
6ac269ec-1522-4180-8e5d-47d1243fac64	58174674-9bd1-4df8-8c10-9a50cd10b947	90	2
6ac269ec-1522-4180-8e5d-47d1243fac64	32b8ae1f-2a7e-4065-bea2-6392a15348c5	85	3
6ac269ec-1522-4180-8e5d-47d1243fac64	10a93b7f-37f4-470c-a39e-e442b5437113	75	4
6ac269ec-1522-4180-8e5d-47d1243fac64	f1fb6be8-89b9-4f13-b609-6a3565dd92b3	70	5
d6219858-a813-4275-83fd-e0dc53e505b1	d4cf402c-1804-4bfc-af25-6b60196102a1	95	1
d6219858-a813-4275-83fd-e0dc53e505b1	89219724-7107-4ccf-9ccf-bb20d439a10f	90	2
d6219858-a813-4275-83fd-e0dc53e505b1	3141f563-5039-48a5-a7f1-eac9c29e38ba	80	3
d6219858-a813-4275-83fd-e0dc53e505b1	10a93b7f-37f4-470c-a39e-e442b5437113	75	4
d6219858-a813-4275-83fd-e0dc53e505b1	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
33b2e338-22d7-4c7e-983c-dad575a28c34	3141f563-5039-48a5-a7f1-eac9c29e38ba	95	1
33b2e338-22d7-4c7e-983c-dad575a28c34	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	85	2
33b2e338-22d7-4c7e-983c-dad575a28c34	10a93b7f-37f4-470c-a39e-e442b5437113	80	3
33b2e338-22d7-4c7e-983c-dad575a28c34	32b8ae1f-2a7e-4065-bea2-6392a15348c5	75	4
33b2e338-22d7-4c7e-983c-dad575a28c34	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	70	5
bbb3ffcf-bcd3-4f09-b9f8-77b881cb4668	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	95	1
bbb3ffcf-bcd3-4f09-b9f8-77b881cb4668	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	85	2
bbb3ffcf-bcd3-4f09-b9f8-77b881cb4668	f1fb6be8-89b9-4f13-b609-6a3565dd92b3	80	3
bbb3ffcf-bcd3-4f09-b9f8-77b881cb4668	32b8ae1f-2a7e-4065-bea2-6392a15348c5	75	4
bbb3ffcf-bcd3-4f09-b9f8-77b881cb4668	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
3614cc74-1402-4552-9a36-15e0f4ff832f	32b8ae1f-2a7e-4065-bea2-6392a15348c5	95	1
3614cc74-1402-4552-9a36-15e0f4ff832f	6a657f15-2638-4401-a4cb-1cb3d78446be	85	2
3614cc74-1402-4552-9a36-15e0f4ff832f	89219724-7107-4ccf-9ccf-bb20d439a10f	80	3
3614cc74-1402-4552-9a36-15e0f4ff832f	10a93b7f-37f4-470c-a39e-e442b5437113	75	4
3614cc74-1402-4552-9a36-15e0f4ff832f	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	70	5
b9d2a0c2-b379-4de6-a7f6-7f1ba70cec76	3141f563-5039-48a5-a7f1-eac9c29e38ba	95	1
b9d2a0c2-b379-4de6-a7f6-7f1ba70cec76	32b8ae1f-2a7e-4065-bea2-6392a15348c5	85	2
b9d2a0c2-b379-4de6-a7f6-7f1ba70cec76	10a93b7f-37f4-470c-a39e-e442b5437113	80	3
b9d2a0c2-b379-4de6-a7f6-7f1ba70cec76	d4cf402c-1804-4bfc-af25-6b60196102a1	75	4
b9d2a0c2-b379-4de6-a7f6-7f1ba70cec76	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	70	5
8b55a19f-45fc-4ff4-9116-af1f72f737e1	3141f563-5039-48a5-a7f1-eac9c29e38ba	95	1
8b55a19f-45fc-4ff4-9116-af1f72f737e1	d4cf402c-1804-4bfc-af25-6b60196102a1	85	2
8b55a19f-45fc-4ff4-9116-af1f72f737e1	89219724-7107-4ccf-9ccf-bb20d439a10f	80	3
8b55a19f-45fc-4ff4-9116-af1f72f737e1	10a93b7f-37f4-470c-a39e-e442b5437113	75	4
8b55a19f-45fc-4ff4-9116-af1f72f737e1	e3fea1ab-20c7-45c0-8be6-0538353d16b3	70	5
c67a4772-cded-4c6c-bd23-921fbc166095	495b763f-161e-4f28-818a-ae7ddb91c774	95	1
c67a4772-cded-4c6c-bd23-921fbc166095	d4cf402c-1804-4bfc-af25-6b60196102a1	85	2
c67a4772-cded-4c6c-bd23-921fbc166095	89219724-7107-4ccf-9ccf-bb20d439a10f	80	3
c67a4772-cded-4c6c-bd23-921fbc166095	3141f563-5039-48a5-a7f1-eac9c29e38ba	75	4
c67a4772-cded-4c6c-bd23-921fbc166095	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
96d43657-16d4-4e26-90e8-c2646ed26442	89219724-7107-4ccf-9ccf-bb20d439a10f	95	1
96d43657-16d4-4e26-90e8-c2646ed26442	58174674-9bd1-4df8-8c10-9a50cd10b947	90	2
96d43657-16d4-4e26-90e8-c2646ed26442	d4cf402c-1804-4bfc-af25-6b60196102a1	85	3
96d43657-16d4-4e26-90e8-c2646ed26442	3141f563-5039-48a5-a7f1-eac9c29e38ba	75	4
96d43657-16d4-4e26-90e8-c2646ed26442	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
40f16b29-f1e3-44aa-a386-08afa2d89ae3	d4cf402c-1804-4bfc-af25-6b60196102a1	95	1
40f16b29-f1e3-44aa-a386-08afa2d89ae3	89219724-7107-4ccf-9ccf-bb20d439a10f	85	2
40f16b29-f1e3-44aa-a386-08afa2d89ae3	e3fea1ab-20c7-45c0-8be6-0538353d16b3	80	3
40f16b29-f1e3-44aa-a386-08afa2d89ae3	7879e3d8-bf89-4140-b863-4761ec613c4c	75	4
40f16b29-f1e3-44aa-a386-08afa2d89ae3	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
b5d2d725-99d0-443b-8573-24461844148c	d4cf402c-1804-4bfc-af25-6b60196102a1	95	1
b5d2d725-99d0-443b-8573-24461844148c	3141f563-5039-48a5-a7f1-eac9c29e38ba	85	2
b5d2d725-99d0-443b-8573-24461844148c	89219724-7107-4ccf-9ccf-bb20d439a10f	80	3
b5d2d725-99d0-443b-8573-24461844148c	32b8ae1f-2a7e-4065-bea2-6392a15348c5	75	4
b5d2d725-99d0-443b-8573-24461844148c	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
2e5599dd-7b40-4ce7-a114-8cd24c9a4b70	d4cf402c-1804-4bfc-af25-6b60196102a1	90	1
2e5599dd-7b40-4ce7-a114-8cd24c9a4b70	10a93b7f-37f4-470c-a39e-e442b5437113	85	2
2e5599dd-7b40-4ce7-a114-8cd24c9a4b70	32b8ae1f-2a7e-4065-bea2-6392a15348c5	80	3
2e5599dd-7b40-4ce7-a114-8cd24c9a4b70	3141f563-5039-48a5-a7f1-eac9c29e38ba	75	4
2e5599dd-7b40-4ce7-a114-8cd24c9a4b70	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	70	5
8feb25c6-e728-4e24-b303-8defd279762b	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	95	1
8feb25c6-e728-4e24-b303-8defd279762b	32b8ae1f-2a7e-4065-bea2-6392a15348c5	85	2
8feb25c6-e728-4e24-b303-8defd279762b	3141f563-5039-48a5-a7f1-eac9c29e38ba	80	3
8feb25c6-e728-4e24-b303-8defd279762b	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	75	4
8feb25c6-e728-4e24-b303-8defd279762b	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
e1bb7c06-78d1-4a29-9862-59271f078511	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	95	1
e1bb7c06-78d1-4a29-9862-59271f078511	6a657f15-2638-4401-a4cb-1cb3d78446be	90	2
e1bb7c06-78d1-4a29-9862-59271f078511	32b8ae1f-2a7e-4065-bea2-6392a15348c5	85	3
1e57282b-dc0e-479f-9d2a-3d37929477bb	10a93b7f-37f4-470c-a39e-e442b5437113	80	3
1e57282b-dc0e-479f-9d2a-3d37929477bb	495b763f-161e-4f28-818a-ae7ddb91c774	75	4
1e57282b-dc0e-479f-9d2a-3d37929477bb	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	70	5
4c817412-00d4-478d-bebc-40a3d76a085e	e3fea1ab-20c7-45c0-8be6-0538353d16b3	95	1
4c817412-00d4-478d-bebc-40a3d76a085e	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	85	2
4c817412-00d4-478d-bebc-40a3d76a085e	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	80	3
4c817412-00d4-478d-bebc-40a3d76a085e	3141f563-5039-48a5-a7f1-eac9c29e38ba	75	4
4c817412-00d4-478d-bebc-40a3d76a085e	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	70	5
2d697d0a-30d0-4388-a0f5-ca1201ffe541	e3fea1ab-20c7-45c0-8be6-0538353d16b3	95	1
2d697d0a-30d0-4388-a0f5-ca1201ffe541	6a657f15-2638-4401-a4cb-1cb3d78446be	85	2
2d697d0a-30d0-4388-a0f5-ca1201ffe541	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	80	3
2d697d0a-30d0-4388-a0f5-ca1201ffe541	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	75	4
2d697d0a-30d0-4388-a0f5-ca1201ffe541	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	70	5
8323296c-8ed6-4243-9234-54a2b6e6114c	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	95	1
8323296c-8ed6-4243-9234-54a2b6e6114c	71232d6e-c5b8-4c28-89df-276a5f6aeb7d	85	2
8323296c-8ed6-4243-9234-54a2b6e6114c	e3fea1ab-20c7-45c0-8be6-0538353d16b3	80	3
74752fc6-8ebb-4939-a83f-cb2d34f9d687	65f3f958-a668-479f-83aa-f2b0b9bb8236	85	2
74752fc6-8ebb-4939-a83f-cb2d34f9d687	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	80	3
74752fc6-8ebb-4939-a83f-cb2d34f9d687	e41bfae9-b3a5-4661-a420-290d6c27da35	75	4
74752fc6-8ebb-4939-a83f-cb2d34f9d687	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
5d142616-2772-4ab5-a2ae-e7fbed159c58	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	95	1
5d142616-2772-4ab5-a2ae-e7fbed159c58	6a657f15-2638-4401-a4cb-1cb3d78446be	85	2
5d142616-2772-4ab5-a2ae-e7fbed159c58	e3fea1ab-20c7-45c0-8be6-0538353d16b3	80	3
5d142616-2772-4ab5-a2ae-e7fbed159c58	65f3f958-a668-479f-83aa-f2b0b9bb8236	75	4
5d142616-2772-4ab5-a2ae-e7fbed159c58	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	70	5
147267f5-ad6b-46d1-afc8-16d5c7b78579	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	95	1
147267f5-ad6b-46d1-afc8-16d5c7b78579	6a657f15-2638-4401-a4cb-1cb3d78446be	85	2
147267f5-ad6b-46d1-afc8-16d5c7b78579	d4cf402c-1804-4bfc-af25-6b60196102a1	80	3
147267f5-ad6b-46d1-afc8-16d5c7b78579	e3fea1ab-20c7-45c0-8be6-0538353d16b3	75	4
147267f5-ad6b-46d1-afc8-16d5c7b78579	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
32dbefd4-7297-4427-94b6-312f83f3f7c8	e41bfae9-b3a5-4661-a420-290d6c27da35	95	1
32dbefd4-7297-4427-94b6-312f83f3f7c8	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	85	2
32dbefd4-7297-4427-94b6-312f83f3f7c8	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	80	3
32dbefd4-7297-4427-94b6-312f83f3f7c8	e3fea1ab-20c7-45c0-8be6-0538353d16b3	75	4
32dbefd4-7297-4427-94b6-312f83f3f7c8	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
3d140776-c6a6-46c0-9874-981ed5dd1b1b	6a657f15-2638-4401-a4cb-1cb3d78446be	90	1
3d140776-c6a6-46c0-9874-981ed5dd1b1b	e3fea1ab-20c7-45c0-8be6-0538353d16b3	85	2
3d140776-c6a6-46c0-9874-981ed5dd1b1b	89219724-7107-4ccf-9ccf-bb20d439a10f	80	3
3d140776-c6a6-46c0-9874-981ed5dd1b1b	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	75	4
3d140776-c6a6-46c0-9874-981ed5dd1b1b	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
a1291b8c-5711-4a1d-a42a-6d6405881ac8	e41bfae9-b3a5-4661-a420-290d6c27da35	95	1
a1291b8c-5711-4a1d-a42a-6d6405881ac8	e3fea1ab-20c7-45c0-8be6-0538353d16b3	85	2
a1291b8c-5711-4a1d-a42a-6d6405881ac8	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	80	3
a1291b8c-5711-4a1d-a42a-6d6405881ac8	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	75	4
a1291b8c-5711-4a1d-a42a-6d6405881ac8	f1fb6be8-89b9-4f13-b609-6a3565dd92b3	70	5
ec2e2064-9f20-47c5-873b-399ed108cb6b	6a657f15-2638-4401-a4cb-1cb3d78446be	90	1
ec2e2064-9f20-47c5-873b-399ed108cb6b	e3fea1ab-20c7-45c0-8be6-0538353d16b3	85	2
ec2e2064-9f20-47c5-873b-399ed108cb6b	89219724-7107-4ccf-9ccf-bb20d439a10f	80	3
ec2e2064-9f20-47c5-873b-399ed108cb6b	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	75	4
ec2e2064-9f20-47c5-873b-399ed108cb6b	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
ba6d90f2-e97e-49ad-b85b-a199a6d64bfe	6a657f15-2638-4401-a4cb-1cb3d78446be	95	1
ba6d90f2-e97e-49ad-b85b-a199a6d64bfe	3141f563-5039-48a5-a7f1-eac9c29e38ba	85	2
ba6d90f2-e97e-49ad-b85b-a199a6d64bfe	e3fea1ab-20c7-45c0-8be6-0538353d16b3	80	3
ba6d90f2-e97e-49ad-b85b-a199a6d64bfe	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	75	4
ba6d90f2-e97e-49ad-b85b-a199a6d64bfe	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
7f30029f-092c-4c95-82f5-9a39690b3f4c	e3fea1ab-20c7-45c0-8be6-0538353d16b3	95	1
7f30029f-092c-4c95-82f5-9a39690b3f4c	58174674-9bd1-4df8-8c10-9a50cd10b947	90	2
7f30029f-092c-4c95-82f5-9a39690b3f4c	89219724-7107-4ccf-9ccf-bb20d439a10f	85	3
7f30029f-092c-4c95-82f5-9a39690b3f4c	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	75	4
7f30029f-092c-4c95-82f5-9a39690b3f4c	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
84137263-8a01-4584-affe-6d5035ef1244	e3fea1ab-20c7-45c0-8be6-0538353d16b3	95	1
84137263-8a01-4584-affe-6d5035ef1244	3141f563-5039-48a5-a7f1-eac9c29e38ba	85	2
84137263-8a01-4584-affe-6d5035ef1244	10a93b7f-37f4-470c-a39e-e442b5437113	80	3
84137263-8a01-4584-affe-6d5035ef1244	89219724-7107-4ccf-9ccf-bb20d439a10f	75	4
84137263-8a01-4584-affe-6d5035ef1244	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	70	5
e5ac8511-2698-40df-8625-d70612e9439a	6a657f15-2638-4401-a4cb-1cb3d78446be	95	1
e5ac8511-2698-40df-8625-d70612e9439a	89219724-7107-4ccf-9ccf-bb20d439a10f	85	2
e5ac8511-2698-40df-8625-d70612e9439a	e3fea1ab-20c7-45c0-8be6-0538353d16b3	80	3
e5ac8511-2698-40df-8625-d70612e9439a	65f3f958-a668-479f-83aa-f2b0b9bb8236	75	4
e5ac8511-2698-40df-8625-d70612e9439a	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	70	5
2871ddbb-2671-4d9a-9dd7-5202d2e81e7f	e3fea1ab-20c7-45c0-8be6-0538353d16b3	95	1
2871ddbb-2671-4d9a-9dd7-5202d2e81e7f	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	85	2
2871ddbb-2671-4d9a-9dd7-5202d2e81e7f	10a93b7f-37f4-470c-a39e-e442b5437113	80	3
2871ddbb-2671-4d9a-9dd7-5202d2e81e7f	89219724-7107-4ccf-9ccf-bb20d439a10f	75	4
2871ddbb-2671-4d9a-9dd7-5202d2e81e7f	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	70	5
4ae3aa41-93e7-4e06-80d8-c699daf343c9	6a657f15-2638-4401-a4cb-1cb3d78446be	95	1
4ae3aa41-93e7-4e06-80d8-c699daf343c9	89219724-7107-4ccf-9ccf-bb20d439a10f	85	2
4ae3aa41-93e7-4e06-80d8-c699daf343c9	e3fea1ab-20c7-45c0-8be6-0538353d16b3	80	3
4ae3aa41-93e7-4e06-80d8-c699daf343c9	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	75	4
4ae3aa41-93e7-4e06-80d8-c699daf343c9	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
cae436e6-d154-411a-b8bb-60ba4296386e	e3fea1ab-20c7-45c0-8be6-0538353d16b3	90	1
cae436e6-d154-411a-b8bb-60ba4296386e	d4cf402c-1804-4bfc-af25-6b60196102a1	85	2
cae436e6-d154-411a-b8bb-60ba4296386e	495b763f-161e-4f28-818a-ae7ddb91c774	80	3
cae436e6-d154-411a-b8bb-60ba4296386e	89219724-7107-4ccf-9ccf-bb20d439a10f	75	4
cae436e6-d154-411a-b8bb-60ba4296386e	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	70	5
bc1dc5b9-e07d-41bb-944a-6a75e0f2462f	16f221cc-38cc-4dc0-8a26-1cff4bc731db	95	1
bc1dc5b9-e07d-41bb-944a-6a75e0f2462f	2d0c0b9b-9ce0-45f5-9a7a-c3229017eecd	90	2
bc1dc5b9-e07d-41bb-944a-6a75e0f2462f	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	80	3
bc1dc5b9-e07d-41bb-944a-6a75e0f2462f	10a93b7f-37f4-470c-a39e-e442b5437113	75	4
bc1dc5b9-e07d-41bb-944a-6a75e0f2462f	e3fea1ab-20c7-45c0-8be6-0538353d16b3	70	5
064c5488-1c71-4707-bca8-9506854f0b5e	6a657f15-2638-4401-a4cb-1cb3d78446be	95	1
064c5488-1c71-4707-bca8-9506854f0b5e	e3fea1ab-20c7-45c0-8be6-0538353d16b3	85	2
064c5488-1c71-4707-bca8-9506854f0b5e	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	80	3
064c5488-1c71-4707-bca8-9506854f0b5e	e41bfae9-b3a5-4661-a420-290d6c27da35	75	4
064c5488-1c71-4707-bca8-9506854f0b5e	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	70	5
bb352e30-0643-4ab2-9d43-b6ef7bb59e7d	6a657f15-2638-4401-a4cb-1cb3d78446be	95	1
bb352e30-0643-4ab2-9d43-b6ef7bb59e7d	71232d6e-c5b8-4c28-89df-276a5f6aeb7d	85	2
bb352e30-0643-4ab2-9d43-b6ef7bb59e7d	e3fea1ab-20c7-45c0-8be6-0538353d16b3	80	3
bb352e30-0643-4ab2-9d43-b6ef7bb59e7d	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	75	4
bb352e30-0643-4ab2-9d43-b6ef7bb59e7d	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	70	5
04a92a24-3e48-4d18-8d47-1b4d07ac827f	6a657f15-2638-4401-a4cb-1cb3d78446be	90	1
2480a1fe-8e81-4efc-9dbc-a995a0025622	e3fea1ab-20c7-45c0-8be6-0538353d16b3	95	1
2480a1fe-8e81-4efc-9dbc-a995a0025622	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	85	2
2480a1fe-8e81-4efc-9dbc-a995a0025622	89219724-7107-4ccf-9ccf-bb20d439a10f	80	3
2480a1fe-8e81-4efc-9dbc-a995a0025622	71232d6e-c5b8-4c28-89df-276a5f6aeb7d	75	4
2480a1fe-8e81-4efc-9dbc-a995a0025622	115f5980-ab14-44c8-baba-abda4e614d84	70	5
6a5cf2a6-e87d-4cc2-9062-b523922b4cb7	d4cf402c-1804-4bfc-af25-6b60196102a1	95	1
6a5cf2a6-e87d-4cc2-9062-b523922b4cb7	e3fea1ab-20c7-45c0-8be6-0538353d16b3	85	2
6a5cf2a6-e87d-4cc2-9062-b523922b4cb7	89219724-7107-4ccf-9ccf-bb20d439a10f	80	3
3383c1ab-88c0-4958-bacf-0b1491a1e761	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	75	4
3383c1ab-88c0-4958-bacf-0b1491a1e761	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
ce22f643-10a3-48bf-97ec-c4d322ef4105	d4cf402c-1804-4bfc-af25-6b60196102a1	95	1
ce22f643-10a3-48bf-97ec-c4d322ef4105	10a93b7f-37f4-470c-a39e-e442b5437113	85	2
ce22f643-10a3-48bf-97ec-c4d322ef4105	89219724-7107-4ccf-9ccf-bb20d439a10f	80	3
ce22f643-10a3-48bf-97ec-c4d322ef4105	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	75	4
ce22f643-10a3-48bf-97ec-c4d322ef4105	f1fb6be8-89b9-4f13-b609-6a3565dd92b3	70	5
cebfe037-5ac4-4b4f-bafa-18734995b3ca	89219724-7107-4ccf-9ccf-bb20d439a10f	95	1
cebfe037-5ac4-4b4f-bafa-18734995b3ca	d4cf402c-1804-4bfc-af25-6b60196102a1	85	2
cebfe037-5ac4-4b4f-bafa-18734995b3ca	10a93b7f-37f4-470c-a39e-e442b5437113	80	3
cebfe037-5ac4-4b4f-bafa-18734995b3ca	495b763f-161e-4f28-818a-ae7ddb91c774	75	4
cebfe037-5ac4-4b4f-bafa-18734995b3ca	3141f563-5039-48a5-a7f1-eac9c29e38ba	70	5
c35771e0-e11f-4dbd-b762-c5488c8e503e	d4cf402c-1804-4bfc-af25-6b60196102a1	95	1
c35771e0-e11f-4dbd-b762-c5488c8e503e	e3fea1ab-20c7-45c0-8be6-0538353d16b3	85	2
c35771e0-e11f-4dbd-b762-c5488c8e503e	89219724-7107-4ccf-9ccf-bb20d439a10f	80	3
c35771e0-e11f-4dbd-b762-c5488c8e503e	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	75	4
c35771e0-e11f-4dbd-b762-c5488c8e503e	71232d6e-c5b8-4c28-89df-276a5f6aeb7d	70	5
a8fc89dd-4102-431f-8339-9e65b9d27074	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	95	1
a8fc89dd-4102-431f-8339-9e65b9d27074	3141f563-5039-48a5-a7f1-eac9c29e38ba	85	2
a8fc89dd-4102-431f-8339-9e65b9d27074	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	80	3
a8fc89dd-4102-431f-8339-9e65b9d27074	7879e3d8-bf89-4140-b863-4761ec613c4c	75	4
a8fc89dd-4102-431f-8339-9e65b9d27074	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
e6b0d9f7-4026-4c28-8916-df4a5c8fdc26	89219724-7107-4ccf-9ccf-bb20d439a10f	95	1
e6b0d9f7-4026-4c28-8916-df4a5c8fdc26	6a657f15-2638-4401-a4cb-1cb3d78446be	85	2
e6b0d9f7-4026-4c28-8916-df4a5c8fdc26	495b763f-161e-4f28-818a-ae7ddb91c774	80	3
e6b0d9f7-4026-4c28-8916-df4a5c8fdc26	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	75	4
e6b0d9f7-4026-4c28-8916-df4a5c8fdc26	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
de83ece8-c147-480d-b414-ee6dfa9c77f4	10a93b7f-37f4-470c-a39e-e442b5437113	95	1
de83ece8-c147-480d-b414-ee6dfa9c77f4	e3fea1ab-20c7-45c0-8be6-0538353d16b3	85	2
de83ece8-c147-480d-b414-ee6dfa9c77f4	89219724-7107-4ccf-9ccf-bb20d439a10f	80	3
de83ece8-c147-480d-b414-ee6dfa9c77f4	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	75	4
04a92a24-3e48-4d18-8d47-1b4d07ac827f	71232d6e-c5b8-4c28-89df-276a5f6aeb7d	85	2
6a5cf2a6-e87d-4cc2-9062-b523922b4cb7	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	75	4
6a5cf2a6-e87d-4cc2-9062-b523922b4cb7	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
7013dcaa-b40f-43d9-a2fb-e25459b56cd9	89219724-7107-4ccf-9ccf-bb20d439a10f	95	1
7013dcaa-b40f-43d9-a2fb-e25459b56cd9	58174674-9bd1-4df8-8c10-9a50cd10b947	90	2
7013dcaa-b40f-43d9-a2fb-e25459b56cd9	d4cf402c-1804-4bfc-af25-6b60196102a1	80	3
7013dcaa-b40f-43d9-a2fb-e25459b56cd9	10a93b7f-37f4-470c-a39e-e442b5437113	75	4
7013dcaa-b40f-43d9-a2fb-e25459b56cd9	3141f563-5039-48a5-a7f1-eac9c29e38ba	70	5
4ad4be79-66cf-4e94-88cd-9ac109049507	32b8ae1f-2a7e-4065-bea2-6392a15348c5	95	1
4ad4be79-66cf-4e94-88cd-9ac109049507	3141f563-5039-48a5-a7f1-eac9c29e38ba	85	2
4ad4be79-66cf-4e94-88cd-9ac109049507	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	80	3
4ad4be79-66cf-4e94-88cd-9ac109049507	d4cf402c-1804-4bfc-af25-6b60196102a1	75	4
4ad4be79-66cf-4e94-88cd-9ac109049507	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
30056426-cb6c-4a98-8e00-8c839e350b07	58174674-9bd1-4df8-8c10-9a50cd10b947	95	1
30056426-cb6c-4a98-8e00-8c839e350b07	89219724-7107-4ccf-9ccf-bb20d439a10f	85	2
30056426-cb6c-4a98-8e00-8c839e350b07	3141f563-5039-48a5-a7f1-eac9c29e38ba	80	3
30056426-cb6c-4a98-8e00-8c839e350b07	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	75	4
30056426-cb6c-4a98-8e00-8c839e350b07	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
36e49cfe-f6b4-4efc-965f-908b2495e261	e41bfae9-b3a5-4661-a420-290d6c27da35	95	1
36e49cfe-f6b4-4efc-965f-908b2495e261	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	85	2
36e49cfe-f6b4-4efc-965f-908b2495e261	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	80	3
36e49cfe-f6b4-4efc-965f-908b2495e261	1626400a-0417-4ff8-bfed-d89ef198074f	75	4
36e49cfe-f6b4-4efc-965f-908b2495e261	32b8ae1f-2a7e-4065-bea2-6392a15348c5	70	5
2e421b80-2bba-40cb-9271-2f374778fe6c	d4cf402c-1804-4bfc-af25-6b60196102a1	95	1
2e421b80-2bba-40cb-9271-2f374778fe6c	3141f563-5039-48a5-a7f1-eac9c29e38ba	85	2
2e421b80-2bba-40cb-9271-2f374778fe6c	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	80	3
2e421b80-2bba-40cb-9271-2f374778fe6c	e41bfae9-b3a5-4661-a420-290d6c27da35	75	4
2e421b80-2bba-40cb-9271-2f374778fe6c	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
57a1037a-d639-458f-8007-6b9ecfaa947a	7879e3d8-bf89-4140-b863-4761ec613c4c	80	3
57a1037a-d639-458f-8007-6b9ecfaa947a	10a93b7f-37f4-470c-a39e-e442b5437113	75	4
57a1037a-d639-458f-8007-6b9ecfaa947a	f1fb6be8-89b9-4f13-b609-6a3565dd92b3	70	5
19133cd0-67a4-4de4-9809-4db49357d487	3141f563-5039-48a5-a7f1-eac9c29e38ba	85	2
19133cd0-67a4-4de4-9809-4db49357d487	7879e3d8-bf89-4140-b863-4761ec613c4c	75	4
19133cd0-67a4-4de4-9809-4db49357d487	f1fb6be8-89b9-4f13-b609-6a3565dd92b3	70	5
79ddcaec-0056-4c94-9e75-5bd97a6e6f9a	32b8ae1f-2a7e-4065-bea2-6392a15348c5	95	1
79ddcaec-0056-4c94-9e75-5bd97a6e6f9a	89219724-7107-4ccf-9ccf-bb20d439a10f	85	2
79ddcaec-0056-4c94-9e75-5bd97a6e6f9a	d4cf402c-1804-4bfc-af25-6b60196102a1	80	3
79ddcaec-0056-4c94-9e75-5bd97a6e6f9a	e3fea1ab-20c7-45c0-8be6-0538353d16b3	75	4
79ddcaec-0056-4c94-9e75-5bd97a6e6f9a	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
5deccc48-e4c5-4936-9a4c-31eb581dc9e7	89219724-7107-4ccf-9ccf-bb20d439a10f	95	1
5deccc48-e4c5-4936-9a4c-31eb581dc9e7	58174674-9bd1-4df8-8c10-9a50cd10b947	90	2
5deccc48-e4c5-4936-9a4c-31eb581dc9e7	d4cf402c-1804-4bfc-af25-6b60196102a1	80	3
5deccc48-e4c5-4936-9a4c-31eb581dc9e7	e3fea1ab-20c7-45c0-8be6-0538353d16b3	75	4
5deccc48-e4c5-4936-9a4c-31eb581dc9e7	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
83dbdeed-94db-4832-a9c0-63aa1132c9da	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	95	1
83dbdeed-94db-4832-a9c0-63aa1132c9da	3141f563-5039-48a5-a7f1-eac9c29e38ba	85	2
83dbdeed-94db-4832-a9c0-63aa1132c9da	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	80	3
83dbdeed-94db-4832-a9c0-63aa1132c9da	1626400a-0417-4ff8-bfed-d89ef198074f	75	4
83dbdeed-94db-4832-a9c0-63aa1132c9da	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
65c5ad19-2d58-4550-ac70-364c5816d0b5	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	95	1
65c5ad19-2d58-4550-ac70-364c5816d0b5	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	85	2
65c5ad19-2d58-4550-ac70-364c5816d0b5	e41bfae9-b3a5-4661-a420-290d6c27da35	80	3
65c5ad19-2d58-4550-ac70-364c5816d0b5	32b8ae1f-2a7e-4065-bea2-6392a15348c5	75	4
65c5ad19-2d58-4550-ac70-364c5816d0b5	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
6aad7fb3-5e37-46e0-accb-ffbf2c121ecf	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	95	1
6aad7fb3-5e37-46e0-accb-ffbf2c121ecf	3141f563-5039-48a5-a7f1-eac9c29e38ba	85	2
6aad7fb3-5e37-46e0-accb-ffbf2c121ecf	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	80	3
6aad7fb3-5e37-46e0-accb-ffbf2c121ecf	32b8ae1f-2a7e-4065-bea2-6392a15348c5	75	4
6aad7fb3-5e37-46e0-accb-ffbf2c121ecf	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
359618ae-76db-47d0-b416-3f2874d42184	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	95	1
359618ae-76db-47d0-b416-3f2874d42184	e41bfae9-b3a5-4661-a420-290d6c27da35	85	2
359618ae-76db-47d0-b416-3f2874d42184	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	80	3
359618ae-76db-47d0-b416-3f2874d42184	3141f563-5039-48a5-a7f1-eac9c29e38ba	75	4
359618ae-76db-47d0-b416-3f2874d42184	7879e3d8-bf89-4140-b863-4761ec613c4c	70	5
ed508f36-74a7-4304-b24e-9c50c5e101b2	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	95	1
ed508f36-74a7-4304-b24e-9c50c5e101b2	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	85	2
ed508f36-74a7-4304-b24e-9c50c5e101b2	1626400a-0417-4ff8-bfed-d89ef198074f	80	3
ed508f36-74a7-4304-b24e-9c50c5e101b2	32b8ae1f-2a7e-4065-bea2-6392a15348c5	75	4
ed508f36-74a7-4304-b24e-9c50c5e101b2	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
de83ece8-c147-480d-b414-ee6dfa9c77f4	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
a3c1e88a-5ac7-4bb9-80bb-6e8b07d07060	e3fea1ab-20c7-45c0-8be6-0538353d16b3	85	2
a3c1e88a-5ac7-4bb9-80bb-6e8b07d07060	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	80	3
a3c1e88a-5ac7-4bb9-80bb-6e8b07d07060	d4cf402c-1804-4bfc-af25-6b60196102a1	75	4
a3c1e88a-5ac7-4bb9-80bb-6e8b07d07060	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	70	5
951765db-c632-4eb1-8ccd-a365ee9a98c3	d4cf402c-1804-4bfc-af25-6b60196102a1	95	1
82e672a8-9569-4510-b45d-4e4d5a6a0872	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	95	1
82e672a8-9569-4510-b45d-4e4d5a6a0872	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	85	2
82e672a8-9569-4510-b45d-4e4d5a6a0872	3141f563-5039-48a5-a7f1-eac9c29e38ba	80	3
82e672a8-9569-4510-b45d-4e4d5a6a0872	10a93b7f-37f4-470c-a39e-e442b5437113	75	4
82e672a8-9569-4510-b45d-4e4d5a6a0872	32b8ae1f-2a7e-4065-bea2-6392a15348c5	70	5
42b49c6a-f7d8-45bd-98dd-0f5ba1ebac25	10a93b7f-37f4-470c-a39e-e442b5437113	90	1
42b49c6a-f7d8-45bd-98dd-0f5ba1ebac25	3141f563-5039-48a5-a7f1-eac9c29e38ba	85	2
42b49c6a-f7d8-45bd-98dd-0f5ba1ebac25	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	80	3
42b49c6a-f7d8-45bd-98dd-0f5ba1ebac25	d4cf402c-1804-4bfc-af25-6b60196102a1	75	4
42b49c6a-f7d8-45bd-98dd-0f5ba1ebac25	e41bfae9-b3a5-4661-a420-290d6c27da35	70	5
09b097c8-8987-49af-99cf-f8fcbf184a92	89219724-7107-4ccf-9ccf-bb20d439a10f	95	1
09b097c8-8987-49af-99cf-f8fcbf184a92	e3fea1ab-20c7-45c0-8be6-0538353d16b3	85	2
09b097c8-8987-49af-99cf-f8fcbf184a92	32b8ae1f-2a7e-4065-bea2-6392a15348c5	80	3
09b097c8-8987-49af-99cf-f8fcbf184a92	10a93b7f-37f4-470c-a39e-e442b5437113	75	4
09b097c8-8987-49af-99cf-f8fcbf184a92	f1fb6be8-89b9-4f13-b609-6a3565dd92b3	70	5
0441d386-bf83-46d6-850b-bc8c5ce4a7d0	d4cf402c-1804-4bfc-af25-6b60196102a1	95	1
0441d386-bf83-46d6-850b-bc8c5ce4a7d0	89219724-7107-4ccf-9ccf-bb20d439a10f	85	2
0441d386-bf83-46d6-850b-bc8c5ce4a7d0	10a93b7f-37f4-470c-a39e-e442b5437113	80	3
0441d386-bf83-46d6-850b-bc8c5ce4a7d0	3141f563-5039-48a5-a7f1-eac9c29e38ba	75	4
0441d386-bf83-46d6-850b-bc8c5ce4a7d0	26742fe4-2f0d-4219-ac58-8a4b998c74de	70	5
1080ddd7-489b-4716-9004-190708d9493e	10a93b7f-37f4-470c-a39e-e442b5437113	95	1
1080ddd7-489b-4716-9004-190708d9493e	7879e3d8-bf89-4140-b863-4761ec613c4c	85	2
1080ddd7-489b-4716-9004-190708d9493e	3141f563-5039-48a5-a7f1-eac9c29e38ba	80	3
1080ddd7-489b-4716-9004-190708d9493e	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	75	4
1080ddd7-489b-4716-9004-190708d9493e	d4cf402c-1804-4bfc-af25-6b60196102a1	70	5
efc1a8bb-203a-4dc6-8ddc-5de529b07d7e	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	95	1
efc1a8bb-203a-4dc6-8ddc-5de529b07d7e	1626400a-0417-4ff8-bfed-d89ef198074f	85	2
efc1a8bb-203a-4dc6-8ddc-5de529b07d7e	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	80	3
efc1a8bb-203a-4dc6-8ddc-5de529b07d7e	3141f563-5039-48a5-a7f1-eac9c29e38ba	75	4
efc1a8bb-203a-4dc6-8ddc-5de529b07d7e	f1fb6be8-89b9-4f13-b609-6a3565dd92b3	70	5
08332624-be68-4d6f-b34d-9af66ff3bb6f	10a93b7f-37f4-470c-a39e-e442b5437113	95	1
08332624-be68-4d6f-b34d-9af66ff3bb6f	89219724-7107-4ccf-9ccf-bb20d439a10f	85	2
08332624-be68-4d6f-b34d-9af66ff3bb6f	836b42f0-d917-47ba-8dc7-bf4189c01f89	80	3
08332624-be68-4d6f-b34d-9af66ff3bb6f	32b8ae1f-2a7e-4065-bea2-6392a15348c5	75	4
08332624-be68-4d6f-b34d-9af66ff3bb6f	3141f563-5039-48a5-a7f1-eac9c29e38ba	70	5
b1ee6554-205e-4306-bf77-cae0c6d30752	89219724-7107-4ccf-9ccf-bb20d439a10f	95	1
b1ee6554-205e-4306-bf77-cae0c6d30752	d4cf402c-1804-4bfc-af25-6b60196102a1	85	2
b1ee6554-205e-4306-bf77-cae0c6d30752	495b763f-161e-4f28-818a-ae7ddb91c774	80	3
b1ee6554-205e-4306-bf77-cae0c6d30752	10a93b7f-37f4-470c-a39e-e442b5437113	75	4
b1ee6554-205e-4306-bf77-cae0c6d30752	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
e1bb7c06-78d1-4a29-9862-59271f078511	3141f563-5039-48a5-a7f1-eac9c29e38ba	80	4
e1bb7c06-78d1-4a29-9862-59271f078511	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	75	5
c91f8af4-a006-4018-8c6b-2e4b1773cc62	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	95	1
c91f8af4-a006-4018-8c6b-2e4b1773cc62	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	85	2
c91f8af4-a006-4018-8c6b-2e4b1773cc62	32b8ae1f-2a7e-4065-bea2-6392a15348c5	80	3
c91f8af4-a006-4018-8c6b-2e4b1773cc62	1626400a-0417-4ff8-bfed-d89ef198074f	75	4
c91f8af4-a006-4018-8c6b-2e4b1773cc62	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	70	5
3efda889-e47d-4e4a-a031-df3cf1959823	1fda1184-8063-4cb8-9811-9e3eb0557ab2	95	1
3efda889-e47d-4e4a-a031-df3cf1959823	26742fe4-2f0d-4219-ac58-8a4b998c74de	88	2
3efda889-e47d-4e4a-a031-df3cf1959823	10a93b7f-37f4-470c-a39e-e442b5437113	82	3
3efda889-e47d-4e4a-a031-df3cf1959823	a7f6bb93-d636-4796-be63-43d918d69ad5	76	4
3efda889-e47d-4e4a-a031-df3cf1959823	8b242d94-26f4-4347-8476-f79bccc7c051	70	5
8f5a737b-4122-4e72-b68d-d22363b7f3bb	60aea58c-7c6f-469c-9b77-5c4be6d53627	95	1
8f5a737b-4122-4e72-b68d-d22363b7f3bb	10a93b7f-37f4-470c-a39e-e442b5437113	88	2
8f5a737b-4122-4e72-b68d-d22363b7f3bb	a583b16a-ebc0-4862-94e8-e865d460d43b	82	3
8f5a737b-4122-4e72-b68d-d22363b7f3bb	65f3f958-a668-479f-83aa-f2b0b9bb8236	76	4
8f5a737b-4122-4e72-b68d-d22363b7f3bb	ec62c48b-a0fe-44b8-b10f-31472c3ce534	70	5
ffc9fa3a-300b-4f16-ae34-05217b887280	e55153a9-7d48-4956-9a15-f11205b95aa5	95	1
ffc9fa3a-300b-4f16-ae34-05217b887280	26742fe4-2f0d-4219-ac58-8a4b998c74de	88	2
ffc9fa3a-300b-4f16-ae34-05217b887280	05650238-fd2f-492d-a3cf-48e1fed78e5b	82	3
ffc9fa3a-300b-4f16-ae34-05217b887280	ec62c48b-a0fe-44b8-b10f-31472c3ce534	76	4
ffc9fa3a-300b-4f16-ae34-05217b887280	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
f302d48a-6e27-4e81-b46a-725c5024a4a5	8d60a1e7-8e37-4f80-8204-d80744eeb5ee	95	1
f302d48a-6e27-4e81-b46a-725c5024a4a5	e55153a9-7d48-4956-9a15-f11205b95aa5	88	2
f302d48a-6e27-4e81-b46a-725c5024a4a5	3141f563-5039-48a5-a7f1-eac9c29e38ba	82	3
8323296c-8ed6-4243-9234-54a2b6e6114c	d4cf402c-1804-4bfc-af25-6b60196102a1	75	4
8323296c-8ed6-4243-9234-54a2b6e6114c	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	70	5
1b364c0b-662e-4cd5-954c-6bfee2b2c366	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	95	1
1b364c0b-662e-4cd5-954c-6bfee2b2c366	6a657f15-2638-4401-a4cb-1cb3d78446be	85	2
1b364c0b-662e-4cd5-954c-6bfee2b2c366	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	80	3
1b364c0b-662e-4cd5-954c-6bfee2b2c366	e3fea1ab-20c7-45c0-8be6-0538353d16b3	75	4
1b364c0b-662e-4cd5-954c-6bfee2b2c366	71232d6e-c5b8-4c28-89df-276a5f6aeb7d	70	5
8f922038-e240-4d69-9174-7485ad0d07b2	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	90	1
8f922038-e240-4d69-9174-7485ad0d07b2	3141f563-5039-48a5-a7f1-eac9c29e38ba	85	2
8f922038-e240-4d69-9174-7485ad0d07b2	89219724-7107-4ccf-9ccf-bb20d439a10f	80	3
8f922038-e240-4d69-9174-7485ad0d07b2	e3fea1ab-20c7-45c0-8be6-0538353d16b3	75	4
8f922038-e240-4d69-9174-7485ad0d07b2	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	70	5
b0716a17-fde6-4187-81e6-2e50de59786e	65f3f958-a668-479f-83aa-f2b0b9bb8236	95	1
b0716a17-fde6-4187-81e6-2e50de59786e	e41bfae9-b3a5-4661-a420-290d6c27da35	85	2
b0716a17-fde6-4187-81e6-2e50de59786e	16f221cc-38cc-4dc0-8a26-1cff4bc731db	80	3
b0716a17-fde6-4187-81e6-2e50de59786e	d4cf402c-1804-4bfc-af25-6b60196102a1	70	5
fcf0c6ed-2798-4aee-b5fc-62978a63cbd3	6a657f15-2638-4401-a4cb-1cb3d78446be	80	3
8b600535-5657-4c05-a48a-59321a0ac0ab	e3fea1ab-20c7-45c0-8be6-0538353d16b3	95	1
8b600535-5657-4c05-a48a-59321a0ac0ab	3141f563-5039-48a5-a7f1-eac9c29e38ba	80	3
c78c89fd-baf2-41b8-a4fd-ec1df6fbf32f	e3fea1ab-20c7-45c0-8be6-0538353d16b3	85	2
951765db-c632-4eb1-8ccd-a365ee9a98c3	89219724-7107-4ccf-9ccf-bb20d439a10f	85	2
951765db-c632-4eb1-8ccd-a365ee9a98c3	58174674-9bd1-4df8-8c10-9a50cd10b947	80	3
19133cd0-67a4-4de4-9809-4db49357d487	32b8ae1f-2a7e-4065-bea2-6392a15348c5	95	1
8335f285-1a61-47f4-b02a-dbd8e8c2b926	d4cf402c-1804-4bfc-af25-6b60196102a1	95	1
8335f285-1a61-47f4-b02a-dbd8e8c2b926	89219724-7107-4ccf-9ccf-bb20d439a10f	85	2
d919cac4-3d0e-46d3-abfd-39405ff00d2e	6a657f15-2638-4401-a4cb-1cb3d78446be	95	1
d919cac4-3d0e-46d3-abfd-39405ff00d2e	10a93b7f-37f4-470c-a39e-e442b5437113	85	2
d919cac4-3d0e-46d3-abfd-39405ff00d2e	89219724-7107-4ccf-9ccf-bb20d439a10f	80	3
d919cac4-3d0e-46d3-abfd-39405ff00d2e	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	75	4
d919cac4-3d0e-46d3-abfd-39405ff00d2e	32b8ae1f-2a7e-4065-bea2-6392a15348c5	70	5
21fea75f-8b80-48c9-8a52-f3b835a33dc0	d4cf402c-1804-4bfc-af25-6b60196102a1	95	1
21fea75f-8b80-48c9-8a52-f3b835a33dc0	3141f563-5039-48a5-a7f1-eac9c29e38ba	85	2
21fea75f-8b80-48c9-8a52-f3b835a33dc0	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	80	3
21fea75f-8b80-48c9-8a52-f3b835a33dc0	10a93b7f-37f4-470c-a39e-e442b5437113	75	4
21fea75f-8b80-48c9-8a52-f3b835a33dc0	32b8ae1f-2a7e-4065-bea2-6392a15348c5	70	5
b2321149-dcf9-40ef-83c7-b80d6ed56162	89219724-7107-4ccf-9ccf-bb20d439a10f	95	1
b2321149-dcf9-40ef-83c7-b80d6ed56162	58174674-9bd1-4df8-8c10-9a50cd10b947	90	2
b2321149-dcf9-40ef-83c7-b80d6ed56162	7879e3d8-bf89-4140-b863-4761ec613c4c	80	3
b2321149-dcf9-40ef-83c7-b80d6ed56162	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	75	4
b2321149-dcf9-40ef-83c7-b80d6ed56162	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
8cbc5b78-6a80-4248-a218-28ef9f032a83	89219724-7107-4ccf-9ccf-bb20d439a10f	95	1
8cbc5b78-6a80-4248-a218-28ef9f032a83	58174674-9bd1-4df8-8c10-9a50cd10b947	90	2
8cbc5b78-6a80-4248-a218-28ef9f032a83	d4cf402c-1804-4bfc-af25-6b60196102a1	80	3
8cbc5b78-6a80-4248-a218-28ef9f032a83	495b763f-161e-4f28-818a-ae7ddb91c774	75	4
8cbc5b78-6a80-4248-a218-28ef9f032a83	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
8fb5c757-d7cf-4a44-8707-24c27f54263b	3141f563-5039-48a5-a7f1-eac9c29e38ba	95	1
8fb5c757-d7cf-4a44-8707-24c27f54263b	7879e3d8-bf89-4140-b863-4761ec613c4c	85	2
8fb5c757-d7cf-4a44-8707-24c27f54263b	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	80	3
8fb5c757-d7cf-4a44-8707-24c27f54263b	1626400a-0417-4ff8-bfed-d89ef198074f	75	4
8fb5c757-d7cf-4a44-8707-24c27f54263b	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
e182e4b2-4fcb-4706-a454-4fc4774dabfc	10a93b7f-37f4-470c-a39e-e442b5437113	95	1
e182e4b2-4fcb-4706-a454-4fc4774dabfc	89219724-7107-4ccf-9ccf-bb20d439a10f	85	2
e182e4b2-4fcb-4706-a454-4fc4774dabfc	3141f563-5039-48a5-a7f1-eac9c29e38ba	80	3
e182e4b2-4fcb-4706-a454-4fc4774dabfc	d4cf402c-1804-4bfc-af25-6b60196102a1	75	4
e182e4b2-4fcb-4706-a454-4fc4774dabfc	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	70	5
3b7f7d83-9e8d-4e86-941d-48ebd74ce50d	d4cf402c-1804-4bfc-af25-6b60196102a1	95	1
3b7f7d83-9e8d-4e86-941d-48ebd74ce50d	89219724-7107-4ccf-9ccf-bb20d439a10f	85	2
3b7f7d83-9e8d-4e86-941d-48ebd74ce50d	3141f563-5039-48a5-a7f1-eac9c29e38ba	80	3
3b7f7d83-9e8d-4e86-941d-48ebd74ce50d	10a93b7f-37f4-470c-a39e-e442b5437113	75	4
3b7f7d83-9e8d-4e86-941d-48ebd74ce50d	f1fb6be8-89b9-4f13-b609-6a3565dd92b3	70	5
43494570-705a-4197-9dd7-fff7505dd335	e41bfae9-b3a5-4661-a420-290d6c27da35	95	1
43494570-705a-4197-9dd7-fff7505dd335	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	85	2
43494570-705a-4197-9dd7-fff7505dd335	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	80	3
43494570-705a-4197-9dd7-fff7505dd335	3141f563-5039-48a5-a7f1-eac9c29e38ba	75	4
43494570-705a-4197-9dd7-fff7505dd335	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
2b8a4d23-039b-4e32-a1e6-f8e28728733c	d4cf402c-1804-4bfc-af25-6b60196102a1	95	1
2b8a4d23-039b-4e32-a1e6-f8e28728733c	3141f563-5039-48a5-a7f1-eac9c29e38ba	85	2
2b8a4d23-039b-4e32-a1e6-f8e28728733c	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	80	3
2b8a4d23-039b-4e32-a1e6-f8e28728733c	10a93b7f-37f4-470c-a39e-e442b5437113	75	4
2b8a4d23-039b-4e32-a1e6-f8e28728733c	f1fb6be8-89b9-4f13-b609-6a3565dd92b3	70	5
b0716a17-fde6-4187-81e6-2e50de59786e	e3fea1ab-20c7-45c0-8be6-0538353d16b3	75	4
2aecd3d7-0c14-40fc-9a02-5aa742da6901	e3fea1ab-20c7-45c0-8be6-0538353d16b3	95	1
2aecd3d7-0c14-40fc-9a02-5aa742da6901	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	85	2
2aecd3d7-0c14-40fc-9a02-5aa742da6901	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	80	3
2aecd3d7-0c14-40fc-9a02-5aa742da6901	65f3f958-a668-479f-83aa-f2b0b9bb8236	75	4
2aecd3d7-0c14-40fc-9a02-5aa742da6901	1626400a-0417-4ff8-bfed-d89ef198074f	70	5
e08da125-5766-41a1-bdd6-c9ca9df0b92c	e3fea1ab-20c7-45c0-8be6-0538353d16b3	90	1
e08da125-5766-41a1-bdd6-c9ca9df0b92c	d4cf402c-1804-4bfc-af25-6b60196102a1	85	2
e08da125-5766-41a1-bdd6-c9ca9df0b92c	e41bfae9-b3a5-4661-a420-290d6c27da35	80	3
e08da125-5766-41a1-bdd6-c9ca9df0b92c	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	75	4
e08da125-5766-41a1-bdd6-c9ca9df0b92c	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	70	5
34b9d907-e77d-4dcf-8251-06b07fa60aa0	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	95	1
34b9d907-e77d-4dcf-8251-06b07fa60aa0	6a657f15-2638-4401-a4cb-1cb3d78446be	90	2
34b9d907-e77d-4dcf-8251-06b07fa60aa0	e3fea1ab-20c7-45c0-8be6-0538353d16b3	80	3
34b9d907-e77d-4dcf-8251-06b07fa60aa0	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	75	4
34b9d907-e77d-4dcf-8251-06b07fa60aa0	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	70	5
9034bc0f-5328-4dd3-b722-916bf17b239e	e3fea1ab-20c7-45c0-8be6-0538353d16b3	95	1
9034bc0f-5328-4dd3-b722-916bf17b239e	e41bfae9-b3a5-4661-a420-290d6c27da35	85	2
9034bc0f-5328-4dd3-b722-916bf17b239e	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	80	3
9034bc0f-5328-4dd3-b722-916bf17b239e	6a657f15-2638-4401-a4cb-1cb3d78446be	75	4
9034bc0f-5328-4dd3-b722-916bf17b239e	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	70	5
4ba18694-2e09-413d-9406-9050f623540f	e41bfae9-b3a5-4661-a420-290d6c27da35	95	1
4ba18694-2e09-413d-9406-9050f623540f	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	85	2
4ba18694-2e09-413d-9406-9050f623540f	e3fea1ab-20c7-45c0-8be6-0538353d16b3	80	3
4ba18694-2e09-413d-9406-9050f623540f	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	75	4
4ba18694-2e09-413d-9406-9050f623540f	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	70	5
6993eab3-d31c-4e3b-990b-f90609b12376	e3fea1ab-20c7-45c0-8be6-0538353d16b3	95	1
6993eab3-d31c-4e3b-990b-f90609b12376	16f221cc-38cc-4dc0-8a26-1cff4bc731db	85	2
6993eab3-d31c-4e3b-990b-f90609b12376	7879e3d8-bf89-4140-b863-4761ec613c4c	80	3
6993eab3-d31c-4e3b-990b-f90609b12376	e41bfae9-b3a5-4661-a420-290d6c27da35	75	4
6993eab3-d31c-4e3b-990b-f90609b12376	71232d6e-c5b8-4c28-89df-276a5f6aeb7d	70	5
477898f2-01cc-4cee-8672-faea3786d6a4	e41bfae9-b3a5-4661-a420-290d6c27da35	95	1
477898f2-01cc-4cee-8672-faea3786d6a4	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	85	2
477898f2-01cc-4cee-8672-faea3786d6a4	6a657f15-2638-4401-a4cb-1cb3d78446be	80	3
477898f2-01cc-4cee-8672-faea3786d6a4	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	75	4
477898f2-01cc-4cee-8672-faea3786d6a4	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
2b0e1194-769e-4c6e-b225-af46fe33848c	e3fea1ab-20c7-45c0-8be6-0538353d16b3	95	1
2b0e1194-769e-4c6e-b225-af46fe33848c	d4cf402c-1804-4bfc-af25-6b60196102a1	85	2
90538320-a765-48ba-b11e-39517b851ff8	d4cf402c-1804-4bfc-af25-6b60196102a1	95	1
90538320-a765-48ba-b11e-39517b851ff8	89219724-7107-4ccf-9ccf-bb20d439a10f	90	2
90538320-a765-48ba-b11e-39517b851ff8	10a93b7f-37f4-470c-a39e-e442b5437113	80	3
90538320-a765-48ba-b11e-39517b851ff8	f1fb6be8-89b9-4f13-b609-6a3565dd92b3	75	4
90538320-a765-48ba-b11e-39517b851ff8	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	70	5
af8899cf-4ee6-4101-a640-3cd0f0c61870	16f221cc-38cc-4dc0-8a26-1cff4bc731db	95	1
af8899cf-4ee6-4101-a640-3cd0f0c61870	e3fea1ab-20c7-45c0-8be6-0538353d16b3	85	2
af8899cf-4ee6-4101-a640-3cd0f0c61870	89219724-7107-4ccf-9ccf-bb20d439a10f	80	3
af8899cf-4ee6-4101-a640-3cd0f0c61870	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	75	4
af8899cf-4ee6-4101-a640-3cd0f0c61870	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
757f5ca5-6987-439d-adf7-d2c7404911e9	d4cf402c-1804-4bfc-af25-6b60196102a1	90	1
757f5ca5-6987-439d-adf7-d2c7404911e9	32b8ae1f-2a7e-4065-bea2-6392a15348c5	85	2
757f5ca5-6987-439d-adf7-d2c7404911e9	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	80	3
757f5ca5-6987-439d-adf7-d2c7404911e9	89219724-7107-4ccf-9ccf-bb20d439a10f	75	4
757f5ca5-6987-439d-adf7-d2c7404911e9	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
ff1a0c73-a68a-45f1-bc58-542660d04108	3141f563-5039-48a5-a7f1-eac9c29e38ba	95	1
ff1a0c73-a68a-45f1-bc58-542660d04108	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	85	2
ff1a0c73-a68a-45f1-bc58-542660d04108	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	80	3
ff1a0c73-a68a-45f1-bc58-542660d04108	10a93b7f-37f4-470c-a39e-e442b5437113	75	4
ff1a0c73-a68a-45f1-bc58-542660d04108	32b8ae1f-2a7e-4065-bea2-6392a15348c5	70	5
b8f49443-825f-402d-8a87-98df3f13322d	89219724-7107-4ccf-9ccf-bb20d439a10f	95	1
b8f49443-825f-402d-8a87-98df3f13322d	6a657f15-2638-4401-a4cb-1cb3d78446be	85	2
b8f49443-825f-402d-8a87-98df3f13322d	32b8ae1f-2a7e-4065-bea2-6392a15348c5	80	3
b8f49443-825f-402d-8a87-98df3f13322d	3fdac98c-68d0-4abe-a48f-baefdfd0ddd3	75	4
b8f49443-825f-402d-8a87-98df3f13322d	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
27028cb6-61cc-4664-9d15-c39bef00eced	495b763f-161e-4f28-818a-ae7ddb91c774	95	1
27028cb6-61cc-4664-9d15-c39bef00eced	89219724-7107-4ccf-9ccf-bb20d439a10f	85	2
27028cb6-61cc-4664-9d15-c39bef00eced	65f3f958-a668-479f-83aa-f2b0b9bb8236	80	3
27028cb6-61cc-4664-9d15-c39bef00eced	32b8ae1f-2a7e-4065-bea2-6392a15348c5	75	4
27028cb6-61cc-4664-9d15-c39bef00eced	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
9ab9be03-ca2d-49c0-9e18-a16f15f96d35	32b8ae1f-2a7e-4065-bea2-6392a15348c5	95	1
9ab9be03-ca2d-49c0-9e18-a16f15f96d35	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	85	2
9ab9be03-ca2d-49c0-9e18-a16f15f96d35	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	80	3
9ab9be03-ca2d-49c0-9e18-a16f15f96d35	65f3f958-a668-479f-83aa-f2b0b9bb8236	75	4
9ab9be03-ca2d-49c0-9e18-a16f15f96d35	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	70	5
6bdbb989-d52c-46ae-9fb6-a7ace9089b6d	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	95	1
6bdbb989-d52c-46ae-9fb6-a7ace9089b6d	3141f563-5039-48a5-a7f1-eac9c29e38ba	85	2
6bdbb989-d52c-46ae-9fb6-a7ace9089b6d	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	80	3
6bdbb989-d52c-46ae-9fb6-a7ace9089b6d	10a93b7f-37f4-470c-a39e-e442b5437113	75	4
6bdbb989-d52c-46ae-9fb6-a7ace9089b6d	d4cf402c-1804-4bfc-af25-6b60196102a1	70	5
ae7bca18-fd4d-4ec3-bb28-3b2734da687b	89219724-7107-4ccf-9ccf-bb20d439a10f	95	1
ae7bca18-fd4d-4ec3-bb28-3b2734da687b	6a657f15-2638-4401-a4cb-1cb3d78446be	85	2
ae7bca18-fd4d-4ec3-bb28-3b2734da687b	3141f563-5039-48a5-a7f1-eac9c29e38ba	80	3
ae7bca18-fd4d-4ec3-bb28-3b2734da687b	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	75	4
ae7bca18-fd4d-4ec3-bb28-3b2734da687b	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
e60a4b7d-e652-4115-9310-04dae4a2f227	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	95	1
e60a4b7d-e652-4115-9310-04dae4a2f227	3141f563-5039-48a5-a7f1-eac9c29e38ba	85	2
e60a4b7d-e652-4115-9310-04dae4a2f227	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	80	3
e60a4b7d-e652-4115-9310-04dae4a2f227	e3fea1ab-20c7-45c0-8be6-0538353d16b3	75	4
e60a4b7d-e652-4115-9310-04dae4a2f227	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
a1f0ff8c-81d4-48bf-b7c2-bc297b29bab8	89219724-7107-4ccf-9ccf-bb20d439a10f	95	1
a1f0ff8c-81d4-48bf-b7c2-bc297b29bab8	d4cf402c-1804-4bfc-af25-6b60196102a1	85	2
a1f0ff8c-81d4-48bf-b7c2-bc297b29bab8	6a657f15-2638-4401-a4cb-1cb3d78446be	80	3
a1f0ff8c-81d4-48bf-b7c2-bc297b29bab8	495b763f-161e-4f28-818a-ae7ddb91c774	75	4
a1f0ff8c-81d4-48bf-b7c2-bc297b29bab8	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
d851ea0e-5b15-48d4-8d3c-c07e0836a988	89219724-7107-4ccf-9ccf-bb20d439a10f	95	1
d851ea0e-5b15-48d4-8d3c-c07e0836a988	3141f563-5039-48a5-a7f1-eac9c29e38ba	85	2
d851ea0e-5b15-48d4-8d3c-c07e0836a988	d4cf402c-1804-4bfc-af25-6b60196102a1	80	3
d851ea0e-5b15-48d4-8d3c-c07e0836a988	10a93b7f-37f4-470c-a39e-e442b5437113	75	4
d851ea0e-5b15-48d4-8d3c-c07e0836a988	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	70	5
0e34cefc-9cc3-4e13-b25a-2a1b01bbd4c2	d4cf402c-1804-4bfc-af25-6b60196102a1	95	1
0e34cefc-9cc3-4e13-b25a-2a1b01bbd4c2	10a93b7f-37f4-470c-a39e-e442b5437113	85	2
0e34cefc-9cc3-4e13-b25a-2a1b01bbd4c2	f1fb6be8-89b9-4f13-b609-6a3565dd92b3	80	3
0e34cefc-9cc3-4e13-b25a-2a1b01bbd4c2	3141f563-5039-48a5-a7f1-eac9c29e38ba	75	4
0e34cefc-9cc3-4e13-b25a-2a1b01bbd4c2	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	70	5
ea726d02-55d5-4257-885f-7cfafa201f43	10a93b7f-37f4-470c-a39e-e442b5437113	95	1
ea726d02-55d5-4257-885f-7cfafa201f43	7879e3d8-bf89-4140-b863-4761ec613c4c	85	2
ea726d02-55d5-4257-885f-7cfafa201f43	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	80	3
ea726d02-55d5-4257-885f-7cfafa201f43	e3fea1ab-20c7-45c0-8be6-0538353d16b3	75	4
ea726d02-55d5-4257-885f-7cfafa201f43	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	70	5
2a20229e-a62d-4427-9950-3e1846971720	32b8ae1f-2a7e-4065-bea2-6392a15348c5	95	1
2a20229e-a62d-4427-9950-3e1846971720	d4cf402c-1804-4bfc-af25-6b60196102a1	85	2
2a20229e-a62d-4427-9950-3e1846971720	e3fea1ab-20c7-45c0-8be6-0538353d16b3	80	3
2a20229e-a62d-4427-9950-3e1846971720	10a93b7f-37f4-470c-a39e-e442b5437113	75	4
2a20229e-a62d-4427-9950-3e1846971720	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	70	5
00f161f6-53e4-4191-85b2-81e573898f95	e3fea1ab-20c7-45c0-8be6-0538353d16b3	95	1
00f161f6-53e4-4191-85b2-81e573898f95	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	85	2
00f161f6-53e4-4191-85b2-81e573898f95	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	80	3
00f161f6-53e4-4191-85b2-81e573898f95	16f221cc-38cc-4dc0-8a26-1cff4bc731db	75	4
00f161f6-53e4-4191-85b2-81e573898f95	3141f563-5039-48a5-a7f1-eac9c29e38ba	70	5
71cb70a1-52af-43b0-b06b-5a51225a84a6	495b763f-161e-4f28-818a-ae7ddb91c774	95	1
71cb70a1-52af-43b0-b06b-5a51225a84a6	89219724-7107-4ccf-9ccf-bb20d439a10f	90	2
71cb70a1-52af-43b0-b06b-5a51225a84a6	10a93b7f-37f4-470c-a39e-e442b5437113	80	3
71cb70a1-52af-43b0-b06b-5a51225a84a6	f1fb6be8-89b9-4f13-b609-6a3565dd92b3	75	4
71cb70a1-52af-43b0-b06b-5a51225a84a6	e3fea1ab-20c7-45c0-8be6-0538353d16b3	70	5
bcfbe8d4-46e1-43cd-aa18-f2aad6130d19	89219724-7107-4ccf-9ccf-bb20d439a10f	95	1
bcfbe8d4-46e1-43cd-aa18-f2aad6130d19	6a657f15-2638-4401-a4cb-1cb3d78446be	85	2
bcfbe8d4-46e1-43cd-aa18-f2aad6130d19	3141f563-5039-48a5-a7f1-eac9c29e38ba	80	3
bcfbe8d4-46e1-43cd-aa18-f2aad6130d19	10a93b7f-37f4-470c-a39e-e442b5437113	75	4
bcfbe8d4-46e1-43cd-aa18-f2aad6130d19	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
cd839cb5-2ab8-4312-9208-7949f79474c4	3141f563-5039-48a5-a7f1-eac9c29e38ba	95	1
cd839cb5-2ab8-4312-9208-7949f79474c4	7879e3d8-bf89-4140-b863-4761ec613c4c	85	2
cd839cb5-2ab8-4312-9208-7949f79474c4	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	80	3
cd839cb5-2ab8-4312-9208-7949f79474c4	f1fb6be8-89b9-4f13-b609-6a3565dd92b3	75	4
cd839cb5-2ab8-4312-9208-7949f79474c4	32b8ae1f-2a7e-4065-bea2-6392a15348c5	70	5
944dfaa0-f4f3-4dd8-9ed0-bd48dc76424f	16f221cc-38cc-4dc0-8a26-1cff4bc731db	95	1
944dfaa0-f4f3-4dd8-9ed0-bd48dc76424f	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	85	2
944dfaa0-f4f3-4dd8-9ed0-bd48dc76424f	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	80	3
944dfaa0-f4f3-4dd8-9ed0-bd48dc76424f	3141f563-5039-48a5-a7f1-eac9c29e38ba	75	4
944dfaa0-f4f3-4dd8-9ed0-bd48dc76424f	71232d6e-c5b8-4c28-89df-276a5f6aeb7d	70	5
3ff9c784-ccd9-4adb-a793-a8cee2e525c3	d4cf402c-1804-4bfc-af25-6b60196102a1	95	1
3ff9c784-ccd9-4adb-a793-a8cee2e525c3	3141f563-5039-48a5-a7f1-eac9c29e38ba	85	2
3ff9c784-ccd9-4adb-a793-a8cee2e525c3	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	80	3
3ff9c784-ccd9-4adb-a793-a8cee2e525c3	10a93b7f-37f4-470c-a39e-e442b5437113	75	4
3ff9c784-ccd9-4adb-a793-a8cee2e525c3	f1fb6be8-89b9-4f13-b609-6a3565dd92b3	70	5
1a6602ed-b11a-488e-a848-8f621dd1e5e8	10a93b7f-37f4-470c-a39e-e442b5437113	95	1
1a6602ed-b11a-488e-a848-8f621dd1e5e8	32b8ae1f-2a7e-4065-bea2-6392a15348c5	85	2
1a6602ed-b11a-488e-a848-8f621dd1e5e8	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	80	3
1a6602ed-b11a-488e-a848-8f621dd1e5e8	e3fea1ab-20c7-45c0-8be6-0538353d16b3	75	4
1a6602ed-b11a-488e-a848-8f621dd1e5e8	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	70	5
f4ae23f0-da72-4b5e-80d2-eac5adff8d2d	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	95	1
f4ae23f0-da72-4b5e-80d2-eac5adff8d2d	7879e3d8-bf89-4140-b863-4761ec613c4c	85	2
f4ae23f0-da72-4b5e-80d2-eac5adff8d2d	3141f563-5039-48a5-a7f1-eac9c29e38ba	80	3
f4ae23f0-da72-4b5e-80d2-eac5adff8d2d	10a93b7f-37f4-470c-a39e-e442b5437113	75	4
f4ae23f0-da72-4b5e-80d2-eac5adff8d2d	d4cf402c-1804-4bfc-af25-6b60196102a1	70	5
48102744-674a-4139-9202-b5309f6408d6	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	95	1
48102744-674a-4139-9202-b5309f6408d6	3141f563-5039-48a5-a7f1-eac9c29e38ba	85	2
48102744-674a-4139-9202-b5309f6408d6	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	80	3
48102744-674a-4139-9202-b5309f6408d6	e3fea1ab-20c7-45c0-8be6-0538353d16b3	75	4
48102744-674a-4139-9202-b5309f6408d6	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
0a8afc61-f4f1-4199-9fca-50acb7fd6901	495b763f-161e-4f28-818a-ae7ddb91c774	90	1
0a8afc61-f4f1-4199-9fca-50acb7fd6901	7879e3d8-bf89-4140-b863-4761ec613c4c	85	2
0a8afc61-f4f1-4199-9fca-50acb7fd6901	32b8ae1f-2a7e-4065-bea2-6392a15348c5	80	3
0a8afc61-f4f1-4199-9fca-50acb7fd6901	10a93b7f-37f4-470c-a39e-e442b5437113	75	4
0a8afc61-f4f1-4199-9fca-50acb7fd6901	89219724-7107-4ccf-9ccf-bb20d439a10f	70	5
ebf46448-a544-4310-be0d-422ef7a4cb8e	495b763f-161e-4f28-818a-ae7ddb91c774	95	1
ebf46448-a544-4310-be0d-422ef7a4cb8e	89219724-7107-4ccf-9ccf-bb20d439a10f	85	2
ebf46448-a544-4310-be0d-422ef7a4cb8e	32b8ae1f-2a7e-4065-bea2-6392a15348c5	80	3
ebf46448-a544-4310-be0d-422ef7a4cb8e	e3fea1ab-20c7-45c0-8be6-0538353d16b3	75	4
ebf46448-a544-4310-be0d-422ef7a4cb8e	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
57b46ceb-25cc-4199-8012-5bc765717a84	d4cf402c-1804-4bfc-af25-6b60196102a1	90	1
57b46ceb-25cc-4199-8012-5bc765717a84	3141f563-5039-48a5-a7f1-eac9c29e38ba	85	2
57b46ceb-25cc-4199-8012-5bc765717a84	89219724-7107-4ccf-9ccf-bb20d439a10f	80	3
57b46ceb-25cc-4199-8012-5bc765717a84	10a93b7f-37f4-470c-a39e-e442b5437113	75	4
57b46ceb-25cc-4199-8012-5bc765717a84	7879e3d8-bf89-4140-b863-4761ec613c4c	70	5
6d13868d-2e0f-41f9-a25a-6ca609740b50	6a657f15-2638-4401-a4cb-1cb3d78446be	95	1
6d13868d-2e0f-41f9-a25a-6ca609740b50	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	85	2
6d13868d-2e0f-41f9-a25a-6ca609740b50	d4cf402c-1804-4bfc-af25-6b60196102a1	80	3
6d13868d-2e0f-41f9-a25a-6ca609740b50	10a93b7f-37f4-470c-a39e-e442b5437113	75	4
6d13868d-2e0f-41f9-a25a-6ca609740b50	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	70	5
b1b782a4-1c73-42fc-a864-120b7dcdb6d6	89219724-7107-4ccf-9ccf-bb20d439a10f	95	1
b1b782a4-1c73-42fc-a864-120b7dcdb6d6	58174674-9bd1-4df8-8c10-9a50cd10b947	90	2
b1b782a4-1c73-42fc-a864-120b7dcdb6d6	6a657f15-2638-4401-a4cb-1cb3d78446be	85	3
b1b782a4-1c73-42fc-a864-120b7dcdb6d6	e3fea1ab-20c7-45c0-8be6-0538353d16b3	75	4
b1b782a4-1c73-42fc-a864-120b7dcdb6d6	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	70	5
59110147-0dd3-4c94-b06c-f80a08d09dc2	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	95	1
59110147-0dd3-4c94-b06c-f80a08d09dc2	3141f563-5039-48a5-a7f1-eac9c29e38ba	85	2
59110147-0dd3-4c94-b06c-f80a08d09dc2	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	80	3
59110147-0dd3-4c94-b06c-f80a08d09dc2	10a93b7f-37f4-470c-a39e-e442b5437113	75	4
59110147-0dd3-4c94-b06c-f80a08d09dc2	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	70	5
8c4c41bf-b35f-464b-be5f-11e7ebe18569	32b8ae1f-2a7e-4065-bea2-6392a15348c5	95	1
8c4c41bf-b35f-464b-be5f-11e7ebe18569	495b763f-161e-4f28-818a-ae7ddb91c774	85	2
8c4c41bf-b35f-464b-be5f-11e7ebe18569	f1fb6be8-89b9-4f13-b609-6a3565dd92b3	80	3
8c4c41bf-b35f-464b-be5f-11e7ebe18569	7879e3d8-bf89-4140-b863-4761ec613c4c	75	4
8c4c41bf-b35f-464b-be5f-11e7ebe18569	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
cb400a40-b9b3-49b4-a1d5-90cd684a69d2	d4cf402c-1804-4bfc-af25-6b60196102a1	95	1
cb400a40-b9b3-49b4-a1d5-90cd684a69d2	89219724-7107-4ccf-9ccf-bb20d439a10f	90	2
cb400a40-b9b3-49b4-a1d5-90cd684a69d2	3141f563-5039-48a5-a7f1-eac9c29e38ba	80	3
cb400a40-b9b3-49b4-a1d5-90cd684a69d2	f1fb6be8-89b9-4f13-b609-6a3565dd92b3	75	4
cb400a40-b9b3-49b4-a1d5-90cd684a69d2	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
2e09f8a6-623b-4612-a9f4-4c1fc8b85d1a	89219724-7107-4ccf-9ccf-bb20d439a10f	95	1
2e09f8a6-623b-4612-a9f4-4c1fc8b85d1a	6a657f15-2638-4401-a4cb-1cb3d78446be	85	2
2e09f8a6-623b-4612-a9f4-4c1fc8b85d1a	e41bfae9-b3a5-4661-a420-290d6c27da35	80	3
2e09f8a6-623b-4612-a9f4-4c1fc8b85d1a	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	75	4
2e09f8a6-623b-4612-a9f4-4c1fc8b85d1a	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
b0bc5542-772e-4673-9b0b-08a1ff1cd72d	d4cf402c-1804-4bfc-af25-6b60196102a1	95	1
b0bc5542-772e-4673-9b0b-08a1ff1cd72d	89219724-7107-4ccf-9ccf-bb20d439a10f	90	2
b0bc5542-772e-4673-9b0b-08a1ff1cd72d	32b8ae1f-2a7e-4065-bea2-6392a15348c5	80	3
b0bc5542-772e-4673-9b0b-08a1ff1cd72d	10a93b7f-37f4-470c-a39e-e442b5437113	75	4
b0bc5542-772e-4673-9b0b-08a1ff1cd72d	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
59b41a3b-fd13-4878-80c5-08012a9446eb	32b8ae1f-2a7e-4065-bea2-6392a15348c5	95	1
59b41a3b-fd13-4878-80c5-08012a9446eb	d4cf402c-1804-4bfc-af25-6b60196102a1	85	2
85d4e3e0-0d70-40f0-9136-a796dedee9e6	32b8ae1f-2a7e-4065-bea2-6392a15348c5	90	1
85d4e3e0-0d70-40f0-9136-a796dedee9e6	6a657f15-2638-4401-a4cb-1cb3d78446be	85	2
85d4e3e0-0d70-40f0-9136-a796dedee9e6	3141f563-5039-48a5-a7f1-eac9c29e38ba	80	3
85d4e3e0-0d70-40f0-9136-a796dedee9e6	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	75	4
85d4e3e0-0d70-40f0-9136-a796dedee9e6	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
022a4e77-f3c0-4504-9d5a-e2e12d178fb7	d4cf402c-1804-4bfc-af25-6b60196102a1	95	1
022a4e77-f3c0-4504-9d5a-e2e12d178fb7	89219724-7107-4ccf-9ccf-bb20d439a10f	90	2
022a4e77-f3c0-4504-9d5a-e2e12d178fb7	10a93b7f-37f4-470c-a39e-e442b5437113	80	3
022a4e77-f3c0-4504-9d5a-e2e12d178fb7	3141f563-5039-48a5-a7f1-eac9c29e38ba	75	4
022a4e77-f3c0-4504-9d5a-e2e12d178fb7	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	70	5
fbb2f6c1-a13d-42e9-8af9-3327159f0a8c	89219724-7107-4ccf-9ccf-bb20d439a10f	95	1
fbb2f6c1-a13d-42e9-8af9-3327159f0a8c	58174674-9bd1-4df8-8c10-9a50cd10b947	90	2
fbb2f6c1-a13d-42e9-8af9-3327159f0a8c	32b8ae1f-2a7e-4065-bea2-6392a15348c5	85	3
fbb2f6c1-a13d-42e9-8af9-3327159f0a8c	3141f563-5039-48a5-a7f1-eac9c29e38ba	80	4
fbb2f6c1-a13d-42e9-8af9-3327159f0a8c	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
a275de9a-5f98-4ee6-8a04-415330eb7c9b	d4cf402c-1804-4bfc-af25-6b60196102a1	95	1
a275de9a-5f98-4ee6-8a04-415330eb7c9b	32b8ae1f-2a7e-4065-bea2-6392a15348c5	85	2
a275de9a-5f98-4ee6-8a04-415330eb7c9b	3141f563-5039-48a5-a7f1-eac9c29e38ba	80	3
a275de9a-5f98-4ee6-8a04-415330eb7c9b	10a93b7f-37f4-470c-a39e-e442b5437113	75	4
a275de9a-5f98-4ee6-8a04-415330eb7c9b	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	70	5
59b41a3b-fd13-4878-80c5-08012a9446eb	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	80	3
59b41a3b-fd13-4878-80c5-08012a9446eb	10a93b7f-37f4-470c-a39e-e442b5437113	75	4
59b41a3b-fd13-4878-80c5-08012a9446eb	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
f42e1ed8-624f-43e1-b3e7-ab7b2de15f4c	3141f563-5039-48a5-a7f1-eac9c29e38ba	95	1
f42e1ed8-624f-43e1-b3e7-ab7b2de15f4c	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	85	2
f42e1ed8-624f-43e1-b3e7-ab7b2de15f4c	32b8ae1f-2a7e-4065-bea2-6392a15348c5	80	3
f42e1ed8-624f-43e1-b3e7-ab7b2de15f4c	10a93b7f-37f4-470c-a39e-e442b5437113	75	4
f42e1ed8-624f-43e1-b3e7-ab7b2de15f4c	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	70	5
579447bd-e5d6-45b4-83f8-addaa6c5ea8c	32b8ae1f-2a7e-4065-bea2-6392a15348c5	95	1
579447bd-e5d6-45b4-83f8-addaa6c5ea8c	7879e3d8-bf89-4140-b863-4761ec613c4c	85	2
579447bd-e5d6-45b4-83f8-addaa6c5ea8c	f1fb6be8-89b9-4f13-b609-6a3565dd92b3	80	3
579447bd-e5d6-45b4-83f8-addaa6c5ea8c	3141f563-5039-48a5-a7f1-eac9c29e38ba	75	4
579447bd-e5d6-45b4-83f8-addaa6c5ea8c	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
1cf242f8-2aed-4992-8e8f-d010156c0a0f	d4cf402c-1804-4bfc-af25-6b60196102a1	95	1
1cf242f8-2aed-4992-8e8f-d010156c0a0f	32b8ae1f-2a7e-4065-bea2-6392a15348c5	85	2
1cf242f8-2aed-4992-8e8f-d010156c0a0f	89219724-7107-4ccf-9ccf-bb20d439a10f	80	3
1cf242f8-2aed-4992-8e8f-d010156c0a0f	10a93b7f-37f4-470c-a39e-e442b5437113	75	4
1cf242f8-2aed-4992-8e8f-d010156c0a0f	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	70	5
d69f3606-a366-4aa1-aa3a-1dfc81dfe501	d4cf402c-1804-4bfc-af25-6b60196102a1	95	1
d69f3606-a366-4aa1-aa3a-1dfc81dfe501	3141f563-5039-48a5-a7f1-eac9c29e38ba	85	2
d69f3606-a366-4aa1-aa3a-1dfc81dfe501	89219724-7107-4ccf-9ccf-bb20d439a10f	80	3
d69f3606-a366-4aa1-aa3a-1dfc81dfe501	32b8ae1f-2a7e-4065-bea2-6392a15348c5	75	4
d69f3606-a366-4aa1-aa3a-1dfc81dfe501	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
d1e9245e-e54d-4473-a200-109c97d64c7e	495b763f-161e-4f28-818a-ae7ddb91c774	95	1
d1e9245e-e54d-4473-a200-109c97d64c7e	89219724-7107-4ccf-9ccf-bb20d439a10f	85	2
d1e9245e-e54d-4473-a200-109c97d64c7e	32b8ae1f-2a7e-4065-bea2-6392a15348c5	80	3
d1e9245e-e54d-4473-a200-109c97d64c7e	10a93b7f-37f4-470c-a39e-e442b5437113	75	4
d1e9245e-e54d-4473-a200-109c97d64c7e	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	70	5
fd9d9682-64a3-49e0-aebe-546de7ee7c13	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	95	1
fd9d9682-64a3-49e0-aebe-546de7ee7c13	3141f563-5039-48a5-a7f1-eac9c29e38ba	85	2
fd9d9682-64a3-49e0-aebe-546de7ee7c13	d4cf402c-1804-4bfc-af25-6b60196102a1	80	3
fd9d9682-64a3-49e0-aebe-546de7ee7c13	7879e3d8-bf89-4140-b863-4761ec613c4c	75	4
fd9d9682-64a3-49e0-aebe-546de7ee7c13	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
0b34e06a-42aa-4a0a-9560-2065ea434cc4	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	95	1
0b34e06a-42aa-4a0a-9560-2065ea434cc4	57844de5-c7e7-490b-8c70-9cd373df44b2	90	2
0b34e06a-42aa-4a0a-9560-2065ea434cc4	10a93b7f-37f4-470c-a39e-e442b5437113	80	3
0b34e06a-42aa-4a0a-9560-2065ea434cc4	89219724-7107-4ccf-9ccf-bb20d439a10f	75	4
0b34e06a-42aa-4a0a-9560-2065ea434cc4	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	70	5
3e2aeceb-01db-4847-b55e-c63f32b49f34	3141f563-5039-48a5-a7f1-eac9c29e38ba	95	1
3e2aeceb-01db-4847-b55e-c63f32b49f34	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	85	2
3e2aeceb-01db-4847-b55e-c63f32b49f34	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	80	3
3e2aeceb-01db-4847-b55e-c63f32b49f34	10a93b7f-37f4-470c-a39e-e442b5437113	75	4
3e2aeceb-01db-4847-b55e-c63f32b49f34	7879e3d8-bf89-4140-b863-4761ec613c4c	70	5
ea1b54d1-f3ad-4de4-9d3d-2a14af415cad	d4cf402c-1804-4bfc-af25-6b60196102a1	95	1
ea1b54d1-f3ad-4de4-9d3d-2a14af415cad	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	85	2
ea1b54d1-f3ad-4de4-9d3d-2a14af415cad	89219724-7107-4ccf-9ccf-bb20d439a10f	80	3
ea1b54d1-f3ad-4de4-9d3d-2a14af415cad	3141f563-5039-48a5-a7f1-eac9c29e38ba	75	4
ea1b54d1-f3ad-4de4-9d3d-2a14af415cad	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
e4bfaa3d-14b9-471d-8e01-d3efa473d74f	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	95	1
e4bfaa3d-14b9-471d-8e01-d3efa473d74f	3141f563-5039-48a5-a7f1-eac9c29e38ba	85	2
a91ae67a-695a-4cdc-a537-753e7469182d	16f221cc-38cc-4dc0-8a26-1cff4bc731db	95	1
a91ae67a-695a-4cdc-a537-753e7469182d	e3fea1ab-20c7-45c0-8be6-0538353d16b3	85	2
a91ae67a-695a-4cdc-a537-753e7469182d	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	80	3
a91ae67a-695a-4cdc-a537-753e7469182d	6a657f15-2638-4401-a4cb-1cb3d78446be	75	4
a91ae67a-695a-4cdc-a537-753e7469182d	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
8a55e6a6-c88d-4c6d-88e7-d4d07dca202b	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	95	1
8a55e6a6-c88d-4c6d-88e7-d4d07dca202b	3141f563-5039-48a5-a7f1-eac9c29e38ba	85	2
8a55e6a6-c88d-4c6d-88e7-d4d07dca202b	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	80	3
8a55e6a6-c88d-4c6d-88e7-d4d07dca202b	d4cf402c-1804-4bfc-af25-6b60196102a1	75	4
8a55e6a6-c88d-4c6d-88e7-d4d07dca202b	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
59a459d0-4195-4186-9b29-4a801aa14872	3141f563-5039-48a5-a7f1-eac9c29e38ba	90	1
59a459d0-4195-4186-9b29-4a801aa14872	6a657f15-2638-4401-a4cb-1cb3d78446be	85	2
59a459d0-4195-4186-9b29-4a801aa14872	7879e3d8-bf89-4140-b863-4761ec613c4c	80	3
59a459d0-4195-4186-9b29-4a801aa14872	32b8ae1f-2a7e-4065-bea2-6392a15348c5	75	4
59a459d0-4195-4186-9b29-4a801aa14872	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
47a8028b-d94e-4f27-b0b7-56a2ae1e8bae	1626400a-0417-4ff8-bfed-d89ef198074f	95	1
47a8028b-d94e-4f27-b0b7-56a2ae1e8bae	3141f563-5039-48a5-a7f1-eac9c29e38ba	85	2
47a8028b-d94e-4f27-b0b7-56a2ae1e8bae	e3fea1ab-20c7-45c0-8be6-0538353d16b3	80	3
47a8028b-d94e-4f27-b0b7-56a2ae1e8bae	10a93b7f-37f4-470c-a39e-e442b5437113	75	4
47a8028b-d94e-4f27-b0b7-56a2ae1e8bae	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	70	5
fc4e72d9-de13-42f3-a44a-529a89e1e2d4	65f3f958-a668-479f-83aa-f2b0b9bb8236	95	1
fc4e72d9-de13-42f3-a44a-529a89e1e2d4	10a93b7f-37f4-470c-a39e-e442b5437113	85	2
fc4e72d9-de13-42f3-a44a-529a89e1e2d4	89219724-7107-4ccf-9ccf-bb20d439a10f	80	3
fc4e72d9-de13-42f3-a44a-529a89e1e2d4	e3fea1ab-20c7-45c0-8be6-0538353d16b3	75	4
fc4e72d9-de13-42f3-a44a-529a89e1e2d4	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	70	5
7333c793-92dc-4d5a-b91a-0b3dcd894eb2	d4cf402c-1804-4bfc-af25-6b60196102a1	95	1
7333c793-92dc-4d5a-b91a-0b3dcd894eb2	89219724-7107-4ccf-9ccf-bb20d439a10f	90	2
7333c793-92dc-4d5a-b91a-0b3dcd894eb2	65f3f958-a668-479f-83aa-f2b0b9bb8236	80	3
7333c793-92dc-4d5a-b91a-0b3dcd894eb2	e3fea1ab-20c7-45c0-8be6-0538353d16b3	75	4
7333c793-92dc-4d5a-b91a-0b3dcd894eb2	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
2d7e52f0-0a83-46fd-908e-3bad0d6f2ebd	7879e3d8-bf89-4140-b863-4761ec613c4c	95	1
2d7e52f0-0a83-46fd-908e-3bad0d6f2ebd	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	85	2
2d7e52f0-0a83-46fd-908e-3bad0d6f2ebd	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	80	3
2d7e52f0-0a83-46fd-908e-3bad0d6f2ebd	32b8ae1f-2a7e-4065-bea2-6392a15348c5	75	4
2d7e52f0-0a83-46fd-908e-3bad0d6f2ebd	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
94daadee-0da8-419b-a232-88f91dfdefa5	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	95	1
94daadee-0da8-419b-a232-88f91dfdefa5	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	85	2
94daadee-0da8-419b-a232-88f91dfdefa5	32b8ae1f-2a7e-4065-bea2-6392a15348c5	80	3
94daadee-0da8-419b-a232-88f91dfdefa5	10a93b7f-37f4-470c-a39e-e442b5437113	75	4
94daadee-0da8-419b-a232-88f91dfdefa5	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	70	5
7845df49-d2ec-4e83-8e71-ac3a4a210ffa	d4cf402c-1804-4bfc-af25-6b60196102a1	90	1
7845df49-d2ec-4e83-8e71-ac3a4a210ffa	10a93b7f-37f4-470c-a39e-e442b5437113	85	2
7845df49-d2ec-4e83-8e71-ac3a4a210ffa	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	80	3
7845df49-d2ec-4e83-8e71-ac3a4a210ffa	1626400a-0417-4ff8-bfed-d89ef198074f	75	4
7845df49-d2ec-4e83-8e71-ac3a4a210ffa	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	70	5
d2a0f31c-8663-49d1-9132-0c3005d100e9	3141f563-5039-48a5-a7f1-eac9c29e38ba	95	1
d2a0f31c-8663-49d1-9132-0c3005d100e9	32b8ae1f-2a7e-4065-bea2-6392a15348c5	85	2
d2a0f31c-8663-49d1-9132-0c3005d100e9	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	80	3
d2a0f31c-8663-49d1-9132-0c3005d100e9	10a93b7f-37f4-470c-a39e-e442b5437113	75	4
d2a0f31c-8663-49d1-9132-0c3005d100e9	d4cf402c-1804-4bfc-af25-6b60196102a1	70	5
30a7e534-d700-4613-b061-6e9085db3e96	89219724-7107-4ccf-9ccf-bb20d439a10f	95	1
30a7e534-d700-4613-b061-6e9085db3e96	32b8ae1f-2a7e-4065-bea2-6392a15348c5	85	2
30a7e534-d700-4613-b061-6e9085db3e96	10a93b7f-37f4-470c-a39e-e442b5437113	80	3
30a7e534-d700-4613-b061-6e9085db3e96	65f3f958-a668-479f-83aa-f2b0b9bb8236	75	4
30a7e534-d700-4613-b061-6e9085db3e96	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	70	5
5c508d38-7c4b-4b8f-aeb1-f9e125d225bd	3141f563-5039-48a5-a7f1-eac9c29e38ba	95	1
5c508d38-7c4b-4b8f-aeb1-f9e125d225bd	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	85	2
5c508d38-7c4b-4b8f-aeb1-f9e125d225bd	7879e3d8-bf89-4140-b863-4761ec613c4c	80	3
5c508d38-7c4b-4b8f-aeb1-f9e125d225bd	d4cf402c-1804-4bfc-af25-6b60196102a1	75	4
5c508d38-7c4b-4b8f-aeb1-f9e125d225bd	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
e2f40d3e-b803-4edb-bee2-6b8a89aafca9	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	95	1
e2f40d3e-b803-4edb-bee2-6b8a89aafca9	e3fea1ab-20c7-45c0-8be6-0538353d16b3	85	2
e2f40d3e-b803-4edb-bee2-6b8a89aafca9	3141f563-5039-48a5-a7f1-eac9c29e38ba	80	3
e2f40d3e-b803-4edb-bee2-6b8a89aafca9	10a93b7f-37f4-470c-a39e-e442b5437113	75	4
e2f40d3e-b803-4edb-bee2-6b8a89aafca9	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	70	5
12a3d9a1-c44e-4fdf-aaf8-4eec621794b8	d4cf402c-1804-4bfc-af25-6b60196102a1	95	1
12a3d9a1-c44e-4fdf-aaf8-4eec621794b8	e3fea1ab-20c7-45c0-8be6-0538353d16b3	85	2
12a3d9a1-c44e-4fdf-aaf8-4eec621794b8	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	80	3
12a3d9a1-c44e-4fdf-aaf8-4eec621794b8	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	75	4
12a3d9a1-c44e-4fdf-aaf8-4eec621794b8	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	70	5
1b4f0479-08ff-4fb7-a48c-8d7d1a9319d7	89219724-7107-4ccf-9ccf-bb20d439a10f	90	1
1b4f0479-08ff-4fb7-a48c-8d7d1a9319d7	d4cf402c-1804-4bfc-af25-6b60196102a1	85	2
1b4f0479-08ff-4fb7-a48c-8d7d1a9319d7	32b8ae1f-2a7e-4065-bea2-6392a15348c5	80	3
1b4f0479-08ff-4fb7-a48c-8d7d1a9319d7	10a93b7f-37f4-470c-a39e-e442b5437113	75	4
1b4f0479-08ff-4fb7-a48c-8d7d1a9319d7	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
59dfaf31-6b17-4d0a-a15d-81cb250f40e4	d4cf402c-1804-4bfc-af25-6b60196102a1	95	1
59dfaf31-6b17-4d0a-a15d-81cb250f40e4	32b8ae1f-2a7e-4065-bea2-6392a15348c5	85	2
59dfaf31-6b17-4d0a-a15d-81cb250f40e4	89219724-7107-4ccf-9ccf-bb20d439a10f	80	3
59dfaf31-6b17-4d0a-a15d-81cb250f40e4	10a93b7f-37f4-470c-a39e-e442b5437113	75	4
59dfaf31-6b17-4d0a-a15d-81cb250f40e4	f1fb6be8-89b9-4f13-b609-6a3565dd92b3	70	5
cb7b75da-eca0-4e78-bbfa-5a01bf0eb4fb	7879e3d8-bf89-4140-b863-4761ec613c4c	95	1
cb7b75da-eca0-4e78-bbfa-5a01bf0eb4fb	3141f563-5039-48a5-a7f1-eac9c29e38ba	85	2
cb7b75da-eca0-4e78-bbfa-5a01bf0eb4fb	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	80	3
cb7b75da-eca0-4e78-bbfa-5a01bf0eb4fb	10a93b7f-37f4-470c-a39e-e442b5437113	75	4
cb7b75da-eca0-4e78-bbfa-5a01bf0eb4fb	32b8ae1f-2a7e-4065-bea2-6392a15348c5	70	5
0a6ef255-7fab-4a0b-b69a-3a95b77894b6	89219724-7107-4ccf-9ccf-bb20d439a10f	95	1
0a6ef255-7fab-4a0b-b69a-3a95b77894b6	58174674-9bd1-4df8-8c10-9a50cd10b947	90	2
0a6ef255-7fab-4a0b-b69a-3a95b77894b6	6a657f15-2638-4401-a4cb-1cb3d78446be	85	3
0a6ef255-7fab-4a0b-b69a-3a95b77894b6	e3fea1ab-20c7-45c0-8be6-0538353d16b3	75	4
0a6ef255-7fab-4a0b-b69a-3a95b77894b6	495b763f-161e-4f28-818a-ae7ddb91c774	70	5
ffa99d71-5c66-485b-962e-60b1383fd7a6	3141f563-5039-48a5-a7f1-eac9c29e38ba	95	1
ffa99d71-5c66-485b-962e-60b1383fd7a6	89219724-7107-4ccf-9ccf-bb20d439a10f	90	2
ffa99d71-5c66-485b-962e-60b1383fd7a6	10a93b7f-37f4-470c-a39e-e442b5437113	80	3
ffa99d71-5c66-485b-962e-60b1383fd7a6	32b8ae1f-2a7e-4065-bea2-6392a15348c5	75	4
ffa99d71-5c66-485b-962e-60b1383fd7a6	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	70	5
cc317f86-9b40-436e-92ef-0f0eab00699a	d4cf402c-1804-4bfc-af25-6b60196102a1	95	1
cc317f86-9b40-436e-92ef-0f0eab00699a	e3fea1ab-20c7-45c0-8be6-0538353d16b3	90	2
cc317f86-9b40-436e-92ef-0f0eab00699a	89219724-7107-4ccf-9ccf-bb20d439a10f	85	3
cc317f86-9b40-436e-92ef-0f0eab00699a	10a93b7f-37f4-470c-a39e-e442b5437113	75	4
cc317f86-9b40-436e-92ef-0f0eab00699a	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	70	5
31cc7a30-cd6a-4095-9662-2e562b960e4f	89219724-7107-4ccf-9ccf-bb20d439a10f	90	1
31cc7a30-cd6a-4095-9662-2e562b960e4f	10a93b7f-37f4-470c-a39e-e442b5437113	80	2
31cc7a30-cd6a-4095-9662-2e562b960e4f	65f3f958-a668-479f-83aa-f2b0b9bb8236	80	3
31cc7a30-cd6a-4095-9662-2e562b960e4f	3141f563-5039-48a5-a7f1-eac9c29e38ba	70	4
31cc7a30-cd6a-4095-9662-2e562b960e4f	e3fea1ab-20c7-45c0-8be6-0538353d16b3	70	5
7eb16ed2-8737-4b3a-8e55-76aa65f55ea6	d4cf402c-1804-4bfc-af25-6b60196102a1	95	1
7eb16ed2-8737-4b3a-8e55-76aa65f55ea6	3141f563-5039-48a5-a7f1-eac9c29e38ba	85	2
7eb16ed2-8737-4b3a-8e55-76aa65f55ea6	10a93b7f-37f4-470c-a39e-e442b5437113	80	3
7eb16ed2-8737-4b3a-8e55-76aa65f55ea6	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	75	4
7eb16ed2-8737-4b3a-8e55-76aa65f55ea6	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	70	5
1c13ab6e-6ce7-4c70-bd84-9f8bf4373d75	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	95	1
1c13ab6e-6ce7-4c70-bd84-9f8bf4373d75	32b8ae1f-2a7e-4065-bea2-6392a15348c5	85	2
1c13ab6e-6ce7-4c70-bd84-9f8bf4373d75	3141f563-5039-48a5-a7f1-eac9c29e38ba	80	3
1c13ab6e-6ce7-4c70-bd84-9f8bf4373d75	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	75	4
1c13ab6e-6ce7-4c70-bd84-9f8bf4373d75	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
654b5cd7-b1d8-478e-8930-7b1e302fd1ad	32b8ae1f-2a7e-4065-bea2-6392a15348c5	95	1
654b5cd7-b1d8-478e-8930-7b1e302fd1ad	d4cf402c-1804-4bfc-af25-6b60196102a1	85	2
654b5cd7-b1d8-478e-8930-7b1e302fd1ad	89219724-7107-4ccf-9ccf-bb20d439a10f	80	3
654b5cd7-b1d8-478e-8930-7b1e302fd1ad	10a93b7f-37f4-470c-a39e-e442b5437113	75	4
654b5cd7-b1d8-478e-8930-7b1e302fd1ad	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	70	5
2a992096-8c7a-41dd-98a7-2687949b3154	89219724-7107-4ccf-9ccf-bb20d439a10f	95	1
2a992096-8c7a-41dd-98a7-2687949b3154	58174674-9bd1-4df8-8c10-9a50cd10b947	90	2
2a992096-8c7a-41dd-98a7-2687949b3154	f1fb6be8-89b9-4f13-b609-6a3565dd92b3	80	3
2a992096-8c7a-41dd-98a7-2687949b3154	3141f563-5039-48a5-a7f1-eac9c29e38ba	75	4
2a992096-8c7a-41dd-98a7-2687949b3154	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
62caf1c8-0aed-4178-8905-e2973a1d16ce	6a657f15-2638-4401-a4cb-1cb3d78446be	95	1
62caf1c8-0aed-4178-8905-e2973a1d16ce	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	85	2
62caf1c8-0aed-4178-8905-e2973a1d16ce	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	80	3
62caf1c8-0aed-4178-8905-e2973a1d16ce	65f3f958-a668-479f-83aa-f2b0b9bb8236	75	4
62caf1c8-0aed-4178-8905-e2973a1d16ce	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
5fdd1f1f-324f-4fee-9186-fd01bab67c16	e3fea1ab-20c7-45c0-8be6-0538353d16b3	95	1
e4bfaa3d-14b9-471d-8e01-d3efa473d74f	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	80	3
e4bfaa3d-14b9-471d-8e01-d3efa473d74f	10a93b7f-37f4-470c-a39e-e442b5437113	75	4
e4bfaa3d-14b9-471d-8e01-d3efa473d74f	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	70	5
f3843583-d836-44b8-a9cf-edd9eb3ef39a	a4d72e96-a556-4a7c-95e8-d95f3e689b20	95	1
f3843583-d836-44b8-a9cf-edd9eb3ef39a	fd3ecda2-df68-461e-a1ca-5b56479e7ad8	88	2
f3843583-d836-44b8-a9cf-edd9eb3ef39a	e41bfae9-b3a5-4661-a420-290d6c27da35	82	3
f3843583-d836-44b8-a9cf-edd9eb3ef39a	6f53cc68-8d00-48a8-8137-76051eaabd3f	76	4
f3843583-d836-44b8-a9cf-edd9eb3ef39a	d4cf402c-1804-4bfc-af25-6b60196102a1	70	5
8ce290c7-1268-4414-8a17-9c39fe75bdfd	e55153a9-7d48-4956-9a15-f11205b95aa5	95	1
5fdd1f1f-324f-4fee-9186-fd01bab67c16	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	85	2
5fdd1f1f-324f-4fee-9186-fd01bab67c16	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	80	3
5fdd1f1f-324f-4fee-9186-fd01bab67c16	71232d6e-c5b8-4c28-89df-276a5f6aeb7d	75	4
5fdd1f1f-324f-4fee-9186-fd01bab67c16	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	70	5
b6891f3b-5f33-4b05-8ae5-e5d8deea26a9	65f3f958-a668-479f-83aa-f2b0b9bb8236	95	1
b6891f3b-5f33-4b05-8ae5-e5d8deea26a9	e3fea1ab-20c7-45c0-8be6-0538353d16b3	90	2
b6891f3b-5f33-4b05-8ae5-e5d8deea26a9	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	80	3
b6891f3b-5f33-4b05-8ae5-e5d8deea26a9	89219724-7107-4ccf-9ccf-bb20d439a10f	75	4
b6891f3b-5f33-4b05-8ae5-e5d8deea26a9	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
be44a0c2-782d-4834-ac0a-83de9f1db9db	10a93b7f-37f4-470c-a39e-e442b5437113	95	1
be44a0c2-782d-4834-ac0a-83de9f1db9db	3141f563-5039-48a5-a7f1-eac9c29e38ba	85	2
be44a0c2-782d-4834-ac0a-83de9f1db9db	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	80	3
be44a0c2-782d-4834-ac0a-83de9f1db9db	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	75	4
be44a0c2-782d-4834-ac0a-83de9f1db9db	f1fb6be8-89b9-4f13-b609-6a3565dd92b3	70	5
d36eded5-b156-431d-b081-6542eb328e72	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	95	1
d36eded5-b156-431d-b081-6542eb328e72	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	85	2
d36eded5-b156-431d-b081-6542eb328e72	3141f563-5039-48a5-a7f1-eac9c29e38ba	80	3
d36eded5-b156-431d-b081-6542eb328e72	32b8ae1f-2a7e-4065-bea2-6392a15348c5	75	4
d36eded5-b156-431d-b081-6542eb328e72	d4cf402c-1804-4bfc-af25-6b60196102a1	70	5
c5932bdc-6417-41a4-a3ff-1f50c74710a6	89219724-7107-4ccf-9ccf-bb20d439a10f	95	1
c5932bdc-6417-41a4-a3ff-1f50c74710a6	58174674-9bd1-4df8-8c10-9a50cd10b947	90	2
c5932bdc-6417-41a4-a3ff-1f50c74710a6	d4cf402c-1804-4bfc-af25-6b60196102a1	80	3
c5932bdc-6417-41a4-a3ff-1f50c74710a6	32b8ae1f-2a7e-4065-bea2-6392a15348c5	75	4
c5932bdc-6417-41a4-a3ff-1f50c74710a6	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
afb5363d-7f58-4914-8c91-3273be4edf73	89219724-7107-4ccf-9ccf-bb20d439a10f	95	1
afb5363d-7f58-4914-8c91-3273be4edf73	6a657f15-2638-4401-a4cb-1cb3d78446be	85	2
afb5363d-7f58-4914-8c91-3273be4edf73	e41bfae9-b3a5-4661-a420-290d6c27da35	80	3
afb5363d-7f58-4914-8c91-3273be4edf73	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	75	4
afb5363d-7f58-4914-8c91-3273be4edf73	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
4f5a298c-8b10-4cd4-8fbc-e97640007ee2	d4cf402c-1804-4bfc-af25-6b60196102a1	95	1
4f5a298c-8b10-4cd4-8fbc-e97640007ee2	89219724-7107-4ccf-9ccf-bb20d439a10f	90	2
4f5a298c-8b10-4cd4-8fbc-e97640007ee2	32b8ae1f-2a7e-4065-bea2-6392a15348c5	80	3
4f5a298c-8b10-4cd4-8fbc-e97640007ee2	10a93b7f-37f4-470c-a39e-e442b5437113	75	4
4f5a298c-8b10-4cd4-8fbc-e97640007ee2	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
9a7be05b-90aa-4416-a136-864793f53174	e3fea1ab-20c7-45c0-8be6-0538353d16b3	95	1
9a7be05b-90aa-4416-a136-864793f53174	e41bfae9-b3a5-4661-a420-290d6c27da35	90	2
9a7be05b-90aa-4416-a136-864793f53174	89219724-7107-4ccf-9ccf-bb20d439a10f	80	3
9a7be05b-90aa-4416-a136-864793f53174	10a93b7f-37f4-470c-a39e-e442b5437113	75	4
9a7be05b-90aa-4416-a136-864793f53174	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	70	5
f6d65d00-7f47-4b55-8590-fdab9ce175aa	7879e3d8-bf89-4140-b863-4761ec613c4c	95	1
f6d65d00-7f47-4b55-8590-fdab9ce175aa	32b8ae1f-2a7e-4065-bea2-6392a15348c5	85	2
f6d65d00-7f47-4b55-8590-fdab9ce175aa	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	80	3
f6d65d00-7f47-4b55-8590-fdab9ce175aa	10a93b7f-37f4-470c-a39e-e442b5437113	75	4
f6d65d00-7f47-4b55-8590-fdab9ce175aa	f1fb6be8-89b9-4f13-b609-6a3565dd92b3	70	5
8a1a3ee2-53d8-4d82-bdfa-8536f274a554	32b8ae1f-2a7e-4065-bea2-6392a15348c5	95	1
8a1a3ee2-53d8-4d82-bdfa-8536f274a554	10a93b7f-37f4-470c-a39e-e442b5437113	85	2
8a1a3ee2-53d8-4d82-bdfa-8536f274a554	3141f563-5039-48a5-a7f1-eac9c29e38ba	80	3
8a1a3ee2-53d8-4d82-bdfa-8536f274a554	f1fb6be8-89b9-4f13-b609-6a3565dd92b3	75	4
8a1a3ee2-53d8-4d82-bdfa-8536f274a554	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	70	5
99c569c0-af20-41ab-9b5a-6274d66d1523	3141f563-5039-48a5-a7f1-eac9c29e38ba	95	1
99c569c0-af20-41ab-9b5a-6274d66d1523	d4cf402c-1804-4bfc-af25-6b60196102a1	85	2
99c569c0-af20-41ab-9b5a-6274d66d1523	89219724-7107-4ccf-9ccf-bb20d439a10f	80	3
99c569c0-af20-41ab-9b5a-6274d66d1523	10a93b7f-37f4-470c-a39e-e442b5437113	75	4
99c569c0-af20-41ab-9b5a-6274d66d1523	f1fb6be8-89b9-4f13-b609-6a3565dd92b3	70	5
4edadee5-1848-452a-9dec-461df9ed5d93	e3fea1ab-20c7-45c0-8be6-0538353d16b3	95	1
4edadee5-1848-452a-9dec-461df9ed5d93	3141f563-5039-48a5-a7f1-eac9c29e38ba	85	2
4edadee5-1848-452a-9dec-461df9ed5d93	1626400a-0417-4ff8-bfed-d89ef198074f	80	3
4edadee5-1848-452a-9dec-461df9ed5d93	d4cf402c-1804-4bfc-af25-6b60196102a1	75	4
4edadee5-1848-452a-9dec-461df9ed5d93	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
3ea1c578-aacf-41b2-96e9-42c5f6cba8a0	89219724-7107-4ccf-9ccf-bb20d439a10f	95	1
3ea1c578-aacf-41b2-96e9-42c5f6cba8a0	6a657f15-2638-4401-a4cb-1cb3d78446be	85	2
3ea1c578-aacf-41b2-96e9-42c5f6cba8a0	65f3f958-a668-479f-83aa-f2b0b9bb8236	80	3
3ea1c578-aacf-41b2-96e9-42c5f6cba8a0	d4cf402c-1804-4bfc-af25-6b60196102a1	75	4
3ea1c578-aacf-41b2-96e9-42c5f6cba8a0	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
4842b000-f95f-41e2-a84c-1ed94570969a	6a657f15-2638-4401-a4cb-1cb3d78446be	95	1
4842b000-f95f-41e2-a84c-1ed94570969a	10a93b7f-37f4-470c-a39e-e442b5437113	85	2
4842b000-f95f-41e2-a84c-1ed94570969a	89219724-7107-4ccf-9ccf-bb20d439a10f	80	3
4842b000-f95f-41e2-a84c-1ed94570969a	f1fb6be8-89b9-4f13-b609-6a3565dd92b3	75	4
4842b000-f95f-41e2-a84c-1ed94570969a	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
f45e847d-b184-445a-bdfe-b4727456655a	89219724-7107-4ccf-9ccf-bb20d439a10f	95	1
f45e847d-b184-445a-bdfe-b4727456655a	58174674-9bd1-4df8-8c10-9a50cd10b947	90	2
f45e847d-b184-445a-bdfe-b4727456655a	32b8ae1f-2a7e-4065-bea2-6392a15348c5	85	3
f45e847d-b184-445a-bdfe-b4727456655a	10a93b7f-37f4-470c-a39e-e442b5437113	75	4
f45e847d-b184-445a-bdfe-b4727456655a	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
27cb9ac7-885f-4658-8d5f-f6f16d855bb8	89219724-7107-4ccf-9ccf-bb20d439a10f	95	1
27cb9ac7-885f-4658-8d5f-f6f16d855bb8	6a657f15-2638-4401-a4cb-1cb3d78446be	85	2
27cb9ac7-885f-4658-8d5f-f6f16d855bb8	32b8ae1f-2a7e-4065-bea2-6392a15348c5	80	3
27cb9ac7-885f-4658-8d5f-f6f16d855bb8	65f3f958-a668-479f-83aa-f2b0b9bb8236	75	4
27cb9ac7-885f-4658-8d5f-f6f16d855bb8	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
8ce290c7-1268-4414-8a17-9c39fe75bdfd	05650238-fd2f-492d-a3cf-48e1fed78e5b	88	2
8ce290c7-1268-4414-8a17-9c39fe75bdfd	ec62c48b-a0fe-44b8-b10f-31472c3ce534	82	3
8ce290c7-1268-4414-8a17-9c39fe75bdfd	10a93b7f-37f4-470c-a39e-e442b5437113	76	4
8ce290c7-1268-4414-8a17-9c39fe75bdfd	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	70	5
bf87b360-f6e2-49a1-804f-381c7a3367d2	10a93b7f-37f4-470c-a39e-e442b5437113	95	1
bf87b360-f6e2-49a1-804f-381c7a3367d2	05650238-fd2f-492d-a3cf-48e1fed78e5b	88	2
bf87b360-f6e2-49a1-804f-381c7a3367d2	3141f563-5039-48a5-a7f1-eac9c29e38ba	82	3
bf87b360-f6e2-49a1-804f-381c7a3367d2	60aea58c-7c6f-469c-9b77-5c4be6d53627	76	4
bf87b360-f6e2-49a1-804f-381c7a3367d2	ec62c48b-a0fe-44b8-b10f-31472c3ce534	70	5
e10a08bd-b188-4489-af6c-3677266a5acb	a4f798bc-096d-453b-8500-7b6972445ef0	95	1
e10a08bd-b188-4489-af6c-3677266a5acb	e3fea1ab-20c7-45c0-8be6-0538353d16b3	88	2
e10a08bd-b188-4489-af6c-3677266a5acb	71232d6e-c5b8-4c28-89df-276a5f6aeb7d	82	3
e10a08bd-b188-4489-af6c-3677266a5acb	10a93b7f-37f4-470c-a39e-e442b5437113	76	4
e10a08bd-b188-4489-af6c-3677266a5acb	d4cf402c-1804-4bfc-af25-6b60196102a1	70	5
b27bd564-a3ae-40eb-bbda-8e2113fa98e7	58174674-9bd1-4df8-8c10-9a50cd10b947	95	1
b27bd564-a3ae-40eb-bbda-8e2113fa98e7	8448bdf8-bd41-4744-ba6e-c41e04e8d943	88	2
b27bd564-a3ae-40eb-bbda-8e2113fa98e7	3fdac98c-68d0-4abe-a48f-baefdfd0ddd3	82	3
b27bd564-a3ae-40eb-bbda-8e2113fa98e7	65f3f958-a668-479f-83aa-f2b0b9bb8236	76	4
b27bd564-a3ae-40eb-bbda-8e2113fa98e7	495b763f-161e-4f28-818a-ae7ddb91c774	70	5
9e99faab-0dc6-4609-9d21-399ad41cbd4c	c0d57ce2-2d49-4f6b-b6f2-4c1703cfc233	95	1
9e99faab-0dc6-4609-9d21-399ad41cbd4c	a583b16a-ebc0-4862-94e8-e865d460d43b	88	2
9e99faab-0dc6-4609-9d21-399ad41cbd4c	e41bfae9-b3a5-4661-a420-290d6c27da35	82	3
9e99faab-0dc6-4609-9d21-399ad41cbd4c	495b763f-161e-4f28-818a-ae7ddb91c774	76	4
9e99faab-0dc6-4609-9d21-399ad41cbd4c	ea568ffc-763b-43ce-9a4b-b336681549de	70	5
326bb60b-6441-44f8-9f10-9774e0d96ddc	c0d57ce2-2d49-4f6b-b6f2-4c1703cfc233	95	1
326bb60b-6441-44f8-9f10-9774e0d96ddc	ec62c48b-a0fe-44b8-b10f-31472c3ce534	88	2
326bb60b-6441-44f8-9f10-9774e0d96ddc	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	82	3
326bb60b-6441-44f8-9f10-9774e0d96ddc	a583b16a-ebc0-4862-94e8-e865d460d43b	76	4
326bb60b-6441-44f8-9f10-9774e0d96ddc	3141f563-5039-48a5-a7f1-eac9c29e38ba	70	5
78f666b8-a54c-41bf-ad88-388edf5fb7cd	a325ce68-df8f-4a68-b099-177438f808ab	95	1
78f666b8-a54c-41bf-ad88-388edf5fb7cd	e55153a9-7d48-4956-9a15-f11205b95aa5	88	2
78f666b8-a54c-41bf-ad88-388edf5fb7cd	a4b479b4-db92-441b-8212-bb252a3eab17	82	3
78f666b8-a54c-41bf-ad88-388edf5fb7cd	10a93b7f-37f4-470c-a39e-e442b5437113	76	4
78f666b8-a54c-41bf-ad88-388edf5fb7cd	b72bef64-da93-42a8-8393-c920aafd58fa	70	5
4392706b-317c-4bac-867a-39b77e001b11	190b252f-496d-4bb5-b806-6d53b901219f	95	1
4392706b-317c-4bac-867a-39b77e001b11	a4f798bc-096d-453b-8500-7b6972445ef0	88	2
4392706b-317c-4bac-867a-39b77e001b11	10a93b7f-37f4-470c-a39e-e442b5437113	82	3
4392706b-317c-4bac-867a-39b77e001b11	d4cf402c-1804-4bfc-af25-6b60196102a1	76	4
4392706b-317c-4bac-867a-39b77e001b11	71232d6e-c5b8-4c28-89df-276a5f6aeb7d	70	5
fce5624c-1c57-45d1-ac5d-2bb5d3b840b0	e41bfae9-b3a5-4661-a420-290d6c27da35	95	1
fce5624c-1c57-45d1-ac5d-2bb5d3b840b0	3141f563-5039-48a5-a7f1-eac9c29e38ba	88	2
fce5624c-1c57-45d1-ac5d-2bb5d3b840b0	5f82665b-b506-4c6f-8a44-a7b0995d6154	82	3
fce5624c-1c57-45d1-ac5d-2bb5d3b840b0	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	76	4
fce5624c-1c57-45d1-ac5d-2bb5d3b840b0	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
14938ed6-4005-40da-a871-134ce00c28cb	e55153a9-7d48-4956-9a15-f11205b95aa5	95	1
14938ed6-4005-40da-a871-134ce00c28cb	05650238-fd2f-492d-a3cf-48e1fed78e5b	88	2
14938ed6-4005-40da-a871-134ce00c28cb	e41bfae9-b3a5-4661-a420-290d6c27da35	82	3
14938ed6-4005-40da-a871-134ce00c28cb	16f221cc-38cc-4dc0-8a26-1cff4bc731db	76	4
14938ed6-4005-40da-a871-134ce00c28cb	ec62c48b-a0fe-44b8-b10f-31472c3ce534	70	5
0c254ff6-8827-4179-b1c5-6b8d10c324c5	26742fe4-2f0d-4219-ac58-8a4b998c74de	95	1
0c254ff6-8827-4179-b1c5-6b8d10c324c5	ec62c48b-a0fe-44b8-b10f-31472c3ce534	88	2
0c254ff6-8827-4179-b1c5-6b8d10c324c5	a4b479b4-db92-441b-8212-bb252a3eab17	82	3
0c254ff6-8827-4179-b1c5-6b8d10c324c5	3141f563-5039-48a5-a7f1-eac9c29e38ba	76	4
0c254ff6-8827-4179-b1c5-6b8d10c324c5	e55153a9-7d48-4956-9a15-f11205b95aa5	70	5
479e2fc2-7ca0-49bd-a203-537b70bbd22f	f7359039-5a58-4d5a-b8db-6554711779b7	95	1
479e2fc2-7ca0-49bd-a203-537b70bbd22f	fd3ecda2-df68-461e-a1ca-5b56479e7ad8	88	2
479e2fc2-7ca0-49bd-a203-537b70bbd22f	bfe0311d-ea78-47ea-aeae-f79796ea244b	82	3
479e2fc2-7ca0-49bd-a203-537b70bbd22f	e41bfae9-b3a5-4661-a420-290d6c27da35	76	4
479e2fc2-7ca0-49bd-a203-537b70bbd22f	e3fea1ab-20c7-45c0-8be6-0538353d16b3	70	5
80016815-b549-4dbd-9882-1d23e036b880	a4d72e96-a556-4a7c-95e8-d95f3e689b20	95	1
80016815-b549-4dbd-9882-1d23e036b880	e55153a9-7d48-4956-9a15-f11205b95aa5	88	2
80016815-b549-4dbd-9882-1d23e036b880	218052d5-b081-4493-8a9e-4930165074eb	82	3
80016815-b549-4dbd-9882-1d23e036b880	a4b479b4-db92-441b-8212-bb252a3eab17	76	4
80016815-b549-4dbd-9882-1d23e036b880	3141f563-5039-48a5-a7f1-eac9c29e38ba	70	5
e2c598d0-97e7-43b4-b51d-16f04be0cc13	7879e3d8-bf89-4140-b863-4761ec613c4c	95	1
e2c598d0-97e7-43b4-b51d-16f04be0cc13	ec62c48b-a0fe-44b8-b10f-31472c3ce534	88	2
e2c598d0-97e7-43b4-b51d-16f04be0cc13	3141f563-5039-48a5-a7f1-eac9c29e38ba	82	3
e2c598d0-97e7-43b4-b51d-16f04be0cc13	e3fea1ab-20c7-45c0-8be6-0538353d16b3	76	4
e2c598d0-97e7-43b4-b51d-16f04be0cc13	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
3c7d1aeb-77a7-460e-b9cf-87b79db7a38b	e55153a9-7d48-4956-9a15-f11205b95aa5	95	1
3c7d1aeb-77a7-460e-b9cf-87b79db7a38b	ec62c48b-a0fe-44b8-b10f-31472c3ce534	88	2
3c7d1aeb-77a7-460e-b9cf-87b79db7a38b	65f3f958-a668-479f-83aa-f2b0b9bb8236	82	3
3c7d1aeb-77a7-460e-b9cf-87b79db7a38b	a4b479b4-db92-441b-8212-bb252a3eab17	76	4
3c7d1aeb-77a7-460e-b9cf-87b79db7a38b	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
85d4b481-27a7-40b3-a1ec-cd3395a97194	e3fea1ab-20c7-45c0-8be6-0538353d16b3	95	1
85d4b481-27a7-40b3-a1ec-cd3395a97194	65f3f958-a668-479f-83aa-f2b0b9bb8236	88	2
85d4b481-27a7-40b3-a1ec-cd3395a97194	05650238-fd2f-492d-a3cf-48e1fed78e5b	82	3
85d4b481-27a7-40b3-a1ec-cd3395a97194	3141f563-5039-48a5-a7f1-eac9c29e38ba	76	4
85d4b481-27a7-40b3-a1ec-cd3395a97194	7229e940-e527-493a-8873-88fa0e32b911	70	5
f7a40dcd-62dd-417a-b2a6-15f863f10f7f	ec62c48b-a0fe-44b8-b10f-31472c3ce534	95	1
f7a40dcd-62dd-417a-b2a6-15f863f10f7f	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	88	2
f7a40dcd-62dd-417a-b2a6-15f863f10f7f	e41bfae9-b3a5-4661-a420-290d6c27da35	82	3
f7a40dcd-62dd-417a-b2a6-15f863f10f7f	e55153a9-7d48-4956-9a15-f11205b95aa5	76	4
f7a40dcd-62dd-417a-b2a6-15f863f10f7f	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	70	5
f302d48a-6e27-4e81-b46a-725c5024a4a5	ec62c48b-a0fe-44b8-b10f-31472c3ce534	76	4
f302d48a-6e27-4e81-b46a-725c5024a4a5	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
6a0f6f75-6de5-4e9b-863d-d9c7aa5a18f0	e55153a9-7d48-4956-9a15-f11205b95aa5	95	1
6a0f6f75-6de5-4e9b-863d-d9c7aa5a18f0	7879e3d8-bf89-4140-b863-4761ec613c4c	88	2
6a0f6f75-6de5-4e9b-863d-d9c7aa5a18f0	5051e95d-93a2-4c5a-b1ed-854b13b067f8	82	3
6a0f6f75-6de5-4e9b-863d-d9c7aa5a18f0	a4b479b4-db92-441b-8212-bb252a3eab17	76	4
6a0f6f75-6de5-4e9b-863d-d9c7aa5a18f0	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
ee04f101-b607-4ee7-81d4-d311d0ab312b	e55153a9-7d48-4956-9a15-f11205b95aa5	95	1
ee04f101-b607-4ee7-81d4-d311d0ab312b	5051e95d-93a2-4c5a-b1ed-854b13b067f8	88	2
ee04f101-b607-4ee7-81d4-d311d0ab312b	ec62c48b-a0fe-44b8-b10f-31472c3ce534	82	3
ee04f101-b607-4ee7-81d4-d311d0ab312b	7879e3d8-bf89-4140-b863-4761ec613c4c	76	4
ee04f101-b607-4ee7-81d4-d311d0ab312b	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	70	5
ff44fb09-7713-4a5f-a831-e3ba2fb1a992	e55153a9-7d48-4956-9a15-f11205b95aa5	95	1
ff44fb09-7713-4a5f-a831-e3ba2fb1a992	71232d6e-c5b8-4c28-89df-276a5f6aeb7d	88	2
ff44fb09-7713-4a5f-a831-e3ba2fb1a992	10a93b7f-37f4-470c-a39e-e442b5437113	82	3
ff44fb09-7713-4a5f-a831-e3ba2fb1a992	a4b479b4-db92-441b-8212-bb252a3eab17	76	4
ff44fb09-7713-4a5f-a831-e3ba2fb1a992	ec62c48b-a0fe-44b8-b10f-31472c3ce534	70	5
659df86c-cea1-459c-9e9f-2df775204f2c	e55153a9-7d48-4956-9a15-f11205b95aa5	95	1
659df86c-cea1-459c-9e9f-2df775204f2c	05650238-fd2f-492d-a3cf-48e1fed78e5b	88	2
659df86c-cea1-459c-9e9f-2df775204f2c	ec62c48b-a0fe-44b8-b10f-31472c3ce534	82	3
659df86c-cea1-459c-9e9f-2df775204f2c	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	76	4
659df86c-cea1-459c-9e9f-2df775204f2c	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
904ce087-3ae9-49d3-936e-ae6885300c67	e55153a9-7d48-4956-9a15-f11205b95aa5	95	1
904ce087-3ae9-49d3-936e-ae6885300c67	10a93b7f-37f4-470c-a39e-e442b5437113	88	2
904ce087-3ae9-49d3-936e-ae6885300c67	60aea58c-7c6f-469c-9b77-5c4be6d53627	82	3
904ce087-3ae9-49d3-936e-ae6885300c67	ec62c48b-a0fe-44b8-b10f-31472c3ce534	76	4
904ce087-3ae9-49d3-936e-ae6885300c67	3141f563-5039-48a5-a7f1-eac9c29e38ba	70	5
8b936488-54bb-4aef-aa2b-9d9fc982a6a1	a4d72e96-a556-4a7c-95e8-d95f3e689b20	95	1
8b936488-54bb-4aef-aa2b-9d9fc982a6a1	b6778cfa-3b15-42ac-9866-0e92279cdf0e	88	2
8b936488-54bb-4aef-aa2b-9d9fc982a6a1	f8b8d0cd-1a77-4469-8bb6-d0b2b16e4a5f	82	3
8b936488-54bb-4aef-aa2b-9d9fc982a6a1	7879e3d8-bf89-4140-b863-4761ec613c4c	76	4
8b936488-54bb-4aef-aa2b-9d9fc982a6a1	ec62c48b-a0fe-44b8-b10f-31472c3ce534	70	5
10df2330-c31b-454b-8f35-8e4ee05ca445	495b763f-161e-4f28-818a-ae7ddb91c774	95	1
10df2330-c31b-454b-8f35-8e4ee05ca445	10a93b7f-37f4-470c-a39e-e442b5437113	88	2
10df2330-c31b-454b-8f35-8e4ee05ca445	d4cf402c-1804-4bfc-af25-6b60196102a1	82	3
10df2330-c31b-454b-8f35-8e4ee05ca445	5f82665b-b506-4c6f-8a44-a7b0995d6154	76	4
10df2330-c31b-454b-8f35-8e4ee05ca445	60aea58c-7c6f-469c-9b77-5c4be6d53627	70	5
29c9ddae-afd0-4702-9732-c9dd05409ca7	a4b479b4-db92-441b-8212-bb252a3eab17	95	1
29c9ddae-afd0-4702-9732-c9dd05409ca7	cc8f7fcc-e3c2-45a4-ad9d-84c0bb88a6d1	88	2
29c9ddae-afd0-4702-9732-c9dd05409ca7	e41bfae9-b3a5-4661-a420-290d6c27da35	82	3
29c9ddae-afd0-4702-9732-c9dd05409ca7	10a93b7f-37f4-470c-a39e-e442b5437113	76	4
29c9ddae-afd0-4702-9732-c9dd05409ca7	3141f563-5039-48a5-a7f1-eac9c29e38ba	70	5
b6fe8f53-aade-4915-9eff-0e671fa904ae	e55153a9-7d48-4956-9a15-f11205b95aa5	95	1
b6fe8f53-aade-4915-9eff-0e671fa904ae	71232d6e-c5b8-4c28-89df-276a5f6aeb7d	88	2
b6fe8f53-aade-4915-9eff-0e671fa904ae	5051e95d-93a2-4c5a-b1ed-854b13b067f8	82	3
b6fe8f53-aade-4915-9eff-0e671fa904ae	a4b479b4-db92-441b-8212-bb252a3eab17	76	4
b6fe8f53-aade-4915-9eff-0e671fa904ae	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
740d30b9-8169-48b7-b8db-77db73c7f15b	e55153a9-7d48-4956-9a15-f11205b95aa5	95	1
740d30b9-8169-48b7-b8db-77db73c7f15b	c0d57ce2-2d49-4f6b-b6f2-4c1703cfc233	88	2
740d30b9-8169-48b7-b8db-77db73c7f15b	65f3f958-a668-479f-83aa-f2b0b9bb8236	82	3
740d30b9-8169-48b7-b8db-77db73c7f15b	ec62c48b-a0fe-44b8-b10f-31472c3ce534	76	4
740d30b9-8169-48b7-b8db-77db73c7f15b	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
cfab21bb-400c-4884-aba9-a08668026a8c	390ad509-80c0-437a-a112-3af1739f0328	95	1
cfab21bb-400c-4884-aba9-a08668026a8c	e55153a9-7d48-4956-9a15-f11205b95aa5	88	2
cfab21bb-400c-4884-aba9-a08668026a8c	7879e3d8-bf89-4140-b863-4761ec613c4c	82	3
cfab21bb-400c-4884-aba9-a08668026a8c	fb9a0faa-a040-4a28-bc20-071d9478f86e	76	4
cfab21bb-400c-4884-aba9-a08668026a8c	a4b479b4-db92-441b-8212-bb252a3eab17	70	5
daa86be6-7e10-4c4f-80d6-38bdd01adc39	e41bfae9-b3a5-4661-a420-290d6c27da35	95	1
daa86be6-7e10-4c4f-80d6-38bdd01adc39	070f1fad-3607-4af4-8bed-7b9a048b9462	88	2
daa86be6-7e10-4c4f-80d6-38bdd01adc39	ec62c48b-a0fe-44b8-b10f-31472c3ce534	82	3
daa86be6-7e10-4c4f-80d6-38bdd01adc39	65f3f958-a668-479f-83aa-f2b0b9bb8236	76	4
daa86be6-7e10-4c4f-80d6-38bdd01adc39	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	70	5
bfe66f71-0b3f-48d6-ae17-3579fa5955d2	db1725c8-4559-481a-b000-6138cf655ca2	95	1
bfe66f71-0b3f-48d6-ae17-3579fa5955d2	4d70c0f8-46bd-4387-909a-ca7dd78144d4	88	2
bfe66f71-0b3f-48d6-ae17-3579fa5955d2	390ad509-80c0-437a-a112-3af1739f0328	82	3
bfe66f71-0b3f-48d6-ae17-3579fa5955d2	fb9a0faa-a040-4a28-bc20-071d9478f86e	76	4
bfe66f71-0b3f-48d6-ae17-3579fa5955d2	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	70	5
e247941c-13bb-4492-b6aa-5d2ffb4a9697	6a1a5fb1-7ba0-466e-8a3d-ffe566e37050	95	1
e247941c-13bb-4492-b6aa-5d2ffb4a9697	fb9a0faa-a040-4a28-bc20-071d9478f86e	88	2
e247941c-13bb-4492-b6aa-5d2ffb4a9697	dd848e96-9cb9-4f64-aa5b-347aae129fd0	82	3
e247941c-13bb-4492-b6aa-5d2ffb4a9697	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	76	4
e247941c-13bb-4492-b6aa-5d2ffb4a9697	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
ed9289e2-1605-4b32-882a-13022ad8d23f	b82523a2-bf3a-4e7e-ab75-733b68c863ac	95	1
ed9289e2-1605-4b32-882a-13022ad8d23f	070f1fad-3607-4af4-8bed-7b9a048b9462	88	2
ed9289e2-1605-4b32-882a-13022ad8d23f	d4cf402c-1804-4bfc-af25-6b60196102a1	82	3
ed9289e2-1605-4b32-882a-13022ad8d23f	e41bfae9-b3a5-4661-a420-290d6c27da35	76	4
ed9289e2-1605-4b32-882a-13022ad8d23f	7229e940-e527-493a-8873-88fa0e32b911	70	5
cdff64c6-23d9-4f6b-8a82-597f9fe21252	fb9a0faa-a040-4a28-bc20-071d9478f86e	95	1
cdff64c6-23d9-4f6b-8a82-597f9fe21252	c0d57ce2-2d49-4f6b-b6f2-4c1703cfc233	88	2
cdff64c6-23d9-4f6b-8a82-597f9fe21252	b6778cfa-3b15-42ac-9866-0e92279cdf0e	82	3
cdff64c6-23d9-4f6b-8a82-597f9fe21252	e41bfae9-b3a5-4661-a420-290d6c27da35	76	4
cdff64c6-23d9-4f6b-8a82-597f9fe21252	ec62c48b-a0fe-44b8-b10f-31472c3ce534	70	5
05f759bd-1f4f-4c05-a48c-8a2254e4e6b0	390ad509-80c0-437a-a112-3af1739f0328	95	1
05f759bd-1f4f-4c05-a48c-8a2254e4e6b0	fb9a0faa-a040-4a28-bc20-071d9478f86e	88	2
05f759bd-1f4f-4c05-a48c-8a2254e4e6b0	d4cf402c-1804-4bfc-af25-6b60196102a1	82	3
05f759bd-1f4f-4c05-a48c-8a2254e4e6b0	65f3f958-a668-479f-83aa-f2b0b9bb8236	76	4
05f759bd-1f4f-4c05-a48c-8a2254e4e6b0	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
d506b07e-7e0c-48f6-90cc-85cb01c1dfcf	ec62c48b-a0fe-44b8-b10f-31472c3ce534	95	1
d506b07e-7e0c-48f6-90cc-85cb01c1dfcf	e41bfae9-b3a5-4661-a420-290d6c27da35	88	2
d506b07e-7e0c-48f6-90cc-85cb01c1dfcf	65f3f958-a668-479f-83aa-f2b0b9bb8236	82	3
d506b07e-7e0c-48f6-90cc-85cb01c1dfcf	e3fea1ab-20c7-45c0-8be6-0538353d16b3	76	4
d506b07e-7e0c-48f6-90cc-85cb01c1dfcf	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
4e9f33ef-4565-4855-b62d-5cf3c43145cc	10a93b7f-37f4-470c-a39e-e442b5437113	95	1
4e9f33ef-4565-4855-b62d-5cf3c43145cc	ec62c48b-a0fe-44b8-b10f-31472c3ce534	88	2
4e9f33ef-4565-4855-b62d-5cf3c43145cc	3141f563-5039-48a5-a7f1-eac9c29e38ba	82	3
4e9f33ef-4565-4855-b62d-5cf3c43145cc	65f3f958-a668-479f-83aa-f2b0b9bb8236	76	4
4e9f33ef-4565-4855-b62d-5cf3c43145cc	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	70	5
6710dad2-5d74-4fdd-b8b6-1cba5b41700d	e3fea1ab-20c7-45c0-8be6-0538353d16b3	95	1
6710dad2-5d74-4fdd-b8b6-1cba5b41700d	65f3f958-a668-479f-83aa-f2b0b9bb8236	88	2
6710dad2-5d74-4fdd-b8b6-1cba5b41700d	e41bfae9-b3a5-4661-a420-290d6c27da35	82	3
6710dad2-5d74-4fdd-b8b6-1cba5b41700d	fb9a0faa-a040-4a28-bc20-071d9478f86e	76	4
6710dad2-5d74-4fdd-b8b6-1cba5b41700d	16f221cc-38cc-4dc0-8a26-1cff4bc731db	70	5
0a75d486-578f-4ff3-9d36-7f6f8dab6580	495b763f-161e-4f28-818a-ae7ddb91c774	95	1
0a75d486-578f-4ff3-9d36-7f6f8dab6580	10a93b7f-37f4-470c-a39e-e442b5437113	88	2
0a75d486-578f-4ff3-9d36-7f6f8dab6580	65f3f958-a668-479f-83aa-f2b0b9bb8236	82	3
0a75d486-578f-4ff3-9d36-7f6f8dab6580	d4cf402c-1804-4bfc-af25-6b60196102a1	76	4
0a75d486-578f-4ff3-9d36-7f6f8dab6580	7229e940-e527-493a-8873-88fa0e32b911	70	5
9bc5ebc2-2d14-4cac-995a-f68644aa470f	e55153a9-7d48-4956-9a15-f11205b95aa5	95	1
9bc5ebc2-2d14-4cac-995a-f68644aa470f	10a93b7f-37f4-470c-a39e-e442b5437113	88	2
9bc5ebc2-2d14-4cac-995a-f68644aa470f	3141f563-5039-48a5-a7f1-eac9c29e38ba	82	3
9bc5ebc2-2d14-4cac-995a-f68644aa470f	60aea58c-7c6f-469c-9b77-5c4be6d53627	76	4
9bc5ebc2-2d14-4cac-995a-f68644aa470f	ec62c48b-a0fe-44b8-b10f-31472c3ce534	70	5
e049d23f-ffcb-492a-b8c8-b3c85cdf904f	6da5e4f3-3920-4f6c-9bb0-e501af6c5a81	95	1
e049d23f-ffcb-492a-b8c8-b3c85cdf904f	3ecaafca-c58f-46ff-a4e4-04857f267270	88	2
e049d23f-ffcb-492a-b8c8-b3c85cdf904f	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	82	3
e049d23f-ffcb-492a-b8c8-b3c85cdf904f	e41bfae9-b3a5-4661-a420-290d6c27da35	76	4
e049d23f-ffcb-492a-b8c8-b3c85cdf904f	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
e9580454-bcd2-48f6-bfe5-8bebfd8bfe5f	a4d72e96-a556-4a7c-95e8-d95f3e689b20	95	1
e9580454-bcd2-48f6-bfe5-8bebfd8bfe5f	e41bfae9-b3a5-4661-a420-290d6c27da35	88	2
e9580454-bcd2-48f6-bfe5-8bebfd8bfe5f	3141f563-5039-48a5-a7f1-eac9c29e38ba	82	3
e9580454-bcd2-48f6-bfe5-8bebfd8bfe5f	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	76	4
e9580454-bcd2-48f6-bfe5-8bebfd8bfe5f	fb7494b3-479c-4f1a-a828-b3c2daed6ffb	70	5
d373522a-ee6a-4a93-82c3-d097101bd6db	05650238-fd2f-492d-a3cf-48e1fed78e5b	95	1
d373522a-ee6a-4a93-82c3-d097101bd6db	65f3f958-a668-479f-83aa-f2b0b9bb8236	88	2
d373522a-ee6a-4a93-82c3-d097101bd6db	e3fea1ab-20c7-45c0-8be6-0538353d16b3	82	3
d373522a-ee6a-4a93-82c3-d097101bd6db	16f221cc-38cc-4dc0-8a26-1cff4bc731db	76	4
d373522a-ee6a-4a93-82c3-d097101bd6db	ec62c48b-a0fe-44b8-b10f-31472c3ce534	70	5
abfdfdef-4e7e-4c38-968c-f4d88d5d0ff4	1d27fb4b-f609-4c06-bde0-417e4ad0fccd	95	1
abfdfdef-4e7e-4c38-968c-f4d88d5d0ff4	e41bfae9-b3a5-4661-a420-290d6c27da35	88	2
abfdfdef-4e7e-4c38-968c-f4d88d5d0ff4	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	82	3
abfdfdef-4e7e-4c38-968c-f4d88d5d0ff4	390ad509-80c0-437a-a112-3af1739f0328	76	4
abfdfdef-4e7e-4c38-968c-f4d88d5d0ff4	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
43383ca1-daab-4dd3-8e8d-784a7414bf57	a4d72e96-a556-4a7c-95e8-d95f3e689b20	95	1
43383ca1-daab-4dd3-8e8d-784a7414bf57	3141f563-5039-48a5-a7f1-eac9c29e38ba	88	2
43383ca1-daab-4dd3-8e8d-784a7414bf57	e41bfae9-b3a5-4661-a420-290d6c27da35	82	3
43383ca1-daab-4dd3-8e8d-784a7414bf57	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	76	4
43383ca1-daab-4dd3-8e8d-784a7414bf57	e55153a9-7d48-4956-9a15-f11205b95aa5	70	5
e80beb5a-00f2-4ed2-8a1e-ea66794da288	60aea58c-7c6f-469c-9b77-5c4be6d53627	95	1
e80beb5a-00f2-4ed2-8a1e-ea66794da288	e55153a9-7d48-4956-9a15-f11205b95aa5	88	2
e80beb5a-00f2-4ed2-8a1e-ea66794da288	05650238-fd2f-492d-a3cf-48e1fed78e5b	82	3
e80beb5a-00f2-4ed2-8a1e-ea66794da288	7879e3d8-bf89-4140-b863-4761ec613c4c	76	4
e80beb5a-00f2-4ed2-8a1e-ea66794da288	ec62c48b-a0fe-44b8-b10f-31472c3ce534	70	5
76783e87-3b7f-410f-8560-13535cbd0431	b72bef64-da93-42a8-8393-c920aafd58fa	95	1
76783e87-3b7f-410f-8560-13535cbd0431	e55153a9-7d48-4956-9a15-f11205b95aa5	88	2
76783e87-3b7f-410f-8560-13535cbd0431	05650238-fd2f-492d-a3cf-48e1fed78e5b	82	3
76783e87-3b7f-410f-8560-13535cbd0431	e41bfae9-b3a5-4661-a420-290d6c27da35	76	4
76783e87-3b7f-410f-8560-13535cbd0431	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
4c28cde6-9244-4748-8da3-a164a1d3a560	e55153a9-7d48-4956-9a15-f11205b95aa5	95	1
4c28cde6-9244-4748-8da3-a164a1d3a560	ec62c48b-a0fe-44b8-b10f-31472c3ce534	88	2
4c28cde6-9244-4748-8da3-a164a1d3a560	a4b479b4-db92-441b-8212-bb252a3eab17	82	3
4c28cde6-9244-4748-8da3-a164a1d3a560	05650238-fd2f-492d-a3cf-48e1fed78e5b	76	4
4c28cde6-9244-4748-8da3-a164a1d3a560	7879e3d8-bf89-4140-b863-4761ec613c4c	70	5
3e7bbc35-a560-42bc-8617-40a3cd74827a	d4cf402c-1804-4bfc-af25-6b60196102a1	95	1
3e7bbc35-a560-42bc-8617-40a3cd74827a	8d60a1e7-8e37-4f80-8204-d80744eeb5ee	88	2
3e7bbc35-a560-42bc-8617-40a3cd74827a	5f82665b-b506-4c6f-8a44-a7b0995d6154	82	3
3e7bbc35-a560-42bc-8617-40a3cd74827a	8b242d94-26f4-4347-8476-f79bccc7c051	76	4
3e7bbc35-a560-42bc-8617-40a3cd74827a	7229e940-e527-493a-8873-88fa0e32b911	70	5
4f9d493f-bab8-4ea3-8cd4-bc152ea9a2a4	05650238-fd2f-492d-a3cf-48e1fed78e5b	95	1
4f9d493f-bab8-4ea3-8cd4-bc152ea9a2a4	e0d53d64-bd08-43b0-a7f4-8946d726fe10	88	2
4f9d493f-bab8-4ea3-8cd4-bc152ea9a2a4	10a93b7f-37f4-470c-a39e-e442b5437113	82	3
4f9d493f-bab8-4ea3-8cd4-bc152ea9a2a4	aa41fdb2-8138-41df-8269-5ec82f857a25	76	4
4f9d493f-bab8-4ea3-8cd4-bc152ea9a2a4	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
dcf4d80c-05b3-48ee-976b-30eaf422b597	ec62c48b-a0fe-44b8-b10f-31472c3ce534	95	1
dcf4d80c-05b3-48ee-976b-30eaf422b597	ea568ffc-763b-43ce-9a4b-b336681549de	88	2
dcf4d80c-05b3-48ee-976b-30eaf422b597	ed7e663b-cf6c-4394-aa41-5efa7e75b1aa	82	3
dcf4d80c-05b3-48ee-976b-30eaf422b597	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	76	4
dcf4d80c-05b3-48ee-976b-30eaf422b597	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
1d080ae5-5366-49eb-b607-62616c9038fc	dadef46b-479a-4249-98bd-959633a032fb	95	1
1d080ae5-5366-49eb-b607-62616c9038fc	d4cf402c-1804-4bfc-af25-6b60196102a1	88	2
1d080ae5-5366-49eb-b607-62616c9038fc	7229e940-e527-493a-8873-88fa0e32b911	82	3
1d080ae5-5366-49eb-b607-62616c9038fc	5f82665b-b506-4c6f-8a44-a7b0995d6154	76	4
1d080ae5-5366-49eb-b607-62616c9038fc	3fdac98c-68d0-4abe-a48f-baefdfd0ddd3	70	5
06e810f1-2dba-405a-ad71-9ebda8a08c80	e55153a9-7d48-4956-9a15-f11205b95aa5	95	1
06e810f1-2dba-405a-ad71-9ebda8a08c80	71232d6e-c5b8-4c28-89df-276a5f6aeb7d	88	2
06e810f1-2dba-405a-ad71-9ebda8a08c80	05650238-fd2f-492d-a3cf-48e1fed78e5b	82	3
06e810f1-2dba-405a-ad71-9ebda8a08c80	fb9a0faa-a040-4a28-bc20-071d9478f86e	76	4
06e810f1-2dba-405a-ad71-9ebda8a08c80	a4b479b4-db92-441b-8212-bb252a3eab17	70	5
92dc9eec-c14b-4985-8142-540ca06308b2	3141f563-5039-48a5-a7f1-eac9c29e38ba	95	1
92dc9eec-c14b-4985-8142-540ca06308b2	d4cf402c-1804-4bfc-af25-6b60196102a1	88	2
92dc9eec-c14b-4985-8142-540ca06308b2	10a93b7f-37f4-470c-a39e-e442b5437113	82	3
92dc9eec-c14b-4985-8142-540ca06308b2	6f53cc68-8d00-48a8-8137-76051eaabd3f	76	4
92dc9eec-c14b-4985-8142-540ca06308b2	ec62c48b-a0fe-44b8-b10f-31472c3ce534	70	5
66215338-6427-4b49-a126-f132ba519439	3ecaafca-c58f-46ff-a4e4-04857f267270	95	1
66215338-6427-4b49-a126-f132ba519439	e41bfae9-b3a5-4661-a420-290d6c27da35	88	2
66215338-6427-4b49-a126-f132ba519439	6f53cc68-8d00-48a8-8137-76051eaabd3f	82	3
66215338-6427-4b49-a126-f132ba519439	60aea58c-7c6f-469c-9b77-5c4be6d53627	76	4
66215338-6427-4b49-a126-f132ba519439	ec62c48b-a0fe-44b8-b10f-31472c3ce534	70	5
0d0b6b8d-4567-47be-840d-933fe96498cf	e41bfae9-b3a5-4661-a420-290d6c27da35	95	1
0d0b6b8d-4567-47be-840d-933fe96498cf	ea863799-f2ad-49ac-8ce7-07d67eb225a0	88	2
0d0b6b8d-4567-47be-840d-933fe96498cf	ea568ffc-763b-43ce-9a4b-b336681549de	82	3
0d0b6b8d-4567-47be-840d-933fe96498cf	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	76	4
0d0b6b8d-4567-47be-840d-933fe96498cf	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
e9eaf761-89f7-4116-8ff3-8a129cd1bd69	05650238-fd2f-492d-a3cf-48e1fed78e5b	95	1
e9eaf761-89f7-4116-8ff3-8a129cd1bd69	fb9a0faa-a040-4a28-bc20-071d9478f86e	88	2
e9eaf761-89f7-4116-8ff3-8a129cd1bd69	e41bfae9-b3a5-4661-a420-290d6c27da35	82	3
e9eaf761-89f7-4116-8ff3-8a129cd1bd69	ec62c48b-a0fe-44b8-b10f-31472c3ce534	76	4
e9eaf761-89f7-4116-8ff3-8a129cd1bd69	e55153a9-7d48-4956-9a15-f11205b95aa5	70	5
a7336368-440f-4f4b-85cd-54066467d79a	05650238-fd2f-492d-a3cf-48e1fed78e5b	95	1
a7336368-440f-4f4b-85cd-54066467d79a	fb9a0faa-a040-4a28-bc20-071d9478f86e	88	2
a7336368-440f-4f4b-85cd-54066467d79a	3fdac98c-68d0-4abe-a48f-baefdfd0ddd3	82	3
a7336368-440f-4f4b-85cd-54066467d79a	65f3f958-a668-479f-83aa-f2b0b9bb8236	76	4
a7336368-440f-4f4b-85cd-54066467d79a	7229e940-e527-493a-8873-88fa0e32b911	70	5
613da40e-cea6-49b4-a284-360b449c48fc	65f3f958-a668-479f-83aa-f2b0b9bb8236	95	1
613da40e-cea6-49b4-a284-360b449c48fc	c0d57ce2-2d49-4f6b-b6f2-4c1703cfc233	88	2
613da40e-cea6-49b4-a284-360b449c48fc	d4cf402c-1804-4bfc-af25-6b60196102a1	82	3
613da40e-cea6-49b4-a284-360b449c48fc	2bd72a45-07e2-46e0-9363-6e31351791e4	76	4
613da40e-cea6-49b4-a284-360b449c48fc	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
491e9b15-3ab0-4131-b469-e645cbafe7be	fb9a0faa-a040-4a28-bc20-071d9478f86e	95	1
491e9b15-3ab0-4131-b469-e645cbafe7be	00c23f76-407c-4121-8bd1-8f7f9e533c9f	88	2
491e9b15-3ab0-4131-b469-e645cbafe7be	05650238-fd2f-492d-a3cf-48e1fed78e5b	82	3
491e9b15-3ab0-4131-b469-e645cbafe7be	65f3f958-a668-479f-83aa-f2b0b9bb8236	76	4
491e9b15-3ab0-4131-b469-e645cbafe7be	ec62c48b-a0fe-44b8-b10f-31472c3ce534	70	5
38a49429-9679-4194-af1b-287261dd0258	e55153a9-7d48-4956-9a15-f11205b95aa5	95	1
38a49429-9679-4194-af1b-287261dd0258	a4b479b4-db92-441b-8212-bb252a3eab17	88	2
38a49429-9679-4194-af1b-287261dd0258	26742fe4-2f0d-4219-ac58-8a4b998c74de	82	3
38a49429-9679-4194-af1b-287261dd0258	ec62c48b-a0fe-44b8-b10f-31472c3ce534	76	4
38a49429-9679-4194-af1b-287261dd0258	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
e2ff5d78-74e7-4bdf-be25-08804796ca26	ec62c48b-a0fe-44b8-b10f-31472c3ce534	95	1
e2ff5d78-74e7-4bdf-be25-08804796ca26	05650238-fd2f-492d-a3cf-48e1fed78e5b	88	2
e2ff5d78-74e7-4bdf-be25-08804796ca26	d4cf402c-1804-4bfc-af25-6b60196102a1	82	3
e2ff5d78-74e7-4bdf-be25-08804796ca26	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	76	4
e2ff5d78-74e7-4bdf-be25-08804796ca26	aa41fdb2-8138-41df-8269-5ec82f857a25	70	5
db23f5a3-26c4-42ed-b209-9c884e21b45d	25348e0f-a2de-4168-8f6d-87d4c4c998d9	95	1
db23f5a3-26c4-42ed-b209-9c884e21b45d	5051e95d-93a2-4c5a-b1ed-854b13b067f8	88	2
db23f5a3-26c4-42ed-b209-9c884e21b45d	e55153a9-7d48-4956-9a15-f11205b95aa5	82	3
db23f5a3-26c4-42ed-b209-9c884e21b45d	ec62c48b-a0fe-44b8-b10f-31472c3ce534	76	4
db23f5a3-26c4-42ed-b209-9c884e21b45d	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	70	5
d48b933b-b1c5-4a1b-8f3d-beff03f3751d	e41bfae9-b3a5-4661-a420-290d6c27da35	95	1
d48b933b-b1c5-4a1b-8f3d-beff03f3751d	f7359039-5a58-4d5a-b8db-6554711779b7	88	2
d48b933b-b1c5-4a1b-8f3d-beff03f3751d	0768a2a1-6fca-4185-886e-e3b50c4461f3	82	3
d48b933b-b1c5-4a1b-8f3d-beff03f3751d	3ecaafca-c58f-46ff-a4e4-04857f267270	76	4
d48b933b-b1c5-4a1b-8f3d-beff03f3751d	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	70	5
d2862041-da7d-4bd6-a2b8-d04cccded51a	390ad509-80c0-437a-a112-3af1739f0328	95	1
d2862041-da7d-4bd6-a2b8-d04cccded51a	e55153a9-7d48-4956-9a15-f11205b95aa5	88	2
d2862041-da7d-4bd6-a2b8-d04cccded51a	7879e3d8-bf89-4140-b863-4761ec613c4c	82	3
d2862041-da7d-4bd6-a2b8-d04cccded51a	fb9a0faa-a040-4a28-bc20-071d9478f86e	76	4
d2862041-da7d-4bd6-a2b8-d04cccded51a	a4b479b4-db92-441b-8212-bb252a3eab17	70	5
7c24a04a-ebf6-46dd-9901-b990b1256737	bfe0311d-ea78-47ea-aeae-f79796ea244b	95	1
7c24a04a-ebf6-46dd-9901-b990b1256737	a4d72e96-a556-4a7c-95e8-d95f3e689b20	88	2
7c24a04a-ebf6-46dd-9901-b990b1256737	e41bfae9-b3a5-4661-a420-290d6c27da35	82	3
7c24a04a-ebf6-46dd-9901-b990b1256737	ea863799-f2ad-49ac-8ce7-07d67eb225a0	76	4
7c24a04a-ebf6-46dd-9901-b990b1256737	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	70	5
798238eb-5828-4dc2-ab17-9d1cfa155707	ec62c48b-a0fe-44b8-b10f-31472c3ce534	95	1
798238eb-5828-4dc2-ab17-9d1cfa155707	5051e95d-93a2-4c5a-b1ed-854b13b067f8	88	2
798238eb-5828-4dc2-ab17-9d1cfa155707	e41bfae9-b3a5-4661-a420-290d6c27da35	82	3
798238eb-5828-4dc2-ab17-9d1cfa155707	10a93b7f-37f4-470c-a39e-e442b5437113	76	4
798238eb-5828-4dc2-ab17-9d1cfa155707	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
eadd89e8-76eb-4100-8697-129659c9d61f	26742fe4-2f0d-4219-ac58-8a4b998c74de	95	1
eadd89e8-76eb-4100-8697-129659c9d61f	3141f563-5039-48a5-a7f1-eac9c29e38ba	88	2
eadd89e8-76eb-4100-8697-129659c9d61f	10a93b7f-37f4-470c-a39e-e442b5437113	82	3
eadd89e8-76eb-4100-8697-129659c9d61f	ec62c48b-a0fe-44b8-b10f-31472c3ce534	76	4
eadd89e8-76eb-4100-8697-129659c9d61f	7879e3d8-bf89-4140-b863-4761ec613c4c	70	5
7bf105e4-aa67-41e6-bb33-307472564c0b	65f3f958-a668-479f-83aa-f2b0b9bb8236	95	1
7bf105e4-aa67-41e6-bb33-307472564c0b	ec62c48b-a0fe-44b8-b10f-31472c3ce534	88	2
7bf105e4-aa67-41e6-bb33-307472564c0b	10a93b7f-37f4-470c-a39e-e442b5437113	82	3
7bf105e4-aa67-41e6-bb33-307472564c0b	e41bfae9-b3a5-4661-a420-290d6c27da35	76	4
7bf105e4-aa67-41e6-bb33-307472564c0b	16f221cc-38cc-4dc0-8a26-1cff4bc731db	70	5
3f3738dc-5461-4fa6-b08d-30878345c90e	e55153a9-7d48-4956-9a15-f11205b95aa5	95	1
3f3738dc-5461-4fa6-b08d-30878345c90e	05650238-fd2f-492d-a3cf-48e1fed78e5b	88	2
3f3738dc-5461-4fa6-b08d-30878345c90e	ec62c48b-a0fe-44b8-b10f-31472c3ce534	82	3
3f3738dc-5461-4fa6-b08d-30878345c90e	5051e95d-93a2-4c5a-b1ed-854b13b067f8	76	4
3f3738dc-5461-4fa6-b08d-30878345c90e	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
5a9c924e-72eb-4ce3-8d8c-eabc915bdd42	5051e95d-93a2-4c5a-b1ed-854b13b067f8	95	1
5a9c924e-72eb-4ce3-8d8c-eabc915bdd42	ec62c48b-a0fe-44b8-b10f-31472c3ce534	88	2
5a9c924e-72eb-4ce3-8d8c-eabc915bdd42	7879e3d8-bf89-4140-b863-4761ec613c4c	82	3
5a9c924e-72eb-4ce3-8d8c-eabc915bdd42	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	76	4
5a9c924e-72eb-4ce3-8d8c-eabc915bdd42	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
a0c92910-dd21-4ce4-88b5-228809a08fb2	ec62c48b-a0fe-44b8-b10f-31472c3ce534	95	1
a0c92910-dd21-4ce4-88b5-228809a08fb2	fd3ecda2-df68-461e-a1ca-5b56479e7ad8	88	2
a0c92910-dd21-4ce4-88b5-228809a08fb2	fb9a0faa-a040-4a28-bc20-071d9478f86e	82	3
a0c92910-dd21-4ce4-88b5-228809a08fb2	10a93b7f-37f4-470c-a39e-e442b5437113	76	4
a0c92910-dd21-4ce4-88b5-228809a08fb2	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
3e360ffd-8f9f-48af-a987-4a3bb3cc9102	e3fea1ab-20c7-45c0-8be6-0538353d16b3	95	1
3e360ffd-8f9f-48af-a987-4a3bb3cc9102	fb9a0faa-a040-4a28-bc20-071d9478f86e	88	2
3e360ffd-8f9f-48af-a987-4a3bb3cc9102	dd848e96-9cb9-4f64-aa5b-347aae129fd0	82	3
3e360ffd-8f9f-48af-a987-4a3bb3cc9102	65f3f958-a668-479f-83aa-f2b0b9bb8236	76	4
3e360ffd-8f9f-48af-a987-4a3bb3cc9102	7229e940-e527-493a-8873-88fa0e32b911	70	5
18fe0d89-f42c-4d10-8b5e-39be04ac3fd0	65f3f958-a668-479f-83aa-f2b0b9bb8236	95	1
18fe0d89-f42c-4d10-8b5e-39be04ac3fd0	16f221cc-38cc-4dc0-8a26-1cff4bc731db	88	2
18fe0d89-f42c-4d10-8b5e-39be04ac3fd0	05650238-fd2f-492d-a3cf-48e1fed78e5b	82	3
18fe0d89-f42c-4d10-8b5e-39be04ac3fd0	ec62c48b-a0fe-44b8-b10f-31472c3ce534	76	4
18fe0d89-f42c-4d10-8b5e-39be04ac3fd0	2bd72a45-07e2-46e0-9363-6e31351791e4	70	5
50db0df3-bac9-4680-988f-dee91ccc20a2	e55153a9-7d48-4956-9a15-f11205b95aa5	95	1
50db0df3-bac9-4680-988f-dee91ccc20a2	a4b479b4-db92-441b-8212-bb252a3eab17	88	2
50db0df3-bac9-4680-988f-dee91ccc20a2	7879e3d8-bf89-4140-b863-4761ec613c4c	82	3
50db0df3-bac9-4680-988f-dee91ccc20a2	f1fb6be8-89b9-4f13-b609-6a3565dd92b3	76	4
50db0df3-bac9-4680-988f-dee91ccc20a2	2f78c0dd-da66-47ed-af29-d2e1303f4ef0	70	5
d56709d5-6cf8-44a1-b2b8-51e398ded2b6	e55153a9-7d48-4956-9a15-f11205b95aa5	95	1
d56709d5-6cf8-44a1-b2b8-51e398ded2b6	5051e95d-93a2-4c5a-b1ed-854b13b067f8	88	2
d56709d5-6cf8-44a1-b2b8-51e398ded2b6	7879e3d8-bf89-4140-b863-4761ec613c4c	82	3
d56709d5-6cf8-44a1-b2b8-51e398ded2b6	a4b479b4-db92-441b-8212-bb252a3eab17	76	4
d56709d5-6cf8-44a1-b2b8-51e398ded2b6	fb9a0faa-a040-4a28-bc20-071d9478f86e	70	5
358fa7bd-95ed-470f-b25e-edd42b7691c0	e3fea1ab-20c7-45c0-8be6-0538353d16b3	95	1
358fa7bd-95ed-470f-b25e-edd42b7691c0	fb9a0faa-a040-4a28-bc20-071d9478f86e	88	2
358fa7bd-95ed-470f-b25e-edd42b7691c0	65f3f958-a668-479f-83aa-f2b0b9bb8236	82	3
358fa7bd-95ed-470f-b25e-edd42b7691c0	16f221cc-38cc-4dc0-8a26-1cff4bc731db	76	4
358fa7bd-95ed-470f-b25e-edd42b7691c0	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	70	5
ba4a47a1-5195-4b55-ab53-960b38e29435	7e33f833-8ab4-42d4-98bb-4cf932cb7da8	95	1
ba4a47a1-5195-4b55-ab53-960b38e29435	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	88	2
ba4a47a1-5195-4b55-ab53-960b38e29435	e41bfae9-b3a5-4661-a420-290d6c27da35	82	3
ba4a47a1-5195-4b55-ab53-960b38e29435	fb9a0faa-a040-4a28-bc20-071d9478f86e	76	4
ba4a47a1-5195-4b55-ab53-960b38e29435	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
f98acd25-867a-495a-8f2d-bc4bc3ca21f6	1d27fb4b-f609-4c06-bde0-417e4ad0fccd	95	1
f98acd25-867a-495a-8f2d-bc4bc3ca21f6	b72bef64-da93-42a8-8393-c920aafd58fa	88	2
f98acd25-867a-495a-8f2d-bc4bc3ca21f6	cd0894a4-ad94-4a87-a548-49c139603812	82	3
f98acd25-867a-495a-8f2d-bc4bc3ca21f6	e41bfae9-b3a5-4661-a420-290d6c27da35	76	4
f98acd25-867a-495a-8f2d-bc4bc3ca21f6	190b252f-496d-4bb5-b806-6d53b901219f	70	5
26a5b7ba-78af-4733-9d28-16ffa0ed7c14	43b9d7ac-cfcd-4c7a-889c-1227fc5eb054	95	1
26a5b7ba-78af-4733-9d28-16ffa0ed7c14	65f3f958-a668-479f-83aa-f2b0b9bb8236	88	2
26a5b7ba-78af-4733-9d28-16ffa0ed7c14	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	82	3
26a5b7ba-78af-4733-9d28-16ffa0ed7c14	fb9a0faa-a040-4a28-bc20-071d9478f86e	76	4
26a5b7ba-78af-4733-9d28-16ffa0ed7c14	2bd72a45-07e2-46e0-9363-6e31351791e4	70	5
ac55e1ba-d972-45e5-bc02-5f6b62d13b8c	65f3f958-a668-479f-83aa-f2b0b9bb8236	95	1
ac55e1ba-d972-45e5-bc02-5f6b62d13b8c	ec62c48b-a0fe-44b8-b10f-31472c3ce534	88	2
ac55e1ba-d972-45e5-bc02-5f6b62d13b8c	2bd72a45-07e2-46e0-9363-6e31351791e4	82	3
ac55e1ba-d972-45e5-bc02-5f6b62d13b8c	16f221cc-38cc-4dc0-8a26-1cff4bc731db	76	4
ac55e1ba-d972-45e5-bc02-5f6b62d13b8c	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
588d6543-eef6-4d84-b019-4d7a8b9fba06	65f3f958-a668-479f-83aa-f2b0b9bb8236	95	1
588d6543-eef6-4d84-b019-4d7a8b9fba06	495b763f-161e-4f28-818a-ae7ddb91c774	88	2
588d6543-eef6-4d84-b019-4d7a8b9fba06	7229e940-e527-493a-8873-88fa0e32b911	82	3
588d6543-eef6-4d84-b019-4d7a8b9fba06	e3fea1ab-20c7-45c0-8be6-0538353d16b3	76	4
588d6543-eef6-4d84-b019-4d7a8b9fba06	2bd72a45-07e2-46e0-9363-6e31351791e4	70	5
ceaf2c6b-9581-4aa3-8bf8-c1a48ebc9c9d	b8ed2748-5ca5-475c-bc47-2e463d76d090	95	1
ceaf2c6b-9581-4aa3-8bf8-c1a48ebc9c9d	65f3f958-a668-479f-83aa-f2b0b9bb8236	88	2
ceaf2c6b-9581-4aa3-8bf8-c1a48ebc9c9d	fb9a0faa-a040-4a28-bc20-071d9478f86e	82	3
ceaf2c6b-9581-4aa3-8bf8-c1a48ebc9c9d	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	76	4
ceaf2c6b-9581-4aa3-8bf8-c1a48ebc9c9d	2bd72a45-07e2-46e0-9363-6e31351791e4	70	5
ce703ce1-3441-4664-ab0c-3927ecd896ee	9b7b03b1-3ed4-462d-92b9-3877c3e8d0d4	95	1
ce703ce1-3441-4664-ab0c-3927ecd896ee	65f3f958-a668-479f-83aa-f2b0b9bb8236	88	2
ce703ce1-3441-4664-ab0c-3927ecd896ee	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	82	3
ce703ce1-3441-4664-ab0c-3927ecd896ee	fb9a0faa-a040-4a28-bc20-071d9478f86e	76	4
ce703ce1-3441-4664-ab0c-3927ecd896ee	2bd72a45-07e2-46e0-9363-6e31351791e4	70	5
7680f8c2-f9ee-4eff-a195-a4e78315d8bc	65f3f958-a668-479f-83aa-f2b0b9bb8236	95	1
7680f8c2-f9ee-4eff-a195-a4e78315d8bc	ec62c48b-a0fe-44b8-b10f-31472c3ce534	88	2
7680f8c2-f9ee-4eff-a195-a4e78315d8bc	e41bfae9-b3a5-4661-a420-290d6c27da35	82	3
7680f8c2-f9ee-4eff-a195-a4e78315d8bc	16f221cc-38cc-4dc0-8a26-1cff4bc731db	76	4
7680f8c2-f9ee-4eff-a195-a4e78315d8bc	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	70	5
2a547bff-0235-4fdf-a781-b2cc21af4ca6	16f221cc-38cc-4dc0-8a26-1cff4bc731db	95	1
2a547bff-0235-4fdf-a781-b2cc21af4ca6	65f3f958-a668-479f-83aa-f2b0b9bb8236	88	2
2a547bff-0235-4fdf-a781-b2cc21af4ca6	2bd72a45-07e2-46e0-9363-6e31351791e4	82	3
2a547bff-0235-4fdf-a781-b2cc21af4ca6	e3fea1ab-20c7-45c0-8be6-0538353d16b3	76	4
2a547bff-0235-4fdf-a781-b2cc21af4ca6	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	70	5
69ef4e63-1dfe-4f48-bc6d-47bdb7216ad9	e41bfae9-b3a5-4661-a420-290d6c27da35	95	1
69ef4e63-1dfe-4f48-bc6d-47bdb7216ad9	65f3f958-a668-479f-83aa-f2b0b9bb8236	88	2
69ef4e63-1dfe-4f48-bc6d-47bdb7216ad9	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	82	3
69ef4e63-1dfe-4f48-bc6d-47bdb7216ad9	16f221cc-38cc-4dc0-8a26-1cff4bc731db	76	4
69ef4e63-1dfe-4f48-bc6d-47bdb7216ad9	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	70	5
2d3f30fc-b13c-40a9-a0d2-38d75e20d311	65f3f958-a668-479f-83aa-f2b0b9bb8236	95	1
2d3f30fc-b13c-40a9-a0d2-38d75e20d311	2bd72a45-07e2-46e0-9363-6e31351791e4	88	2
2d3f30fc-b13c-40a9-a0d2-38d75e20d311	16f221cc-38cc-4dc0-8a26-1cff4bc731db	82	3
2d3f30fc-b13c-40a9-a0d2-38d75e20d311	c965d659-44e9-443f-bb3e-89932581e023	76	4
2d3f30fc-b13c-40a9-a0d2-38d75e20d311	e3fea1ab-20c7-45c0-8be6-0538353d16b3	70	5
bcea55b8-babc-478c-9227-12b955a6fab1	a7f6bb93-d636-4796-be63-43d918d69ad5	95	1
bcea55b8-babc-478c-9227-12b955a6fab1	65f3f958-a668-479f-83aa-f2b0b9bb8236	88	2
bcea55b8-babc-478c-9227-12b955a6fab1	c0d57ce2-2d49-4f6b-b6f2-4c1703cfc233	82	3
bcea55b8-babc-478c-9227-12b955a6fab1	2bd72a45-07e2-46e0-9363-6e31351791e4	76	4
bcea55b8-babc-478c-9227-12b955a6fab1	16f221cc-38cc-4dc0-8a26-1cff4bc731db	70	5
a1caa491-6ddc-4a60-8b8c-07666adfee35	65f3f958-a668-479f-83aa-f2b0b9bb8236	95	1
a1caa491-6ddc-4a60-8b8c-07666adfee35	7879e3d8-bf89-4140-b863-4761ec613c4c	88	2
a1caa491-6ddc-4a60-8b8c-07666adfee35	ec62c48b-a0fe-44b8-b10f-31472c3ce534	82	3
a1caa491-6ddc-4a60-8b8c-07666adfee35	a4b479b4-db92-441b-8212-bb252a3eab17	76	4
a1caa491-6ddc-4a60-8b8c-07666adfee35	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
5f437268-78fa-4e79-a194-8e918581a503	ea863799-f2ad-49ac-8ce7-07d67eb225a0	95	1
5f437268-78fa-4e79-a194-8e918581a503	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	88	2
5f437268-78fa-4e79-a194-8e918581a503	e41bfae9-b3a5-4661-a420-290d6c27da35	82	3
5f437268-78fa-4e79-a194-8e918581a503	ec62c48b-a0fe-44b8-b10f-31472c3ce534	76	4
5f437268-78fa-4e79-a194-8e918581a503	3141f563-5039-48a5-a7f1-eac9c29e38ba	70	5
dcb4c4c5-203c-451c-998c-888362091608	ec62c48b-a0fe-44b8-b10f-31472c3ce534	95	1
dcb4c4c5-203c-451c-998c-888362091608	5051e95d-93a2-4c5a-b1ed-854b13b067f8	88	2
dcb4c4c5-203c-451c-998c-888362091608	c0d57ce2-2d49-4f6b-b6f2-4c1703cfc233	82	3
dcb4c4c5-203c-451c-998c-888362091608	10a93b7f-37f4-470c-a39e-e442b5437113	76	4
dcb4c4c5-203c-451c-998c-888362091608	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	70	5
29dc7089-a615-475c-b033-a0fd4a59a599	ec62c48b-a0fe-44b8-b10f-31472c3ce534	95	1
29dc7089-a615-475c-b033-a0fd4a59a599	10a93b7f-37f4-470c-a39e-e442b5437113	88	2
29dc7089-a615-475c-b033-a0fd4a59a599	e41bfae9-b3a5-4661-a420-290d6c27da35	82	3
29dc7089-a615-475c-b033-a0fd4a59a599	65f3f958-a668-479f-83aa-f2b0b9bb8236	76	4
29dc7089-a615-475c-b033-a0fd4a59a599	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	70	5
e3dc48a8-58da-4025-ad51-fe1a4db093c0	6da5e4f3-3920-4f6c-9bb0-e501af6c5a81	95	1
e3dc48a8-58da-4025-ad51-fe1a4db093c0	05650238-fd2f-492d-a3cf-48e1fed78e5b	88	2
e3dc48a8-58da-4025-ad51-fe1a4db093c0	5051e95d-93a2-4c5a-b1ed-854b13b067f8	82	3
e3dc48a8-58da-4025-ad51-fe1a4db093c0	ec62c48b-a0fe-44b8-b10f-31472c3ce534	76	4
e3dc48a8-58da-4025-ad51-fe1a4db093c0	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
30f6719f-41b5-4f60-80d2-afa6b2ccbf1f	6a1a5fb1-7ba0-466e-8a3d-ffe566e37050	95	1
30f6719f-41b5-4f60-80d2-afa6b2ccbf1f	fb9a0faa-a040-4a28-bc20-071d9478f86e	88	2
30f6719f-41b5-4f60-80d2-afa6b2ccbf1f	05650238-fd2f-492d-a3cf-48e1fed78e5b	82	3
30f6719f-41b5-4f60-80d2-afa6b2ccbf1f	65f3f958-a668-479f-83aa-f2b0b9bb8236	76	4
30f6719f-41b5-4f60-80d2-afa6b2ccbf1f	71232d6e-c5b8-4c28-89df-276a5f6aeb7d	70	5
f22ca276-9e1c-4865-8703-95e1ef0fce2f	190b252f-496d-4bb5-b806-6d53b901219f	95	1
f22ca276-9e1c-4865-8703-95e1ef0fce2f	10a93b7f-37f4-470c-a39e-e442b5437113	88	2
f22ca276-9e1c-4865-8703-95e1ef0fce2f	65f3f958-a668-479f-83aa-f2b0b9bb8236	82	3
f22ca276-9e1c-4865-8703-95e1ef0fce2f	fb9a0faa-a040-4a28-bc20-071d9478f86e	76	4
f22ca276-9e1c-4865-8703-95e1ef0fce2f	a4f798bc-096d-453b-8500-7b6972445ef0	70	5
3df80641-667c-4a5f-8475-d64c8c46683a	d4cf402c-1804-4bfc-af25-6b60196102a1	95	1
3df80641-667c-4a5f-8475-d64c8c46683a	3141f563-5039-48a5-a7f1-eac9c29e38ba	88	2
3df80641-667c-4a5f-8475-d64c8c46683a	10a93b7f-37f4-470c-a39e-e442b5437113	82	3
3df80641-667c-4a5f-8475-d64c8c46683a	71232d6e-c5b8-4c28-89df-276a5f6aeb7d	76	4
3df80641-667c-4a5f-8475-d64c8c46683a	fb9a0faa-a040-4a28-bc20-071d9478f86e	70	5
d8a92854-1023-4459-aab1-a174a062c549	71232d6e-c5b8-4c28-89df-276a5f6aeb7d	95	1
d8a92854-1023-4459-aab1-a174a062c549	ec62c48b-a0fe-44b8-b10f-31472c3ce534	88	2
d8a92854-1023-4459-aab1-a174a062c549	3141f563-5039-48a5-a7f1-eac9c29e38ba	82	3
d8a92854-1023-4459-aab1-a174a062c549	e41bfae9-b3a5-4661-a420-290d6c27da35	76	4
d8a92854-1023-4459-aab1-a174a062c549	05650238-fd2f-492d-a3cf-48e1fed78e5b	70	5
57cf1c9b-bcfa-44d9-b581-035028d4b6f8	a4b479b4-db92-441b-8212-bb252a3eab17	95	1
57cf1c9b-bcfa-44d9-b581-035028d4b6f8	f1fb6be8-89b9-4f13-b609-6a3565dd92b3	88	2
57cf1c9b-bcfa-44d9-b581-035028d4b6f8	10a93b7f-37f4-470c-a39e-e442b5437113	82	3
57cf1c9b-bcfa-44d9-b581-035028d4b6f8	ec62c48b-a0fe-44b8-b10f-31472c3ce534	76	4
57cf1c9b-bcfa-44d9-b581-035028d4b6f8	92080976-a730-44bd-bdb0-8ad5229e5de5	70	5
250519ff-2f1e-4009-8d48-c75d79f59f8f	b6778cfa-3b15-42ac-9866-0e92279cdf0e	95	1
250519ff-2f1e-4009-8d48-c75d79f59f8f	a4d72e96-a556-4a7c-95e8-d95f3e689b20	88	2
250519ff-2f1e-4009-8d48-c75d79f59f8f	e41bfae9-b3a5-4661-a420-290d6c27da35	82	3
250519ff-2f1e-4009-8d48-c75d79f59f8f	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	76	4
250519ff-2f1e-4009-8d48-c75d79f59f8f	3141f563-5039-48a5-a7f1-eac9c29e38ba	70	5
dc2133c5-d8e7-4a0b-b4f4-dd006eb087a9	26742fe4-2f0d-4219-ac58-8a4b998c74de	95	1
dc2133c5-d8e7-4a0b-b4f4-dd006eb087a9	e41bfae9-b3a5-4661-a420-290d6c27da35	88	2
dc2133c5-d8e7-4a0b-b4f4-dd006eb087a9	ec62c48b-a0fe-44b8-b10f-31472c3ce534	82	3
dc2133c5-d8e7-4a0b-b4f4-dd006eb087a9	3141f563-5039-48a5-a7f1-eac9c29e38ba	76	4
dc2133c5-d8e7-4a0b-b4f4-dd006eb087a9	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
0b454968-cf9d-4c1b-abd8-5f3e0f945adc	bfe0311d-ea78-47ea-aeae-f79796ea244b	95	1
0b454968-cf9d-4c1b-abd8-5f3e0f945adc	25348e0f-a2de-4168-8f6d-87d4c4c998d9	88	2
0b454968-cf9d-4c1b-abd8-5f3e0f945adc	ec62c48b-a0fe-44b8-b10f-31472c3ce534	82	3
0b454968-cf9d-4c1b-abd8-5f3e0f945adc	6f53cc68-8d00-48a8-8137-76051eaabd3f	76	4
0b454968-cf9d-4c1b-abd8-5f3e0f945adc	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
2ac6555e-0733-4b97-844b-78699d204d4d	3141f563-5039-48a5-a7f1-eac9c29e38ba	95	1
2ac6555e-0733-4b97-844b-78699d204d4d	a4d72e96-a556-4a7c-95e8-d95f3e689b20	88	2
2ac6555e-0733-4b97-844b-78699d204d4d	10a93b7f-37f4-470c-a39e-e442b5437113	82	3
2ac6555e-0733-4b97-844b-78699d204d4d	71232d6e-c5b8-4c28-89df-276a5f6aeb7d	76	4
2ac6555e-0733-4b97-844b-78699d204d4d	ec62c48b-a0fe-44b8-b10f-31472c3ce534	70	5
35c2337d-e95e-4ae1-a3f2-1665b4976aea	05650238-fd2f-492d-a3cf-48e1fed78e5b	95	1
35c2337d-e95e-4ae1-a3f2-1665b4976aea	7879e3d8-bf89-4140-b863-4761ec613c4c	88	2
35c2337d-e95e-4ae1-a3f2-1665b4976aea	aa41fdb2-8138-41df-8269-5ec82f857a25	82	3
35c2337d-e95e-4ae1-a3f2-1665b4976aea	10a93b7f-37f4-470c-a39e-e442b5437113	76	4
35c2337d-e95e-4ae1-a3f2-1665b4976aea	4031d5c5-af03-4d75-8844-965a2c3055e9	70	5
f05c2b56-41ba-4ec1-8cc3-9f8f0b1f8607	7879e3d8-bf89-4140-b863-4761ec613c4c	95	1
f05c2b56-41ba-4ec1-8cc3-9f8f0b1f8607	26742fe4-2f0d-4219-ac58-8a4b998c74de	88	2
f05c2b56-41ba-4ec1-8cc3-9f8f0b1f8607	ec62c48b-a0fe-44b8-b10f-31472c3ce534	82	3
f05c2b56-41ba-4ec1-8cc3-9f8f0b1f8607	3141f563-5039-48a5-a7f1-eac9c29e38ba	76	4
f05c2b56-41ba-4ec1-8cc3-9f8f0b1f8607	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
f11894e2-357c-4128-89c8-2ac34c71feb6	e41bfae9-b3a5-4661-a420-290d6c27da35	95	1
f11894e2-357c-4128-89c8-2ac34c71feb6	7879e3d8-bf89-4140-b863-4761ec613c4c	88	2
f11894e2-357c-4128-89c8-2ac34c71feb6	c0d57ce2-2d49-4f6b-b6f2-4c1703cfc233	82	3
f11894e2-357c-4128-89c8-2ac34c71feb6	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	76	4
f11894e2-357c-4128-89c8-2ac34c71feb6	3141f563-5039-48a5-a7f1-eac9c29e38ba	70	5
5f1d7567-fb6e-4723-8539-5bda84fc358a	71232d6e-c5b8-4c28-89df-276a5f6aeb7d	95	1
5f1d7567-fb6e-4723-8539-5bda84fc358a	05650238-fd2f-492d-a3cf-48e1fed78e5b	88	2
5f1d7567-fb6e-4723-8539-5bda84fc358a	fb7494b3-479c-4f1a-a828-b3c2daed6ffb	82	3
5f1d7567-fb6e-4723-8539-5bda84fc358a	7879e3d8-bf89-4140-b863-4761ec613c4c	76	4
5f1d7567-fb6e-4723-8539-5bda84fc358a	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
68110403-5d36-468a-a7f2-9fd010036c20	7879e3d8-bf89-4140-b863-4761ec613c4c	95	1
68110403-5d36-468a-a7f2-9fd010036c20	f7359039-5a58-4d5a-b8db-6554711779b7	88	2
68110403-5d36-468a-a7f2-9fd010036c20	e41bfae9-b3a5-4661-a420-290d6c27da35	82	3
68110403-5d36-468a-a7f2-9fd010036c20	26742fe4-2f0d-4219-ac58-8a4b998c74de	76	4
68110403-5d36-468a-a7f2-9fd010036c20	3141f563-5039-48a5-a7f1-eac9c29e38ba	70	5
ec139ac4-3c74-406b-816b-c347b1f2ad75	d4cf402c-1804-4bfc-af25-6b60196102a1	95	1
ec139ac4-3c74-406b-816b-c347b1f2ad75	1fda1184-8063-4cb8-9811-9e3eb0557ab2	88	2
ec139ac4-3c74-406b-816b-c347b1f2ad75	65f3f958-a668-479f-83aa-f2b0b9bb8236	82	3
ec139ac4-3c74-406b-816b-c347b1f2ad75	ec62c48b-a0fe-44b8-b10f-31472c3ce534	76	4
ec139ac4-3c74-406b-816b-c347b1f2ad75	e3fea1ab-20c7-45c0-8be6-0538353d16b3	70	5
83116a6a-142c-4b23-930e-65722bf0a07b	65f3f958-a668-479f-83aa-f2b0b9bb8236	95	1
83116a6a-142c-4b23-930e-65722bf0a07b	10a93b7f-37f4-470c-a39e-e442b5437113	88	2
83116a6a-142c-4b23-930e-65722bf0a07b	e3fea1ab-20c7-45c0-8be6-0538353d16b3	82	3
83116a6a-142c-4b23-930e-65722bf0a07b	fb9a0faa-a040-4a28-bc20-071d9478f86e	76	4
83116a6a-142c-4b23-930e-65722bf0a07b	16f221cc-38cc-4dc0-8a26-1cff4bc731db	70	5
590e9aa4-3eea-4831-95ab-c21afee31529	b6778cfa-3b15-42ac-9866-0e92279cdf0e	95	1
590e9aa4-3eea-4831-95ab-c21afee31529	b72bef64-da93-42a8-8393-c920aafd58fa	88	2
590e9aa4-3eea-4831-95ab-c21afee31529	e41bfae9-b3a5-4661-a420-290d6c27da35	82	3
590e9aa4-3eea-4831-95ab-c21afee31529	ec62c48b-a0fe-44b8-b10f-31472c3ce534	76	4
590e9aa4-3eea-4831-95ab-c21afee31529	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	70	5
18139491-0ad4-419d-9dd6-dd23a666d319	5051e95d-93a2-4c5a-b1ed-854b13b067f8	95	1
18139491-0ad4-419d-9dd6-dd23a666d319	7879e3d8-bf89-4140-b863-4761ec613c4c	88	2
18139491-0ad4-419d-9dd6-dd23a666d319	fb9a0faa-a040-4a28-bc20-071d9478f86e	82	3
18139491-0ad4-419d-9dd6-dd23a666d319	4adb04c8-1c7c-40d5-ac83-49b1a81b6afe	76	4
18139491-0ad4-419d-9dd6-dd23a666d319	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
2b0e1194-769e-4c6e-b225-af46fe33848c	89219724-7107-4ccf-9ccf-bb20d439a10f	80	3
2b0e1194-769e-4c6e-b225-af46fe33848c	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	75	4
2b0e1194-769e-4c6e-b225-af46fe33848c	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
6b1cde3b-7614-4f26-9c6a-e05a03cfe1f9	e41bfae9-b3a5-4661-a420-290d6c27da35	95	1
6b1cde3b-7614-4f26-9c6a-e05a03cfe1f9	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	85	2
6b1cde3b-7614-4f26-9c6a-e05a03cfe1f9	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	80	3
6b1cde3b-7614-4f26-9c6a-e05a03cfe1f9	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	75	4
6b1cde3b-7614-4f26-9c6a-e05a03cfe1f9	57844de5-c7e7-490b-8c70-9cd373df44b2	70	5
0cbe8336-1932-47a2-b470-90af69e93b25	6a657f15-2638-4401-a4cb-1cb3d78446be	95	1
0cbe8336-1932-47a2-b470-90af69e93b25	e3fea1ab-20c7-45c0-8be6-0538353d16b3	85	2
0cbe8336-1932-47a2-b470-90af69e93b25	89219724-7107-4ccf-9ccf-bb20d439a10f	80	3
0cbe8336-1932-47a2-b470-90af69e93b25	65f3f958-a668-479f-83aa-f2b0b9bb8236	75	4
0cbe8336-1932-47a2-b470-90af69e93b25	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	70	5
a563f573-f08e-4450-bf46-cc26967c13c6	e3fea1ab-20c7-45c0-8be6-0538353d16b3	95	1
a563f573-f08e-4450-bf46-cc26967c13c6	71232d6e-c5b8-4c28-89df-276a5f6aeb7d	85	2
a563f573-f08e-4450-bf46-cc26967c13c6	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	80	3
a563f573-f08e-4450-bf46-cc26967c13c6	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	75	4
a563f573-f08e-4450-bf46-cc26967c13c6	89219724-7107-4ccf-9ccf-bb20d439a10f	70	5
fcf0c6ed-2798-4aee-b5fc-62978a63cbd3	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	95	1
fcf0c6ed-2798-4aee-b5fc-62978a63cbd3	e41bfae9-b3a5-4661-a420-290d6c27da35	85	2
fcf0c6ed-2798-4aee-b5fc-62978a63cbd3	e3fea1ab-20c7-45c0-8be6-0538353d16b3	75	4
fcf0c6ed-2798-4aee-b5fc-62978a63cbd3	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	70	5
c78c89fd-baf2-41b8-a4fd-ec1df6fbf32f	d4cf402c-1804-4bfc-af25-6b60196102a1	95	1
951765db-c632-4eb1-8ccd-a365ee9a98c3	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	75	4
a301ce1b-44ea-4ca7-9682-153f2283ece0	3141f563-5039-48a5-a7f1-eac9c29e38ba	95	1
a301ce1b-44ea-4ca7-9682-153f2283ece0	10a93b7f-37f4-470c-a39e-e442b5437113	85	2
a301ce1b-44ea-4ca7-9682-153f2283ece0	32b8ae1f-2a7e-4065-bea2-6392a15348c5	80	3
a301ce1b-44ea-4ca7-9682-153f2283ece0	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	75	4
a301ce1b-44ea-4ca7-9682-153f2283ece0	7879e3d8-bf89-4140-b863-4761ec613c4c	70	5
30d74977-3ab5-4047-a372-e7a0dbd3e797	3141f563-5039-48a5-a7f1-eac9c29e38ba	95	1
30d74977-3ab5-4047-a372-e7a0dbd3e797	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	85	2
30d74977-3ab5-4047-a372-e7a0dbd3e797	10a93b7f-37f4-470c-a39e-e442b5437113	80	3
30d74977-3ab5-4047-a372-e7a0dbd3e797	1626400a-0417-4ff8-bfed-d89ef198074f	75	4
30d74977-3ab5-4047-a372-e7a0dbd3e797	7879e3d8-bf89-4140-b863-4761ec613c4c	70	5
3249d1f8-95ac-4efb-a19a-c07713861354	32b8ae1f-2a7e-4065-bea2-6392a15348c5	95	1
3249d1f8-95ac-4efb-a19a-c07713861354	d4cf402c-1804-4bfc-af25-6b60196102a1	85	2
3249d1f8-95ac-4efb-a19a-c07713861354	7879e3d8-bf89-4140-b863-4761ec613c4c	80	3
3249d1f8-95ac-4efb-a19a-c07713861354	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	75	4
3249d1f8-95ac-4efb-a19a-c07713861354	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	70	5
7a542bf6-eaf0-4077-b374-60dea2563c8c	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	95	1
7a542bf6-eaf0-4077-b374-60dea2563c8c	7879e3d8-bf89-4140-b863-4761ec613c4c	85	2
7a542bf6-eaf0-4077-b374-60dea2563c8c	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	80	3
7a542bf6-eaf0-4077-b374-60dea2563c8c	57844de5-c7e7-490b-8c70-9cd373df44b2	70	5
c44b7b50-00bf-4b45-b82a-a24d0afb72e7	10a93b7f-37f4-470c-a39e-e442b5437113	95	1
c44b7b50-00bf-4b45-b82a-a24d0afb72e7	495b763f-161e-4f28-818a-ae7ddb91c774	88	2
c44b7b50-00bf-4b45-b82a-a24d0afb72e7	d4cf402c-1804-4bfc-af25-6b60196102a1	82	3
c44b7b50-00bf-4b45-b82a-a24d0afb72e7	71232d6e-c5b8-4c28-89df-276a5f6aeb7d	76	4
c44b7b50-00bf-4b45-b82a-a24d0afb72e7	1fda1184-8063-4cb8-9811-9e3eb0557ab2	70	5
4a22f5c8-ec6e-4aab-b1d9-80ee6036ee4c	05650238-fd2f-492d-a3cf-48e1fed78e5b	95	1
4a22f5c8-ec6e-4aab-b1d9-80ee6036ee4c	71232d6e-c5b8-4c28-89df-276a5f6aeb7d	88	2
4a22f5c8-ec6e-4aab-b1d9-80ee6036ee4c	3141f563-5039-48a5-a7f1-eac9c29e38ba	82	3
4a22f5c8-ec6e-4aab-b1d9-80ee6036ee4c	26742fe4-2f0d-4219-ac58-8a4b998c74de	76	4
4a22f5c8-ec6e-4aab-b1d9-80ee6036ee4c	fb9a0faa-a040-4a28-bc20-071d9478f86e	70	5
70a64667-e3cc-4295-a254-bcf640a0e6af	7879e3d8-bf89-4140-b863-4761ec613c4c	95	1
70a64667-e3cc-4295-a254-bcf640a0e6af	ec62c48b-a0fe-44b8-b10f-31472c3ce534	88	2
70a64667-e3cc-4295-a254-bcf640a0e6af	e41bfae9-b3a5-4661-a420-290d6c27da35	82	3
70a64667-e3cc-4295-a254-bcf640a0e6af	3141f563-5039-48a5-a7f1-eac9c29e38ba	76	4
70a64667-e3cc-4295-a254-bcf640a0e6af	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
26084fee-3ad3-4da4-a968-ea106c688060	05650238-fd2f-492d-a3cf-48e1fed78e5b	95	1
26084fee-3ad3-4da4-a968-ea106c688060	71232d6e-c5b8-4c28-89df-276a5f6aeb7d	88	2
26084fee-3ad3-4da4-a968-ea106c688060	3141f563-5039-48a5-a7f1-eac9c29e38ba	82	3
26084fee-3ad3-4da4-a968-ea106c688060	ec62c48b-a0fe-44b8-b10f-31472c3ce534	76	4
26084fee-3ad3-4da4-a968-ea106c688060	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
86bc3716-45d2-4d17-abd1-870bf8ba319e	e55153a9-7d48-4956-9a15-f11205b95aa5	95	1
86bc3716-45d2-4d17-abd1-870bf8ba319e	5051e95d-93a2-4c5a-b1ed-854b13b067f8	88	2
86bc3716-45d2-4d17-abd1-870bf8ba319e	65f3f958-a668-479f-83aa-f2b0b9bb8236	82	3
86bc3716-45d2-4d17-abd1-870bf8ba319e	7879e3d8-bf89-4140-b863-4761ec613c4c	76	4
86bc3716-45d2-4d17-abd1-870bf8ba319e	a4b479b4-db92-441b-8212-bb252a3eab17	70	5
1955b6cf-5a80-4942-9158-f6fa057edb21	d4cf402c-1804-4bfc-af25-6b60196102a1	95	1
1955b6cf-5a80-4942-9158-f6fa057edb21	8b242d94-26f4-4347-8476-f79bccc7c051	88	2
1955b6cf-5a80-4942-9158-f6fa057edb21	10a93b7f-37f4-470c-a39e-e442b5437113	82	3
1955b6cf-5a80-4942-9158-f6fa057edb21	7229e940-e527-493a-8873-88fa0e32b911	76	4
1955b6cf-5a80-4942-9158-f6fa057edb21	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
8b600535-5657-4c05-a48a-59321a0ac0ab	6a657f15-2638-4401-a4cb-1cb3d78446be	85	2
8b600535-5657-4c05-a48a-59321a0ac0ab	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	75	4
f8751a4b-64a0-4878-ad63-704933f3f41f	6a657f15-2638-4401-a4cb-1cb3d78446be	85	2
f8751a4b-64a0-4878-ad63-704933f3f41f	495b763f-161e-4f28-818a-ae7ddb91c774	75	4
951765db-c632-4eb1-8ccd-a365ee9a98c3	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
4b7caf97-02eb-478a-8388-d16bc59a5596	d4cf402c-1804-4bfc-af25-6b60196102a1	95	1
4b7caf97-02eb-478a-8388-d16bc59a5596	89219724-7107-4ccf-9ccf-bb20d439a10f	85	2
4b7caf97-02eb-478a-8388-d16bc59a5596	10a93b7f-37f4-470c-a39e-e442b5437113	80	3
4b7caf97-02eb-478a-8388-d16bc59a5596	e3fea1ab-20c7-45c0-8be6-0538353d16b3	75	4
4b7caf97-02eb-478a-8388-d16bc59a5596	3141f563-5039-48a5-a7f1-eac9c29e38ba	70	5
e3e755d3-1bff-4e3f-ac05-7345f1af1562	e55153a9-7d48-4956-9a15-f11205b95aa5	95	1
e3e755d3-1bff-4e3f-ac05-7345f1af1562	6f53cc68-8d00-48a8-8137-76051eaabd3f	88	2
e3e755d3-1bff-4e3f-ac05-7345f1af1562	ea863799-f2ad-49ac-8ce7-07d67eb225a0	82	3
e3e755d3-1bff-4e3f-ac05-7345f1af1562	10a93b7f-37f4-470c-a39e-e442b5437113	76	4
e3e755d3-1bff-4e3f-ac05-7345f1af1562	e41bfae9-b3a5-4661-a420-290d6c27da35	70	5
ec4d69a7-4074-4ba6-a546-2abfa0a9bac4	cb7c0202-da9a-4d2f-addc-d40e7ca47f00	95	1
ec4d69a7-4074-4ba6-a546-2abfa0a9bac4	26742fe4-2f0d-4219-ac58-8a4b998c74de	88	2
ec4d69a7-4074-4ba6-a546-2abfa0a9bac4	05650238-fd2f-492d-a3cf-48e1fed78e5b	82	3
ec4d69a7-4074-4ba6-a546-2abfa0a9bac4	e41bfae9-b3a5-4661-a420-290d6c27da35	76	4
ec4d69a7-4074-4ba6-a546-2abfa0a9bac4	ec62c48b-a0fe-44b8-b10f-31472c3ce534	70	5
fe8c5d8c-a21e-4c9f-9e7b-9d57f7470ecf	d4cf402c-1804-4bfc-af25-6b60196102a1	95	1
fe8c5d8c-a21e-4c9f-9e7b-9d57f7470ecf	fb9a0faa-a040-4a28-bc20-071d9478f86e	88	2
fe8c5d8c-a21e-4c9f-9e7b-9d57f7470ecf	b4338480-41d3-4dd3-b138-fd5679aec084	82	3
fe8c5d8c-a21e-4c9f-9e7b-9d57f7470ecf	7229e940-e527-493a-8873-88fa0e32b911	76	4
fe8c5d8c-a21e-4c9f-9e7b-9d57f7470ecf	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
c9fbd1bd-4c2a-42af-81c1-dc8b39ae8eb2	ec62c48b-a0fe-44b8-b10f-31472c3ce534	95	1
c9fbd1bd-4c2a-42af-81c1-dc8b39ae8eb2	e41bfae9-b3a5-4661-a420-290d6c27da35	88	2
c9fbd1bd-4c2a-42af-81c1-dc8b39ae8eb2	65f3f958-a668-479f-83aa-f2b0b9bb8236	82	3
c9fbd1bd-4c2a-42af-81c1-dc8b39ae8eb2	e3fea1ab-20c7-45c0-8be6-0538353d16b3	76	4
c9fbd1bd-4c2a-42af-81c1-dc8b39ae8eb2	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	70	5
40c0d3a1-48cf-43c0-b34e-2b240cd76b5b	b72bef64-da93-42a8-8393-c920aafd58fa	95	1
40c0d3a1-48cf-43c0-b34e-2b240cd76b5b	bfe0311d-ea78-47ea-aeae-f79796ea244b	88	2
40c0d3a1-48cf-43c0-b34e-2b240cd76b5b	b6778cfa-3b15-42ac-9866-0e92279cdf0e	82	3
40c0d3a1-48cf-43c0-b34e-2b240cd76b5b	3ecaafca-c58f-46ff-a4e4-04857f267270	76	4
40c0d3a1-48cf-43c0-b34e-2b240cd76b5b	60aea58c-7c6f-469c-9b77-5c4be6d53627	70	5
ccdd4abb-c33f-4d7d-afca-22a5dd296732	ea568ffc-763b-43ce-9a4b-b336681549de	95	1
ccdd4abb-c33f-4d7d-afca-22a5dd296732	28de1521-b5bf-4e11-bff4-fe54855a7fa8	88	2
ccdd4abb-c33f-4d7d-afca-22a5dd296732	e41bfae9-b3a5-4661-a420-290d6c27da35	82	3
ccdd4abb-c33f-4d7d-afca-22a5dd296732	b6778cfa-3b15-42ac-9866-0e92279cdf0e	76	4
ccdd4abb-c33f-4d7d-afca-22a5dd296732	e3fea1ab-20c7-45c0-8be6-0538353d16b3	70	5
9de02cb9-4c91-4e88-8846-dfed0c164ed6	d4cf402c-1804-4bfc-af25-6b60196102a1	95	1
9de02cb9-4c91-4e88-8846-dfed0c164ed6	8b242d94-26f4-4347-8476-f79bccc7c051	88	2
9de02cb9-4c91-4e88-8846-dfed0c164ed6	65f3f958-a668-479f-83aa-f2b0b9bb8236	82	3
9de02cb9-4c91-4e88-8846-dfed0c164ed6	10a93b7f-37f4-470c-a39e-e442b5437113	76	4
9de02cb9-4c91-4e88-8846-dfed0c164ed6	7229e940-e527-493a-8873-88fa0e32b911	70	5
6aae35b5-ae16-4a75-bc9f-d6d75a3ea804	ec62c48b-a0fe-44b8-b10f-31472c3ce534	95	1
6aae35b5-ae16-4a75-bc9f-d6d75a3ea804	e3fea1ab-20c7-45c0-8be6-0538353d16b3	88	2
6aae35b5-ae16-4a75-bc9f-d6d75a3ea804	65f3f958-a668-479f-83aa-f2b0b9bb8236	82	3
6aae35b5-ae16-4a75-bc9f-d6d75a3ea804	e41bfae9-b3a5-4661-a420-290d6c27da35	76	4
6aae35b5-ae16-4a75-bc9f-d6d75a3ea804	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
7670908f-7917-4255-8e6d-26d3f47d859f	e55153a9-7d48-4956-9a15-f11205b95aa5	95	1
7670908f-7917-4255-8e6d-26d3f47d859f	26742fe4-2f0d-4219-ac58-8a4b998c74de	88	2
7670908f-7917-4255-8e6d-26d3f47d859f	ec62c48b-a0fe-44b8-b10f-31472c3ce534	82	3
7670908f-7917-4255-8e6d-26d3f47d859f	7879e3d8-bf89-4140-b863-4761ec613c4c	76	4
7670908f-7917-4255-8e6d-26d3f47d859f	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
00a5a149-1fa5-479f-9d97-2f6736bed2f8	58174674-9bd1-4df8-8c10-9a50cd10b947	95	1
00a5a149-1fa5-479f-9d97-2f6736bed2f8	d4cf402c-1804-4bfc-af25-6b60196102a1	88	2
00a5a149-1fa5-479f-9d97-2f6736bed2f8	32b8ae1f-2a7e-4065-bea2-6392a15348c5	82	3
00a5a149-1fa5-479f-9d97-2f6736bed2f8	65f3f958-a668-479f-83aa-f2b0b9bb8236	76	4
00a5a149-1fa5-479f-9d97-2f6736bed2f8	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
d865d0cb-37de-443f-9674-fe12eac045cf	e3fea1ab-20c7-45c0-8be6-0538353d16b3	95	1
d865d0cb-37de-443f-9674-fe12eac045cf	ec62c48b-a0fe-44b8-b10f-31472c3ce534	88	2
d865d0cb-37de-443f-9674-fe12eac045cf	65f3f958-a668-479f-83aa-f2b0b9bb8236	82	3
d865d0cb-37de-443f-9674-fe12eac045cf	10a93b7f-37f4-470c-a39e-e442b5437113	76	4
d865d0cb-37de-443f-9674-fe12eac045cf	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	70	5
d4913078-04bd-4947-bdd0-e1ed5348dcf4	d4cf402c-1804-4bfc-af25-6b60196102a1	95	1
d4913078-04bd-4947-bdd0-e1ed5348dcf4	04da25e9-b3fb-4492-9358-237e42875ca2	88	2
d4913078-04bd-4947-bdd0-e1ed5348dcf4	1fda1184-8063-4cb8-9811-9e3eb0557ab2	82	3
d4913078-04bd-4947-bdd0-e1ed5348dcf4	10a93b7f-37f4-470c-a39e-e442b5437113	76	4
d4913078-04bd-4947-bdd0-e1ed5348dcf4	3141f563-5039-48a5-a7f1-eac9c29e38ba	70	5
f1abe8c4-7e7c-4039-b6aa-a2a200e93f63	7879e3d8-bf89-4140-b863-4761ec613c4c	95	1
f1abe8c4-7e7c-4039-b6aa-a2a200e93f63	e55153a9-7d48-4956-9a15-f11205b95aa5	88	2
f1abe8c4-7e7c-4039-b6aa-a2a200e93f63	3141f563-5039-48a5-a7f1-eac9c29e38ba	82	3
f1abe8c4-7e7c-4039-b6aa-a2a200e93f63	05650238-fd2f-492d-a3cf-48e1fed78e5b	76	4
f1abe8c4-7e7c-4039-b6aa-a2a200e93f63	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
7fb0586a-3b27-4739-95ab-ed541c327bec	f8b8d0cd-1a77-4469-8bb6-d0b2b16e4a5f	95	1
7fb0586a-3b27-4739-95ab-ed541c327bec	ea863799-f2ad-49ac-8ce7-07d67eb225a0	88	2
7fb0586a-3b27-4739-95ab-ed541c327bec	e41bfae9-b3a5-4661-a420-290d6c27da35	82	3
7fb0586a-3b27-4739-95ab-ed541c327bec	81cc0733-3b0d-4f4b-84aa-03610b8d30ac	76	4
7fb0586a-3b27-4739-95ab-ed541c327bec	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
0cc2d0a1-fc44-49fe-a751-4ed9acbf843f	5f82665b-b506-4c6f-8a44-a7b0995d6154	95	1
0cc2d0a1-fc44-49fe-a751-4ed9acbf843f	fb7494b3-479c-4f1a-a828-b3c2daed6ffb	88	2
0cc2d0a1-fc44-49fe-a751-4ed9acbf843f	e41bfae9-b3a5-4661-a420-290d6c27da35	82	3
0cc2d0a1-fc44-49fe-a751-4ed9acbf843f	05650238-fd2f-492d-a3cf-48e1fed78e5b	76	4
0cc2d0a1-fc44-49fe-a751-4ed9acbf843f	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	70	5
e3c7168b-1c5b-403d-a279-4230f2ccdb83	ec62c48b-a0fe-44b8-b10f-31472c3ce534	95	1
e3c7168b-1c5b-403d-a279-4230f2ccdb83	92080976-a730-44bd-bdb0-8ad5229e5de5	88	2
e3c7168b-1c5b-403d-a279-4230f2ccdb83	e41bfae9-b3a5-4661-a420-290d6c27da35	82	3
e3c7168b-1c5b-403d-a279-4230f2ccdb83	7879e3d8-bf89-4140-b863-4761ec613c4c	76	4
e3c7168b-1c5b-403d-a279-4230f2ccdb83	71232d6e-c5b8-4c28-89df-276a5f6aeb7d	70	5
8b600535-5657-4c05-a48a-59321a0ac0ab	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	70	5
f8751a4b-64a0-4878-ad63-704933f3f41f	89219724-7107-4ccf-9ccf-bb20d439a10f	90	1
c78c89fd-baf2-41b8-a4fd-ec1df6fbf32f	65f3f958-a668-479f-83aa-f2b0b9bb8236	80	3
c78c89fd-baf2-41b8-a4fd-ec1df6fbf32f	89219724-7107-4ccf-9ccf-bb20d439a10f	75	4
c78c89fd-baf2-41b8-a4fd-ec1df6fbf32f	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	70	5
4ff689b4-a6fa-4912-aeb6-4f230ff633a3	89219724-7107-4ccf-9ccf-bb20d439a10f	95	1
4ff689b4-a6fa-4912-aeb6-4f230ff633a3	58174674-9bd1-4df8-8c10-9a50cd10b947	90	2
4ff689b4-a6fa-4912-aeb6-4f230ff633a3	6a657f15-2638-4401-a4cb-1cb3d78446be	80	3
4ff689b4-a6fa-4912-aeb6-4f230ff633a3	e3fea1ab-20c7-45c0-8be6-0538353d16b3	75	4
4ff689b4-a6fa-4912-aeb6-4f230ff633a3	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
d7696520-73d0-4473-babc-fa0d1f3df150	6a657f15-2638-4401-a4cb-1cb3d78446be	90	1
d7696520-73d0-4473-babc-fa0d1f3df150	e3fea1ab-20c7-45c0-8be6-0538353d16b3	85	2
d7696520-73d0-4473-babc-fa0d1f3df150	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	80	3
d7696520-73d0-4473-babc-fa0d1f3df150	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	75	4
d7696520-73d0-4473-babc-fa0d1f3df150	495b763f-161e-4f28-818a-ae7ddb91c774	70	5
b8fab72a-155f-4392-bc00-93da631ca1a6	e3fea1ab-20c7-45c0-8be6-0538353d16b3	95	1
b8fab72a-155f-4392-bc00-93da631ca1a6	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	85	2
b8fab72a-155f-4392-bc00-93da631ca1a6	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	80	3
b8fab72a-155f-4392-bc00-93da631ca1a6	10a93b7f-37f4-470c-a39e-e442b5437113	75	4
b8fab72a-155f-4392-bc00-93da631ca1a6	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	70	5
dfcdeaa5-756e-4dcf-8cdb-bd2bab3b377b	16f221cc-38cc-4dc0-8a26-1cff4bc731db	95	1
dfcdeaa5-756e-4dcf-8cdb-bd2bab3b377b	e3fea1ab-20c7-45c0-8be6-0538353d16b3	85	2
dfcdeaa5-756e-4dcf-8cdb-bd2bab3b377b	e41bfae9-b3a5-4661-a420-290d6c27da35	80	3
dfcdeaa5-756e-4dcf-8cdb-bd2bab3b377b	65f3f958-a668-479f-83aa-f2b0b9bb8236	75	4
dfcdeaa5-756e-4dcf-8cdb-bd2bab3b377b	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	70	5
47998914-eb19-4aba-9a3b-c2760e9d9967	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	95	1
47998914-eb19-4aba-9a3b-c2760e9d9967	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	85	2
47998914-eb19-4aba-9a3b-c2760e9d9967	e3fea1ab-20c7-45c0-8be6-0538353d16b3	80	3
47998914-eb19-4aba-9a3b-c2760e9d9967	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	75	4
47998914-eb19-4aba-9a3b-c2760e9d9967	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
3bed23fb-b4bc-4699-9192-586f02c0405e	71232d6e-c5b8-4c28-89df-276a5f6aeb7d	95	1
3bed23fb-b4bc-4699-9192-586f02c0405e	d4cf402c-1804-4bfc-af25-6b60196102a1	85	2
3bed23fb-b4bc-4699-9192-586f02c0405e	e3fea1ab-20c7-45c0-8be6-0538353d16b3	80	3
3bed23fb-b4bc-4699-9192-586f02c0405e	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	75	4
3bed23fb-b4bc-4699-9192-586f02c0405e	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
f03d5a97-0539-4692-8841-af7a070ee27a	71232d6e-c5b8-4c28-89df-276a5f6aeb7d	95	1
f03d5a97-0539-4692-8841-af7a070ee27a	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	85	2
f03d5a97-0539-4692-8841-af7a070ee27a	1626400a-0417-4ff8-bfed-d89ef198074f	80	3
f03d5a97-0539-4692-8841-af7a070ee27a	10a93b7f-37f4-470c-a39e-e442b5437113	75	4
f03d5a97-0539-4692-8841-af7a070ee27a	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	70	5
7d1d7ad0-8f9a-4f49-a517-df10b3136560	71232d6e-c5b8-4c28-89df-276a5f6aeb7d	90	1
7d1d7ad0-8f9a-4f49-a517-df10b3136560	e3fea1ab-20c7-45c0-8be6-0538353d16b3	85	2
7d1d7ad0-8f9a-4f49-a517-df10b3136560	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	80	3
7d1d7ad0-8f9a-4f49-a517-df10b3136560	d4cf402c-1804-4bfc-af25-6b60196102a1	75	4
7d1d7ad0-8f9a-4f49-a517-df10b3136560	e41bfae9-b3a5-4661-a420-290d6c27da35	70	5
ecb05f78-c3dc-4c3f-aeb9-ad7985bd34e5	d4cf402c-1804-4bfc-af25-6b60196102a1	95	1
ecb05f78-c3dc-4c3f-aeb9-ad7985bd34e5	6a657f15-2638-4401-a4cb-1cb3d78446be	85	2
ecb05f78-c3dc-4c3f-aeb9-ad7985bd34e5	89219724-7107-4ccf-9ccf-bb20d439a10f	80	3
ecb05f78-c3dc-4c3f-aeb9-ad7985bd34e5	10a93b7f-37f4-470c-a39e-e442b5437113	75	4
ecb05f78-c3dc-4c3f-aeb9-ad7985bd34e5	e3fea1ab-20c7-45c0-8be6-0538353d16b3	70	5
d0ca3ed4-4f2e-44cb-a494-f1076499dedc	e3fea1ab-20c7-45c0-8be6-0538353d16b3	90	1
d0ca3ed4-4f2e-44cb-a494-f1076499dedc	32b8ae1f-2a7e-4065-bea2-6392a15348c5	85	2
d0ca3ed4-4f2e-44cb-a494-f1076499dedc	d4cf402c-1804-4bfc-af25-6b60196102a1	80	3
d0ca3ed4-4f2e-44cb-a494-f1076499dedc	e41bfae9-b3a5-4661-a420-290d6c27da35	75	4
d0ca3ed4-4f2e-44cb-a494-f1076499dedc	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
ce88f95e-01cc-4d2e-be0b-35d52bc297e9	e41bfae9-b3a5-4661-a420-290d6c27da35	95	1
ce88f95e-01cc-4d2e-be0b-35d52bc297e9	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	85	2
ce88f95e-01cc-4d2e-be0b-35d52bc297e9	e3fea1ab-20c7-45c0-8be6-0538353d16b3	80	3
f8751a4b-64a0-4878-ad63-704933f3f41f	e3fea1ab-20c7-45c0-8be6-0538353d16b3	80	3
f8751a4b-64a0-4878-ad63-704933f3f41f	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
7a542bf6-eaf0-4077-b374-60dea2563c8c	10a93b7f-37f4-470c-a39e-e442b5437113	75	4
57bda1da-5b8e-461b-8940-757a8130c09b	e3fea1ab-20c7-45c0-8be6-0538353d16b3	95	1
57bda1da-5b8e-461b-8940-757a8130c09b	89219724-7107-4ccf-9ccf-bb20d439a10f	85	2
57bda1da-5b8e-461b-8940-757a8130c09b	65f3f958-a668-479f-83aa-f2b0b9bb8236	80	3
57bda1da-5b8e-461b-8940-757a8130c09b	10a93b7f-37f4-470c-a39e-e442b5437113	75	4
57bda1da-5b8e-461b-8940-757a8130c09b	f1fb6be8-89b9-4f13-b609-6a3565dd92b3	70	5
57a1037a-d639-458f-8007-6b9ecfaa947a	495b763f-161e-4f28-818a-ae7ddb91c774	95	1
57a1037a-d639-458f-8007-6b9ecfaa947a	3141f563-5039-48a5-a7f1-eac9c29e38ba	85	2
19133cd0-67a4-4de4-9809-4db49357d487	d4cf402c-1804-4bfc-af25-6b60196102a1	80	3
ce88f95e-01cc-4d2e-be0b-35d52bc297e9	32b8ae1f-2a7e-4065-bea2-6392a15348c5	75	4
ce88f95e-01cc-4d2e-be0b-35d52bc297e9	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	70	5
b7895678-6a6a-4273-ac01-a42aa7a1dc95	e3fea1ab-20c7-45c0-8be6-0538353d16b3	95	1
b7895678-6a6a-4273-ac01-a42aa7a1dc95	495b763f-161e-4f28-818a-ae7ddb91c774	85	2
b7895678-6a6a-4273-ac01-a42aa7a1dc95	89219724-7107-4ccf-9ccf-bb20d439a10f	80	3
b7895678-6a6a-4273-ac01-a42aa7a1dc95	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	75	4
b7895678-6a6a-4273-ac01-a42aa7a1dc95	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
3c5563bf-8bcf-42f5-a50b-28ad63938d4d	e3fea1ab-20c7-45c0-8be6-0538353d16b3	90	1
3c5563bf-8bcf-42f5-a50b-28ad63938d4d	65f3f958-a668-479f-83aa-f2b0b9bb8236	85	2
3c5563bf-8bcf-42f5-a50b-28ad63938d4d	6a657f15-2638-4401-a4cb-1cb3d78446be	80	3
3c5563bf-8bcf-42f5-a50b-28ad63938d4d	7879e3d8-bf89-4140-b863-4761ec613c4c	75	4
3c5563bf-8bcf-42f5-a50b-28ad63938d4d	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	70	5
79864c5e-5f95-442f-8c8d-8c093066ee5b	e3fea1ab-20c7-45c0-8be6-0538353d16b3	95	1
79864c5e-5f95-442f-8c8d-8c093066ee5b	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	85	2
8335f285-1a61-47f4-b02a-dbd8e8c2b926	3141f563-5039-48a5-a7f1-eac9c29e38ba	80	3
8335f285-1a61-47f4-b02a-dbd8e8c2b926	10a93b7f-37f4-470c-a39e-e442b5437113	75	4
8335f285-1a61-47f4-b02a-dbd8e8c2b926	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
3383c1ab-88c0-4958-bacf-0b1491a1e761	d4cf402c-1804-4bfc-af25-6b60196102a1	90	1
3383c1ab-88c0-4958-bacf-0b1491a1e761	7879e3d8-bf89-4140-b863-4761ec613c4c	85	2
3383c1ab-88c0-4958-bacf-0b1491a1e761	e3fea1ab-20c7-45c0-8be6-0538353d16b3	80	3
79864c5e-5f95-442f-8c8d-8c093066ee5b	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	80	3
79864c5e-5f95-442f-8c8d-8c093066ee5b	e41bfae9-b3a5-4661-a420-290d6c27da35	75	4
79864c5e-5f95-442f-8c8d-8c093066ee5b	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	70	5
8710a3af-739b-4817-aceb-3d3eca0566d3	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	90	1
8710a3af-739b-4817-aceb-3d3eca0566d3	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	85	2
8710a3af-739b-4817-aceb-3d3eca0566d3	e3fea1ab-20c7-45c0-8be6-0538353d16b3	80	3
8710a3af-739b-4817-aceb-3d3eca0566d3	3141f563-5039-48a5-a7f1-eac9c29e38ba	75	4
8710a3af-739b-4817-aceb-3d3eca0566d3	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
76bede9b-42da-4e9e-997f-f5b3907397d0	3141f563-5039-48a5-a7f1-eac9c29e38ba	95	1
76bede9b-42da-4e9e-997f-f5b3907397d0	d4cf402c-1804-4bfc-af25-6b60196102a1	85	2
76bede9b-42da-4e9e-997f-f5b3907397d0	e3fea1ab-20c7-45c0-8be6-0538353d16b3	80	3
76bede9b-42da-4e9e-997f-f5b3907397d0	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	75	4
76bede9b-42da-4e9e-997f-f5b3907397d0	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	70	5
ba231572-151a-4d38-a492-7a0fd966042a	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	95	1
ba231572-151a-4d38-a492-7a0fd966042a	6a657f15-2638-4401-a4cb-1cb3d78446be	85	2
ba231572-151a-4d38-a492-7a0fd966042a	71232d6e-c5b8-4c28-89df-276a5f6aeb7d	80	3
ba231572-151a-4d38-a492-7a0fd966042a	e3fea1ab-20c7-45c0-8be6-0538353d16b3	75	4
ba231572-151a-4d38-a492-7a0fd966042a	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	70	5
0c8953b6-de1b-4a36-afc0-486388246612	e41bfae9-b3a5-4661-a420-290d6c27da35	95	1
0c8953b6-de1b-4a36-afc0-486388246612	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	85	2
0c8953b6-de1b-4a36-afc0-486388246612	65f3f958-a668-479f-83aa-f2b0b9bb8236	80	3
0c8953b6-de1b-4a36-afc0-486388246612	e3fea1ab-20c7-45c0-8be6-0538353d16b3	75	4
0c8953b6-de1b-4a36-afc0-486388246612	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	70	5
03889b15-9788-44d9-8fad-327ad9f3f429	e3fea1ab-20c7-45c0-8be6-0538353d16b3	95	1
03889b15-9788-44d9-8fad-327ad9f3f429	d4cf402c-1804-4bfc-af25-6b60196102a1	85	2
03889b15-9788-44d9-8fad-327ad9f3f429	89219724-7107-4ccf-9ccf-bb20d439a10f	80	3
03889b15-9788-44d9-8fad-327ad9f3f429	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	75	4
03889b15-9788-44d9-8fad-327ad9f3f429	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
b6d4d2c2-184e-411a-a953-31b8a48f13d5	6a657f15-2638-4401-a4cb-1cb3d78446be	90	1
b6d4d2c2-184e-411a-a953-31b8a48f13d5	e3fea1ab-20c7-45c0-8be6-0538353d16b3	85	2
b6d4d2c2-184e-411a-a953-31b8a48f13d5	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	80	3
b6d4d2c2-184e-411a-a953-31b8a48f13d5	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	75	4
b6d4d2c2-184e-411a-a953-31b8a48f13d5	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
dde8e905-12bb-4a7b-ba55-f5016baeafb8	e41bfae9-b3a5-4661-a420-290d6c27da35	95	1
dde8e905-12bb-4a7b-ba55-f5016baeafb8	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	85	2
dde8e905-12bb-4a7b-ba55-f5016baeafb8	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	80	3
dde8e905-12bb-4a7b-ba55-f5016baeafb8	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	75	4
dde8e905-12bb-4a7b-ba55-f5016baeafb8	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
9d4b8003-45af-4967-9bd3-4a134a8ea251	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	95	1
9d4b8003-45af-4967-9bd3-4a134a8ea251	e3fea1ab-20c7-45c0-8be6-0538353d16b3	85	2
9d4b8003-45af-4967-9bd3-4a134a8ea251	6a657f15-2638-4401-a4cb-1cb3d78446be	80	3
9d4b8003-45af-4967-9bd3-4a134a8ea251	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	75	4
9d4b8003-45af-4967-9bd3-4a134a8ea251	71232d6e-c5b8-4c28-89df-276a5f6aeb7d	70	5
b4958433-28ae-4cf7-b922-68e31a061fd0	e3fea1ab-20c7-45c0-8be6-0538353d16b3	95	1
b4958433-28ae-4cf7-b922-68e31a061fd0	6a657f15-2638-4401-a4cb-1cb3d78446be	85	2
b4958433-28ae-4cf7-b922-68e31a061fd0	65f3f958-a668-479f-83aa-f2b0b9bb8236	80	3
b4958433-28ae-4cf7-b922-68e31a061fd0	e41bfae9-b3a5-4661-a420-290d6c27da35	75	4
b4958433-28ae-4cf7-b922-68e31a061fd0	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	70	5
8622cbf7-674e-4327-8745-58e0e8610e04	e3fea1ab-20c7-45c0-8be6-0538353d16b3	95	1
8622cbf7-674e-4327-8745-58e0e8610e04	6a657f15-2638-4401-a4cb-1cb3d78446be	85	2
8622cbf7-674e-4327-8745-58e0e8610e04	89219724-7107-4ccf-9ccf-bb20d439a10f	80	3
8622cbf7-674e-4327-8745-58e0e8610e04	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	75	4
8622cbf7-674e-4327-8745-58e0e8610e04	495b763f-161e-4f28-818a-ae7ddb91c774	70	5
c1c65875-789f-42a8-80e7-cba95705cd95	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	95	1
c1c65875-789f-42a8-80e7-cba95705cd95	e3fea1ab-20c7-45c0-8be6-0538353d16b3	85	2
c1c65875-789f-42a8-80e7-cba95705cd95	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	80	3
c1c65875-789f-42a8-80e7-cba95705cd95	71232d6e-c5b8-4c28-89df-276a5f6aeb7d	75	4
c1c65875-789f-42a8-80e7-cba95705cd95	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	70	5
4d017fe5-f486-4d0a-b1de-21ddcc5b9256	e3fea1ab-20c7-45c0-8be6-0538353d16b3	95	1
4d017fe5-f486-4d0a-b1de-21ddcc5b9256	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	85	2
4d017fe5-f486-4d0a-b1de-21ddcc5b9256	6a657f15-2638-4401-a4cb-1cb3d78446be	80	3
4d017fe5-f486-4d0a-b1de-21ddcc5b9256	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	75	4
4d017fe5-f486-4d0a-b1de-21ddcc5b9256	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
0fbc106f-ec7f-4a5b-a6b5-3921a845a82b	e3fea1ab-20c7-45c0-8be6-0538353d16b3	95	1
0fbc106f-ec7f-4a5b-a6b5-3921a845a82b	65f3f958-a668-479f-83aa-f2b0b9bb8236	85	2
0fbc106f-ec7f-4a5b-a6b5-3921a845a82b	89219724-7107-4ccf-9ccf-bb20d439a10f	80	3
0fbc106f-ec7f-4a5b-a6b5-3921a845a82b	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	75	4
53017bb5-499a-4e04-8e64-d38ecad10cd6	89219724-7107-4ccf-9ccf-bb20d439a10f	95	1
53017bb5-499a-4e04-8e64-d38ecad10cd6	d4cf402c-1804-4bfc-af25-6b60196102a1	85	2
53017bb5-499a-4e04-8e64-d38ecad10cd6	32b8ae1f-2a7e-4065-bea2-6392a15348c5	80	3
53017bb5-499a-4e04-8e64-d38ecad10cd6	3141f563-5039-48a5-a7f1-eac9c29e38ba	75	4
53017bb5-499a-4e04-8e64-d38ecad10cd6	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
df7b65c9-eb8d-46ee-a00a-fe2312ab53fb	e41bfae9-b3a5-4661-a420-290d6c27da35	95	1
df7b65c9-eb8d-46ee-a00a-fe2312ab53fb	b72bef64-da93-42a8-8393-c920aafd58fa	85	2
df7b65c9-eb8d-46ee-a00a-fe2312ab53fb	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	80	3
df7b65c9-eb8d-46ee-a00a-fe2312ab53fb	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	75	4
df7b65c9-eb8d-46ee-a00a-fe2312ab53fb	e3fea1ab-20c7-45c0-8be6-0538353d16b3	70	5
b7e13877-b96e-45b0-bac1-571371854018	e55153a9-7d48-4956-9a15-f11205b95aa5	95	1
b7e13877-b96e-45b0-bac1-571371854018	1626400a-0417-4ff8-bfed-d89ef198074f	85	2
b7e13877-b96e-45b0-bac1-571371854018	ec62c48b-a0fe-44b8-b10f-31472c3ce534	80	3
b7e13877-b96e-45b0-bac1-571371854018	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	75	4
b7e13877-b96e-45b0-bac1-571371854018	3141f563-5039-48a5-a7f1-eac9c29e38ba	70	5
0c50de65-748d-4d12-8885-296f2c5c7b0b	a7f6bb93-d636-4796-be63-43d918d69ad5	95	1
0c50de65-748d-4d12-8885-296f2c5c7b0b	ec62c48b-a0fe-44b8-b10f-31472c3ce534	85	2
0c50de65-748d-4d12-8885-296f2c5c7b0b	10a93b7f-37f4-470c-a39e-e442b5437113	80	3
0c50de65-748d-4d12-8885-296f2c5c7b0b	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	75	4
0c50de65-748d-4d12-8885-296f2c5c7b0b	e3fea1ab-20c7-45c0-8be6-0538353d16b3	70	5
0f06ee55-2363-4bad-96fc-64e55d6f8be7	e41bfae9-b3a5-4661-a420-290d6c27da35	90	1
0f06ee55-2363-4bad-96fc-64e55d6f8be7	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	85	2
0f06ee55-2363-4bad-96fc-64e55d6f8be7	89219724-7107-4ccf-9ccf-bb20d439a10f	80	3
0f06ee55-2363-4bad-96fc-64e55d6f8be7	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	75	4
0f06ee55-2363-4bad-96fc-64e55d6f8be7	e3fea1ab-20c7-45c0-8be6-0538353d16b3	70	5
81a26ad3-7d36-484e-90c2-c9674528bd93	e3fea1ab-20c7-45c0-8be6-0538353d16b3	90	1
81a26ad3-7d36-484e-90c2-c9674528bd93	495b763f-161e-4f28-818a-ae7ddb91c774	85	2
81a26ad3-7d36-484e-90c2-c9674528bd93	89219724-7107-4ccf-9ccf-bb20d439a10f	80	3
81a26ad3-7d36-484e-90c2-c9674528bd93	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	75	4
81a26ad3-7d36-484e-90c2-c9674528bd93	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
9457ded1-6ca4-4506-947a-835e8cdc38ea	e3fea1ab-20c7-45c0-8be6-0538353d16b3	90	1
9457ded1-6ca4-4506-947a-835e8cdc38ea	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	85	2
9457ded1-6ca4-4506-947a-835e8cdc38ea	d4cf402c-1804-4bfc-af25-6b60196102a1	80	3
9457ded1-6ca4-4506-947a-835e8cdc38ea	e41bfae9-b3a5-4661-a420-290d6c27da35	75	4
9457ded1-6ca4-4506-947a-835e8cdc38ea	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	70	5
749a3306-63b0-421e-8157-12afca50f3ef	e3fea1ab-20c7-45c0-8be6-0538353d16b3	90	1
749a3306-63b0-421e-8157-12afca50f3ef	16f221cc-38cc-4dc0-8a26-1cff4bc731db	85	2
749a3306-63b0-421e-8157-12afca50f3ef	6a657f15-2638-4401-a4cb-1cb3d78446be	80	3
749a3306-63b0-421e-8157-12afca50f3ef	d4cf402c-1804-4bfc-af25-6b60196102a1	75	4
749a3306-63b0-421e-8157-12afca50f3ef	e41bfae9-b3a5-4661-a420-290d6c27da35	70	5
d732c139-274b-48d9-8f4b-bf6d776a789c	e41bfae9-b3a5-4661-a420-290d6c27da35	95	1
d732c139-274b-48d9-8f4b-bf6d776a789c	e3fea1ab-20c7-45c0-8be6-0538353d16b3	85	2
d732c139-274b-48d9-8f4b-bf6d776a789c	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	80	3
d732c139-274b-48d9-8f4b-bf6d776a789c	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	75	4
d732c139-274b-48d9-8f4b-bf6d776a789c	3141f563-5039-48a5-a7f1-eac9c29e38ba	70	5
3b2eee4a-cede-428c-a508-ddb936d9789b	6a657f15-2638-4401-a4cb-1cb3d78446be	90	1
3b2eee4a-cede-428c-a508-ddb936d9789b	e3fea1ab-20c7-45c0-8be6-0538353d16b3	85	2
3b2eee4a-cede-428c-a508-ddb936d9789b	58174674-9bd1-4df8-8c10-9a50cd10b947	80	3
3b2eee4a-cede-428c-a508-ddb936d9789b	495b763f-161e-4f28-818a-ae7ddb91c774	75	4
3b2eee4a-cede-428c-a508-ddb936d9789b	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	70	5
e5462083-202c-4a22-b9db-c036eb0cf1c9	e3fea1ab-20c7-45c0-8be6-0538353d16b3	95	1
e5462083-202c-4a22-b9db-c036eb0cf1c9	fd3ecda2-df68-461e-a1ca-5b56479e7ad8	85	2
e5462083-202c-4a22-b9db-c036eb0cf1c9	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	80	3
e5462083-202c-4a22-b9db-c036eb0cf1c9	71232d6e-c5b8-4c28-89df-276a5f6aeb7d	75	4
e5462083-202c-4a22-b9db-c036eb0cf1c9	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	70	5
9c969ede-7504-409f-a07a-61f8c2bf1ace	6a657f15-2638-4401-a4cb-1cb3d78446be	90	1
9c969ede-7504-409f-a07a-61f8c2bf1ace	e3fea1ab-20c7-45c0-8be6-0538353d16b3	85	2
9c969ede-7504-409f-a07a-61f8c2bf1ace	10a93b7f-37f4-470c-a39e-e442b5437113	80	3
9c969ede-7504-409f-a07a-61f8c2bf1ace	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	75	4
9c969ede-7504-409f-a07a-61f8c2bf1ace	ec62c48b-a0fe-44b8-b10f-31472c3ce534	70	5
86df4db3-9546-458e-812d-987ad735f122	e3fea1ab-20c7-45c0-8be6-0538353d16b3	95	1
86df4db3-9546-458e-812d-987ad735f122	e41bfae9-b3a5-4661-a420-290d6c27da35	85	2
86df4db3-9546-458e-812d-987ad735f122	1626400a-0417-4ff8-bfed-d89ef198074f	80	3
86df4db3-9546-458e-812d-987ad735f122	3141f563-5039-48a5-a7f1-eac9c29e38ba	75	4
86df4db3-9546-458e-812d-987ad735f122	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	70	5
ba3c5310-aef4-4e3e-a66d-4beca03968d7	e41bfae9-b3a5-4661-a420-290d6c27da35	90	1
ba3c5310-aef4-4e3e-a66d-4beca03968d7	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	85	2
ba3c5310-aef4-4e3e-a66d-4beca03968d7	e3fea1ab-20c7-45c0-8be6-0538353d16b3	80	3
ba3c5310-aef4-4e3e-a66d-4beca03968d7	3141f563-5039-48a5-a7f1-eac9c29e38ba	75	4
ba3c5310-aef4-4e3e-a66d-4beca03968d7	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	70	5
eb8df122-2c9a-4f22-b82a-0db35ef110be	6a657f15-2638-4401-a4cb-1cb3d78446be	95	1
eb8df122-2c9a-4f22-b82a-0db35ef110be	d4cf402c-1804-4bfc-af25-6b60196102a1	85	2
eb8df122-2c9a-4f22-b82a-0db35ef110be	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	80	3
eb8df122-2c9a-4f22-b82a-0db35ef110be	e3fea1ab-20c7-45c0-8be6-0538353d16b3	75	4
eb8df122-2c9a-4f22-b82a-0db35ef110be	e41bfae9-b3a5-4661-a420-290d6c27da35	70	5
3a2405e4-1dd2-409e-a24f-49ba13b0b0e6	e3fea1ab-20c7-45c0-8be6-0538353d16b3	95	1
3a2405e4-1dd2-409e-a24f-49ba13b0b0e6	6a657f15-2638-4401-a4cb-1cb3d78446be	85	2
3a2405e4-1dd2-409e-a24f-49ba13b0b0e6	65f3f958-a668-479f-83aa-f2b0b9bb8236	80	3
3a2405e4-1dd2-409e-a24f-49ba13b0b0e6	ec62c48b-a0fe-44b8-b10f-31472c3ce534	75	4
3a2405e4-1dd2-409e-a24f-49ba13b0b0e6	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	70	5
d578595b-6705-491f-ba0d-31b5f82f2872	6a657f15-2638-4401-a4cb-1cb3d78446be	90	1
d578595b-6705-491f-ba0d-31b5f82f2872	d4cf402c-1804-4bfc-af25-6b60196102a1	85	2
d578595b-6705-491f-ba0d-31b5f82f2872	e3fea1ab-20c7-45c0-8be6-0538353d16b3	80	3
d578595b-6705-491f-ba0d-31b5f82f2872	89219724-7107-4ccf-9ccf-bb20d439a10f	75	4
d578595b-6705-491f-ba0d-31b5f82f2872	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
e3b4b7f4-c601-4482-8935-319780b2b08a	16f221cc-38cc-4dc0-8a26-1cff4bc731db	95	1
e3b4b7f4-c601-4482-8935-319780b2b08a	e3fea1ab-20c7-45c0-8be6-0538353d16b3	85	2
e3b4b7f4-c601-4482-8935-319780b2b08a	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	80	3
e3b4b7f4-c601-4482-8935-319780b2b08a	6a657f15-2638-4401-a4cb-1cb3d78446be	75	4
e3b4b7f4-c601-4482-8935-319780b2b08a	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	70	5
23d36c92-f6d1-424b-a130-eff65b3470a5	6a657f15-2638-4401-a4cb-1cb3d78446be	95	1
23d36c92-f6d1-424b-a130-eff65b3470a5	05650238-fd2f-492d-a3cf-48e1fed78e5b	85	2
23d36c92-f6d1-424b-a130-eff65b3470a5	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	80	3
23d36c92-f6d1-424b-a130-eff65b3470a5	10a93b7f-37f4-470c-a39e-e442b5437113	75	4
23d36c92-f6d1-424b-a130-eff65b3470a5	89219724-7107-4ccf-9ccf-bb20d439a10f	70	5
a8a9664b-20ea-4c42-a1ab-4a428fc294b4	6a657f15-2638-4401-a4cb-1cb3d78446be	90	1
a8a9664b-20ea-4c42-a1ab-4a428fc294b4	e3fea1ab-20c7-45c0-8be6-0538353d16b3	85	2
a8a9664b-20ea-4c42-a1ab-4a428fc294b4	89219724-7107-4ccf-9ccf-bb20d439a10f	80	3
a8a9664b-20ea-4c42-a1ab-4a428fc294b4	65f3f958-a668-479f-83aa-f2b0b9bb8236	75	4
a8a9664b-20ea-4c42-a1ab-4a428fc294b4	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	70	5
067b8a8b-6ed6-4401-b45c-351cad2d7ddb	05650238-fd2f-492d-a3cf-48e1fed78e5b	95	1
067b8a8b-6ed6-4401-b45c-351cad2d7ddb	65f3f958-a668-479f-83aa-f2b0b9bb8236	85	2
067b8a8b-6ed6-4401-b45c-351cad2d7ddb	e3fea1ab-20c7-45c0-8be6-0538353d16b3	80	3
067b8a8b-6ed6-4401-b45c-351cad2d7ddb	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	75	4
067b8a8b-6ed6-4401-b45c-351cad2d7ddb	89219724-7107-4ccf-9ccf-bb20d439a10f	70	5
044315ac-09de-4042-bab6-b234ed0f310c	6a657f15-2638-4401-a4cb-1cb3d78446be	90	1
044315ac-09de-4042-bab6-b234ed0f310c	e3fea1ab-20c7-45c0-8be6-0538353d16b3	85	2
044315ac-09de-4042-bab6-b234ed0f310c	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	80	3
044315ac-09de-4042-bab6-b234ed0f310c	65f3f958-a668-479f-83aa-f2b0b9bb8236	75	4
044315ac-09de-4042-bab6-b234ed0f310c	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	70	5
280fb2cf-d23f-49bb-a9ec-606c342c0599	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	95	1
280fb2cf-d23f-49bb-a9ec-606c342c0599	6a657f15-2638-4401-a4cb-1cb3d78446be	85	2
280fb2cf-d23f-49bb-a9ec-606c342c0599	e41bfae9-b3a5-4661-a420-290d6c27da35	80	3
280fb2cf-d23f-49bb-a9ec-606c342c0599	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	75	4
280fb2cf-d23f-49bb-a9ec-606c342c0599	e3fea1ab-20c7-45c0-8be6-0538353d16b3	70	5
c4172c9e-75b5-4946-8832-deea55117532	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	95	1
c4172c9e-75b5-4946-8832-deea55117532	6a657f15-2638-4401-a4cb-1cb3d78446be	85	2
c4172c9e-75b5-4946-8832-deea55117532	e41bfae9-b3a5-4661-a420-290d6c27da35	80	3
c4172c9e-75b5-4946-8832-deea55117532	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	75	4
c4172c9e-75b5-4946-8832-deea55117532	e3fea1ab-20c7-45c0-8be6-0538353d16b3	70	5
a3995d5e-7d74-4485-878e-7cc51d1090bf	6a657f15-2638-4401-a4cb-1cb3d78446be	95	1
a3995d5e-7d74-4485-878e-7cc51d1090bf	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	85	2
a3995d5e-7d74-4485-878e-7cc51d1090bf	d4cf402c-1804-4bfc-af25-6b60196102a1	80	3
a3995d5e-7d74-4485-878e-7cc51d1090bf	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	75	4
a3995d5e-7d74-4485-878e-7cc51d1090bf	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
055fa60c-9764-45b3-8d78-2737f584df4d	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	95	1
055fa60c-9764-45b3-8d78-2737f584df4d	e41bfae9-b3a5-4661-a420-290d6c27da35	85	2
055fa60c-9764-45b3-8d78-2737f584df4d	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	80	3
055fa60c-9764-45b3-8d78-2737f584df4d	1626400a-0417-4ff8-bfed-d89ef198074f	75	4
055fa60c-9764-45b3-8d78-2737f584df4d	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
4621d0cd-1f1f-4401-8682-ce3d8eca0422	6a657f15-2638-4401-a4cb-1cb3d78446be	95	1
4621d0cd-1f1f-4401-8682-ce3d8eca0422	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	85	2
4621d0cd-1f1f-4401-8682-ce3d8eca0422	89219724-7107-4ccf-9ccf-bb20d439a10f	80	3
4621d0cd-1f1f-4401-8682-ce3d8eca0422	e3fea1ab-20c7-45c0-8be6-0538353d16b3	75	4
4621d0cd-1f1f-4401-8682-ce3d8eca0422	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
36b5c8eb-cbbd-498b-8565-a70a5f0a525f	6a657f15-2638-4401-a4cb-1cb3d78446be	95	1
36b5c8eb-cbbd-498b-8565-a70a5f0a525f	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	90	2
36b5c8eb-cbbd-498b-8565-a70a5f0a525f	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	80	3
36b5c8eb-cbbd-498b-8565-a70a5f0a525f	89219724-7107-4ccf-9ccf-bb20d439a10f	75	4
36b5c8eb-cbbd-498b-8565-a70a5f0a525f	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
67e8a831-9640-4800-9594-271fd03cf74c	6a657f15-2638-4401-a4cb-1cb3d78446be	95	1
67e8a831-9640-4800-9594-271fd03cf74c	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	85	2
67e8a831-9640-4800-9594-271fd03cf74c	e3fea1ab-20c7-45c0-8be6-0538353d16b3	80	3
67e8a831-9640-4800-9594-271fd03cf74c	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	75	4
67e8a831-9640-4800-9594-271fd03cf74c	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
6796549a-4d47-4746-a463-09c282b32182	e3fea1ab-20c7-45c0-8be6-0538353d16b3	95	1
6796549a-4d47-4746-a463-09c282b32182	65f3f958-a668-479f-83aa-f2b0b9bb8236	85	2
6796549a-4d47-4746-a463-09c282b32182	6a657f15-2638-4401-a4cb-1cb3d78446be	80	3
6796549a-4d47-4746-a463-09c282b32182	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	75	4
6796549a-4d47-4746-a463-09c282b32182	89219724-7107-4ccf-9ccf-bb20d439a10f	70	5
dcf5fdcd-9837-48e8-8335-7a245acd9c37	05650238-fd2f-492d-a3cf-48e1fed78e5b	95	1
dcf5fdcd-9837-48e8-8335-7a245acd9c37	6a657f15-2638-4401-a4cb-1cb3d78446be	85	2
dcf5fdcd-9837-48e8-8335-7a245acd9c37	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	80	3
dcf5fdcd-9837-48e8-8335-7a245acd9c37	89219724-7107-4ccf-9ccf-bb20d439a10f	75	4
dcf5fdcd-9837-48e8-8335-7a245acd9c37	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
312a8838-da3b-45cc-afe4-bdb61d487252	05650238-fd2f-492d-a3cf-48e1fed78e5b	95	1
312a8838-da3b-45cc-afe4-bdb61d487252	6a657f15-2638-4401-a4cb-1cb3d78446be	85	2
312a8838-da3b-45cc-afe4-bdb61d487252	65f3f958-a668-479f-83aa-f2b0b9bb8236	80	3
312a8838-da3b-45cc-afe4-bdb61d487252	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	75	4
312a8838-da3b-45cc-afe4-bdb61d487252	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
1fe93fdd-e1f4-4653-be71-8f563d0b566c	6a657f15-2638-4401-a4cb-1cb3d78446be	90	1
1fe93fdd-e1f4-4653-be71-8f563d0b566c	e41bfae9-b3a5-4661-a420-290d6c27da35	85	2
1fe93fdd-e1f4-4653-be71-8f563d0b566c	10a93b7f-37f4-470c-a39e-e442b5437113	80	3
1fe93fdd-e1f4-4653-be71-8f563d0b566c	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	75	4
1fe93fdd-e1f4-4653-be71-8f563d0b566c	3141f563-5039-48a5-a7f1-eac9c29e38ba	70	5
ff492e6a-9f3a-4013-bff9-371914b060e3	16f221cc-38cc-4dc0-8a26-1cff4bc731db	95	1
ff492e6a-9f3a-4013-bff9-371914b060e3	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	85	2
ff492e6a-9f3a-4013-bff9-371914b060e3	05650238-fd2f-492d-a3cf-48e1fed78e5b	80	3
ff492e6a-9f3a-4013-bff9-371914b060e3	65f3f958-a668-479f-83aa-f2b0b9bb8236	75	4
ff492e6a-9f3a-4013-bff9-371914b060e3	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
ba8a5af6-892c-4fc3-99db-d04e3e3fc452	e3fea1ab-20c7-45c0-8be6-0538353d16b3	95	1
ba8a5af6-892c-4fc3-99db-d04e3e3fc452	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	85	2
ba8a5af6-892c-4fc3-99db-d04e3e3fc452	ec62c48b-a0fe-44b8-b10f-31472c3ce534	80	3
ba8a5af6-892c-4fc3-99db-d04e3e3fc452	d4cf402c-1804-4bfc-af25-6b60196102a1	75	4
ba8a5af6-892c-4fc3-99db-d04e3e3fc452	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
397115ec-f4e5-4414-839b-67d8aaf0d3be	e3fea1ab-20c7-45c0-8be6-0538353d16b3	90	1
397115ec-f4e5-4414-839b-67d8aaf0d3be	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	85	2
397115ec-f4e5-4414-839b-67d8aaf0d3be	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	80	3
397115ec-f4e5-4414-839b-67d8aaf0d3be	6a657f15-2638-4401-a4cb-1cb3d78446be	75	4
397115ec-f4e5-4414-839b-67d8aaf0d3be	1c54233e-0ea1-46d3-b0be-0c74fc14ddb2	70	5
3efc65e3-0315-47e4-aaa4-f3979b8d3a7b	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	95	1
3efc65e3-0315-47e4-aaa4-f3979b8d3a7b	e3fea1ab-20c7-45c0-8be6-0538353d16b3	85	2
3efc65e3-0315-47e4-aaa4-f3979b8d3a7b	10a93b7f-37f4-470c-a39e-e442b5437113	80	3
3efc65e3-0315-47e4-aaa4-f3979b8d3a7b	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	75	4
3efc65e3-0315-47e4-aaa4-f3979b8d3a7b	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	70	5
81de114f-b777-47a6-bcf5-e330ca90337b	e3fea1ab-20c7-45c0-8be6-0538353d16b3	95	1
81de114f-b777-47a6-bcf5-e330ca90337b	16f221cc-38cc-4dc0-8a26-1cff4bc731db	85	2
81de114f-b777-47a6-bcf5-e330ca90337b	65f3f958-a668-479f-83aa-f2b0b9bb8236	80	3
81de114f-b777-47a6-bcf5-e330ca90337b	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	75	4
81de114f-b777-47a6-bcf5-e330ca90337b	6a657f15-2638-4401-a4cb-1cb3d78446be	70	5
035a49c9-3768-457d-aff4-9e2b206026d2	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	95	1
035a49c9-3768-457d-aff4-9e2b206026d2	16f221cc-38cc-4dc0-8a26-1cff4bc731db	85	2
035a49c9-3768-457d-aff4-9e2b206026d2	e41bfae9-b3a5-4661-a420-290d6c27da35	80	3
035a49c9-3768-457d-aff4-9e2b206026d2	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	75	4
035a49c9-3768-457d-aff4-9e2b206026d2	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
4bb8b556-298d-4ca8-ae89-102b6665d712	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	90	1
4bb8b556-298d-4ca8-ae89-102b6665d712	6a657f15-2638-4401-a4cb-1cb3d78446be	85	2
4bb8b556-298d-4ca8-ae89-102b6665d712	e3fea1ab-20c7-45c0-8be6-0538353d16b3	80	3
4bb8b556-298d-4ca8-ae89-102b6665d712	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	75	4
4bb8b556-298d-4ca8-ae89-102b6665d712	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	70	5
88b9c3ea-f9aa-44a8-aa88-1d2dfa87051c	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	95	1
88b9c3ea-f9aa-44a8-aa88-1d2dfa87051c	6a657f15-2638-4401-a4cb-1cb3d78446be	85	2
88b9c3ea-f9aa-44a8-aa88-1d2dfa87051c	e3fea1ab-20c7-45c0-8be6-0538353d16b3	80	3
88b9c3ea-f9aa-44a8-aa88-1d2dfa87051c	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	75	4
88b9c3ea-f9aa-44a8-aa88-1d2dfa87051c	ec62c48b-a0fe-44b8-b10f-31472c3ce534	70	5
38976821-8d3a-45f6-9ead-9da7672e60ff	89219724-7107-4ccf-9ccf-bb20d439a10f	95	1
38976821-8d3a-45f6-9ead-9da7672e60ff	6a657f15-2638-4401-a4cb-1cb3d78446be	85	2
38976821-8d3a-45f6-9ead-9da7672e60ff	e3fea1ab-20c7-45c0-8be6-0538353d16b3	80	3
38976821-8d3a-45f6-9ead-9da7672e60ff	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	75	4
38976821-8d3a-45f6-9ead-9da7672e60ff	495b763f-161e-4f28-818a-ae7ddb91c774	70	5
e850daba-9bef-4315-a514-27cb52d08d12	e3fea1ab-20c7-45c0-8be6-0538353d16b3	95	1
e850daba-9bef-4315-a514-27cb52d08d12	495b763f-161e-4f28-818a-ae7ddb91c774	85	2
e850daba-9bef-4315-a514-27cb52d08d12	65f3f958-a668-479f-83aa-f2b0b9bb8236	80	3
e850daba-9bef-4315-a514-27cb52d08d12	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	75	4
e850daba-9bef-4315-a514-27cb52d08d12	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
723e5cc1-fc70-499a-9dd3-6a3b6656e95c	e41bfae9-b3a5-4661-a420-290d6c27da35	95	1
723e5cc1-fc70-499a-9dd3-6a3b6656e95c	b72bef64-da93-42a8-8393-c920aafd58fa	85	2
723e5cc1-fc70-499a-9dd3-6a3b6656e95c	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	80	3
723e5cc1-fc70-499a-9dd3-6a3b6656e95c	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	75	4
723e5cc1-fc70-499a-9dd3-6a3b6656e95c	e3fea1ab-20c7-45c0-8be6-0538353d16b3	70	5
44ea09e5-6635-4b8c-bb71-e8c3170a869b	6a657f15-2638-4401-a4cb-1cb3d78446be	95	1
44ea09e5-6635-4b8c-bb71-e8c3170a869b	e41bfae9-b3a5-4661-a420-290d6c27da35	85	2
44ea09e5-6635-4b8c-bb71-e8c3170a869b	b72bef64-da93-42a8-8393-c920aafd58fa	80	3
44ea09e5-6635-4b8c-bb71-e8c3170a869b	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	75	4
44ea09e5-6635-4b8c-bb71-e8c3170a869b	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	70	5
c7b5b7e5-cdd5-45e5-bb69-63cfefed4251	6a657f15-2638-4401-a4cb-1cb3d78446be	95	1
c7b5b7e5-cdd5-45e5-bb69-63cfefed4251	e3fea1ab-20c7-45c0-8be6-0538353d16b3	85	2
c7b5b7e5-cdd5-45e5-bb69-63cfefed4251	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	80	3
c7b5b7e5-cdd5-45e5-bb69-63cfefed4251	89219724-7107-4ccf-9ccf-bb20d439a10f	75	4
c7b5b7e5-cdd5-45e5-bb69-63cfefed4251	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
4f50b3a7-eb39-4495-8a2c-9d0ef9131f00	e3fea1ab-20c7-45c0-8be6-0538353d16b3	95	1
4f50b3a7-eb39-4495-8a2c-9d0ef9131f00	6a657f15-2638-4401-a4cb-1cb3d78446be	85	2
4f50b3a7-eb39-4495-8a2c-9d0ef9131f00	89219724-7107-4ccf-9ccf-bb20d439a10f	80	3
4f50b3a7-eb39-4495-8a2c-9d0ef9131f00	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	75	4
4f50b3a7-eb39-4495-8a2c-9d0ef9131f00	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
1e4ba0bb-3695-44f6-a6e6-05b27af98c82	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	95	1
1e4ba0bb-3695-44f6-a6e6-05b27af98c82	e41bfae9-b3a5-4661-a420-290d6c27da35	85	2
1e4ba0bb-3695-44f6-a6e6-05b27af98c82	6a657f15-2638-4401-a4cb-1cb3d78446be	80	3
1e4ba0bb-3695-44f6-a6e6-05b27af98c82	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	75	4
1e4ba0bb-3695-44f6-a6e6-05b27af98c82	16f221cc-38cc-4dc0-8a26-1cff4bc731db	70	5
6ebeb9b9-bb1e-4aae-a2c0-5b29b3294b12	e3fea1ab-20c7-45c0-8be6-0538353d16b3	95	1
6ebeb9b9-bb1e-4aae-a2c0-5b29b3294b12	6a657f15-2638-4401-a4cb-1cb3d78446be	85	2
6ebeb9b9-bb1e-4aae-a2c0-5b29b3294b12	89219724-7107-4ccf-9ccf-bb20d439a10f	80	3
6ebeb9b9-bb1e-4aae-a2c0-5b29b3294b12	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	75	4
6ebeb9b9-bb1e-4aae-a2c0-5b29b3294b12	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
fb9b2e8f-1669-4904-a271-c7645985fbe6	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	90	1
fb9b2e8f-1669-4904-a271-c7645985fbe6	6a657f15-2638-4401-a4cb-1cb3d78446be	85	2
fb9b2e8f-1669-4904-a271-c7645985fbe6	3141f563-5039-48a5-a7f1-eac9c29e38ba	80	3
fb9b2e8f-1669-4904-a271-c7645985fbe6	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	75	4
fb9b2e8f-1669-4904-a271-c7645985fbe6	71232d6e-c5b8-4c28-89df-276a5f6aeb7d	70	5
52ad51f7-28b8-424b-8b33-2ec3540ccf94	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	95	1
52ad51f7-28b8-424b-8b33-2ec3540ccf94	e41bfae9-b3a5-4661-a420-290d6c27da35	85	2
52ad51f7-28b8-424b-8b33-2ec3540ccf94	e3fea1ab-20c7-45c0-8be6-0538353d16b3	80	3
52ad51f7-28b8-424b-8b33-2ec3540ccf94	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	75	4
52ad51f7-28b8-424b-8b33-2ec3540ccf94	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
a74a511c-771a-4ced-ba3b-7b100ac108d2	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	95	1
a74a511c-771a-4ced-ba3b-7b100ac108d2	e41bfae9-b3a5-4661-a420-290d6c27da35	85	2
a74a511c-771a-4ced-ba3b-7b100ac108d2	d4cf402c-1804-4bfc-af25-6b60196102a1	80	3
a74a511c-771a-4ced-ba3b-7b100ac108d2	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	75	4
a74a511c-771a-4ced-ba3b-7b100ac108d2	e3fea1ab-20c7-45c0-8be6-0538353d16b3	70	5
ba802919-7fce-4546-a59b-14bd0460b0d0	e3fea1ab-20c7-45c0-8be6-0538353d16b3	95	1
ba802919-7fce-4546-a59b-14bd0460b0d0	65f3f958-a668-479f-83aa-f2b0b9bb8236	85	2
ba802919-7fce-4546-a59b-14bd0460b0d0	d4cf402c-1804-4bfc-af25-6b60196102a1	80	3
ba802919-7fce-4546-a59b-14bd0460b0d0	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	75	4
ba802919-7fce-4546-a59b-14bd0460b0d0	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
2f20daca-1e33-43e9-bfce-5f462f9aad1f	6a657f15-2638-4401-a4cb-1cb3d78446be	95	1
2f20daca-1e33-43e9-bfce-5f462f9aad1f	e3fea1ab-20c7-45c0-8be6-0538353d16b3	85	2
2f20daca-1e33-43e9-bfce-5f462f9aad1f	89219724-7107-4ccf-9ccf-bb20d439a10f	80	3
2f20daca-1e33-43e9-bfce-5f462f9aad1f	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	75	4
2f20daca-1e33-43e9-bfce-5f462f9aad1f	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
ce4d51f0-433e-460a-a208-621c3e8f4b19	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	95	1
ce4d51f0-433e-460a-a208-621c3e8f4b19	6a657f15-2638-4401-a4cb-1cb3d78446be	85	2
ce4d51f0-433e-460a-a208-621c3e8f4b19	89219724-7107-4ccf-9ccf-bb20d439a10f	80	3
ce4d51f0-433e-460a-a208-621c3e8f4b19	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	75	4
ce4d51f0-433e-460a-a208-621c3e8f4b19	d4cf402c-1804-4bfc-af25-6b60196102a1	70	5
d3b56ea8-5e1a-4d0f-9eeb-66a8f17d70f0	6a657f15-2638-4401-a4cb-1cb3d78446be	90	1
d3b56ea8-5e1a-4d0f-9eeb-66a8f17d70f0	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	85	2
d3b56ea8-5e1a-4d0f-9eeb-66a8f17d70f0	10a93b7f-37f4-470c-a39e-e442b5437113	80	3
d3b56ea8-5e1a-4d0f-9eeb-66a8f17d70f0	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	75	4
d3b56ea8-5e1a-4d0f-9eeb-66a8f17d70f0	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
ab0fdb66-51a5-4cfd-b076-79828c0b717e	6a657f15-2638-4401-a4cb-1cb3d78446be	95	1
ab0fdb66-51a5-4cfd-b076-79828c0b717e	e3fea1ab-20c7-45c0-8be6-0538353d16b3	85	2
ab0fdb66-51a5-4cfd-b076-79828c0b717e	89219724-7107-4ccf-9ccf-bb20d439a10f	80	3
ab0fdb66-51a5-4cfd-b076-79828c0b717e	d4cf402c-1804-4bfc-af25-6b60196102a1	75	4
ab0fdb66-51a5-4cfd-b076-79828c0b717e	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	70	5
7dc66a03-4d0f-4276-869e-09b2c818f7e1	6a657f15-2638-4401-a4cb-1cb3d78446be	95	1
7dc66a03-4d0f-4276-869e-09b2c818f7e1	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	85	2
7dc66a03-4d0f-4276-869e-09b2c818f7e1	e3fea1ab-20c7-45c0-8be6-0538353d16b3	80	3
7dc66a03-4d0f-4276-869e-09b2c818f7e1	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	75	4
7dc66a03-4d0f-4276-869e-09b2c818f7e1	89219724-7107-4ccf-9ccf-bb20d439a10f	70	5
153c7004-3501-4bee-866f-3af4678025f6	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	95	1
153c7004-3501-4bee-866f-3af4678025f6	3141f563-5039-48a5-a7f1-eac9c29e38ba	85	2
153c7004-3501-4bee-866f-3af4678025f6	e41bfae9-b3a5-4661-a420-290d6c27da35	80	3
153c7004-3501-4bee-866f-3af4678025f6	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	75	4
153c7004-3501-4bee-866f-3af4678025f6	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
d9093e0e-6e25-4196-b413-4a49b34b4bfe	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	95	1
d9093e0e-6e25-4196-b413-4a49b34b4bfe	6a657f15-2638-4401-a4cb-1cb3d78446be	85	2
d9093e0e-6e25-4196-b413-4a49b34b4bfe	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	80	3
d9093e0e-6e25-4196-b413-4a49b34b4bfe	1626400a-0417-4ff8-bfed-d89ef198074f	75	4
d9093e0e-6e25-4196-b413-4a49b34b4bfe	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
196d0da9-174f-47bb-95cd-10ac089fa6ef	89219724-7107-4ccf-9ccf-bb20d439a10f	95	1
196d0da9-174f-47bb-95cd-10ac089fa6ef	d4cf402c-1804-4bfc-af25-6b60196102a1	85	2
196d0da9-174f-47bb-95cd-10ac089fa6ef	e3fea1ab-20c7-45c0-8be6-0538353d16b3	80	3
196d0da9-174f-47bb-95cd-10ac089fa6ef	495b763f-161e-4f28-818a-ae7ddb91c774	75	4
196d0da9-174f-47bb-95cd-10ac089fa6ef	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	70	5
41a9d464-7d13-4cdd-9f6b-de11a694a2cf	d4cf402c-1804-4bfc-af25-6b60196102a1	95	1
41a9d464-7d13-4cdd-9f6b-de11a694a2cf	6a657f15-2638-4401-a4cb-1cb3d78446be	85	2
41a9d464-7d13-4cdd-9f6b-de11a694a2cf	e3fea1ab-20c7-45c0-8be6-0538353d16b3	80	3
41a9d464-7d13-4cdd-9f6b-de11a694a2cf	3141f563-5039-48a5-a7f1-eac9c29e38ba	75	4
41a9d464-7d13-4cdd-9f6b-de11a694a2cf	e41bfae9-b3a5-4661-a420-290d6c27da35	70	5
aa34a7e3-727d-4e19-9d1c-7d94b2cf6f13	71232d6e-c5b8-4c28-89df-276a5f6aeb7d	90	1
aa34a7e3-727d-4e19-9d1c-7d94b2cf6f13	3141f563-5039-48a5-a7f1-eac9c29e38ba	85	2
aa34a7e3-727d-4e19-9d1c-7d94b2cf6f13	e3fea1ab-20c7-45c0-8be6-0538353d16b3	80	3
aa34a7e3-727d-4e19-9d1c-7d94b2cf6f13	d4cf402c-1804-4bfc-af25-6b60196102a1	75	4
aa34a7e3-727d-4e19-9d1c-7d94b2cf6f13	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
43d65d7e-b90d-42ca-ae91-8b22a67ab0da	6a657f15-2638-4401-a4cb-1cb3d78446be	95	1
43d65d7e-b90d-42ca-ae91-8b22a67ab0da	e3fea1ab-20c7-45c0-8be6-0538353d16b3	85	2
43d65d7e-b90d-42ca-ae91-8b22a67ab0da	89219724-7107-4ccf-9ccf-bb20d439a10f	80	3
43d65d7e-b90d-42ca-ae91-8b22a67ab0da	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	75	4
43d65d7e-b90d-42ca-ae91-8b22a67ab0da	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
40726f06-c62b-46f8-b1d8-d92b02a31d77	89219724-7107-4ccf-9ccf-bb20d439a10f	95	1
40726f06-c62b-46f8-b1d8-d92b02a31d77	d4cf402c-1804-4bfc-af25-6b60196102a1	85	2
40726f06-c62b-46f8-b1d8-d92b02a31d77	10a93b7f-37f4-470c-a39e-e442b5437113	80	3
40726f06-c62b-46f8-b1d8-d92b02a31d77	e3fea1ab-20c7-45c0-8be6-0538353d16b3	75	4
40726f06-c62b-46f8-b1d8-d92b02a31d77	71232d6e-c5b8-4c28-89df-276a5f6aeb7d	70	5
35e7f742-681f-4b0f-b429-cd4dfa3231d3	6a657f15-2638-4401-a4cb-1cb3d78446be	95	1
35e7f742-681f-4b0f-b429-cd4dfa3231d3	05650238-fd2f-492d-a3cf-48e1fed78e5b	85	2
35e7f742-681f-4b0f-b429-cd4dfa3231d3	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	80	3
35e7f742-681f-4b0f-b429-cd4dfa3231d3	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	75	4
35e7f742-681f-4b0f-b429-cd4dfa3231d3	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
93e4e0f3-0b00-4dfc-a8b1-8c016ab4cbe7	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	95	1
93e4e0f3-0b00-4dfc-a8b1-8c016ab4cbe7	6a657f15-2638-4401-a4cb-1cb3d78446be	85	2
93e4e0f3-0b00-4dfc-a8b1-8c016ab4cbe7	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	80	3
93e4e0f3-0b00-4dfc-a8b1-8c016ab4cbe7	e3fea1ab-20c7-45c0-8be6-0538353d16b3	75	4
93e4e0f3-0b00-4dfc-a8b1-8c016ab4cbe7	1626400a-0417-4ff8-bfed-d89ef198074f	70	5
af4e4b85-9bcd-4a9b-a172-1d9c7e7b9954	e41bfae9-b3a5-4661-a420-290d6c27da35	95	1
af4e4b85-9bcd-4a9b-a172-1d9c7e7b9954	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	85	2
af4e4b85-9bcd-4a9b-a172-1d9c7e7b9954	32b8ae1f-2a7e-4065-bea2-6392a15348c5	80	3
af4e4b85-9bcd-4a9b-a172-1d9c7e7b9954	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	75	4
af4e4b85-9bcd-4a9b-a172-1d9c7e7b9954	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	70	5
60cb819e-a78e-4fac-897b-30166e63fc97	16f221cc-38cc-4dc0-8a26-1cff4bc731db	95	1
60cb819e-a78e-4fac-897b-30166e63fc97	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	85	2
60cb819e-a78e-4fac-897b-30166e63fc97	65f3f958-a668-479f-83aa-f2b0b9bb8236	80	3
60cb819e-a78e-4fac-897b-30166e63fc97	89219724-7107-4ccf-9ccf-bb20d439a10f	75	4
60cb819e-a78e-4fac-897b-30166e63fc97	e3fea1ab-20c7-45c0-8be6-0538353d16b3	70	5
0df63608-7a9b-4dc7-9166-4ae3f1614388	e3fea1ab-20c7-45c0-8be6-0538353d16b3	95	1
0df63608-7a9b-4dc7-9166-4ae3f1614388	d4cf402c-1804-4bfc-af25-6b60196102a1	85	2
0df63608-7a9b-4dc7-9166-4ae3f1614388	65f3f958-a668-479f-83aa-f2b0b9bb8236	80	3
0df63608-7a9b-4dc7-9166-4ae3f1614388	89219724-7107-4ccf-9ccf-bb20d439a10f	75	4
0df63608-7a9b-4dc7-9166-4ae3f1614388	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
bfed6bb8-b8ac-4eb6-91c6-3573e728987f	e41bfae9-b3a5-4661-a420-290d6c27da35	90	1
bfed6bb8-b8ac-4eb6-91c6-3573e728987f	e3fea1ab-20c7-45c0-8be6-0538353d16b3	85	2
bfed6bb8-b8ac-4eb6-91c6-3573e728987f	71232d6e-c5b8-4c28-89df-276a5f6aeb7d	80	3
bfed6bb8-b8ac-4eb6-91c6-3573e728987f	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	75	4
bfed6bb8-b8ac-4eb6-91c6-3573e728987f	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	70	5
9130e65e-2416-4133-ba17-ac151fc19dcc	e41bfae9-b3a5-4661-a420-290d6c27da35	90	1
9130e65e-2416-4133-ba17-ac151fc19dcc	16f221cc-38cc-4dc0-8a26-1cff4bc731db	85	2
9130e65e-2416-4133-ba17-ac151fc19dcc	e3fea1ab-20c7-45c0-8be6-0538353d16b3	80	3
9130e65e-2416-4133-ba17-ac151fc19dcc	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	75	4
9130e65e-2416-4133-ba17-ac151fc19dcc	d4cf402c-1804-4bfc-af25-6b60196102a1	70	5
4cda3b3d-edf6-4743-9fe2-c97114628d65	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	95	1
4cda3b3d-edf6-4743-9fe2-c97114628d65	fb7494b3-479c-4f1a-a828-b3c2daed6ffb	85	2
4cda3b3d-edf6-4743-9fe2-c97114628d65	e3fea1ab-20c7-45c0-8be6-0538353d16b3	80	3
4cda3b3d-edf6-4743-9fe2-c97114628d65	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	75	4
4cda3b3d-edf6-4743-9fe2-c97114628d65	3141f563-5039-48a5-a7f1-eac9c29e38ba	70	5
e3d2d948-92b2-426d-b792-2769a000bd19	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	95	1
e3d2d948-92b2-426d-b792-2769a000bd19	6a657f15-2638-4401-a4cb-1cb3d78446be	85	2
e3d2d948-92b2-426d-b792-2769a000bd19	e3fea1ab-20c7-45c0-8be6-0538353d16b3	80	3
e3d2d948-92b2-426d-b792-2769a000bd19	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	75	4
e3d2d948-92b2-426d-b792-2769a000bd19	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	70	5
1ace4014-b9df-4dbc-83f0-cb336ab3154f	e3fea1ab-20c7-45c0-8be6-0538353d16b3	95	1
1ace4014-b9df-4dbc-83f0-cb336ab3154f	6a657f15-2638-4401-a4cb-1cb3d78446be	85	2
1ace4014-b9df-4dbc-83f0-cb336ab3154f	89219724-7107-4ccf-9ccf-bb20d439a10f	80	3
1ace4014-b9df-4dbc-83f0-cb336ab3154f	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	75	4
1ace4014-b9df-4dbc-83f0-cb336ab3154f	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
3a21e5ec-28c0-4f84-9e28-716ffaaf708b	e3fea1ab-20c7-45c0-8be6-0538353d16b3	95	1
3a21e5ec-28c0-4f84-9e28-716ffaaf708b	e41bfae9-b3a5-4661-a420-290d6c27da35	85	2
3a21e5ec-28c0-4f84-9e28-716ffaaf708b	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	80	3
3a21e5ec-28c0-4f84-9e28-716ffaaf708b	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	75	4
3a21e5ec-28c0-4f84-9e28-716ffaaf708b	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	70	5
f00a2fe6-3317-4679-b60f-98da548f091a	e3fea1ab-20c7-45c0-8be6-0538353d16b3	95	1
f00a2fe6-3317-4679-b60f-98da548f091a	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	85	2
f00a2fe6-3317-4679-b60f-98da548f091a	89219724-7107-4ccf-9ccf-bb20d439a10f	80	3
f00a2fe6-3317-4679-b60f-98da548f091a	495b763f-161e-4f28-818a-ae7ddb91c774	75	4
f00a2fe6-3317-4679-b60f-98da548f091a	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
31659561-fd1b-4790-9188-cec150ddf740	e3fea1ab-20c7-45c0-8be6-0538353d16b3	90	1
31659561-fd1b-4790-9188-cec150ddf740	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	85	2
31659561-fd1b-4790-9188-cec150ddf740	6a657f15-2638-4401-a4cb-1cb3d78446be	80	3
31659561-fd1b-4790-9188-cec150ddf740	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	75	4
31659561-fd1b-4790-9188-cec150ddf740	71232d6e-c5b8-4c28-89df-276a5f6aeb7d	70	5
0ddb987e-77d8-400b-baa1-a69b620cc9bc	e3fea1ab-20c7-45c0-8be6-0538353d16b3	90	1
0ddb987e-77d8-400b-baa1-a69b620cc9bc	6a657f15-2638-4401-a4cb-1cb3d78446be	85	2
0ddb987e-77d8-400b-baa1-a69b620cc9bc	3141f563-5039-48a5-a7f1-eac9c29e38ba	80	3
0ddb987e-77d8-400b-baa1-a69b620cc9bc	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	75	4
0ddb987e-77d8-400b-baa1-a69b620cc9bc	71232d6e-c5b8-4c28-89df-276a5f6aeb7d	70	5
0f66d56c-fbca-4d6d-b35e-09420861c1fd	e3fea1ab-20c7-45c0-8be6-0538353d16b3	90	1
0f66d56c-fbca-4d6d-b35e-09420861c1fd	d4cf402c-1804-4bfc-af25-6b60196102a1	85	2
0f66d56c-fbca-4d6d-b35e-09420861c1fd	6a657f15-2638-4401-a4cb-1cb3d78446be	80	3
0f66d56c-fbca-4d6d-b35e-09420861c1fd	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	75	4
0f66d56c-fbca-4d6d-b35e-09420861c1fd	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
945bbd94-7fe1-4bfb-87c7-11c873ee3af7	6a657f15-2638-4401-a4cb-1cb3d78446be	95	1
945bbd94-7fe1-4bfb-87c7-11c873ee3af7	71232d6e-c5b8-4c28-89df-276a5f6aeb7d	85	2
945bbd94-7fe1-4bfb-87c7-11c873ee3af7	e3fea1ab-20c7-45c0-8be6-0538353d16b3	80	3
945bbd94-7fe1-4bfb-87c7-11c873ee3af7	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	75	4
945bbd94-7fe1-4bfb-87c7-11c873ee3af7	3141f563-5039-48a5-a7f1-eac9c29e38ba	70	5
65fb337a-a8fe-436b-b5d5-8cc4cf67e822	e3fea1ab-20c7-45c0-8be6-0538353d16b3	95	1
65fb337a-a8fe-436b-b5d5-8cc4cf67e822	d4cf402c-1804-4bfc-af25-6b60196102a1	85	2
65fb337a-a8fe-436b-b5d5-8cc4cf67e822	10a93b7f-37f4-470c-a39e-e442b5437113	80	3
65fb337a-a8fe-436b-b5d5-8cc4cf67e822	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	75	4
65fb337a-a8fe-436b-b5d5-8cc4cf67e822	ec62c48b-a0fe-44b8-b10f-31472c3ce534	70	5
e9a4ffde-feb3-41c5-ae79-54cf6b1ca96b	e55153a9-7d48-4956-9a15-f11205b95aa5	95	1
e9a4ffde-feb3-41c5-ae79-54cf6b1ca96b	1626400a-0417-4ff8-bfed-d89ef198074f	85	2
e9a4ffde-feb3-41c5-ae79-54cf6b1ca96b	7879e3d8-bf89-4140-b863-4761ec613c4c	80	3
e9a4ffde-feb3-41c5-ae79-54cf6b1ca96b	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	75	4
e9a4ffde-feb3-41c5-ae79-54cf6b1ca96b	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
5e8065e9-d4a8-4b18-9a8f-864de258ed66	e3fea1ab-20c7-45c0-8be6-0538353d16b3	95	1
5e8065e9-d4a8-4b18-9a8f-864de258ed66	d4cf402c-1804-4bfc-af25-6b60196102a1	85	2
5e8065e9-d4a8-4b18-9a8f-864de258ed66	89219724-7107-4ccf-9ccf-bb20d439a10f	80	3
5e8065e9-d4a8-4b18-9a8f-864de258ed66	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	75	4
5e8065e9-d4a8-4b18-9a8f-864de258ed66	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
ab073824-be87-4b52-8c45-22212449408b	6a657f15-2638-4401-a4cb-1cb3d78446be	90	1
ab073824-be87-4b52-8c45-22212449408b	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	85	2
ab073824-be87-4b52-8c45-22212449408b	e3fea1ab-20c7-45c0-8be6-0538353d16b3	80	3
ab073824-be87-4b52-8c45-22212449408b	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	75	4
ab073824-be87-4b52-8c45-22212449408b	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	70	5
986881ad-1775-40e0-83d4-c281ff40abad	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	95	1
986881ad-1775-40e0-83d4-c281ff40abad	b72bef64-da93-42a8-8393-c920aafd58fa	85	2
986881ad-1775-40e0-83d4-c281ff40abad	16f221cc-38cc-4dc0-8a26-1cff4bc731db	80	3
986881ad-1775-40e0-83d4-c281ff40abad	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	75	4
986881ad-1775-40e0-83d4-c281ff40abad	6a657f15-2638-4401-a4cb-1cb3d78446be	70	5
031207ac-912b-4c24-a80b-d121f5c9cdc3	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	95	1
031207ac-912b-4c24-a80b-d121f5c9cdc3	e41bfae9-b3a5-4661-a420-290d6c27da35	85	2
031207ac-912b-4c24-a80b-d121f5c9cdc3	6a657f15-2638-4401-a4cb-1cb3d78446be	80	3
031207ac-912b-4c24-a80b-d121f5c9cdc3	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	75	4
031207ac-912b-4c24-a80b-d121f5c9cdc3	e3fea1ab-20c7-45c0-8be6-0538353d16b3	70	5
daafce23-50c9-423e-8d3f-8602da604567	6a657f15-2638-4401-a4cb-1cb3d78446be	90	1
daafce23-50c9-423e-8d3f-8602da604567	e41bfae9-b3a5-4661-a420-290d6c27da35	85	2
daafce23-50c9-423e-8d3f-8602da604567	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	80	3
daafce23-50c9-423e-8d3f-8602da604567	e3fea1ab-20c7-45c0-8be6-0538353d16b3	75	4
daafce23-50c9-423e-8d3f-8602da604567	ec62c48b-a0fe-44b8-b10f-31472c3ce534	70	5
6f994bb6-d2bf-48f8-a0b0-e2a5a246bfd1	6a657f15-2638-4401-a4cb-1cb3d78446be	95	1
6f994bb6-d2bf-48f8-a0b0-e2a5a246bfd1	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	90	2
6f994bb6-d2bf-48f8-a0b0-e2a5a246bfd1	e41bfae9-b3a5-4661-a420-290d6c27da35	80	3
6f994bb6-d2bf-48f8-a0b0-e2a5a246bfd1	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	75	4
6f994bb6-d2bf-48f8-a0b0-e2a5a246bfd1	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
9fcfb7f1-4b02-4d85-9d6e-9f6d30050467	6a657f15-2638-4401-a4cb-1cb3d78446be	95	1
9fcfb7f1-4b02-4d85-9d6e-9f6d30050467	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	85	2
9fcfb7f1-4b02-4d85-9d6e-9f6d30050467	65f3f958-a668-479f-83aa-f2b0b9bb8236	80	3
9fcfb7f1-4b02-4d85-9d6e-9f6d30050467	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	75	4
9fcfb7f1-4b02-4d85-9d6e-9f6d30050467	10a93b7f-37f4-470c-a39e-e442b5437113	70	5
4c67a538-fc47-460f-bc48-c95e279c5e9d	e3fea1ab-20c7-45c0-8be6-0538353d16b3	90	1
4c67a538-fc47-460f-bc48-c95e279c5e9d	6a657f15-2638-4401-a4cb-1cb3d78446be	85	2
4c67a538-fc47-460f-bc48-c95e279c5e9d	89219724-7107-4ccf-9ccf-bb20d439a10f	80	3
4c67a538-fc47-460f-bc48-c95e279c5e9d	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	75	4
4c67a538-fc47-460f-bc48-c95e279c5e9d	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
0fbc106f-ec7f-4a5b-a6b5-3921a845a82b	d4cf402c-1804-4bfc-af25-6b60196102a1	70	5
6b95192d-3e8d-4c94-8b61-f61c421275be	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	95	1
6b95192d-3e8d-4c94-8b61-f61c421275be	6a657f15-2638-4401-a4cb-1cb3d78446be	85	2
6b95192d-3e8d-4c94-8b61-f61c421275be	71232d6e-c5b8-4c28-89df-276a5f6aeb7d	80	3
6b95192d-3e8d-4c94-8b61-f61c421275be	e3fea1ab-20c7-45c0-8be6-0538353d16b3	75	4
6b95192d-3e8d-4c94-8b61-f61c421275be	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	70	5
b02ca448-2a46-4038-9a94-6834dc62e633	e3fea1ab-20c7-45c0-8be6-0538353d16b3	90	1
b02ca448-2a46-4038-9a94-6834dc62e633	3141f563-5039-48a5-a7f1-eac9c29e38ba	85	2
b02ca448-2a46-4038-9a94-6834dc62e633	6a657f15-2638-4401-a4cb-1cb3d78446be	80	3
b02ca448-2a46-4038-9a94-6834dc62e633	89219724-7107-4ccf-9ccf-bb20d439a10f	75	4
b02ca448-2a46-4038-9a94-6834dc62e633	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
ebbb8897-6a67-4516-80b4-bc0d509ef9df	6a657f15-2638-4401-a4cb-1cb3d78446be	90	1
ebbb8897-6a67-4516-80b4-bc0d509ef9df	e3fea1ab-20c7-45c0-8be6-0538353d16b3	85	2
ebbb8897-6a67-4516-80b4-bc0d509ef9df	f0cf3fdd-ff21-48d5-92b6-f278db34a47b	80	3
ebbb8897-6a67-4516-80b4-bc0d509ef9df	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	75	4
ebbb8897-6a67-4516-80b4-bc0d509ef9df	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
ca90d0f7-11fb-4777-a4e8-2ab9455518b2	e3fea1ab-20c7-45c0-8be6-0538353d16b3	95	1
ca90d0f7-11fb-4777-a4e8-2ab9455518b2	d4cf402c-1804-4bfc-af25-6b60196102a1	85	2
ca90d0f7-11fb-4777-a4e8-2ab9455518b2	e41bfae9-b3a5-4661-a420-290d6c27da35	80	3
ca90d0f7-11fb-4777-a4e8-2ab9455518b2	65f3f958-a668-479f-83aa-f2b0b9bb8236	75	4
ca90d0f7-11fb-4777-a4e8-2ab9455518b2	07724f54-22ff-4ddb-8eff-6bdef36ab0bc	70	5
d7651e66-34ac-45dc-99e7-4b7804a68c1a	6a657f15-2638-4401-a4cb-1cb3d78446be	95	1
d7651e66-34ac-45dc-99e7-4b7804a68c1a	4dc1bfcb-877c-4be4-ab69-b5e9659b5630	85	2
d7651e66-34ac-45dc-99e7-4b7804a68c1a	71232d6e-c5b8-4c28-89df-276a5f6aeb7d	80	3
d7651e66-34ac-45dc-99e7-4b7804a68c1a	e3fea1ab-20c7-45c0-8be6-0538353d16b3	75	4
d7651e66-34ac-45dc-99e7-4b7804a68c1a	65f3f958-a668-479f-83aa-f2b0b9bb8236	70	5
\.


--
-- Data for Name: ProductImage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductImage" (id, "productId", url, alt, "isMain", "order", "createdAt") FROM stdin;
ebe4d035-138e-42ef-b4f4-5b5e900db04d	53017bb5-499a-4e04-8e64-d38ecad10cd6	/uploads/products/53017bb5-499a-4e04-8e64-d38ecad10cd6.webp	\N	t	0	2026-07-19 14:01:49.851
33c01028-d880-4ae0-a989-580f124c1658	df7b65c9-eb8d-46ee-a00a-fe2312ab53fb	/uploads/products/df7b65c9-eb8d-46ee-a00a-fe2312ab53fb.webp	\N	t	0	2026-07-19 14:01:55.889
52932750-3b59-4bbc-b63a-e100794d73f1	81a26ad3-7d36-484e-90c2-c9674528bd93	/uploads/products/81a26ad3-7d36-484e-90c2-c9674528bd93.webp	\N	t	0	2026-07-19 14:02:13.046
2a4281e9-7728-45df-9be5-283f70b14a92	9457ded1-6ca4-4506-947a-835e8cdc38ea	/uploads/products/9457ded1-6ca4-4506-947a-835e8cdc38ea.webp	\N	t	0	2026-07-19 14:02:17.127
137f0804-e1c2-4c57-a197-a70707cd3607	749a3306-63b0-421e-8157-12afca50f3ef	/uploads/products/749a3306-63b0-421e-8157-12afca50f3ef.webp	\N	t	0	2026-07-19 14:02:21.617
e2aa8cc5-bb84-48c7-aa0e-5664b1cfeb8e	d732c139-274b-48d9-8f4b-bf6d776a789c	/uploads/products/d732c139-274b-48d9-8f4b-bf6d776a789c.webp	\N	t	0	2026-07-19 14:02:25.464
157d79d1-0e76-4cc7-8633-37de6fff730c	e5462083-202c-4a22-b9db-c036eb0cf1c9	/uploads/products/e5462083-202c-4a22-b9db-c036eb0cf1c9.webp	\N	t	0	2026-07-19 14:02:35.542
91e3033c-0817-48b1-afbd-48436d0a5867	9c969ede-7504-409f-a07a-61f8c2bf1ace	/uploads/products/9c969ede-7504-409f-a07a-61f8c2bf1ace.webp	\N	t	0	2026-07-19 14:02:40.058
80dc5e41-428a-4881-806e-c983356d51d1	86df4db3-9546-458e-812d-987ad735f122	/uploads/products/86df4db3-9546-458e-812d-987ad735f122.webp	\N	t	0	2026-07-19 14:02:44.703
dbb8a2be-abe3-43ec-ab25-a6df4170d793	ba3c5310-aef4-4e3e-a66d-4beca03968d7	/uploads/products/ba3c5310-aef4-4e3e-a66d-4beca03968d7.webp	\N	t	0	2026-07-19 14:02:48.961
7f837c0a-0591-4602-b4ce-3ae7c2851657	eb8df122-2c9a-4f22-b82a-0db35ef110be	/uploads/products/eb8df122-2c9a-4f22-b82a-0db35ef110be.webp	\N	t	0	2026-07-19 14:02:54.04
b32930e4-1bb3-4149-933d-a4485f6bb9cd	3a2405e4-1dd2-409e-a24f-49ba13b0b0e6	/uploads/products/3a2405e4-1dd2-409e-a24f-49ba13b0b0e6.webp	\N	t	0	2026-07-19 14:02:58.066
451720e4-1532-4f1c-823d-70f83ba640cd	d578595b-6705-491f-ba0d-31b5f82f2872	/uploads/products/d578595b-6705-491f-ba0d-31b5f82f2872.webp	\N	t	0	2026-07-19 14:03:01.652
ec4b310d-aa88-4448-a5f4-3bd4f4f7ae4a	e3b4b7f4-c601-4482-8935-319780b2b08a	/uploads/products/e3b4b7f4-c601-4482-8935-319780b2b08a.webp	\N	t	0	2026-07-19 14:03:05.278
cf1706d6-4be7-4209-9d8b-a9d003d574a5	23d36c92-f6d1-424b-a130-eff65b3470a5	/uploads/products/23d36c92-f6d1-424b-a130-eff65b3470a5.webp	\N	t	0	2026-07-19 14:03:09.323
2b5f30ee-8243-4951-9f6c-1a03dbd8b89b	a8a9664b-20ea-4c42-a1ab-4a428fc294b4	/uploads/products/a8a9664b-20ea-4c42-a1ab-4a428fc294b4.webp	\N	t	0	2026-07-19 14:03:13.039
6b3c8735-5287-4c53-b869-c7e27e39b178	067b8a8b-6ed6-4401-b45c-351cad2d7ddb	/uploads/products/067b8a8b-6ed6-4401-b45c-351cad2d7ddb.webp	\N	t	0	2026-07-19 14:03:16.431
82d51ec6-86bf-4f12-a76f-d9c02c36a345	044315ac-09de-4042-bab6-b234ed0f310c	/uploads/products/044315ac-09de-4042-bab6-b234ed0f310c.webp	\N	t	0	2026-07-19 14:03:20.115
7db43888-b770-48c9-8472-aee68fa3129f	280fb2cf-d23f-49bb-a9ec-606c342c0599	/uploads/products/280fb2cf-d23f-49bb-a9ec-606c342c0599.webp	\N	t	0	2026-07-19 14:03:23.79
7b02eb0f-7e21-460a-a0b7-a818d722b074	c4172c9e-75b5-4946-8832-deea55117532	/uploads/products/c4172c9e-75b5-4946-8832-deea55117532.webp	\N	t	0	2026-07-19 14:03:27.465
8794ff33-0a35-491d-b506-951659388e3e	a3995d5e-7d74-4485-878e-7cc51d1090bf	/uploads/products/a3995d5e-7d74-4485-878e-7cc51d1090bf.webp	\N	t	0	2026-07-19 14:03:30.954
cbc8f63b-e26e-4b3f-8db0-506e518aaf8d	055fa60c-9764-45b3-8d78-2737f584df4d	/uploads/products/055fa60c-9764-45b3-8d78-2737f584df4d.webp	\N	t	0	2026-07-19 14:03:34.752
81bc6e4d-7eb9-42b3-806f-f6ec000cdf7e	4621d0cd-1f1f-4401-8682-ce3d8eca0422	/uploads/products/4621d0cd-1f1f-4401-8682-ce3d8eca0422.webp	\N	t	0	2026-07-19 14:03:38.584
7f0a3f9d-4522-475e-93d3-d842f4a834cb	36b5c8eb-cbbd-498b-8565-a70a5f0a525f	/uploads/products/36b5c8eb-cbbd-498b-8565-a70a5f0a525f.webp	\N	t	0	2026-07-19 14:03:42.829
62398566-f262-4aa0-aae5-9024ef1ada8f	67e8a831-9640-4800-9594-271fd03cf74c	/uploads/products/67e8a831-9640-4800-9594-271fd03cf74c.webp	\N	t	0	2026-07-19 14:03:46.921
5ff4cb14-6f95-4311-bb8e-b4a2dab818f5	6796549a-4d47-4746-a463-09c282b32182	/uploads/products/6796549a-4d47-4746-a463-09c282b32182.webp	\N	t	0	2026-07-19 14:03:50.816
8cabb521-a532-4df6-8ca5-064a9668bdf4	dcf5fdcd-9837-48e8-8335-7a245acd9c37	/uploads/products/dcf5fdcd-9837-48e8-8335-7a245acd9c37.webp	\N	t	0	2026-07-19 14:03:54.602
4fac8d55-b7f0-4335-b53c-457c353ab7c1	312a8838-da3b-45cc-afe4-bdb61d487252	/uploads/products/312a8838-da3b-45cc-afe4-bdb61d487252.webp	\N	t	0	2026-07-19 14:03:58.508
28ed9f15-e0e6-4954-a799-5be0431251b1	1fe93fdd-e1f4-4653-be71-8f563d0b566c	/uploads/products/1fe93fdd-e1f4-4653-be71-8f563d0b566c.webp	\N	t	0	2026-07-19 14:04:02.488
43196326-383d-41da-b3c7-1986fe45fc2c	ff492e6a-9f3a-4013-bff9-371914b060e3	/uploads/products/ff492e6a-9f3a-4013-bff9-371914b060e3.webp	\N	t	0	2026-07-19 14:04:06.007
2a136e0f-d8c7-496a-aeb9-9b776b48e3c4	ba8a5af6-892c-4fc3-99db-d04e3e3fc452	/uploads/products/ba8a5af6-892c-4fc3-99db-d04e3e3fc452.webp	\N	t	0	2026-07-19 14:04:09.531
95d3f6d7-b663-4024-bb0b-2bf2d20686c9	397115ec-f4e5-4414-839b-67d8aaf0d3be	/uploads/products/397115ec-f4e5-4414-839b-67d8aaf0d3be.webp	\N	t	0	2026-07-19 14:04:13.475
6cfffc63-b6b1-4e4d-a18b-493f0236383f	3efc65e3-0315-47e4-aaa4-f3979b8d3a7b	/uploads/products/3efc65e3-0315-47e4-aaa4-f3979b8d3a7b.webp	\N	t	0	2026-07-19 14:04:17.411
2f4682f4-ee62-4cea-80fe-d3a2ee1df2b8	81de114f-b777-47a6-bcf5-e330ca90337b	/uploads/products/81de114f-b777-47a6-bcf5-e330ca90337b.webp	\N	t	0	2026-07-19 14:04:21.227
a7a34d58-4670-4028-9a1c-b66246b145c1	035a49c9-3768-457d-aff4-9e2b206026d2	/uploads/products/035a49c9-3768-457d-aff4-9e2b206026d2.webp	\N	t	0	2026-07-19 14:04:25.224
791bfda7-0b87-4bfe-9179-805e2386bc7e	4bb8b556-298d-4ca8-ae89-102b6665d712	/uploads/products/4bb8b556-298d-4ca8-ae89-102b6665d712.webp	\N	t	0	2026-07-19 14:04:28.931
524accab-a4a9-4242-ba78-cfa4eb0b2194	88b9c3ea-f9aa-44a8-aa88-1d2dfa87051c	/uploads/products/88b9c3ea-f9aa-44a8-aa88-1d2dfa87051c.webp	\N	t	0	2026-07-19 14:04:33.007
34172299-2f7f-43e8-8481-2dca47540e5d	38976821-8d3a-45f6-9ead-9da7672e60ff	/uploads/products/38976821-8d3a-45f6-9ead-9da7672e60ff.webp	\N	t	0	2026-07-19 14:04:36.901
8d2ae688-d5b5-4594-9054-5f32f1a8d465	e850daba-9bef-4315-a514-27cb52d08d12	/uploads/products/e850daba-9bef-4315-a514-27cb52d08d12.webp	\N	t	0	2026-07-19 14:04:40.704
78596074-a82f-48bc-ba2d-5d44ff14814a	723e5cc1-fc70-499a-9dd3-6a3b6656e95c	/uploads/products/723e5cc1-fc70-499a-9dd3-6a3b6656e95c.webp	\N	t	0	2026-07-19 14:04:44.063
761b4e78-fb91-42c3-b20b-4e921faeedd0	44ea09e5-6635-4b8c-bb71-e8c3170a869b	/uploads/products/44ea09e5-6635-4b8c-bb71-e8c3170a869b.webp	\N	t	0	2026-07-19 14:04:47.958
99a31d2a-29b2-4840-9cad-0200e47cd807	c7b5b7e5-cdd5-45e5-bb69-63cfefed4251	/uploads/products/c7b5b7e5-cdd5-45e5-bb69-63cfefed4251.webp	\N	t	0	2026-07-19 14:04:51.337
9ef49673-b467-40d3-8336-276fe35a7008	4f50b3a7-eb39-4495-8a2c-9d0ef9131f00	/uploads/products/4f50b3a7-eb39-4495-8a2c-9d0ef9131f00.webp	\N	t	0	2026-07-19 14:04:55.107
dc0e8620-4377-4661-9fd2-ea0517bc115e	1e4ba0bb-3695-44f6-a6e6-05b27af98c82	/uploads/products/1e4ba0bb-3695-44f6-a6e6-05b27af98c82.webp	\N	t	0	2026-07-19 14:04:58.888
ccaa0805-f143-4cf9-ac83-e0993c256cba	6ebeb9b9-bb1e-4aae-a2c0-5b29b3294b12	/uploads/products/6ebeb9b9-bb1e-4aae-a2c0-5b29b3294b12.webp	\N	t	0	2026-07-19 14:05:02.494
aa8a0be3-e32b-4fd3-b8b4-c6fc1cd072e8	fb9b2e8f-1669-4904-a271-c7645985fbe6	/uploads/products/fb9b2e8f-1669-4904-a271-c7645985fbe6.webp	\N	t	0	2026-07-19 14:05:08.753
4868906d-f06b-42c7-a1a7-0a453f585999	52ad51f7-28b8-424b-8b33-2ec3540ccf94	/uploads/products/52ad51f7-28b8-424b-8b33-2ec3540ccf94.webp	\N	t	0	2026-07-19 14:05:12.382
c00ff255-5662-4a84-b4dc-5abaeec4aca1	a74a511c-771a-4ced-ba3b-7b100ac108d2	/uploads/products/a74a511c-771a-4ced-ba3b-7b100ac108d2.webp	\N	t	0	2026-07-19 14:05:19.68
dc583a19-086d-414d-841a-72e1df5afc5b	ba802919-7fce-4546-a59b-14bd0460b0d0	/uploads/products/ba802919-7fce-4546-a59b-14bd0460b0d0.webp	\N	t	0	2026-07-19 14:05:27.214
83bcf4f1-5d2e-4197-ac5a-6ce990a87594	2f20daca-1e33-43e9-bfce-5f462f9aad1f	/uploads/products/2f20daca-1e33-43e9-bfce-5f462f9aad1f.webp	\N	t	0	2026-07-19 14:05:35.705
9589ae8f-4832-43a6-b31e-cd86536182c6	ce4d51f0-433e-460a-a208-621c3e8f4b19	/uploads/products/ce4d51f0-433e-460a-a208-621c3e8f4b19.webp	\N	t	0	2026-07-19 14:05:44.708
eb8bdfae-82eb-4233-932f-658f632674ae	d3b56ea8-5e1a-4d0f-9eeb-66a8f17d70f0	/uploads/products/d3b56ea8-5e1a-4d0f-9eeb-66a8f17d70f0.webp	\N	t	0	2026-07-19 14:05:52.118
054f9786-2a55-41ec-9821-73583ac6d998	ab0fdb66-51a5-4cfd-b076-79828c0b717e	/uploads/products/ab0fdb66-51a5-4cfd-b076-79828c0b717e.webp	\N	t	0	2026-07-19 14:05:58.488
8c7ec971-6ad0-4137-a603-94b2cf6835d1	7dc66a03-4d0f-4276-869e-09b2c818f7e1	/uploads/products/7dc66a03-4d0f-4276-869e-09b2c818f7e1.webp	\N	t	0	2026-07-19 14:06:05.964
8e344739-11cb-488d-b193-35e8235f1e6f	153c7004-3501-4bee-866f-3af4678025f6	/uploads/products/153c7004-3501-4bee-866f-3af4678025f6.webp	\N	t	0	2026-07-19 14:06:14.588
97479a00-537a-4b1e-b344-6d1924b0ec1b	d9093e0e-6e25-4196-b413-4a49b34b4bfe	/uploads/products/d9093e0e-6e25-4196-b413-4a49b34b4bfe.webp	\N	t	0	2026-07-19 14:06:23.578
6f5b710c-c12d-4df8-a49a-8eacbf74389e	196d0da9-174f-47bb-95cd-10ac089fa6ef	/uploads/products/196d0da9-174f-47bb-95cd-10ac089fa6ef.webp	\N	t	0	2026-07-19 14:06:27.309
4d0954be-ea6a-481d-8b49-026855029140	41a9d464-7d13-4cdd-9f6b-de11a694a2cf	/uploads/products/41a9d464-7d13-4cdd-9f6b-de11a694a2cf.webp	\N	t	0	2026-07-19 14:06:31.009
00ada912-95b6-4b12-be1f-231a70d87b8b	aa34a7e3-727d-4e19-9d1c-7d94b2cf6f13	/uploads/products/aa34a7e3-727d-4e19-9d1c-7d94b2cf6f13.webp	\N	t	0	2026-07-19 14:06:34.734
bfe105aa-655a-4fe7-b09c-f342c9352e00	43d65d7e-b90d-42ca-ae91-8b22a67ab0da	/uploads/products/43d65d7e-b90d-42ca-ae91-8b22a67ab0da.webp	\N	t	0	2026-07-19 14:06:38.303
2d89362b-5750-4b90-ab70-080aa4c149e2	40726f06-c62b-46f8-b1d8-d92b02a31d77	/uploads/products/40726f06-c62b-46f8-b1d8-d92b02a31d77.webp	\N	t	0	2026-07-19 14:06:41.988
a82bc4bb-a3de-4e82-a045-b803e97ecd57	35e7f742-681f-4b0f-b429-cd4dfa3231d3	/uploads/products/35e7f742-681f-4b0f-b429-cd4dfa3231d3.webp	\N	t	0	2026-07-19 14:06:45.521
e2471534-431e-4c14-91b0-7938eb380b90	93e4e0f3-0b00-4dfc-a8b1-8c016ab4cbe7	/uploads/products/93e4e0f3-0b00-4dfc-a8b1-8c016ab4cbe7.webp	\N	t	0	2026-07-19 14:06:48.85
e4b46be7-5cc9-47a3-b893-be7a2799d3f0	af4e4b85-9bcd-4a9b-a172-1d9c7e7b9954	/uploads/products/af4e4b85-9bcd-4a9b-a172-1d9c7e7b9954.webp	\N	t	0	2026-07-19 14:06:52.581
68459a98-84de-42ae-9fb6-222c9e74602b	60cb819e-a78e-4fac-897b-30166e63fc97	/uploads/products/60cb819e-a78e-4fac-897b-30166e63fc97.webp	\N	t	0	2026-07-19 14:06:56.534
cabec80f-70f5-40a0-bff8-68cae1178e2c	0df63608-7a9b-4dc7-9166-4ae3f1614388	/uploads/products/0df63608-7a9b-4dc7-9166-4ae3f1614388.webp	\N	t	0	2026-07-19 14:07:00.364
dad157c0-c5d9-4b21-9770-e988ec7f1416	bfed6bb8-b8ac-4eb6-91c6-3573e728987f	/uploads/products/bfed6bb8-b8ac-4eb6-91c6-3573e728987f.webp	\N	t	0	2026-07-19 14:07:04.678
0060571b-2d7c-433c-8d2d-302deed0b6e5	9130e65e-2416-4133-ba17-ac151fc19dcc	/uploads/products/9130e65e-2416-4133-ba17-ac151fc19dcc.webp	\N	t	0	2026-07-19 14:07:08.557
eda3b5cb-76e4-432f-bec6-44e45fac8817	4cda3b3d-edf6-4743-9fe2-c97114628d65	/uploads/products/4cda3b3d-edf6-4743-9fe2-c97114628d65.webp	\N	t	0	2026-07-19 14:07:12.748
199ddd59-b286-4cee-94d8-181336b49a0c	e3d2d948-92b2-426d-b792-2769a000bd19	/uploads/products/e3d2d948-92b2-426d-b792-2769a000bd19.webp	\N	t	0	2026-07-19 14:07:16.344
556ca2dc-04f9-46a0-bcd1-4a0b4c575260	1ace4014-b9df-4dbc-83f0-cb336ab3154f	/uploads/products/1ace4014-b9df-4dbc-83f0-cb336ab3154f.webp	\N	t	0	2026-07-19 14:07:20.033
61b7a680-cf01-404f-a89f-577c1f6ceaf4	3a21e5ec-28c0-4f84-9e28-716ffaaf708b	/uploads/products/3a21e5ec-28c0-4f84-9e28-716ffaaf708b.webp	\N	t	0	2026-07-19 14:07:23.919
7af1a8f5-de69-488b-8343-2d34596dfcce	f00a2fe6-3317-4679-b60f-98da548f091a	/uploads/products/f00a2fe6-3317-4679-b60f-98da548f091a.webp	\N	t	0	2026-07-19 14:07:28.241
526d6404-c25f-4d72-b146-de966d461266	31659561-fd1b-4790-9188-cec150ddf740	/uploads/products/31659561-fd1b-4790-9188-cec150ddf740.webp	\N	t	0	2026-07-19 14:07:32.214
5f8987d4-1b1d-41ce-8dc9-c79176671d07	0ddb987e-77d8-400b-baa1-a69b620cc9bc	/uploads/products/0ddb987e-77d8-400b-baa1-a69b620cc9bc.webp	\N	t	0	2026-07-19 14:07:36.514
de71cbb0-eb15-44be-acfa-91206b1e870d	0f66d56c-fbca-4d6d-b35e-09420861c1fd	/uploads/products/0f66d56c-fbca-4d6d-b35e-09420861c1fd.webp	\N	t	0	2026-07-19 14:07:40.303
aca68eef-863b-4b0b-8073-5c5cc1e89bec	945bbd94-7fe1-4bfb-87c7-11c873ee3af7	/uploads/products/945bbd94-7fe1-4bfb-87c7-11c873ee3af7.webp	\N	t	0	2026-07-19 14:07:44.606
ef22c71b-59e6-41df-a03f-49858253d2d9	65fb337a-a8fe-436b-b5d5-8cc4cf67e822	/uploads/products/65fb337a-a8fe-436b-b5d5-8cc4cf67e822.webp	\N	t	0	2026-07-19 14:07:48.441
f96b510a-ff85-4396-b39d-366a43b967c1	e9a4ffde-feb3-41c5-ae79-54cf6b1ca96b	/uploads/products/e9a4ffde-feb3-41c5-ae79-54cf6b1ca96b.webp	\N	t	0	2026-07-19 14:07:52.796
0544cd4e-5e2c-4983-8dee-40849a029dc3	5e8065e9-d4a8-4b18-9a8f-864de258ed66	/uploads/products/5e8065e9-d4a8-4b18-9a8f-864de258ed66.webp	\N	t	0	2026-07-19 14:07:56.81
262e2047-e2a4-4687-aad3-85fdb41bef7a	ab073824-be87-4b52-8c45-22212449408b	/uploads/products/ab073824-be87-4b52-8c45-22212449408b.webp	\N	t	0	2026-07-19 14:08:00.68
5d41f228-d7aa-46fb-94a1-806fa9bba7b2	986881ad-1775-40e0-83d4-c281ff40abad	/uploads/products/986881ad-1775-40e0-83d4-c281ff40abad.webp	\N	t	0	2026-07-19 14:08:04.371
ea28436d-d3ae-4c83-8ad0-4bde5831c3b9	031207ac-912b-4c24-a80b-d121f5c9cdc3	/uploads/products/031207ac-912b-4c24-a80b-d121f5c9cdc3.webp	\N	t	0	2026-07-19 14:08:07.961
148adc85-49e5-44bc-b749-3808125836d9	daafce23-50c9-423e-8d3f-8602da604567	/uploads/products/daafce23-50c9-423e-8d3f-8602da604567.webp	\N	t	0	2026-07-19 14:08:11.844
22fffa73-8a66-4a00-9aca-7e8ac948f984	6f994bb6-d2bf-48f8-a0b0-e2a5a246bfd1	/uploads/products/6f994bb6-d2bf-48f8-a0b0-e2a5a246bfd1.webp	\N	t	0	2026-07-19 14:08:15.74
3efe732b-ce94-4860-9066-0acb4757f608	9fcfb7f1-4b02-4d85-9d6e-9f6d30050467	/uploads/products/9fcfb7f1-4b02-4d85-9d6e-9f6d30050467.webp	\N	t	0	2026-07-19 14:08:19.608
c6c4b6ae-d046-424a-be5e-9fb34908cb68	4c67a538-fc47-460f-bc48-c95e279c5e9d	/uploads/products/4c67a538-fc47-460f-bc48-c95e279c5e9d.webp	\N	t	0	2026-07-19 14:08:22.813
ce09fd98-15c3-44e9-b517-fd9f1ebdfae4	da07c0cc-32ce-4700-be29-b45490da697f	/uploads/products/da07c0cc-32ce-4700-be29-b45490da697f.webp	\N	t	0	2026-07-19 14:08:26.419
ca39a741-abb7-4070-8997-fc6fbd3542b8	8d4029da-96d1-4eec-8b78-6762b4ff7f82	/uploads/products/8d4029da-96d1-4eec-8b78-6762b4ff7f82.webp	\N	t	0	2026-07-19 14:08:30.037
9cf1b869-2627-4a2c-bcec-85c9ba7bcd10	78efa338-9c4f-4fb2-b9ce-c6764f91adea	/uploads/products/78efa338-9c4f-4fb2-b9ce-c6764f91adea.webp	\N	t	0	2026-07-19 14:08:34.182
5eb97676-982d-49f3-8620-6b509c2734f7	e6ded678-e1f9-4fb6-9a91-62bff43db19f	/uploads/products/e6ded678-e1f9-4fb6-9a91-62bff43db19f.webp	\N	t	0	2026-07-19 14:08:37.497
44999912-4b1f-4143-9079-20830b9c4083	48effdc1-6343-4a8e-aca2-101fe013fd72	/uploads/products/48effdc1-6343-4a8e-aca2-101fe013fd72.webp	\N	t	0	2026-07-19 14:08:41.009
824b8cd9-7405-4ea4-b9db-cda92d0057e7	1e57282b-dc0e-479f-9d2a-3d37929477bb	/uploads/products/1e57282b-dc0e-479f-9d2a-3d37929477bb.webp	\N	t	0	2026-07-19 14:08:44.783
a98a3023-8acc-4bff-b0c9-a0cfb5df96f2	4c817412-00d4-478d-bebc-40a3d76a085e	/uploads/products/4c817412-00d4-478d-bebc-40a3d76a085e.webp	\N	t	0	2026-07-19 14:08:48.155
f1369f83-63dd-4ad7-9c7c-fabcb4de7a48	2871ddbb-2671-4d9a-9dd7-5202d2e81e7f	/uploads/products/2871ddbb-2671-4d9a-9dd7-5202d2e81e7f.webp	\N	t	0	2026-07-19 14:08:51.784
87a63a4c-2a7a-4038-8e0c-487ee46de225	4ae3aa41-93e7-4e06-80d8-c699daf343c9	/uploads/products/4ae3aa41-93e7-4e06-80d8-c699daf343c9.webp	\N	t	0	2026-07-19 14:08:55.383
25caf7a4-94b3-4a2e-a5ed-5da8879900ff	cae436e6-d154-411a-b8bb-60ba4296386e	/uploads/products/cae436e6-d154-411a-b8bb-60ba4296386e.webp	\N	t	0	2026-07-19 14:08:59.772
095c570f-9733-4a8e-b840-246879c16141	bc1dc5b9-e07d-41bb-944a-6a75e0f2462f	/uploads/products/bc1dc5b9-e07d-41bb-944a-6a75e0f2462f.webp	\N	t	0	2026-07-19 14:09:03.97
670ee995-d710-4e78-8bea-1fa714c4dd6b	064c5488-1c71-4707-bca8-9506854f0b5e	/uploads/products/064c5488-1c71-4707-bca8-9506854f0b5e.webp	\N	t	0	2026-07-19 14:09:07.53
f10fce93-2819-4bcb-95e4-642c57b354f4	bb352e30-0643-4ab2-9d43-b6ef7bb59e7d	/uploads/products/bb352e30-0643-4ab2-9d43-b6ef7bb59e7d.webp	\N	t	0	2026-07-19 14:09:11.408
7ac2a044-dd8f-4e84-bc4f-d29c62a8973a	04a92a24-3e48-4d18-8d47-1b4d07ac827f	/uploads/products/04a92a24-3e48-4d18-8d47-1b4d07ac827f.webp	\N	t	0	2026-07-19 14:09:14.796
e16d9679-5337-43d2-ad1d-4de3a0a365dc	a3c1e88a-5ac7-4bb9-80bb-6e8b07d07060	/uploads/products/a3c1e88a-5ac7-4bb9-80bb-6e8b07d07060.webp	\N	t	0	2026-07-19 14:09:18.302
feb2d2f6-35ff-4aec-8871-875c996705ba	2d697d0a-30d0-4388-a0f5-ca1201ffe541	/uploads/products/2d697d0a-30d0-4388-a0f5-ca1201ffe541.webp	\N	t	0	2026-07-19 14:09:21.785
44a2167b-32ed-4aca-8d3f-44df8eff7a87	8323296c-8ed6-4243-9234-54a2b6e6114c	/uploads/products/8323296c-8ed6-4243-9234-54a2b6e6114c.webp	\N	t	0	2026-07-19 14:09:26.446
7ec4f995-cad0-4b47-9c55-47894a85dab7	1b364c0b-662e-4cd5-954c-6bfee2b2c366	/uploads/products/1b364c0b-662e-4cd5-954c-6bfee2b2c366.webp	\N	t	0	2026-07-19 14:09:30.423
e96ae61f-c00e-4465-9cf1-d06650a34af2	8f922038-e240-4d69-9174-7485ad0d07b2	/uploads/products/8f922038-e240-4d69-9174-7485ad0d07b2.webp	\N	t	0	2026-07-19 14:09:34.38
ad247a07-def2-4858-b160-0616377dd49b	b0716a17-fde6-4187-81e6-2e50de59786e	/uploads/products/b0716a17-fde6-4187-81e6-2e50de59786e.webp	\N	t	0	2026-07-19 14:09:38.222
883f58d9-78e7-4053-bcf5-0bb95f3fc420	2aecd3d7-0c14-40fc-9a02-5aa742da6901	/uploads/products/2aecd3d7-0c14-40fc-9a02-5aa742da6901.webp	\N	t	0	2026-07-19 14:09:41.854
440bbde7-cd53-4ab3-9a50-52e71e222023	e08da125-5766-41a1-bdd6-c9ca9df0b92c	/uploads/products/e08da125-5766-41a1-bdd6-c9ca9df0b92c.webp	\N	t	0	2026-07-19 14:09:45.337
c873c9c7-d69b-4329-b8e2-ef15523a6ac0	34b9d907-e77d-4dcf-8251-06b07fa60aa0	/uploads/products/34b9d907-e77d-4dcf-8251-06b07fa60aa0.webp	\N	t	0	2026-07-19 14:09:48.831
9e6cd9a7-f6a3-46f1-9a86-4eecb0379d90	9034bc0f-5328-4dd3-b722-916bf17b239e	/uploads/products/9034bc0f-5328-4dd3-b722-916bf17b239e.webp	\N	t	0	2026-07-19 14:09:52.3
899d4cee-a68a-4d3b-8447-ba66b7ec6079	4ba18694-2e09-413d-9406-9050f623540f	/uploads/products/4ba18694-2e09-413d-9406-9050f623540f.webp	\N	t	0	2026-07-19 14:09:56.088
f7991b92-7506-4c34-bcc5-67708f705883	6993eab3-d31c-4e3b-990b-f90609b12376	/uploads/products/6993eab3-d31c-4e3b-990b-f90609b12376.webp	\N	t	0	2026-07-19 14:09:59.98
eac186b1-9786-41fe-a05c-ce594255c338	477898f2-01cc-4cee-8672-faea3786d6a4	/uploads/products/477898f2-01cc-4cee-8672-faea3786d6a4.webp	\N	t	0	2026-07-19 14:10:03.564
47b46d01-6abf-484e-9d78-ad7078f3b276	2b0e1194-769e-4c6e-b225-af46fe33848c	/uploads/products/2b0e1194-769e-4c6e-b225-af46fe33848c.webp	\N	t	0	2026-07-19 14:10:07.16
db0f2a5e-66c4-4138-9cde-956e34b89e4e	6b1cde3b-7614-4f26-9c6a-e05a03cfe1f9	/uploads/products/6b1cde3b-7614-4f26-9c6a-e05a03cfe1f9.webp	\N	t	0	2026-07-19 14:10:10.927
34b3d31e-1365-4b00-bd39-e7e923a4d04e	0cbe8336-1932-47a2-b470-90af69e93b25	/uploads/products/0cbe8336-1932-47a2-b470-90af69e93b25.webp	\N	t	0	2026-07-19 14:10:14.519
2ee9500f-da7f-4715-ab80-34085d3660b3	a563f573-f08e-4450-bf46-cc26967c13c6	/uploads/products/a563f573-f08e-4450-bf46-cc26967c13c6.webp	\N	t	0	2026-07-19 14:10:18.89
c0d722d2-9dd8-478e-9282-aa9a1d30159a	fcf0c6ed-2798-4aee-b5fc-62978a63cbd3	/uploads/products/fcf0c6ed-2798-4aee-b5fc-62978a63cbd3.webp	\N	t	0	2026-07-19 14:10:22.434
66d0ad4d-50f5-440d-83cd-656b9dd504b9	8b600535-5657-4c05-a48a-59321a0ac0ab	/uploads/products/8b600535-5657-4c05-a48a-59321a0ac0ab.webp	\N	t	0	2026-07-19 14:10:26.482
2e8c841f-2cde-4df1-972d-b88781b82a8f	f8751a4b-64a0-4878-ad63-704933f3f41f	/uploads/products/f8751a4b-64a0-4878-ad63-704933f3f41f.webp	\N	t	0	2026-07-19 14:10:29.899
42e31ac5-6d96-4358-ba82-6a6a453129eb	c78c89fd-baf2-41b8-a4fd-ec1df6fbf32f	/uploads/products/c78c89fd-baf2-41b8-a4fd-ec1df6fbf32f.webp	\N	t	0	2026-07-19 14:10:33.404
b4097bfa-f950-4886-8b20-36711a865b7a	2e421b80-2bba-40cb-9271-2f374778fe6c	/uploads/products/2e421b80-2bba-40cb-9271-2f374778fe6c.webp	\N	t	0	2026-07-19 14:15:02.685
a6859552-4504-4d09-bec7-2a4309f45ff0	4ff689b4-a6fa-4912-aeb6-4f230ff633a3	/uploads/products/4ff689b4-a6fa-4912-aeb6-4f230ff633a3.webp	\N	t	0	2026-07-19 14:10:37.064
e6197246-a825-4f99-8c94-1b57ded37dfb	d7696520-73d0-4473-babc-fa0d1f3df150	/uploads/products/d7696520-73d0-4473-babc-fa0d1f3df150.webp	\N	t	0	2026-07-19 14:10:40.49
ef433765-0da8-45ab-a2f1-3d52a08b1a8a	b8fab72a-155f-4392-bc00-93da631ca1a6	/uploads/products/b8fab72a-155f-4392-bc00-93da631ca1a6.webp	\N	t	0	2026-07-19 14:10:44.008
d919da80-31cb-4f8f-928c-68f5e67267c3	dfcdeaa5-756e-4dcf-8cdb-bd2bab3b377b	/uploads/products/dfcdeaa5-756e-4dcf-8cdb-bd2bab3b377b.webp	\N	t	0	2026-07-19 14:10:47.799
4cd115ed-623f-4ab6-9a2f-8368b00aae13	47998914-eb19-4aba-9a3b-c2760e9d9967	/uploads/products/47998914-eb19-4aba-9a3b-c2760e9d9967.webp	\N	t	0	2026-07-19 14:10:51.39
c58f5e70-b595-4df9-85ff-069f4b383ada	3bed23fb-b4bc-4699-9192-586f02c0405e	/uploads/products/3bed23fb-b4bc-4699-9192-586f02c0405e.webp	\N	t	0	2026-07-19 14:10:55.24
5a6cd7e5-d975-4c96-96f2-812b6e766301	f03d5a97-0539-4692-8841-af7a070ee27a	/uploads/products/f03d5a97-0539-4692-8841-af7a070ee27a.webp	\N	t	0	2026-07-19 14:10:58.788
55145b17-d92f-4c16-9223-40068ad17b6a	7d1d7ad0-8f9a-4f49-a517-df10b3136560	/uploads/products/7d1d7ad0-8f9a-4f49-a517-df10b3136560.webp	\N	t	0	2026-07-19 14:11:02.746
8b718355-c05d-4f6b-964a-ffb24300ee3b	ecb05f78-c3dc-4c3f-aeb9-ad7985bd34e5	/uploads/products/ecb05f78-c3dc-4c3f-aeb9-ad7985bd34e5.webp	\N	t	0	2026-07-19 14:11:06.434
f69520b8-229d-449b-9e54-f3eae3d0ea39	d0ca3ed4-4f2e-44cb-a494-f1076499dedc	/uploads/products/d0ca3ed4-4f2e-44cb-a494-f1076499dedc.webp	\N	t	0	2026-07-19 14:11:09.693
00a0e2a3-cae9-4fc3-b2a9-0b866ff0e9a8	ce88f95e-01cc-4d2e-be0b-35d52bc297e9	/uploads/products/ce88f95e-01cc-4d2e-be0b-35d52bc297e9.webp	\N	t	0	2026-07-19 14:11:13.445
a91e5622-19b5-4f92-80fd-44b2aed3a2c7	b7895678-6a6a-4273-ac01-a42aa7a1dc95	/uploads/products/b7895678-6a6a-4273-ac01-a42aa7a1dc95.webp	\N	t	0	2026-07-19 14:11:17.41
d7195646-f393-4795-b147-0fdfc749954a	3c5563bf-8bcf-42f5-a50b-28ad63938d4d	/uploads/products/3c5563bf-8bcf-42f5-a50b-28ad63938d4d.webp	\N	t	0	2026-07-19 14:11:21.296
68922b74-d468-4274-8aea-4eb096806087	79864c5e-5f95-442f-8c8d-8c093066ee5b	/uploads/products/79864c5e-5f95-442f-8c8d-8c093066ee5b.webp	\N	t	0	2026-07-19 14:11:26.881
efdb37da-0045-4aa4-98c2-8b2fabbd97ae	8710a3af-739b-4817-aceb-3d3eca0566d3	/uploads/products/8710a3af-739b-4817-aceb-3d3eca0566d3.webp	\N	t	0	2026-07-19 14:11:41.907
aab375ab-f55e-44e4-8d5b-fd0ef6f88eb7	76bede9b-42da-4e9e-997f-f5b3907397d0	/uploads/products/76bede9b-42da-4e9e-997f-f5b3907397d0.webp	\N	t	0	2026-07-19 14:11:47.629
46326e89-67df-4b61-a2f5-d8403b79a298	ba231572-151a-4d38-a492-7a0fd966042a	/uploads/products/ba231572-151a-4d38-a492-7a0fd966042a.webp	\N	t	0	2026-07-19 14:11:51.661
bba045bb-e590-4c07-8d09-ee64688e0742	0c8953b6-de1b-4a36-afc0-486388246612	/uploads/products/0c8953b6-de1b-4a36-afc0-486388246612.webp	\N	t	0	2026-07-19 14:11:55.498
50fee57d-0a18-429f-8fc0-2a8f7418c188	03889b15-9788-44d9-8fad-327ad9f3f429	/uploads/products/03889b15-9788-44d9-8fad-327ad9f3f429.webp	\N	t	0	2026-07-19 14:11:59.541
2ba7793a-da48-4d6e-ae9f-0dd5b1aed8cc	b6d4d2c2-184e-411a-a953-31b8a48f13d5	/uploads/products/b6d4d2c2-184e-411a-a953-31b8a48f13d5.webp	\N	t	0	2026-07-19 14:12:03.062
a7a801ba-64a6-42a8-abd3-a19326c3983b	dde8e905-12bb-4a7b-ba55-f5016baeafb8	/uploads/products/dde8e905-12bb-4a7b-ba55-f5016baeafb8.webp	\N	t	0	2026-07-19 14:12:06.957
b699fc71-f224-4827-b1e4-d7dae1272558	9d4b8003-45af-4967-9bd3-4a134a8ea251	/uploads/products/9d4b8003-45af-4967-9bd3-4a134a8ea251.webp	\N	t	0	2026-07-19 14:12:11.355
42a7ed1a-c400-4058-91bb-f44f9d5898a2	b4958433-28ae-4cf7-b922-68e31a061fd0	/uploads/products/b4958433-28ae-4cf7-b922-68e31a061fd0.webp	\N	t	0	2026-07-19 14:12:15.099
02269268-7031-4ea7-b289-07330161f781	8622cbf7-674e-4327-8745-58e0e8610e04	/uploads/products/8622cbf7-674e-4327-8745-58e0e8610e04.webp	\N	t	0	2026-07-19 14:12:18.471
7b4cc6c8-0d88-4fd1-b9d6-91a9f0849876	c1c65875-789f-42a8-80e7-cba95705cd95	/uploads/products/c1c65875-789f-42a8-80e7-cba95705cd95.webp	\N	t	0	2026-07-19 14:12:22.62
2c4637b8-e208-48f1-b9c3-b6b2eff79c02	4d017fe5-f486-4d0a-b1de-21ddcc5b9256	/uploads/products/4d017fe5-f486-4d0a-b1de-21ddcc5b9256.webp	\N	t	0	2026-07-19 14:12:26.921
026c6b81-6dcd-4568-b653-4dff07fd4a9d	0fbc106f-ec7f-4a5b-a6b5-3921a845a82b	/uploads/products/0fbc106f-ec7f-4a5b-a6b5-3921a845a82b.webp	\N	t	0	2026-07-19 14:12:30.624
bb5b3db6-c9eb-4f42-bd67-3d96d261b36c	6b95192d-3e8d-4c94-8b61-f61c421275be	/uploads/products/6b95192d-3e8d-4c94-8b61-f61c421275be.webp	\N	t	0	2026-07-19 14:12:34.602
6e7ad962-1b38-47d9-94be-0153e7231f45	b02ca448-2a46-4038-9a94-6834dc62e633	/uploads/products/b02ca448-2a46-4038-9a94-6834dc62e633.webp	\N	t	0	2026-07-19 14:12:38.232
6c2ff380-08a4-40d3-a61a-77295dc8f24d	ebbb8897-6a67-4516-80b4-bc0d509ef9df	/uploads/products/ebbb8897-6a67-4516-80b4-bc0d509ef9df.webp	\N	t	0	2026-07-19 14:12:42.281
4f1e4318-6bd8-465a-a505-e5a838d94674	ca90d0f7-11fb-4777-a4e8-2ab9455518b2	/uploads/products/ca90d0f7-11fb-4777-a4e8-2ab9455518b2.webp	\N	t	0	2026-07-19 14:12:45.884
0d49aade-9f4a-4de6-a6d9-f3d649ded577	d7651e66-34ac-45dc-99e7-4b7804a68c1a	/uploads/products/d7651e66-34ac-45dc-99e7-4b7804a68c1a.webp	\N	t	0	2026-07-19 14:12:49.94
5231a848-6fc9-48cc-8e3e-9ef369c3edc6	bafb0778-bd98-4348-ba4b-a3c4e82431de	/uploads/products/bafb0778-bd98-4348-ba4b-a3c4e82431de.webp	\N	t	0	2026-07-19 14:12:53.625
ebabe6d8-1543-4b69-96aa-6fe64d46a17a	60cc4b18-0c60-48f9-b316-63ff370b385c	/uploads/products/60cc4b18-0c60-48f9-b316-63ff370b385c.webp	\N	t	0	2026-07-19 14:12:57.849
ef0f19f1-7a8e-40c6-a000-f6ebf67efdcc	7ab5fa67-e6ab-4f39-8866-a4428bbfaa0b	/uploads/products/7ab5fa67-e6ab-4f39-8866-a4428bbfaa0b.webp	\N	t	0	2026-07-19 14:13:01.697
e0b8391d-150f-4271-a208-ecc34b11333f	d5eee1e4-a2d3-4ee6-b859-3f86e722d166	/uploads/products/d5eee1e4-a2d3-4ee6-b859-3f86e722d166.webp	\N	t	0	2026-07-19 14:13:05.639
2f732b85-9b48-4a3b-9f49-afc0a3cb1ff7	72d1e17a-edc0-463b-a895-8c4f442b3c5e	/uploads/products/72d1e17a-edc0-463b-a895-8c4f442b3c5e.webp	\N	t	0	2026-07-19 14:13:09.932
feca04c5-d5e7-42b0-a653-ef10b3b76343	63da88db-96e9-458b-ad10-10d9d0206609	/uploads/products/63da88db-96e9-458b-ad10-10d9d0206609.webp	\N	t	0	2026-07-19 14:13:14.037
e4d3c974-9921-44fa-a025-0a6a4a442170	cda6797a-59e1-40d2-a514-6844b8a36b91	/uploads/products/cda6797a-59e1-40d2-a514-6844b8a36b91.webp	\N	t	0	2026-07-19 14:13:18.217
a43cbab1-008f-43d8-86bb-bd6918ee6cd4	85e52a66-84c6-48ee-9eab-d648b3aa68ce	/uploads/products/85e52a66-84c6-48ee-9eab-d648b3aa68ce.webp	\N	t	0	2026-07-19 14:13:22.013
3b17a6e8-65c1-4bae-b698-ad57511c2d28	74752fc6-8ebb-4939-a83f-cb2d34f9d687	/uploads/products/74752fc6-8ebb-4939-a83f-cb2d34f9d687.webp	\N	t	0	2026-07-19 14:13:25.624
bd033c9c-5bb3-414e-b399-f49ca2fe640a	5d142616-2772-4ab5-a2ae-e7fbed159c58	/uploads/products/5d142616-2772-4ab5-a2ae-e7fbed159c58.webp	\N	t	0	2026-07-19 14:13:29.512
43a7756c-8428-4c10-b1e4-c95b77f281d5	147267f5-ad6b-46d1-afc8-16d5c7b78579	/uploads/products/147267f5-ad6b-46d1-afc8-16d5c7b78579.webp	\N	t	0	2026-07-19 14:13:33.438
752cf39a-543d-4abe-94e8-76330e4b872f	32dbefd4-7297-4427-94b6-312f83f3f7c8	/uploads/products/32dbefd4-7297-4427-94b6-312f83f3f7c8.webp	\N	t	0	2026-07-19 14:13:37.784
0ef5bf5d-e7c2-4920-833f-aa9d75d3d5fb	3d140776-c6a6-46c0-9874-981ed5dd1b1b	/uploads/products/3d140776-c6a6-46c0-9874-981ed5dd1b1b.webp	\N	t	0	2026-07-19 14:13:42.509
b147c3f5-d9a3-48b9-a05f-472be7c57bd1	a1291b8c-5711-4a1d-a42a-6d6405881ac8	/uploads/products/a1291b8c-5711-4a1d-a42a-6d6405881ac8.webp	\N	t	0	2026-07-19 14:13:46.748
a05c0a65-da0b-4cdf-8e7c-0f02d907c5bb	ec2e2064-9f20-47c5-873b-399ed108cb6b	/uploads/products/ec2e2064-9f20-47c5-873b-399ed108cb6b.webp	\N	t	0	2026-07-19 14:13:50.091
12fb8210-a465-4d96-af2b-9409135b2452	ba6d90f2-e97e-49ad-b85b-a199a6d64bfe	/uploads/products/ba6d90f2-e97e-49ad-b85b-a199a6d64bfe.webp	\N	t	0	2026-07-19 14:13:54.34
ec02d14f-895a-4b8d-8007-53d343e91e6a	7f30029f-092c-4c95-82f5-9a39690b3f4c	/uploads/products/7f30029f-092c-4c95-82f5-9a39690b3f4c.webp	\N	t	0	2026-07-19 14:13:59.987
ce8ed9bb-8db4-4359-a319-6e3321c6af4b	84137263-8a01-4584-affe-6d5035ef1244	/uploads/products/84137263-8a01-4584-affe-6d5035ef1244.webp	\N	t	0	2026-07-19 14:14:08.175
007c574a-316a-47cf-afdd-7c8939316230	e5ac8511-2698-40df-8625-d70612e9439a	/uploads/products/e5ac8511-2698-40df-8625-d70612e9439a.webp	\N	t	0	2026-07-19 14:14:13.946
41b97b21-4fdd-4fd6-b18b-1612a59256ae	2480a1fe-8e81-4efc-9dbc-a995a0025622	/uploads/products/2480a1fe-8e81-4efc-9dbc-a995a0025622.webp	\N	t	0	2026-07-19 14:14:21.12
f1957ccf-c0da-4c4e-a06b-1bd252344a26	6a5cf2a6-e87d-4cc2-9062-b523922b4cb7	/uploads/products/6a5cf2a6-e87d-4cc2-9062-b523922b4cb7.webp	\N	t	0	2026-07-19 14:14:28.069
50c0c33d-5a41-46b8-a429-a853f2478994	7013dcaa-b40f-43d9-a2fb-e25459b56cd9	/uploads/products/7013dcaa-b40f-43d9-a2fb-e25459b56cd9.webp	\N	t	0	2026-07-19 14:14:34.798
ad041802-d0d2-40b0-a392-857b3c31673f	4ad4be79-66cf-4e94-88cd-9ac109049507	/uploads/products/4ad4be79-66cf-4e94-88cd-9ac109049507.webp	\N	t	0	2026-07-19 14:14:41.047
17e85df3-b13b-4ff9-b5e9-944ba12f8f8a	30056426-cb6c-4a98-8e00-8c839e350b07	/uploads/products/30056426-cb6c-4a98-8e00-8c839e350b07.webp	\N	t	0	2026-07-19 14:14:45.812
d5d07790-0f18-4cb5-b4c1-cfb48d9a642b	36e49cfe-f6b4-4efc-965f-908b2495e261	/uploads/products/36e49cfe-f6b4-4efc-965f-908b2495e261.webp	\N	t	0	2026-07-19 14:14:51.98
1a2c4f0e-9cfb-48a0-b9b4-fdd4685ffba2	951765db-c632-4eb1-8ccd-a365ee9a98c3	/uploads/products/951765db-c632-4eb1-8ccd-a365ee9a98c3.webp	\N	t	0	2026-07-19 14:15:09.988
b4a29c69-1f8f-43c1-918d-9e17904e9416	a301ce1b-44ea-4ca7-9682-153f2283ece0	/uploads/products/a301ce1b-44ea-4ca7-9682-153f2283ece0.webp	\N	t	0	2026-07-19 14:15:15.258
4c70f898-afa1-4f84-a7e5-2ab6c7b1c6fb	30d74977-3ab5-4047-a372-e7a0dbd3e797	/uploads/products/30d74977-3ab5-4047-a372-e7a0dbd3e797.webp	\N	t	0	2026-07-19 14:15:20.794
10078ebf-8f25-49b9-a61a-9e64b4b4b9f6	3249d1f8-95ac-4efb-a19a-c07713861354	/uploads/products/3249d1f8-95ac-4efb-a19a-c07713861354.webp	\N	t	0	2026-07-19 14:15:24.667
7af2d152-c053-417b-b5b3-c5093c458289	7a542bf6-eaf0-4077-b374-60dea2563c8c	/uploads/products/7a542bf6-eaf0-4077-b374-60dea2563c8c.webp	\N	t	0	2026-07-19 14:15:30.509
2fe7d114-f05d-48c8-bf2d-b0b5c4c57ef9	57bda1da-5b8e-461b-8940-757a8130c09b	/uploads/products/57bda1da-5b8e-461b-8940-757a8130c09b.webp	\N	t	0	2026-07-19 14:15:34.85
7e120e73-8eff-41b3-8bbd-84b25b0c2f95	57a1037a-d639-458f-8007-6b9ecfaa947a	/uploads/products/57a1037a-d639-458f-8007-6b9ecfaa947a.webp	\N	t	0	2026-07-19 14:15:39.148
a1f55b1f-290c-4f02-b4e7-5bc052656874	4b7caf97-02eb-478a-8388-d16bc59a5596	/uploads/products/4b7caf97-02eb-478a-8388-d16bc59a5596.webp	\N	t	0	2026-07-19 14:15:42.561
57f97dc0-0058-4ff8-9ed8-502b1ea108ee	19133cd0-67a4-4de4-9809-4db49357d487	/uploads/products/19133cd0-67a4-4de4-9809-4db49357d487.webp	\N	t	0	2026-07-19 14:15:46.602
0113b2d5-0661-4abd-8397-8fd387fc0599	8335f285-1a61-47f4-b02a-dbd8e8c2b926	/uploads/products/8335f285-1a61-47f4-b02a-dbd8e8c2b926.webp	\N	t	0	2026-07-19 14:15:50.403
04fe72af-0703-412e-9d2a-62659806813e	3383c1ab-88c0-4958-bacf-0b1491a1e761	/uploads/products/3383c1ab-88c0-4958-bacf-0b1491a1e761.webp	\N	t	0	2026-07-19 14:15:55.326
7e96a531-46bb-4360-a851-b04b51812d48	79ddcaec-0056-4c94-9e75-5bd97a6e6f9a	/uploads/products/79ddcaec-0056-4c94-9e75-5bd97a6e6f9a.webp	\N	t	0	2026-07-19 14:15:59.434
143227dd-ef5e-4cc8-aba4-0f57cbc58a61	5deccc48-e4c5-4936-9a4c-31eb581dc9e7	/uploads/products/5deccc48-e4c5-4936-9a4c-31eb581dc9e7.webp	\N	t	0	2026-07-19 14:16:03.792
f923553d-90dd-498b-9328-a74d1c50ace4	83dbdeed-94db-4832-a9c0-63aa1132c9da	/uploads/products/83dbdeed-94db-4832-a9c0-63aa1132c9da.webp	\N	t	0	2026-07-19 14:16:08.146
f47d6c2a-6106-478c-84df-b551b04819cb	65c5ad19-2d58-4550-ac70-364c5816d0b5	/uploads/products/65c5ad19-2d58-4550-ac70-364c5816d0b5.webp	\N	t	0	2026-07-19 14:16:13.921
a2d462a5-d19a-4143-aac5-0b1b6308d11e	6aad7fb3-5e37-46e0-accb-ffbf2c121ecf	/uploads/products/6aad7fb3-5e37-46e0-accb-ffbf2c121ecf.webp	\N	t	0	2026-07-19 14:16:17.498
eaf51380-062e-439e-a842-bb5affe27b08	359618ae-76db-47d0-b416-3f2874d42184	/uploads/products/359618ae-76db-47d0-b416-3f2874d42184.webp	\N	t	0	2026-07-19 14:16:21.279
6ee5bbb9-bf5b-48e9-8db0-32177afeaf83	ed508f36-74a7-4304-b24e-9c50c5e101b2	/uploads/products/ed508f36-74a7-4304-b24e-9c50c5e101b2.webp	\N	t	0	2026-07-19 14:16:25.068
2ffe3a01-a998-4a6c-885b-f60818b1e417	ce22f643-10a3-48bf-97ec-c4d322ef4105	/uploads/products/ce22f643-10a3-48bf-97ec-c4d322ef4105.webp	\N	t	0	2026-07-19 14:16:29.305
fb0c2851-4b54-4fba-b329-b456e95fc607	cebfe037-5ac4-4b4f-bafa-18734995b3ca	/uploads/products/cebfe037-5ac4-4b4f-bafa-18734995b3ca.webp	\N	t	0	2026-07-19 14:16:33.421
58e66920-8a12-4abb-94a4-d3d7fd476d69	c35771e0-e11f-4dbd-b762-c5488c8e503e	/uploads/products/c35771e0-e11f-4dbd-b762-c5488c8e503e.webp	\N	t	0	2026-07-19 14:16:37.354
3ea456b2-5542-4a38-9335-7918d81755be	a8fc89dd-4102-431f-8339-9e65b9d27074	/uploads/products/a8fc89dd-4102-431f-8339-9e65b9d27074.webp	\N	t	0	2026-07-19 14:16:41.802
35edbb43-10f8-40f8-a70b-31607db21771	e6b0d9f7-4026-4c28-8916-df4a5c8fdc26	/uploads/products/e6b0d9f7-4026-4c28-8916-df4a5c8fdc26.webp	\N	t	0	2026-07-19 14:16:45.703
07c3053d-da3b-4abd-b151-f2f23cae275b	de83ece8-c147-480d-b414-ee6dfa9c77f4	/uploads/products/de83ece8-c147-480d-b414-ee6dfa9c77f4.webp	\N	t	0	2026-07-19 14:16:50.112
0db3dcb5-f56a-4015-a463-331213bd60ba	82e672a8-9569-4510-b45d-4e4d5a6a0872	/uploads/products/82e672a8-9569-4510-b45d-4e4d5a6a0872.webp	\N	t	0	2026-07-19 14:16:56.186
33e92721-291f-46e1-abc9-c097fdd65017	42b49c6a-f7d8-45bd-98dd-0f5ba1ebac25	/uploads/products/42b49c6a-f7d8-45bd-98dd-0f5ba1ebac25.webp	\N	t	0	2026-07-19 14:17:01.064
bdf4def8-6b55-420f-9d8a-25b987917f7a	09b097c8-8987-49af-99cf-f8fcbf184a92	/uploads/products/09b097c8-8987-49af-99cf-f8fcbf184a92.webp	\N	t	0	2026-07-19 14:17:04.64
77bd33c2-a9bf-4168-b09e-204762eb991f	0441d386-bf83-46d6-850b-bc8c5ce4a7d0	/uploads/products/0441d386-bf83-46d6-850b-bc8c5ce4a7d0.webp	\N	t	0	2026-07-19 14:17:08.864
4953b3ab-6948-498c-b72d-7a023b68998c	1080ddd7-489b-4716-9004-190708d9493e	/uploads/products/1080ddd7-489b-4716-9004-190708d9493e.webp	\N	t	0	2026-07-19 14:17:13.344
f0141076-2ac0-4b34-876b-96947484041b	efc1a8bb-203a-4dc6-8ddc-5de529b07d7e	/uploads/products/efc1a8bb-203a-4dc6-8ddc-5de529b07d7e.webp	\N	t	0	2026-07-19 14:17:17.237
c3ef71b4-dbcb-45c2-b07a-f5d3843037cc	08332624-be68-4d6f-b34d-9af66ff3bb6f	/uploads/products/08332624-be68-4d6f-b34d-9af66ff3bb6f.webp	\N	t	0	2026-07-19 14:17:21.75
bd45a703-5dc2-405a-afd7-8b941a3876c4	b1ee6554-205e-4306-bf77-cae0c6d30752	/uploads/products/b1ee6554-205e-4306-bf77-cae0c6d30752.webp	\N	t	0	2026-07-19 14:17:28.754
9e757043-b8ad-4573-b193-a211f7b90883	d919cac4-3d0e-46d3-abfd-39405ff00d2e	/uploads/products/d919cac4-3d0e-46d3-abfd-39405ff00d2e.webp	\N	t	0	2026-07-19 14:17:32.453
e646bab9-f77d-4ae4-8c0b-ff07a9757f7b	21fea75f-8b80-48c9-8a52-f3b835a33dc0	/uploads/products/21fea75f-8b80-48c9-8a52-f3b835a33dc0.webp	\N	t	0	2026-07-19 14:17:36.25
d180697b-d1d8-4954-b5c4-304448430864	b2321149-dcf9-40ef-83c7-b80d6ed56162	/uploads/products/b2321149-dcf9-40ef-83c7-b80d6ed56162.webp	\N	t	0	2026-07-19 14:17:39.972
8aeff674-f2af-40b0-99c5-20aee4cab854	8cbc5b78-6a80-4248-a218-28ef9f032a83	/uploads/products/8cbc5b78-6a80-4248-a218-28ef9f032a83.webp	\N	t	0	2026-07-19 14:17:44.142
f024eb97-d328-4ffe-9494-9196910bc919	8fb5c757-d7cf-4a44-8707-24c27f54263b	/uploads/products/8fb5c757-d7cf-4a44-8707-24c27f54263b.webp	\N	t	0	2026-07-19 14:17:49.789
3c1e3a0a-1a56-442c-bb21-2a789afffaef	e182e4b2-4fcb-4706-a454-4fc4774dabfc	/uploads/products/e182e4b2-4fcb-4706-a454-4fc4774dabfc.webp	\N	t	0	2026-07-19 14:17:57.664
f3b814ae-e210-446e-a7de-3cd2ddfd235f	3b7f7d83-9e8d-4e86-941d-48ebd74ce50d	/uploads/products/3b7f7d83-9e8d-4e86-941d-48ebd74ce50d.webp	\N	t	0	2026-07-19 14:18:03.729
8c1a5f5e-f1b4-40bd-af12-3c1b0f00c847	43494570-705a-4197-9dd7-fff7505dd335	/uploads/products/43494570-705a-4197-9dd7-fff7505dd335.webp	\N	t	0	2026-07-19 14:18:08.154
b58d2211-80f8-445b-a433-3ff8c7214e38	2b8a4d23-039b-4e32-a1e6-f8e28728733c	/uploads/products/2b8a4d23-039b-4e32-a1e6-f8e28728733c.webp	\N	t	0	2026-07-19 14:18:11.934
14dd5c34-f953-4f73-bc91-b92c8ff10ced	90538320-a765-48ba-b11e-39517b851ff8	/uploads/products/90538320-a765-48ba-b11e-39517b851ff8.webp	\N	t	0	2026-07-19 14:18:15.633
827aa9c6-3273-41b1-9390-98b12e8d595f	af8899cf-4ee6-4101-a640-3cd0f0c61870	/uploads/products/af8899cf-4ee6-4101-a640-3cd0f0c61870.webp	\N	t	0	2026-07-19 14:18:19.218
f16e14b1-e5f4-4cf9-9bf9-6fd461e13c44	757f5ca5-6987-439d-adf7-d2c7404911e9	/uploads/products/757f5ca5-6987-439d-adf7-d2c7404911e9.webp	\N	t	0	2026-07-19 14:18:23.974
c42c842b-f3d1-4eb3-88fd-3ed1d1de20a3	ea726d02-55d5-4257-885f-7cfafa201f43	/uploads/products/ea726d02-55d5-4257-885f-7cfafa201f43.webp	\N	t	0	2026-07-19 14:19:07.109
4f724c92-bc88-434c-ac52-704cc20542c2	2a20229e-a62d-4427-9950-3e1846971720	/uploads/products/2a20229e-a62d-4427-9950-3e1846971720.webp	\N	t	0	2026-07-19 14:19:11.163
4e380c69-846e-4400-b315-5a67fcc2421a	00f161f6-53e4-4191-85b2-81e573898f95	/uploads/products/00f161f6-53e4-4191-85b2-81e573898f95.webp	\N	t	0	2026-07-19 14:19:14.894
22576d51-c748-4ba7-94da-bbc6cf6e6200	71cb70a1-52af-43b0-b06b-5a51225a84a6	/uploads/products/71cb70a1-52af-43b0-b06b-5a51225a84a6.webp	\N	t	0	2026-07-19 14:19:18.95
3c7237a6-ede6-4eea-b2f7-b931251b933e	bcfbe8d4-46e1-43cd-aa18-f2aad6130d19	/uploads/products/bcfbe8d4-46e1-43cd-aa18-f2aad6130d19.webp	\N	t	0	2026-07-19 14:19:23.13
6a77195a-f797-44fc-8aa8-189b16a0abd9	cd839cb5-2ab8-4312-9208-7949f79474c4	/uploads/products/cd839cb5-2ab8-4312-9208-7949f79474c4.webp	\N	t	0	2026-07-19 14:19:27.293
839aa842-434c-4b88-9d40-5769c0906130	944dfaa0-f4f3-4dd8-9ed0-bd48dc76424f	/uploads/products/944dfaa0-f4f3-4dd8-9ed0-bd48dc76424f.webp	\N	t	0	2026-07-19 14:19:31.18
2dde8897-f531-4586-8726-c5057eb7da58	3ff9c784-ccd9-4adb-a793-a8cee2e525c3	/uploads/products/3ff9c784-ccd9-4adb-a793-a8cee2e525c3.webp	\N	t	0	2026-07-19 14:19:34.82
d333f405-dd64-40e9-9842-a8279ff1dd43	1a6602ed-b11a-488e-a848-8f621dd1e5e8	/uploads/products/1a6602ed-b11a-488e-a848-8f621dd1e5e8.webp	\N	t	0	2026-07-19 14:19:39.469
05e80b02-766a-4464-aee6-3cf987c0e12f	f4ae23f0-da72-4b5e-80d2-eac5adff8d2d	/uploads/products/f4ae23f0-da72-4b5e-80d2-eac5adff8d2d.webp	\N	t	0	2026-07-19 14:19:43.973
12b39393-97f6-4e5b-b60a-f27b6e96f0e4	48102744-674a-4139-9202-b5309f6408d6	/uploads/products/48102744-674a-4139-9202-b5309f6408d6.webp	\N	t	0	2026-07-19 14:19:47.671
b5f94e22-56f1-4a95-9298-5b243754195e	0a8afc61-f4f1-4199-9fca-50acb7fd6901	/uploads/products/0a8afc61-f4f1-4199-9fca-50acb7fd6901.webp	\N	t	0	2026-07-19 14:19:51.754
e50823bc-d509-486c-8565-e286f43940b9	ebf46448-a544-4310-be0d-422ef7a4cb8e	/uploads/products/ebf46448-a544-4310-be0d-422ef7a4cb8e.webp	\N	t	0	2026-07-19 14:19:55.336
76b47b77-b06c-4f9b-bd75-abb755fca520	57b46ceb-25cc-4199-8012-5bc765717a84	/uploads/products/57b46ceb-25cc-4199-8012-5bc765717a84.webp	\N	t	0	2026-07-19 14:19:59.543
5ebc5adc-41fc-4844-ae25-2b1824ea1177	6d13868d-2e0f-41f9-a25a-6ca609740b50	/uploads/products/6d13868d-2e0f-41f9-a25a-6ca609740b50.webp	\N	t	0	2026-07-19 14:20:03.04
8ef91aaa-7923-4990-a230-7f6c4d12aa77	b1b782a4-1c73-42fc-a864-120b7dcdb6d6	/uploads/products/b1b782a4-1c73-42fc-a864-120b7dcdb6d6.webp	\N	t	0	2026-07-19 14:20:06.717
1b41f6b3-aba0-402f-a281-daa0df5ab069	59110147-0dd3-4c94-b06c-f80a08d09dc2	/uploads/products/59110147-0dd3-4c94-b06c-f80a08d09dc2.webp	\N	t	0	2026-07-19 14:20:10.06
cf91f1ff-793b-447b-955e-823ac54c2a61	8c4c41bf-b35f-464b-be5f-11e7ebe18569	/uploads/products/8c4c41bf-b35f-464b-be5f-11e7ebe18569.webp	\N	t	0	2026-07-19 14:20:13.766
a32bf403-bbb3-49d7-839f-4abe5b7616af	cb400a40-b9b3-49b4-a1d5-90cd684a69d2	/uploads/products/cb400a40-b9b3-49b4-a1d5-90cd684a69d2.webp	\N	t	0	2026-07-19 14:20:17.176
11f1609a-e0bf-4912-97fd-b2d0530fa1aa	2e09f8a6-623b-4612-a9f4-4c1fc8b85d1a	/uploads/products/2e09f8a6-623b-4612-a9f4-4c1fc8b85d1a.webp	\N	t	0	2026-07-19 14:20:21.476
69703247-8a6c-4106-821b-79c9ef62964d	b0bc5542-772e-4673-9b0b-08a1ff1cd72d	/uploads/products/b0bc5542-772e-4673-9b0b-08a1ff1cd72d.webp	\N	t	0	2026-07-19 14:20:25.443
143d2db4-8726-44c3-95ca-87a1ecd99922	85d4e3e0-0d70-40f0-9136-a796dedee9e6	/uploads/products/85d4e3e0-0d70-40f0-9136-a796dedee9e6.webp	\N	t	0	2026-07-19 14:20:29.439
d0aa9702-9542-4ae0-b40a-8211b4c3b729	022a4e77-f3c0-4504-9d5a-e2e12d178fb7	/uploads/products/022a4e77-f3c0-4504-9d5a-e2e12d178fb7.webp	\N	t	0	2026-07-19 14:20:33.116
26f9ad37-c417-4107-bbb0-3f9dfaa5b33d	fbb2f6c1-a13d-42e9-8af9-3327159f0a8c	/uploads/products/fbb2f6c1-a13d-42e9-8af9-3327159f0a8c.webp	\N	t	0	2026-07-19 14:20:36.608
d38ddf86-e33e-4564-89ce-f13c2e028180	a275de9a-5f98-4ee6-8a04-415330eb7c9b	/uploads/products/a275de9a-5f98-4ee6-8a04-415330eb7c9b.webp	\N	t	0	2026-07-19 14:20:41.111
f8f28d8d-0807-4b52-94f1-f7eeb3eaf938	a91ae67a-695a-4cdc-a537-753e7469182d	/uploads/products/a91ae67a-695a-4cdc-a537-753e7469182d.webp	\N	t	0	2026-07-19 14:20:44.661
5d892447-6e2c-4805-a5eb-429e2852894d	8a55e6a6-c88d-4c6d-88e7-d4d07dca202b	/uploads/products/8a55e6a6-c88d-4c6d-88e7-d4d07dca202b.webp	\N	t	0	2026-07-19 14:20:48.315
16ae5de5-ce4f-4ec5-b70b-d96d19b5914e	59a459d0-4195-4186-9b29-4a801aa14872	/uploads/products/59a459d0-4195-4186-9b29-4a801aa14872.webp	\N	t	0	2026-07-19 14:20:52.265
fcb4f00c-ed89-476a-bbc5-6589d741e1f3	47a8028b-d94e-4f27-b0b7-56a2ae1e8bae	/uploads/products/47a8028b-d94e-4f27-b0b7-56a2ae1e8bae.webp	\N	t	0	2026-07-19 14:20:56.165
31c0029a-f8cb-4c24-8218-b41dd9a3e286	7333c793-92dc-4d5a-b91a-0b3dcd894eb2	/uploads/products/7333c793-92dc-4d5a-b91a-0b3dcd894eb2.webp	\N	t	0	2026-07-19 14:21:04.111
5d9fa61f-4fc4-4dbb-b197-8d54596fe98d	2d7e52f0-0a83-46fd-908e-3bad0d6f2ebd	/uploads/products/2d7e52f0-0a83-46fd-908e-3bad0d6f2ebd.webp	\N	t	0	2026-07-19 14:21:07.955
935e84b8-e0ba-457f-88a8-f70f63e3ac26	94daadee-0da8-419b-a232-88f91dfdefa5	/uploads/products/94daadee-0da8-419b-a232-88f91dfdefa5.webp	\N	t	0	2026-07-19 14:21:11.934
de124096-766e-4733-9e0a-498d90d17e87	7845df49-d2ec-4e83-8e71-ac3a4a210ffa	/uploads/products/7845df49-d2ec-4e83-8e71-ac3a4a210ffa.webp	\N	t	0	2026-07-19 14:21:16.028
0288087b-8d38-47c4-bd4c-a78eb7b37e23	d2a0f31c-8663-49d1-9132-0c3005d100e9	/uploads/products/d2a0f31c-8663-49d1-9132-0c3005d100e9.webp	\N	t	0	2026-07-19 14:21:20.229
f0f947cf-154f-4951-a8de-04629758f4d9	30a7e534-d700-4613-b061-6e9085db3e96	/uploads/products/30a7e534-d700-4613-b061-6e9085db3e96.webp	\N	t	0	2026-07-19 14:21:24.346
0fe532ee-af71-4878-822e-ace7efe9a64a	5c508d38-7c4b-4b8f-aeb1-f9e125d225bd	/uploads/products/5c508d38-7c4b-4b8f-aeb1-f9e125d225bd.webp	\N	t	0	2026-07-19 14:21:28.206
225b6834-070b-4e9e-ae46-a4072404db17	e2f40d3e-b803-4edb-bee2-6b8a89aafca9	/uploads/products/e2f40d3e-b803-4edb-bee2-6b8a89aafca9.webp	\N	t	0	2026-07-19 14:21:32.517
af87c078-327d-4554-8234-9499988c59b2	12a3d9a1-c44e-4fdf-aaf8-4eec621794b8	/uploads/products/12a3d9a1-c44e-4fdf-aaf8-4eec621794b8.webp	\N	t	0	2026-07-19 14:21:36.918
193d9ab8-9c80-45d7-9bcb-0ade4688cabb	1b4f0479-08ff-4fb7-a48c-8d7d1a9319d7	/uploads/products/1b4f0479-08ff-4fb7-a48c-8d7d1a9319d7.webp	\N	t	0	2026-07-19 14:21:40.512
4cc69a48-d8fe-4e27-bfdb-fe6e29dd3bf9	59dfaf31-6b17-4d0a-a15d-81cb250f40e4	/uploads/products/59dfaf31-6b17-4d0a-a15d-81cb250f40e4.webp	\N	t	0	2026-07-19 14:21:44.6
e6b216e2-9890-4441-86a1-3dce22937598	cb7b75da-eca0-4e78-bbfa-5a01bf0eb4fb	/uploads/products/cb7b75da-eca0-4e78-bbfa-5a01bf0eb4fb.webp	\N	t	0	2026-07-19 14:21:48.439
d0eee178-0d47-4c5b-a08e-bd63e784513e	0a6ef255-7fab-4a0b-b69a-3a95b77894b6	/uploads/products/0a6ef255-7fab-4a0b-b69a-3a95b77894b6.webp	\N	t	0	2026-07-19 14:21:52.344
4a0d5b29-0aaf-44f5-b99b-6758e2d37f50	ffa99d71-5c66-485b-962e-60b1383fd7a6	/uploads/products/ffa99d71-5c66-485b-962e-60b1383fd7a6.webp	\N	t	0	2026-07-19 14:21:56.14
799c9196-48a2-4f4c-b81f-3e703db01534	cc317f86-9b40-436e-92ef-0f0eab00699a	/uploads/products/cc317f86-9b40-436e-92ef-0f0eab00699a.webp	\N	t	0	2026-07-19 14:22:00.271
bf654d94-4c72-4c70-9b8a-0e42c8f26264	31cc7a30-cd6a-4095-9662-2e562b960e4f	/uploads/products/31cc7a30-cd6a-4095-9662-2e562b960e4f.webp	\N	t	0	2026-07-19 14:22:04.277
662846c7-5202-470b-9845-57a4dd579cf7	7eb16ed2-8737-4b3a-8e55-76aa65f55ea6	/uploads/products/7eb16ed2-8737-4b3a-8e55-76aa65f55ea6.webp	\N	t	0	2026-07-19 14:22:08.782
85ab89ba-d6d1-4300-b2b5-7c858953dd90	1c13ab6e-6ce7-4c70-bd84-9f8bf4373d75	/uploads/products/1c13ab6e-6ce7-4c70-bd84-9f8bf4373d75.webp	\N	t	0	2026-07-19 14:22:12.733
90ba547a-caf3-49c3-b67b-606f500e71fd	654b5cd7-b1d8-478e-8930-7b1e302fd1ad	/uploads/products/654b5cd7-b1d8-478e-8930-7b1e302fd1ad.webp	\N	t	0	2026-07-19 14:22:17.059
00721c36-8376-480d-baa8-3d8f85c81b5c	2a992096-8c7a-41dd-98a7-2687949b3154	/uploads/products/2a992096-8c7a-41dd-98a7-2687949b3154.webp	\N	t	0	2026-07-19 14:22:20.579
a099cc5c-1609-43a3-802f-12726b855d64	62caf1c8-0aed-4178-8905-e2973a1d16ce	/uploads/products/62caf1c8-0aed-4178-8905-e2973a1d16ce.webp	\N	t	0	2026-07-19 14:22:24.325
e7ac7abb-d9b8-46ec-b111-f93f7f1f9f3f	5fdd1f1f-324f-4fee-9186-fd01bab67c16	/uploads/products/5fdd1f1f-324f-4fee-9186-fd01bab67c16.webp	\N	t	0	2026-07-19 14:22:28.18
156c943a-04fa-4998-bc20-afc6f3166cbf	b6891f3b-5f33-4b05-8ae5-e5d8deea26a9	/uploads/products/b6891f3b-5f33-4b05-8ae5-e5d8deea26a9.webp	\N	t	0	2026-07-19 14:22:31.636
54e23e35-8770-4651-a543-0e363131845c	be44a0c2-782d-4834-ac0a-83de9f1db9db	/uploads/products/be44a0c2-782d-4834-ac0a-83de9f1db9db.webp	\N	t	0	2026-07-19 14:22:35.832
34e3f475-eb53-4cb0-93f7-50521913e540	d36eded5-b156-431d-b081-6542eb328e72	/uploads/products/d36eded5-b156-431d-b081-6542eb328e72.webp	\N	t	0	2026-07-19 14:22:39.588
f66f1fab-ccd1-4fca-bce2-f504673ab883	c5932bdc-6417-41a4-a3ff-1f50c74710a6	/uploads/products/c5932bdc-6417-41a4-a3ff-1f50c74710a6.webp	\N	t	0	2026-07-19 14:22:43.336
d8fde961-277f-4b11-8ac6-f3a33ebcc3a0	afb5363d-7f58-4914-8c91-3273be4edf73	/uploads/products/afb5363d-7f58-4914-8c91-3273be4edf73.webp	\N	t	0	2026-07-19 14:22:47.178
4272f405-878f-49cd-80b0-483464098212	4f5a298c-8b10-4cd4-8fbc-e97640007ee2	/uploads/products/4f5a298c-8b10-4cd4-8fbc-e97640007ee2.webp	\N	t	0	2026-07-19 14:22:50.855
fabfc845-8816-4564-976b-459c83a308fb	9a7be05b-90aa-4416-a136-864793f53174	/uploads/products/9a7be05b-90aa-4416-a136-864793f53174.webp	\N	t	0	2026-07-19 14:22:54.857
1f565526-fa4b-4ac3-beb9-b7f8e14f6d44	f6d65d00-7f47-4b55-8590-fdab9ce175aa	/uploads/products/f6d65d00-7f47-4b55-8590-fdab9ce175aa.webp	\N	t	0	2026-07-19 14:22:58.941
3791794b-b523-4616-81db-83792a946061	8a1a3ee2-53d8-4d82-bdfa-8536f274a554	/uploads/products/8a1a3ee2-53d8-4d82-bdfa-8536f274a554.webp	\N	t	0	2026-07-19 14:23:02.957
78c0f342-27ef-4e8f-8d54-47558e6826ba	99c569c0-af20-41ab-9b5a-6274d66d1523	/uploads/products/99c569c0-af20-41ab-9b5a-6274d66d1523.webp	\N	t	0	2026-07-19 14:23:06.743
89fa58c2-2288-4bcf-9a6e-2b277a5d5ac9	4edadee5-1848-452a-9dec-461df9ed5d93	/uploads/products/4edadee5-1848-452a-9dec-461df9ed5d93.webp	\N	t	0	2026-07-19 14:23:10.822
eb9df5a1-3b25-438f-95ce-ebbc6dbedff7	3ea1c578-aacf-41b2-96e9-42c5f6cba8a0	/uploads/products/3ea1c578-aacf-41b2-96e9-42c5f6cba8a0.webp	\N	t	0	2026-07-19 14:23:14.811
9483952f-ecaf-4ae3-a1d9-37ddcbfe7e81	4842b000-f95f-41e2-a84c-1ed94570969a	/uploads/products/4842b000-f95f-41e2-a84c-1ed94570969a.webp	\N	t	0	2026-07-19 14:23:18.87
ce1a4ffa-71b1-4e17-9388-ca1b02ddc8d3	f45e847d-b184-445a-bdfe-b4727456655a	/uploads/products/f45e847d-b184-445a-bdfe-b4727456655a.webp	\N	t	0	2026-07-19 14:23:22.493
02b91f28-128e-48ae-9f5b-77dc07df5bed	27cb9ac7-885f-4658-8d5f-f6f16d855bb8	/uploads/products/27cb9ac7-885f-4658-8d5f-f6f16d855bb8.webp	\N	t	0	2026-07-19 14:23:26.083
7041dbc9-b0e5-486b-abfe-6fed33268aea	6ac269ec-1522-4180-8e5d-47d1243fac64	/uploads/products/6ac269ec-1522-4180-8e5d-47d1243fac64.webp	\N	t	0	2026-07-19 14:23:29.834
dbd20eb3-95b9-4939-beab-668c145ab899	d6219858-a813-4275-83fd-e0dc53e505b1	/uploads/products/d6219858-a813-4275-83fd-e0dc53e505b1.webp	\N	t	0	2026-07-19 14:23:34.075
07d3d696-ee0a-4361-ab31-013f6d635ef8	33b2e338-22d7-4c7e-983c-dad575a28c34	/uploads/products/33b2e338-22d7-4c7e-983c-dad575a28c34.webp	\N	t	0	2026-07-19 14:23:38.171
ad770b9d-f574-4ac4-a751-1d81f731b21a	bbb3ffcf-bcd3-4f09-b9f8-77b881cb4668	/uploads/products/bbb3ffcf-bcd3-4f09-b9f8-77b881cb4668.webp	\N	t	0	2026-07-19 14:23:41.966
a68dca01-e00c-42db-a689-2cb35fe89c32	3614cc74-1402-4552-9a36-15e0f4ff832f	/uploads/products/3614cc74-1402-4552-9a36-15e0f4ff832f.webp	\N	t	0	2026-07-19 14:23:46.242
305b70b6-e16b-4fc3-95aa-1579226777a9	b9d2a0c2-b379-4de6-a7f6-7f1ba70cec76	/uploads/products/b9d2a0c2-b379-4de6-a7f6-7f1ba70cec76.webp	\N	t	0	2026-07-19 14:23:50.241
5d436206-9e68-46cb-98a4-c5a656c2cc26	8b55a19f-45fc-4ff4-9116-af1f72f737e1	/uploads/products/8b55a19f-45fc-4ff4-9116-af1f72f737e1.webp	\N	t	0	2026-07-19 14:23:54.34
bb7c4e05-05de-4686-8519-97c2de564615	c67a4772-cded-4c6c-bd23-921fbc166095	/uploads/products/c67a4772-cded-4c6c-bd23-921fbc166095.webp	\N	t	0	2026-07-19 14:23:59.367
d88e36ea-935f-41ba-8830-4ba31abc948a	96d43657-16d4-4e26-90e8-c2646ed26442	/uploads/products/96d43657-16d4-4e26-90e8-c2646ed26442.webp	\N	t	0	2026-07-19 14:24:03.169
c78c4b70-8228-48c4-ba24-ae727bed5fd8	40f16b29-f1e3-44aa-a386-08afa2d89ae3	/uploads/products/40f16b29-f1e3-44aa-a386-08afa2d89ae3.webp	\N	t	0	2026-07-19 14:24:07.038
b8b4daf3-0716-4b34-9663-e85b4e352bd2	b5d2d725-99d0-443b-8573-24461844148c	/uploads/products/b5d2d725-99d0-443b-8573-24461844148c.webp	\N	t	0	2026-07-19 14:24:11.541
2789214c-34c4-48b8-904c-4e12152830f7	2e5599dd-7b40-4ce7-a114-8cd24c9a4b70	/uploads/products/2e5599dd-7b40-4ce7-a114-8cd24c9a4b70.webp	\N	t	0	2026-07-19 14:24:14.813
78d6be1c-871f-4a4e-8e29-18b9c0fa6992	8feb25c6-e728-4e24-b303-8defd279762b	/uploads/products/8feb25c6-e728-4e24-b303-8defd279762b.webp	\N	t	0	2026-07-19 14:24:18.468
ff644f01-170d-44d6-b5fb-f232eb1ca370	e1bb7c06-78d1-4a29-9862-59271f078511	/uploads/products/e1bb7c06-78d1-4a29-9862-59271f078511.webp	\N	t	0	2026-07-19 14:24:21.995
d7d1d9e3-922b-4cf9-ab18-8a3b096eab4c	c91f8af4-a006-4018-8c6b-2e4b1773cc62	/uploads/products/c91f8af4-a006-4018-8c6b-2e4b1773cc62.webp	\N	t	0	2026-07-19 14:24:25.694
ae31b85d-8496-4a53-95ff-79dad2d5e0b3	59b41a3b-fd13-4878-80c5-08012a9446eb	/uploads/products/59b41a3b-fd13-4878-80c5-08012a9446eb.webp	\N	t	0	2026-07-19 14:24:29.894
9e98ea92-df56-40f3-9b4e-f5203fe72b0f	f42e1ed8-624f-43e1-b3e7-ab7b2de15f4c	/uploads/products/f42e1ed8-624f-43e1-b3e7-ab7b2de15f4c.webp	\N	t	0	2026-07-19 14:24:33.686
075fcb8b-a143-48a7-8922-2dde8474c936	579447bd-e5d6-45b4-83f8-addaa6c5ea8c	/uploads/products/579447bd-e5d6-45b4-83f8-addaa6c5ea8c.webp	\N	t	0	2026-07-19 14:24:37.912
7fa5cdd4-0409-4ddd-8b6c-d90d66a92359	1cf242f8-2aed-4992-8e8f-d010156c0a0f	/uploads/products/1cf242f8-2aed-4992-8e8f-d010156c0a0f.webp	\N	t	0	2026-07-19 14:24:41.889
ef217426-c258-449a-808a-de3cbc3167db	d69f3606-a366-4aa1-aa3a-1dfc81dfe501	/uploads/products/d69f3606-a366-4aa1-aa3a-1dfc81dfe501.webp	\N	t	0	2026-07-19 14:24:45.643
155e97d7-e114-4216-8e48-e700c033e859	d1e9245e-e54d-4473-a200-109c97d64c7e	/uploads/products/d1e9245e-e54d-4473-a200-109c97d64c7e.webp	\N	t	0	2026-07-19 14:24:49.379
3ad4911c-8848-4837-a8a3-17a3e337f7ec	fd9d9682-64a3-49e0-aebe-546de7ee7c13	/uploads/products/fd9d9682-64a3-49e0-aebe-546de7ee7c13.webp	\N	t	0	2026-07-19 14:24:53.123
f0df2f3a-2ec4-44ef-9bd8-203c4fcc5ca7	0b34e06a-42aa-4a0a-9560-2065ea434cc4	/uploads/products/0b34e06a-42aa-4a0a-9560-2065ea434cc4.webp	\N	t	0	2026-07-19 14:24:57.216
43305388-3c58-4d07-a279-afb59f45ed58	3e2aeceb-01db-4847-b55e-c63f32b49f34	/uploads/products/3e2aeceb-01db-4847-b55e-c63f32b49f34.webp	\N	t	0	2026-07-19 14:25:01.327
a01524da-b64b-41a5-bdbd-6bf8298049a5	ea1b54d1-f3ad-4de4-9d3d-2a14af415cad	/uploads/products/ea1b54d1-f3ad-4de4-9d3d-2a14af415cad.webp	\N	t	0	2026-07-19 14:25:05.614
c1f75d86-bfc3-4a4d-81b1-5fca848c5ad8	e4bfaa3d-14b9-471d-8e01-d3efa473d74f	/uploads/products/e4bfaa3d-14b9-471d-8e01-d3efa473d74f.webp	\N	t	0	2026-07-19 14:25:09.299
94101baa-5fe6-45bd-abcd-6af27fd03b1a	f3843583-d836-44b8-a9cf-edd9eb3ef39a	/uploads/products/f3843583-d836-44b8-a9cf-edd9eb3ef39a.webp	\N	t	0	2026-07-19 14:25:13.964
e2e8531d-ee58-4913-8275-38b30d9e6ed7	8ce290c7-1268-4414-8a17-9c39fe75bdfd	/uploads/products/8ce290c7-1268-4414-8a17-9c39fe75bdfd.webp	\N	t	0	2026-07-19 14:25:18.005
b8c0ab99-6d36-4e4a-b440-63631ac49fa6	bf87b360-f6e2-49a1-804f-381c7a3367d2	/uploads/products/bf87b360-f6e2-49a1-804f-381c7a3367d2.webp	\N	t	0	2026-07-19 14:25:22.406
fd6f1c64-c364-4008-84bb-9a966d5eb296	e10a08bd-b188-4489-af6c-3677266a5acb	/uploads/products/e10a08bd-b188-4489-af6c-3677266a5acb.webp	\N	t	0	2026-07-19 14:25:26.597
b892e2f2-cd12-4011-9531-ef7a7f5cd936	b27bd564-a3ae-40eb-bbda-8e2113fa98e7	/uploads/products/b27bd564-a3ae-40eb-bbda-8e2113fa98e7.webp	\N	t	0	2026-07-19 14:25:31.137
3f1f3b67-de28-4731-876f-bdac22686428	9e99faab-0dc6-4609-9d21-399ad41cbd4c	/uploads/products/9e99faab-0dc6-4609-9d21-399ad41cbd4c.webp	\N	t	0	2026-07-19 14:25:35.824
7749b4e7-8123-4c96-bdb2-dd08d40ad9da	326bb60b-6441-44f8-9f10-9774e0d96ddc	/uploads/products/326bb60b-6441-44f8-9f10-9774e0d96ddc.webp	\N	t	0	2026-07-19 14:25:40.286
6bbb0d4f-032f-4c21-a6ab-cd98213c0199	78f666b8-a54c-41bf-ad88-388edf5fb7cd	/uploads/products/78f666b8-a54c-41bf-ad88-388edf5fb7cd.webp	\N	t	0	2026-07-19 14:25:44.938
c49e840a-7f9f-4df0-938b-20ffa3462484	4392706b-317c-4bac-867a-39b77e001b11	/uploads/products/4392706b-317c-4bac-867a-39b77e001b11.webp	\N	t	0	2026-07-19 14:25:49.329
058da560-5e10-4248-982c-95f882c5ebba	fce5624c-1c57-45d1-ac5d-2bb5d3b840b0	/uploads/products/fce5624c-1c57-45d1-ac5d-2bb5d3b840b0.webp	\N	t	0	2026-07-19 14:25:53.845
d702162e-2f2a-4cf8-8f3e-ad0bff1f1491	14938ed6-4005-40da-a871-134ce00c28cb	/uploads/products/14938ed6-4005-40da-a871-134ce00c28cb.webp	\N	t	0	2026-07-19 14:25:57.939
39c950c4-a09b-4cff-96bd-78f607670477	0c254ff6-8827-4179-b1c5-6b8d10c324c5	/uploads/products/0c254ff6-8827-4179-b1c5-6b8d10c324c5.webp	\N	t	0	2026-07-19 14:26:02.116
1cecccc8-6ca8-428c-abb8-b7c861b23298	479e2fc2-7ca0-49bd-a203-537b70bbd22f	/uploads/products/479e2fc2-7ca0-49bd-a203-537b70bbd22f.webp	\N	t	0	2026-07-19 14:26:06.645
89479e93-85bf-4136-a00d-c8dae946e733	80016815-b549-4dbd-9882-1d23e036b880	/uploads/products/80016815-b549-4dbd-9882-1d23e036b880.webp	\N	t	0	2026-07-19 14:26:11.03
5933b801-df3b-4b93-9b80-24a4ee95faa0	e2c598d0-97e7-43b4-b51d-16f04be0cc13	/uploads/products/e2c598d0-97e7-43b4-b51d-16f04be0cc13.webp	\N	t	0	2026-07-19 14:26:14.55
281ae615-08ae-4098-a8ba-07eaf0442c84	3c7d1aeb-77a7-460e-b9cf-87b79db7a38b	/uploads/products/3c7d1aeb-77a7-460e-b9cf-87b79db7a38b.webp	\N	t	0	2026-07-19 14:26:18.186
f886ab5c-354c-4c92-8be2-9accf23dfd90	85d4b481-27a7-40b3-a1ec-cd3395a97194	/uploads/products/85d4b481-27a7-40b3-a1ec-cd3395a97194.webp	\N	t	0	2026-07-19 14:26:22.066
40852d03-f1cc-4393-9b8e-6839530798d2	f7a40dcd-62dd-417a-b2a6-15f863f10f7f	/uploads/products/f7a40dcd-62dd-417a-b2a6-15f863f10f7f.webp	\N	t	0	2026-07-19 14:26:25.793
65562535-82b5-42e0-b73b-ba6b7c41155a	740d30b9-8169-48b7-b8db-77db73c7f15b	/uploads/products/740d30b9-8169-48b7-b8db-77db73c7f15b.webp	\N	t	0	2026-07-19 14:26:29.449
dade7cfa-149a-4610-9965-ff53923cabf9	cfab21bb-400c-4884-aba9-a08668026a8c	/uploads/products/cfab21bb-400c-4884-aba9-a08668026a8c.webp	\N	t	0	2026-07-19 14:26:34.308
f5d467e9-0d33-49dd-85c8-e521a977a5ae	daa86be6-7e10-4c4f-80d6-38bdd01adc39	/uploads/products/daa86be6-7e10-4c4f-80d6-38bdd01adc39.webp	\N	t	0	2026-07-19 14:26:38.194
c93b206f-385a-4276-8204-4cec4479479d	10df2330-c31b-454b-8f35-8e4ee05ca445	/uploads/products/10df2330-c31b-454b-8f35-8e4ee05ca445.webp	\N	t	0	2026-07-19 14:30:57.871
2b57f0b4-1bc5-439c-95ef-f146b732f287	29c9ddae-afd0-4702-9732-c9dd05409ca7	/uploads/products/29c9ddae-afd0-4702-9732-c9dd05409ca7.webp	\N	t	0	2026-07-19 14:31:01.776
a84e22ab-e564-492b-8d53-d4928c33ddc4	b6fe8f53-aade-4915-9eff-0e671fa904ae	/uploads/products/b6fe8f53-aade-4915-9eff-0e671fa904ae.webp	\N	t	0	2026-07-19 14:31:05.354
7c40a30a-4f0e-4c53-9497-2fa06354e2e0	e2ff5d78-74e7-4bdf-be25-08804796ca26	/uploads/products/e2ff5d78-74e7-4bdf-be25-08804796ca26.webp	\N	t	0	2026-07-19 14:31:09.45
27ced9dd-45ab-41ef-9017-e92c26a15ee8	db23f5a3-26c4-42ed-b209-9c884e21b45d	/uploads/products/db23f5a3-26c4-42ed-b209-9c884e21b45d.webp	\N	t	0	2026-07-19 14:31:13.238
cd293c96-fcb1-4e9e-8449-62e34667777e	d48b933b-b1c5-4a1b-8f3d-beff03f3751d	/uploads/products/d48b933b-b1c5-4a1b-8f3d-beff03f3751d.webp	\N	t	0	2026-07-19 14:31:17.233
356af06e-5ac9-4b7b-9c11-55f3ea6844e8	d2862041-da7d-4bd6-a2b8-d04cccded51a	/uploads/products/d2862041-da7d-4bd6-a2b8-d04cccded51a.webp	\N	t	0	2026-07-19 14:31:20.707
385e29fe-d680-4abd-ab93-166aafb5f0d7	7c24a04a-ebf6-46dd-9901-b990b1256737	/uploads/products/7c24a04a-ebf6-46dd-9901-b990b1256737.webp	\N	t	0	2026-07-19 14:31:24.663
893deadb-26cd-4438-bb67-098d8019b583	798238eb-5828-4dc2-ab17-9d1cfa155707	/uploads/products/798238eb-5828-4dc2-ab17-9d1cfa155707.webp	\N	t	0	2026-07-19 14:31:28.599
027b77c5-99bb-4df7-a72c-8cc6325c0fa2	eadd89e8-76eb-4100-8697-129659c9d61f	/uploads/products/eadd89e8-76eb-4100-8697-129659c9d61f.webp	\N	t	0	2026-07-19 14:31:32.389
60803a17-801e-44fc-b2d7-ccb3a7a8044f	7bf105e4-aa67-41e6-bb33-307472564c0b	/uploads/products/7bf105e4-aa67-41e6-bb33-307472564c0b.webp	\N	t	0	2026-07-19 14:31:36.082
1d39742d-c749-42b9-9c54-1eb2b37fd04e	f11894e2-357c-4128-89c8-2ac34c71feb6	/uploads/products/f11894e2-357c-4128-89c8-2ac34c71feb6.webp	\N	t	0	2026-07-19 14:31:40.067
37022c30-19d9-4d7a-95e7-749cbf6fad81	5f1d7567-fb6e-4723-8539-5bda84fc358a	/uploads/products/5f1d7567-fb6e-4723-8539-5bda84fc358a.webp	\N	t	0	2026-07-19 14:31:43.875
25929f30-592f-424c-8bff-33d0938c6935	68110403-5d36-468a-a7f2-9fd010036c20	/uploads/products/68110403-5d36-468a-a7f2-9fd010036c20.webp	\N	t	0	2026-07-19 14:31:47.748
6e2ef81c-1659-40d4-9fd5-93b2ebc298fb	ec139ac4-3c74-406b-816b-c347b1f2ad75	/uploads/products/ec139ac4-3c74-406b-816b-c347b1f2ad75.webp	\N	t	0	2026-07-19 14:31:51.435
9f17c06a-d92b-44b4-a6a1-dfd89472e6aa	83116a6a-142c-4b23-930e-65722bf0a07b	/uploads/products/83116a6a-142c-4b23-930e-65722bf0a07b.webp	\N	t	0	2026-07-19 14:31:55.531
1b49854c-ed57-4f76-9b85-c4fec03c2437	590e9aa4-3eea-4831-95ab-c21afee31529	/uploads/products/590e9aa4-3eea-4831-95ab-c21afee31529.webp	\N	t	0	2026-07-19 14:31:58.962
22900e12-d574-4bb8-9130-ff408d9506aa	18139491-0ad4-419d-9dd6-dd23a666d319	/uploads/products/18139491-0ad4-419d-9dd6-dd23a666d319.webp	\N	t	0	2026-07-19 14:32:03.111
2f58e618-484b-4363-8ab7-bb14754db6c4	c44b7b50-00bf-4b45-b82a-a24d0afb72e7	/uploads/products/c44b7b50-00bf-4b45-b82a-a24d0afb72e7.webp	\N	t	0	2026-07-19 14:32:06.795
e8920d43-5c83-48c8-911c-3f4b26a8f94d	4a22f5c8-ec6e-4aab-b1d9-80ee6036ee4c	/uploads/products/4a22f5c8-ec6e-4aab-b1d9-80ee6036ee4c.webp	\N	t	0	2026-07-19 14:32:10.687
73c0539e-e42f-420b-af99-51bb749f0159	70a64667-e3cc-4295-a254-bcf640a0e6af	/uploads/products/70a64667-e3cc-4295-a254-bcf640a0e6af.webp	\N	t	0	2026-07-19 14:32:14.505
008457ae-80cc-4b9c-a302-4843f83dbfff	26084fee-3ad3-4da4-a968-ea106c688060	/uploads/products/26084fee-3ad3-4da4-a968-ea106c688060.webp	\N	t	0	2026-07-19 14:32:18.39
737cdde0-0767-45b9-8228-1ab04e096cfe	86bc3716-45d2-4d17-abd1-870bf8ba319e	/uploads/products/86bc3716-45d2-4d17-abd1-870bf8ba319e.webp	\N	t	0	2026-07-19 14:32:22.463
b8647658-23f6-4cd5-9c92-98831d5e4111	1955b6cf-5a80-4942-9158-f6fa057edb21	/uploads/products/1955b6cf-5a80-4942-9158-f6fa057edb21.webp	\N	t	0	2026-07-19 14:32:26.561
05385294-383c-4a96-a34e-795227d400c4	e3e755d3-1bff-4e3f-ac05-7345f1af1562	/uploads/products/e3e755d3-1bff-4e3f-ac05-7345f1af1562.webp	\N	t	0	2026-07-19 14:32:30.471
38babb9c-c65f-4f2a-baf9-4217ab05849a	ec4d69a7-4074-4ba6-a546-2abfa0a9bac4	/uploads/products/ec4d69a7-4074-4ba6-a546-2abfa0a9bac4.webp	\N	t	0	2026-07-19 14:32:34.508
236a0637-f738-4f5f-925f-3813cca674a9	fe8c5d8c-a21e-4c9f-9e7b-9d57f7470ecf	/uploads/products/fe8c5d8c-a21e-4c9f-9e7b-9d57f7470ecf.webp	\N	t	0	2026-07-19 14:32:38.542
53f8d190-6b1b-4691-bb24-0eae854f893e	c9fbd1bd-4c2a-42af-81c1-dc8b39ae8eb2	/uploads/products/c9fbd1bd-4c2a-42af-81c1-dc8b39ae8eb2.webp	\N	t	0	2026-07-19 14:32:41.963
9ea9cc46-d568-4026-acda-368a8fa57b7d	40c0d3a1-48cf-43c0-b34e-2b240cd76b5b	/uploads/products/40c0d3a1-48cf-43c0-b34e-2b240cd76b5b.webp	\N	t	0	2026-07-19 14:32:45.439
ed844d08-9e86-4267-987c-ec18de4a3091	ccdd4abb-c33f-4d7d-afca-22a5dd296732	/uploads/products/ccdd4abb-c33f-4d7d-afca-22a5dd296732.webp	\N	t	0	2026-07-19 14:32:49.088
b23c6dff-e840-445a-9664-af7c976d138b	9de02cb9-4c91-4e88-8846-dfed0c164ed6	/uploads/products/9de02cb9-4c91-4e88-8846-dfed0c164ed6.webp	\N	t	0	2026-07-19 14:32:52.684
5f511106-f102-4f4e-aa50-7855abbfde2d	6aae35b5-ae16-4a75-bc9f-d6d75a3ea804	/uploads/products/6aae35b5-ae16-4a75-bc9f-d6d75a3ea804.webp	\N	t	0	2026-07-19 14:32:56.555
739cb818-45d7-4362-8e84-05d6391c1937	7670908f-7917-4255-8e6d-26d3f47d859f	/uploads/products/7670908f-7917-4255-8e6d-26d3f47d859f.webp	\N	t	0	2026-07-19 14:33:00.064
8c6cb9ab-2fa8-4fe9-a13e-e7e54ad663ac	00a5a149-1fa5-479f-9d97-2f6736bed2f8	/uploads/products/00a5a149-1fa5-479f-9d97-2f6736bed2f8.webp	\N	t	0	2026-07-19 14:33:03.951
a555b5e0-183d-4696-9bb2-2ac808e5e88d	d865d0cb-37de-443f-9674-fe12eac045cf	/uploads/products/d865d0cb-37de-443f-9674-fe12eac045cf.webp	\N	t	0	2026-07-19 14:33:07.654
9f455356-cff4-4483-9a69-9f68663dfabe	d4913078-04bd-4947-bdd0-e1ed5348dcf4	/uploads/products/d4913078-04bd-4947-bdd0-e1ed5348dcf4.webp	\N	t	0	2026-07-19 14:33:11.73
4267fcf0-6a4d-4e74-8946-188dc7572010	f1abe8c4-7e7c-4039-b6aa-a2a200e93f63	/uploads/products/f1abe8c4-7e7c-4039-b6aa-a2a200e93f63.webp	\N	t	0	2026-07-19 14:33:15.564
8c2766ab-2698-482a-bd31-d150856884cf	7fb0586a-3b27-4739-95ab-ed541c327bec	/uploads/products/7fb0586a-3b27-4739-95ab-ed541c327bec.webp	\N	t	0	2026-07-19 14:33:20.652
e9006dff-0b6c-47cd-b230-7d3f4eccbc1c	0cc2d0a1-fc44-49fe-a751-4ed9acbf843f	/uploads/products/0cc2d0a1-fc44-49fe-a751-4ed9acbf843f.webp	\N	t	0	2026-07-19 14:33:24.085
1ea3fe4b-864d-41bb-ba3d-e837f150becf	e3c7168b-1c5b-403d-a279-4230f2ccdb83	/uploads/products/e3c7168b-1c5b-403d-a279-4230f2ccdb83.webp	\N	t	0	2026-07-19 14:33:27.643
c4a089f8-0462-49a0-a26f-b8a58bfcd993	0c50de65-748d-4d12-8885-296f2c5c7b0b	/uploads/products/0c50de65-748d-4d12-8885-296f2c5c7b0b.webp	\N	t	0	2026-07-19 15:18:37.043
5391c64a-b26e-4e66-a07b-6b51ec67c3f0	0f06ee55-2363-4bad-96fc-64e55d6f8be7	/uploads/products/0f06ee55-2363-4bad-96fc-64e55d6f8be7.webp	\N	t	0	2026-07-19 15:18:37.312
83b13f5a-13df-44e2-9106-830478cf3dd5	3b2eee4a-cede-428c-a508-ddb936d9789b	/uploads/products/3b2eee4a-cede-428c-a508-ddb936d9789b.webp	\N	t	0	2026-07-19 15:18:37.576
bc7b8931-0317-4f73-b556-3ba5b7b9f43d	ff1a0c73-a68a-45f1-bc58-542660d04108	/uploads/products/ff1a0c73-a68a-45f1-bc58-542660d04108.webp	\N	t	0	2026-07-19 15:18:37.85
9c7b901c-e6f9-4a3f-b7a1-c7ca448d0d03	b8f49443-825f-402d-8a87-98df3f13322d	/uploads/products/b8f49443-825f-402d-8a87-98df3f13322d.webp	\N	t	0	2026-07-19 15:18:38.126
e7be2f95-9216-4fc0-bb40-54a3ae37b4a7	27028cb6-61cc-4664-9d15-c39bef00eced	/uploads/products/27028cb6-61cc-4664-9d15-c39bef00eced.webp	\N	t	0	2026-07-19 15:18:38.404
34be4418-4ec5-46d8-9fd6-322d4e682c16	9ab9be03-ca2d-49c0-9e18-a16f15f96d35	/uploads/products/9ab9be03-ca2d-49c0-9e18-a16f15f96d35.webp	\N	t	0	2026-07-19 15:18:38.84
354a498a-c260-4be9-9f25-a538c982c487	6bdbb989-d52c-46ae-9fb6-a7ace9089b6d	/uploads/products/6bdbb989-d52c-46ae-9fb6-a7ace9089b6d.webp	\N	t	0	2026-07-19 15:18:39.347
4875cae7-7fde-490b-89d9-9fd0d1f88afe	ae7bca18-fd4d-4ec3-bb28-3b2734da687b	/uploads/products/ae7bca18-fd4d-4ec3-bb28-3b2734da687b.webp	\N	t	0	2026-07-19 15:18:39.636
0a508383-c909-4f6e-a054-adfb173e66e4	e60a4b7d-e652-4115-9310-04dae4a2f227	/uploads/products/e60a4b7d-e652-4115-9310-04dae4a2f227.webp	\N	t	0	2026-07-19 15:18:39.966
7ece4b0a-1834-4b0a-a1e5-e5f689cffe5a	a1f0ff8c-81d4-48bf-b7c2-bc297b29bab8	/uploads/products/a1f0ff8c-81d4-48bf-b7c2-bc297b29bab8.webp	\N	t	0	2026-07-19 15:18:40.269
c37198ac-b30a-42cd-a560-702cf1e67969	d851ea0e-5b15-48d4-8d3c-c07e0836a988	/uploads/products/d851ea0e-5b15-48d4-8d3c-c07e0836a988.webp	\N	t	0	2026-07-19 15:18:40.584
eb285315-6ba1-433d-a333-2cd02f543a16	0e34cefc-9cc3-4e13-b25a-2a1b01bbd4c2	/uploads/products/0e34cefc-9cc3-4e13-b25a-2a1b01bbd4c2.webp	\N	t	0	2026-07-19 15:18:40.887
6ab95556-02d6-4b21-b68e-883f3ae8a309	fc4e72d9-de13-42f3-a44a-529a89e1e2d4	/uploads/products/fc4e72d9-de13-42f3-a44a-529a89e1e2d4.webp	\N	t	0	2026-07-19 15:18:41.194
\.


--
-- Data for Name: ProductNote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductNote" (id, "productId", "displayOrder", "nameAr", "nameEn", "noteType") FROM stdin;
\.


--
-- Data for Name: ProductVariant; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ProductVariant" (id, "productId", size, sku, price, "compareAt", "isActive", "createdAt", "updatedAt", "usesGlobalPricing") FROM stdin;
0199c780-d1a1-4900-a800-99b521dee4c7	53017bb5-499a-4e04-8e64-d38ecad10cd6	200ml	DHB-0002-200ML	20000	\N	t	2026-07-16 15:00:24.718	2026-07-19 14:01:49.313	t
9f9a180b-3514-40f6-ada9-b75598da3f69	df7b65c9-eb8d-46ee-a00a-fe2312ab53fb	200ml	DHB-0003-200ML	20000	\N	t	2026-07-16 15:00:29.882	2026-07-19 14:01:55.36	t
41a38b85-5183-486e-93e0-7aaf849ee9db	b7e13877-b96e-45b0-bac1-571371854018	200ml	DHB-0004-200ML	20000	\N	t	2026-07-16 15:00:34.699	2026-07-19 14:02:00.991	t
e1116dd3-3136-4df9-80c9-c226cf376d3b	0c50de65-748d-4d12-8885-296f2c5c7b0b	200ml	DHB-0005-200ML	20000	\N	t	2026-07-16 15:00:37.721	2026-07-19 14:02:04.581	t
4d137a9a-904d-4847-93d6-89dd3d50d0bf	0f06ee55-2363-4bad-96fc-64e55d6f8be7	200ml	DHB-0006-200ML	20000	\N	t	2026-07-16 15:00:40.723	2026-07-19 14:02:08.512	t
15a4009d-bd39-4325-9cc3-8ac12156f799	81a26ad3-7d36-484e-90c2-c9674528bd93	200ml	DHB-0007-200ML	20000	\N	t	2026-07-16 15:00:43.997	2026-07-19 14:02:12.509	t
5608be9b-4628-4b0a-b162-264462a6e079	9457ded1-6ca4-4506-947a-835e8cdc38ea	200ml	DHB-0008-200ML	20000	\N	t	2026-07-16 15:00:46.999	2026-07-19 14:02:16.424	t
acefca3b-3aa7-4d98-9079-8cbbd2125557	749a3306-63b0-421e-8157-12afca50f3ef	200ml	DHB-0009-200ML	20000	\N	t	2026-07-16 15:00:50.78	2026-07-19 14:02:21.007	t
ce185a9e-f15a-4233-b33a-8af41df70b5e	d732c139-274b-48d9-8f4b-bf6d776a789c	200ml	DHB-0010-200ML	20000	\N	t	2026-07-16 15:00:54.927	2026-07-19 14:02:24.896	t
6a00df23-e393-40e5-bd57-9c7f22d63b86	3b2eee4a-cede-428c-a508-ddb936d9789b	200ml	DHB-0011-200ML	20000	\N	t	2026-07-16 15:00:58.842	2026-07-19 14:02:30.111	t
da0d2075-ad0e-4766-a7dd-7ee57da08e3d	e5462083-202c-4a22-b9db-c036eb0cf1c9	200ml	DHB-0012-200ML	20000	\N	t	2026-07-16 15:01:02.58	2026-07-19 14:02:34.828	t
77cd0bfb-0aa5-4eca-964f-bdfa92e5517d	ec2e2064-9f20-47c5-873b-399ed108cb6b	50ml	DHB-0174-50ML	8000	\N	t	2026-07-16 15:09:06.834	2026-07-19 14:13:48.947	t
51bd7bd3-6db8-4ddf-b592-3075790b46d1	ba6d90f2-e97e-49ad-b85b-a199a6d64bfe	50ml	DHB-0175-50ML	8000	\N	t	2026-07-16 15:09:09.504	2026-07-19 14:13:53.257	t
d330decf-260e-481c-91fa-a2277cbc802a	7f30029f-092c-4c95-82f5-9a39690b3f4c	50ml	DHB-0176-50ML	8000	\N	t	2026-07-16 15:09:12.156	2026-07-19 14:13:58.638	t
fd70de9a-01cd-49ca-b300-7b35677f7de6	84137263-8a01-4584-affe-6d5035ef1244	50ml	DHB-0177-50ML	8000	\N	t	2026-07-16 15:09:15.439	2026-07-19 14:14:05.648	t
78868a40-866e-4c77-b893-2babcb82ad0e	e5ac8511-2698-40df-8625-d70612e9439a	50ml	DHB-0178-50ML	8000	\N	t	2026-07-16 15:09:18.773	2026-07-19 14:14:11.159	t
3af29dd8-adf2-4bda-8095-3d57d3e92503	2480a1fe-8e81-4efc-9dbc-a995a0025622	50ml	DHB-0179-50ML	8000	\N	t	2026-07-16 15:09:21.485	2026-07-19 14:14:19.881	t
238d0954-e538-4068-a606-1a223964f881	e4bfaa3d-14b9-471d-8e01-d3efa473d74f	200ml	DHB-0332-200ML	20000	\N	t	2026-07-16 15:17:01.919	2026-07-19 14:25:08.642	t
82afe71c-afe2-408a-b115-8bdbb8a414d3	f3843583-d836-44b8-a9cf-edd9eb3ef39a	200ml	DHB-0333-200ML	20000	\N	t	2026-07-16 15:17:05.565	2026-07-19 14:25:13.395	t
e2febff1-1ee1-493a-a61d-0bfa6cc05b3b	8ce290c7-1268-4414-8a17-9c39fe75bdfd	200ml	DHB-0334-200ML	20000	\N	t	2026-07-16 15:17:08.647	2026-07-19 14:25:17.389	t
b640aaee-c965-440c-8cf9-bc6da209e42f	bf87b360-f6e2-49a1-804f-381c7a3367d2	200ml	DHB-0335-200ML	20000	\N	t	2026-07-16 15:17:12.383	2026-07-19 14:25:21.792	t
8b63b1d9-08ab-4235-9dbc-32635ebada47	3e360ffd-8f9f-48af-a987-4a3bb3cc9102	50ml	DHB-0388-50ML	8000	\N	t	2026-07-16 15:20:25.204	2026-07-19 14:28:38.283	t
253badcf-245b-4946-948f-0d7317e5d656	18fe0d89-f42c-4d10-8b5e-39be04ac3fd0	50ml	DHB-0389-50ML	8000	\N	t	2026-07-16 15:20:28.135	2026-07-19 14:28:41.582	t
c04b8a9c-a956-470d-be4a-739eb3f36b15	50db0df3-bac9-4680-988f-dee91ccc20a2	50ml	DHB-0390-50ML	8000	\N	t	2026-07-16 15:20:31.923	2026-07-19 14:28:44.755	t
e5934430-e9a7-46df-8b2e-d8653435a162	d56709d5-6cf8-44a1-b2b8-51e398ded2b6	50ml	DHB-0391-50ML	8000	\N	t	2026-07-16 15:20:34.655	2026-07-19 14:28:47.53	t
3a64a135-b99e-4877-88be-b1dc3a9e7c26	358fa7bd-95ed-470f-b25e-edd42b7691c0	50ml	DHB-0392-50ML	8000	\N	t	2026-07-16 15:20:39.28	2026-07-19 14:28:50.49	t
fb05351c-749b-45f0-a39f-af14c72febf3	ba4a47a1-5195-4b55-ab53-960b38e29435	50ml	DHB-0393-50ML	8000	\N	t	2026-07-16 15:20:42.469	2026-07-19 14:28:53.666	t
a0d1104a-155f-493a-b4e5-0c3b0f084bca	f98acd25-867a-495a-8f2d-bc4bc3ca21f6	50ml	DHB-0394-50ML	8000	\N	t	2026-07-16 15:20:46.162	2026-07-19 14:28:57.205	t
11219cd1-70f6-45cd-b488-5a2f010c9180	26a5b7ba-78af-4733-9d28-16ffa0ed7c14	50ml	DHB-0395-50ML	8000	\N	t	2026-07-16 15:20:50.096	2026-07-19 14:29:00.831	t
c92d0d9f-76db-4317-8850-6e433bd4e9fc	ac55e1ba-d972-45e5-bc02-5f6b62d13b8c	50ml	DHB-0396-50ML	8000	\N	t	2026-07-16 15:20:53.803	2026-07-19 14:29:04.599	t
3f9ce44b-5ecc-433a-ba98-f68d88922a0c	588d6543-eef6-4d84-b019-4d7a8b9fba06	50ml	DHB-0397-50ML	8000	\N	t	2026-07-16 15:20:56.92	2026-07-19 14:29:07.889	t
3b51c4fb-ef43-4974-9771-f8079af3b1e4	ceaf2c6b-9581-4aa3-8bf8-c1a48ebc9c9d	50ml	DHB-0398-50ML	8000	\N	t	2026-07-16 15:21:00.886	2026-07-19 14:29:11.381	t
0e6f6143-d4bb-4ca2-830b-ff528cf215fb	f1abe8c4-7e7c-4039-b6aa-a2a200e93f63	50ml	DHB-0467-50ML	8000	\N	t	2026-07-19 10:28:09.348	2026-07-19 14:33:14.388	t
6fe13938-f192-418e-86a1-0d67a52a344c	f1abe8c4-7e7c-4039-b6aa-a2a200e93f63	100ml	DHB-0467-100ML	12000	\N	t	2026-07-19 10:28:09.348	2026-07-19 14:33:14.657	t
96eddf8b-ed19-4c0f-a370-cd006c8c3fa6	f1abe8c4-7e7c-4039-b6aa-a2a200e93f63	200ml	DHB-0467-200ML	20000	\N	t	2026-07-19 10:28:09.348	2026-07-19 14:33:15.038	t
f0b7a24b-9f4f-4505-a15c-106c3460c4a1	9c969ede-7504-409f-a07a-61f8c2bf1ace	200ml	DHB-0013-200ML	20000	\N	t	2026-07-16 15:01:06.034	2026-07-19 14:02:39.235	t
27856089-b4a2-4cac-98ea-c414f78475f3	a3995d5e-7d74-4485-878e-7cc51d1090bf	100ml	DHB-0026-100ML	12000	\N	t	2026-07-16 15:01:46.574	2026-07-19 14:03:30.138	t
c96a28b3-bc25-495e-b5e6-adc4e9fb3a8f	52ad51f7-28b8-424b-8b33-2ec3540ccf94	200ml	DHB-0052-200ML	20000	\N	t	2026-07-16 15:03:11.135	2026-07-19 14:05:11.855	t
40d3664f-d1e4-4710-b91c-ecdba1e5628d	43d65d7e-b90d-42ca-ae91-8b22a67ab0da	100ml	DHB-0065-100ML	12000	\N	t	2026-07-16 15:03:49.813	2026-07-19 14:06:37.417	t
0c9c9618-a4b8-4219-9c0f-9484889c8c78	4cda3b3d-edf6-4743-9fe2-c97114628d65	100ml	DHB-0074-100ML	12000	\N	t	2026-07-16 15:04:15.854	2026-07-19 14:07:11.75	t
017c1421-159b-475e-b84b-11ddc7dd5543	e10a08bd-b188-4489-af6c-3677266a5acb	200ml	DHB-0336-200ML	20000	\N	t	2026-07-16 15:17:15.761	2026-07-19 14:25:25.99	t
24ff4dc8-258f-4ae9-b0ea-902f71006115	b27bd564-a3ae-40eb-bbda-8e2113fa98e7	200ml	DHB-0337-200ML	20000	\N	t	2026-07-16 15:17:19.062	2026-07-19 14:25:30.437	t
77562326-db0f-48e8-a5b2-5bfa7a241e30	9e99faab-0dc6-4609-9d21-399ad41cbd4c	200ml	DHB-0338-200ML	20000	\N	t	2026-07-16 15:17:22.738	2026-07-19 14:25:35.208	t
c1b85655-bd76-42e2-a67e-9ea6bb3fa786	78f666b8-a54c-41bf-ad88-388edf5fb7cd	200ml	DHB-0340-200ML	20000	\N	t	2026-07-16 15:17:30.658	2026-07-19 14:25:44.322	t
dc3abc43-56c9-4abd-a26b-2eeab893bea9	ce703ce1-3441-4664-ab0c-3927ecd896ee	50ml	DHB-0399-50ML	8000	\N	t	2026-07-16 15:21:04.08	2026-07-19 14:29:14.76	t
4f9ae712-9532-4a71-93bc-9beb3c9c8a4c	7680f8c2-f9ee-4eff-a195-a4e78315d8bc	50ml	DHB-0400-50ML	8000	\N	t	2026-07-16 15:21:07.564	2026-07-19 14:29:18.037	t
78ef438c-4038-49f9-bea4-756b669e5c57	dc2133c5-d8e7-4a0b-b4f4-dd006eb087a9	50ml	DHB-0416-50ML	8000	\N	t	2026-07-16 15:22:01.034	2026-07-19 14:30:10.484	t
9b1e4149-5062-4989-99e5-4596ef4eeac5	0b454968-cf9d-4c1b-abd8-5f3e0f945adc	50ml	DHB-0417-50ML	8000	\N	t	2026-07-16 15:22:05.393	2026-07-19 14:30:14.043	t
2bd06d46-91b8-4553-bcf2-b6baa970d8ea	2ac6555e-0733-4b97-844b-78699d204d4d	50ml	DHB-0418-50ML	8000	\N	t	2026-07-16 15:22:10.511	2026-07-19 14:30:17.329	t
06c24017-8593-450a-8625-bc5823c4897b	f05c2b56-41ba-4ec1-8cc3-9f8f0b1f8607	50ml	DHB-0420-50ML	8000	\N	t	2026-07-16 15:22:17.237	2026-07-19 14:30:23.894	t
96fb851a-0e0b-4b76-ab6e-0de7173be9dc	3efda889-e47d-4e4a-a031-df3cf1959823	50ml	DHB-0421-50ML	8000	\N	t	2026-07-16 15:22:21.049	2026-07-19 14:30:27.177	t
5a7fe76f-53a5-40af-ad7c-265deebade6b	8f5a737b-4122-4e72-b68d-d22363b7f3bb	50ml	DHB-0422-50ML	8000	\N	t	2026-07-16 15:22:24.25	2026-07-19 14:30:30.367	t
bdf4ffdf-8eeb-402b-a7f8-1fc5e7363e5b	ffc9fa3a-300b-4f16-ae34-05217b887280	50ml	DHB-0423-50ML	8000	\N	t	2026-07-16 15:22:27.084	2026-07-19 14:30:33.412	t
23c6852e-bb3f-442c-8d67-30d36da62c7b	f302d48a-6e27-4e81-b46a-725c5024a4a5	50ml	DHB-0424-50ML	8000	\N	t	2026-07-16 15:22:29.797	2026-07-19 14:30:36.105	t
6c64e989-0fb7-46ce-bea8-db3a78c5ddf2	6a0f6f75-6de5-4e9b-863d-d9c7aa5a18f0	50ml	DHB-0425-50ML	8000	\N	t	2026-07-16 15:22:32.821	2026-07-19 14:30:39.176	t
9dbfb743-9ed6-4174-b7eb-c03dc5d089c6	ee04f101-b607-4ee7-81d4-d311d0ab312b	50ml	DHB-0426-50ML	8000	\N	t	2026-07-16 15:22:35.662	2026-07-19 14:30:41.905	t
1c9f1ce3-fb4c-47dd-8926-c710c082c0b8	ff44fb09-7713-4a5f-a831-e3ba2fb1a992	50ml	DHB-0427-50ML	8000	\N	t	2026-07-16 15:22:38.6	2026-07-19 14:30:44.662	t
4ab2ca12-fc5d-49e7-b5c5-2112e5b31804	659df86c-cea1-459c-9e9f-2df775204f2c	50ml	DHB-0428-50ML	8000	\N	t	2026-07-16 15:22:41.398	2026-07-19 14:30:47.458	t
f047c870-3451-440c-9abc-420968a043f1	904ce087-3ae9-49d3-936e-ae6885300c67	50ml	DHB-0429-50ML	8000	\N	t	2026-07-16 15:22:44.14	2026-07-19 14:30:50.6	t
695b8897-56a1-4ec9-bff6-01c5d70ea0ba	8b936488-54bb-4aef-aa2b-9d9fc982a6a1	50ml	DHB-0430-50ML	8000	\N	t	2026-07-16 15:22:47.305	2026-07-19 14:30:54.01	t
c5d3ba66-6aa6-4945-b6dc-3be3f20dd963	10df2330-c31b-454b-8f35-8e4ee05ca445	50ml	DHB-0431-50ML	8000	\N	t	2026-07-16 15:22:49.918	2026-07-19 14:30:56.764	t
945ff488-1289-4e51-b16d-d41c06ce072c	29c9ddae-afd0-4702-9732-c9dd05409ca7	50ml	DHB-0432-50ML	8000	\N	t	2026-07-16 15:22:52.866	2026-07-19 14:31:00.368	t
c703b1e1-8dc9-409c-a29d-a6091c70044f	b6fe8f53-aade-4915-9eff-0e671fa904ae	50ml	DHB-0433-50ML	8000	\N	t	2026-07-16 15:22:55.406	2026-07-19 14:31:04.147	t
a9d4cb5c-0837-41d3-b62f-f8613718e14b	798238eb-5828-4dc2-ab17-9d1cfa155707	50ml	DHB-0439-50ML	8000	\N	t	2026-07-16 15:23:12.978	2026-07-19 14:31:27.371	t
4a8aea30-190b-417f-9916-111c5c51a8d6	eadd89e8-76eb-4100-8697-129659c9d61f	50ml	DHB-0440-50ML	8000	\N	t	2026-07-16 15:23:15.432	2026-07-19 14:31:31.153	t
850ae2e9-df2f-4883-b001-9c5e5ed53cf3	7bf105e4-aa67-41e6-bb33-307472564c0b	50ml	DHB-0441-50ML	8000	\N	t	2026-07-16 15:23:17.988	2026-07-19 14:31:34.828	t
1ff136e3-4264-43db-b007-25916baf1743	7c24a04a-ebf6-46dd-9901-b990b1256737	50ml	DHB-0438-50ML	8000	\N	t	2026-07-16 15:23:10.072	2026-07-19 14:31:23.44	t
425bf7b3-270e-403c-bd59-229232aefb4c	5f1d7567-fb6e-4723-8539-5bda84fc358a	50ml	DHB-0443-50ML	8000	\N	t	2026-07-16 15:23:23.609	2026-07-19 14:31:42.731	t
733e169b-aa83-4ddb-8c63-c54bb9952a80	e4bfaa3d-14b9-471d-8e01-d3efa473d74f	50ml	DHB-0332-50ML	8000	\N	t	2026-07-16 15:17:00.691	2026-07-19 14:25:08.025	t
796669b3-3d2a-4b04-98b3-9695ff4f0ccd	f3843583-d836-44b8-a9cf-edd9eb3ef39a	50ml	DHB-0333-50ML	8000	\N	t	2026-07-16 15:17:05.036	2026-07-19 14:25:12.781	t
67a28ec5-a043-4be2-944e-3d044927a577	53017bb5-499a-4e04-8e64-d38ecad10cd6	50ml	DHB-0002-50ML	8000	\N	t	2026-07-16 15:00:24.167	2026-07-19 14:01:48.749	t
08d98962-8a57-4917-b4a1-4d586b060fb9	df7b65c9-eb8d-46ee-a00a-fe2312ab53fb	50ml	DHB-0003-50ML	8000	\N	t	2026-07-16 15:00:29.347	2026-07-19 14:01:54.741	t
989dc840-de1d-4bcc-87b6-25782fcfb938	e5462083-202c-4a22-b9db-c036eb0cf1c9	50ml	DHB-0012-50ML	8000	\N	t	2026-07-16 15:01:01.951	2026-07-19 14:02:34.008	t
d9bf06be-e45e-4a6a-bc6d-1132cbbddc2a	9c969ede-7504-409f-a07a-61f8c2bf1ace	50ml	DHB-0013-50ML	8000	\N	t	2026-07-16 15:01:05.277	2026-07-19 14:02:38.584	t
aaf944a2-953f-4c4f-a996-3fe7010511ce	86df4db3-9546-458e-812d-987ad735f122	50ml	DHB-0014-50ML	8000	\N	t	2026-07-16 15:01:08.842	2026-07-19 14:02:43.24	t
f8b1400e-bdfc-4f7a-a34c-ebef6ef8e125	ba3c5310-aef4-4e3e-a66d-4beca03968d7	50ml	DHB-0015-50ML	8000	\N	t	2026-07-16 15:01:12.758	2026-07-19 14:02:47.529	t
7556cd75-888f-45b7-8f18-a01f93ed68b2	eb8df122-2c9a-4f22-b82a-0db35ef110be	50ml	DHB-0016-50ML	8000	\N	t	2026-07-16 15:01:15.792	2026-07-19 14:02:52.452	t
70e73098-474c-4fce-89d9-304724dd9662	3a2405e4-1dd2-409e-a24f-49ba13b0b0e6	50ml	DHB-0017-50ML	8000	\N	t	2026-07-16 15:01:18.95	2026-07-19 14:02:56.96	t
1537a42f-edf2-4884-911d-21437619887c	6796549a-4d47-4746-a463-09c282b32182	100ml	DHB-0031-100ML	12000	\N	t	2026-07-16 15:02:03.253	2026-07-19 14:03:49.934	t
6a09c22e-97a9-4705-bbe1-688e58f07492	6796549a-4d47-4746-a463-09c282b32182	200ml	DHB-0031-200ML	20000	\N	t	2026-07-16 15:02:03.559	2026-07-19 14:03:50.219	t
256f241b-2050-4c9e-a367-d649d1eeb0bf	dcf5fdcd-9837-48e8-8335-7a245acd9c37	200ml	DHB-0032-200ML	20000	\N	t	2026-07-16 15:02:06.593	2026-07-19 14:03:53.987	t
072bbd12-a0f4-4c31-8e35-803ee3dc00c4	312a8838-da3b-45cc-afe4-bdb61d487252	200ml	DHB-0033-200ML	20000	\N	t	2026-07-16 15:02:09.661	2026-07-19 14:03:57.581	t
8669ea64-92d4-4c7e-9bd7-74d27360e28b	1fe93fdd-e1f4-4653-be71-8f563d0b566c	200ml	DHB-0034-200ML	20000	\N	t	2026-07-16 15:02:12.945	2026-07-19 14:04:01.875	t
0a957946-1506-4e22-a658-bcb7d36f7fbe	ff492e6a-9f3a-4013-bff9-371914b060e3	200ml	DHB-0035-200ML	20000	\N	t	2026-07-16 15:02:16.691	2026-07-19 14:04:05.486	t
50fc07f1-2d17-4e04-9fc9-4fa7853d862e	9fcfb7f1-4b02-4d85-9d6e-9f6d30050467	200ml	DHB-0091-200ML	20000	\N	t	2026-07-16 15:05:01.895	2026-07-19 14:08:19.079	t
d86eaf54-5a54-47fe-b305-9d79387d9e2d	8ce290c7-1268-4414-8a17-9c39fe75bdfd	50ml	DHB-0334-50ML	8000	\N	t	2026-07-16 15:17:07.944	2026-07-19 14:25:16.774	t
d9c243b8-101f-4a1b-9de7-2d56ffb62036	bf87b360-f6e2-49a1-804f-381c7a3367d2	50ml	DHB-0335-50ML	8000	\N	t	2026-07-16 15:17:11.422	2026-07-19 14:25:21.083	t
728e0c35-493b-4f8a-9859-b62418113efc	e10a08bd-b188-4489-af6c-3677266a5acb	50ml	DHB-0336-50ML	8000	\N	t	2026-07-16 15:17:15.202	2026-07-19 14:25:25.376	t
a3add144-406a-4371-8907-55f65e54b485	326bb60b-6441-44f8-9f10-9774e0d96ddc	100ml	DHB-0339-100ML	12000	\N	t	2026-07-16 15:17:25.575	2026-07-19 14:25:39.138	t
1648b4d8-5cd6-4d27-8895-2bac470cd373	326bb60b-6441-44f8-9f10-9774e0d96ddc	200ml	DHB-0339-200ML	20000	\N	t	2026-07-16 15:17:25.91	2026-07-19 14:25:39.643	t
656f8cc7-8144-4710-8d0a-a94816a480b2	14938ed6-4005-40da-a871-134ce00c28cb	200ml	DHB-0343-200ML	20000	\N	t	2026-07-16 15:17:42.917	2026-07-19 14:25:57.282	t
0e669cf2-5661-4013-be56-29ad554ff30a	0c254ff6-8827-4179-b1c5-6b8d10c324c5	100ml	DHB-0344-100ML	12000	\N	t	2026-07-16 15:17:45.894	2026-07-19 14:26:01.048	t
7504d1dd-be5a-4267-9ea8-a2396578dfb8	80016815-b549-4dbd-9882-1d23e036b880	100ml	DHB-0346-100ML	12000	\N	t	2026-07-16 15:17:53.284	2026-07-19 14:26:09.889	t
c1cb6748-8cca-4e78-8ad9-86ed6eaeb53c	e2ff5d78-74e7-4bdf-be25-08804796ca26	50ml	DHB-0434-50ML	8000	\N	t	2026-07-16 15:22:58.293	2026-07-19 14:31:08.222	t
32170785-1871-4d43-8fac-cd711c1f0515	db23f5a3-26c4-42ed-b209-9c884e21b45d	50ml	DHB-0435-50ML	8000	\N	t	2026-07-16 15:23:01.15	2026-07-19 14:31:12.011	t
4f1bba7e-6e67-43d2-be50-5c7317795f0d	d48b933b-b1c5-4a1b-8f3d-beff03f3751d	50ml	DHB-0436-50ML	8000	\N	t	2026-07-16 15:23:04.135	2026-07-19 14:31:16.004	t
020df4b0-5292-4a0b-9f3d-55277cc1d381	d2862041-da7d-4bd6-a2b8-d04cccded51a	50ml	DHB-0437-50ML	8000	\N	t	2026-07-16 15:23:07.086	2026-07-19 14:31:19.452	t
cc293cf1-f952-47b6-a0b1-c5be054f1a3b	d578595b-6705-491f-ba0d-31b5f82f2872	50ml	DHB-0018-50ML	8000	\N	t	2026-07-16 15:01:21.946	2026-07-19 14:03:00.584	t
f1c0675e-e0cd-4c5f-94d0-7a03c8ac93fe	e3b4b7f4-c601-4482-8935-319780b2b08a	50ml	DHB-0019-50ML	8000	\N	t	2026-07-16 15:01:25.031	2026-07-19 14:03:04.135	t
e8a7b03e-3e2e-423f-92fe-1aa9cb5f5b94	23d36c92-f6d1-424b-a130-eff65b3470a5	50ml	DHB-0020-50ML	8000	\N	t	2026-07-16 15:01:28.267	2026-07-19 14:03:08.198	t
c00a07e4-3454-4f58-a20f-2d8242796bfa	a8a9664b-20ea-4c42-a1ab-4a428fc294b4	50ml	DHB-0021-50ML	8000	\N	t	2026-07-16 15:01:31.266	2026-07-19 14:03:11.801	t
7c4d3c77-5928-4ea0-a864-a467e75b16ac	067b8a8b-6ed6-4401-b45c-351cad2d7ddb	50ml	DHB-0022-50ML	8000	\N	t	2026-07-16 15:01:34.288	2026-07-19 14:03:15.378	t
e935fcda-e19c-4a4f-834d-37fbf4b7ea47	044315ac-09de-4042-bab6-b234ed0f310c	50ml	DHB-0023-50ML	8000	\N	t	2026-07-16 15:01:37.27	2026-07-19 14:03:18.981	t
a81fc7bc-1066-40d7-9500-80b7f085fe52	280fb2cf-d23f-49bb-a9ec-606c342c0599	50ml	DHB-0024-50ML	8000	\N	t	2026-07-16 15:01:40.252	2026-07-19 14:03:22.667	t
5a6ba1d2-d198-4b69-b1ef-e39e4def5078	c4172c9e-75b5-4946-8832-deea55117532	50ml	DHB-0025-50ML	8000	\N	t	2026-07-16 15:01:43.258	2026-07-19 14:03:26.203	t
d282ea74-bd8e-44c1-b32a-564836f01f8a	a3995d5e-7d74-4485-878e-7cc51d1090bf	50ml	DHB-0026-50ML	8000	\N	t	2026-07-16 15:01:46.29	2026-07-19 14:03:29.874	t
142ae06d-2dd2-4253-a9d4-8436c1017f97	055fa60c-9764-45b3-8d78-2737f584df4d	50ml	DHB-0027-50ML	8000	\N	t	2026-07-16 15:01:49.013	2026-07-19 14:03:33.514	t
84dd798e-e5df-49c9-a518-d0c0fe9e8fd1	4621d0cd-1f1f-4401-8682-ce3d8eca0422	50ml	DHB-0028-50ML	8000	\N	t	2026-07-16 15:01:51.592	2026-07-19 14:03:37.398	t
22a09867-2921-43d6-a955-4d0fd29cc876	36b5c8eb-cbbd-498b-8565-a70a5f0a525f	50ml	DHB-0029-50ML	8000	\N	t	2026-07-16 15:01:54.441	2026-07-19 14:03:41.346	t
35deb906-e05e-4cf9-9367-a63745b4f84c	67e8a831-9640-4800-9594-271fd03cf74c	50ml	DHB-0030-50ML	8000	\N	t	2026-07-16 15:01:58.558	2026-07-19 14:03:45.695	t
102ca84d-8559-4d57-a253-789d78eeb45d	6796549a-4d47-4746-a463-09c282b32182	50ml	DHB-0031-50ML	8000	\N	t	2026-07-16 15:02:02.986	2026-07-19 14:03:49.604	t
b72b1ae5-fad2-4cca-a5dd-af2b7ffa01db	dcf5fdcd-9837-48e8-8335-7a245acd9c37	50ml	DHB-0032-50ML	8000	\N	t	2026-07-16 15:02:06.053	2026-07-19 14:03:53.382	t
8750697c-b9e9-49e7-bbd3-20b3457e7e0b	312a8838-da3b-45cc-afe4-bdb61d487252	50ml	DHB-0033-50ML	8000	\N	t	2026-07-16 15:02:09.073	2026-07-19 14:03:56.958	t
3864a3c8-ba85-410a-84b8-4b575f999287	1fe93fdd-e1f4-4653-be71-8f563d0b566c	50ml	DHB-0034-50ML	8000	\N	t	2026-07-16 15:02:12.367	2026-07-19 14:04:01.265	t
e4877b65-36d0-4f5e-8b76-4809c6ae077f	ff492e6a-9f3a-4013-bff9-371914b060e3	50ml	DHB-0035-50ML	8000	\N	t	2026-07-16 15:02:16.154	2026-07-19 14:04:04.966	t
2b8477b0-d814-4d00-b11f-684b871e0097	ba8a5af6-892c-4fc3-99db-d04e3e3fc452	50ml	DHB-0036-50ML	8000	\N	t	2026-07-16 15:02:19.168	2026-07-19 14:04:08.442	t
07c30822-737e-48b6-ba94-eb2ce4d45d41	397115ec-f4e5-4414-839b-67d8aaf0d3be	50ml	DHB-0037-50ML	8000	\N	t	2026-07-16 15:02:23.244	2026-07-19 14:04:12.441	t
f11e57e6-b702-45dd-83fd-3a8e70dee11f	3efc65e3-0315-47e4-aaa4-f3979b8d3a7b	50ml	DHB-0038-50ML	8000	\N	t	2026-07-16 15:02:27.701	2026-07-19 14:04:16.313	t
8c4281ff-78e9-4599-a615-dda2a19f755e	81de114f-b777-47a6-bcf5-e330ca90337b	50ml	DHB-0039-50ML	8000	\N	t	2026-07-16 15:02:32.23	2026-07-19 14:04:20.104	t
4e512c51-b427-4903-889b-64be54e73333	2871ddbb-2671-4d9a-9dd7-5202d2e81e7f	100ml	DHB-0100-100ML	12000	\N	t	2026-07-16 15:05:27.657	2026-07-19 14:08:50.977	t
99395cac-cad7-438c-89f3-fd46f4f592a9	2aecd3d7-0c14-40fc-9a02-5aa742da6901	200ml	DHB-0113-200ML	20000	\N	t	2026-07-16 15:06:08.682	2026-07-19 14:09:41.306	t
ce798491-727e-4e3e-882e-dbec1dd7002f	4ba18694-2e09-413d-9406-9050f623540f	100ml	DHB-0117-100ML	12000	\N	t	2026-07-16 15:06:18.892	2026-07-19 14:09:55.226	t
3722ce9f-a63c-4994-8629-ac37237b294c	0c254ff6-8827-4179-b1c5-6b8d10c324c5	200ml	DHB-0344-200ML	20000	\N	t	2026-07-16 15:17:46.283	2026-07-19 14:26:01.316	t
7d140501-8b17-4322-8c09-566d26a1d588	479e2fc2-7ca0-49bd-a203-537b70bbd22f	200ml	DHB-0345-200ML	20000	\N	t	2026-07-16 15:17:50.233	2026-07-19 14:26:06.031	t
6a607fad-9c47-474d-9cdf-e6d971e77526	80016815-b549-4dbd-9882-1d23e036b880	200ml	DHB-0346-200ML	20000	\N	t	2026-07-16 15:17:53.547	2026-07-19 14:26:10.251	t
3f110d8d-7518-464a-bad8-196d429bc80d	3c7d1aeb-77a7-460e-b9cf-87b79db7a38b	200ml	DHB-0348-200ML	20000	\N	t	2026-07-16 15:17:59.678	2026-07-19 14:26:17.648	t
8d56d4df-1d89-436f-b62b-e39b2a6346ae	035a49c9-3768-457d-aff4-9e2b206026d2	50ml	DHB-0040-50ML	8000	\N	t	2026-07-16 15:02:35.345	2026-07-19 14:04:23.859	t
9eeb0970-0777-421e-9ffb-929cbb9f9292	4bb8b556-298d-4ca8-ae89-102b6665d712	50ml	DHB-0041-50ML	8000	\N	t	2026-07-16 15:02:38.125	2026-07-19 14:04:27.684	t
230c0b22-641c-440f-b388-949f0abe6ff9	88b9c3ea-f9aa-44a8-aa88-1d2dfa87051c	50ml	DHB-0042-50ML	8000	\N	t	2026-07-16 15:02:41.168	2026-07-19 14:04:31.775	t
641c53ae-9b25-413d-9c25-73a66d358119	1080ddd7-489b-4716-9004-190708d9493e	200ml	DHB-0214-200ML	20000	\N	t	2026-07-16 15:11:01.591	2026-07-19 14:17:12.528	t
5568aa8e-0c75-416e-9dc1-482d85c9909a	2b8a4d23-039b-4e32-a1e6-f8e28728733c	200ml	DHB-0226-200ML	20000	\N	t	2026-07-16 15:11:36.785	2026-07-19 14:18:11.399	t
ec0d775a-8626-49be-a93b-983f816cd224	b1b782a4-1c73-42fc-a864-120b7dcdb6d6	100ml	DHB-0255-100ML	12000	\N	t	2026-07-16 15:13:03.593	2026-07-19 14:20:05.829	t
a5629bea-4771-4a39-8db2-be7a1f8e806f	38976821-8d3a-45f6-9ead-9da7672e60ff	50ml	DHB-0043-50ML	8000	\N	t	2026-07-16 15:02:44.27	2026-07-19 14:04:35.567	t
e7d55024-68fa-424b-abc2-cb71bdb86df1	e850daba-9bef-4315-a514-27cb52d08d12	50ml	DHB-0044-50ML	8000	\N	t	2026-07-16 15:02:47.499	2026-07-19 14:04:39.661	t
200f133d-dea3-4347-a165-e728c0158cbe	723e5cc1-fc70-499a-9dd3-6a3b6656e95c	50ml	DHB-0045-50ML	8000	\N	t	2026-07-16 15:02:50.481	2026-07-19 14:04:42.937	t
ec59e466-c85d-4cf5-9902-3041d7aa329b	44ea09e5-6635-4b8c-bb71-e8c3170a869b	50ml	DHB-0046-50ML	8000	\N	t	2026-07-16 15:02:53.516	2026-07-19 14:04:46.794	t
b0a77097-59d0-4d5d-b6fa-b1ad10c7a97c	c7b5b7e5-cdd5-45e5-bb69-63cfefed4251	50ml	DHB-0047-50ML	8000	\N	t	2026-07-16 15:02:56.16	2026-07-19 14:04:50.211	t
89a9d65c-3448-4e54-906d-83634e5a7257	4f50b3a7-eb39-4495-8a2c-9d0ef9131f00	50ml	DHB-0048-50ML	8000	\N	t	2026-07-16 15:02:59.191	2026-07-19 14:04:53.957	t
21fd4894-adc2-481d-ba1b-2a91343d8c61	1e4ba0bb-3695-44f6-a6e6-05b27af98c82	200ml	DHB-0049-200ML	20000	\N	t	2026-07-16 15:03:02.531	2026-07-19 14:04:57.817	t
45df1f88-f7ea-495f-80a0-cc197651a8d8	6ebeb9b9-bb1e-4aae-a2c0-5b29b3294b12	200ml	DHB-0050-200ML	20000	\N	t	2026-07-16 15:03:05.465	2026-07-19 14:05:01.96	t
770f65c8-95a2-41ea-bcd6-3c6332b4b00c	fb9b2e8f-1669-4904-a271-c7645985fbe6	200ml	DHB-0051-200ML	20000	\N	t	2026-07-16 15:03:08.435	2026-07-19 14:05:08.231	t
f896362f-1dbe-40d6-ac8f-c4c7577bc2b0	4ff689b4-a6fa-4912-aeb6-4f230ff633a3	100ml	DHB-0128-100ML	12000	\N	t	2026-07-16 15:06:53.55	2026-07-19 14:10:36.209	t
155fbe83-4afa-47df-952e-dc01f0c5b902	b6d4d2c2-184e-411a-a953-31b8a48f13d5	200ml	DHB-0147-200ML	20000	\N	t	2026-07-16 15:07:47.218	2026-07-19 14:12:02.45	t
1e44d62f-2c71-4865-80d4-6bfddf01c01c	d5eee1e4-a2d3-4ee6-b859-3f86e722d166	100ml	DHB-0163-100ML	12000	\N	t	2026-07-16 15:08:33.846	2026-07-19 14:13:04.708	t
12c11844-4989-433b-9277-026a2fffc247	4e9f33ef-4565-4855-b62d-5cf3c43145cc	200ml	DHB-0360-200ML	20000	\N	t	2026-07-16 15:18:43.987	2026-07-19 14:27:03.07	t
ee5937e5-75b5-4afd-8f27-6eafa80cb5c1	2480a1fe-8e81-4efc-9dbc-a995a0025622	200ml	DHB-0179-200ML	20000	\N	t	2026-07-16 15:09:22.041	2026-07-19 14:14:20.499	t
30d797d2-c11d-42e3-ad4e-075a320855b3	6710dad2-5d74-4fdd-b8b6-1cba5b41700d	200ml	DHB-0361-200ML	20000	\N	t	2026-07-16 15:18:46.875	2026-07-19 14:27:06.543	t
970dd3ef-8c4e-4725-9e73-8867fd126091	12a3d9a1-c44e-4fdf-aaf8-4eec621794b8	200ml	DHB-0278-200ML	20000	\N	t	2026-07-16 15:14:11.945	2026-07-19 14:21:36.107	t
45663927-e896-4679-ab1d-e154c40e4d5a	0a75d486-578f-4ff3-9d36-7f6f8dab6580	200ml	DHB-0362-200ML	20000	\N	t	2026-07-16 15:18:49.753	2026-07-19 14:27:09.957	t
679c2bf2-a4ac-4153-a3e1-e691c334c916	2a992096-8c7a-41dd-98a7-2687949b3154	100ml	DHB-0289-100ML	12000	\N	t	2026-07-16 15:14:44.672	2026-07-19 14:22:19.779	t
8f3b68d3-09c0-4ab0-943f-c1cba02a5723	9bc5ebc2-2d14-4cac-995a-f68644aa470f	200ml	DHB-0363-200ML	20000	\N	t	2026-07-16 15:18:53.558	2026-07-19 14:27:13.308	t
dfc7dbf0-55c2-4d28-b280-fbf1c0b15519	4842b000-f95f-41e2-a84c-1ed94570969a	100ml	DHB-0304-100ML	12000	\N	t	2026-07-16 15:15:29.831	2026-07-19 14:23:17.893	t
11dc9095-8acc-434a-9420-41f837b4ee9e	e049d23f-ffcb-492a-b8c8-b3c85cdf904f	200ml	DHB-0364-200ML	20000	\N	t	2026-07-16 15:18:58.472	2026-07-19 14:27:17.61	t
1ac837f8-06c7-4987-ab35-a0edd1ba9d79	e9580454-bcd2-48f6-bfe5-8bebfd8bfe5f	200ml	DHB-0365-200ML	20000	\N	t	2026-07-16 15:19:02.046	2026-07-19 14:27:20.879	t
3ae31fbe-b88c-4842-ae80-486016e6ec10	d373522a-ee6a-4a93-82c3-d097101bd6db	200ml	DHB-0366-200ML	20000	\N	t	2026-07-16 15:19:05.213	2026-07-19 14:27:24.426	t
878482ef-e4ea-45b4-bfd0-cecb0864fbb0	abfdfdef-4e7e-4c38-968c-f4d88d5d0ff4	200ml	DHB-0367-200ML	20000	\N	t	2026-07-16 15:19:08.975	2026-07-19 14:27:28.054	t
a8d5b9a2-d097-40eb-80f4-0cc8be532d02	43383ca1-daab-4dd3-8e8d-784a7414bf57	200ml	DHB-0368-200ML	20000	\N	t	2026-07-16 15:19:13.284	2026-07-19 14:27:31.331	t
7666e2e5-ff1e-401b-9a41-d8993f294823	e80beb5a-00f2-4ed2-8a1e-ea66794da288	200ml	DHB-0369-200ML	20000	\N	t	2026-07-16 15:19:17.029	2026-07-19 14:27:35.095	t
3b6c2cbf-8263-4a08-b455-64939a2e0890	76783e87-3b7f-410f-8560-13535cbd0431	200ml	DHB-0370-200ML	20000	\N	t	2026-07-16 15:19:20.268	2026-07-19 14:27:38.194	t
80963a23-bd19-434d-a3a0-4db5b66db79e	0d0b6b8d-4567-47be-840d-933fe96498cf	100ml	DHB-0379-100ML	12000	\N	t	2026-07-16 15:19:52.801	2026-07-19 14:28:09.44	t
53542841-7b5f-45a1-9903-80c096f7531e	f11894e2-357c-4128-89c8-2ac34c71feb6	50ml	DHB-0442-50ML	8000	\N	t	2026-07-16 15:23:20.704	2026-07-19 14:31:38.84	t
dbb98dc2-bdf3-4afc-bbf6-d0c140fc778b	bbb3ffcf-bcd3-4f09-b9f8-77b881cb4668	100ml	DHB-0310-100ML	12000	\N	t	2026-07-16 15:15:47.955	2026-07-19 14:23:41.026	t
97ddd230-d4a1-4355-9259-aa1470cf2fb2	8b55a19f-45fc-4ff4-9116-af1f72f737e1	50ml	DHB-0313-50ML	8000	\N	t	2026-07-16 15:15:57.001	2026-07-19 14:23:53.008	t
212ee6bd-719b-4620-bfaa-92d3285e93c1	c67a4772-cded-4c6c-bd23-921fbc166095	50ml	DHB-0314-50ML	8000	\N	t	2026-07-16 15:16:00.826	2026-07-19 14:23:57.441	t
3abd4365-49c5-49c9-96fa-448f902a42ae	fd9d9682-64a3-49e0-aebe-546de7ee7c13	50ml	DHB-0328-50ML	8000	\N	t	2026-07-16 15:16:47.36	2026-07-19 14:24:51.842	t
b2b585a3-81c4-4464-84a2-64da4ab429fa	0b34e06a-42aa-4a0a-9560-2065ea434cc4	50ml	DHB-0329-50ML	8000	\N	t	2026-07-16 15:16:51.068	2026-07-19 14:24:55.816	t
0a3f0075-94d2-4872-9ebb-ffe1bb089c0d	3e2aeceb-01db-4847-b55e-c63f32b49f34	50ml	DHB-0330-50ML	8000	\N	t	2026-07-16 15:16:54.276	2026-07-19 14:25:00.135	t
88cb75cd-1914-4d78-9a31-1e3ddc1f615e	ea1b54d1-f3ad-4de4-9d3d-2a14af415cad	50ml	DHB-0331-50ML	8000	\N	t	2026-07-16 15:16:57.09	2026-07-19 14:25:04.498	t
9b4b1c56-d8a1-4501-8174-0c988b397363	05f759bd-1f4f-4c05-a48c-8a2254e4e6b0	200ml	DHB-0358-200ML	20000	\N	t	2026-07-16 15:18:37.244	2026-07-19 14:26:56.414	t
39e823c4-1a87-48da-987b-4bd96d395868	d506b07e-7e0c-48f6-90cc-85cb01c1dfcf	200ml	DHB-0359-200ML	20000	\N	t	2026-07-16 15:18:40.914	2026-07-19 14:26:59.691	t
2dacc819-f648-4a03-995e-820f0c14e0a0	f302d48a-6e27-4e81-b46a-725c5024a4a5	100ml	DHB-0424-100ML	12000	\N	t	2026-07-16 15:22:30.09	2026-07-19 14:30:36.368	t
6b92b4ed-ee91-48c2-9520-3c2d1947f509	85d4b481-27a7-40b3-a1ec-cd3395a97194	200ml	DHB-0349-200ML	20000	\N	t	2026-07-16 15:18:03.053	2026-07-19 14:26:21.549	t
cc8a6f19-840a-42ac-8850-8c2e2e03b45c	b7e13877-b96e-45b0-bac1-571371854018	50ml	DHB-0004-50ML	8000	\N	t	2026-07-16 15:00:34.147	2026-07-19 14:02:00.463	t
dabbd996-6afc-4e25-b1c9-8b14123885ee	cfab21bb-400c-4884-aba9-a08668026a8c	200ml	DHB-0352-200ML	20000	\N	t	2026-07-16 15:18:12.994	2026-07-19 14:26:33.78	t
13d99201-0384-4163-80a3-1fffa0bdbda6	0c50de65-748d-4d12-8885-296f2c5c7b0b	50ml	DHB-0005-50ML	8000	\N	t	2026-07-16 15:00:37.164	2026-07-19 14:02:04.059	t
6b120b7e-4949-4112-9939-2ffa1d616ad4	daa86be6-7e10-4c4f-80d6-38bdd01adc39	200ml	DHB-0353-200ML	20000	\N	t	2026-07-16 15:18:16.518	2026-07-19 14:26:37.673	t
943130fa-917b-422f-9208-712e2b354661	cdff64c6-23d9-4f6b-8a82-597f9fe21252	200ml	DHB-0357-200ML	20000	\N	t	2026-07-16 15:18:34.257	2026-07-19 14:26:52.827	t
f41528a4-d3e1-4fbb-b915-0f85e2d8f9c5	0f06ee55-2363-4bad-96fc-64e55d6f8be7	50ml	DHB-0006-50ML	8000	\N	t	2026-07-16 15:00:40.175	2026-07-19 14:02:07.878	t
4c653b50-574f-41e4-bec3-80e39bfde304	68110403-5d36-468a-a7f2-9fd010036c20	50ml	DHB-0444-50ML	8000	\N	t	2026-07-16 15:23:26.363	2026-07-19 14:31:46.478	t
fb81d133-3443-4070-b266-5ade75272a19	81a26ad3-7d36-484e-90c2-c9674528bd93	50ml	DHB-0007-50ML	8000	\N	t	2026-07-16 15:00:43.459	2026-07-19 14:02:11.789	t
3074661b-f1bd-49c3-9c63-c612354a1782	ec139ac4-3c74-406b-816b-c347b1f2ad75	50ml	DHB-0445-50ML	8000	\N	t	2026-07-16 15:23:29.601	2026-07-19 14:31:50.221	t
55046b99-1554-47d0-880c-942367eec7c4	9457ded1-6ca4-4506-947a-835e8cdc38ea	50ml	DHB-0008-50ML	8000	\N	t	2026-07-16 15:00:46.451	2026-07-19 14:02:15.834	t
bb6c0e91-0f56-40f3-9a8a-a0f5b024fe2a	749a3306-63b0-421e-8157-12afca50f3ef	50ml	DHB-0009-50ML	8000	\N	t	2026-07-16 15:00:50.244	2026-07-19 14:02:20.398	t
c2b81636-0b4c-41dd-a05f-301fe0bcd9c6	96d43657-16d4-4e26-90e8-c2646ed26442	50ml	DHB-0315-50ML	8000	\N	t	2026-07-16 15:16:04.974	2026-07-19 14:24:01.934	t
01fecb65-0317-4142-a428-e49d8929debb	40f16b29-f1e3-44aa-a386-08afa2d89ae3	50ml	DHB-0316-50ML	8000	\N	t	2026-07-16 15:16:08.016	2026-07-19 14:24:05.867	t
6fb162d7-4b2b-4780-b6fb-2921d5a3798d	b5d2d725-99d0-443b-8573-24461844148c	50ml	DHB-0317-50ML	8000	\N	t	2026-07-16 15:16:10.781	2026-07-19 14:24:09.777	t
881a55b9-823a-4c35-bd50-ce997ff59751	2e5599dd-7b40-4ce7-a114-8cd24c9a4b70	50ml	DHB-0318-50ML	8000	\N	t	2026-07-16 15:16:15.631	2026-07-19 14:24:13.684	t
7f847c8e-98e7-4726-9c26-aa34b2a7a225	8feb25c6-e728-4e24-b303-8defd279762b	50ml	DHB-0319-50ML	8000	\N	t	2026-07-16 15:16:19.293	2026-07-19 14:24:17.244	t
640c39c8-d42f-4261-b02d-9dc4a9a9c5d8	e1bb7c06-78d1-4a29-9862-59271f078511	50ml	DHB-0320-50ML	8000	\N	t	2026-07-16 15:16:22.276	2026-07-19 14:24:20.864	t
9508c3ab-6f46-4745-bc00-9a61f9e60267	c91f8af4-a006-4018-8c6b-2e4b1773cc62	50ml	DHB-0321-50ML	8000	\N	t	2026-07-16 15:16:25.269	2026-07-19 14:24:24.31	t
95105176-1a63-4d73-ba42-3608f112a733	59b41a3b-fd13-4878-80c5-08012a9446eb	50ml	DHB-0322-50ML	8000	\N	t	2026-07-16 15:16:29.261	2026-07-19 14:24:28.718	t
37dc30da-ec27-407c-9087-4bed338edec6	f42e1ed8-624f-43e1-b3e7-ab7b2de15f4c	50ml	DHB-0323-50ML	8000	\N	t	2026-07-16 15:16:32.94	2026-07-19 14:24:32.645	t
9c863919-2f1d-4783-980c-0088c452722b	83116a6a-142c-4b23-930e-65722bf0a07b	50ml	DHB-0446-50ML	8000	\N	t	2026-07-16 15:23:33.023	2026-07-19 14:31:54.2	t
e1f4b97a-f403-4b26-a6c6-c9de59657341	d69f3606-a366-4aa1-aa3a-1dfc81dfe501	50ml	DHB-0326-50ML	8000	\N	t	2026-07-16 15:16:42.037	2026-07-19 14:24:44.369	t
9a7c3d5f-92b3-4840-82f9-308abe039bf1	e2c598d0-97e7-43b4-b51d-16f04be0cc13	100ml	DHB-0347-100ML	12000	\N	t	2026-07-16 15:17:56.045	2026-07-19 14:26:13.764	t
a6910c89-3a79-485c-bb27-60dbdc68a083	e2c598d0-97e7-43b4-b51d-16f04be0cc13	200ml	DHB-0347-200ML	20000	\N	t	2026-07-16 15:17:56.722	2026-07-19 14:26:14.026	t
e71df601-f5f8-4878-b8c8-02dbfff34601	590e9aa4-3eea-4831-95ab-c21afee31529	50ml	DHB-0447-50ML	8000	\N	t	2026-07-16 15:23:35.877	2026-07-19 14:31:57.803	t
976b696d-ce23-46c9-b7bc-e4f5a419e91e	18139491-0ad4-419d-9dd6-dd23a666d319	50ml	DHB-0448-50ML	8000	\N	t	2026-07-16 15:23:39.041	2026-07-19 14:32:01.88	t
f0aa3cfb-9b8b-48b8-a713-a2a7ca7e67e8	bfe66f71-0b3f-48d6-ae17-3579fa5955d2	200ml	DHB-0354-200ML	20000	\N	t	2026-07-16 15:18:21.925	2026-07-19 14:26:41.848	t
f1ac61d4-119f-486e-ae50-fc6e9f0a27e8	e247941c-13bb-4492-b6aa-5d2ffb4a9697	100ml	DHB-0355-100ML	12000	\N	t	2026-07-16 15:18:25.962	2026-07-19 14:26:45.918	t
5d43268f-fa3d-4c50-a3c0-77cdd689c535	e247941c-13bb-4492-b6aa-5d2ffb4a9697	200ml	DHB-0355-200ML	20000	\N	t	2026-07-16 15:18:27.019	2026-07-19 14:26:46.177	t
0fdd4777-98ad-4407-b660-69af47606345	ed9289e2-1605-4b32-882a-13022ad8d23f	100ml	DHB-0356-100ML	12000	\N	t	2026-07-16 15:18:29.928	2026-07-19 14:26:49.207	t
b0596534-ac24-4f65-8523-7edb304f0364	ed9289e2-1605-4b32-882a-13022ad8d23f	200ml	DHB-0356-200ML	20000	\N	t	2026-07-16 15:18:30.466	2026-07-19 14:26:49.567	t
be130bc4-685b-43de-a528-a0a6d43818bd	d732c139-274b-48d9-8f4b-bf6d776a789c	50ml	DHB-0010-50ML	8000	\N	t	2026-07-16 15:00:54.193	2026-07-19 14:02:24.28	t
38711b9f-dc3a-4ca9-aade-e5c4db294021	c44b7b50-00bf-4b45-b82a-a24d0afb72e7	50ml	DHB-0449-50ML	8000	\N	t	2026-07-16 15:23:42.123	2026-07-19 14:32:05.57	t
24c0abde-8f58-4a04-9ba7-075b7fac2c38	3b2eee4a-cede-428c-a508-ddb936d9789b	50ml	DHB-0011-50ML	8000	\N	t	2026-07-16 15:00:58.137	2026-07-19 14:02:29.31	t
137d51bf-ea06-4152-b308-a5fd8e7e9f76	4a22f5c8-ec6e-4aab-b1d9-80ee6036ee4c	50ml	DHB-0450-50ML	8000	\N	t	2026-07-16 15:23:45.082	2026-07-19 14:32:09.458	t
21deecde-9d12-4ac9-ab2e-7e73fc204c44	70a64667-e3cc-4295-a254-bcf640a0e6af	50ml	DHB-0451-50ML	8000	\N	t	2026-07-16 15:23:48.473	2026-07-19 14:32:13.328	t
99a6d35b-981f-498d-8b84-e6d55d8ea53f	52ad51f7-28b8-424b-8b33-2ec3540ccf94	50ml	DHB-0052-50ML	8000	\N	t	2026-07-16 15:03:10.59	2026-07-19 14:05:11.334	t
785acac0-c39b-49d8-a166-aa82e373b32f	a74a511c-771a-4ced-ba3b-7b100ac108d2	50ml	DHB-0053-50ML	8000	\N	t	2026-07-16 15:03:13.698	2026-07-19 14:05:14.99	t
3da592b2-e200-4ce1-bac7-3552a4c95b77	ba802919-7fce-4546-a59b-14bd0460b0d0	50ml	DHB-0054-50ML	8000	\N	t	2026-07-16 15:03:16.393	2026-07-19 14:05:22.016	t
111025ae-575a-46a6-a1e9-c3af9d0843cf	2f20daca-1e33-43e9-bfce-5f462f9aad1f	50ml	DHB-0055-50ML	8000	\N	t	2026-07-16 15:03:19.317	2026-07-19 14:05:34.286	t
22359d63-7181-4ffb-9afd-66ba94af87f1	ce4d51f0-433e-460a-a208-621c3e8f4b19	50ml	DHB-0056-50ML	8000	\N	t	2026-07-16 15:03:22.479	2026-07-19 14:05:41.548	t
a248c1bf-144e-4ad3-92e6-08919cb136d8	d3b56ea8-5e1a-4d0f-9eeb-66a8f17d70f0	50ml	DHB-0057-50ML	8000	\N	t	2026-07-16 15:03:25.535	2026-07-19 14:05:50.602	t
0152abf5-e177-4493-bba9-989c9a2feb3a	ab0fdb66-51a5-4cfd-b076-79828c0b717e	50ml	DHB-0058-50ML	8000	\N	t	2026-07-16 15:03:28.257	2026-07-19 14:05:56.804	t
2eda20da-cfb3-4735-a4c8-8f1343912e00	65fb337a-a8fe-436b-b5d5-8cc4cf67e822	200ml	DHB-0083-200ML	20000	\N	t	2026-07-16 15:04:41.525	2026-07-19 14:07:47.874	t
f9741f72-baa1-4660-b3c1-a962ad22a630	e9a4ffde-feb3-41c5-ae79-54cf6b1ca96b	200ml	DHB-0084-200ML	20000	\N	t	2026-07-16 15:04:44.479	2026-07-19 14:07:52.205	t
97266d4c-f945-42c3-9bc5-1ecadb349d9d	5e8065e9-d4a8-4b18-9a8f-864de258ed66	200ml	DHB-0085-200ML	20000	\N	t	2026-07-16 15:04:47.128	2026-07-19 14:07:56.131	t
7dec32fa-b250-4d51-b244-7736ba554efb	b27bd564-a3ae-40eb-bbda-8e2113fa98e7	50ml	DHB-0337-50ML	8000	\N	t	2026-07-16 15:17:18.535	2026-07-19 14:25:29.909	t
beec3b84-37e7-469d-b39f-5586da019625	9e99faab-0dc6-4609-9d21-399ad41cbd4c	50ml	DHB-0338-50ML	8000	\N	t	2026-07-16 15:17:22.203	2026-07-19 14:25:34.591	t
bf08f644-ded9-46a4-95f5-66d55e50ff66	326bb60b-6441-44f8-9f10-9774e0d96ddc	50ml	DHB-0339-50ML	8000	\N	t	2026-07-16 15:17:25.147	2026-07-19 14:25:38.713	t
84c9024e-d0d0-4e2a-98b7-156dfaecc89b	78f666b8-a54c-41bf-ad88-388edf5fb7cd	50ml	DHB-0340-50ML	8000	\N	t	2026-07-16 15:17:29.83	2026-07-19 14:25:43.698	t
a8fc4053-2d25-4a0e-b532-b7ce20f5d11c	fce5624c-1c57-45d1-ac5d-2bb5d3b840b0	50ml	DHB-0342-50ML	8000	\N	t	2026-07-16 15:17:39.532	2026-07-19 14:25:52.607	t
cd7f1aa2-511f-45d4-9905-e1a9153223ac	80016815-b549-4dbd-9882-1d23e036b880	50ml	DHB-0346-50ML	8000	\N	t	2026-07-16 15:17:53.019	2026-07-19 14:26:09.433	t
faf23974-32f6-43fe-bac6-ccef21be0c88	26084fee-3ad3-4da4-a968-ea106c688060	50ml	DHB-0452-50ML	8000	\N	t	2026-07-16 15:23:51.544	2026-07-19 14:32:16.933	t
b0ddb5b9-7e2c-40d3-afb3-bbc0414a6101	7dc66a03-4d0f-4276-869e-09b2c818f7e1	50ml	DHB-0059-50ML	8000	\N	t	2026-07-16 15:03:31.225	2026-07-19 14:06:03.378	t
1f3315ff-47e1-47cf-b125-171c112c15b4	153c7004-3501-4bee-866f-3af4678025f6	50ml	DHB-0060-50ML	8000	\N	t	2026-07-16 15:03:34.26	2026-07-19 14:06:12.557	t
d0f4c508-cec3-4787-9cf2-30ad23885853	d9093e0e-6e25-4196-b413-4a49b34b4bfe	50ml	DHB-0061-50ML	8000	\N	t	2026-07-16 15:03:37.402	2026-07-19 14:06:22.093	t
dfe14d60-b7b5-4a16-ad8b-c16fe8d85dbf	196d0da9-174f-47bb-95cd-10ac089fa6ef	50ml	DHB-0062-50ML	8000	\N	t	2026-07-16 15:03:40.617	2026-07-19 14:06:26.109	t
a15d69dc-4caa-4e08-bcb3-00cff8154082	41a9d464-7d13-4cdd-9f6b-de11a694a2cf	50ml	DHB-0063-50ML	8000	\N	t	2026-07-16 15:03:43.926	2026-07-19 14:06:29.808	t
e8e31643-ae6e-42fd-990f-7994b0d14afb	aa34a7e3-727d-4e19-9d1c-7d94b2cf6f13	50ml	DHB-0064-50ML	8000	\N	t	2026-07-16 15:03:46.87	2026-07-19 14:06:33.505	t
b29703f2-294b-49a9-9681-7a9bef3f9898	43d65d7e-b90d-42ca-ae91-8b22a67ab0da	50ml	DHB-0065-50ML	8000	\N	t	2026-07-16 15:03:49.552	2026-07-19 14:06:37.154	t
f13b7c71-8d93-4ab4-9832-b4dcbc49c3af	40726f06-c62b-46f8-b1d8-d92b02a31d77	50ml	DHB-0066-50ML	8000	\N	t	2026-07-16 15:03:52.579	2026-07-19 14:06:40.869	t
48ec4a46-1247-47bb-9f58-3ea6d4f019a6	4f9d493f-bab8-4ea3-8cd4-bc152ea9a2a4	200ml	DHB-0373-200ML	20000	\N	t	2026-07-16 15:19:31.466	2026-07-19 14:27:49.289	t
ddd2dcd4-b2d8-4bc8-b741-de5b3795b427	dcf4d80c-05b3-48ee-976b-30eaf422b597	200ml	DHB-0374-200ML	20000	\N	t	2026-07-16 15:19:35.083	2026-07-19 14:27:52.646	t
bca91de3-8e8a-48ce-aaa1-00bc8ca8ac93	1d080ae5-5366-49eb-b607-62616c9038fc	200ml	DHB-0375-200ML	20000	\N	t	2026-07-16 15:19:40.118	2026-07-19 14:27:56.169	t
83dc59db-1b47-4ca6-acd0-a20eed5dce1a	06e810f1-2dba-405a-ad71-9ebda8a08c80	200ml	DHB-0376-200ML	20000	\N	t	2026-07-16 15:19:43.449	2026-07-19 14:27:59.802	t
34333e25-6550-45ca-9d3f-d4819dbc8fc8	92dc9eec-c14b-4985-8142-540ca06308b2	200ml	DHB-0377-200ML	20000	\N	t	2026-07-16 15:19:46.734	2026-07-19 14:28:03.283	t
0bc65226-2039-4b83-8778-fb0b13f57fec	66215338-6427-4b49-a126-f132ba519439	200ml	DHB-0378-200ML	20000	\N	t	2026-07-16 15:19:49.736	2026-07-19 14:28:06.528	t
b95cd729-0b51-4a60-ba4f-078ca1acf01b	35e7f742-681f-4b0f-b429-cd4dfa3231d3	50ml	DHB-0067-50ML	8000	\N	t	2026-07-16 15:03:55.291	2026-07-19 14:06:44.294	t
c42627a8-dfd4-464b-852f-22e54f1a1c08	93e4e0f3-0b00-4dfc-a8b1-8c016ab4cbe7	50ml	DHB-0068-50ML	8000	\N	t	2026-07-16 15:03:57.998	2026-07-19 14:06:47.721	t
b86d5779-3173-426a-95f6-8b44436323a6	af4e4b85-9bcd-4a9b-a172-1d9c7e7b9954	50ml	DHB-0069-50ML	8000	\N	t	2026-07-16 15:04:00.984	2026-07-19 14:06:51.415	t
7b37c83d-0275-4f15-b932-9d663a093583	60cb819e-a78e-4fac-897b-30166e63fc97	50ml	DHB-0070-50ML	8000	\N	t	2026-07-16 15:04:04.008	2026-07-19 14:06:55.3	t
b813acdf-3e5d-49a4-afe1-11c9a7861a4b	0df63608-7a9b-4dc7-9166-4ae3f1614388	50ml	DHB-0071-50ML	8000	\N	t	2026-07-16 15:04:06.919	2026-07-19 14:06:59.137	t
0a7d1471-3918-47c4-bc86-e4cc433abff5	bfed6bb8-b8ac-4eb6-91c6-3573e728987f	50ml	DHB-0072-50ML	8000	\N	t	2026-07-16 15:04:09.597	2026-07-19 14:07:03.337	t
183988a2-4d03-4b38-8c4d-a36da18fe168	9130e65e-2416-4133-ba17-ac151fc19dcc	50ml	DHB-0073-50ML	8000	\N	t	2026-07-16 15:04:12.402	2026-07-19 14:07:07.328	t
747a99fd-7478-4f98-b59c-c4d31ad1c681	4cda3b3d-edf6-4743-9fe2-c97114628d65	50ml	DHB-0074-50ML	8000	\N	t	2026-07-16 15:04:15.584	2026-07-19 14:07:11.434	t
721fc90e-9b9f-4302-96a3-32cc419b3b67	4c817412-00d4-478d-bebc-40a3d76a085e	200ml	DHB-0099-200ML	20000	\N	t	2026-07-16 15:05:25.11	2026-07-19 14:08:47.623	t
013f6a45-f5e8-4d32-a0e7-69f7586c456c	2871ddbb-2671-4d9a-9dd7-5202d2e81e7f	200ml	DHB-0100-200ML	20000	\N	t	2026-07-16 15:05:27.92	2026-07-19 14:08:51.255	t
f6cf944c-13d7-4997-a9ad-50c42c0dd13c	4ae3aa41-93e7-4e06-80d8-c699daf343c9	200ml	DHB-0101-200ML	20000	\N	t	2026-07-16 15:05:30.392	2026-07-19 14:08:54.518	t
b1d1acd4-e3c6-43b2-aa07-48fd0470501a	cae436e6-d154-411a-b8bb-60ba4296386e	200ml	DHB-0102-200ML	20000	\N	t	2026-07-16 15:05:33.175	2026-07-19 14:08:59.161	t
d726cfd4-86ef-4bc1-85f0-4435899fabd6	bb352e30-0643-4ab2-9d43-b6ef7bb59e7d	200ml	DHB-0105-200ML	20000	\N	t	2026-07-16 15:05:44.692	2026-07-19 14:09:10.838	t
d508a5f9-6e72-4fca-ab0f-8cf2d8cc1690	04a92a24-3e48-4d18-8d47-1b4d07ac827f	200ml	DHB-0106-200ML	20000	\N	t	2026-07-16 15:05:47.11	2026-07-19 14:09:14.275	t
a17088b2-3555-418c-8937-ee666c8aae9f	a3c1e88a-5ac7-4bb9-80bb-6e8b07d07060	200ml	DHB-0107-200ML	20000	\N	t	2026-07-16 15:05:50.236	2026-07-19 14:09:17.731	t
50e3748c-b2a3-4692-83a6-07d7c4f34a1a	2d697d0a-30d0-4388-a0f5-ca1201ffe541	200ml	DHB-0108-200ML	20000	\N	t	2026-07-16 15:05:53.778	2026-07-19 14:09:21.171	t
a0fe3edb-7e18-48ec-acb2-13caa9a0d765	4c28cde6-9244-4748-8da3-a164a1d3a560	200ml	DHB-0371-200ML	20000	\N	t	2026-07-16 15:19:23.283	2026-07-19 14:27:41.538	t
8521f4b2-0591-451f-a2be-0bd164516255	3e7bbc35-a560-42bc-8617-40a3cd74827a	200ml	DHB-0372-200ML	20000	\N	t	2026-07-16 15:19:27.317	2026-07-19 14:27:45.409	t
6aa56384-527c-4f48-8fb2-9a64012c5787	e3d2d948-92b2-426d-b792-2769a000bd19	50ml	DHB-0075-50ML	8000	\N	t	2026-07-16 15:04:18.079	2026-07-19 14:07:15.111	t
22abbaa6-3b31-4032-8758-c049ed14a8f2	1ace4014-b9df-4dbc-83f0-cb336ab3154f	50ml	DHB-0076-50ML	8000	\N	t	2026-07-16 15:04:20.75	2026-07-19 14:07:18.797	t
972c6a13-ab1e-4ff4-8524-0f0b41f7dba7	3a21e5ec-28c0-4f84-9e28-716ffaaf708b	50ml	DHB-0077-50ML	8000	\N	t	2026-07-16 15:04:23.611	2026-07-19 14:07:22.545	t
9c63525c-52de-482a-af9b-46821378c28b	f00a2fe6-3317-4679-b60f-98da548f091a	50ml	DHB-0078-50ML	8000	\N	t	2026-07-16 15:04:26.477	2026-07-19 14:07:26.9	t
eccc68cd-b56a-4400-93f3-294e48f99114	31659561-fd1b-4790-9188-cec150ddf740	50ml	DHB-0079-50ML	8000	\N	t	2026-07-16 15:04:29.364	2026-07-19 14:07:30.946	t
f980100b-9e09-4112-a903-5f7396041e8b	0ddb987e-77d8-400b-baa1-a69b620cc9bc	50ml	DHB-0080-50ML	8000	\N	t	2026-07-16 15:04:32.684	2026-07-19 14:07:35.286	t
1cab0dfa-6029-4789-8492-aeeace27444b	0f66d56c-fbca-4d6d-b35e-09420861c1fd	50ml	DHB-0081-50ML	8000	\N	t	2026-07-16 15:04:35.104	2026-07-19 14:07:38.972	t
22cf968a-28c1-462b-b5cd-a530b8aa8961	945bbd94-7fe1-4bfb-87c7-11c873ee3af7	50ml	DHB-0082-50ML	8000	\N	t	2026-07-16 15:04:37.756	2026-07-19 14:07:43.354	t
4090dd7a-6ee3-4cf7-8927-42884f69c789	65fb337a-a8fe-436b-b5d5-8cc4cf67e822	50ml	DHB-0083-50ML	8000	\N	t	2026-07-16 15:04:40.505	2026-07-19 14:07:47.268	t
96bf9b6f-3264-42f0-a79e-6dde5dc37e19	e9a4ffde-feb3-41c5-ae79-54cf6b1ca96b	50ml	DHB-0084-50ML	8000	\N	t	2026-07-16 15:04:43.924	2026-07-19 14:07:51.672	t
781495e8-acaa-4144-8057-e2ddbbf648d8	5e8065e9-d4a8-4b18-9a8f-864de258ed66	50ml	DHB-0085-50ML	8000	\N	t	2026-07-16 15:04:46.601	2026-07-19 14:07:55.61	t
ee748500-e86d-4503-80ae-7dfacecf95ce	ab073824-be87-4b52-8c45-22212449408b	50ml	DHB-0086-50ML	8000	\N	t	2026-07-16 15:04:49	2026-07-19 14:07:59.366	t
4d8ee458-4d8c-4673-9c65-0f92ebdfdd60	986881ad-1775-40e0-83d4-c281ff40abad	50ml	DHB-0087-50ML	8000	\N	t	2026-07-16 15:04:51.401	2026-07-19 14:08:02.99	t
926562f4-e16b-4d78-a89b-c91176ba96e2	031207ac-912b-4c24-a80b-d121f5c9cdc3	50ml	DHB-0088-50ML	8000	\N	t	2026-07-16 15:04:53.817	2026-07-19 14:08:06.675	t
ce5a0d93-d6d4-4314-a0f9-415e331e4dbf	daafce23-50c9-423e-8d3f-8602da604567	50ml	DHB-0089-50ML	8000	\N	t	2026-07-16 15:04:56.521	2026-07-19 14:08:10.667	t
22018b4a-db13-4023-b389-560062a4aaed	6f994bb6-d2bf-48f8-a0b0-e2a5a246bfd1	50ml	DHB-0090-50ML	8000	\N	t	2026-07-16 15:04:58.916	2026-07-19 14:08:14.424	t
fe1d5365-f7bd-474f-911c-ef3ae7963a40	9fcfb7f1-4b02-4d85-9d6e-9f6d30050467	50ml	DHB-0091-50ML	8000	\N	t	2026-07-16 15:05:01.336	2026-07-19 14:08:18.519	t
c2842281-ec44-4b41-81ec-fe2f194e94ee	4c67a538-fc47-460f-bc48-c95e279c5e9d	50ml	DHB-0092-50ML	8000	\N	t	2026-07-16 15:05:03.741	2026-07-19 14:08:21.743	t
c7c7e9e2-ad40-454a-b151-df8b40be6292	da07c0cc-32ce-4700-be29-b45490da697f	50ml	DHB-0093-50ML	8000	\N	t	2026-07-16 15:05:07.292	2026-07-19 14:08:25.267	t
bb7f623f-69aa-45b9-b7a1-10481e730779	8d4029da-96d1-4eec-8b78-6762b4ff7f82	50ml	DHB-0094-50ML	8000	\N	t	2026-07-16 15:05:09.953	2026-07-19 14:08:28.994	t
dd67322a-12f9-4050-81ab-4cd5412f7dcb	78efa338-9c4f-4fb2-b9ce-c6764f91adea	50ml	DHB-0095-50ML	8000	\N	t	2026-07-16 15:05:12.684	2026-07-19 14:08:32.994	t
a16b5bbf-18df-44d5-b51f-2820aa16bc3e	e6ded678-e1f9-4fb6-9a91-62bff43db19f	50ml	DHB-0096-50ML	8000	\N	t	2026-07-16 15:05:15.435	2026-07-19 14:08:36.453	t
fc4777bb-30e0-41d7-b708-2202f1957ca3	0d0b6b8d-4567-47be-840d-933fe96498cf	200ml	DHB-0379-200ML	20000	\N	t	2026-07-16 15:19:53.206	2026-07-19 14:28:09.734	t
6757f55d-eb97-4a1f-8a1e-77c654ecc4ec	e9eaf761-89f7-4116-8ff3-8a129cd1bd69	200ml	DHB-0380-200ML	20000	\N	t	2026-07-16 15:19:56.451	2026-07-19 14:28:13.018	t
32b72e19-9dac-4c18-80e2-0a03417084b4	a7336368-440f-4f4b-85cd-54066467d79a	200ml	DHB-0381-200ML	20000	\N	t	2026-07-16 15:20:00.153	2026-07-19 14:28:16.602	t
b7769eb2-282a-4fe5-a636-5f0e9c22443b	613da40e-cea6-49b4-a284-360b449c48fc	200ml	DHB-0382-200ML	20000	\N	t	2026-07-16 15:20:05.249	2026-07-19 14:28:19.82	t
9a911591-e632-4929-ba87-d5832d5bd70d	48effdc1-6343-4a8e-aca2-101fe013fd72	50ml	DHB-0097-50ML	8000	\N	t	2026-07-16 15:05:18.499	2026-07-19 14:08:39.876	t
3a2bed0a-993b-4ad0-b099-accdd54419ec	1e57282b-dc0e-479f-9d2a-3d37929477bb	50ml	DHB-0098-50ML	8000	\N	t	2026-07-16 15:05:22.178	2026-07-19 14:08:43.574	t
b016ff05-30fb-4b76-bc88-26349a94ea08	4c817412-00d4-478d-bebc-40a3d76a085e	50ml	DHB-0099-50ML	8000	\N	t	2026-07-16 15:05:24.583	2026-07-19 14:08:47.066	t
8b3fe542-4bc5-4f94-8905-e4518bfa2f89	bc1dc5b9-e07d-41bb-944a-6a75e0f2462f	50ml	DHB-0103-50ML	8000	\N	t	2026-07-16 15:05:36.161	2026-07-19 14:09:02.739	t
d99f60ec-a348-47ce-b52c-49f43e808bd2	064c5488-1c71-4707-bca8-9506854f0b5e	50ml	DHB-0104-50ML	8000	\N	t	2026-07-16 15:05:39.498	2026-07-19 14:09:06.324	t
542d4a3c-7482-4430-a83d-db42f36aa219	1b364c0b-662e-4cd5-954c-6bfee2b2c366	50ml	DHB-0110-50ML	8000	\N	t	2026-07-16 15:05:58.879	2026-07-19 14:09:29.071	t
9d98dfcf-d09b-450f-9836-c5ce161f92c8	8f922038-e240-4d69-9174-7485ad0d07b2	50ml	DHB-0111-50ML	8000	\N	t	2026-07-16 15:06:01.6	2026-07-19 14:09:33.253	t
5d541476-3499-47e0-8136-cdca7e4423e9	b0716a17-fde6-4187-81e6-2e50de59786e	50ml	DHB-0112-50ML	8000	\N	t	2026-07-16 15:06:05.001	2026-07-19 14:09:37.044	t
55a64375-5ab1-493a-ab33-729080cb7901	2aecd3d7-0c14-40fc-9a02-5aa742da6901	50ml	DHB-0113-50ML	8000	\N	t	2026-07-16 15:06:08.047	2026-07-19 14:09:40.755	t
b0734077-159d-4989-b080-5a1df284c9a1	e08da125-5766-41a1-bdd6-c9ca9df0b92c	50ml	DHB-0114-50ML	8000	\N	t	2026-07-16 15:06:10.639	2026-07-19 14:09:44.119	t
ca40e574-2af7-4a60-aa3e-958c5ce527af	34b9d907-e77d-4dcf-8251-06b07fa60aa0	50ml	DHB-0115-50ML	8000	\N	t	2026-07-16 15:06:13.552	2026-07-19 14:09:47.794	t
0064b633-1461-4450-bb1b-9b6affbbadbf	9034bc0f-5328-4dd3-b722-916bf17b239e	50ml	DHB-0116-50ML	8000	\N	t	2026-07-16 15:06:15.951	2026-07-19 14:09:51.069	t
5c37127d-8ece-4f3b-945e-e2e4d777a9d3	4ba18694-2e09-413d-9406-9050f623540f	50ml	DHB-0117-50ML	8000	\N	t	2026-07-16 15:06:18.624	2026-07-19 14:09:54.962	t
d6087e93-85e1-4a47-8e16-fefd9759d16d	6993eab3-d31c-4e3b-990b-f90609b12376	50ml	DHB-0118-50ML	8000	\N	t	2026-07-16 15:06:21.525	2026-07-19 14:09:58.698	t
caa6ff84-60f5-4d2e-bc60-96ba25520f0a	477898f2-01cc-4cee-8672-faea3786d6a4	50ml	DHB-0119-50ML	8000	\N	t	2026-07-16 15:06:24.936	2026-07-19 14:10:02.334	t
ecb320b5-e3c0-4b37-b302-551a04fc74fe	2b0e1194-769e-4c6e-b225-af46fe33848c	50ml	DHB-0120-50ML	8000	\N	t	2026-07-16 15:06:27.949	2026-07-19 14:10:05.866	t
2d444eec-f290-4661-8c2f-84151e576b05	6b1cde3b-7614-4f26-9c6a-e05a03cfe1f9	50ml	DHB-0121-50ML	8000	\N	t	2026-07-16 15:06:30.911	2026-07-19 14:10:09.723	t
81a76a43-0433-466b-8cc9-7ddc12cfea7e	0cbe8336-1932-47a2-b470-90af69e93b25	50ml	DHB-0122-50ML	8000	\N	t	2026-07-16 15:06:34.88	2026-07-19 14:10:13.29	t
17c6c36e-c152-47bf-8ca5-27ff30e648d9	a563f573-f08e-4450-bf46-cc26967c13c6	50ml	DHB-0123-50ML	8000	\N	t	2026-07-16 15:06:39.644	2026-07-19 14:10:17.683	t
a459d200-ff9a-4099-9f10-0a43d232028f	fcf0c6ed-2798-4aee-b5fc-62978a63cbd3	50ml	DHB-0124-50ML	8000	\N	t	2026-07-16 15:06:42.499	2026-07-19 14:10:21.384	t
dcc83459-d2f0-4018-ae26-b7273c46d8c6	8b600535-5657-4c05-a48a-59321a0ac0ab	50ml	DHB-0125-50ML	8000	\N	t	2026-07-16 15:06:45.249	2026-07-19 14:10:25.078	t
d8bbd755-0613-4002-b0e3-8250b4f4858c	f8751a4b-64a0-4878-ad63-704933f3f41f	50ml	DHB-0126-50ML	8000	\N	t	2026-07-16 15:06:47.891	2026-07-19 14:10:28.854	t
3199b2ea-263b-4665-a825-52ba981760a4	3f3738dc-5461-4fa6-b08d-30878345c90e	200ml	DHB-0385-200ML	20000	\N	t	2026-07-16 15:20:17.106	2026-07-19 14:28:28.879	t
b2e8b2ab-9848-4c25-8629-65522109ddf8	5a9c924e-72eb-4ce3-8d8c-eabc915bdd42	200ml	DHB-0386-200ML	20000	\N	t	2026-07-16 15:20:20.268	2026-07-19 14:28:32.332	t
ccdf6fc3-f3f7-4b0e-9e16-730b28bfe92a	a0c92910-dd21-4ce4-88b5-228809a08fb2	200ml	DHB-0387-200ML	20000	\N	t	2026-07-16 15:20:23.074	2026-07-19 14:28:35.488	t
c3ba1957-56be-4f37-b70b-50d4a9a8f26a	3e360ffd-8f9f-48af-a987-4a3bb3cc9102	200ml	DHB-0388-200ML	20000	\N	t	2026-07-16 15:20:25.731	2026-07-19 14:28:38.919	t
1e88cdc3-50a1-4df6-bf2e-e418f8b1413a	18fe0d89-f42c-4d10-8b5e-39be04ac3fd0	200ml	DHB-0389-200ML	20000	\N	t	2026-07-16 15:20:29.394	2026-07-19 14:28:42.194	t
d5025280-1629-4f00-8a84-55abe97498fe	c78c89fd-baf2-41b8-a4fd-ec1df6fbf32f	50ml	DHB-0127-50ML	8000	\N	t	2026-07-16 15:06:50.65	2026-07-19 14:10:32.292	t
641aa2d5-4b73-47cc-b56a-c1ce6592157b	4ff689b4-a6fa-4912-aeb6-4f230ff633a3	50ml	DHB-0128-50ML	8000	\N	t	2026-07-16 15:06:53.287	2026-07-19 14:10:35.945	t
3adcd4eb-df93-4997-8fb0-332ce4a88ed5	d7696520-73d0-4473-babc-fa0d1f3df150	50ml	DHB-0129-50ML	8000	\N	t	2026-07-16 15:06:56.431	2026-07-19 14:10:39.381	t
1d53669a-b287-49dc-b2ba-1115c71fdcf9	b8fab72a-155f-4392-bc00-93da631ca1a6	50ml	DHB-0130-50ML	8000	\N	t	2026-07-16 15:06:58.858	2026-07-19 14:10:42.836	t
17dbb43f-bc27-4ac5-b966-fa576d25b349	dfcdeaa5-756e-4dcf-8cdb-bd2bab3b377b	50ml	DHB-0131-50ML	8000	\N	t	2026-07-16 15:07:01.665	2026-07-19 14:10:46.668	t
9b020ced-b756-4fd2-9ac3-e7202ce3507f	47998914-eb19-4aba-9a3b-c2760e9d9967	50ml	DHB-0132-50ML	8000	\N	t	2026-07-16 15:07:04.338	2026-07-19 14:10:50.279	t
fad8a6b3-8636-4b1c-a46e-dd702c146802	3bed23fb-b4bc-4699-9192-586f02c0405e	50ml	DHB-0133-50ML	8000	\N	t	2026-07-16 15:07:07.111	2026-07-19 14:10:54.148	t
179182c0-03fc-402c-9e6b-f2f20fb7c225	f03d5a97-0539-4692-8841-af7a070ee27a	50ml	DHB-0134-50ML	8000	\N	t	2026-07-16 15:07:09.758	2026-07-19 14:10:57.732	t
fb237681-e5b3-4785-9686-ffcbbf8fd59e	7d1d7ad0-8f9a-4f49-a517-df10b3136560	50ml	DHB-0135-50ML	8000	\N	t	2026-07-16 15:07:12.998	2026-07-19 14:11:01.515	t
56839a56-238f-47a1-ab3a-45372dc73079	ecb05f78-c3dc-4c3f-aeb9-ad7985bd34e5	50ml	DHB-0136-50ML	8000	\N	t	2026-07-16 15:07:15.877	2026-07-19 14:11:05.271	t
d6c29837-362a-49eb-b725-36fd76a5ffe1	d0ca3ed4-4f2e-44cb-a494-f1076499dedc	50ml	DHB-0137-50ML	8000	\N	t	2026-07-16 15:07:18.436	2026-07-19 14:11:08.557	t
a19af1e5-abc3-41e5-8b2e-8961eddad5cb	ce88f95e-01cc-4d2e-be0b-35d52bc297e9	50ml	DHB-0138-50ML	8000	\N	t	2026-07-16 15:07:21.026	2026-07-19 14:11:12.328	t
cf1d3a73-b6d8-4227-9891-650f4ff44ab1	b7895678-6a6a-4273-ac01-a42aa7a1dc95	50ml	DHB-0139-50ML	8000	\N	t	2026-07-16 15:07:23.535	2026-07-19 14:11:16.203	t
55dd4a24-9883-4205-9dd1-c45b2a5a6374	3c5563bf-8bcf-42f5-a50b-28ad63938d4d	50ml	DHB-0140-50ML	8000	\N	t	2026-07-16 15:07:26.754	2026-07-19 14:11:20.078	t
7ce4500f-f81e-4cc4-8be2-010be71c919f	79864c5e-5f95-442f-8c8d-8c093066ee5b	50ml	DHB-0141-50ML	8000	\N	t	2026-07-16 15:07:29.978	2026-07-19 14:11:25.166	t
2cad5a55-d8c3-4216-9046-a858c220f720	8710a3af-739b-4817-aceb-3d3eca0566d3	50ml	DHB-0142-50ML	8000	\N	t	2026-07-16 15:07:33.017	2026-07-19 14:11:36.228	t
b811fb9b-bb73-4875-9789-d03fcea5c4d0	76bede9b-42da-4e9e-997f-f5b3907397d0	50ml	DHB-0143-50ML	8000	\N	t	2026-07-16 15:07:36.037	2026-07-19 14:11:45.986	t
25e85d41-d84b-49bb-bf8c-b04710f792dc	ba231572-151a-4d38-a492-7a0fd966042a	50ml	DHB-0144-50ML	8000	\N	t	2026-07-16 15:07:38.755	2026-07-19 14:11:50.158	t
492d0da9-06f8-4bc1-8cbb-22ce212d087a	0c8953b6-de1b-4a36-afc0-486388246612	50ml	DHB-0145-50ML	8000	\N	t	2026-07-16 15:07:41.43	2026-07-19 14:11:54.358	t
2971361c-7616-4a09-89c5-2d0801ea4721	03889b15-9788-44d9-8fad-327ad9f3f429	50ml	DHB-0146-50ML	8000	\N	t	2026-07-16 15:07:43.83	2026-07-19 14:11:58.079	t
79290c9f-ff06-4571-bb13-3fdb8df8ce48	b6d4d2c2-184e-411a-a953-31b8a48f13d5	50ml	DHB-0147-50ML	8000	\N	t	2026-07-16 15:07:46.691	2026-07-19 14:12:01.79	t
a838533f-786c-4ba9-b2f9-3057f3224d88	dde8e905-12bb-4a7b-ba55-f5016baeafb8	50ml	DHB-0148-50ML	8000	\N	t	2026-07-16 15:07:49.102	2026-07-19 14:12:05.426	t
ce97eb02-091f-4f15-9276-eb8bffd89edf	50db0df3-bac9-4680-988f-dee91ccc20a2	200ml	DHB-0390-200ML	20000	\N	t	2026-07-16 15:20:32.566	2026-07-19 14:28:45.29	t
a994f16f-0c0f-40a2-ba8f-b1dd3cb76744	d56709d5-6cf8-44a1-b2b8-51e398ded2b6	200ml	DHB-0391-200ML	20000	\N	t	2026-07-16 15:20:35.443	2026-07-19 14:28:48.245	t
2c32172d-8e42-426d-95d9-f1bf4b80291e	358fa7bd-95ed-470f-b25e-edd42b7691c0	200ml	DHB-0392-200ML	20000	\N	t	2026-07-16 15:20:39.821	2026-07-19 14:28:51.02	t
11d3fe51-ab0f-4d58-83f3-f1b52911d755	ba4a47a1-5195-4b55-ab53-960b38e29435	200ml	DHB-0393-200ML	20000	\N	t	2026-07-16 15:20:43.21	2026-07-19 14:28:54.232	t
0c2c1c26-c632-4102-9de8-73097c9e95f3	f98acd25-867a-495a-8f2d-bc4bc3ca21f6	200ml	DHB-0394-200ML	20000	\N	t	2026-07-16 15:20:47.125	2026-07-19 14:28:57.788	t
035dcf61-22e6-4a1f-80ff-594be1531575	d5eee1e4-a2d3-4ee6-b859-3f86e722d166	200ml	DHB-0163-200ML	20000	\N	t	2026-07-16 15:08:34.115	2026-07-19 14:13:04.973	t
b3d4a4d2-7727-45b9-a847-93000053efc5	72d1e17a-edc0-463b-a895-8c4f442b3c5e	200ml	DHB-0164-200ML	20000	\N	t	2026-07-16 15:08:37.693	2026-07-19 14:13:09.216	t
3191267d-7743-47de-8140-104f7d2cee83	63da88db-96e9-458b-ad10-10d9d0206609	200ml	DHB-0165-200ML	20000	\N	t	2026-07-16 15:08:40.899	2026-07-19 14:13:13.367	t
20174f01-7168-4fc7-a83f-c60ecabd160b	1e4ba0bb-3695-44f6-a6e6-05b27af98c82	50ml	DHB-0049-50ML	8000	\N	t	2026-07-16 15:03:02	2026-07-19 14:04:57.3	t
33e3bcd0-8a65-45e1-b214-e55846de0eec	6ebeb9b9-bb1e-4aae-a2c0-5b29b3294b12	50ml	DHB-0050-50ML	8000	\N	t	2026-07-16 15:03:04.933	2026-07-19 14:05:01.363	t
586390e0-e891-451f-9130-efccb5d2acb2	fb9b2e8f-1669-4904-a271-c7645985fbe6	50ml	DHB-0051-50ML	8000	\N	t	2026-07-16 15:03:07.899	2026-07-19 14:05:07.642	t
bae7df29-4c53-4667-9199-f51781b9f137	9d4b8003-45af-4967-9bd3-4a134a8ea251	50ml	DHB-0149-50ML	8000	\N	t	2026-07-16 15:07:51.895	2026-07-19 14:12:10.026	t
06a40a28-5695-4ed6-b9b0-27fc38fd1eb4	b4958433-28ae-4cf7-b922-68e31a061fd0	50ml	DHB-0150-50ML	8000	\N	t	2026-07-16 15:07:54.381	2026-07-19 14:12:13.834	t
0bb3d599-d58e-4126-994e-68da80b79971	8622cbf7-674e-4327-8745-58e0e8610e04	50ml	DHB-0151-50ML	8000	\N	t	2026-07-16 15:07:57.145	2026-07-19 14:12:17.3	t
bbaeb936-4ba3-411c-ba8c-b96df0b592fd	c1c65875-789f-42a8-80e7-cba95705cd95	50ml	DHB-0152-50ML	8000	\N	t	2026-07-16 15:08:00.297	2026-07-19 14:12:21.288	t
ce62bb52-5b4e-462e-90a4-19dfc4b971eb	4d017fe5-f486-4d0a-b1de-21ddcc5b9256	50ml	DHB-0153-50ML	8000	\N	t	2026-07-16 15:08:04.359	2026-07-19 14:12:25.72	t
61a6d2bf-713f-496e-b4e0-febf2641616f	0fbc106f-ec7f-4a5b-a6b5-3921a845a82b	50ml	DHB-0154-50ML	8000	\N	t	2026-07-16 15:08:06.894	2026-07-19 14:12:29.276	t
9659ce5c-cbe4-49a5-8587-d67e4ad67c93	ebbb8897-6a67-4516-80b4-bc0d509ef9df	200ml	DHB-0157-200ML	20000	\N	t	2026-07-16 15:08:18.072	2026-07-19 14:12:41.669	t
d5f9eacb-09c8-4792-a170-814515e986d9	ca90d0f7-11fb-4777-a4e8-2ab9455518b2	200ml	DHB-0158-200ML	20000	\N	t	2026-07-16 15:08:20.455	2026-07-19 14:12:45.252	t
eb99b735-f144-485a-8742-154b804549b3	d7651e66-34ac-45dc-99e7-4b7804a68c1a	200ml	DHB-0159-200ML	20000	\N	t	2026-07-16 15:08:23.136	2026-07-19 14:12:49.346	t
0e705c7a-bef3-4df3-b247-f39c2bc99472	bafb0778-bd98-4348-ba4b-a3c4e82431de	200ml	DHB-0160-200ML	20000	\N	t	2026-07-16 15:08:26.053	2026-07-19 14:12:53.102	t
2a5f0cff-2479-41ee-b777-e21a82913c23	60cc4b18-0c60-48f9-b316-63ff370b385c	200ml	DHB-0161-200ML	20000	\N	t	2026-07-16 15:08:28.805	2026-07-19 14:12:57.135	t
1355b8d5-403d-4660-86f3-611668bd9e50	7ab5fa67-e6ab-4f39-8866-a4428bbfaa0b	200ml	DHB-0162-200ML	20000	\N	t	2026-07-16 15:08:31.31	2026-07-19 14:13:01.124	t
8e178797-5c90-4127-a4d0-fe10e4285129	4392706b-317c-4bac-867a-39b77e001b11	50ml	DHB-0341-50ML	8000	\N	t	2026-07-16 15:17:33.747	2026-07-19 14:25:47.929	t
dc8dde77-81d3-4076-8e7e-91c1bf2050a7	14938ed6-4005-40da-a871-134ce00c28cb	50ml	DHB-0343-50ML	8000	\N	t	2026-07-16 15:17:42.267	2026-07-19 14:25:56.714	t
63589088-472a-4f89-b563-b2ea69f6936c	0c254ff6-8827-4179-b1c5-6b8d10c324c5	50ml	DHB-0344-50ML	8000	\N	t	2026-07-16 15:17:45.633	2026-07-19 14:26:00.62	t
13aa3950-8fdf-4cd4-a0e0-56a0e5b31e20	479e2fc2-7ca0-49bd-a203-537b70bbd22f	50ml	DHB-0345-50ML	8000	\N	t	2026-07-16 15:17:49.705	2026-07-19 14:26:05.417	t
cf3ade0a-79a3-4958-814d-9bf1655f9c36	3c7d1aeb-77a7-460e-b9cf-87b79db7a38b	50ml	DHB-0348-50ML	8000	\N	t	2026-07-16 15:17:59.104	2026-07-19 14:26:17.124	t
fa9f9f9c-c511-4532-93fb-31c2ac412067	85d4b481-27a7-40b3-a1ec-cd3395a97194	50ml	DHB-0349-50ML	8000	\N	t	2026-07-16 15:18:02.415	2026-07-19 14:26:20.945	t
2aeaa0a9-0dc5-42db-aed3-43e2fb32c1da	740d30b9-8169-48b7-b8db-77db73c7f15b	50ml	DHB-0351-50ML	8000	\N	t	2026-07-16 15:18:08.907	2026-07-19 14:26:28.345	t
43e78f2a-7bc3-4c66-958f-a23ba3a26bc7	cfab21bb-400c-4884-aba9-a08668026a8c	50ml	DHB-0352-50ML	8000	\N	t	2026-07-16 15:18:12.341	2026-07-19 14:26:33.121	t
aee1d25c-790f-43dd-81d6-6d601e5cceae	bfe66f71-0b3f-48d6-ae17-3579fa5955d2	50ml	DHB-0354-50ML	8000	\N	t	2026-07-16 15:18:20.741	2026-07-19 14:26:41.321	t
69ee73c5-93e3-430d-8355-98ae6112e5ee	ac55e1ba-d972-45e5-bc02-5f6b62d13b8c	100ml	DHB-0396-100ML	12000	\N	t	2026-07-16 15:20:54.095	2026-07-19 14:29:04.886	t
cb3b3270-0512-40e0-955d-2ba8443f22b1	ac55e1ba-d972-45e5-bc02-5f6b62d13b8c	200ml	DHB-0396-200ML	20000	\N	t	2026-07-16 15:20:54.477	2026-07-19 14:29:05.153	t
a3a5b6b0-2b89-4df3-b6a3-3507ffbd3c38	588d6543-eef6-4d84-b019-4d7a8b9fba06	200ml	DHB-0397-200ML	20000	\N	t	2026-07-16 15:20:57.513	2026-07-19 14:29:08.418	t
d6806488-e34d-4c13-8321-e3fc52c37d2a	6b95192d-3e8d-4c94-8b61-f61c421275be	50ml	DHB-0155-50ML	8000	\N	t	2026-07-16 15:08:10.36	2026-07-19 14:12:33.476	t
a207a7f1-8f04-4e35-b56c-81af8611d7d5	b02ca448-2a46-4038-9a94-6834dc62e633	50ml	DHB-0156-50ML	8000	\N	t	2026-07-16 15:08:14.831	2026-07-19 14:12:36.988	t
5d0d106f-84b3-49f2-a100-6aeb422aed0c	ebbb8897-6a67-4516-80b4-bc0d509ef9df	50ml	DHB-0157-50ML	8000	\N	t	2026-07-16 15:08:17.522	2026-07-19 14:12:41.055	t
322ffc8b-f522-4842-ad24-38d2d1c0ac95	ca90d0f7-11fb-4777-a4e8-2ab9455518b2	50ml	DHB-0158-50ML	8000	\N	t	2026-07-16 15:08:19.919	2026-07-19 14:12:44.592	t
1ef12be9-a63c-4e2f-8945-c25c68c4ecb3	d7651e66-34ac-45dc-99e7-4b7804a68c1a	50ml	DHB-0159-50ML	8000	\N	t	2026-07-16 15:08:22.606	2026-07-19 14:12:48.68	t
d0cf0ffc-fa73-404b-8864-b657e6212c91	bafb0778-bd98-4348-ba4b-a3c4e82431de	50ml	DHB-0160-50ML	8000	\N	t	2026-07-16 15:08:25.483	2026-07-19 14:12:52.583	t
5699353e-10f5-427a-93bb-77c8d32e3bb7	69ef4e63-1dfe-4f48-bc6d-47bdb7216ad9	200ml	DHB-0402-200ML	20000	\N	t	2026-07-16 15:21:14.256	2026-07-19 14:29:25.195	t
727540a7-7596-4e96-95ba-4545bfab4af4	2d3f30fc-b13c-40a9-a0d2-38d75e20d311	200ml	DHB-0403-200ML	20000	\N	t	2026-07-16 15:21:17.742	2026-07-19 14:29:28.583	t
ba4129af-4d82-44eb-9413-c1aef89e1165	bcea55b8-babc-478c-9227-12b955a6fab1	200ml	DHB-0404-200ML	20000	\N	t	2026-07-16 15:21:20.427	2026-07-19 14:29:32.065	t
c16d1918-c049-4a89-8b40-d036d62f4cb1	a1caa491-6ddc-4a60-8b8c-07666adfee35	200ml	DHB-0405-200ML	20000	\N	t	2026-07-16 15:21:23.192	2026-07-19 14:29:35.26	t
85ef3534-003d-49c2-95e0-90e46e6f43fd	5f437268-78fa-4e79-a194-8e918581a503	200ml	DHB-0406-200ML	20000	\N	t	2026-07-16 15:21:27.149	2026-07-19 14:29:38.63	t
e1d58c38-b8a4-4af6-b53e-936ad437770f	dcb4c4c5-203c-451c-998c-888362091608	200ml	DHB-0407-200ML	20000	\N	t	2026-07-16 15:21:30.058	2026-07-19 14:29:42.1	t
0fc37fb2-af76-4e85-8875-e12131e07dcb	60cc4b18-0c60-48f9-b316-63ff370b385c	50ml	DHB-0161-50ML	8000	\N	t	2026-07-16 15:08:28.271	2026-07-19 14:12:56.414	t
370146f2-86a1-48cd-b534-d31945b52706	7ab5fa67-e6ab-4f39-8866-a4428bbfaa0b	50ml	DHB-0162-50ML	8000	\N	t	2026-07-16 15:08:30.764	2026-07-19 14:13:00.51	t
f5e4c589-4ef2-40e8-b2de-da3f6e7bb21a	d5eee1e4-a2d3-4ee6-b859-3f86e722d166	50ml	DHB-0163-50ML	8000	\N	t	2026-07-16 15:08:33.582	2026-07-19 14:13:04.4	t
f03a2797-c39f-4b49-918a-e68a8d346c13	72d1e17a-edc0-463b-a895-8c4f442b3c5e	50ml	DHB-0164-50ML	8000	\N	t	2026-07-16 15:08:37.126	2026-07-19 14:13:08.601	t
a3d315d5-123d-44b5-a1e7-0387230a4454	63da88db-96e9-458b-ad10-10d9d0206609	50ml	DHB-0165-50ML	8000	\N	t	2026-07-16 15:08:40.292	2026-07-19 14:13:12.798	t
7069580f-7cdc-4ed6-b9d9-6d6788c6fa3c	cda6797a-59e1-40d2-a514-6844b8a36b91	50ml	DHB-0166-50ML	8000	\N	t	2026-07-16 15:08:43.597	2026-07-19 14:13:16.607	t
826d1018-60b4-4dfc-8244-43e826d12253	85e52a66-84c6-48ee-9eab-d648b3aa68ce	50ml	DHB-0167-50ML	8000	\N	t	2026-07-16 15:08:46.802	2026-07-19 14:13:20.786	t
218f2848-c4eb-4379-b23a-922522ff9ab0	74752fc6-8ebb-4939-a83f-cb2d34f9d687	50ml	DHB-0168-50ML	8000	\N	t	2026-07-16 15:08:50.933	2026-07-19 14:13:24.574	t
fabb9cc0-535d-4961-8d47-32d785e5cb80	5d142616-2772-4ab5-a2ae-e7fbed159c58	50ml	DHB-0169-50ML	8000	\N	t	2026-07-16 15:08:53.61	2026-07-19 14:13:28.454	t
5f9e1aac-8ef8-4958-af00-1718bc4c3887	147267f5-ad6b-46d1-afc8-16d5c7b78579	50ml	DHB-0170-50ML	8000	\N	t	2026-07-16 15:08:56.497	2026-07-19 14:13:32.25	t
1893b4b1-d7c8-45ff-90b1-cdba8f010690	a1291b8c-5711-4a1d-a42a-6d6405881ac8	200ml	DHB-0173-200ML	20000	\N	t	2026-07-16 15:09:04.844	2026-07-19 14:13:46.199	t
b97811bf-0d35-43e1-bc54-ff728e2e001a	ec2e2064-9f20-47c5-873b-399ed108cb6b	200ml	DHB-0174-200ML	20000	\N	t	2026-07-16 15:09:07.378	2026-07-19 14:13:49.561	t
904d4fd9-4318-4781-b482-e105e1a7b173	ba6d90f2-e97e-49ad-b85b-a199a6d64bfe	200ml	DHB-0175-200ML	20000	\N	t	2026-07-16 15:09:10.037	2026-07-19 14:13:53.785	t
4e53f988-0421-4be6-983a-9c240285fbdf	7f30029f-092c-4c95-82f5-9a39690b3f4c	200ml	DHB-0176-200ML	20000	\N	t	2026-07-16 15:09:12.723	2026-07-19 14:13:59.243	t
c1b42d6a-ebf7-4d2a-b884-7ba4be7898ee	84137263-8a01-4584-affe-6d5035ef1244	200ml	DHB-0177-200ML	20000	\N	t	2026-07-16 15:09:16.087	2026-07-19 14:14:06.671	t
79a16089-004a-4fdf-a940-95185d75bf85	e5ac8511-2698-40df-8625-d70612e9439a	200ml	DHB-0178-200ML	20000	\N	t	2026-07-16 15:09:19.304	2026-07-19 14:14:12.455	t
af73f50d-a519-40fc-815e-1d25b4b2bd38	ceaf2c6b-9581-4aa3-8bf8-c1a48ebc9c9d	200ml	DHB-0398-200ML	20000	\N	t	2026-07-16 15:21:01.415	2026-07-19 14:29:11.995	t
fff20edd-b7e4-4d2f-9343-0f18ea5ecde7	ce703ce1-3441-4664-ab0c-3927ecd896ee	200ml	DHB-0399-200ML	20000	\N	t	2026-07-16 15:21:04.618	2026-07-19 14:29:15.29	t
7a15269f-2db9-4e17-85c4-7daadf874015	7680f8c2-f9ee-4eff-a195-a4e78315d8bc	200ml	DHB-0400-200ML	20000	\N	t	2026-07-16 15:21:08.475	2026-07-19 14:29:18.765	t
5303dc14-5930-4557-b1e6-7a6fed20c235	2a547bff-0235-4fdf-a781-b2cc21af4ca6	200ml	DHB-0401-200ML	20000	\N	t	2026-07-16 15:21:11.307	2026-07-19 14:29:21.823	t
e46cffc6-0e59-463e-b548-c849d51a6cac	32dbefd4-7297-4427-94b6-312f83f3f7c8	50ml	DHB-0171-50ML	8000	\N	t	2026-07-16 15:08:59.056	2026-07-19 14:13:36.514	t
8b486095-abc4-4a76-acda-ac07bef8cbd0	3d140776-c6a6-46c0-9874-981ed5dd1b1b	50ml	DHB-0172-50ML	8000	\N	t	2026-07-16 15:09:01.593	2026-07-19 14:13:40.255	t
1abff7de-87c7-4d18-a1ec-3c784065b8ad	a1291b8c-5711-4a1d-a42a-6d6405881ac8	50ml	DHB-0173-50ML	8000	\N	t	2026-07-16 15:09:04.291	2026-07-19 14:13:45.668	t
7ebc892e-264b-456a-948d-ed5010aeb443	6a5cf2a6-e87d-4cc2-9062-b523922b4cb7	50ml	DHB-0180-50ML	8000	\N	t	2026-07-16 15:09:24.189	2026-07-19 14:14:26.058	t
3064ad7d-6b6d-4bcc-b935-7ca272c63d9a	7013dcaa-b40f-43d9-a2fb-e25459b56cd9	50ml	DHB-0181-50ML	8000	\N	t	2026-07-16 15:09:27.161	2026-07-19 14:14:32.366	t
9ee966d6-b5ac-4bbe-b6b0-c0d63f2bc8f6	4ad4be79-66cf-4e94-88cd-9ac109049507	50ml	DHB-0182-50ML	8000	\N	t	2026-07-16 15:09:30.69	2026-07-19 14:14:39.371	t
b9616230-a25e-4867-8351-8c90c6e4f2ba	30056426-cb6c-4a98-8e00-8c839e350b07	50ml	DHB-0183-50ML	8000	\N	t	2026-07-16 15:09:33.484	2026-07-19 14:14:44.482	t
dee2c801-434a-4147-b5a1-d63f57f56d85	36e49cfe-f6b4-4efc-965f-908b2495e261	50ml	DHB-0184-50ML	8000	\N	t	2026-07-16 15:09:36.08	2026-07-19 14:14:50.684	t
5507964e-b838-4893-868d-e1fd7714c2ed	2e421b80-2bba-40cb-9271-2f374778fe6c	50ml	DHB-0185-50ML	8000	\N	t	2026-07-16 15:09:39.065	2026-07-19 14:14:57.785	t
1efcdab1-cf62-465a-b9ff-c2558760bdb5	951765db-c632-4eb1-8ccd-a365ee9a98c3	50ml	DHB-0186-50ML	8000	\N	t	2026-07-16 15:09:42	2026-07-19 14:15:07.947	t
ec7fe5fe-a813-43db-a560-5a6763d47d09	a301ce1b-44ea-4ca7-9682-153f2283ece0	50ml	DHB-0187-50ML	8000	\N	t	2026-07-16 15:09:44.697	2026-07-19 14:15:13.585	t
650139ce-377c-451f-afa2-2dfcc59f33b2	30d74977-3ab5-4047-a372-e7a0dbd3e797	50ml	DHB-0188-50ML	8000	\N	t	2026-07-16 15:09:47.655	2026-07-19 14:15:18.179	t
ca3a6e94-da42-4b30-8d9d-df309905ecbc	3249d1f8-95ac-4efb-a19a-c07713861354	50ml	DHB-0189-50ML	8000	\N	t	2026-07-16 15:09:50.611	2026-07-19 14:15:23.183	t
ffe61628-8a4b-45f8-bfe4-379c73217664	7a542bf6-eaf0-4077-b374-60dea2563c8c	50ml	DHB-0190-50ML	8000	\N	t	2026-07-16 15:09:53.316	2026-07-19 14:15:28.393	t
2421de47-c49d-4927-86f1-a17a4d6e4694	57bda1da-5b8e-461b-8940-757a8130c09b	50ml	DHB-0191-50ML	8000	\N	t	2026-07-16 15:09:56.05	2026-07-19 14:15:33.502	t
4e6eb314-3dfe-4462-b953-e50d3eb9135d	57a1037a-d639-458f-8007-6b9ecfaa947a	50ml	DHB-0192-50ML	8000	\N	t	2026-07-16 15:09:59.192	2026-07-19 14:15:37.998	t
1e5d4056-bb3d-439f-a2a1-6d72482b44bd	4b7caf97-02eb-478a-8388-d16bc59a5596	50ml	DHB-0193-50ML	8000	\N	t	2026-07-16 15:10:01.843	2026-07-19 14:15:41.39	t
62c0e9f6-c762-4253-ac28-ec9176f8b1fd	19133cd0-67a4-4de4-9809-4db49357d487	50ml	DHB-0194-50ML	8000	\N	t	2026-07-16 15:10:04.249	2026-07-19 14:15:44.938	t
d30cfbf7-1b73-4c9e-bb5f-e5c9e8696f17	8335f285-1a61-47f4-b02a-dbd8e8c2b926	50ml	DHB-0195-50ML	8000	\N	t	2026-07-16 15:10:06.972	2026-07-19 14:15:49.194	t
abd7462b-9746-4370-95b1-5c0c7094a884	3383c1ab-88c0-4958-bacf-0b1491a1e761	50ml	DHB-0196-50ML	8000	\N	t	2026-07-16 15:10:09.705	2026-07-19 14:15:53.784	t
b7cbb902-510f-4ba2-8b88-141ffa0a9a98	79ddcaec-0056-4c94-9e75-5bd97a6e6f9a	50ml	DHB-0197-50ML	8000	\N	t	2026-07-16 15:10:12.455	2026-07-19 14:15:58.284	t
0e5ec4bb-e91d-469b-88c2-4067222a6b1a	5deccc48-e4c5-4936-9a4c-31eb581dc9e7	50ml	DHB-0198-50ML	8000	\N	t	2026-07-16 15:10:15.403	2026-07-19 14:16:02.191	t
2137adba-0b4b-4ff6-9913-87b627729088	29dc7089-a615-475c-b033-a0fd4a59a599	200ml	DHB-0408-200ML	20000	\N	t	2026-07-16 15:21:33.191	2026-07-19 14:29:45.438	t
a3343512-0b65-4a4f-9844-6bda589a909a	e3dc48a8-58da-4025-ad51-fe1a4db093c0	200ml	DHB-0409-200ML	20000	\N	t	2026-07-16 15:21:36.394	2026-07-19 14:29:48.961	t
fcca35cf-7c81-4791-bb24-4e74c62531df	30f6719f-41b5-4f60-80d2-afa6b2ccbf1f	200ml	DHB-0410-200ML	20000	\N	t	2026-07-16 15:21:38.892	2026-07-19 14:29:51.931	t
4afda0e6-3ebb-403a-adcf-f9d53ff6291d	f22ca276-9e1c-4865-8703-95e1ef0fce2f	200ml	DHB-0411-200ML	20000	\N	t	2026-07-16 15:21:42.563	2026-07-19 14:29:55.207	t
bf0e36be-2366-468d-8e86-a76dc39a9d04	83dbdeed-94db-4832-a9c0-63aa1132c9da	50ml	DHB-0199-50ML	8000	\N	t	2026-07-16 15:10:17.838	2026-07-19 14:16:06.697	t
e229cce7-2cf2-40a5-aa88-8fe0e84548ff	65c5ad19-2d58-4550-ac70-364c5816d0b5	50ml	DHB-0200-50ML	8000	\N	t	2026-07-16 15:10:20.602	2026-07-19 14:16:12.566	t
b4beee6b-6a95-44e7-8973-85b71a44f5b3	6aad7fb3-5e37-46e0-accb-ffbf2c121ecf	50ml	DHB-0201-50ML	8000	\N	t	2026-07-16 15:10:23.167	2026-07-19 14:16:16.284	t
62536e17-e539-4bce-8bb4-6dcd8f3bacf8	359618ae-76db-47d0-b416-3f2874d42184	50ml	DHB-0202-50ML	8000	\N	t	2026-07-16 15:10:25.685	2026-07-19 14:16:20.076	t
fad5a0a2-6a8e-4d10-a28c-afb5207694bd	ed508f36-74a7-4304-b24e-9c50c5e101b2	50ml	DHB-0203-50ML	8000	\N	t	2026-07-16 15:10:28.228	2026-07-19 14:16:23.783	t
fa6d2e40-3528-4b9b-91ca-1a476578f18b	ce22f643-10a3-48bf-97ec-c4d322ef4105	50ml	DHB-0204-50ML	8000	\N	t	2026-07-16 15:10:31.099	2026-07-19 14:16:28.116	t
0a8db379-7f60-4cf5-b1a1-9e6da13999f0	cebfe037-5ac4-4b4f-bafa-18734995b3ca	50ml	DHB-0205-50ML	8000	\N	t	2026-07-16 15:10:34.698	2026-07-19 14:16:32.085	t
cf374a62-ccae-449d-9503-ee1853fa298d	c35771e0-e11f-4dbd-b762-c5488c8e503e	50ml	DHB-0206-50ML	8000	\N	t	2026-07-16 15:10:37.817	2026-07-19 14:16:36.274	t
ea657deb-a0ac-4056-9444-eb3c402a5006	a8fc89dd-4102-431f-8339-9e65b9d27074	50ml	DHB-0207-50ML	8000	\N	t	2026-07-16 15:10:40.302	2026-07-19 14:16:40.189	t
7a6e6508-6d0f-4591-9996-064f4d04854d	e6b0d9f7-4026-4c28-8916-df4a5c8fdc26	50ml	DHB-0208-50ML	8000	\N	t	2026-07-16 15:10:42.856	2026-07-19 14:16:44.347	t
d379b475-e883-4c79-84af-0a46f7ae5a02	de83ece8-c147-480d-b414-ee6dfa9c77f4	50ml	DHB-0209-50ML	8000	\N	t	2026-07-16 15:10:45.681	2026-07-19 14:16:48.675	t
e502e209-a421-4028-ab04-038028f351bf	82e672a8-9569-4510-b45d-4e4d5a6a0872	50ml	DHB-0210-50ML	8000	\N	t	2026-07-16 15:10:48.44	2026-07-19 14:16:54.792	t
dcf413f0-9144-479a-adb7-504b594578de	42b49c6a-f7d8-45bd-98dd-0f5ba1ebac25	50ml	DHB-0211-50ML	8000	\N	t	2026-07-16 15:10:51.444	2026-07-19 14:16:59.531	t
f859c208-b9d0-4cae-a69c-1af596fb6673	09b097c8-8987-49af-99cf-f8fcbf184a92	50ml	DHB-0212-50ML	8000	\N	t	2026-07-16 15:10:54.287	2026-07-19 14:17:03.379	t
3d809aa2-e821-4897-91a0-0c1f633fc30a	0441d386-bf83-46d6-850b-bc8c5ce4a7d0	50ml	DHB-0213-50ML	8000	\N	t	2026-07-16 15:10:57.402	2026-07-19 14:17:07.364	t
c9919af7-0151-450b-92ce-0db9ee5ddec2	1080ddd7-489b-4716-9004-190708d9493e	50ml	DHB-0214-50ML	8000	\N	t	2026-07-16 15:11:00.866	2026-07-19 14:17:11.807	t
82067176-7a31-43e0-a54b-2e16fa28fb6c	efc1a8bb-203a-4dc6-8ddc-5de529b07d7e	50ml	DHB-0215-50ML	8000	\N	t	2026-07-16 15:11:03.832	2026-07-19 14:17:16.014	t
28b34b72-12e3-489f-941d-7fcca923fc46	08332624-be68-4d6f-b34d-9af66ff3bb6f	50ml	DHB-0216-50ML	8000	\N	t	2026-07-16 15:11:07.234	2026-07-19 14:17:20.208	t
4a697172-3454-4abc-9c36-a8fb4f801d66	b1ee6554-205e-4306-bf77-cae0c6d30752	50ml	DHB-0217-50ML	8000	\N	t	2026-07-16 15:11:10.249	2026-07-19 14:17:24.714	t
5370c6fe-b234-4fb9-8540-fab070a98784	d919cac4-3d0e-46d3-abfd-39405ff00d2e	50ml	DHB-0218-50ML	8000	\N	t	2026-07-16 15:11:12.876	2026-07-19 14:17:31.156	t
cb29496a-d36a-4e03-8e1e-6e85864beb8a	21fea75f-8b80-48c9-8a52-f3b835a33dc0	50ml	DHB-0219-50ML	8000	\N	t	2026-07-16 15:11:15.504	2026-07-19 14:17:34.747	t
21f8688d-8f73-4cd7-9003-c01d80732e8a	b2321149-dcf9-40ef-83c7-b80d6ed56162	50ml	DHB-0220-50ML	8000	\N	t	2026-07-16 15:11:18.594	2026-07-19 14:17:38.748	t
c800c946-ff7c-4543-8ebb-d29a6674d39c	57cf1c9b-bcfa-44d9-b581-035028d4b6f8	200ml	DHB-0414-200ML	20000	\N	t	2026-07-16 15:21:54.83	2026-07-19 14:30:04.833	t
30c1ae05-1868-4704-a827-fa20e0ef2057	250519ff-2f1e-4009-8d48-c75d79f59f8f	200ml	DHB-0415-200ML	20000	\N	t	2026-07-16 15:21:58.569	2026-07-19 14:30:07.906	t
29502438-ffc8-4b8f-a995-07bf7ccbc96a	dc2133c5-d8e7-4a0b-b4f4-dd006eb087a9	200ml	DHB-0416-200ML	20000	\N	t	2026-07-16 15:22:01.754	2026-07-19 14:30:11.08	t
51b95c56-82f9-4c67-9626-a8139b6115b9	0b454968-cf9d-4c1b-abd8-5f3e0f945adc	200ml	DHB-0417-200ML	20000	\N	t	2026-07-16 15:22:06.786	2026-07-19 14:30:14.666	t
c9f3b524-7c99-4710-ae8a-ca25c19b1ca7	2ac6555e-0733-4b97-844b-78699d204d4d	200ml	DHB-0418-200ML	20000	\N	t	2026-07-16 15:22:11.202	2026-07-19 14:30:17.944	t
78632e7b-5cfd-4386-97ba-f5ce5df069c0	8cbc5b78-6a80-4248-a218-28ef9f032a83	50ml	DHB-0221-50ML	8000	\N	t	2026-07-16 15:11:21.384	2026-07-19 14:17:42.759	t
a6acb8af-1ba2-4208-9696-d4d7a0723108	8fb5c757-d7cf-4a44-8707-24c27f54263b	50ml	DHB-0222-50ML	8000	\N	t	2026-07-16 15:11:24.505	2026-07-19 14:17:47.49	t
ee0b687e-6a29-4c65-8aa4-bb1b0277793f	e182e4b2-4fcb-4706-a454-4fc4774dabfc	50ml	DHB-0223-50ML	8000	\N	t	2026-07-16 15:11:28.003	2026-07-19 14:17:56.27	t
8ec7cd20-35f2-43eb-9e72-1907a19d6ded	3b7f7d83-9e8d-4e86-941d-48ebd74ce50d	50ml	DHB-0224-50ML	8000	\N	t	2026-07-16 15:11:30.669	2026-07-19 14:18:01.329	t
0d9d47cc-964a-49d8-9d84-17eecb2a8533	43494570-705a-4197-9dd7-fff7505dd335	50ml	DHB-0225-50ML	8000	\N	t	2026-07-16 15:11:33.301	2026-07-19 14:18:06.907	t
9303b692-f85e-4f27-a006-cdf6aa3f422f	2b8a4d23-039b-4e32-a1e6-f8e28728733c	50ml	DHB-0226-50ML	8000	\N	t	2026-07-16 15:11:36.211	2026-07-19 14:18:10.873	t
9103fc40-d415-4ce8-be98-9141d8f23304	90538320-a765-48ba-b11e-39517b851ff8	50ml	DHB-0227-50ML	8000	\N	t	2026-07-16 15:11:38.763	2026-07-19 14:18:14.272	t
cc057395-3947-47db-863b-ecc54b2f1823	af8899cf-4ee6-4101-a640-3cd0f0c61870	50ml	DHB-0228-50ML	8000	\N	t	2026-07-16 15:11:42.052	2026-07-19 14:18:18.126	t
7b949271-b5e9-497c-b962-19c0a956a5e9	757f5ca5-6987-439d-adf7-d2c7404911e9	50ml	DHB-0229-50ML	8000	\N	t	2026-07-16 15:11:44.887	2026-07-19 14:18:22.676	t
ee041f5f-7152-400a-8033-ac632a688676	ff1a0c73-a68a-45f1-bc58-542660d04108	50ml	DHB-0230-50ML	8000	\N	t	2026-07-16 15:11:47.695	2026-07-19 14:18:26.677	t
a8de6020-a0f4-4569-b9c4-23a8acec979d	b8f49443-825f-402d-8a87-98df3f13322d	50ml	DHB-0231-50ML	8000	\N	t	2026-07-16 15:11:50.889	2026-07-19 14:18:30.451	t
adfd133b-a542-4fab-9afe-752a81d8d5fd	27028cb6-61cc-4664-9d15-c39bef00eced	50ml	DHB-0232-50ML	8000	\N	t	2026-07-16 15:11:53.832	2026-07-19 14:18:34.143	t
2a90ae63-dd74-4adc-a51c-a6f075bbed32	9ab9be03-ca2d-49c0-9e18-a16f15f96d35	50ml	DHB-0233-50ML	8000	\N	t	2026-07-16 15:11:57.263	2026-07-19 14:18:37.516	t
5122feb0-bc12-4b72-9cea-e076ecceae37	6bdbb989-d52c-46ae-9fb6-a7ace9089b6d	50ml	DHB-0234-50ML	8000	\N	t	2026-07-16 15:12:00.442	2026-07-19 14:18:41.618	t
9e286cde-ab73-493e-a010-7c88183cbcaa	ae7bca18-fd4d-4ec3-bb28-3b2734da687b	50ml	DHB-0235-50ML	8000	\N	t	2026-07-16 15:12:03.728	2026-07-19 14:18:45.433	t
c229bd52-5773-4128-8dea-557d5b98f15d	e60a4b7d-e652-4115-9310-04dae4a2f227	50ml	DHB-0236-50ML	8000	\N	t	2026-07-16 15:12:06.732	2026-07-19 14:18:50.544	t
bab83fab-d6a2-48a3-aa9a-8c3e664f3e84	a1f0ff8c-81d4-48bf-b7c2-bc297b29bab8	50ml	DHB-0237-50ML	8000	\N	t	2026-07-16 15:12:09.887	2026-07-19 14:18:54.512	t
19896e1e-ba8a-4200-a963-f9ff215f7fd2	d851ea0e-5b15-48d4-8d3c-c07e0836a988	50ml	DHB-0238-50ML	8000	\N	t	2026-07-16 15:12:12.944	2026-07-19 14:18:58.523	t
4f302e85-97f8-414a-9be7-bd0c0b830a4d	0e34cefc-9cc3-4e13-b25a-2a1b01bbd4c2	50ml	DHB-0239-50ML	8000	\N	t	2026-07-16 15:12:16.094	2026-07-19 14:19:02.196	t
efcfc486-5705-4e56-afc7-24840f0a83ab	ea726d02-55d5-4257-885f-7cfafa201f43	50ml	DHB-0240-50ML	8000	\N	t	2026-07-16 15:12:19.415	2026-07-19 14:19:05.882	t
1aba5ae1-fcaa-4e84-96a2-fce7c93d5486	2a20229e-a62d-4427-9950-3e1846971720	50ml	DHB-0241-50ML	8000	\N	t	2026-07-16 15:12:22.467	2026-07-19 14:19:09.994	t
bd9b25a3-1a19-433b-8260-99c28f0618b5	00f161f6-53e4-4191-85b2-81e573898f95	50ml	DHB-0242-50ML	8000	\N	t	2026-07-16 15:12:25.14	2026-07-19 14:19:13.663	t
6cc57495-e08b-419f-8805-35c46c736e36	35c2337d-e95e-4ae1-a3f2-1665b4976aea	200ml	DHB-0419-200ML	20000	\N	t	2026-07-16 15:22:14.603	2026-07-19 14:30:21.337	t
a703f120-b444-45ec-8844-979a588b89c3	f05c2b56-41ba-4ec1-8cc3-9f8f0b1f8607	200ml	DHB-0420-200ML	20000	\N	t	2026-07-16 15:22:17.854	2026-07-19 14:30:24.42	t
bf66ef8f-8877-47b6-9590-91d6a6ca5a65	3efda889-e47d-4e4a-a031-df3cf1959823	200ml	DHB-0421-200ML	20000	\N	t	2026-07-16 15:22:21.744	2026-07-19 14:30:27.741	t
eb55a695-bd16-42a3-8ded-962e7df83947	8f5a737b-4122-4e72-b68d-d22363b7f3bb	200ml	DHB-0422-200ML	20000	\N	t	2026-07-16 15:22:24.835	2026-07-19 14:30:30.895	t
ef215a59-a3a8-4ae1-977d-87127224582c	ffc9fa3a-300b-4f16-ae34-05217b887280	200ml	DHB-0423-200ML	20000	\N	t	2026-07-16 15:22:27.774	2026-07-19 14:30:33.947	t
20bf92be-7c3b-409a-9500-53a175d4298c	af8899cf-4ee6-4101-a640-3cd0f0c61870	200ml	DHB-0228-200ML	20000	\N	t	2026-07-16 15:11:42.643	2026-07-19 14:18:18.654	t
791dca60-22f5-4d23-877e-bb48f1a79079	757f5ca5-6987-439d-adf7-d2c7404911e9	200ml	DHB-0229-200ML	20000	\N	t	2026-07-16 15:11:45.431	2026-07-19 14:18:23.322	t
5ac35393-07e5-4d34-b8fe-a8737ece9de0	ff1a0c73-a68a-45f1-bc58-542660d04108	200ml	DHB-0230-200ML	20000	\N	t	2026-07-16 15:11:48.335	2026-07-19 14:18:27.38	t
455ac852-0854-4bf0-bec4-d38b81b5eef6	71cb70a1-52af-43b0-b06b-5a51225a84a6	50ml	DHB-0243-50ML	8000	\N	t	2026-07-16 15:12:28.374	2026-07-19 14:19:17.792	t
1e4bb7f8-60f1-434a-932a-12dbee08fcca	bcfbe8d4-46e1-43cd-aa18-f2aad6130d19	50ml	DHB-0244-50ML	8000	\N	t	2026-07-16 15:12:31.487	2026-07-19 14:19:21.956	t
5818d4d6-dc01-48b6-8f9e-eac3998a8238	cd839cb5-2ab8-4312-9208-7949f79474c4	50ml	DHB-0245-50ML	8000	\N	t	2026-07-16 15:12:34.432	2026-07-19 14:19:25.958	t
a298c06d-5e32-4ecd-afa9-5bde0d530777	944dfaa0-f4f3-4dd8-9ed0-bd48dc76424f	50ml	DHB-0246-50ML	8000	\N	t	2026-07-16 15:12:37.546	2026-07-19 14:19:29.946	t
093a27ce-6b16-4c5f-84ac-0f5e7f7619ef	3ff9c784-ccd9-4adb-a793-a8cee2e525c3	50ml	DHB-0247-50ML	8000	\N	t	2026-07-16 15:12:40.158	2026-07-19 14:19:33.629	t
0ec41308-a71f-4690-aed2-29ad180ed092	1a6602ed-b11a-488e-a848-8f621dd1e5e8	50ml	DHB-0248-50ML	8000	\N	t	2026-07-16 15:12:43.179	2026-07-19 14:19:38.246	t
812bb430-63f7-413c-974a-57316c20cc20	f4ae23f0-da72-4b5e-80d2-eac5adff8d2d	50ml	DHB-0249-50ML	8000	\N	t	2026-07-16 15:12:46.038	2026-07-19 14:19:42.089	t
5fd765a5-62a9-43b4-80c1-8a281138f6c4	48102744-674a-4139-9202-b5309f6408d6	50ml	DHB-0250-50ML	8000	\N	t	2026-07-16 15:12:48.895	2026-07-19 14:19:46.387	t
4b323031-0d79-4ad0-a64d-721cb02ff383	0a8afc61-f4f1-4199-9fca-50acb7fd6901	50ml	DHB-0251-50ML	8000	\N	t	2026-07-16 15:12:51.824	2026-07-19 14:19:50.597	t
0c7df76a-1967-404c-9609-be9f463a9778	ebf46448-a544-4310-be0d-422ef7a4cb8e	50ml	DHB-0252-50ML	8000	\N	t	2026-07-16 15:12:54.746	2026-07-19 14:19:54.174	t
90acec37-a37a-4874-823b-d6888226852e	57b46ceb-25cc-4199-8012-5bc765717a84	50ml	DHB-0253-50ML	8000	\N	t	2026-07-16 15:12:57.407	2026-07-19 14:19:58.217	t
a90a9718-4016-466a-9f66-4c6029d16a73	6d13868d-2e0f-41f9-a25a-6ca609740b50	50ml	DHB-0254-50ML	8000	\N	t	2026-07-16 15:13:00.469	2026-07-19 14:20:01.867	t
e61f765b-9454-4352-8ac6-302ea7d94f0a	b1b782a4-1c73-42fc-a864-120b7dcdb6d6	50ml	DHB-0255-50ML	8000	\N	t	2026-07-16 15:13:03.305	2026-07-19 14:20:05.556	t
bd04e37f-806f-4ab5-a2b3-7ae504fcfe8d	59110147-0dd3-4c94-b06c-f80a08d09dc2	50ml	DHB-0256-50ML	8000	\N	t	2026-07-16 15:13:05.832	2026-07-19 14:20:08.981	t
106074eb-277b-4d88-82ee-6d74d790e2f8	e2c598d0-97e7-43b4-b51d-16f04be0cc13	50ml	DHB-0347-50ML	8000	\N	t	2026-07-16 15:17:55.779	2026-07-19 14:26:13.504	t
c4540cf1-ba97-49c4-9ec9-3d90f16eb571	05f759bd-1f4f-4c05-a48c-8a2254e4e6b0	50ml	DHB-0358-50ML	8000	\N	t	2026-07-16 15:18:36.601	2026-07-19 14:26:55.704	t
aa4f324d-cb53-431a-a69d-f3d6eebf9f81	d506b07e-7e0c-48f6-90cc-85cb01c1dfcf	50ml	DHB-0359-50ML	8000	\N	t	2026-07-16 15:18:40.316	2026-07-19 14:26:59.074	t
5b4187a3-4caa-4816-b8b2-490dbdd0fb5c	4e9f33ef-4565-4855-b62d-5cf3c43145cc	50ml	DHB-0360-50ML	8000	\N	t	2026-07-16 15:18:43.385	2026-07-19 14:27:02.456	t
2ff4880d-b619-41b2-a5ba-20204261aef2	6710dad2-5d74-4fdd-b8b6-1cba5b41700d	50ml	DHB-0361-50ML	8000	\N	t	2026-07-16 15:18:46.342	2026-07-19 14:27:05.888	t
b9984554-7882-4359-bebc-81e9b92bd230	0a75d486-578f-4ff3-9d36-7f6f8dab6580	50ml	DHB-0362-50ML	8000	\N	t	2026-07-16 15:18:49.182	2026-07-19 14:27:09.212	t
6508367c-3b66-4451-8bde-3e165b42e760	6a0f6f75-6de5-4e9b-863d-d9c7aa5a18f0	100ml	DHB-0425-100ML	12000	\N	t	2026-07-16 15:22:33.1	2026-07-19 14:30:39.454	t
e9c5d00d-33e2-4b2c-90cf-e334a024d19b	6a0f6f75-6de5-4e9b-863d-d9c7aa5a18f0	200ml	DHB-0425-200ML	20000	\N	t	2026-07-16 15:22:33.41	2026-07-19 14:30:39.717	t
372bf8e7-36ac-456b-ac56-f93a7fa30777	ee04f101-b607-4ee7-81d4-d311d0ab312b	100ml	DHB-0426-100ML	12000	\N	t	2026-07-16 15:22:35.97	2026-07-19 14:30:42.172	t
f14ca5c7-8643-4999-810c-8cf5e5079883	ee04f101-b607-4ee7-81d4-d311d0ab312b	200ml	DHB-0426-200ML	20000	\N	t	2026-07-16 15:22:36.247	2026-07-19 14:30:42.438	t
5d217f8d-321b-4a09-81cd-afe19b3d0a42	ff44fb09-7713-4a5f-a831-e3ba2fb1a992	100ml	DHB-0427-100ML	12000	\N	t	2026-07-16 15:22:38.947	2026-07-19 14:30:44.927	t
50890b15-06b3-4d79-96f1-6b29d9608e6a	ff44fb09-7713-4a5f-a831-e3ba2fb1a992	200ml	DHB-0427-200ML	20000	\N	t	2026-07-16 15:22:39.261	2026-07-19 14:30:45.283	t
47f1f8ea-fb4e-4be6-bbe3-84d3c4d9c8cf	904ce087-3ae9-49d3-936e-ae6885300c67	100ml	DHB-0429-100ML	12000	\N	t	2026-07-16 15:22:44.413	2026-07-19 14:30:50.917	t
bc9af1bf-fc79-4d76-ac11-3e9d71bf6471	bcfbe8d4-46e1-43cd-aa18-f2aad6130d19	200ml	DHB-0244-200ML	20000	\N	t	2026-07-16 15:12:32.211	2026-07-19 14:19:22.577	t
5be05607-3afc-43df-9715-f132a58de44f	cd839cb5-2ab8-4312-9208-7949f79474c4	200ml	DHB-0245-200ML	20000	\N	t	2026-07-16 15:12:34.989	2026-07-19 14:19:26.668	t
066310c7-4d34-4458-b3ca-622a39fdfc3c	944dfaa0-f4f3-4dd8-9ed0-bd48dc76424f	200ml	DHB-0246-200ML	20000	\N	t	2026-07-16 15:12:38.15	2026-07-19 14:19:30.561	t
c11d156a-3bcb-4ce7-8f7b-31477628443a	3ff9c784-ccd9-4adb-a793-a8cee2e525c3	200ml	DHB-0247-200ML	20000	\N	t	2026-07-16 15:12:40.859	2026-07-19 14:19:34.203	t
34cb81cc-7c8f-4535-b50d-2ab33422e0f5	1a6602ed-b11a-488e-a848-8f621dd1e5e8	200ml	DHB-0248-200ML	20000	\N	t	2026-07-16 15:12:43.841	2026-07-19 14:19:38.818	t
6e50d614-1208-4f9e-9d49-0b37b94062e4	f4ae23f0-da72-4b5e-80d2-eac5adff8d2d	200ml	DHB-0249-200ML	20000	\N	t	2026-07-16 15:12:46.78	2026-07-19 14:19:43.35	t
a1a1ed1e-fe6c-4354-9998-c2b857f7fd72	48102744-674a-4139-9202-b5309f6408d6	200ml	DHB-0250-200ML	20000	\N	t	2026-07-16 15:12:49.421	2026-07-19 14:19:47.045	t
1c9cde13-36bc-4289-8ebe-3d8119f01ed7	0a8afc61-f4f1-4199-9fca-50acb7fd6901	200ml	DHB-0251-200ML	20000	\N	t	2026-07-16 15:12:52.479	2026-07-19 14:19:51.126	t
8ebb7132-205d-404c-90e7-d2dad0df8778	ebf46448-a544-4310-be0d-422ef7a4cb8e	200ml	DHB-0252-200ML	20000	\N	t	2026-07-16 15:12:55.271	2026-07-19 14:19:54.808	t
cb2fc2e4-5c01-407c-91d9-8aa63621cb80	57b46ceb-25cc-4199-8012-5bc765717a84	200ml	DHB-0253-200ML	20000	\N	t	2026-07-16 15:12:58.122	2026-07-19 14:19:58.938	t
29ed448e-5107-4bc4-a5d5-e74eb94b66cd	6d13868d-2e0f-41f9-a25a-6ca609740b50	200ml	DHB-0254-200ML	20000	\N	t	2026-07-16 15:13:01.082	2026-07-19 14:20:02.507	t
1c30c57c-b1f4-42c9-8a42-7f72daa4ce56	8c4c41bf-b35f-464b-be5f-11e7ebe18569	50ml	DHB-0257-50ML	8000	\N	t	2026-07-16 15:13:08.545	2026-07-19 14:20:12.644	t
e3bdc0d9-17d0-4e74-9af4-ac1b7f2ac9ee	cb400a40-b9b3-49b4-a1d5-90cd684a69d2	50ml	DHB-0258-50ML	8000	\N	t	2026-07-16 15:13:11.184	2026-07-19 14:20:16.037	t
5b4b28ca-dc8a-44ba-8cff-4b15ddff574e	2e09f8a6-623b-4612-a9f4-4c1fc8b85d1a	50ml	DHB-0259-50ML	8000	\N	t	2026-07-16 15:13:14.363	2026-07-19 14:20:19.834	t
199e3ba0-644a-46a7-917e-bc8a32678738	b0bc5542-772e-4673-9b0b-08a1ff1cd72d	50ml	DHB-0260-50ML	8000	\N	t	2026-07-16 15:13:17.402	2026-07-19 14:20:24.217	t
bf14214e-b570-47bc-9506-3aa1555e6aad	f7a40dcd-62dd-417a-b2a6-15f863f10f7f	50ml	DHB-0350-50ML	8000	\N	t	2026-07-16 15:18:05.793	2026-07-19 14:26:24.584	t
cb5aa8fc-e6ad-43bd-96e8-5f49ad03a764	daa86be6-7e10-4c4f-80d6-38bdd01adc39	50ml	DHB-0353-50ML	8000	\N	t	2026-07-16 15:18:15.699	2026-07-19 14:26:37.057	t
993fa4ef-2aa6-41ef-a03b-5bb23488b511	e247941c-13bb-4492-b6aa-5d2ffb4a9697	50ml	DHB-0355-50ML	8000	\N	t	2026-07-16 15:18:25.443	2026-07-19 14:26:45.659	t
a117b53e-5728-4cda-bed4-f4174979f729	ed9289e2-1605-4b32-882a-13022ad8d23f	50ml	DHB-0356-50ML	8000	\N	t	2026-07-16 15:18:29.654	2026-07-19 14:26:48.948	t
a473e63a-8f5a-4c9c-980f-35ef4828aa8f	cdff64c6-23d9-4f6b-8a82-597f9fe21252	50ml	DHB-0357-50ML	8000	\N	t	2026-07-16 15:18:33.643	2026-07-19 14:26:52.213	t
f2524b5e-7eed-4155-bb9d-b8d3b3abb705	9bc5ebc2-2d14-4cac-995a-f68644aa470f	50ml	DHB-0363-50ML	8000	\N	t	2026-07-16 15:18:52.581	2026-07-19 14:27:12.696	t
e3594fbf-83c5-447c-a2bf-0816187eddba	e049d23f-ffcb-492a-b8c8-b3c85cdf904f	50ml	DHB-0364-50ML	8000	\N	t	2026-07-16 15:18:57.818	2026-07-19 14:27:16.949	t
b8279d45-067d-439c-b29a-3f183377059f	e9580454-bcd2-48f6-bfe5-8bebfd8bfe5f	50ml	DHB-0365-50ML	8000	\N	t	2026-07-16 15:19:01.52	2026-07-19 14:27:20.173	t
8beac5c8-7b28-421f-92fc-611ebe0a5660	d373522a-ee6a-4a93-82c3-d097101bd6db	50ml	DHB-0366-50ML	8000	\N	t	2026-07-16 15:19:04.474	2026-07-19 14:27:23.848	t
ca5668b9-3c30-4826-9f7d-50aaa91bd05b	abfdfdef-4e7e-4c38-968c-f4d88d5d0ff4	50ml	DHB-0367-50ML	8000	\N	t	2026-07-16 15:19:08.126	2026-07-19 14:27:27.394	t
1ca6fdf2-3a8a-457c-9ac8-ae2346617e6a	43383ca1-daab-4dd3-8e8d-784a7414bf57	50ml	DHB-0368-50ML	8000	\N	t	2026-07-16 15:19:12.363	2026-07-19 14:27:30.716	t
8ea63d55-4d29-4bd9-8207-45256af83e6a	e80beb5a-00f2-4ed2-8a1e-ea66794da288	50ml	DHB-0369-50ML	8000	\N	t	2026-07-16 15:19:16.447	2026-07-19 14:27:34.517	t
0974cc78-4e77-48f5-9cb1-55e5e678ce38	76783e87-3b7f-410f-8560-13535cbd0431	50ml	DHB-0370-50ML	8000	\N	t	2026-07-16 15:19:19.701	2026-07-19 14:27:37.426	t
486d5e5a-2688-4fc2-8642-21a9475aabc2	659df86c-cea1-459c-9e9f-2df775204f2c	200ml	DHB-0428-200ML	20000	\N	t	2026-07-16 15:22:41.989	2026-07-19 14:30:47.997	t
c07b6231-fa4b-4977-ad68-c6f54838e259	2d7e52f0-0a83-46fd-908e-3bad0d6f2ebd	50ml	DHB-0271-50ML	8000	\N	t	2026-07-16 15:13:49.26	2026-07-19 14:21:06.608	t
ceb7b443-72e8-421d-8d10-69e8f452fdbd	94daadee-0da8-419b-a232-88f91dfdefa5	50ml	DHB-0272-50ML	8000	\N	t	2026-07-16 15:13:52.896	2026-07-19 14:21:10.705	t
88a06257-a57e-4338-9d77-22ffcc1f8663	7845df49-d2ec-4e83-8e71-ac3a4a210ffa	50ml	DHB-0273-50ML	8000	\N	t	2026-07-16 15:13:56.394	2026-07-19 14:21:14.806	t
38c48463-edd7-4d96-b6e1-44fb93dbf3a6	2871ddbb-2671-4d9a-9dd7-5202d2e81e7f	50ml	DHB-0100-50ML	8000	\N	t	2026-07-16 15:05:27.394	2026-07-19 14:08:50.718	t
5bfc60ba-b4e0-4278-a28c-490467c3dcbc	4c28cde6-9244-4748-8da3-a164a1d3a560	50ml	DHB-0371-50ML	8000	\N	t	2026-07-16 15:19:22.755	2026-07-19 14:27:40.861	t
6b4aa7de-f4bc-4ce0-9c35-27b8b8da474d	659df86c-cea1-459c-9e9f-2df775204f2c	100ml	DHB-0428-100ML	12000	\N	t	2026-07-16 15:22:41.708	2026-07-19 14:30:47.734	t
69d37e2c-5c10-4c95-b27f-154ff59de3f3	4ae3aa41-93e7-4e06-80d8-c699daf343c9	50ml	DHB-0101-50ML	8000	\N	t	2026-07-16 15:05:29.853	2026-07-19 14:08:53.993	t
e15aa683-200f-4e3a-a458-af0d93f79b99	904ce087-3ae9-49d3-936e-ae6885300c67	200ml	DHB-0429-200ML	20000	\N	t	2026-07-16 15:22:44.692	2026-07-19 14:30:51.18	t
9f0fff05-e02c-4bee-ad8b-3f8495bc2ab3	cae436e6-d154-411a-b8bb-60ba4296386e	50ml	DHB-0102-50ML	8000	\N	t	2026-07-16 15:05:32.632	2026-07-19 14:08:58.641	t
7d345489-ad3d-43b1-a290-eb13f3e6a38e	bb352e30-0643-4ab2-9d43-b6ef7bb59e7d	50ml	DHB-0105-50ML	8000	\N	t	2026-07-16 15:05:43.872	2026-07-19 14:09:10.318	t
6dab2cc8-15c3-4428-b7d0-d273a26da59b	04a92a24-3e48-4d18-8d47-1b4d07ac827f	50ml	DHB-0106-50ML	8000	\N	t	2026-07-16 15:05:46.586	2026-07-19 14:09:13.75	t
4b19492a-638d-4ae0-9e11-3e8f9dc71780	a3c1e88a-5ac7-4bb9-80bb-6e8b07d07060	50ml	DHB-0107-50ML	8000	\N	t	2026-07-16 15:05:49.294	2026-07-19 14:09:17.186	t
b1ebb1f4-90a6-438b-b587-530bedb9709c	85d4e3e0-0d70-40f0-9136-a796dedee9e6	50ml	DHB-0261-50ML	8000	\N	t	2026-07-16 15:13:20.345	2026-07-19 14:20:28.105	t
74fc2c50-99e8-4729-98d6-5ace9e9c2b7a	85d4e3e0-0d70-40f0-9136-a796dedee9e6	200ml	DHB-0261-200ML	20000	\N	t	2026-07-16 15:13:20.949	2026-07-19 14:20:28.728	t
ead76d73-6c71-49bd-952d-871e9abd56ba	022a4e77-f3c0-4504-9d5a-e2e12d178fb7	50ml	DHB-0262-50ML	8000	\N	t	2026-07-16 15:13:23.105	2026-07-19 14:20:31.895	t
916b1e86-97f7-4fde-afd1-dfcb8fb53146	022a4e77-f3c0-4504-9d5a-e2e12d178fb7	200ml	DHB-0262-200ML	20000	\N	t	2026-07-16 15:13:23.67	2026-07-19 14:20:32.512	t
f047d394-29ea-436b-aac6-c0257d5a2640	fbb2f6c1-a13d-42e9-8af9-3327159f0a8c	50ml	DHB-0263-50ML	8000	\N	t	2026-07-16 15:13:25.774	2026-07-19 14:20:35.392	t
4f850c92-dec5-4a3e-8f5e-fe4de4381e78	a275de9a-5f98-4ee6-8a04-415330eb7c9b	50ml	DHB-0264-50ML	8000	\N	t	2026-07-16 15:13:28.501	2026-07-19 14:20:39.501	t
4803aa19-254e-447f-bd93-ef340ca70108	a91ae67a-695a-4cdc-a537-753e7469182d	50ml	DHB-0265-50ML	8000	\N	t	2026-07-16 15:13:31.123	2026-07-19 14:20:43.466	t
cc604d00-660c-4ece-8ac3-4af4127921f0	8a55e6a6-c88d-4c6d-88e7-d4d07dca202b	50ml	DHB-0266-50ML	8000	\N	t	2026-07-16 15:13:33.951	2026-07-19 14:20:47.049	t
59e5668a-ff3f-4826-b692-e049e0cae775	59a459d0-4195-4186-9b29-4a801aa14872	50ml	DHB-0267-50ML	8000	\N	t	2026-07-16 15:13:36.797	2026-07-19 14:20:51.002	t
c9fb7289-3836-43d5-908a-05d6f4e9e75b	47a8028b-d94e-4f27-b0b7-56a2ae1e8bae	50ml	DHB-0268-50ML	8000	\N	t	2026-07-16 15:13:39.706	2026-07-19 14:20:54.927	t
b3b7432f-7c13-461e-b9d8-7e89188c4bcc	fc4e72d9-de13-42f3-a44a-529a89e1e2d4	50ml	DHB-0269-50ML	8000	\N	t	2026-07-16 15:13:42.767	2026-07-19 14:20:59.456	t
a055d593-4e91-4cf1-a93e-54c5e3340e36	7333c793-92dc-4d5a-b91a-0b3dcd894eb2	50ml	DHB-0270-50ML	8000	\N	t	2026-07-16 15:13:46.045	2026-07-19 14:21:02.841	t
ddf4bd0a-b3d9-4e19-a172-3138b289ae6d	8b936488-54bb-4aef-aa2b-9d9fc982a6a1	200ml	DHB-0430-200ML	20000	\N	t	2026-07-16 15:22:47.88	2026-07-19 14:30:54.545	t
92cd7f28-2960-49a1-a18d-6c5659a46949	798238eb-5828-4dc2-ab17-9d1cfa155707	200ml	DHB-0439-200ML	20000	\N	t	2026-07-16 15:23:13.519	2026-07-19 14:31:27.984	t
867b256f-591c-4a0a-ba3c-60fce05f9892	f11894e2-357c-4128-89c8-2ac34c71feb6	200ml	DHB-0442-200ML	20000	\N	t	2026-07-16 15:23:21.246	2026-07-19 14:31:39.41	t
c0e5ee1b-d3e8-4922-aa8c-3610a8abf792	d2a0f31c-8663-49d1-9132-0c3005d100e9	50ml	DHB-0274-50ML	8000	\N	t	2026-07-16 15:13:59.403	2026-07-19 14:21:18.979	t
1e0549df-fd6e-4a62-9fab-2fa997b6587b	30a7e534-d700-4613-b061-6e9085db3e96	50ml	DHB-0275-50ML	8000	\N	t	2026-07-16 15:14:02.746	2026-07-19 14:21:22.994	t
12784dfa-b9e2-42e9-9de9-bfb8dea0b09d	5c508d38-7c4b-4b8f-aeb1-f9e125d225bd	50ml	DHB-0276-50ML	8000	\N	t	2026-07-16 15:14:05.491	2026-07-19 14:21:26.988	t
5ae643c8-2998-4c1d-bb9b-7248846f8c80	e2f40d3e-b803-4edb-bee2-6b8a89aafca9	50ml	DHB-0277-50ML	8000	\N	t	2026-07-16 15:14:08.462	2026-07-19 14:21:31.228	t
4e454ece-c98a-4310-ab26-6425fa85944f	12a3d9a1-c44e-4fdf-aaf8-4eec621794b8	50ml	DHB-0278-50ML	8000	\N	t	2026-07-16 15:14:11.328	2026-07-19 14:21:35.299	t
b51ecb2e-bef9-4463-8d33-e82f0d4d0b01	1b4f0479-08ff-4fb7-a48c-8d7d1a9319d7	50ml	DHB-0279-50ML	8000	\N	t	2026-07-16 15:14:14.101	2026-07-19 14:21:39.278	t
7168e460-09d6-4088-a023-2f25549aef2e	59dfaf31-6b17-4d0a-a15d-81cb250f40e4	50ml	DHB-0280-50ML	8000	\N	t	2026-07-16 15:14:17.204	2026-07-19 14:21:43.37	t
0630f791-de49-4679-bdc0-7752f2bf0a47	cb7b75da-eca0-4e78-bbfa-5a01bf0eb4fb	50ml	DHB-0281-50ML	8000	\N	t	2026-07-16 15:14:20.145	2026-07-19 14:21:47.276	t
15ed807b-b60e-4a26-9f81-b7bc4a2db626	0a6ef255-7fab-4a0b-b69a-3a95b77894b6	50ml	DHB-0282-50ML	8000	\N	t	2026-07-16 15:14:23.309	2026-07-19 14:21:51.227	t
55b3cfad-786d-4b7a-8a5c-4a865c2a117f	ffa99d71-5c66-485b-962e-60b1383fd7a6	50ml	DHB-0283-50ML	8000	\N	t	2026-07-16 15:14:26.29	2026-07-19 14:21:54.968	t
ed402da9-7ef0-4858-82e1-f0a5296c4d96	cc317f86-9b40-436e-92ef-0f0eab00699a	50ml	DHB-0284-50ML	8000	\N	t	2026-07-16 15:14:29.258	2026-07-19 14:21:59.039	t
8d0ccfe8-6ccc-4b06-bf6b-aa932d4eb4cd	31cc7a30-cd6a-4095-9662-2e562b960e4f	50ml	DHB-0285-50ML	8000	\N	t	2026-07-16 15:14:32.524	2026-07-19 14:22:03.091	t
f7e20321-aec2-4e12-98a2-79b5336186b9	7eb16ed2-8737-4b3a-8e55-76aa65f55ea6	50ml	DHB-0286-50ML	8000	\N	t	2026-07-16 15:14:35.29	2026-07-19 14:22:07.54	t
47efc9f3-2caa-4182-97bd-41c0b8c6578d	1c13ab6e-6ce7-4c70-bd84-9f8bf4373d75	50ml	DHB-0287-50ML	8000	\N	t	2026-07-16 15:14:37.959	2026-07-19 14:22:11.136	t
c2c7f7c0-c313-431d-b07d-12c0f2c450c0	654b5cd7-b1d8-478e-8930-7b1e302fd1ad	50ml	DHB-0288-50ML	8000	\N	t	2026-07-16 15:14:41.037	2026-07-19 14:22:15.699	t
27b49418-ee1f-476a-b6f4-3a99dd6d453d	2a992096-8c7a-41dd-98a7-2687949b3154	50ml	DHB-0289-50ML	8000	\N	t	2026-07-16 15:14:44.401	2026-07-19 14:22:19.514	t
daece563-7f31-424b-b0c4-87a73217760d	62caf1c8-0aed-4178-8905-e2973a1d16ce	50ml	DHB-0290-50ML	8000	\N	t	2026-07-16 15:14:47.385	2026-07-19 14:22:23.212	t
7b1bc866-b9a4-42d0-90b9-659bcf51b490	5fdd1f1f-324f-4fee-9186-fd01bab67c16	50ml	DHB-0291-50ML	8000	\N	t	2026-07-16 15:14:50.063	2026-07-19 14:22:26.686	t
39df24ae-f7eb-44be-b6c1-9efb6d2bee57	b6891f3b-5f33-4b05-8ae5-e5d8deea26a9	50ml	DHB-0292-50ML	8000	\N	t	2026-07-16 15:14:52.978	2026-07-19 14:22:30.576	t
5d422e97-f7c9-436c-aa6f-d17b9b20e8e1	be44a0c2-782d-4834-ac0a-83de9f1db9db	50ml	DHB-0293-50ML	8000	\N	t	2026-07-16 15:14:56.187	2026-07-19 14:22:34.429	t
a2604746-6056-4579-ac0e-226694082a66	d36eded5-b156-431d-b081-6542eb328e72	50ml	DHB-0294-50ML	8000	\N	t	2026-07-16 15:14:59.252	2026-07-19 14:22:38.36	t
50029b2f-8211-40e3-bb28-5eeccbccdd3c	c5932bdc-6417-41a4-a3ff-1f50c74710a6	50ml	DHB-0295-50ML	8000	\N	t	2026-07-16 15:15:02.224	2026-07-19 14:22:42.147	t
a9864c95-6185-4dcf-bec6-6ea091c5705c	10df2330-c31b-454b-8f35-8e4ee05ca445	200ml	DHB-0431-200ML	20000	\N	t	2026-07-16 15:22:50.511	2026-07-19 14:30:57.291	t
b36f9d4f-dab2-4544-8c21-2f79b6f9ddbc	29c9ddae-afd0-4702-9732-c9dd05409ca7	200ml	DHB-0432-200ML	20000	\N	t	2026-07-16 15:22:53.4	2026-07-19 14:31:01.155	t
b1fc17b6-a96b-4db8-bd0d-1fdbc0b82076	b6fe8f53-aade-4915-9eff-0e671fa904ae	200ml	DHB-0433-200ML	20000	\N	t	2026-07-16 15:22:55.945	2026-07-19 14:31:04.756	t
46d2ffc0-b413-4b14-9ec7-3f22fd7a03d5	e2ff5d78-74e7-4bdf-be25-08804796ca26	200ml	DHB-0434-200ML	20000	\N	t	2026-07-16 15:22:58.908	2026-07-19 14:31:08.837	t
1391b2a4-81c6-4c1a-9b76-5b0f746ca545	db23f5a3-26c4-42ed-b209-9c884e21b45d	200ml	DHB-0435-200ML	20000	\N	t	2026-07-16 15:23:01.754	2026-07-19 14:31:12.543	t
8b8d4a47-ac9f-4b57-ab93-dcdad63470be	4842b000-f95f-41e2-a84c-1ed94570969a	50ml	DHB-0304-50ML	8000	\N	t	2026-07-16 15:15:29.564	2026-07-19 14:23:17.493	t
422f0156-a848-4fba-a083-86de00165dc3	3e7bbc35-a560-42bc-8617-40a3cd74827a	50ml	DHB-0372-50ML	8000	\N	t	2026-07-16 15:19:26.509	2026-07-19 14:27:44.851	t
334d8a0b-bfda-4bf9-bff6-69cc6bdb241c	2d697d0a-30d0-4388-a0f5-ca1201ffe541	50ml	DHB-0108-50ML	8000	\N	t	2026-07-16 15:05:53.126	2026-07-19 14:09:20.561	t
591477cb-95c8-4b06-aa82-85d6c8736577	8323296c-8ed6-4243-9234-54a2b6e6114c	50ml	DHB-0109-50ML	8000	\N	t	2026-07-16 15:05:55.892	2026-07-19 14:09:24.419	t
c98bc3c8-48f1-4548-a2c0-ed0d045154a1	be44a0c2-782d-4834-ac0a-83de9f1db9db	200ml	DHB-0293-200ML	20000	\N	t	2026-07-16 15:14:56.811	2026-07-19 14:22:34.968	t
9dd5f665-c93d-4322-bead-3a01a734e128	d36eded5-b156-431d-b081-6542eb328e72	200ml	DHB-0294-200ML	20000	\N	t	2026-07-16 15:14:59.955	2026-07-19 14:22:38.973	t
8d2905c7-82dc-416f-ae08-e550a01447c6	c5932bdc-6417-41a4-a3ff-1f50c74710a6	200ml	DHB-0295-200ML	20000	\N	t	2026-07-16 15:15:02.853	2026-07-19 14:22:42.724	t
beb3583d-a86d-443d-a970-64f0cd55eecc	afb5363d-7f58-4914-8c91-3273be4edf73	50ml	DHB-0296-50ML	8000	\N	t	2026-07-16 15:15:05.03	2026-07-19 14:22:45.731	t
cdb5bf7e-e94f-4313-bb2e-ccf16e3bca39	afb5363d-7f58-4914-8c91-3273be4edf73	200ml	DHB-0296-200ML	20000	\N	t	2026-07-16 15:15:05.817	2026-07-19 14:22:46.354	t
ae8bc682-887a-4641-a975-2db49b4b06dc	4f5a298c-8b10-4cd4-8fbc-e97640007ee2	50ml	DHB-0297-50ML	8000	\N	t	2026-07-16 15:15:08.059	2026-07-19 14:22:49.726	t
9aea8643-0609-44a0-a32f-483f0b9efc4a	4f5a298c-8b10-4cd4-8fbc-e97640007ee2	200ml	DHB-0297-200ML	20000	\N	t	2026-07-16 15:15:08.639	2026-07-19 14:22:50.26	t
5a4059d0-138d-419e-9704-cd108c96c1d8	9a7be05b-90aa-4416-a136-864793f53174	50ml	DHB-0298-50ML	8000	\N	t	2026-07-16 15:15:10.927	2026-07-19 14:22:53.474	t
166268b1-0e0a-4a0e-aa4b-5708705da96c	9a7be05b-90aa-4416-a136-864793f53174	200ml	DHB-0298-200ML	20000	\N	t	2026-07-16 15:15:11.516	2026-07-19 14:22:54.231	t
26d86871-f845-4e80-bb29-ab5f08f17185	f6d65d00-7f47-4b55-8590-fdab9ce175aa	50ml	DHB-0299-50ML	8000	\N	t	2026-07-16 15:15:13.913	2026-07-19 14:22:57.712	t
69cc935e-43c1-4447-a902-732e57a58b9e	8a1a3ee2-53d8-4d82-bdfa-8536f274a554	50ml	DHB-0300-50ML	8000	\N	t	2026-07-16 15:15:17.191	2026-07-19 14:23:01.706	t
0c96be71-7b5a-417a-8bc7-4822d2eab668	99c569c0-af20-41ab-9b5a-6274d66d1523	50ml	DHB-0301-50ML	8000	\N	t	2026-07-16 15:15:20.145	2026-07-19 14:23:05.684	t
1482c845-bb56-4a87-8aed-83464a6a2ee0	4edadee5-1848-452a-9dec-461df9ed5d93	50ml	DHB-0302-50ML	8000	\N	t	2026-07-16 15:15:23.129	2026-07-19 14:23:09.592	t
85d6a794-d1ff-4458-8443-dda5912ed392	3ea1c578-aacf-41b2-96e9-42c5f6cba8a0	50ml	DHB-0303-50ML	8000	\N	t	2026-07-16 15:15:26.189	2026-07-19 14:23:13.487	t
9faa2aa4-24a9-445f-8fb3-7da675b70496	4f9d493f-bab8-4ea3-8cd4-bc152ea9a2a4	50ml	DHB-0373-50ML	8000	\N	t	2026-07-16 15:19:30.792	2026-07-19 14:27:48.757	t
248a765e-a79d-4e03-9d0e-2b283c7d8940	dcf4d80c-05b3-48ee-976b-30eaf422b597	50ml	DHB-0374-50ML	8000	\N	t	2026-07-16 15:19:34.553	2026-07-19 14:27:52.073	t
980deff6-12ff-401a-9f99-43e94d1846d7	1d080ae5-5366-49eb-b607-62616c9038fc	50ml	DHB-0375-50ML	8000	\N	t	2026-07-16 15:19:38.829	2026-07-19 14:27:55.555	t
80ab4477-38ae-48ee-8d93-833a4fa8f089	06e810f1-2dba-405a-ad71-9ebda8a08c80	50ml	DHB-0376-50ML	8000	\N	t	2026-07-16 15:19:42.924	2026-07-19 14:27:58.891	t
1d78f733-0a55-4aac-9691-f36f0612213b	92dc9eec-c14b-4985-8142-540ca06308b2	50ml	DHB-0377-50ML	8000	\N	t	2026-07-16 15:19:46.202	2026-07-19 14:28:02.669	t
1d2fb897-de1e-45b3-bc09-6563cfd6d0c0	66215338-6427-4b49-a126-f132ba519439	50ml	DHB-0378-50ML	8000	\N	t	2026-07-16 15:19:49.168	2026-07-19 14:28:05.971	t
a865752b-b695-4bbc-bdec-fac706804873	0d0b6b8d-4567-47be-840d-933fe96498cf	50ml	DHB-0379-50ML	8000	\N	t	2026-07-16 15:19:52.525	2026-07-19 14:28:09.177	t
22c5d056-1084-448d-ae71-5486651c477d	d48b933b-b1c5-4a1b-8f3d-beff03f3751d	200ml	DHB-0436-200ML	20000	\N	t	2026-07-16 15:23:04.736	2026-07-19 14:31:16.611	t
f91679f3-c87b-40a9-bca1-bca16c02fa80	d2862041-da7d-4bd6-a2b8-d04cccded51a	100ml	DHB-0437-100ML	12000	\N	t	2026-07-16 15:23:07.356	2026-07-19 14:31:19.729	t
8ec03ecf-f0a8-4402-94a4-e2d5a0953319	d2862041-da7d-4bd6-a2b8-d04cccded51a	200ml	DHB-0437-200ML	20000	\N	t	2026-07-16 15:23:07.623	2026-07-19 14:31:20.108	t
117de464-691f-473c-8541-0eb35b3b9200	7c24a04a-ebf6-46dd-9901-b990b1256737	200ml	DHB-0438-200ML	20000	\N	t	2026-07-16 15:23:10.607	2026-07-19 14:31:24.054	t
50e34efb-7f1d-42fe-a0ad-fee7dd9bedc7	53017bb5-499a-4e04-8e64-d38ecad10cd6	100ml	DHB-0002-100ML	12000	\N	t	2026-07-16 15:00:24.436	2026-07-19 14:01:49.053	t
a1b7c37f-5478-4efe-94f5-4b2e5858ee2d	df7b65c9-eb8d-46ee-a00a-fe2312ab53fb	100ml	DHB-0003-100ML	12000	\N	t	2026-07-16 15:00:29.615	2026-07-19 14:01:55.097	t
d151aa4b-2695-453c-aaec-e215da4adb47	b7e13877-b96e-45b0-bac1-571371854018	100ml	DHB-0004-100ML	12000	\N	t	2026-07-16 15:00:34.43	2026-07-19 14:02:00.725	t
70f5d582-378c-4870-9c4e-435f6305f9c1	0c50de65-748d-4d12-8885-296f2c5c7b0b	100ml	DHB-0005-100ML	12000	\N	t	2026-07-16 15:00:37.432	2026-07-19 14:02:04.318	t
f0357814-d330-41c8-95b3-406c0fe7826d	0f06ee55-2363-4bad-96fc-64e55d6f8be7	100ml	DHB-0006-100ML	12000	\N	t	2026-07-16 15:00:40.446	2026-07-19 14:02:08.146	t
44d3cc03-7fce-4303-8ac9-ac2a525ee21f	81a26ad3-7d36-484e-90c2-c9674528bd93	100ml	DHB-0007-100ML	12000	\N	t	2026-07-16 15:00:43.728	2026-07-19 14:02:12.103	t
6b353281-99c9-4bd7-81d0-e64a9643ef65	1955b6cf-5a80-4942-9158-f6fa057edb21	50ml	DHB-0454-50ML	8000	\N	t	2026-07-16 15:23:57.586	2026-07-19 14:32:25.286	t
79291af1-ce4e-4520-9eda-087d64e407cc	3614cc74-1402-4552-9a36-15e0f4ff832f	200ml	DHB-0311-200ML	20000	\N	t	2026-07-16 15:15:50.83	2026-07-19 14:23:45.558	t
12241f18-ccdd-4d4f-93f9-fc91e312f838	579447bd-e5d6-45b4-83f8-addaa6c5ea8c	50ml	DHB-0324-50ML	8000	\N	t	2026-07-16 15:16:36.067	2026-07-19 14:24:36.126	t
ccd3a7e5-ae2c-4a3b-a11f-1947b11cf650	579447bd-e5d6-45b4-83f8-addaa6c5ea8c	200ml	DHB-0324-200ML	20000	\N	t	2026-07-16 15:16:36.77	2026-07-19 14:24:37.332	t
63ff3ea5-82c3-4330-90f8-2ae2ba846e72	d1e9245e-e54d-4473-a200-109c97d64c7e	50ml	DHB-0327-50ML	8000	\N	t	2026-07-16 15:16:44.71	2026-07-19 14:24:48.023	t
50c83bb8-15fc-48f9-a061-3d7901388f5a	9457ded1-6ca4-4506-947a-835e8cdc38ea	100ml	DHB-0008-100ML	12000	\N	t	2026-07-16 15:00:46.72	2026-07-19 14:02:16.131	t
27c019cb-aa96-4e5b-8201-37a871217feb	749a3306-63b0-421e-8157-12afca50f3ef	100ml	DHB-0009-100ML	12000	\N	t	2026-07-16 15:00:50.512	2026-07-19 14:02:20.695	t
c36329bd-2fc8-45eb-8432-c9b61d9fded7	d732c139-274b-48d9-8f4b-bf6d776a789c	100ml	DHB-0010-100ML	12000	\N	t	2026-07-16 15:00:54.57	2026-07-19 14:02:24.588	t
ea7f5e63-8dd6-44df-b899-d74aa1a689f1	f45e847d-b184-445a-bdfe-b4727456655a	50ml	DHB-0305-50ML	8000	\N	t	2026-07-16 15:15:32.124	2026-07-19 14:23:21.264	t
42437306-feae-410b-b0e7-cd39de141971	27cb9ac7-885f-4658-8d5f-f6f16d855bb8	50ml	DHB-0306-50ML	8000	\N	t	2026-07-16 15:15:34.767	2026-07-19 14:23:24.666	t
1be2a5f7-b6e1-4913-98ba-1baf731c0128	6ac269ec-1522-4180-8e5d-47d1243fac64	50ml	DHB-0307-50ML	8000	\N	t	2026-07-16 15:15:38.167	2026-07-19 14:23:28.639	t
9d37f747-c00d-47e1-b521-027032062a22	d6219858-a813-4275-83fd-e0dc53e505b1	50ml	DHB-0308-50ML	8000	\N	t	2026-07-16 15:15:41.71	2026-07-19 14:23:32.634	t
b0f40c84-e577-42a0-a2e8-95ff79543644	33b2e338-22d7-4c7e-983c-dad575a28c34	50ml	DHB-0309-50ML	8000	\N	t	2026-07-16 15:15:44.887	2026-07-19 14:23:36.932	t
ed8fd24b-f42a-488c-a5a5-8be4cde429fb	bbb3ffcf-bcd3-4f09-b9f8-77b881cb4668	50ml	DHB-0310-50ML	8000	\N	t	2026-07-16 15:15:47.664	2026-07-19 14:23:40.721	t
73666c10-d066-419f-9ac8-ce240d32203e	bbb3ffcf-bcd3-4f09-b9f8-77b881cb4668	200ml	DHB-0310-200ML	20000	\N	t	2026-07-16 15:15:48.229	2026-07-19 14:23:41.337	t
04324188-d7d3-4a10-949f-5481f876dc9d	3614cc74-1402-4552-9a36-15e0f4ff832f	50ml	DHB-0311-50ML	8000	\N	t	2026-07-16 15:15:50.154	2026-07-19 14:23:45.023	t
8067460a-5d25-4846-b171-05926cfe8417	b9d2a0c2-b379-4de6-a7f6-7f1ba70cec76	50ml	DHB-0312-50ML	8000	\N	t	2026-07-16 15:15:53.232	2026-07-19 14:23:48.825	t
add1a374-449a-48e1-bbd6-ecd9be37e2ec	f42e1ed8-624f-43e1-b3e7-ab7b2de15f4c	200ml	DHB-0323-200ML	20000	\N	t	2026-07-16 15:16:33.546	2026-07-19 14:24:33.166	t
b9899ef5-3c23-4509-bc21-8948f093acbd	1cf242f8-2aed-4992-8e8f-d010156c0a0f	50ml	DHB-0325-50ML	8000	\N	t	2026-07-16 15:16:39.138	2026-07-19 14:24:40.413	t
d5a84933-bf8d-4c5c-a2e4-e53647b47153	eadd89e8-76eb-4100-8697-129659c9d61f	200ml	DHB-0440-200ML	20000	\N	t	2026-07-16 15:23:16.043	2026-07-19 14:31:31.776	t
323673d2-17d4-409b-acdc-e3f4e9cbb585	86bc3716-45d2-4d17-abd1-870bf8ba319e	50ml	DHB-0453-50ML	8000	\N	t	2026-07-16 15:23:54.477	2026-07-19 14:32:21.235	t
e803f764-357b-4029-a2f5-fc9a47bf6789	e3e755d3-1bff-4e3f-ac05-7345f1af1562	50ml	DHB-0455-50ML	8000	\N	t	2026-07-16 15:24:00.555	2026-07-19 14:32:29.318	t
2b5625d5-54bf-4577-90bd-3c04add1de19	ec4d69a7-4074-4ba6-a546-2abfa0a9bac4	50ml	DHB-0456-50ML	8000	\N	t	2026-07-16 15:24:04.036	2026-07-19 14:32:33.318	t
38a92fb3-1f37-47e1-b010-d6b4f27d2f71	fe8c5d8c-a21e-4c9f-9e7b-9d57f7470ecf	50ml	DHB-0457-50ML	8000	\N	t	2026-07-16 15:24:07.524	2026-07-19 14:32:37.318	t
fb880847-97a4-4a0a-bec6-b341dee16b18	c9fbd1bd-4c2a-42af-81c1-dc8b39ae8eb2	50ml	DHB-0458-50ML	8000	\N	t	2026-07-16 15:24:10.337	2026-07-19 14:32:40.687	t
b27f80b0-52aa-4070-b4f9-fc1c3be49955	40c0d3a1-48cf-43c0-b34e-2b240cd76b5b	50ml	DHB-0459-50ML	8000	\N	t	2026-07-16 15:24:13.648	2026-07-19 14:32:44.347	t
9497db24-d490-460e-9189-263c4ae3d15c	ccdd4abb-c33f-4d7d-afca-22a5dd296732	50ml	DHB-0460-50ML	8000	\N	t	2026-07-16 15:24:16.752	2026-07-19 14:32:47.98	t
b14ddd8a-2af9-42bf-ad16-d61d77343683	9de02cb9-4c91-4e88-8846-dfed0c164ed6	50ml	DHB-0461-50ML	8000	\N	t	2026-07-16 15:24:20.317	2026-07-19 14:32:51.547	t
e51acf0e-9225-4517-9013-425dda5464c4	6aae35b5-ae16-4a75-bc9f-d6d75a3ea804	50ml	DHB-0462-50ML	8000	\N	t	2026-07-16 15:24:23.452	2026-07-19 14:32:55.438	t
6d72cbe1-e914-48a5-b5e6-301f9306a7fa	7670908f-7917-4255-8e6d-26d3f47d859f	50ml	DHB-0463-50ML	8000	\N	t	2026-07-16 15:24:26.361	2026-07-19 14:32:58.714	t
fb32d579-c939-47c7-84d5-965a98c11bf8	00a5a149-1fa5-479f-9d97-2f6736bed2f8	50ml	DHB-0464-50ML	8000	\N	t	2026-07-16 15:24:29.439	2026-07-19 14:33:02.78	t
b84a951a-b4ec-4327-b27a-a6791a369def	d865d0cb-37de-443f-9674-fe12eac045cf	50ml	DHB-0465-50ML	8000	\N	t	2026-07-16 15:24:32.756	2026-07-19 14:33:06.572	t
6550e5c6-36b8-4412-add0-5a28d130e3fc	d4913078-04bd-4947-bdd0-e1ed5348dcf4	50ml	DHB-0466-50ML	8000	\N	t	2026-07-16 15:24:36.721	2026-07-19 14:33:10.529	t
4aaba8b6-7474-4ebb-aa63-ed082ff5e572	7fb0586a-3b27-4739-95ab-ed541c327bec	50ml	DHB-0468-50ML	8000	\N	t	2026-07-16 15:24:43.4	2026-07-19 14:33:19.295	t
880b4858-c317-409b-b20c-d02d4c34d049	0cc2d0a1-fc44-49fe-a751-4ed9acbf843f	50ml	DHB-0469-50ML	8000	\N	t	2026-07-16 15:24:46.085	2026-07-19 14:33:23.001	t
827fbc93-39b7-4642-beee-237964b91f7c	e3c7168b-1c5b-403d-a279-4230f2ccdb83	50ml	DHB-0470-50ML	8000	\N	t	2026-07-16 15:24:49.094	2026-07-19 14:33:26.529	t
e6926b54-5676-44fc-8b6d-14ee8413c30f	b9d2a0c2-b379-4de6-a7f6-7f1ba70cec76	200ml	DHB-0312-200ML	20000	\N	t	2026-07-16 15:15:54.745	2026-07-19 14:23:49.683	t
888981a5-9ec5-4429-ba05-d2beb7cd73ea	8b55a19f-45fc-4ff4-9116-af1f72f737e1	100ml	DHB-0313-100ML	12000	\N	t	2026-07-16 15:15:57.305	2026-07-19 14:23:53.268	t
72813cc5-e93c-47da-ae85-0347984bdd9d	8b55a19f-45fc-4ff4-9116-af1f72f737e1	200ml	DHB-0313-200ML	20000	\N	t	2026-07-16 15:15:58.099	2026-07-19 14:23:53.727	t
4bc2e8df-7495-42ad-a4be-15cba691642f	c67a4772-cded-4c6c-bd23-921fbc166095	100ml	DHB-0314-100ML	12000	\N	t	2026-07-16 15:16:01.174	2026-07-19 14:23:57.83	t
6fa6fd0e-8b44-410e-8c2d-16c4569a548f	f42e1ed8-624f-43e1-b3e7-ab7b2de15f4c	100ml	DHB-0323-100ML	12000	\N	t	2026-07-16 15:16:33.273	2026-07-19 14:24:32.905	t
752bc144-f073-426b-85ef-d6f7d0592cd6	d69f3606-a366-4aa1-aa3a-1dfc81dfe501	100ml	DHB-0326-100ML	12000	\N	t	2026-07-16 15:16:42.351	2026-07-19 14:24:44.737	t
3c612221-5e3a-4316-abfc-81388045be36	fd9d9682-64a3-49e0-aebe-546de7ee7c13	100ml	DHB-0328-100ML	12000	\N	t	2026-07-16 15:16:47.788	2026-07-19 14:24:52.198	t
14b8ebf4-5a8f-4b8f-aa08-56ecbe583f38	fd9d9682-64a3-49e0-aebe-546de7ee7c13	200ml	DHB-0328-200ML	20000	\N	t	2026-07-16 15:16:48.298	2026-07-19 14:24:52.505	t
636e61d1-1c5f-4ee1-be37-ac20a10296f0	0b34e06a-42aa-4a0a-9560-2065ea434cc4	100ml	DHB-0329-100ML	12000	\N	t	2026-07-16 15:16:51.371	2026-07-19 14:24:56.192	t
1bf22d4d-c0c9-4d64-b318-8b339b8b0a15	0b34e06a-42aa-4a0a-9560-2065ea434cc4	200ml	DHB-0329-200ML	20000	\N	t	2026-07-16 15:16:51.784	2026-07-19 14:24:56.502	t
c6b77cd5-bf78-4d92-91da-e56ac07cec19	3e2aeceb-01db-4847-b55e-c63f32b49f34	100ml	DHB-0330-100ML	12000	\N	t	2026-07-16 15:16:54.542	2026-07-19 14:25:00.398	t
14ba813f-04f8-4bfe-9aa9-629219bb5ae6	3e2aeceb-01db-4847-b55e-c63f32b49f34	200ml	DHB-0330-200ML	20000	\N	t	2026-07-16 15:16:54.807	2026-07-19 14:25:00.697	t
a91ef374-3201-419f-8fd3-07cce9073561	ea1b54d1-f3ad-4de4-9d3d-2a14af415cad	200ml	DHB-0331-200ML	20000	\N	t	2026-07-16 15:16:57.803	2026-07-19 14:25:05.02	t
6f31a14b-235d-49cb-8e4c-e44b66ac394d	e9eaf761-89f7-4116-8ff3-8a129cd1bd69	50ml	DHB-0380-50ML	8000	\N	t	2026-07-16 15:19:55.664	2026-07-19 14:28:12.333	t
bdd41de1-3528-4bb5-8dcf-f13118421d9c	a7336368-440f-4f4b-85cd-54066467d79a	50ml	DHB-0381-50ML	8000	\N	t	2026-07-16 15:19:59.566	2026-07-19 14:28:15.979	t
99e96c40-2714-45c8-bf20-ca34ff36ac2f	613da40e-cea6-49b4-a284-360b449c48fc	50ml	DHB-0382-50ML	8000	\N	t	2026-07-16 15:20:03.734	2026-07-19 14:28:19.275	t
d775a2c3-18f7-451a-97a2-6caf5a3f9500	491e9b15-3ab0-4131-b469-e645cbafe7be	50ml	DHB-0383-50ML	8000	\N	t	2026-07-16 15:20:09.867	2026-07-19 14:28:22.354	t
6f53c9e1-e27d-4dbd-b290-e76d415d3e71	38a49429-9679-4194-af1b-287261dd0258	50ml	DHB-0384-50ML	8000	\N	t	2026-07-16 15:20:12.732	2026-07-19 14:28:25.12	t
db8d2da1-840a-4fff-947b-3207ea18b8b2	3f3738dc-5461-4fa6-b08d-30878345c90e	50ml	DHB-0385-50ML	8000	\N	t	2026-07-16 15:20:16.554	2026-07-19 14:28:28.21	t
bba1ed5b-6c4e-4792-999f-04c67f0391bb	5a9c924e-72eb-4ce3-8d8c-eabc915bdd42	50ml	DHB-0386-50ML	8000	\N	t	2026-07-16 15:20:19.735	2026-07-19 14:28:31.726	t
76472f9f-0714-4972-89ee-7fa02165b13c	a0c92910-dd21-4ce4-88b5-228809a08fb2	50ml	DHB-0387-50ML	8000	\N	t	2026-07-16 15:20:22.545	2026-07-19 14:28:34.935	t
c0486c12-a2ed-45c5-a3ea-41b0f3022815	7bf105e4-aa67-41e6-bb33-307472564c0b	200ml	DHB-0441-200ML	20000	\N	t	2026-07-16 15:23:18.525	2026-07-19 14:31:35.461	t
65a75b8f-9f7c-4bbf-bc92-aa42b4c6300a	3b2eee4a-cede-428c-a508-ddb936d9789b	100ml	DHB-0011-100ML	12000	\N	t	2026-07-16 15:00:58.44	2026-07-19 14:02:29.71	t
fb5c2e79-e021-4087-9331-b1fa1f279313	e5462083-202c-4a22-b9db-c036eb0cf1c9	100ml	DHB-0012-100ML	12000	\N	t	2026-07-16 15:01:02.219	2026-07-19 14:02:34.419	t
e8683788-e465-4596-a6f6-e42ec2df54dd	1e4ba0bb-3695-44f6-a6e6-05b27af98c82	100ml	DHB-0049-100ML	12000	\N	t	2026-07-16 15:03:02.265	2026-07-19 14:04:57.558	t
f8441e74-aa89-41d0-a836-ae877dc911c2	6ebeb9b9-bb1e-4aae-a2c0-5b29b3294b12	100ml	DHB-0050-100ML	12000	\N	t	2026-07-16 15:03:05.197	2026-07-19 14:05:01.7	t
efdecf3f-5ff2-4d20-a6f8-caba1d2fd5f2	fb9b2e8f-1669-4904-a271-c7645985fbe6	100ml	DHB-0051-100ML	12000	\N	t	2026-07-16 15:03:08.162	2026-07-19 14:05:07.901	t
934aa309-231c-40c4-b3d7-0f885a681344	c67a4772-cded-4c6c-bd23-921fbc166095	200ml	DHB-0314-200ML	20000	\N	t	2026-07-16 15:16:01.477	2026-07-19 14:23:58.232	t
c530be18-1185-4159-8bc1-79941044f7bd	96d43657-16d4-4e26-90e8-c2646ed26442	200ml	DHB-0315-200ML	20000	\N	t	2026-07-16 15:16:05.701	2026-07-19 14:24:02.535	t
1e679c75-7f1f-4d89-9266-827f4a58a974	40f16b29-f1e3-44aa-a386-08afa2d89ae3	200ml	DHB-0316-200ML	20000	\N	t	2026-07-16 15:16:08.543	2026-07-19 14:24:06.485	t
bd5a5ff8-967c-44f6-925c-d976451b451f	b5d2d725-99d0-443b-8573-24461844148c	200ml	DHB-0317-200ML	20000	\N	t	2026-07-16 15:16:11.708	2026-07-19 14:24:10.994	t
18e812d2-75eb-4149-916d-3043d5bd1d09	83116a6a-142c-4b23-930e-65722bf0a07b	200ml	DHB-0446-200ML	20000	\N	t	2026-07-16 15:23:33.724	2026-07-19 14:31:54.815	t
a2706da5-be3f-4553-9cc4-0770febc81cb	590e9aa4-3eea-4831-95ab-c21afee31529	200ml	DHB-0447-200ML	20000	\N	t	2026-07-16 15:23:36.44	2026-07-19 14:31:58.399	t
98912c5c-c2d1-43ab-8460-78447a642e6d	bf87b360-f6e2-49a1-804f-381c7a3367d2	100ml	DHB-0335-100ML	12000	\N	t	2026-07-16 15:17:11.689	2026-07-19 14:25:21.388	t
6d86bd3b-c714-41e7-b228-2bd0ab5fd9a0	e10a08bd-b188-4489-af6c-3677266a5acb	100ml	DHB-0336-100ML	12000	\N	t	2026-07-16 15:17:15.481	2026-07-19 14:25:25.683	t
415afce4-b3b2-425d-86df-b2f89d8d61b4	b27bd564-a3ae-40eb-bbda-8e2113fa98e7	100ml	DHB-0337-100ML	12000	\N	t	2026-07-16 15:17:18.798	2026-07-19 14:25:30.173	t
b824c0d0-9f35-4822-bdf2-9baf3d50ef9e	9e99faab-0dc6-4609-9d21-399ad41cbd4c	100ml	DHB-0338-100ML	12000	\N	t	2026-07-16 15:17:22.469	2026-07-19 14:25:34.853	t
e56ee0f6-afac-4623-936d-c1c74b9c2db1	78f666b8-a54c-41bf-ad88-388edf5fb7cd	100ml	DHB-0340-100ML	12000	\N	t	2026-07-16 15:17:30.105	2026-07-19 14:25:43.961	t
eb07963c-56ab-4e1e-b365-896b41a8e34c	18139491-0ad4-419d-9dd6-dd23a666d319	200ml	DHB-0448-200ML	20000	\N	t	2026-07-16 15:23:39.663	2026-07-19 14:32:02.496	t
5e5b91fc-8ace-43f9-952a-1b9cc3bb6668	2e5599dd-7b40-4ce7-a114-8cd24c9a4b70	200ml	DHB-0318-200ML	20000	\N	t	2026-07-16 15:16:16.522	2026-07-19 14:24:14.224	t
15cab1d6-8b38-4356-b012-1a7b37c4552f	e4bfaa3d-14b9-471d-8e01-d3efa473d74f	100ml	DHB-0332-100ML	12000	\N	t	2026-07-16 15:17:00.999	2026-07-19 14:25:08.379	t
12c97de2-43e0-49c4-95e7-b947cbf644b5	f3843583-d836-44b8-a9cf-edd9eb3ef39a	100ml	DHB-0333-100ML	12000	\N	t	2026-07-16 15:17:05.298	2026-07-19 14:25:13.042	t
1969a7a7-c38a-4eb5-95e7-135bdc947202	8ce290c7-1268-4414-8a17-9c39fe75bdfd	100ml	DHB-0334-100ML	12000	\N	t	2026-07-16 15:17:08.383	2026-07-19 14:25:17.08	t
f42187b6-3d0d-47dd-9092-ad4717387c40	14938ed6-4005-40da-a871-134ce00c28cb	100ml	DHB-0343-100ML	12000	\N	t	2026-07-16 15:17:42.654	2026-07-19 14:25:57.02	t
1087cdac-c5b7-4b6e-92b9-10d0a07b6b75	479e2fc2-7ca0-49bd-a203-537b70bbd22f	100ml	DHB-0345-100ML	12000	\N	t	2026-07-16 15:17:49.97	2026-07-19 14:26:05.723	t
099c098e-3908-4bf4-80d4-a51287124d98	3c7d1aeb-77a7-460e-b9cf-87b79db7a38b	100ml	DHB-0348-100ML	12000	\N	t	2026-07-16 15:17:59.367	2026-07-19 14:26:17.388	t
5320817a-6bbf-404a-bd57-d5717df3bfb4	740d30b9-8169-48b7-b8db-77db73c7f15b	100ml	DHB-0351-100ML	12000	\N	t	2026-07-16 15:18:09.192	2026-07-19 14:26:28.66	t
033bb62f-c3c1-4476-a218-009dcb3c79d1	05f759bd-1f4f-4c05-a48c-8a2254e4e6b0	100ml	DHB-0358-100ML	12000	\N	t	2026-07-16 15:18:36.863	2026-07-19 14:26:56.04	t
10265f6c-e147-4f4d-9c02-dfe42f47a37c	5f1d7567-fb6e-4723-8539-5bda84fc358a	200ml	DHB-0443-200ML	20000	\N	t	2026-07-16 15:23:24.148	2026-07-19 14:31:43.3	t
ebe1b12c-aed7-45be-b105-474d39064560	68110403-5d36-468a-a7f2-9fd010036c20	200ml	DHB-0444-200ML	20000	\N	t	2026-07-16 15:23:27.054	2026-07-19 14:31:47.134	t
6baae2d2-b846-46b6-af43-595440b0ebf2	ec139ac4-3c74-406b-816b-c347b1f2ad75	200ml	DHB-0445-200ML	20000	\N	t	2026-07-16 15:23:30.245	2026-07-19 14:31:50.823	t
da12060b-3e18-4599-bda0-e396824665be	c44b7b50-00bf-4b45-b82a-a24d0afb72e7	200ml	DHB-0449-200ML	20000	\N	t	2026-07-16 15:23:42.696	2026-07-19 14:32:06.181	t
bebd2de3-00cd-47a9-adc3-3dbc78afaa26	4a22f5c8-ec6e-4aab-b1d9-80ee6036ee4c	200ml	DHB-0450-200ML	20000	\N	t	2026-07-16 15:23:45.819	2026-07-19 14:32:10.065	t
093dfb65-bd10-40f2-8406-61464c2e9852	70a64667-e3cc-4295-a254-bcf640a0e6af	200ml	DHB-0451-200ML	20000	\N	t	2026-07-16 15:23:49.086	2026-07-19 14:32:13.964	t
c42116a8-a7d4-4d16-9f26-1b0cee37ada5	4ae3aa41-93e7-4e06-80d8-c699daf343c9	100ml	DHB-0101-100ML	12000	\N	t	2026-07-16 15:05:30.117	2026-07-19 14:08:54.257	t
79f298c1-806d-4c4c-9dd3-7c90d2b32605	cae436e6-d154-411a-b8bb-60ba4296386e	100ml	DHB-0102-100ML	12000	\N	t	2026-07-16 15:05:32.911	2026-07-19 14:08:58.902	t
1eda8010-1c98-4533-8a20-fb709ac55019	bb352e30-0643-4ab2-9d43-b6ef7bb59e7d	100ml	DHB-0105-100ML	12000	\N	t	2026-07-16 15:05:44.145	2026-07-19 14:09:10.577	t
1a964a98-b9e4-4cd0-9caf-74fc683f6546	04a92a24-3e48-4d18-8d47-1b4d07ac827f	100ml	DHB-0106-100ML	12000	\N	t	2026-07-16 15:05:46.848	2026-07-19 14:09:14.012	t
248dabdb-c4cd-4b9d-a779-eb6cf289ec45	a3c1e88a-5ac7-4bb9-80bb-6e8b07d07060	100ml	DHB-0107-100ML	12000	\N	t	2026-07-16 15:05:49.768	2026-07-19 14:09:17.469	t
18363aaf-4687-44eb-ac13-a416571a76aa	2d697d0a-30d0-4388-a0f5-ca1201ffe541	100ml	DHB-0108-100ML	12000	\N	t	2026-07-16 15:05:53.467	2026-07-19 14:09:20.824	t
42fd3842-f503-49da-889a-74273c2cac54	8323296c-8ed6-4243-9234-54a2b6e6114c	100ml	DHB-0109-100ML	12000	\N	t	2026-07-16 15:05:56.156	2026-07-19 14:09:25.55	t
6912b18c-b287-4d12-ad6e-2debae1137ac	a1291b8c-5711-4a1d-a42a-6d6405881ac8	100ml	DHB-0173-100ML	12000	\N	t	2026-07-16 15:09:04.555	2026-07-19 14:13:45.934	t
7ede9b27-cc5e-4969-80ec-7f659df591cf	ec2e2064-9f20-47c5-873b-399ed108cb6b	100ml	DHB-0174-100ML	12000	\N	t	2026-07-16 15:09:07.11	2026-07-19 14:13:49.253	t
2b6f7106-5388-4ae8-ac58-37128c4b929a	ba6d90f2-e97e-49ad-b85b-a199a6d64bfe	100ml	DHB-0175-100ML	12000	\N	t	2026-07-16 15:09:09.774	2026-07-19 14:13:53.523	t
f9751753-4cfa-47a1-a0e5-2e59be883580	7f30029f-092c-4c95-82f5-9a39690b3f4c	100ml	DHB-0176-100ML	12000	\N	t	2026-07-16 15:09:12.443	2026-07-19 14:13:58.972	t
1424e1a9-db33-4e0e-abd5-2013b9800edd	84137263-8a01-4584-affe-6d5035ef1244	100ml	DHB-0177-100ML	12000	\N	t	2026-07-16 15:09:15.825	2026-07-19 14:14:06.369	t
346f0539-520a-46ae-9d52-dc58a2f116ce	e5ac8511-2698-40df-8625-d70612e9439a	100ml	DHB-0178-100ML	12000	\N	t	2026-07-16 15:09:19.039	2026-07-19 14:14:11.525	t
c275a802-c92b-473d-a909-8f4a14ea968d	d506b07e-7e0c-48f6-90cc-85cb01c1dfcf	100ml	DHB-0359-100ML	12000	\N	t	2026-07-16 15:18:40.579	2026-07-19 14:26:59.383	t
b570c080-85df-4830-bcac-e5a0b9e6f06e	4e9f33ef-4565-4855-b62d-5cf3c43145cc	100ml	DHB-0360-100ML	12000	\N	t	2026-07-16 15:18:43.658	2026-07-19 14:27:02.763	t
a3736630-7730-4bfd-bd08-aacc2c6c07bb	6710dad2-5d74-4fdd-b8b6-1cba5b41700d	100ml	DHB-0361-100ML	12000	\N	t	2026-07-16 15:18:46.613	2026-07-19 14:27:06.243	t
748637f4-aa80-4409-82ce-320f967d1e44	0a75d486-578f-4ff3-9d36-7f6f8dab6580	100ml	DHB-0362-100ML	12000	\N	t	2026-07-16 15:18:49.447	2026-07-19 14:27:09.521	t
e2b61b95-2098-4e17-bf2e-9e3996724cc2	9bc5ebc2-2d14-4cac-995a-f68644aa470f	100ml	DHB-0363-100ML	12000	\N	t	2026-07-16 15:18:53.293	2026-07-19 14:27:13.006	t
def122ef-9015-4447-bd6e-9c127bf9a1fb	e049d23f-ffcb-492a-b8c8-b3c85cdf904f	100ml	DHB-0364-100ML	12000	\N	t	2026-07-16 15:18:58.157	2026-07-19 14:27:17.303	t
d8a01bd5-c436-4836-9ac0-c1197369a9f3	e9580454-bcd2-48f6-bfe5-8bebfd8bfe5f	100ml	DHB-0365-100ML	12000	\N	t	2026-07-16 15:19:01.784	2026-07-19 14:27:20.581	t
18e3850d-509e-44c3-8284-a68e53da97eb	d373522a-ee6a-4a93-82c3-d097101bd6db	100ml	DHB-0366-100ML	12000	\N	t	2026-07-16 15:19:04.903	2026-07-19 14:27:24.166	t
ecdbf949-9bd5-4574-84ea-c86a492c0979	abfdfdef-4e7e-4c38-968c-f4d88d5d0ff4	100ml	DHB-0367-100ML	12000	\N	t	2026-07-16 15:19:08.462	2026-07-19 14:27:27.747	t
397b752f-23ec-41c5-8fec-637f2916680b	43383ca1-daab-4dd3-8e8d-784a7414bf57	100ml	DHB-0368-100ML	12000	\N	t	2026-07-16 15:19:12.652	2026-07-19 14:27:31.024	t
314de639-73c1-4578-89e5-22074eea3147	e80beb5a-00f2-4ed2-8a1e-ea66794da288	100ml	DHB-0369-100ML	12000	\N	t	2026-07-16 15:19:16.764	2026-07-19 14:27:34.812	t
7ede232d-8adb-468a-b00c-e0e73464190a	76783e87-3b7f-410f-8560-13535cbd0431	100ml	DHB-0370-100ML	12000	\N	t	2026-07-16 15:19:19.962	2026-07-19 14:27:37.782	t
f4a89d06-9220-49fe-ab0e-91d0962bc175	4c28cde6-9244-4748-8da3-a164a1d3a560	100ml	DHB-0371-100ML	12000	\N	t	2026-07-16 15:19:23.019	2026-07-19 14:27:41.278	t
cd9f4869-5d53-4b7b-9990-77533a9ed4f7	3e7bbc35-a560-42bc-8617-40a3cd74827a	100ml	DHB-0372-100ML	12000	\N	t	2026-07-16 15:19:26.923	2026-07-19 14:27:45.148	t
adff193f-fe3d-4ac8-807b-51150df9b60a	4f9d493f-bab8-4ea3-8cd4-bc152ea9a2a4	100ml	DHB-0373-100ML	12000	\N	t	2026-07-16 15:19:31.066	2026-07-19 14:27:49.02	t
2d66681a-fa19-48fe-8122-b38ba33bec1c	dcf4d80c-05b3-48ee-976b-30eaf422b597	100ml	DHB-0374-100ML	12000	\N	t	2026-07-16 15:19:34.816	2026-07-19 14:27:52.376	t
fedc9a40-9a89-4f67-b17a-ce2536c3247a	1d080ae5-5366-49eb-b607-62616c9038fc	100ml	DHB-0375-100ML	12000	\N	t	2026-07-16 15:19:39.852	2026-07-19 14:27:55.907	t
6e119dc7-7066-4310-bfc4-58945a8cc63c	06e810f1-2dba-405a-ad71-9ebda8a08c80	100ml	DHB-0376-100ML	12000	\N	t	2026-07-16 15:19:43.187	2026-07-19 14:27:59.394	t
f9a1959c-7a7f-4a29-8b0c-806e83225a50	92dc9eec-c14b-4985-8142-540ca06308b2	100ml	DHB-0377-100ML	12000	\N	t	2026-07-16 15:19:46.47	2026-07-19 14:28:02.976	t
352c8846-0ee7-4f11-999a-7949c128b047	66215338-6427-4b49-a126-f132ba519439	100ml	DHB-0378-100ML	12000	\N	t	2026-07-16 15:19:49.452	2026-07-19 14:28:06.253	t
fa55b118-7736-443d-a049-73e2c01e5c7b	e9eaf761-89f7-4116-8ff3-8a129cd1bd69	100ml	DHB-0380-100ML	12000	\N	t	2026-07-16 15:19:56.176	2026-07-19 14:28:12.602	t
2a3933bb-9864-467d-a255-2987e306e5f3	a7336368-440f-4f4b-85cd-54066467d79a	100ml	DHB-0381-100ML	12000	\N	t	2026-07-16 15:19:59.838	2026-07-19 14:28:16.286	t
c5f5bc51-a37e-4b2c-8469-30c77dc9600d	613da40e-cea6-49b4-a284-360b449c48fc	100ml	DHB-0382-100ML	12000	\N	t	2026-07-16 15:20:04.043	2026-07-19 14:28:19.555	t
f051ba9f-448a-477e-b59f-69c238722f92	3f3738dc-5461-4fa6-b08d-30878345c90e	100ml	DHB-0385-100ML	12000	\N	t	2026-07-16 15:20:16.843	2026-07-19 14:28:28.504	t
d7ddfdef-3a65-4491-bc6e-0a26005feb5c	5a9c924e-72eb-4ce3-8d8c-eabc915bdd42	100ml	DHB-0386-100ML	12000	\N	t	2026-07-16 15:20:19.998	2026-07-19 14:28:32.037	t
2803c4c6-edbd-416d-b2d8-94925c596e7a	a0c92910-dd21-4ce4-88b5-228809a08fb2	100ml	DHB-0387-100ML	12000	\N	t	2026-07-16 15:20:22.807	2026-07-19 14:28:35.202	t
1c48e423-ab9c-4fe4-99b2-52ffd425e7a4	3e360ffd-8f9f-48af-a987-4a3bb3cc9102	100ml	DHB-0388-100ML	12000	\N	t	2026-07-16 15:20:25.468	2026-07-19 14:28:38.573	t
188f0b27-fa8e-4422-b3ff-36aa1fa7445f	18fe0d89-f42c-4d10-8b5e-39be04ac3fd0	100ml	DHB-0389-100ML	12000	\N	t	2026-07-16 15:20:28.679	2026-07-19 14:28:41.888	t
f56e35bb-c5e8-4601-b79c-ba855a5d919b	d56709d5-6cf8-44a1-b2b8-51e398ded2b6	100ml	DHB-0391-100ML	12000	\N	t	2026-07-16 15:20:35.113	2026-07-19 14:28:47.935	t
6c902d16-1ad1-4b02-9bae-17f4a7861276	358fa7bd-95ed-470f-b25e-edd42b7691c0	100ml	DHB-0392-100ML	12000	\N	t	2026-07-16 15:20:39.549	2026-07-19 14:28:50.753	t
4ccd60ba-2274-440c-8635-692e4a09da33	ba4a47a1-5195-4b55-ab53-960b38e29435	100ml	DHB-0393-100ML	12000	\N	t	2026-07-16 15:20:42.736	2026-07-19 14:28:53.969	t
0fe89d8e-4380-4980-9356-d05e4f55ffec	f98acd25-867a-495a-8f2d-bc4bc3ca21f6	100ml	DHB-0394-100ML	12000	\N	t	2026-07-16 15:20:46.858	2026-07-19 14:28:57.468	t
1a708fdc-cdab-4de1-8d02-92723d497af3	26a5b7ba-78af-4733-9d28-16ffa0ed7c14	100ml	DHB-0395-100ML	12000	\N	t	2026-07-16 15:20:50.658	2026-07-19 14:29:01.139	t
d409899b-3308-406f-a5d7-dc5df4a8495b	ceaf2c6b-9581-4aa3-8bf8-c1a48ebc9c9d	100ml	DHB-0398-100ML	12000	\N	t	2026-07-16 15:21:01.149	2026-07-19 14:29:11.689	t
f88e31c8-27ce-4936-a835-9daff2b7756e	3614cc74-1402-4552-9a36-15e0f4ff832f	100ml	DHB-0311-100ML	12000	\N	t	2026-07-16 15:15:50.507	2026-07-19 14:23:45.285	t
8b38449e-42cc-48b0-8e13-0ea061016c15	b9d2a0c2-b379-4de6-a7f6-7f1ba70cec76	100ml	DHB-0312-100ML	12000	\N	t	2026-07-16 15:15:53.52	2026-07-19 14:23:49.118	t
b4223553-e88a-4fdc-abee-7e18caabc7b3	96d43657-16d4-4e26-90e8-c2646ed26442	100ml	DHB-0315-100ML	12000	\N	t	2026-07-16 15:16:05.309	2026-07-19 14:24:02.196	t
105cb4a5-69a9-4320-91b8-21333d03d306	40f16b29-f1e3-44aa-a386-08afa2d89ae3	100ml	DHB-0316-100ML	12000	\N	t	2026-07-16 15:16:08.278	2026-07-19 14:24:06.22	t
93a5d830-8e45-4afc-a80a-efeafd19d075	b5d2d725-99d0-443b-8573-24461844148c	100ml	DHB-0317-100ML	12000	\N	t	2026-07-16 15:16:11.201	2026-07-19 14:24:10.412	t
10299e5c-1e66-4834-be4d-140427dccde5	2e5599dd-7b40-4ce7-a114-8cd24c9a4b70	100ml	DHB-0318-100ML	12000	\N	t	2026-07-16 15:16:15.941	2026-07-19 14:24:13.952	t
d3972847-1b06-4b90-990d-bb0842824797	8feb25c6-e728-4e24-b303-8defd279762b	100ml	DHB-0319-100ML	12000	\N	t	2026-07-16 15:16:19.573	2026-07-19 14:24:17.604	t
8903583d-bcd5-426e-b187-fc0feed43367	e1bb7c06-78d1-4a29-9862-59271f078511	100ml	DHB-0320-100ML	12000	\N	t	2026-07-16 15:16:22.54	2026-07-19 14:24:21.171	t
02cdf2f6-2e39-413a-9b66-827cb6fbabf3	c91f8af4-a006-4018-8c6b-2e4b1773cc62	100ml	DHB-0321-100ML	12000	\N	t	2026-07-16 15:16:25.636	2026-07-19 14:24:24.652	t
e0fbdaef-0e55-4820-90a9-c74a896b34ff	59b41a3b-fd13-4878-80c5-08012a9446eb	100ml	DHB-0322-100ML	12000	\N	t	2026-07-16 15:16:29.673	2026-07-19 14:24:29.097	t
d70ea0c9-0d92-4f08-889d-229a3a642db4	579447bd-e5d6-45b4-83f8-addaa6c5ea8c	100ml	DHB-0324-100ML	12000	\N	t	2026-07-16 15:16:36.492	2026-07-19 14:24:37.055	t
44ba1783-61a7-4a85-8219-2de2eb345c0d	ce703ce1-3441-4664-ab0c-3927ecd896ee	100ml	DHB-0399-100ML	12000	\N	t	2026-07-16 15:21:04.346	2026-07-19 14:29:15.024	t
1d8bead6-8a3f-4713-ac48-f3f498bfa64c	7680f8c2-f9ee-4eff-a195-a4e78315d8bc	100ml	DHB-0400-100ML	12000	\N	t	2026-07-16 15:21:08.185	2026-07-19 14:29:18.369	t
143eaa42-9e7a-40c0-8526-f6ca55de1892	2a547bff-0235-4fdf-a781-b2cc21af4ca6	100ml	DHB-0401-100ML	12000	\N	t	2026-07-16 15:21:11.029	2026-07-19 14:29:21.516	t
e5f7cb17-22b4-42ef-9bae-228d61e38f1b	69ef4e63-1dfe-4f48-bc6d-47bdb7216ad9	100ml	DHB-0402-100ML	12000	\N	t	2026-07-16 15:21:13.993	2026-07-19 14:29:24.896	t
a28b3190-3f1b-42e3-8020-6787a7c5afea	2d3f30fc-b13c-40a9-a0d2-38d75e20d311	100ml	DHB-0403-100ML	12000	\N	t	2026-07-16 15:21:17.476	2026-07-19 14:29:28.275	t
88290690-b050-46be-b7f4-8ed26373d7d3	bcea55b8-babc-478c-9227-12b955a6fab1	100ml	DHB-0404-100ML	12000	\N	t	2026-07-16 15:21:20.045	2026-07-19 14:29:31.673	t
2239258c-02fe-41e7-9497-f8532e22bb88	a1caa491-6ddc-4a60-8b8c-07666adfee35	100ml	DHB-0405-100ML	12000	\N	t	2026-07-16 15:21:22.925	2026-07-19 14:29:34.993	t
fa34ea0a-dd82-4b3b-a426-48c354eb86ec	5f437268-78fa-4e79-a194-8e918581a503	100ml	DHB-0406-100ML	12000	\N	t	2026-07-16 15:21:26.76	2026-07-19 14:29:38.363	t
e65ed5c4-ad83-4516-b14f-48a400a3d459	dcb4c4c5-203c-451c-998c-888362091608	100ml	DHB-0407-100ML	12000	\N	t	2026-07-16 15:21:29.793	2026-07-19 14:29:41.794	t
d3482aba-843a-4af0-a405-d08c4891e280	29dc7089-a615-475c-b033-a0fd4a59a599	100ml	DHB-0408-100ML	12000	\N	t	2026-07-16 15:21:32.916	2026-07-19 14:29:45.173	t
5f5ac5e2-43f9-4f86-b641-5144293308d3	e3dc48a8-58da-4025-ad51-fe1a4db093c0	100ml	DHB-0409-100ML	12000	\N	t	2026-07-16 15:21:36.126	2026-07-19 14:29:48.646	t
28236003-fb7d-4e05-833b-61dc373b6c5e	30f6719f-41b5-4f60-80d2-afa6b2ccbf1f	100ml	DHB-0410-100ML	12000	\N	t	2026-07-16 15:21:38.627	2026-07-19 14:29:51.624	t
22b5cfcb-6480-4f47-8dbe-3f88181f5bcb	f22ca276-9e1c-4865-8703-95e1ef0fce2f	100ml	DHB-0411-100ML	12000	\N	t	2026-07-16 15:21:42.273	2026-07-19 14:29:54.9	t
e0f16007-5d73-415e-bdc3-ca111b59bb25	57cf1c9b-bcfa-44d9-b581-035028d4b6f8	100ml	DHB-0414-100ML	12000	\N	t	2026-07-16 15:21:54.562	2026-07-19 14:30:04.526	t
3a46655a-984e-4796-a278-609512e4d2df	250519ff-2f1e-4009-8d48-c75d79f59f8f	100ml	DHB-0415-100ML	12000	\N	t	2026-07-16 15:21:58.272	2026-07-19 14:30:07.59	t
8a8f45a7-3768-4eb7-8e92-476180c498e8	dc2133c5-d8e7-4a0b-b4f4-dd006eb087a9	100ml	DHB-0416-100ML	12000	\N	t	2026-07-16 15:22:01.446	2026-07-19 14:30:10.749	t
d14da5a0-24b3-4c31-8e30-7df6c9e5eb64	0b454968-cf9d-4c1b-abd8-5f3e0f945adc	100ml	DHB-0417-100ML	12000	\N	t	2026-07-16 15:22:05.85	2026-07-19 14:30:14.309	t
631dbcab-f367-49ec-a1a8-719f3d154f2e	2ac6555e-0733-4b97-844b-78699d204d4d	100ml	DHB-0418-100ML	12000	\N	t	2026-07-16 15:22:10.855	2026-07-19 14:30:17.636	t
c4c0b1ad-5177-4491-bbc6-827d239ff573	f05c2b56-41ba-4ec1-8cc3-9f8f0b1f8607	100ml	DHB-0420-100ML	12000	\N	t	2026-07-16 15:22:17.536	2026-07-19 14:30:24.158	t
26c2dac7-ed72-4d24-8567-5d613fe0fa9f	3efda889-e47d-4e4a-a031-df3cf1959823	100ml	DHB-0421-100ML	12000	\N	t	2026-07-16 15:22:21.332	2026-07-19 14:30:27.465	t
102bb3ab-6e4c-48c3-a9c9-39f96ecfd2eb	8f5a737b-4122-4e72-b68d-d22363b7f3bb	100ml	DHB-0422-100ML	12000	\N	t	2026-07-16 15:22:24.527	2026-07-19 14:30:30.632	t
67f73945-05bf-4fd9-82c4-12e57317681a	ffc9fa3a-300b-4f16-ae34-05217b887280	100ml	DHB-0423-100ML	12000	\N	t	2026-07-16 15:22:27.487	2026-07-19 14:30:33.68	t
bd73c211-53ac-4b23-9ed0-36394635e41a	10df2330-c31b-454b-8f35-8e4ee05ca445	100ml	DHB-0431-100ML	12000	\N	t	2026-07-16 15:22:50.185	2026-07-19 14:30:57.027	t
00cc3391-dabf-4e0f-bbc0-67976bb41106	29c9ddae-afd0-4702-9732-c9dd05409ca7	100ml	DHB-0432-100ML	12000	\N	t	2026-07-16 15:22:53.131	2026-07-19 14:31:00.773	t
a52adbe5-109f-45df-82b3-a2ecf7ead477	b6fe8f53-aade-4915-9eff-0e671fa904ae	100ml	DHB-0433-100ML	12000	\N	t	2026-07-16 15:22:55.676	2026-07-19 14:31:04.416	t
ce8633e3-4407-49db-b5f5-8ebde470291b	e2ff5d78-74e7-4bdf-be25-08804796ca26	100ml	DHB-0434-100ML	12000	\N	t	2026-07-16 15:22:58.601	2026-07-19 14:31:08.49	t
e10e1521-6d67-4b34-bedd-86132bbd13b2	db23f5a3-26c4-42ed-b209-9c884e21b45d	100ml	DHB-0435-100ML	12000	\N	t	2026-07-16 15:23:01.419	2026-07-19 14:31:12.276	t
3cdc3b90-d128-4e3e-ac42-baf89cc762e9	7bf105e4-aa67-41e6-bb33-307472564c0b	100ml	DHB-0441-100ML	12000	\N	t	2026-07-16 15:23:18.255	2026-07-19 14:31:35.154	t
8c688afc-d25a-4b04-99d0-2ea41940777b	5f1d7567-fb6e-4723-8539-5bda84fc358a	100ml	DHB-0443-100ML	12000	\N	t	2026-07-16 15:23:23.875	2026-07-19 14:31:43.038	t
fdbbface-2259-483e-9c4f-8a992cec7d63	68110403-5d36-468a-a7f2-9fd010036c20	100ml	DHB-0444-100ML	12000	\N	t	2026-07-16 15:23:26.734	2026-07-19 14:31:46.827	t
0af70cae-3eb1-4d93-bd15-76ee9f4c1783	ec139ac4-3c74-406b-816b-c347b1f2ad75	100ml	DHB-0445-100ML	12000	\N	t	2026-07-16 15:23:29.871	2026-07-19 14:31:50.516	t
ba717887-f3a1-4e32-9068-ff613af394f1	83116a6a-142c-4b23-930e-65722bf0a07b	100ml	DHB-0446-100ML	12000	\N	t	2026-07-16 15:23:33.42	2026-07-19 14:31:54.463	t
a6584e01-5014-47b2-a3e9-81a6dfd0135a	590e9aa4-3eea-4831-95ab-c21afee31529	100ml	DHB-0447-100ML	12000	\N	t	2026-07-16 15:23:36.169	2026-07-19 14:31:58.084	t
1f9e378e-a6ac-4ba5-88ba-f5cd5ad7f240	18139491-0ad4-419d-9dd6-dd23a666d319	100ml	DHB-0448-100ML	12000	\N	t	2026-07-16 15:23:39.323	2026-07-19 14:32:02.187	t
ab03dd4d-6eec-4801-895b-c67b060521cd	c44b7b50-00bf-4b45-b82a-a24d0afb72e7	100ml	DHB-0449-100ML	12000	\N	t	2026-07-16 15:23:42.431	2026-07-19 14:32:05.869	t
7e5f395a-39b6-445a-b628-b5b8684c39f2	4a22f5c8-ec6e-4aab-b1d9-80ee6036ee4c	100ml	DHB-0450-100ML	12000	\N	t	2026-07-16 15:23:45.411	2026-07-19 14:32:09.768	t
a52326de-057e-46d5-9d7f-d5c11de3d7da	055fa60c-9764-45b3-8d78-2737f584df4d	100ml	DHB-0027-100ML	12000	\N	t	2026-07-16 15:01:49.299	2026-07-19 14:03:33.775	t
83ab6d25-12a0-478e-ad5f-548c7d7eb053	4621d0cd-1f1f-4401-8682-ce3d8eca0422	100ml	DHB-0028-100ML	12000	\N	t	2026-07-16 15:01:51.86	2026-07-19 14:03:37.704	t
6b59237d-0816-45b4-b85a-94e4b969bbf4	36b5c8eb-cbbd-498b-8565-a70a5f0a525f	100ml	DHB-0029-100ML	12000	\N	t	2026-07-16 15:01:54.838	2026-07-19 14:03:41.71	t
578dc69d-c9ca-4fde-97dd-672ca7d27633	67e8a831-9640-4800-9594-271fd03cf74c	100ml	DHB-0030-100ML	12000	\N	t	2026-07-16 15:01:59.837	2026-07-19 14:03:46.001	t
ebf9420c-ecd4-4cf4-8c2c-0e2871298b8d	dcf5fdcd-9837-48e8-8335-7a245acd9c37	100ml	DHB-0032-100ML	12000	\N	t	2026-07-16 15:02:06.324	2026-07-19 14:03:53.683	t
70062b53-4954-41d2-adb3-e0d381809b12	312a8838-da3b-45cc-afe4-bdb61d487252	100ml	DHB-0033-100ML	12000	\N	t	2026-07-16 15:02:09.36	2026-07-19 14:03:57.275	t
a55633f3-5a83-4629-9ea1-3c6bc9c8edad	1fe93fdd-e1f4-4653-be71-8f563d0b566c	100ml	DHB-0034-100ML	12000	\N	t	2026-07-16 15:02:12.643	2026-07-19 14:04:01.57	t
d856b3e8-75e2-4705-abd0-9dcbebe52b7c	ff492e6a-9f3a-4013-bff9-371914b060e3	100ml	DHB-0035-100ML	12000	\N	t	2026-07-16 15:02:16.422	2026-07-19 14:04:05.228	t
76e3889b-cb3e-4823-87d1-3bc81c700321	ba8a5af6-892c-4fc3-99db-d04e3e3fc452	100ml	DHB-0036-100ML	12000	\N	t	2026-07-16 15:02:19.44	2026-07-19 14:04:08.714	t
9cd63ab1-1c29-4db9-af89-1e009d7418f6	397115ec-f4e5-4414-839b-67d8aaf0d3be	100ml	DHB-0037-100ML	12000	\N	t	2026-07-16 15:02:23.581	2026-07-19 14:04:12.699	t
9df81265-7b7e-43f7-9766-435dd3f702f9	3efc65e3-0315-47e4-aaa4-f3979b8d3a7b	100ml	DHB-0038-100ML	12000	\N	t	2026-07-16 15:02:27.967	2026-07-19 14:04:16.619	t
ef2a79ed-6775-4452-b5b3-6503c85f3872	81de114f-b777-47a6-bcf5-e330ca90337b	100ml	DHB-0039-100ML	12000	\N	t	2026-07-16 15:02:32.507	2026-07-19 14:04:20.367	t
6079c119-6aa5-4307-b8b0-bf55e45dc234	035a49c9-3768-457d-aff4-9e2b206026d2	100ml	DHB-0040-100ML	12000	\N	t	2026-07-16 15:02:35.612	2026-07-19 14:04:24.22	t
8959ad61-eb83-4541-8fb4-adb8a4cd6a9c	4bb8b556-298d-4ca8-ae89-102b6665d712	100ml	DHB-0041-100ML	12000	\N	t	2026-07-16 15:02:38.394	2026-07-19 14:04:28.005	t
280e79f3-025a-455d-b4de-c9c199569e92	88b9c3ea-f9aa-44a8-aa88-1d2dfa87051c	100ml	DHB-0042-100ML	12000	\N	t	2026-07-16 15:02:41.447	2026-07-19 14:04:32.086	t
bd05dec3-b31c-46b3-b4a9-c628abcb5a4c	38976821-8d3a-45f6-9ead-9da7672e60ff	100ml	DHB-0043-100ML	12000	\N	t	2026-07-16 15:02:44.66	2026-07-19 14:04:35.87	t
902b7cdc-25ba-45aa-b9fd-56830e50d9b6	e850daba-9bef-4315-a514-27cb52d08d12	100ml	DHB-0044-100ML	12000	\N	t	2026-07-16 15:02:47.762	2026-07-19 14:04:39.92	t
a77492b8-b76b-47e4-985d-40128931915d	723e5cc1-fc70-499a-9dd3-6a3b6656e95c	100ml	DHB-0045-100ML	12000	\N	t	2026-07-16 15:02:50.745	2026-07-19 14:04:43.2	t
54567693-a0f8-4673-af0e-eb5f44d97158	44ea09e5-6635-4b8c-bb71-e8c3170a869b	100ml	DHB-0046-100ML	12000	\N	t	2026-07-16 15:02:53.78	2026-07-19 14:04:47.147	t
e3e0cb67-d37d-46ba-8ec6-2f7c24cfde29	4f50b3a7-eb39-4495-8a2c-9d0ef9131f00	100ml	DHB-0048-100ML	12000	\N	t	2026-07-16 15:02:59.453	2026-07-19 14:04:54.216	t
2751e76f-ec24-4fe7-9d5a-67ea9c798b28	52ad51f7-28b8-424b-8b33-2ec3540ccf94	100ml	DHB-0052-100ML	12000	\N	t	2026-07-16 15:03:10.868	2026-07-19 14:05:11.594	t
82a121c6-4b9c-4b7c-8c7e-3372aa7cbbc0	a74a511c-771a-4ced-ba3b-7b100ac108d2	100ml	DHB-0053-100ML	12000	\N	t	2026-07-16 15:03:13.964	2026-07-19 14:05:15.271	t
9c0be5a3-684c-40aa-8784-f64b6f343a27	ba802919-7fce-4546-a59b-14bd0460b0d0	100ml	DHB-0054-100ML	12000	\N	t	2026-07-16 15:03:16.666	2026-07-19 14:05:26.298	t
d7b437da-0cfc-41d5-beec-d7a4f7a76812	2f20daca-1e33-43e9-bfce-5f462f9aad1f	100ml	DHB-0055-100ML	12000	\N	t	2026-07-16 15:03:19.58	2026-07-19 14:05:34.547	t
2011993a-e5b2-4c18-8e15-2922a21277d6	ce4d51f0-433e-460a-a208-621c3e8f4b19	100ml	DHB-0056-100ML	12000	\N	t	2026-07-16 15:03:22.751	2026-07-19 14:05:41.817	t
b73b0d96-eeee-41a1-b61c-a92f8fae82e6	d3b56ea8-5e1a-4d0f-9eeb-66a8f17d70f0	100ml	DHB-0057-100ML	12000	\N	t	2026-07-16 15:03:25.798	2026-07-19 14:05:50.902	t
5e0129f5-16f5-4cd1-894f-6c866e9e1087	ab0fdb66-51a5-4cfd-b076-79828c0b717e	100ml	DHB-0058-100ML	12000	\N	t	2026-07-16 15:03:28.521	2026-07-19 14:05:57.286	t
3aeb1dd8-f89b-41ab-826b-2abd0d24bd54	7dc66a03-4d0f-4276-869e-09b2c818f7e1	100ml	DHB-0059-100ML	12000	\N	t	2026-07-16 15:03:31.503	2026-07-19 14:06:04.924	t
ec06bb82-1723-40fe-9c30-dc5dce6f56dc	153c7004-3501-4bee-866f-3af4678025f6	100ml	DHB-0060-100ML	12000	\N	t	2026-07-16 15:03:34.523	2026-07-19 14:06:13.007	t
b1098089-fae7-4eaa-8b76-b4c2deba06a2	d9093e0e-6e25-4196-b413-4a49b34b4bfe	100ml	DHB-0061-100ML	12000	\N	t	2026-07-16 15:03:37.669	2026-07-19 14:06:22.375	t
013d4c28-c6c9-4475-b19a-0455a0ec0b8b	196d0da9-174f-47bb-95cd-10ac089fa6ef	100ml	DHB-0062-100ML	12000	\N	t	2026-07-16 15:03:40.887	2026-07-19 14:06:26.374	t
c45ebaf6-f1b2-4814-b607-d96f63844257	41a9d464-7d13-4cdd-9f6b-de11a694a2cf	100ml	DHB-0063-100ML	12000	\N	t	2026-07-16 15:03:44.189	2026-07-19 14:06:30.168	t
ded7605c-4ffc-428c-a16a-0c6c3a22d48f	aa34a7e3-727d-4e19-9d1c-7d94b2cf6f13	100ml	DHB-0064-100ML	12000	\N	t	2026-07-16 15:03:47.165	2026-07-19 14:06:33.842	t
f9b4fe32-fc2f-4117-88a9-0e73774294ec	40726f06-c62b-46f8-b1d8-d92b02a31d77	100ml	DHB-0066-100ML	12000	\N	t	2026-07-16 15:03:52.843	2026-07-19 14:06:41.132	t
97ac788b-6f44-4477-8883-c1368124d570	35e7f742-681f-4b0f-b429-cd4dfa3231d3	100ml	DHB-0067-100ML	12000	\N	t	2026-07-16 15:03:55.555	2026-07-19 14:06:44.563	t
9147630c-0d25-47d0-8b74-6692535bbb48	93e4e0f3-0b00-4dfc-a8b1-8c016ab4cbe7	100ml	DHB-0068-100ML	12000	\N	t	2026-07-16 15:03:58.321	2026-07-19 14:06:47.995	t
43bd0c96-b9c0-47b2-a186-e7f02a82aaa3	af4e4b85-9bcd-4a9b-a172-1d9c7e7b9954	100ml	DHB-0069-100ML	12000	\N	t	2026-07-16 15:04:01.302	2026-07-19 14:06:51.683	t
e7f768e8-1b9f-44a0-8d69-d636bdedc2a6	60cb819e-a78e-4fac-897b-30166e63fc97	100ml	DHB-0070-100ML	12000	\N	t	2026-07-16 15:04:04.27	2026-07-19 14:06:55.654	t
32dd50f8-0e39-491a-a61d-ff77503c88dd	0df63608-7a9b-4dc7-9166-4ae3f1614388	100ml	DHB-0071-100ML	12000	\N	t	2026-07-16 15:04:07.204	2026-07-19 14:06:59.444	t
0ae31319-d5fd-4530-b7ef-80c6b34702a8	bfed6bb8-b8ac-4eb6-91c6-3573e728987f	100ml	DHB-0072-100ML	12000	\N	t	2026-07-16 15:04:09.86	2026-07-19 14:07:03.6	t
7db04d3c-23f0-4021-a97c-a4c16abbafca	9130e65e-2416-4133-ba17-ac151fc19dcc	100ml	DHB-0073-100ML	12000	\N	t	2026-07-16 15:04:12.664	2026-07-19 14:07:07.635	t
23df6107-bdd1-43e9-aff2-452776b2fb6a	85d4b481-27a7-40b3-a1ec-cd3395a97194	100ml	DHB-0349-100ML	12000	\N	t	2026-07-16 15:18:02.719	2026-07-19 14:26:21.267	t
faeb2c84-8426-47cc-9188-3a1e874c4cbd	f7a40dcd-62dd-417a-b2a6-15f863f10f7f	100ml	DHB-0350-100ML	12000	\N	t	2026-07-16 15:18:06.058	2026-07-19 14:26:24.858	t
e10de80f-84ab-44a4-bd20-f820487db99b	cfab21bb-400c-4884-aba9-a08668026a8c	100ml	DHB-0352-100ML	12000	\N	t	2026-07-16 15:18:12.719	2026-07-19 14:26:33.435	t
b536124a-ae8a-4645-8ceb-566e74c9614e	daa86be6-7e10-4c4f-80d6-38bdd01adc39	100ml	DHB-0353-100ML	12000	\N	t	2026-07-16 15:18:15.962	2026-07-19 14:26:37.364	t
747c2e05-42a9-4d6d-b392-ef757df33ece	bfe66f71-0b3f-48d6-ae17-3579fa5955d2	100ml	DHB-0354-100ML	12000	\N	t	2026-07-16 15:18:21.663	2026-07-19 14:26:41.589	t
2dcc0c67-75b2-4b6d-aab2-31e81ce67925	70a64667-e3cc-4295-a254-bcf640a0e6af	100ml	DHB-0451-100ML	12000	\N	t	2026-07-16 15:23:48.742	2026-07-19 14:32:13.595	t
c4f949ab-269b-4195-8fe3-e07fd3d98631	e3d2d948-92b2-426d-b792-2769a000bd19	100ml	DHB-0075-100ML	12000	\N	t	2026-07-16 15:04:18.44	2026-07-19 14:07:15.419	t
dd1de91b-d708-4263-a1d7-2a52be277955	1ace4014-b9df-4dbc-83f0-cb336ab3154f	100ml	DHB-0076-100ML	12000	\N	t	2026-07-16 15:04:21.013	2026-07-19 14:07:19.056	t
481ad138-af29-4636-a4ab-26faa18ae6b9	3a21e5ec-28c0-4f84-9e28-716ffaaf708b	100ml	DHB-0077-100ML	12000	\N	t	2026-07-16 15:04:23.884	2026-07-19 14:07:22.894	t
d91fbab0-f0cc-4035-8d0d-cbdfdf02ab8b	f00a2fe6-3317-4679-b60f-98da548f091a	100ml	DHB-0078-100ML	12000	\N	t	2026-07-16 15:04:26.741	2026-07-19 14:07:27.193	t
7466fef0-5340-447c-a626-3a2b81e68524	31659561-fd1b-4790-9188-cec150ddf740	100ml	DHB-0079-100ML	12000	\N	t	2026-07-16 15:04:29.79	2026-07-19 14:07:31.29	t
ee37a8c9-b8c0-495d-b44b-846e946dbb59	0ddb987e-77d8-400b-baa1-a69b620cc9bc	100ml	DHB-0080-100ML	12000	\N	t	2026-07-16 15:04:32.958	2026-07-19 14:07:35.611	t
fdb23025-640d-45ac-9270-9ecf4e7dca88	0f66d56c-fbca-4d6d-b35e-09420861c1fd	100ml	DHB-0081-100ML	12000	\N	t	2026-07-16 15:04:35.366	2026-07-19 14:07:39.278	t
dfce6aa7-cdba-4220-af18-5a1c6ba5a72e	945bbd94-7fe1-4bfb-87c7-11c873ee3af7	100ml	DHB-0082-100ML	12000	\N	t	2026-07-16 15:04:38.019	2026-07-19 14:07:43.629	t
3ef3388b-032e-4648-a442-fc9ac8fa8e51	65fb337a-a8fe-436b-b5d5-8cc4cf67e822	100ml	DHB-0083-100ML	12000	\N	t	2026-07-16 15:04:41.262	2026-07-19 14:07:47.575	t
1b76c085-8f81-45ee-86c3-6a7c83579a7d	e9a4ffde-feb3-41c5-ae79-54cf6b1ca96b	100ml	DHB-0084-100ML	12000	\N	t	2026-07-16 15:04:44.217	2026-07-19 14:07:51.946	t
1e3c73f5-d87a-4a96-9ef9-5227817c3faa	5e8065e9-d4a8-4b18-9a8f-864de258ed66	100ml	DHB-0085-100ML	12000	\N	t	2026-07-16 15:04:46.864	2026-07-19 14:07:55.872	t
32680a36-5f6d-4276-89b2-86fa5dd340d1	ab073824-be87-4b52-8c45-22212449408b	100ml	DHB-0086-100ML	12000	\N	t	2026-07-16 15:04:49.264	2026-07-19 14:07:59.762	t
5ae5d95f-c8bd-407a-947d-e8d7c301f3da	986881ad-1775-40e0-83d4-c281ff40abad	100ml	DHB-0087-100ML	12000	\N	t	2026-07-16 15:04:51.663	2026-07-19 14:08:03.252	t
f00bfe49-ae91-44c9-ab82-8dfd4597f42b	031207ac-912b-4c24-a80b-d121f5c9cdc3	100ml	DHB-0088-100ML	12000	\N	t	2026-07-16 15:04:54.079	2026-07-19 14:08:07.03	t
df72c7db-61c3-41ff-abc6-94ad26afc536	daafce23-50c9-423e-8d3f-8602da604567	100ml	DHB-0089-100ML	12000	\N	t	2026-07-16 15:04:56.784	2026-07-19 14:08:10.928	t
2ed2384b-f82a-4fb8-b7ba-97517170c7ab	6f994bb6-d2bf-48f8-a0b0-e2a5a246bfd1	100ml	DHB-0090-100ML	12000	\N	t	2026-07-16 15:04:59.178	2026-07-19 14:08:14.832	t
5ae822fe-32bb-4a16-8b16-0409f0c2853d	9fcfb7f1-4b02-4d85-9d6e-9f6d30050467	100ml	DHB-0091-100ML	12000	\N	t	2026-07-16 15:05:01.613	2026-07-19 14:08:18.806	t
7379bf4e-4106-4b24-8551-225ae71ba624	4c67a538-fc47-460f-bc48-c95e279c5e9d	100ml	DHB-0092-100ML	12000	\N	t	2026-07-16 15:05:04.004	2026-07-19 14:08:22.003	t
a87e5143-1e7d-4714-9827-0af2bcd0632c	da07c0cc-32ce-4700-be29-b45490da697f	100ml	DHB-0093-100ML	12000	\N	t	2026-07-16 15:05:07.555	2026-07-19 14:08:25.529	t
b7e311b9-1d9f-4b2b-a8f6-7a9139cbac5b	8d4029da-96d1-4eec-8b78-6762b4ff7f82	100ml	DHB-0094-100ML	12000	\N	t	2026-07-16 15:05:10.22	2026-07-19 14:08:29.254	t
893c3bf6-ef9d-459b-9074-c2c6a541a1d2	78efa338-9c4f-4fb2-b9ce-c6764f91adea	100ml	DHB-0095-100ML	12000	\N	t	2026-07-16 15:05:12.947	2026-07-19 14:08:33.26	t
1cd58114-b193-4798-8d59-0d9ab706c009	e6ded678-e1f9-4fb6-9a91-62bff43db19f	100ml	DHB-0096-100ML	12000	\N	t	2026-07-16 15:05:15.719	2026-07-19 14:08:36.712	t
a914cfc5-2b3e-4163-a421-297ac96f6f28	48effdc1-6343-4a8e-aca2-101fe013fd72	100ml	DHB-0097-100ML	12000	\N	t	2026-07-16 15:05:18.789	2026-07-19 14:08:40.149	t
452c9446-712f-479f-bb8d-72b72f2c4937	1e57282b-dc0e-479f-9d2a-3d37929477bb	100ml	DHB-0098-100ML	12000	\N	t	2026-07-16 15:05:22.442	2026-07-19 14:08:43.922	t
e0f041f3-1381-4ca6-adee-d917cd28d08a	bc1dc5b9-e07d-41bb-944a-6a75e0f2462f	100ml	DHB-0103-100ML	12000	\N	t	2026-07-16 15:05:36.481	2026-07-19 14:09:03.045	t
b3c922ea-73dd-4686-a63a-f0d33cc1d138	064c5488-1c71-4707-bca8-9506854f0b5e	100ml	DHB-0104-100ML	12000	\N	t	2026-07-16 15:05:39.775	2026-07-19 14:09:06.631	t
e5d6384b-5de1-44a9-860b-359ffd575a87	1b364c0b-662e-4cd5-954c-6bfee2b2c366	100ml	DHB-0110-100ML	12000	\N	t	2026-07-16 15:05:59.159	2026-07-19 14:09:29.514	t
ddcdbbd4-bb30-45e1-b8d2-bea5b3fc5aa1	8f922038-e240-4d69-9174-7485ad0d07b2	100ml	DHB-0111-100ML	12000	\N	t	2026-07-16 15:06:01.866	2026-07-19 14:09:33.517	t
c5f462df-b39e-49c7-b5f8-649245f0c4cc	b0716a17-fde6-4187-81e6-2e50de59786e	100ml	DHB-0112-100ML	12000	\N	t	2026-07-16 15:06:05.352	2026-07-19 14:09:37.351	t
d70b99fe-79b3-4bc5-87ba-9365ea02ed19	2aecd3d7-0c14-40fc-9a02-5aa742da6901	100ml	DHB-0113-100ML	12000	\N	t	2026-07-16 15:06:08.412	2026-07-19 14:09:41.042	t
1c1b5e96-8b3b-408d-bb37-ddc0c207cae9	e08da125-5766-41a1-bdd6-c9ca9df0b92c	100ml	DHB-0114-100ML	12000	\N	t	2026-07-16 15:06:10.914	2026-07-19 14:09:44.379	t
be594b8a-196d-4b39-bffe-80f7232efd72	34b9d907-e77d-4dcf-8251-06b07fa60aa0	100ml	DHB-0115-100ML	12000	\N	t	2026-07-16 15:06:13.818	2026-07-19 14:09:48.051	t
eb7efc80-4e00-404c-ba26-df796fceeb4f	9034bc0f-5328-4dd3-b722-916bf17b239e	100ml	DHB-0116-100ML	12000	\N	t	2026-07-16 15:06:16.216	2026-07-19 14:09:51.377	t
34dff8cc-e424-4def-9669-2d424e2baf94	6993eab3-d31c-4e3b-990b-f90609b12376	100ml	DHB-0118-100ML	12000	\N	t	2026-07-16 15:06:22.006	2026-07-19 14:09:59.056	t
4933eabf-7bcd-49eb-a445-200cff28d9d5	477898f2-01cc-4cee-8672-faea3786d6a4	100ml	DHB-0119-100ML	12000	\N	t	2026-07-16 15:06:25.2	2026-07-19 14:10:02.599	t
f455a5b1-afe3-4eaa-8166-77eb4161534a	2b0e1194-769e-4c6e-b225-af46fe33848c	100ml	DHB-0120-100ML	12000	\N	t	2026-07-16 15:06:28.213	2026-07-19 14:10:06.226	t
f6030495-f9ea-4fb9-bfb4-7facc6ef50d8	6b1cde3b-7614-4f26-9c6a-e05a03cfe1f9	100ml	DHB-0121-100ML	12000	\N	t	2026-07-16 15:06:31.281	2026-07-19 14:10:10.012	t
5c2199d3-a7d6-4379-b144-5fd65445eb4d	0cbe8336-1932-47a2-b470-90af69e93b25	100ml	DHB-0122-100ML	12000	\N	t	2026-07-16 15:06:35.3	2026-07-19 14:10:13.597	t
7ff4cb34-4a45-42f5-8bfe-0b0895c0d699	a563f573-f08e-4450-bf46-cc26967c13c6	100ml	DHB-0123-100ML	12000	\N	t	2026-07-16 15:06:39.977	2026-07-19 14:10:17.946	t
bda1f16c-7ce3-43f6-97ad-7786dca07133	fcf0c6ed-2798-4aee-b5fc-62978a63cbd3	100ml	DHB-0124-100ML	12000	\N	t	2026-07-16 15:06:42.843	2026-07-19 14:10:21.65	t
df783136-b56d-483e-80f5-95392dfebdff	8b600535-5657-4c05-a48a-59321a0ac0ab	100ml	DHB-0125-100ML	12000	\N	t	2026-07-16 15:06:45.512	2026-07-19 14:10:25.479	t
c37cbd92-40fb-4130-9e89-21df7978ad5e	f8751a4b-64a0-4878-ad63-704933f3f41f	100ml	DHB-0126-100ML	12000	\N	t	2026-07-16 15:06:48.179	2026-07-19 14:10:29.113	t
6d64eea4-0f61-432d-b90b-3e0ce3421bd9	c78c89fd-baf2-41b8-a4fd-ec1df6fbf32f	100ml	DHB-0127-100ML	12000	\N	t	2026-07-16 15:06:50.918	2026-07-19 14:10:32.56	t
165d931e-282d-4686-99ae-ddd1968cf71e	cdff64c6-23d9-4f6b-8a82-597f9fe21252	100ml	DHB-0357-100ML	12000	\N	t	2026-07-16 15:18:33.943	2026-07-19 14:26:52.52	t
8680439f-af15-478c-bc9f-e01d1b3f54d3	491e9b15-3ab0-4131-b469-e645cbafe7be	100ml	DHB-0383-100ML	12000	\N	t	2026-07-16 15:20:10.129	2026-07-19 14:28:22.616	t
e452b3f5-1537-4e6e-b973-5cafa2a98f87	38a49429-9679-4194-af1b-287261dd0258	100ml	DHB-0384-100ML	12000	\N	t	2026-07-16 15:20:12.995	2026-07-19 14:28:25.386	t
344793ed-08ef-4b85-b331-e8c113ed1bbe	50db0df3-bac9-4680-988f-dee91ccc20a2	100ml	DHB-0390-100ML	12000	\N	t	2026-07-16 15:20:32.303	2026-07-19 14:28:45.022	t
b865af7b-61ea-451b-a971-aae26c8807c3	d7696520-73d0-4473-babc-fa0d1f3df150	100ml	DHB-0129-100ML	12000	\N	t	2026-07-16 15:06:56.693	2026-07-19 14:10:39.644	t
eba3e909-17a2-48dc-a56d-edcd9f45243e	b8fab72a-155f-4392-bc00-93da631ca1a6	100ml	DHB-0130-100ML	12000	\N	t	2026-07-16 15:06:59.137	2026-07-19 14:10:43.097	t
2da6432f-6d98-4a3c-9324-25d3ccbe86ce	dfcdeaa5-756e-4dcf-8cdb-bd2bab3b377b	100ml	DHB-0131-100ML	12000	\N	t	2026-07-16 15:07:01.927	2026-07-19 14:10:46.928	t
5d3319ee-3161-4f13-a98d-793a49edfe0e	47998914-eb19-4aba-9a3b-c2760e9d9967	100ml	DHB-0132-100ML	12000	\N	t	2026-07-16 15:07:04.6	2026-07-19 14:10:50.548	t
0ddb6f4e-3024-4930-ab28-a663e7b08720	3bed23fb-b4bc-4699-9192-586f02c0405e	100ml	DHB-0133-100ML	12000	\N	t	2026-07-16 15:07:07.374	2026-07-19 14:10:54.455	t
2d1e2682-2ba3-4353-9327-93f428722e11	f03d5a97-0539-4692-8841-af7a070ee27a	100ml	DHB-0134-100ML	12000	\N	t	2026-07-16 15:07:10.027	2026-07-19 14:10:57.995	t
503b3924-3894-4024-9d71-b11126cc8f7f	7d1d7ad0-8f9a-4f49-a517-df10b3136560	100ml	DHB-0135-100ML	12000	\N	t	2026-07-16 15:07:13.451	2026-07-19 14:11:01.875	t
892b1e95-a1e6-469a-b52a-ca165c3ff286	ecb05f78-c3dc-4c3f-aeb9-ad7985bd34e5	100ml	DHB-0136-100ML	12000	\N	t	2026-07-16 15:07:16.139	2026-07-19 14:11:05.534	t
b29b691e-2610-4fb0-95dd-2d708b7660a1	d0ca3ed4-4f2e-44cb-a494-f1076499dedc	100ml	DHB-0137-100ML	12000	\N	t	2026-07-16 15:07:18.752	2026-07-19 14:11:08.834	t
bd111f90-a2a3-4138-8c84-05e242e23635	ce88f95e-01cc-4d2e-be0b-35d52bc297e9	100ml	DHB-0138-100ML	12000	\N	t	2026-07-16 15:07:21.306	2026-07-19 14:11:12.602	t
ef49f147-a7fd-49c8-a52c-0cafe912ba33	b7895678-6a6a-4273-ac01-a42aa7a1dc95	100ml	DHB-0139-100ML	12000	\N	t	2026-07-16 15:07:23.836	2026-07-19 14:11:16.478	t
539e8492-c61c-4555-ae9d-e3c57d2f8fe3	79864c5e-5f95-442f-8c8d-8c093066ee5b	100ml	DHB-0141-100ML	12000	\N	t	2026-07-16 15:07:30.447	2026-07-19 14:11:25.595	t
afe85538-8879-4bf5-ac05-daa905727ace	8710a3af-739b-4817-aceb-3d3eca0566d3	100ml	DHB-0142-100ML	12000	\N	t	2026-07-16 15:07:33.296	2026-07-19 14:11:37.388	t
8c309fc8-394c-48af-8739-0022a959a71d	76bede9b-42da-4e9e-997f-f5b3907397d0	100ml	DHB-0143-100ML	12000	\N	t	2026-07-16 15:07:36.302	2026-07-19 14:11:46.476	t
2444b21f-b754-4bd7-ad73-78addcd2988f	ba231572-151a-4d38-a492-7a0fd966042a	100ml	DHB-0144-100ML	12000	\N	t	2026-07-16 15:07:39.017	2026-07-19 14:11:50.663	t
b83bca9a-d059-4d34-9c45-21bd8645dfdd	0c8953b6-de1b-4a36-afc0-486388246612	100ml	DHB-0145-100ML	12000	\N	t	2026-07-16 15:07:41.701	2026-07-19 14:11:54.698	t
6cdeffad-5bc8-471c-a46c-44a10efb3f73	03889b15-9788-44d9-8fad-327ad9f3f429	100ml	DHB-0146-100ML	12000	\N	t	2026-07-16 15:07:44.111	2026-07-19 14:11:58.477	t
50650ace-bdec-49b3-ba97-1ffe0fe3e241	b6d4d2c2-184e-411a-a953-31b8a48f13d5	100ml	DHB-0147-100ML	12000	\N	t	2026-07-16 15:07:46.957	2026-07-19 14:12:02.137	t
e8dc8219-f3cb-4326-875f-cf6a7f930c69	dde8e905-12bb-4a7b-ba55-f5016baeafb8	100ml	DHB-0148-100ML	12000	\N	t	2026-07-16 15:07:49.364	2026-07-19 14:12:05.828	t
6d1f8492-dcb0-4536-bba1-7970ff96e26d	9d4b8003-45af-4967-9bd3-4a134a8ea251	100ml	DHB-0149-100ML	12000	\N	t	2026-07-16 15:07:52.162	2026-07-19 14:12:10.329	t
fabb30f1-c472-49dc-a8ad-d4d6d2256ce8	b4958433-28ae-4cf7-b922-68e31a061fd0	100ml	DHB-0150-100ML	12000	\N	t	2026-07-16 15:07:54.725	2026-07-19 14:12:14.115	t
891b1f7d-d609-4da8-964e-ae89e80b3d6a	8622cbf7-674e-4327-8745-58e0e8610e04	100ml	DHB-0151-100ML	12000	\N	t	2026-07-16 15:07:57.417	2026-07-19 14:12:17.681	t
d716de85-34a3-450b-a4da-220e8e2eb7f6	c1c65875-789f-42a8-80e7-cba95705cd95	100ml	DHB-0152-100ML	12000	\N	t	2026-07-16 15:08:00.583	2026-07-19 14:12:21.573	t
24c599fd-24e9-4296-b73d-a80789496a13	4d017fe5-f486-4d0a-b1de-21ddcc5b9256	100ml	DHB-0153-100ML	12000	\N	t	2026-07-16 15:08:04.622	2026-07-19 14:12:26.01	t
7d9916ea-4f89-4d80-9faa-faa2ee9103cf	0fbc106f-ec7f-4a5b-a6b5-3921a845a82b	100ml	DHB-0154-100ML	12000	\N	t	2026-07-16 15:08:07.222	2026-07-19 14:12:29.586	t
fe2e7100-39cd-4369-8d18-3e8caf5b5584	6b95192d-3e8d-4c94-8b61-f61c421275be	100ml	DHB-0155-100ML	12000	\N	t	2026-07-16 15:08:11.499	2026-07-19 14:12:33.738	t
1228ee29-1f2c-4a9f-a69b-95aee2d458f0	b02ca448-2a46-4038-9a94-6834dc62e633	100ml	DHB-0156-100ML	12000	\N	t	2026-07-16 15:08:15.095	2026-07-19 14:12:37.366	t
c3134d14-c70a-4f05-a8dc-6c2946d11223	ebbb8897-6a67-4516-80b4-bc0d509ef9df	100ml	DHB-0157-100ML	12000	\N	t	2026-07-16 15:08:17.81	2026-07-19 14:12:41.364	t
48107d82-345d-42b7-8a1d-307f4f9698aa	ca90d0f7-11fb-4777-a4e8-2ab9455518b2	100ml	DHB-0158-100ML	12000	\N	t	2026-07-16 15:08:20.183	2026-07-19 14:12:44.945	t
0c246932-0863-44b9-8072-2f46cb50e2c7	d7651e66-34ac-45dc-99e7-4b7804a68c1a	100ml	DHB-0159-100ML	12000	\N	t	2026-07-16 15:08:22.874	2026-07-19 14:12:49.041	t
ef431e90-fe7e-408e-ad49-9c4daa0b54de	bafb0778-bd98-4348-ba4b-a3c4e82431de	100ml	DHB-0160-100ML	12000	\N	t	2026-07-16 15:08:25.776	2026-07-19 14:12:52.843	t
139ac0a9-2ced-4a14-a78a-5f7823a9d2fe	60cc4b18-0c60-48f9-b316-63ff370b385c	100ml	DHB-0161-100ML	12000	\N	t	2026-07-16 15:08:28.539	2026-07-19 14:12:56.722	t
52e81466-e837-4e0b-ad54-e6eb0a083ab7	7ab5fa67-e6ab-4f39-8866-a4428bbfaa0b	100ml	DHB-0162-100ML	12000	\N	t	2026-07-16 15:08:31.026	2026-07-19 14:13:00.816	t
5b6380d9-20cf-4663-a726-d002b2a61cf2	72d1e17a-edc0-463b-a895-8c4f442b3c5e	100ml	DHB-0164-100ML	12000	\N	t	2026-07-16 15:08:37.392	2026-07-19 14:13:08.909	t
84bc8b92-35fb-47e6-ba57-156f96986fcf	63da88db-96e9-458b-ad10-10d9d0206609	100ml	DHB-0165-100ML	12000	\N	t	2026-07-16 15:08:40.559	2026-07-19 14:13:13.105	t
71fc1678-3897-41ee-a238-226ab4a38bad	cda6797a-59e1-40d2-a514-6844b8a36b91	100ml	DHB-0166-100ML	12000	\N	t	2026-07-16 15:08:43.862	2026-07-19 14:13:17.005	t
925bac83-183f-491c-b849-b7bb3caf54ab	85e52a66-84c6-48ee-9eab-d648b3aa68ce	100ml	DHB-0167-100ML	12000	\N	t	2026-07-16 15:08:48.195	2026-07-19 14:13:21.093	t
33c95583-cc6f-46be-86e3-b4496e853d56	74752fc6-8ebb-4939-a83f-cb2d34f9d687	100ml	DHB-0168-100ML	12000	\N	t	2026-07-16 15:08:51.213	2026-07-19 14:13:24.836	t
363ad906-9537-4bee-b431-9aa047c6a9a2	5d142616-2772-4ab5-a2ae-e7fbed159c58	100ml	DHB-0169-100ML	12000	\N	t	2026-07-16 15:08:53.907	2026-07-19 14:13:28.717	t
929fa7c7-a54c-4927-ba40-538e176bcacf	147267f5-ad6b-46d1-afc8-16d5c7b78579	100ml	DHB-0170-100ML	12000	\N	t	2026-07-16 15:08:56.762	2026-07-19 14:13:32.564	t
ec95219c-95aa-4bc1-a8b2-d9680062f960	32dbefd4-7297-4427-94b6-312f83f3f7c8	100ml	DHB-0171-100ML	12000	\N	t	2026-07-16 15:08:59.372	2026-07-19 14:13:36.783	t
eb284270-baea-48c0-91f0-4eda169499ee	3d140776-c6a6-46c0-9874-981ed5dd1b1b	100ml	DHB-0172-100ML	12000	\N	t	2026-07-16 15:09:01.857	2026-07-19 14:13:40.568	t
a335f21d-05f7-4474-ab81-ccac588560b6	2480a1fe-8e81-4efc-9dbc-a995a0025622	100ml	DHB-0179-100ML	12000	\N	t	2026-07-16 15:09:21.766	2026-07-19 14:14:20.175	t
2c2a19d4-bdab-4a1b-a3fa-a750ca68dc81	6a5cf2a6-e87d-4cc2-9062-b523922b4cb7	100ml	DHB-0180-100ML	12000	\N	t	2026-07-16 15:09:24.457	2026-07-19 14:14:26.576	t
da9d5408-2c09-4193-8de6-d5dee8ab2bed	588d6543-eef6-4d84-b019-4d7a8b9fba06	100ml	DHB-0397-100ML	12000	\N	t	2026-07-16 15:20:57.212	2026-07-19 14:29:08.152	t
362b568a-92ec-4f34-b15d-570e33ebdd3b	3df80641-667c-4a5f-8475-d64c8c46683a	100ml	DHB-0412-100ML	12000	\N	t	2026-07-16 15:21:45.649	2026-07-19 14:29:58.176	t
33eb7e49-211b-4f5b-b8d2-b0f54f07dfb3	d8a92854-1023-4459-aab1-a174a062c549	100ml	DHB-0413-100ML	12000	\N	t	2026-07-16 15:21:48.567	2026-07-19 14:30:01.025	t
e8dd0853-7bfb-49a0-bf96-1ba11875bdf7	69ef4e63-1dfe-4f48-bc6d-47bdb7216ad9	50ml	DHB-0402-50ML	8000	\N	t	2026-07-16 15:21:13.727	2026-07-19 14:29:24.589	t
eec976fd-f65b-4770-9055-cac4f35ac3e7	29dc7089-a615-475c-b033-a0fd4a59a599	50ml	DHB-0408-50ML	8000	\N	t	2026-07-16 15:21:32.654	2026-07-19 14:29:44.866	t
e6aa93b2-dab6-4e45-bb04-122fd74cdb44	e3dc48a8-58da-4025-ad51-fe1a4db093c0	50ml	DHB-0409-50ML	8000	\N	t	2026-07-16 15:21:35.856	2026-07-19 14:29:48.294	t
4632827e-05ac-49db-b928-f2e779fabc23	30f6719f-41b5-4f60-80d2-afa6b2ccbf1f	50ml	DHB-0410-50ML	8000	\N	t	2026-07-16 15:21:38.365	2026-07-19 14:29:51.316	t
8008ef32-a906-482f-97b3-703ca3559edf	f22ca276-9e1c-4865-8703-95e1ef0fce2f	50ml	DHB-0411-50ML	8000	\N	t	2026-07-16 15:21:41.53	2026-07-19 14:29:54.592	t
4ce9df90-0028-4422-9ca3-9fc7e06e8f3c	3df80641-667c-4a5f-8475-d64c8c46683a	50ml	DHB-0412-50ML	8000	\N	t	2026-07-16 15:21:45.382	2026-07-19 14:29:57.87	t
21d4aded-8f0c-485f-a289-b2d68cb5e895	86df4db3-9546-458e-812d-987ad735f122	200ml	DHB-0014-200ML	20000	\N	t	2026-07-16 15:01:09.509	2026-07-19 14:02:44.05	t
8dd87456-0ee2-431b-be73-09e37f5e6e77	c7b5b7e5-cdd5-45e5-bb69-63cfefed4251	100ml	DHB-0047-100ML	12000	\N	t	2026-07-16 15:02:56.423	2026-07-19 14:04:50.471	t
e912af7c-76f6-4ab2-8065-30c241a32a19	40726f06-c62b-46f8-b1d8-d92b02a31d77	200ml	DHB-0066-200ML	20000	\N	t	2026-07-16 15:03:53.113	2026-07-19 14:06:41.395	t
7c800624-0182-4690-8297-1458ca9fc899	4c817412-00d4-478d-bebc-40a3d76a085e	100ml	DHB-0099-100ML	12000	\N	t	2026-07-16 15:05:24.848	2026-07-19 14:08:47.33	t
0e806aac-120b-416f-a742-8faa5a9e2fce	8323296c-8ed6-4243-9234-54a2b6e6114c	200ml	DHB-0109-200ML	20000	\N	t	2026-07-16 15:05:56.427	2026-07-19 14:09:25.831	t
a3612fdf-8952-4359-b577-719ca97d58df	d8a92854-1023-4459-aab1-a174a062c549	50ml	DHB-0413-50ML	8000	\N	t	2026-07-16 15:21:48.238	2026-07-19 14:30:00.754	t
db017af5-2a01-4483-8233-3d056ef04952	57cf1c9b-bcfa-44d9-b581-035028d4b6f8	50ml	DHB-0414-50ML	8000	\N	t	2026-07-16 15:21:54.066	2026-07-19 14:30:04.174	t
532f0384-08e9-4b5e-a117-ac49f6c752d7	250519ff-2f1e-4009-8d48-c75d79f59f8f	50ml	DHB-0415-50ML	8000	\N	t	2026-07-16 15:21:57.839	2026-07-19 14:30:07.291	t
4362fab6-df37-4103-8b10-eb877d47c39e	b02ca448-2a46-4038-9a94-6834dc62e633	200ml	DHB-0156-200ML	20000	\N	t	2026-07-16 15:08:15.362	2026-07-19 14:12:37.674	t
744a1d77-294b-46d3-a830-b2c9b2acd9f7	3c5563bf-8bcf-42f5-a50b-28ad63938d4d	100ml	DHB-0140-100ML	12000	\N	t	2026-07-16 15:07:27.111	2026-07-19 14:11:20.364	t
c41654f9-60c2-4ee4-9fef-754094f5af92	7013dcaa-b40f-43d9-a2fb-e25459b56cd9	100ml	DHB-0181-100ML	12000	\N	t	2026-07-16 15:09:27.436	2026-07-19 14:14:32.988	t
99de07cd-b0ab-4bef-8fb0-5850a16a0ada	4ad4be79-66cf-4e94-88cd-9ac109049507	100ml	DHB-0182-100ML	12000	\N	t	2026-07-16 15:09:30.957	2026-07-19 14:14:39.706	t
0696d036-d85e-4633-8890-d800e9195100	30056426-cb6c-4a98-8e00-8c839e350b07	100ml	DHB-0183-100ML	12000	\N	t	2026-07-16 15:09:33.752	2026-07-19 14:14:44.809	t
dd1f6e4d-8d07-4bf2-9ce4-dca41362b883	36e49cfe-f6b4-4efc-965f-908b2495e261	100ml	DHB-0184-100ML	12000	\N	t	2026-07-16 15:09:36.4	2026-07-19 14:14:51.149	t
dde93239-8361-40d3-a63e-2ce733965173	2e421b80-2bba-40cb-9271-2f374778fe6c	100ml	DHB-0185-100ML	12000	\N	t	2026-07-16 15:09:39.331	2026-07-19 14:14:58.218	t
0814987d-80bf-4079-8d58-a4ab8876cf07	951765db-c632-4eb1-8ccd-a365ee9a98c3	100ml	DHB-0186-100ML	12000	\N	t	2026-07-16 15:09:42.319	2026-07-19 14:15:08.253	t
0d55f566-730e-4404-9051-25d43144107e	2d3f30fc-b13c-40a9-a0d2-38d75e20d311	50ml	DHB-0403-50ML	8000	\N	t	2026-07-16 15:21:17.214	2026-07-19 14:29:27.968	t
9ea4ce53-c58c-41e2-a3fd-02cc70833b9a	bcea55b8-babc-478c-9227-12b955a6fab1	50ml	DHB-0404-50ML	8000	\N	t	2026-07-16 15:21:19.735	2026-07-19 14:29:31.35	t
a3091d43-e69c-4109-b651-57b34ee8d03a	a301ce1b-44ea-4ca7-9682-153f2283ece0	100ml	DHB-0187-100ML	12000	\N	t	2026-07-16 15:09:44.993	2026-07-19 14:15:13.92	t
ac456d93-6071-4b6f-bd2f-b816c96929ce	30d74977-3ab5-4047-a372-e7a0dbd3e797	100ml	DHB-0188-100ML	12000	\N	t	2026-07-16 15:09:47.916	2026-07-19 14:15:18.472	t
3f4d51bf-fda2-4db2-bed2-5bfb9656e7e4	3249d1f8-95ac-4efb-a19a-c07713861354	100ml	DHB-0189-100ML	12000	\N	t	2026-07-16 15:09:50.894	2026-07-19 14:15:23.57	t
b9c8c32b-5691-4d21-a01b-d447a67214c4	7a542bf6-eaf0-4077-b374-60dea2563c8c	100ml	DHB-0190-100ML	12000	\N	t	2026-07-16 15:09:53.586	2026-07-19 14:15:29.462	t
3617e369-9bbe-4782-a22f-cf493520a723	57bda1da-5b8e-461b-8940-757a8130c09b	100ml	DHB-0191-100ML	12000	\N	t	2026-07-16 15:09:56.439	2026-07-19 14:15:33.913	t
4f3a28d1-abdf-47ee-88a2-081bf4a530e7	8335f285-1a61-47f4-b02a-dbd8e8c2b926	100ml	DHB-0195-100ML	12000	\N	t	2026-07-16 15:10:07.238	2026-07-19 14:15:49.462	t
a094beb5-73fd-4c9a-8281-f9abd881c8b9	42b49c6a-f7d8-45bd-98dd-0f5ba1ebac25	200ml	DHB-0211-200ML	20000	\N	t	2026-07-16 15:10:52.071	2026-07-19 14:17:00.351	t
9262b213-8b67-45d0-bfde-1ea2ecc6e1d6	bcfbe8d4-46e1-43cd-aa18-f2aad6130d19	100ml	DHB-0244-100ML	12000	\N	t	2026-07-16 15:12:31.794	2026-07-19 14:19:22.256	t
12e8561e-f590-4f64-8f64-8b840923fb14	b0bc5542-772e-4673-9b0b-08a1ff1cd72d	200ml	DHB-0260-200ML	20000	\N	t	2026-07-16 15:13:17.94	2026-07-19 14:20:24.788	t
a39c900f-872f-4549-b832-9ad7dbbca966	be44a0c2-782d-4834-ac0a-83de9f1db9db	100ml	DHB-0293-100ML	12000	\N	t	2026-07-16 15:14:56.46	2026-07-19 14:22:34.701	t
71b9b428-7aa8-4fa3-ab43-b1b186b4eed3	2a547bff-0235-4fdf-a781-b2cc21af4ca6	50ml	DHB-0401-50ML	8000	\N	t	2026-07-16 15:21:10.638	2026-07-19 14:29:21.209	t
66035138-b0ad-4495-bc43-51d5a27fcf59	a1caa491-6ddc-4a60-8b8c-07666adfee35	50ml	DHB-0405-50ML	8000	\N	t	2026-07-16 15:21:22.66	2026-07-19 14:29:34.728	t
ec3a2ef3-2b25-4d78-8160-ae9aebaba2f8	5f437268-78fa-4e79-a194-8e918581a503	50ml	DHB-0406-50ML	8000	\N	t	2026-07-16 15:21:25.981	2026-07-19 14:29:38.1	t
59708925-c93f-4297-b6fb-dc158a2f00c5	dcb4c4c5-203c-451c-998c-888362091608	50ml	DHB-0407-50ML	8000	\N	t	2026-07-16 15:21:29.37	2026-07-19 14:29:41.392	t
37d4766d-ecfe-4437-9d26-51c6d819a87e	40c0d3a1-48cf-43c0-b34e-2b240cd76b5b	100ml	DHB-0459-100ML	12000	\N	t	2026-07-16 15:24:13.917	2026-07-19 14:32:44.623	t
a71de6bc-f13c-4d8b-99a8-c629af9691ce	40c0d3a1-48cf-43c0-b34e-2b240cd76b5b	200ml	DHB-0459-200ML	20000	\N	t	2026-07-16 15:24:14.277	2026-07-19 14:32:44.891	t
65b5850f-2662-4a5d-960c-2aa2243f51e4	ccdd4abb-c33f-4d7d-afca-22a5dd296732	100ml	DHB-0460-100ML	12000	\N	t	2026-07-16 15:24:17.057	2026-07-19 14:32:48.247	t
f3445972-5295-494e-82fc-520a039f2171	ccdd4abb-c33f-4d7d-afca-22a5dd296732	200ml	DHB-0460-200ML	20000	\N	t	2026-07-16 15:24:17.507	2026-07-19 14:32:48.514	t
9234b6b7-a976-462e-a5b0-26bca9fb9848	9de02cb9-4c91-4e88-8846-dfed0c164ed6	100ml	DHB-0461-100ML	12000	\N	t	2026-07-16 15:24:20.626	2026-07-19 14:32:51.854	t
b47dccf1-6718-4860-81dd-8430f50a0383	d865d0cb-37de-443f-9674-fe12eac045cf	200ml	DHB-0465-200ML	20000	\N	t	2026-07-16 15:24:33.443	2026-07-19 14:33:07.107	t
7d40cfda-bc5d-4914-a3bd-30dee408475a	d4913078-04bd-4947-bdd0-e1ed5348dcf4	100ml	DHB-0466-100ML	12000	\N	t	2026-07-16 15:24:37.02	2026-07-19 14:33:10.795	t
d357f8af-19d4-4cf6-b026-d8dbd1ae9a35	d4913078-04bd-4947-bdd0-e1ed5348dcf4	200ml	DHB-0466-200ML	20000	\N	t	2026-07-16 15:24:37.318	2026-07-19 14:33:11.081	t
303a190c-748a-4123-8e3a-db0054cb9be8	7fb0586a-3b27-4739-95ab-ed541c327bec	100ml	DHB-0468-100ML	12000	\N	t	2026-07-16 15:24:43.769	2026-07-19 14:33:19.719	t
e02a70a8-c576-473c-b894-f217cf6d1f44	7fb0586a-3b27-4739-95ab-ed541c327bec	200ml	DHB-0468-200ML	20000	\N	t	2026-07-16 15:24:44.035	2026-07-19 14:33:20.002	t
f3eea6fe-4c98-4bc2-b21d-d865fcafb332	0cc2d0a1-fc44-49fe-a751-4ed9acbf843f	100ml	DHB-0469-100ML	12000	\N	t	2026-07-16 15:24:46.439	2026-07-19 14:33:23.263	t
b9bd5aa9-ab67-4b70-b952-058225770868	9de02cb9-4c91-4e88-8846-dfed0c164ed6	200ml	DHB-0461-200ML	20000	\N	t	2026-07-16 15:24:20.933	2026-07-19 14:32:52.153	t
03949aaa-5a63-4711-9525-def35dfec55c	6aae35b5-ae16-4a75-bc9f-d6d75a3ea804	100ml	DHB-0462-100ML	12000	\N	t	2026-07-16 15:24:23.729	2026-07-19 14:32:55.737	t
ad808c02-7c26-48de-befd-74e20ac314cb	6aae35b5-ae16-4a75-bc9f-d6d75a3ea804	200ml	DHB-0462-200ML	20000	\N	t	2026-07-16 15:24:24.001	2026-07-19 14:32:56.005	t
76cdba91-a708-4801-87b6-d5b4d201c474	7670908f-7917-4255-8e6d-26d3f47d859f	100ml	DHB-0463-100ML	12000	\N	t	2026-07-16 15:24:26.673	2026-07-19 14:32:58.992	t
cd936369-4bbf-498a-9ee4-af7be6880a1b	7670908f-7917-4255-8e6d-26d3f47d859f	200ml	DHB-0463-200ML	20000	\N	t	2026-07-16 15:24:26.989	2026-07-19 14:32:59.294	t
d16ff318-85bc-4291-a1ce-9572b40214cc	00a5a149-1fa5-479f-9d97-2f6736bed2f8	100ml	DHB-0464-100ML	12000	\N	t	2026-07-16 15:24:29.704	2026-07-19 14:33:03.044	t
2d54261c-2c50-4a08-9846-c760d56a1622	00a5a149-1fa5-479f-9d97-2f6736bed2f8	200ml	DHB-0464-200ML	20000	\N	t	2026-07-16 15:24:29.975	2026-07-19 14:33:03.359	t
2e3c4ec1-38be-4a52-99d6-6e2761fbf5f7	d865d0cb-37de-443f-9674-fe12eac045cf	100ml	DHB-0465-100ML	12000	\N	t	2026-07-16 15:24:33.128	2026-07-19 14:33:06.843	t
c24768f7-6dc8-459d-ab53-edffdf856247	57a1037a-d639-458f-8007-6b9ecfaa947a	100ml	DHB-0192-100ML	12000	\N	t	2026-07-16 15:09:59.66	2026-07-19 14:15:38.266	t
55a4e620-35b8-47f3-b3fb-a85a6ac6ce4b	d69f3606-a366-4aa1-aa3a-1dfc81dfe501	200ml	DHB-0326-200ML	20000	\N	t	2026-07-16 15:16:42.621	2026-07-19 14:24:45.047	t
c52440b4-4f99-4e15-aef7-6962f6dfbafa	d1e9245e-e54d-4473-a200-109c97d64c7e	100ml	DHB-0327-100ML	12000	\N	t	2026-07-16 15:16:44.973	2026-07-19 14:24:48.408	t
692bf82f-39f4-451a-b284-f8e21048f9ec	d1e9245e-e54d-4473-a200-109c97d64c7e	200ml	DHB-0327-200ML	20000	\N	t	2026-07-16 15:16:45.351	2026-07-19 14:24:48.766	t
5235f803-262e-4663-b0b8-4920c5add537	e3e755d3-1bff-4e3f-ac05-7345f1af1562	100ml	DHB-0455-100ML	12000	\N	t	2026-07-16 15:24:00.825	2026-07-19 14:32:29.633	t
96036728-50ee-4443-97e6-bf0013c72dee	e3e755d3-1bff-4e3f-ac05-7345f1af1562	200ml	DHB-0455-200ML	20000	\N	t	2026-07-16 15:24:01.171	2026-07-19 14:32:29.942	t
7e6c9694-7e28-46ce-a585-20e8422c491d	ec4d69a7-4074-4ba6-a546-2abfa0a9bac4	100ml	DHB-0456-100ML	12000	\N	t	2026-07-16 15:24:04.345	2026-07-19 14:32:33.626	t
28400b43-528f-463a-a37e-30ac557682c2	ec4d69a7-4074-4ba6-a546-2abfa0a9bac4	200ml	DHB-0456-200ML	20000	\N	t	2026-07-16 15:24:04.611	2026-07-19 14:32:33.893	t
96c29a0c-1043-428f-8f53-87b53b96fbe2	fe8c5d8c-a21e-4c9f-9e7b-9d57f7470ecf	100ml	DHB-0457-100ML	12000	\N	t	2026-07-16 15:24:07.826	2026-07-19 14:32:37.582	t
f84e8d17-4bf4-4a39-88d0-9e075c3f0174	fe8c5d8c-a21e-4c9f-9e7b-9d57f7470ecf	200ml	DHB-0457-200ML	20000	\N	t	2026-07-16 15:24:08.095	2026-07-19 14:32:37.927	t
2216ada1-718d-4eaa-88c7-883638fde426	c9fbd1bd-4c2a-42af-81c1-dc8b39ae8eb2	100ml	DHB-0458-100ML	12000	\N	t	2026-07-16 15:24:10.643	2026-07-19 14:32:40.964	t
a0ec00b4-a0f6-4d46-a5f5-8bceea8d4ac8	c9fbd1bd-4c2a-42af-81c1-dc8b39ae8eb2	200ml	DHB-0458-200ML	20000	\N	t	2026-07-16 15:24:11.001	2026-07-19 14:32:41.238	t
6d7fd718-7636-495e-93bb-d0faf80529d4	35c2337d-e95e-4ae1-a3f2-1665b4976aea	100ml	DHB-0419-100ML	12000	\N	t	2026-07-16 15:22:14.319	2026-07-19 14:30:21.074	t
015d75b1-176c-4afa-bd45-09b3cee37d6d	4b7caf97-02eb-478a-8388-d16bc59a5596	100ml	DHB-0193-100ML	12000	\N	t	2026-07-16 15:10:02.125	2026-07-19 14:15:41.654	t
c8d31acf-1604-49c5-9d03-b1d59a8e56b8	19133cd0-67a4-4de4-9809-4db49357d487	100ml	DHB-0194-100ML	12000	\N	t	2026-07-16 15:10:04.518	2026-07-19 14:15:45.251	t
99e2d013-39c6-4f32-904f-95f2ae3e27cb	3383c1ab-88c0-4958-bacf-0b1491a1e761	100ml	DHB-0196-100ML	12000	\N	t	2026-07-16 15:10:09.972	2026-07-19 14:15:54.106	t
a332ceb6-c37e-439e-acf5-0af240f44222	79ddcaec-0056-4c94-9e75-5bd97a6e6f9a	100ml	DHB-0197-100ML	12000	\N	t	2026-07-16 15:10:12.764	2026-07-19 14:15:58.591	t
668815f0-8109-4288-b6c5-58be1ad7e583	5deccc48-e4c5-4936-9a4c-31eb581dc9e7	100ml	DHB-0198-100ML	12000	\N	t	2026-07-16 15:10:15.667	2026-07-19 14:16:02.604	t
45ec2741-501d-45b0-ab27-739fa54d1e2e	83dbdeed-94db-4832-a9c0-63aa1132c9da	100ml	DHB-0199-100ML	12000	\N	t	2026-07-16 15:10:18.137	2026-07-19 14:16:07.094	t
dc0993eb-9e66-415a-b61d-90e13795241d	65c5ad19-2d58-4550-ac70-364c5816d0b5	100ml	DHB-0200-100ML	12000	\N	t	2026-07-16 15:10:20.898	2026-07-19 14:16:12.936	t
702c7434-e98b-4de6-9188-e61687606c16	6aad7fb3-5e37-46e0-accb-ffbf2c121ecf	100ml	DHB-0201-100ML	12000	\N	t	2026-07-16 15:10:23.54	2026-07-19 14:16:16.685	t
01285530-09d7-46f0-a483-3ebf65e389f6	359618ae-76db-47d0-b416-3f2874d42184	100ml	DHB-0202-100ML	12000	\N	t	2026-07-16 15:10:25.947	2026-07-19 14:16:20.404	t
1f70c79a-f3fe-45f7-8d98-34617a75b3ee	ed508f36-74a7-4304-b24e-9c50c5e101b2	100ml	DHB-0203-100ML	12000	\N	t	2026-07-16 15:10:28.492	2026-07-19 14:16:24.051	t
8d43d85d-1b7b-4201-bf64-e7ca742c16f7	ce22f643-10a3-48bf-97ec-c4d322ef4105	100ml	DHB-0204-100ML	12000	\N	t	2026-07-16 15:10:31.364	2026-07-19 14:16:28.4	t
cb2d28d3-8839-41ec-81ec-77856626bbd1	cebfe037-5ac4-4b4f-bafa-18734995b3ca	100ml	DHB-0205-100ML	12000	\N	t	2026-07-16 15:10:35.01	2026-07-19 14:16:32.407	t
b9d48de6-6100-4bf9-8d94-3fa4141a0b7e	c35771e0-e11f-4dbd-b762-c5488c8e503e	100ml	DHB-0206-100ML	12000	\N	t	2026-07-16 15:10:38.091	2026-07-19 14:16:36.538	t
48c4da7a-a8e6-43b7-81fd-bf933ebaa643	a8fc89dd-4102-431f-8339-9e65b9d27074	100ml	DHB-0207-100ML	12000	\N	t	2026-07-16 15:10:40.573	2026-07-19 14:16:40.581	t
3f0dad2a-0675-49db-b441-0c769294879b	e6b0d9f7-4026-4c28-8916-df4a5c8fdc26	100ml	DHB-0208-100ML	12000	\N	t	2026-07-16 15:10:43.12	2026-07-19 14:16:44.776	t
713db5fb-2da4-4119-b694-1f982d29fbeb	de83ece8-c147-480d-b414-ee6dfa9c77f4	100ml	DHB-0209-100ML	12000	\N	t	2026-07-16 15:10:45.955	2026-07-19 14:16:48.983	t
eac2dd74-0d3b-464a-a8c6-95f5aa3b9e72	82e672a8-9569-4510-b45d-4e4d5a6a0872	100ml	DHB-0210-100ML	12000	\N	t	2026-07-16 15:10:48.707	2026-07-19 14:16:55.101	t
7836595b-7827-4471-a821-a50d09822576	42b49c6a-f7d8-45bd-98dd-0f5ba1ebac25	100ml	DHB-0211-100ML	12000	\N	t	2026-07-16 15:10:51.758	2026-07-19 14:16:59.961	t
afeacf1d-70af-4de8-8831-685b187309c4	09b097c8-8987-49af-99cf-f8fcbf184a92	100ml	DHB-0212-100ML	12000	\N	t	2026-07-16 15:10:54.621	2026-07-19 14:17:03.719	t
bee33c60-11b9-4cf5-856c-48ad94a4b6b6	0441d386-bf83-46d6-850b-bc8c5ce4a7d0	100ml	DHB-0213-100ML	12000	\N	t	2026-07-16 15:10:57.812	2026-07-19 14:17:07.716	t
a20d5f60-5702-4ec3-b003-2c0edd93565e	1080ddd7-489b-4716-9004-190708d9493e	100ml	DHB-0214-100ML	12000	\N	t	2026-07-16 15:11:01.182	2026-07-19 14:17:12.219	t
8449e969-0268-4690-8da4-a0f59d1127d0	efc1a8bb-203a-4dc6-8ddc-5de529b07d7e	100ml	DHB-0215-100ML	12000	\N	t	2026-07-16 15:11:04.105	2026-07-19 14:17:16.315	t
88b56b88-ecb0-41df-a079-30a948a87297	08332624-be68-4d6f-b34d-9af66ff3bb6f	100ml	DHB-0216-100ML	12000	\N	t	2026-07-16 15:11:07.541	2026-07-19 14:17:20.528	t
022d0db9-e26f-48fc-9171-03b268586e10	b1ee6554-205e-4306-bf77-cae0c6d30752	100ml	DHB-0217-100ML	12000	\N	t	2026-07-16 15:11:10.515	2026-07-19 14:17:26.558	t
0c809158-b795-432d-a67b-f996c71f901f	d919cac4-3d0e-46d3-abfd-39405ff00d2e	100ml	DHB-0218-100ML	12000	\N	t	2026-07-16 15:11:13.153	2026-07-19 14:17:31.485	t
c0b8053d-8012-48d8-ae3e-9c4a4c541a90	21fea75f-8b80-48c9-8a52-f3b835a33dc0	100ml	DHB-0219-100ML	12000	\N	t	2026-07-16 15:11:15.792	2026-07-19 14:17:35.046	t
d85b9fd4-d096-4823-b533-f2e7e70fd382	b2321149-dcf9-40ef-83c7-b80d6ed56162	100ml	DHB-0220-100ML	12000	\N	t	2026-07-16 15:11:18.883	2026-07-19 14:17:39.025	t
1fa0ebc0-d54f-4ca0-9f74-140d08005773	8cbc5b78-6a80-4248-a218-28ef9f032a83	100ml	DHB-0221-100ML	12000	\N	t	2026-07-16 15:11:21.655	2026-07-19 14:17:43.042	t
b00ef592-9b85-42c6-b045-3f5a5a75186b	8fb5c757-d7cf-4a44-8707-24c27f54263b	100ml	DHB-0222-100ML	12000	\N	t	2026-07-16 15:11:24.787	2026-07-19 14:17:47.803	t
30dd4dbe-3d92-4e17-9cb1-edb711a01667	e182e4b2-4fcb-4706-a454-4fc4774dabfc	100ml	DHB-0223-100ML	12000	\N	t	2026-07-16 15:11:28.284	2026-07-19 14:17:56.634	t
ee841e25-375d-4822-b5ee-c6e4be950623	3b7f7d83-9e8d-4e86-941d-48ebd74ce50d	100ml	DHB-0224-100ML	12000	\N	t	2026-07-16 15:11:30.952	2026-07-19 14:18:01.969	t
21d8eddf-5dd0-48ed-8cb6-afcfe437af57	43494570-705a-4197-9dd7-fff7505dd335	100ml	DHB-0225-100ML	12000	\N	t	2026-07-16 15:11:33.643	2026-07-19 14:18:07.224	t
93b43709-6975-44d4-987a-e084cde0d539	2b8a4d23-039b-4e32-a1e6-f8e28728733c	100ml	DHB-0226-100ML	12000	\N	t	2026-07-16 15:11:36.49	2026-07-19 14:18:11.136	t
f2ddd0a1-02b3-4581-85ce-01e5775e32ec	90538320-a765-48ba-b11e-39517b851ff8	100ml	DHB-0227-100ML	12000	\N	t	2026-07-16 15:11:39.068	2026-07-19 14:18:14.548	t
952aae56-630e-499d-84f7-f03126430815	af8899cf-4ee6-4101-a640-3cd0f0c61870	100ml	DHB-0228-100ML	12000	\N	t	2026-07-16 15:11:42.336	2026-07-19 14:18:18.389	t
924661d7-672b-4ace-bd25-481134d07ee2	757f5ca5-6987-439d-adf7-d2c7404911e9	100ml	DHB-0229-100ML	12000	\N	t	2026-07-16 15:11:45.161	2026-07-19 14:18:23.045	t
451d633f-5d44-4ed3-90b1-27dd20bfccf7	ff1a0c73-a68a-45f1-bc58-542660d04108	100ml	DHB-0230-100ML	12000	\N	t	2026-07-16 15:11:48.069	2026-07-19 14:18:26.942	t
af83de59-0765-4862-b888-c65683060b21	b8f49443-825f-402d-8a87-98df3f13322d	100ml	DHB-0231-100ML	12000	\N	t	2026-07-16 15:11:51.244	2026-07-19 14:18:30.758	t
f6d25fdd-af30-4451-a2b4-52ecdf9d21f1	27028cb6-61cc-4664-9d15-c39bef00eced	100ml	DHB-0232-100ML	12000	\N	t	2026-07-16 15:11:54.324	2026-07-19 14:18:34.427	t
4a6c9bd7-7904-4a19-a571-b99303087300	9ab9be03-ca2d-49c0-9e18-a16f15f96d35	100ml	DHB-0233-100ML	12000	\N	t	2026-07-16 15:11:57.602	2026-07-19 14:18:37.823	t
9389349c-3da0-46fa-8e3d-5fb72b6073f5	6bdbb989-d52c-46ae-9fb6-a7ace9089b6d	100ml	DHB-0234-100ML	12000	\N	t	2026-07-16 15:12:00.718	2026-07-19 14:18:42.034	t
d51a6045-cd2b-403e-ab48-c56c2dce95cf	ae7bca18-fd4d-4ec3-bb28-3b2734da687b	100ml	DHB-0235-100ML	12000	\N	t	2026-07-16 15:12:04.069	2026-07-19 14:18:45.82	t
38a1b159-a3bf-42f7-bc48-a7ee62dfa892	35c2337d-e95e-4ae1-a3f2-1665b4976aea	50ml	DHB-0419-50ML	8000	\N	t	2026-07-16 15:22:14.004	2026-07-19 14:30:20.81	t
835c279d-954d-40e9-baf9-d51e258d7ced	798238eb-5828-4dc2-ab17-9d1cfa155707	100ml	DHB-0439-100ML	12000	\N	t	2026-07-16 15:23:13.25	2026-07-19 14:31:27.682	t
cab8af06-793d-4f39-aba2-b6381dfa362e	e3c7168b-1c5b-403d-a279-4230f2ccdb83	100ml	DHB-0470-100ML	12000	\N	t	2026-07-16 15:24:49.401	2026-07-19 14:33:26.796	t
641896c2-931a-4c62-b0bf-b3112bb3064d	e3c7168b-1c5b-403d-a279-4230f2ccdb83	200ml	DHB-0470-200ML	20000	\N	t	2026-07-16 15:24:49.67	2026-07-19 14:33:27.118	t
c551fc13-3876-4e86-b576-753cbc91e96b	9c969ede-7504-409f-a07a-61f8c2bf1ace	100ml	DHB-0013-100ML	12000	\N	t	2026-07-16 15:01:05.566	2026-07-19 14:02:38.906	t
a0e01b15-a1ab-4370-a6dc-d61a7b2eb994	86df4db3-9546-458e-812d-987ad735f122	100ml	DHB-0014-100ML	12000	\N	t	2026-07-16 15:01:09.113	2026-07-19 14:02:43.634	t
01f8ebe8-eba5-48f7-87c8-ffa75d06ff59	ba3c5310-aef4-4e3e-a66d-4beca03968d7	100ml	DHB-0015-100ML	12000	\N	t	2026-07-16 15:01:13.038	2026-07-19 14:02:47.86	t
2b06f213-3b46-48d6-bdb7-f9dcc085050f	eb8df122-2c9a-4f22-b82a-0db35ef110be	100ml	DHB-0016-100ML	12000	\N	t	2026-07-16 15:01:16.061	2026-07-19 14:02:52.851	t
69c1500f-8ea7-48f7-9994-76e6c25816e5	3a2405e4-1dd2-409e-a24f-49ba13b0b0e6	100ml	DHB-0017-100ML	12000	\N	t	2026-07-16 15:01:19.237	2026-07-19 14:02:57.219	t
1c5bd59c-d150-426f-bac7-53ab0a9a473c	d578595b-6705-491f-ba0d-31b5f82f2872	100ml	DHB-0018-100ML	12000	\N	t	2026-07-16 15:01:22.217	2026-07-19 14:03:00.847	t
9af86a69-507b-4a9b-bdc4-095b3d379beb	e3b4b7f4-c601-4482-8935-319780b2b08a	100ml	DHB-0019-100ML	12000	\N	t	2026-07-16 15:01:25.299	2026-07-19 14:03:04.423	t
2312a880-c8e6-4c80-9f40-3a3ff2eb86fa	23d36c92-f6d1-424b-a130-eff65b3470a5	100ml	DHB-0020-100ML	12000	\N	t	2026-07-16 15:01:28.535	2026-07-19 14:03:08.488	t
117a79d4-6262-4a60-a4b8-0e62dbdbf900	a8a9664b-20ea-4c42-a1ab-4a428fc294b4	100ml	DHB-0021-100ML	12000	\N	t	2026-07-16 15:01:31.534	2026-07-19 14:03:12.22	t
93fcedc7-45f5-4a4c-be28-353ac665ae0a	067b8a8b-6ed6-4401-b45c-351cad2d7ddb	100ml	DHB-0022-100ML	12000	\N	t	2026-07-16 15:01:34.555	2026-07-19 14:03:15.643	t
3b859afe-3997-4145-b1ad-5f476140dea8	044315ac-09de-4042-bab6-b234ed0f310c	100ml	DHB-0023-100ML	12000	\N	t	2026-07-16 15:01:37.54	2026-07-19 14:03:19.271	t
b373da41-f6b4-48ec-81e1-66da5f2f0612	280fb2cf-d23f-49bb-a9ec-606c342c0599	100ml	DHB-0024-100ML	12000	\N	t	2026-07-16 15:01:40.52	2026-07-19 14:03:22.932	t
893e6a6c-2f15-400a-adf3-694610dc9732	c4172c9e-75b5-4946-8832-deea55117532	100ml	DHB-0025-100ML	12000	\N	t	2026-07-16 15:01:43.531	2026-07-19 14:03:26.49	t
d10e328b-51e1-4251-9fe6-48148ce01621	4392706b-317c-4bac-867a-39b77e001b11	100ml	DHB-0341-100ML	12000	\N	t	2026-07-16 15:17:34.366	2026-07-19 14:25:48.238	t
d94c30cf-7eb6-40b0-b1d0-c72a2ad19391	fce5624c-1c57-45d1-ac5d-2bb5d3b840b0	100ml	DHB-0342-100ML	12000	\N	t	2026-07-16 15:17:39.794	2026-07-19 14:25:52.922	t
b38d4c39-9648-4e34-9103-62cdcb3b6a89	945bbd94-7fe1-4bfb-87c7-11c873ee3af7	200ml	DHB-0082-200ML	20000	\N	t	2026-07-16 15:04:38.282	2026-07-19 14:07:44.008	t
02a74dd3-4fe4-47de-86b6-6b6cbf39dcba	6b95192d-3e8d-4c94-8b61-f61c421275be	200ml	DHB-0155-200ML	20000	\N	t	2026-07-16 15:08:11.763	2026-07-19 14:12:34	t
9a11af88-7e1d-4ebb-af90-5e0a2dfb754f	3d140776-c6a6-46c0-9874-981ed5dd1b1b	200ml	DHB-0172-200ML	20000	\N	t	2026-07-16 15:09:02.12	2026-07-19 14:13:41.383	t
e1ff7fe7-8ad0-4e73-8b87-f1f2409b9618	90538320-a765-48ba-b11e-39517b851ff8	200ml	DHB-0227-200ML	20000	\N	t	2026-07-16 15:11:39.482	2026-07-19 14:18:14.891	t
8fff5238-e0db-47ea-ab8f-e5cefe3bd19b	e60a4b7d-e652-4115-9310-04dae4a2f227	100ml	DHB-0236-100ML	12000	\N	t	2026-07-16 15:12:07.009	2026-07-19 14:18:50.877	t
78c73c14-92b0-4f20-83b3-7b742d216c07	a1f0ff8c-81d4-48bf-b7c2-bc297b29bab8	100ml	DHB-0237-100ML	12000	\N	t	2026-07-16 15:12:10.294	2026-07-19 14:18:54.951	t
a01a64a9-3524-4104-80d6-2476a0c5cc16	d851ea0e-5b15-48d4-8d3c-c07e0836a988	100ml	DHB-0238-100ML	12000	\N	t	2026-07-16 15:12:13.226	2026-07-19 14:18:58.932	t
4273b05b-d14f-4ddb-b727-21be84f2d588	0e34cefc-9cc3-4e13-b25a-2a1b01bbd4c2	100ml	DHB-0239-100ML	12000	\N	t	2026-07-16 15:12:16.385	2026-07-19 14:19:02.526	t
d77fca50-c0fc-4115-bdb9-fc5a93aa138b	ea726d02-55d5-4257-885f-7cfafa201f43	100ml	DHB-0240-100ML	12000	\N	t	2026-07-16 15:12:19.708	2026-07-19 14:19:06.188	t
fee0729f-6f2d-4d4b-9621-5c9dc83de7c3	2a20229e-a62d-4427-9950-3e1846971720	100ml	DHB-0241-100ML	12000	\N	t	2026-07-16 15:12:22.729	2026-07-19 14:19:10.284	t
c4051416-aaaf-43cd-88fe-df54dbba750c	00f161f6-53e4-4191-85b2-81e573898f95	100ml	DHB-0242-100ML	12000	\N	t	2026-07-16 15:12:25.435	2026-07-19 14:19:13.93	t
3be436b7-242f-45c1-931e-90c0fdfce3f2	71cb70a1-52af-43b0-b06b-5a51225a84a6	100ml	DHB-0243-100ML	12000	\N	t	2026-07-16 15:12:28.637	2026-07-19 14:19:18.071	t
3abf3de0-7fff-4725-8fda-304f6468a5b7	cd839cb5-2ab8-4312-9208-7949f79474c4	100ml	DHB-0245-100ML	12000	\N	t	2026-07-16 15:12:34.72	2026-07-19 14:19:26.266	t
b39c53c5-91c8-4bfd-9ee9-50b1670e1709	944dfaa0-f4f3-4dd8-9ed0-bd48dc76424f	100ml	DHB-0246-100ML	12000	\N	t	2026-07-16 15:12:37.87	2026-07-19 14:19:30.293	t
b0fe8f1d-0419-44b2-9503-c1faa8e41d3a	3ff9c784-ccd9-4adb-a793-a8cee2e525c3	100ml	DHB-0247-100ML	12000	\N	t	2026-07-16 15:12:40.44	2026-07-19 14:19:33.938	t
2d442dce-0aad-45b5-b26f-ed69d4cdf897	1a6602ed-b11a-488e-a848-8f621dd1e5e8	100ml	DHB-0248-100ML	12000	\N	t	2026-07-16 15:12:43.573	2026-07-19 14:19:38.546	t
99a7b2e6-13f8-4371-9f17-64728c5e58d2	f4ae23f0-da72-4b5e-80d2-eac5adff8d2d	100ml	DHB-0249-100ML	12000	\N	t	2026-07-16 15:12:46.437	2026-07-19 14:19:42.457	t
06d7efeb-320c-4948-b08b-71dcb7e596dc	48102744-674a-4139-9202-b5309f6408d6	100ml	DHB-0250-100ML	12000	\N	t	2026-07-16 15:12:49.158	2026-07-19 14:19:46.729	t
49d5485e-bd72-419c-8808-7b8f0f04ca8b	0a8afc61-f4f1-4199-9fca-50acb7fd6901	100ml	DHB-0251-100ML	12000	\N	t	2026-07-16 15:12:52.1	2026-07-19 14:19:50.859	t
54ac1636-ef17-4d9a-929d-463a76e9d6e0	ebf46448-a544-4310-be0d-422ef7a4cb8e	100ml	DHB-0252-100ML	12000	\N	t	2026-07-16 15:12:55.009	2026-07-19 14:19:54.524	t
ed5fb4e3-9267-4990-9de6-3e8693b77881	57b46ceb-25cc-4199-8012-5bc765717a84	100ml	DHB-0253-100ML	12000	\N	t	2026-07-16 15:12:57.817	2026-07-19 14:19:58.518	t
35eb20a7-5cb3-4e43-a16d-a50fd10d9ddd	6d13868d-2e0f-41f9-a25a-6ca609740b50	100ml	DHB-0254-100ML	12000	\N	t	2026-07-16 15:13:00.736	2026-07-19 14:20:02.202	t
4f9efc14-7f91-4103-b13a-6d7924c98c00	d6219858-a813-4275-83fd-e0dc53e505b1	200ml	DHB-0308-200ML	20000	\N	t	2026-07-16 15:15:42.252	2026-07-19 14:23:33.255	t
0adc2e0b-2e39-4160-88a8-8fd2a8a3f7ce	59b41a3b-fd13-4878-80c5-08012a9446eb	200ml	DHB-0322-200ML	20000	\N	t	2026-07-16 15:16:29.961	2026-07-19 14:24:29.361	t
0666ad4c-6c8d-4128-a2a7-5d122d6abae0	1cf242f8-2aed-4992-8e8f-d010156c0a0f	200ml	DHB-0325-200ML	20000	\N	t	2026-07-16 15:16:39.669	2026-07-19 14:24:41.036	t
cd693271-f6d0-49bf-a0f9-348cc9e093ae	26084fee-3ad3-4da4-a968-ea106c688060	200ml	DHB-0452-200ML	20000	\N	t	2026-07-16 15:23:52.081	2026-07-19 14:32:17.669	t
4ca1b036-90b7-490a-be0d-be9ce5fd169a	86bc3716-45d2-4d17-abd1-870bf8ba319e	200ml	DHB-0453-200ML	20000	\N	t	2026-07-16 15:23:55.129	2026-07-19 14:32:21.848	t
567f0ed1-f4a8-40a0-b3d8-a3a02a6bbe80	1955b6cf-5a80-4942-9158-f6fa057edb21	200ml	DHB-0454-200ML	20000	\N	t	2026-07-16 15:23:58.125	2026-07-19 14:32:25.944	t
62aa8b51-7b46-4cc7-abd6-4bd7c9349c00	0cc2d0a1-fc44-49fe-a751-4ed9acbf843f	200ml	DHB-0469-200ML	20000	\N	t	2026-07-16 15:24:46.85	2026-07-19 14:33:23.54	t
94edac61-f5c5-4390-8c62-2cde4d4899b8	59110147-0dd3-4c94-b06c-f80a08d09dc2	100ml	DHB-0256-100ML	12000	\N	t	2026-07-16 15:13:06.113	2026-07-19 14:20:09.248	t
3d17fcc6-e72e-4a5a-996c-29a13b7bcb84	8c4c41bf-b35f-464b-be5f-11e7ebe18569	100ml	DHB-0257-100ML	12000	\N	t	2026-07-16 15:13:08.811	2026-07-19 14:20:12.911	t
acb480a2-b8c3-4df4-be93-c8346c01ae35	cb400a40-b9b3-49b4-a1d5-90cd684a69d2	100ml	DHB-0258-100ML	12000	\N	t	2026-07-16 15:13:11.479	2026-07-19 14:20:16.318	t
b4e02321-e006-4558-babe-6aa42fd5af94	2e09f8a6-623b-4612-a9f4-4c1fc8b85d1a	100ml	DHB-0259-100ML	12000	\N	t	2026-07-16 15:13:14.641	2026-07-19 14:20:20.103	t
150b7f8d-9577-4bc2-b718-e6b072a7b4b6	b0bc5542-772e-4673-9b0b-08a1ff1cd72d	100ml	DHB-0260-100ML	12000	\N	t	2026-07-16 15:13:17.673	2026-07-19 14:20:24.522	t
ef74dab8-535d-4028-9be6-a4f004165208	85d4e3e0-0d70-40f0-9136-a796dedee9e6	100ml	DHB-0261-100ML	12000	\N	t	2026-07-16 15:13:20.609	2026-07-19 14:20:28.413	t
f0d0305e-37dd-44dd-ac10-989520baaa62	022a4e77-f3c0-4504-9d5a-e2e12d178fb7	100ml	DHB-0262-100ML	12000	\N	t	2026-07-16 15:13:23.377	2026-07-19 14:20:32.204	t
32e36d38-6915-49c2-8e38-3909230f9ec1	fbb2f6c1-a13d-42e9-8af9-3327159f0a8c	100ml	DHB-0263-100ML	12000	\N	t	2026-07-16 15:13:26.046	2026-07-19 14:20:35.682	t
5271da7b-9262-46a0-907a-e6eee4a3a77a	a275de9a-5f98-4ee6-8a04-415330eb7c9b	100ml	DHB-0264-100ML	12000	\N	t	2026-07-16 15:13:28.774	2026-07-19 14:20:39.888	t
9d80aff0-782d-4911-a3d1-74d155c26ffb	a91ae67a-695a-4cdc-a537-753e7469182d	100ml	DHB-0265-100ML	12000	\N	t	2026-07-16 15:13:31.397	2026-07-19 14:20:43.773	t
9dc10bc8-62e9-40c4-aca5-b9bee89567d3	8a55e6a6-c88d-4c6d-88e7-d4d07dca202b	100ml	DHB-0266-100ML	12000	\N	t	2026-07-16 15:13:34.214	2026-07-19 14:20:47.357	t
519b5001-4378-4306-9413-6f2118eed3f3	59a459d0-4195-4186-9b29-4a801aa14872	100ml	DHB-0267-100ML	12000	\N	t	2026-07-16 15:13:37.066	2026-07-19 14:20:51.265	t
30fecf44-6fa5-498b-bd36-c5bf2e2e0114	47a8028b-d94e-4f27-b0b7-56a2ae1e8bae	100ml	DHB-0268-100ML	12000	\N	t	2026-07-16 15:13:39.995	2026-07-19 14:20:55.242	t
d134d6b6-ea53-410e-94a4-7891a3fc7531	fc4e72d9-de13-42f3-a44a-529a89e1e2d4	100ml	DHB-0269-100ML	12000	\N	t	2026-07-16 15:13:43.045	2026-07-19 14:20:59.761	t
25a5d723-4103-490f-bb5f-3168ff4b2a5d	7333c793-92dc-4d5a-b91a-0b3dcd894eb2	100ml	DHB-0270-100ML	12000	\N	t	2026-07-16 15:13:46.475	2026-07-19 14:21:03.232	t
f6477c56-fa0c-444b-badf-204055bc5199	2d7e52f0-0a83-46fd-908e-3bad0d6f2ebd	100ml	DHB-0271-100ML	12000	\N	t	2026-07-16 15:13:49.678	2026-07-19 14:21:06.917	t
5791e849-5caa-41c6-adf7-9487f9f9947c	94daadee-0da8-419b-a232-88f91dfdefa5	100ml	DHB-0272-100ML	12000	\N	t	2026-07-16 15:13:53.33	2026-07-19 14:21:11.012	t
7ea5242d-9193-43af-b1c2-69a5283d99a8	7845df49-d2ec-4e83-8e71-ac3a4a210ffa	100ml	DHB-0273-100ML	12000	\N	t	2026-07-16 15:13:56.788	2026-07-19 14:21:15.073	t
38f3b36c-7b0a-49ab-87ab-950b3e7576cc	d2a0f31c-8663-49d1-9132-0c3005d100e9	100ml	DHB-0274-100ML	12000	\N	t	2026-07-16 15:13:59.677	2026-07-19 14:21:19.271	t
7e480035-3149-4a72-8917-6e9de345b6ff	30a7e534-d700-4613-b061-6e9085db3e96	100ml	DHB-0275-100ML	12000	\N	t	2026-07-16 15:14:03.029	2026-07-19 14:21:23.309	t
478f47b7-d390-4c07-b7c3-97181cfbc55a	5c508d38-7c4b-4b8f-aeb1-f9e125d225bd	100ml	DHB-0276-100ML	12000	\N	t	2026-07-16 15:14:05.799	2026-07-19 14:21:27.251	t
43720a87-5bfd-4f06-a188-bb52d77c3531	e2f40d3e-b803-4edb-bee2-6b8a89aafca9	100ml	DHB-0277-100ML	12000	\N	t	2026-07-16 15:14:08.747	2026-07-19 14:21:31.594	t
bd4c1ed5-4ce4-4059-ae6d-04f24584e591	12a3d9a1-c44e-4fdf-aaf8-4eec621794b8	100ml	DHB-0278-100ML	12000	\N	t	2026-07-16 15:14:11.635	2026-07-19 14:21:35.798	t
07fd94ae-9214-4c12-8439-2173204b4d0a	1b4f0479-08ff-4fb7-a48c-8d7d1a9319d7	100ml	DHB-0279-100ML	12000	\N	t	2026-07-16 15:14:14.403	2026-07-19 14:21:39.581	t
07113058-0692-41b0-8da5-dc3e3d878845	59dfaf31-6b17-4d0a-a15d-81cb250f40e4	100ml	DHB-0280-100ML	12000	\N	t	2026-07-16 15:14:17.476	2026-07-19 14:21:43.676	t
85a6c6f0-5f41-4454-b9a9-e46c77be777a	cb7b75da-eca0-4e78-bbfa-5a01bf0eb4fb	100ml	DHB-0281-100ML	12000	\N	t	2026-07-16 15:14:20.486	2026-07-19 14:21:47.543	t
0a1c2c88-265c-4bd3-b392-297642bcb830	0a6ef255-7fab-4a0b-b69a-3a95b77894b6	100ml	DHB-0282-100ML	12000	\N	t	2026-07-16 15:14:23.621	2026-07-19 14:21:51.49	t
d2fd8835-c9d8-41a4-a7d2-665fed0817fb	ffa99d71-5c66-485b-962e-60b1383fd7a6	100ml	DHB-0283-100ML	12000	\N	t	2026-07-16 15:14:26.801	2026-07-19 14:21:55.272	t
fffa46ba-5ab5-40b3-9f0e-086d37b380a7	cc317f86-9b40-436e-92ef-0f0eab00699a	100ml	DHB-0284-100ML	12000	\N	t	2026-07-16 15:14:29.56	2026-07-19 14:21:59.459	t
a21a0d78-c567-45bd-9313-1b5420ce5c1f	31cc7a30-cd6a-4095-9662-2e562b960e4f	100ml	DHB-0285-100ML	12000	\N	t	2026-07-16 15:14:32.8	2026-07-19 14:22:03.369	t
28d714fb-a26e-4bf9-8189-e0f9f2ca19f8	7eb16ed2-8737-4b3a-8e55-76aa65f55ea6	100ml	DHB-0286-100ML	12000	\N	t	2026-07-16 15:14:35.598	2026-07-19 14:22:07.84	t
0b6ba37e-9b9c-4a69-ad36-9bc146aaf33a	1c13ab6e-6ce7-4c70-bd84-9f8bf4373d75	100ml	DHB-0287-100ML	12000	\N	t	2026-07-16 15:14:38.277	2026-07-19 14:22:11.836	t
8e04430c-090c-4a6a-a0cc-44ef0caa128e	654b5cd7-b1d8-478e-8930-7b1e302fd1ad	100ml	DHB-0288-100ML	12000	\N	t	2026-07-16 15:14:41.317	2026-07-19 14:22:16.137	t
5277fbe0-662c-43b0-8c0f-0354b61c26c0	62caf1c8-0aed-4178-8905-e2973a1d16ce	100ml	DHB-0290-100ML	12000	\N	t	2026-07-16 15:14:47.672	2026-07-19 14:22:23.524	t
667f3712-d101-4149-b6e4-5962cbe01c37	5fdd1f1f-324f-4fee-9186-fd01bab67c16	100ml	DHB-0291-100ML	12000	\N	t	2026-07-16 15:14:50.457	2026-07-19 14:22:26.954	t
51b79ff1-25eb-4907-896e-2248fd54e443	b6891f3b-5f33-4b05-8ae5-e5d8deea26a9	100ml	DHB-0292-100ML	12000	\N	t	2026-07-16 15:14:53.327	2026-07-19 14:22:30.842	t
fb2060fa-1dbf-4188-a251-73b07e39c96e	d36eded5-b156-431d-b081-6542eb328e72	100ml	DHB-0294-100ML	12000	\N	t	2026-07-16 15:14:59.685	2026-07-19 14:22:38.667	t
257e0309-dcda-4d3f-855b-9cf65a6f28b7	c5932bdc-6417-41a4-a3ff-1f50c74710a6	100ml	DHB-0295-100ML	12000	\N	t	2026-07-16 15:15:02.538	2026-07-19 14:22:42.455	t
b193f273-2cf8-481b-a110-9618a7e7037e	afb5363d-7f58-4914-8c91-3273be4edf73	100ml	DHB-0296-100ML	12000	\N	t	2026-07-16 15:15:05.408	2026-07-19 14:22:46.038	t
f80528ae-43c9-4827-b2ae-09d3c19a3d5c	4f5a298c-8b10-4cd4-8fbc-e97640007ee2	100ml	DHB-0297-100ML	12000	\N	t	2026-07-16 15:15:08.37	2026-07-19 14:22:49.992	t
01a57a9d-a7e5-4cca-b22b-4910d6af90c9	9a7be05b-90aa-4416-a136-864793f53174	100ml	DHB-0298-100ML	12000	\N	t	2026-07-16 15:15:11.25	2026-07-19 14:22:53.823	t
05848e15-35c8-43fd-a6b8-6fa959ba7759	f6d65d00-7f47-4b55-8590-fdab9ce175aa	100ml	DHB-0299-100ML	12000	\N	t	2026-07-16 15:15:14.2	2026-07-19 14:22:58.02	t
125938f0-faca-44e2-b74e-f001e0521771	8b936488-54bb-4aef-aa2b-9d9fc982a6a1	100ml	DHB-0430-100ML	12000	\N	t	2026-07-16 15:22:47.586	2026-07-19 14:30:54.277	t
f45b1a8e-a283-4015-8586-eb04cfe9bd65	d48b933b-b1c5-4a1b-8f3d-beff03f3751d	100ml	DHB-0436-100ML	12000	\N	t	2026-07-16 15:23:04.468	2026-07-19 14:31:16.315	t
3746f744-2764-4006-a67f-2408f4035239	7c24a04a-ebf6-46dd-9901-b990b1256737	100ml	DHB-0438-100ML	12000	\N	t	2026-07-16 15:23:10.341	2026-07-19 14:31:23.788	t
c5e11dd1-b990-4642-aee6-dc8757dee85e	eadd89e8-76eb-4100-8697-129659c9d61f	100ml	DHB-0440-100ML	12000	\N	t	2026-07-16 15:23:15.76	2026-07-19 14:31:31.466	t
6e4b725e-b4b8-41ed-b300-9fc357d160a0	f11894e2-357c-4128-89c8-2ac34c71feb6	100ml	DHB-0442-100ML	12000	\N	t	2026-07-16 15:23:20.98	2026-07-19 14:31:39.147	t
2c542e01-cd78-4199-bd3f-1c6b4688e5af	ba3c5310-aef4-4e3e-a66d-4beca03968d7	200ml	DHB-0015-200ML	20000	\N	t	2026-07-16 15:01:13.322	2026-07-19 14:02:48.19	t
ba90adb4-d2c0-4cba-a856-279c82eae4e8	eb8df122-2c9a-4f22-b82a-0db35ef110be	200ml	DHB-0016-200ML	20000	\N	t	2026-07-16 15:01:16.342	2026-07-19 14:02:53.328	t
611e7b1b-2f9b-4559-832e-679a667fc9a4	3a2405e4-1dd2-409e-a24f-49ba13b0b0e6	200ml	DHB-0017-200ML	20000	\N	t	2026-07-16 15:01:19.508	2026-07-19 14:02:57.481	t
1f686761-56a9-4d90-a583-fbe4688dedd8	d578595b-6705-491f-ba0d-31b5f82f2872	200ml	DHB-0018-200ML	20000	\N	t	2026-07-16 15:01:22.5	2026-07-19 14:03:01.11	t
c40c1e5f-943f-4aa0-ae35-55da667fbab6	e3b4b7f4-c601-4482-8935-319780b2b08a	200ml	DHB-0019-200ML	20000	\N	t	2026-07-16 15:01:25.567	2026-07-19 14:03:04.731	t
021926c7-2e54-41ae-9f3c-7e52a10c289e	23d36c92-f6d1-424b-a130-eff65b3470a5	200ml	DHB-0020-200ML	20000	\N	t	2026-07-16 15:01:28.814	2026-07-19 14:03:08.802	t
7c24d37b-e988-4f6e-8e63-0591befdb890	a8a9664b-20ea-4c42-a1ab-4a428fc294b4	200ml	DHB-0021-200ML	20000	\N	t	2026-07-16 15:01:31.829	2026-07-19 14:03:12.516	t
baf5ad9e-093b-4ba7-8646-11f43f3bf635	067b8a8b-6ed6-4401-b45c-351cad2d7ddb	200ml	DHB-0022-200ML	20000	\N	t	2026-07-16 15:01:34.843	2026-07-19 14:03:15.912	t
8235cc63-c071-411a-9e34-a0fc3cf3c434	044315ac-09de-4042-bab6-b234ed0f310c	200ml	DHB-0023-200ML	20000	\N	t	2026-07-16 15:01:37.808	2026-07-19 14:03:19.545	t
80e93b44-61ef-485c-bbc6-af60fb672d0e	280fb2cf-d23f-49bb-a9ec-606c342c0599	200ml	DHB-0024-200ML	20000	\N	t	2026-07-16 15:01:40.806	2026-07-19 14:03:23.267	t
d7747cb3-3d06-4cad-a7dd-de0fa154966b	c4172c9e-75b5-4946-8832-deea55117532	200ml	DHB-0025-200ML	20000	\N	t	2026-07-16 15:01:43.802	2026-07-19 14:03:26.853	t
05d3e940-2cb2-4ef0-acfa-950448654abb	a3995d5e-7d74-4485-878e-7cc51d1090bf	200ml	DHB-0026-200ML	20000	\N	t	2026-07-16 15:01:46.845	2026-07-19 14:03:30.399	t
1eb451c7-5e4a-4780-b84a-872e3824ba35	055fa60c-9764-45b3-8d78-2737f584df4d	200ml	DHB-0027-200ML	20000	\N	t	2026-07-16 15:01:49.567	2026-07-19 14:03:34.034	t
b1c57d9a-ea1f-498d-9706-3ee610f832fe	4621d0cd-1f1f-4401-8682-ce3d8eca0422	200ml	DHB-0028-200ML	20000	\N	t	2026-07-16 15:01:52.148	2026-07-19 14:03:38.012	t
2bc4768d-6041-4602-a30b-e7ad057249be	36b5c8eb-cbbd-498b-8565-a70a5f0a525f	200ml	DHB-0029-200ML	20000	\N	t	2026-07-16 15:01:55.106	2026-07-19 14:03:42.015	t
f31118b6-14fe-451d-a416-47bc44217160	67e8a831-9640-4800-9594-271fd03cf74c	200ml	DHB-0030-200ML	20000	\N	t	2026-07-16 15:02:00.165	2026-07-19 14:03:46.307	t
fc2a4e3e-8a16-4148-982c-0e9e1c86b926	ba8a5af6-892c-4fc3-99db-d04e3e3fc452	200ml	DHB-0036-200ML	20000	\N	t	2026-07-16 15:02:19.731	2026-07-19 14:04:08.986	t
caf2cf52-7972-40e7-960a-3c2acd61ba72	397115ec-f4e5-4414-839b-67d8aaf0d3be	200ml	DHB-0037-200ML	20000	\N	t	2026-07-16 15:02:23.847	2026-07-19 14:04:12.957	t
394025fd-9957-466c-9dff-9e1505f05d76	3efc65e3-0315-47e4-aaa4-f3979b8d3a7b	200ml	DHB-0038-200ML	20000	\N	t	2026-07-16 15:02:28.233	2026-07-19 14:04:16.881	t
e307d89d-2d79-4750-bdfa-fb3db9626539	81de114f-b777-47a6-bcf5-e330ca90337b	200ml	DHB-0039-200ML	20000	\N	t	2026-07-16 15:02:32.772	2026-07-19 14:04:20.626	t
403cb9b4-38b8-40e6-b859-05cc67762993	035a49c9-3768-457d-aff4-9e2b206026d2	200ml	DHB-0040-200ML	20000	\N	t	2026-07-16 15:02:35.878	2026-07-19 14:04:24.619	t
3d003ea9-795d-43e4-a2d8-c2e3e9f992aa	4bb8b556-298d-4ca8-ae89-102b6665d712	200ml	DHB-0041-200ML	20000	\N	t	2026-07-16 15:02:38.687	2026-07-19 14:04:28.297	t
fb08a9dd-f674-4ca2-a81e-6c177d301c39	88b9c3ea-f9aa-44a8-aa88-1d2dfa87051c	200ml	DHB-0042-200ML	20000	\N	t	2026-07-16 15:02:41.731	2026-07-19 14:04:32.391	t
93bf728f-567c-4f81-bcbb-cb215c813c5c	38976821-8d3a-45f6-9ead-9da7672e60ff	200ml	DHB-0043-200ML	20000	\N	t	2026-07-16 15:02:44.926	2026-07-19 14:04:36.192	t
efd80c9e-6bfe-46c1-a636-3e70424c2775	e850daba-9bef-4315-a514-27cb52d08d12	200ml	DHB-0044-200ML	20000	\N	t	2026-07-16 15:02:48.03	2026-07-19 14:04:40.181	t
1b31a4fa-5817-44dd-9dee-e0144af8a1d9	723e5cc1-fc70-499a-9dd3-6a3b6656e95c	200ml	DHB-0045-200ML	20000	\N	t	2026-07-16 15:02:51.008	2026-07-19 14:04:43.462	t
318acec4-d8a3-4d46-ba83-4d53dc9a776f	44ea09e5-6635-4b8c-bb71-e8c3170a869b	200ml	DHB-0046-200ML	20000	\N	t	2026-07-16 15:02:54.042	2026-07-19 14:04:47.407	t
58f8aac4-069a-4a15-9fde-926ae176583a	c7b5b7e5-cdd5-45e5-bb69-63cfefed4251	200ml	DHB-0047-200ML	20000	\N	t	2026-07-16 15:02:56.688	2026-07-19 14:04:50.739	t
ecd17031-1dc1-4593-9b67-0db2efad8d92	4f50b3a7-eb39-4495-8a2c-9d0ef9131f00	200ml	DHB-0048-200ML	20000	\N	t	2026-07-16 15:02:59.733	2026-07-19 14:04:54.59	t
ec40d00f-ac21-409c-9bd9-18e8605d16bb	8a1a3ee2-53d8-4d82-bdfa-8536f274a554	100ml	DHB-0300-100ML	12000	\N	t	2026-07-16 15:15:17.592	2026-07-19 14:23:02.013	t
626f9b45-1c2a-4bdd-82e6-19038ba9b01b	99c569c0-af20-41ab-9b5a-6274d66d1523	100ml	DHB-0301-100ML	12000	\N	t	2026-07-16 15:15:20.453	2026-07-19 14:23:05.951	t
e254409e-b0a1-43a2-9616-d8eaeee0e60e	4edadee5-1848-452a-9dec-461df9ed5d93	100ml	DHB-0302-100ML	12000	\N	t	2026-07-16 15:15:23.475	2026-07-19 14:23:09.854	t
8fba351b-d82a-4966-b652-3fedecf9fdff	3ea1c578-aacf-41b2-96e9-42c5f6cba8a0	100ml	DHB-0303-100ML	12000	\N	t	2026-07-16 15:15:26.507	2026-07-19 14:23:13.79	t
e0e5ef4d-fbf5-45f1-8d28-cfcd9622bffe	f45e847d-b184-445a-bdfe-b4727456655a	100ml	DHB-0305-100ML	12000	\N	t	2026-07-16 15:15:32.431	2026-07-19 14:23:21.574	t
c671269c-7afb-49f8-887b-a2b45a8682eb	27cb9ac7-885f-4658-8d5f-f6f16d855bb8	100ml	DHB-0306-100ML	12000	\N	t	2026-07-16 15:15:35.216	2026-07-19 14:23:24.962	t
0240197d-b3ee-4f9e-ba5e-b77f85c1e59c	6ac269ec-1522-4180-8e5d-47d1243fac64	100ml	DHB-0307-100ML	12000	\N	t	2026-07-16 15:15:39.11	2026-07-19 14:23:28.901	t
c2a4f671-97de-4daa-bcab-04d93b3391cd	d6219858-a813-4275-83fd-e0dc53e505b1	100ml	DHB-0308-100ML	12000	\N	t	2026-07-16 15:15:41.978	2026-07-19 14:23:32.951	t
e2b57ecc-e081-48bc-9a00-a085b019a04b	33b2e338-22d7-4c7e-983c-dad575a28c34	100ml	DHB-0309-100ML	12000	\N	t	2026-07-16 15:15:45.209	2026-07-19 14:23:37.239	t
adbe5703-4f87-4410-b9c2-a14f497b46a5	1cf242f8-2aed-4992-8e8f-d010156c0a0f	100ml	DHB-0325-100ML	12000	\N	t	2026-07-16 15:16:39.4	2026-07-19 14:24:40.728	t
10a6514c-f8a2-4597-acc1-e1ec646f8b94	ea1b54d1-f3ad-4de4-9d3d-2a14af415cad	100ml	DHB-0331-100ML	12000	\N	t	2026-07-16 15:16:57.512	2026-07-19 14:25:04.761	t
0baaea53-3155-475e-971f-c63f52469f11	4392706b-317c-4bac-867a-39b77e001b11	200ml	DHB-0341-200ML	20000	\N	t	2026-07-16 15:17:34.663	2026-07-19 14:25:48.549	t
df01f80b-5795-47f8-860e-76b22a15f8b8	fce5624c-1c57-45d1-ac5d-2bb5d3b840b0	200ml	DHB-0342-200ML	20000	\N	t	2026-07-16 15:17:40.056	2026-07-19 14:25:53.186	t
418b6ebd-6f7c-4fa2-8171-bf4f8fe09656	f7a40dcd-62dd-417a-b2a6-15f863f10f7f	200ml	DHB-0350-200ML	20000	\N	t	2026-07-16 15:18:06.32	2026-07-19 14:26:25.179	t
6ca407cc-7546-4d76-8517-ac676c76c259	740d30b9-8169-48b7-b8db-77db73c7f15b	200ml	DHB-0351-200ML	20000	\N	t	2026-07-16 15:18:09.465	2026-07-19 14:26:28.926	t
0911455b-d3d4-4479-bbb3-377aa087363c	26084fee-3ad3-4da4-a968-ea106c688060	100ml	DHB-0452-100ML	12000	\N	t	2026-07-16 15:23:51.811	2026-07-19 14:32:17.336	t
1f1d71cb-0ee6-430c-b17a-7c66635bfc8e	86bc3716-45d2-4d17-abd1-870bf8ba319e	100ml	DHB-0453-100ML	12000	\N	t	2026-07-16 15:23:54.821	2026-07-19 14:32:21.534	t
1185c7cf-5607-41fc-b1a8-91fcbcc89824	1955b6cf-5a80-4942-9158-f6fa057edb21	100ml	DHB-0454-100ML	12000	\N	t	2026-07-16 15:23:57.854	2026-07-19 14:32:25.63	t
26d2fa33-4372-4435-8e30-79142ecfbf7c	a74a511c-771a-4ced-ba3b-7b100ac108d2	200ml	DHB-0053-200ML	20000	\N	t	2026-07-16 15:03:14.228	2026-07-19 14:05:15.67	t
26213bd2-49a6-4508-8ec5-fabf8d202da4	ba802919-7fce-4546-a59b-14bd0460b0d0	200ml	DHB-0054-200ML	20000	\N	t	2026-07-16 15:03:16.941	2026-07-19 14:05:26.618	t
5a3cb746-b881-4558-925c-b31b3caaf8ae	2f20daca-1e33-43e9-bfce-5f462f9aad1f	200ml	DHB-0055-200ML	20000	\N	t	2026-07-16 15:03:19.891	2026-07-19 14:05:34.811	t
12f0dad0-be75-4955-a9ed-33f76eac3b47	ce4d51f0-433e-460a-a208-621c3e8f4b19	200ml	DHB-0056-200ML	20000	\N	t	2026-07-16 15:03:23.014	2026-07-19 14:05:42.279	t
7f316e1b-42ae-445c-980c-9bb892cf918d	d3b56ea8-5e1a-4d0f-9eeb-66a8f17d70f0	200ml	DHB-0057-200ML	20000	\N	t	2026-07-16 15:03:26.065	2026-07-19 14:05:51.318	t
e8d452be-50d6-42d5-8f41-e87daa137400	ab0fdb66-51a5-4cfd-b076-79828c0b717e	200ml	DHB-0058-200ML	20000	\N	t	2026-07-16 15:03:28.786	2026-07-19 14:05:57.57	t
83459576-753d-4234-a668-8702bcfcdca5	7dc66a03-4d0f-4276-869e-09b2c818f7e1	200ml	DHB-0059-200ML	20000	\N	t	2026-07-16 15:03:31.773	2026-07-19 14:06:05.295	t
8e82a5c9-4241-42c2-a5eb-25a761887796	153c7004-3501-4bee-866f-3af4678025f6	200ml	DHB-0060-200ML	20000	\N	t	2026-07-16 15:03:34.788	2026-07-19 14:06:13.284	t
05f97931-b37b-4332-9044-89da1a9723f6	d9093e0e-6e25-4196-b413-4a49b34b4bfe	200ml	DHB-0061-200ML	20000	\N	t	2026-07-16 15:03:37.935	2026-07-19 14:06:22.646	t
23dd72cf-f731-4a4e-98c0-b0203eda9d1b	196d0da9-174f-47bb-95cd-10ac089fa6ef	200ml	DHB-0062-200ML	20000	\N	t	2026-07-16 15:03:41.168	2026-07-19 14:06:26.645	t
08dc400a-0a17-427c-9bbc-77121890a197	41a9d464-7d13-4cdd-9f6b-de11a694a2cf	200ml	DHB-0063-200ML	20000	\N	t	2026-07-16 15:03:44.45	2026-07-19 14:06:30.443	t
1b69190c-45ea-4fe9-8fba-8be76d9630b6	aa34a7e3-727d-4e19-9d1c-7d94b2cf6f13	200ml	DHB-0064-200ML	20000	\N	t	2026-07-16 15:03:47.431	2026-07-19 14:06:34.149	t
f6b9d5aa-d2f8-425d-af91-2aebd00a0c0e	43d65d7e-b90d-42ca-ae91-8b22a67ab0da	200ml	DHB-0065-200ML	20000	\N	t	2026-07-16 15:03:50.1	2026-07-19 14:06:37.734	t
6f6e81b4-fd08-48b9-b51c-02abda28dd95	35e7f742-681f-4b0f-b429-cd4dfa3231d3	200ml	DHB-0067-200ML	20000	\N	t	2026-07-16 15:03:55.816	2026-07-19 14:06:44.825	t
6f37ee39-7722-4f1c-9ed6-bb6b67bc3efd	93e4e0f3-0b00-4dfc-a8b1-8c016ab4cbe7	200ml	DHB-0068-200ML	20000	\N	t	2026-07-16 15:03:58.585	2026-07-19 14:06:48.291	t
97ceebea-7a3a-4212-afd9-6aa14036d9bd	af4e4b85-9bcd-4a9b-a172-1d9c7e7b9954	200ml	DHB-0069-200ML	20000	\N	t	2026-07-16 15:04:01.584	2026-07-19 14:06:51.968	t
9b1a5af4-5743-4874-9e14-57e3c018a8f1	60cb819e-a78e-4fac-897b-30166e63fc97	200ml	DHB-0070-200ML	20000	\N	t	2026-07-16 15:04:04.533	2026-07-19 14:06:55.963	t
8275ea14-a988-4b44-836e-51518ced7606	0df63608-7a9b-4dc7-9166-4ae3f1614388	200ml	DHB-0071-200ML	20000	\N	t	2026-07-16 15:04:07.466	2026-07-19 14:06:59.752	t
bc7b83ff-f65f-431d-a505-e05375ee19dd	bfed6bb8-b8ac-4eb6-91c6-3573e728987f	200ml	DHB-0072-200ML	20000	\N	t	2026-07-16 15:04:10.132	2026-07-19 14:07:03.951	t
5c2aea97-5459-4385-8872-0ac8741ab28a	9130e65e-2416-4133-ba17-ac151fc19dcc	200ml	DHB-0073-200ML	20000	\N	t	2026-07-16 15:04:12.926	2026-07-19 14:07:07.944	t
472c68f1-f8af-48ba-830d-9fd09430ce28	4cda3b3d-edf6-4743-9fe2-c97114628d65	200ml	DHB-0074-200ML	20000	\N	t	2026-07-16 15:04:16.127	2026-07-19 14:07:12.156	t
b92f1fec-e03c-4fa6-a439-3cab46c79ddc	e3d2d948-92b2-426d-b792-2769a000bd19	200ml	DHB-0075-200ML	20000	\N	t	2026-07-16 15:04:18.735	2026-07-19 14:07:15.725	t
34ed303b-3bdc-4d7b-a817-d06669ccfd6d	1ace4014-b9df-4dbc-83f0-cb336ab3154f	200ml	DHB-0076-200ML	20000	\N	t	2026-07-16 15:04:21.413	2026-07-19 14:07:19.314	t
1bab60e4-48b9-48de-8715-12291dc7b15a	3a21e5ec-28c0-4f84-9e28-716ffaaf708b	200ml	DHB-0077-200ML	20000	\N	t	2026-07-16 15:04:24.17	2026-07-19 14:07:23.305	t
73bc856e-4029-4356-ba1d-91296b19faac	f00a2fe6-3317-4679-b60f-98da548f091a	200ml	DHB-0078-200ML	20000	\N	t	2026-07-16 15:04:27.026	2026-07-19 14:07:27.611	t
712478a7-2f67-4dbb-a68e-011e84e7a9d9	31659561-fd1b-4790-9188-cec150ddf740	200ml	DHB-0079-200ML	20000	\N	t	2026-07-16 15:04:30.062	2026-07-19 14:07:31.599	t
d6b7df2e-a2c5-49ec-8529-2c5483027f97	0ddb987e-77d8-400b-baa1-a69b620cc9bc	200ml	DHB-0080-200ML	20000	\N	t	2026-07-16 15:04:33.234	2026-07-19 14:07:35.876	t
a127b174-3fce-4942-8de6-96adfc1b1619	0f66d56c-fbca-4d6d-b35e-09420861c1fd	200ml	DHB-0081-200ML	20000	\N	t	2026-07-16 15:04:35.634	2026-07-19 14:07:39.688	t
d6917e06-e784-47ea-9992-66435d26ce5f	ab073824-be87-4b52-8c45-22212449408b	200ml	DHB-0086-200ML	20000	\N	t	2026-07-16 15:04:49.527	2026-07-19 14:08:00.067	t
ebaffeb7-bea1-447f-9371-6af0ff82187b	986881ad-1775-40e0-83d4-c281ff40abad	200ml	DHB-0087-200ML	20000	\N	t	2026-07-16 15:04:51.926	2026-07-19 14:08:03.548	t
cd7ff1fe-9f1d-40b8-9847-73d621d1aca1	031207ac-912b-4c24-a80b-d121f5c9cdc3	200ml	DHB-0088-200ML	20000	\N	t	2026-07-16 15:04:54.341	2026-07-19 14:08:07.337	t
5eea840e-1d04-43e9-9f4b-e95dffe2a0a8	daafce23-50c9-423e-8d3f-8602da604567	200ml	DHB-0089-200ML	20000	\N	t	2026-07-16 15:04:57.051	2026-07-19 14:08:11.187	t
7b7e4cef-1242-4d4a-bc0a-2a8a8359caea	6f994bb6-d2bf-48f8-a0b0-e2a5a246bfd1	200ml	DHB-0090-200ML	20000	\N	t	2026-07-16 15:04:59.442	2026-07-19 14:08:15.106	t
868e82d8-e6ce-4236-8a49-5f39f4a17492	4c67a538-fc47-460f-bc48-c95e279c5e9d	200ml	DHB-0092-200ML	20000	\N	t	2026-07-16 15:05:04.278	2026-07-19 14:08:22.291	t
e9675629-f793-4e5d-9d19-941e28ed7ef2	da07c0cc-32ce-4700-be29-b45490da697f	200ml	DHB-0093-200ML	20000	\N	t	2026-07-16 15:05:07.826	2026-07-19 14:08:25.789	t
2d78676d-1cbb-47e5-a834-b36a5847a437	8d4029da-96d1-4eec-8b78-6762b4ff7f82	200ml	DHB-0094-200ML	20000	\N	t	2026-07-16 15:05:10.483	2026-07-19 14:08:29.513	t
ce976e19-c0b7-457d-abed-86f83e31d723	78efa338-9c4f-4fb2-b9ce-c6764f91adea	200ml	DHB-0095-200ML	20000	\N	t	2026-07-16 15:05:13.263	2026-07-19 14:08:33.529	t
036199f3-522a-4881-a4de-9112457905e9	e6ded678-e1f9-4fb6-9a91-62bff43db19f	200ml	DHB-0096-200ML	20000	\N	t	2026-07-16 15:05:16.077	2026-07-19 14:08:36.976	t
9dcff99a-b46c-442a-a39b-9e4b532b304b	48effdc1-6343-4a8e-aca2-101fe013fd72	200ml	DHB-0097-200ML	20000	\N	t	2026-07-16 15:05:19.079	2026-07-19 14:08:40.433	t
cd7b8e68-425e-4fe8-857b-ae48631df7a8	1e57282b-dc0e-479f-9d2a-3d37929477bb	200ml	DHB-0098-200ML	20000	\N	t	2026-07-16 15:05:22.707	2026-07-19 14:08:44.243	t
69e5cf5d-bd8f-4852-a87c-ec7dc1cc8567	bc1dc5b9-e07d-41bb-944a-6a75e0f2462f	200ml	DHB-0103-200ML	20000	\N	t	2026-07-16 15:05:37.484	2026-07-19 14:09:03.31	t
366ba615-17ae-483c-9d8c-784d2af8ba8f	064c5488-1c71-4707-bca8-9506854f0b5e	200ml	DHB-0104-200ML	20000	\N	t	2026-07-16 15:05:40.072	2026-07-19 14:09:06.897	t
0f942e4e-3f53-4dc5-a696-7573fc4c770b	1b364c0b-662e-4cd5-954c-6bfee2b2c366	200ml	DHB-0110-200ML	20000	\N	t	2026-07-16 15:05:59.46	2026-07-19 14:09:29.816	t
6b855ee1-460d-4fe2-a8a9-8938df941034	8f922038-e240-4d69-9174-7485ad0d07b2	200ml	DHB-0111-200ML	20000	\N	t	2026-07-16 15:06:02.13	2026-07-19 14:09:33.777	t
3c78206e-122e-4fc6-896d-2bb7137ad249	b0716a17-fde6-4187-81e6-2e50de59786e	200ml	DHB-0112-200ML	20000	\N	t	2026-07-16 15:06:05.614	2026-07-19 14:09:37.615	t
56956d00-0545-4efd-8d92-74ce3fbb81ff	491e9b15-3ab0-4131-b469-e645cbafe7be	200ml	DHB-0383-200ML	20000	\N	t	2026-07-16 15:20:10.631	2026-07-19 14:28:22.942	t
254398e5-98ff-4c4f-8209-36ee88401584	38a49429-9679-4194-af1b-287261dd0258	200ml	DHB-0384-200ML	20000	\N	t	2026-07-16 15:20:13.256	2026-07-19 14:28:25.682	t
cb4844ea-78df-49ff-980a-3c58cfa35a01	e08da125-5766-41a1-bdd6-c9ca9df0b92c	200ml	DHB-0114-200ML	20000	\N	t	2026-07-16 15:06:11.2	2026-07-19 14:09:44.722	t
e06cd43f-c189-4991-8a8c-6edccbfce221	34b9d907-e77d-4dcf-8251-06b07fa60aa0	200ml	DHB-0115-200ML	20000	\N	t	2026-07-16 15:06:14.08	2026-07-19 14:09:48.309	t
7649e67c-463d-4b83-9af9-275e1760a5f6	9034bc0f-5328-4dd3-b722-916bf17b239e	200ml	DHB-0116-200ML	20000	\N	t	2026-07-16 15:06:16.481	2026-07-19 14:09:51.684	t
bf0cabc2-906e-44e5-abc6-ec0fa1030c90	4ba18694-2e09-413d-9406-9050f623540f	200ml	DHB-0117-200ML	20000	\N	t	2026-07-16 15:06:19.176	2026-07-19 14:09:55.49	t
eb81a558-ee56-47b7-800e-1988fcdd6509	6993eab3-d31c-4e3b-990b-f90609b12376	200ml	DHB-0118-200ML	20000	\N	t	2026-07-16 15:06:22.497	2026-07-19 14:09:59.366	t
f73d1b0d-5494-4f55-bf7f-4d17f5cd77a8	477898f2-01cc-4cee-8672-faea3786d6a4	200ml	DHB-0119-200ML	20000	\N	t	2026-07-16 15:06:25.48	2026-07-19 14:10:02.951	t
467c7b51-423d-4a07-84e3-2c9a67ee972d	2b0e1194-769e-4c6e-b225-af46fe33848c	200ml	DHB-0120-200ML	20000	\N	t	2026-07-16 15:06:28.478	2026-07-19 14:10:06.534	t
2f1b5803-317d-47a2-9c61-9cff2491e336	6b1cde3b-7614-4f26-9c6a-e05a03cfe1f9	200ml	DHB-0121-200ML	20000	\N	t	2026-07-16 15:06:31.662	2026-07-19 14:10:10.271	t
2c0283ef-38ec-4919-9f26-c2f5d8435ec7	0cbe8336-1932-47a2-b470-90af69e93b25	200ml	DHB-0122-200ML	20000	\N	t	2026-07-16 15:06:35.568	2026-07-19 14:10:13.859	t
c0f6cf79-8734-444d-a773-e3917390b16e	a563f573-f08e-4450-bf46-cc26967c13c6	200ml	DHB-0123-200ML	20000	\N	t	2026-07-16 15:06:40.29	2026-07-19 14:10:18.31	t
b61d9644-f43a-40ba-b5c9-789c2fcde786	fcf0c6ed-2798-4aee-b5fc-62978a63cbd3	200ml	DHB-0124-200ML	20000	\N	t	2026-07-16 15:06:43.105	2026-07-19 14:10:21.908	t
95fbf980-f8a7-408d-b0ed-3468011602cc	8b600535-5657-4c05-a48a-59321a0ac0ab	200ml	DHB-0125-200ML	20000	\N	t	2026-07-16 15:06:45.774	2026-07-19 14:10:25.913	t
6a49076f-e30d-411d-9a29-884708707fdd	f8751a4b-64a0-4878-ad63-704933f3f41f	200ml	DHB-0126-200ML	20000	\N	t	2026-07-16 15:06:48.441	2026-07-19 14:10:29.376	t
61208bd3-3523-4fc6-852a-ec1071f3eff3	c78c89fd-baf2-41b8-a4fd-ec1df6fbf32f	200ml	DHB-0127-200ML	20000	\N	t	2026-07-16 15:06:51.179	2026-07-19 14:10:32.827	t
0df1ab8a-615c-4fb3-a9f7-2503cd2dffc7	4ff689b4-a6fa-4912-aeb6-4f230ff633a3	200ml	DHB-0128-200ML	20000	\N	t	2026-07-16 15:06:53.814	2026-07-19 14:10:36.534	t
2a6de385-815d-4885-96a9-a676bc2a4ff5	d7696520-73d0-4473-babc-fa0d1f3df150	200ml	DHB-0129-200ML	20000	\N	t	2026-07-16 15:06:56.955	2026-07-19 14:10:39.904	t
7f5ec6bb-95ef-4a52-a9d6-981166330b1d	b8fab72a-155f-4392-bc00-93da631ca1a6	200ml	DHB-0130-200ML	20000	\N	t	2026-07-16 15:06:59.399	2026-07-19 14:10:43.358	t
96cbf8f3-198f-41d9-a219-96d8f5df4d5c	dfcdeaa5-756e-4dcf-8cdb-bd2bab3b377b	200ml	DHB-0131-200ML	20000	\N	t	2026-07-16 15:07:02.19	2026-07-19 14:10:47.191	t
70683b25-5047-4602-a33d-538387a6790d	47998914-eb19-4aba-9a3b-c2760e9d9967	200ml	DHB-0132-200ML	20000	\N	t	2026-07-16 15:07:04.864	2026-07-19 14:10:50.815	t
601b8105-9713-45c0-ad02-59e52cc86d81	3bed23fb-b4bc-4699-9192-586f02c0405e	200ml	DHB-0133-200ML	20000	\N	t	2026-07-16 15:07:07.636	2026-07-19 14:10:54.714	t
4a96073b-4a15-4309-b131-b1f568b8a1fe	f03d5a97-0539-4692-8841-af7a070ee27a	200ml	DHB-0134-200ML	20000	\N	t	2026-07-16 15:07:10.289	2026-07-19 14:10:58.255	t
49dd7872-d46b-4cec-aca1-ff23e4e5741c	7d1d7ad0-8f9a-4f49-a517-df10b3136560	200ml	DHB-0135-200ML	20000	\N	t	2026-07-16 15:07:13.713	2026-07-19 14:11:02.189	t
c81b0ebc-4643-48ca-9687-65519c04e7af	ecb05f78-c3dc-4c3f-aeb9-ad7985bd34e5	200ml	DHB-0136-200ML	20000	\N	t	2026-07-16 15:07:16.419	2026-07-19 14:11:05.794	t
5624d4b1-c300-4cea-8d65-5af37b2c15bd	d0ca3ed4-4f2e-44cb-a494-f1076499dedc	200ml	DHB-0137-200ML	20000	\N	t	2026-07-16 15:07:19.093	2026-07-19 14:11:09.1	t
b72c6829-20b6-4ede-af32-8a3823396be1	ce88f95e-01cc-4d2e-be0b-35d52bc297e9	200ml	DHB-0138-200ML	20000	\N	t	2026-07-16 15:07:21.601	2026-07-19 14:11:12.88	t
65488abf-d6d8-43d9-b926-618dcac84370	b7895678-6a6a-4273-ac01-a42aa7a1dc95	200ml	DHB-0139-200ML	20000	\N	t	2026-07-16 15:07:24.201	2026-07-19 14:11:16.827	t
f4a0690e-f8ba-4abc-92b9-7c8b1064f071	3c5563bf-8bcf-42f5-a50b-28ad63938d4d	200ml	DHB-0140-200ML	20000	\N	t	2026-07-16 15:07:27.473	2026-07-19 14:11:20.624	t
dc8b8651-a0f3-418d-bd46-b3f92375324b	79864c5e-5f95-442f-8c8d-8c093066ee5b	200ml	DHB-0141-200ML	20000	\N	t	2026-07-16 15:07:30.713	2026-07-19 14:11:26.045	t
0de3625d-e63c-4477-8607-9889fbb1920c	8710a3af-739b-4817-aceb-3d3eca0566d3	200ml	DHB-0142-200ML	20000	\N	t	2026-07-16 15:07:33.73	2026-07-19 14:11:38.668	t
0b50fa99-a8cb-4782-936e-8c2a4828089a	76bede9b-42da-4e9e-997f-f5b3907397d0	200ml	DHB-0143-200ML	20000	\N	t	2026-07-16 15:07:36.59	2026-07-19 14:11:46.77	t
747d23f9-0976-4f30-8dd8-8991a877becb	ba231572-151a-4d38-a492-7a0fd966042a	200ml	DHB-0144-200ML	20000	\N	t	2026-07-16 15:07:39.284	2026-07-19 14:11:50.959	t
76c430b4-a9a4-4b3f-817e-78373d5f019e	0c8953b6-de1b-4a36-afc0-486388246612	200ml	DHB-0145-200ML	20000	\N	t	2026-07-16 15:07:41.962	2026-07-19 14:11:54.963	t
15e6e50d-4fdb-4b84-ab41-7494c3a7e154	03889b15-9788-44d9-8fad-327ad9f3f429	200ml	DHB-0146-200ML	20000	\N	t	2026-07-16 15:07:44.486	2026-07-19 14:11:58.907	t
4ba3e410-f630-4776-872c-ec1a8c87e968	dde8e905-12bb-4a7b-ba55-f5016baeafb8	200ml	DHB-0148-200ML	20000	\N	t	2026-07-16 15:07:49.639	2026-07-19 14:12:06.135	t
4e258504-55f0-44ad-9266-5ef534d150c1	9d4b8003-45af-4967-9bd3-4a134a8ea251	200ml	DHB-0149-200ML	20000	\N	t	2026-07-16 15:07:52.424	2026-07-19 14:12:10.638	t
d9ee278c-229a-47d5-a9d3-a3ff87130cfb	b4958433-28ae-4cf7-b922-68e31a061fd0	200ml	DHB-0150-200ML	20000	\N	t	2026-07-16 15:07:54.998	2026-07-19 14:12:14.557	t
7f8c53cc-b156-47c9-b336-f4686cefa1ea	8622cbf7-674e-4327-8745-58e0e8610e04	200ml	DHB-0151-200ML	20000	\N	t	2026-07-16 15:07:57.699	2026-07-19 14:12:17.939	t
e3fcf1d2-0f49-48c5-b59c-dc0612a65edb	c1c65875-789f-42a8-80e7-cba95705cd95	200ml	DHB-0152-200ML	20000	\N	t	2026-07-16 15:08:00.914	2026-07-19 14:12:21.916	t
cb83aa3a-7b12-41eb-8c46-05239a953b50	4d017fe5-f486-4d0a-b1de-21ddcc5b9256	200ml	DHB-0153-200ML	20000	\N	t	2026-07-16 15:08:04.885	2026-07-19 14:12:26.309	t
472d8611-8bc2-4cf4-9390-019ad9f58f5c	0fbc106f-ec7f-4a5b-a6b5-3921a845a82b	200ml	DHB-0154-200ML	20000	\N	t	2026-07-16 15:08:07.664	2026-07-19 14:12:29.996	t
3ee2f205-299a-4230-8613-f41e5fcff4df	cda6797a-59e1-40d2-a514-6844b8a36b91	200ml	DHB-0166-200ML	20000	\N	t	2026-07-16 15:08:44.321	2026-07-19 14:13:17.278	t
6523f106-29fa-4c12-bea3-c227c0542d99	85e52a66-84c6-48ee-9eab-d648b3aa68ce	200ml	DHB-0167-200ML	20000	\N	t	2026-07-16 15:08:48.497	2026-07-19 14:13:21.359	t
fdeae693-6f4b-48ee-89e8-0de30087c6e1	74752fc6-8ebb-4939-a83f-cb2d34f9d687	200ml	DHB-0168-200ML	20000	\N	t	2026-07-16 15:08:51.479	2026-07-19 14:13:25.099	t
9c7ca99d-d77c-46dd-b77b-1979c9715842	5d142616-2772-4ab5-a2ae-e7fbed159c58	200ml	DHB-0169-200ML	20000	\N	t	2026-07-16 15:08:54.226	2026-07-19 14:13:28.98	t
2442d64a-8a0b-4783-9a47-bf6ee50c4a09	147267f5-ad6b-46d1-afc8-16d5c7b78579	200ml	DHB-0170-200ML	20000	\N	t	2026-07-16 15:08:57.053	2026-07-19 14:13:32.869	t
dc84a21c-41e5-4106-b4a4-9946f9144626	32dbefd4-7297-4427-94b6-312f83f3f7c8	200ml	DHB-0171-200ML	20000	\N	t	2026-07-16 15:08:59.671	2026-07-19 14:13:37.11	t
fcac00d5-244a-4df0-80e6-70f7f0ea4f94	26a5b7ba-78af-4733-9d28-16ffa0ed7c14	200ml	DHB-0395-200ML	20000	\N	t	2026-07-16 15:20:50.937	2026-07-19 14:29:01.446	t
de656863-9499-4a11-b90f-079f57a72b73	6a5cf2a6-e87d-4cc2-9062-b523922b4cb7	200ml	DHB-0180-200ML	20000	\N	t	2026-07-16 15:09:24.736	2026-07-19 14:14:27.164	t
f526264a-1279-43fa-90c6-971e30d3eaec	7013dcaa-b40f-43d9-a2fb-e25459b56cd9	200ml	DHB-0181-200ML	20000	\N	t	2026-07-16 15:09:27.865	2026-07-19 14:14:33.334	t
8c7f999c-4504-4fd7-9ed5-a3bdf05bdc65	4ad4be79-66cf-4e94-88cd-9ac109049507	200ml	DHB-0182-200ML	20000	\N	t	2026-07-16 15:09:31.226	2026-07-19 14:14:40.221	t
8bd41b55-ce05-4e42-9b46-3769059b0377	30056426-cb6c-4a98-8e00-8c839e350b07	200ml	DHB-0183-200ML	20000	\N	t	2026-07-16 15:09:34.114	2026-07-19 14:14:45.166	t
9bb32b01-2ebf-4284-ad49-560876aa6a24	36e49cfe-f6b4-4efc-965f-908b2495e261	200ml	DHB-0184-200ML	20000	\N	t	2026-07-16 15:09:36.706	2026-07-19 14:14:51.435	t
d4403a57-aae3-49ab-8f20-89f2c6167ee0	2e421b80-2bba-40cb-9271-2f374778fe6c	200ml	DHB-0185-200ML	20000	\N	t	2026-07-16 15:09:39.642	2026-07-19 14:15:00.539	t
fa9df1f6-2d88-4eab-9aad-a83b6bd22c3b	951765db-c632-4eb1-8ccd-a365ee9a98c3	200ml	DHB-0186-200ML	20000	\N	t	2026-07-16 15:09:42.588	2026-07-19 14:15:09.284	t
1edc8b66-fe45-4312-a56a-3918e681203e	a301ce1b-44ea-4ca7-9682-153f2283ece0	200ml	DHB-0187-200ML	20000	\N	t	2026-07-16 15:09:45.259	2026-07-19 14:15:14.596	t
c9c3dfc6-f703-48e3-8944-1b639e9c8475	30d74977-3ab5-4047-a372-e7a0dbd3e797	200ml	DHB-0188-200ML	20000	\N	t	2026-07-16 15:09:48.179	2026-07-19 14:15:18.758	t
782b11cd-5cc3-4095-bef1-97a364f4aadb	3249d1f8-95ac-4efb-a19a-c07713861354	200ml	DHB-0189-200ML	20000	\N	t	2026-07-16 15:09:51.156	2026-07-19 14:15:23.877	t
96a9d53c-0346-46c1-9072-d5cca40a7b56	7a542bf6-eaf0-4077-b374-60dea2563c8c	200ml	DHB-0190-200ML	20000	\N	t	2026-07-16 15:09:53.848	2026-07-19 14:15:29.806	t
3c476397-5aa2-44f0-895c-9748f3f4ffae	57bda1da-5b8e-461b-8940-757a8130c09b	200ml	DHB-0191-200ML	20000	\N	t	2026-07-16 15:09:56.708	2026-07-19 14:15:34.214	t
7489dd26-84b2-4ca5-b465-1d0aeb443c7d	57a1037a-d639-458f-8007-6b9ecfaa947a	200ml	DHB-0192-200ML	20000	\N	t	2026-07-16 15:09:59.923	2026-07-19 14:15:38.544	t
2aa62227-2ead-4818-9645-6415703abe2d	4b7caf97-02eb-478a-8388-d16bc59a5596	200ml	DHB-0193-200ML	20000	\N	t	2026-07-16 15:10:02.391	2026-07-19 14:15:42.03	t
cd5b6037-530b-45cb-98e7-01371bc05dcd	19133cd0-67a4-4de4-9809-4db49357d487	200ml	DHB-0194-200ML	20000	\N	t	2026-07-16 15:10:04.79	2026-07-19 14:15:45.591	t
baa1957d-3d2c-4a42-8cdb-849c3c82e8a9	8335f285-1a61-47f4-b02a-dbd8e8c2b926	200ml	DHB-0195-200ML	20000	\N	t	2026-07-16 15:10:07.528	2026-07-19 14:15:49.729	t
bc939467-4366-4992-ab29-5fa95634431d	3383c1ab-88c0-4958-bacf-0b1491a1e761	200ml	DHB-0196-200ML	20000	\N	t	2026-07-16 15:10:10.235	2026-07-19 14:15:54.606	t
d286fcd9-48f9-48a6-8258-3305e4bc3709	79ddcaec-0056-4c94-9e75-5bd97a6e6f9a	200ml	DHB-0197-200ML	20000	\N	t	2026-07-16 15:10:13.027	2026-07-19 14:15:58.898	t
fda0a7dc-785e-4913-9f81-e2bd21683f12	5deccc48-e4c5-4936-9a4c-31eb581dc9e7	200ml	DHB-0198-200ML	20000	\N	t	2026-07-16 15:10:15.928	2026-07-19 14:16:03	t
7e79024a-5ae5-4eb0-b714-d0a2b0d50e39	83dbdeed-94db-4832-a9c0-63aa1132c9da	200ml	DHB-0199-200ML	20000	\N	t	2026-07-16 15:10:18.4	2026-07-19 14:16:07.411	t
d43fff0f-0abc-4dc3-afa1-e53d7f8eb885	65c5ad19-2d58-4550-ac70-364c5816d0b5	200ml	DHB-0200-200ML	20000	\N	t	2026-07-16 15:10:21.168	2026-07-19 14:16:13.207	t
283cdbbd-640e-442e-be4a-20ed0308d5f5	6aad7fb3-5e37-46e0-accb-ffbf2c121ecf	200ml	DHB-0201-200ML	20000	\N	t	2026-07-16 15:10:23.813	2026-07-19 14:16:16.951	t
9da9b941-7b91-4e93-bdf8-c483a2558445	359618ae-76db-47d0-b416-3f2874d42184	200ml	DHB-0202-200ML	20000	\N	t	2026-07-16 15:10:26.224	2026-07-19 14:16:20.672	t
b5b2be17-7a69-410f-8724-a2197d8e70f5	ed508f36-74a7-4304-b24e-9c50c5e101b2	200ml	DHB-0203-200ML	20000	\N	t	2026-07-16 15:10:28.769	2026-07-19 14:16:24.406	t
3dccee60-a57a-41fe-819b-ea5d5a31603f	ce22f643-10a3-48bf-97ec-c4d322ef4105	200ml	DHB-0204-200ML	20000	\N	t	2026-07-16 15:10:31.628	2026-07-19 14:16:28.696	t
77d14623-8be9-450a-8c5c-ff0a4fecaecd	cebfe037-5ac4-4b4f-bafa-18734995b3ca	200ml	DHB-0205-200ML	20000	\N	t	2026-07-16 15:10:35.288	2026-07-19 14:16:32.794	t
49a1bce3-8985-4596-ae9e-15482befe9ad	c35771e0-e11f-4dbd-b762-c5488c8e503e	200ml	DHB-0206-200ML	20000	\N	t	2026-07-16 15:10:38.373	2026-07-19 14:16:36.804	t
e3a092a2-319c-40b1-85be-e90b78ff37f1	a8fc89dd-4102-431f-8339-9e65b9d27074	200ml	DHB-0207-200ML	20000	\N	t	2026-07-16 15:10:40.837	2026-07-19 14:16:40.904	t
753f2bd2-4c99-4345-9a07-d40bed3870e5	e6b0d9f7-4026-4c28-8916-df4a5c8fdc26	200ml	DHB-0208-200ML	20000	\N	t	2026-07-16 15:10:43.383	2026-07-19 14:16:45.045	t
401ed8cb-6a0e-415d-8e88-4643b273bb12	de83ece8-c147-480d-b414-ee6dfa9c77f4	200ml	DHB-0209-200ML	20000	\N	t	2026-07-16 15:10:46.234	2026-07-19 14:16:49.404	t
cc84451e-fc82-4b40-a679-75650a4f86a0	82e672a8-9569-4510-b45d-4e4d5a6a0872	200ml	DHB-0210-200ML	20000	\N	t	2026-07-16 15:10:48.987	2026-07-19 14:16:55.433	t
cf181c0b-952c-46c1-9231-3fcd3a520b08	09b097c8-8987-49af-99cf-f8fcbf184a92	200ml	DHB-0212-200ML	20000	\N	t	2026-07-16 15:10:54.901	2026-07-19 14:17:04.026	t
c57f563d-b15b-43de-9501-aca1c307c414	0441d386-bf83-46d6-850b-bc8c5ce4a7d0	200ml	DHB-0213-200ML	20000	\N	t	2026-07-16 15:10:58.31	2026-07-19 14:17:08.125	t
8cb8935a-e18f-42a7-855d-5e64a9b1fce9	efc1a8bb-203a-4dc6-8ddc-5de529b07d7e	200ml	DHB-0215-200ML	20000	\N	t	2026-07-16 15:11:04.381	2026-07-19 14:17:16.623	t
b3d2b46f-9260-4352-9626-49c89562dfe2	08332624-be68-4d6f-b34d-9af66ff3bb6f	200ml	DHB-0216-200ML	20000	\N	t	2026-07-16 15:11:07.854	2026-07-19 14:17:20.925	t
16205140-97c5-4244-9151-2bac5101af7d	b1ee6554-205e-4306-bf77-cae0c6d30752	200ml	DHB-0217-200ML	20000	\N	t	2026-07-16 15:11:10.792	2026-07-19 14:17:27.351	t
629b6019-6eda-4d3c-bbd6-f86db5b02cc3	d919cac4-3d0e-46d3-abfd-39405ff00d2e	200ml	DHB-0218-200ML	20000	\N	t	2026-07-16 15:11:13.437	2026-07-19 14:17:31.88	t
5459c442-8af1-4af2-921e-62ab189f6b28	21fea75f-8b80-48c9-8a52-f3b835a33dc0	200ml	DHB-0219-200ML	20000	\N	t	2026-07-16 15:11:16.074	2026-07-19 14:17:35.327	t
08eca864-ea74-4903-bd83-48c51a5d4780	b2321149-dcf9-40ef-83c7-b80d6ed56162	200ml	DHB-0220-200ML	20000	\N	t	2026-07-16 15:11:19.163	2026-07-19 14:17:39.289	t
2c03e3a7-28a1-4549-91b5-6505db89155b	8cbc5b78-6a80-4248-a218-28ef9f032a83	200ml	DHB-0221-200ML	20000	\N	t	2026-07-16 15:11:21.935	2026-07-19 14:17:43.306	t
2cb75f3e-dcf0-4906-9529-f4c773633e91	8fb5c757-d7cf-4a44-8707-24c27f54263b	200ml	DHB-0222-200ML	20000	\N	t	2026-07-16 15:11:25.147	2026-07-19 14:17:48.109	t
c100360f-83fc-4ce4-a984-37f2d5df700c	e182e4b2-4fcb-4706-a454-4fc4774dabfc	200ml	DHB-0223-200ML	20000	\N	t	2026-07-16 15:11:28.662	2026-07-19 14:17:57.085	t
14f42208-d356-4017-8e7e-62719417da60	3b7f7d83-9e8d-4e86-941d-48ebd74ce50d	200ml	DHB-0224-200ML	20000	\N	t	2026-07-16 15:11:31.282	2026-07-19 14:18:02.236	t
0415f0c8-2c31-4fdc-9324-abfd8bb4f332	43494570-705a-4197-9dd7-fff7505dd335	200ml	DHB-0225-200ML	20000	\N	t	2026-07-16 15:11:34.151	2026-07-19 14:18:07.619	t
397fde09-5e9c-4d72-92dc-ea04b39e3714	3df80641-667c-4a5f-8475-d64c8c46683a	200ml	DHB-0412-200ML	20000	\N	t	2026-07-16 15:21:46.045	2026-07-19 14:29:58.484	t
1028290e-ced7-4ba7-b938-307429b14a64	d8a92854-1023-4459-aab1-a174a062c549	200ml	DHB-0413-200ML	20000	\N	t	2026-07-16 15:21:49.058	2026-07-19 14:30:01.293	t
409e714f-302f-4c0a-951f-31812ea66937	f302d48a-6e27-4e81-b46a-725c5024a4a5	200ml	DHB-0424-200ML	20000	\N	t	2026-07-16 15:22:30.372	2026-07-19 14:30:36.643	t
4df7b497-ee56-49a5-ac13-4f01d6f605f0	b8f49443-825f-402d-8a87-98df3f13322d	200ml	DHB-0231-200ML	20000	\N	t	2026-07-16 15:11:51.553	2026-07-19 14:18:31.082	t
6b3912b2-a632-4f5d-8cf3-4a185a78e502	27028cb6-61cc-4664-9d15-c39bef00eced	200ml	DHB-0232-200ML	20000	\N	t	2026-07-16 15:11:54.636	2026-07-19 14:18:34.856	t
5d5c2e2d-ca01-41a4-b883-bb33af80688c	9ab9be03-ca2d-49c0-9e18-a16f15f96d35	200ml	DHB-0233-200ML	20000	\N	t	2026-07-16 15:11:57.894	2026-07-19 14:18:38.124	t
968eff19-3537-4ce5-9ab7-abdd8a3bf671	6bdbb989-d52c-46ae-9fb6-a7ace9089b6d	200ml	DHB-0234-200ML	20000	\N	t	2026-07-16 15:12:01.096	2026-07-19 14:18:42.444	t
2cfc1c80-d23e-4d01-b9f9-b2d7c4ccd8d4	ae7bca18-fd4d-4ec3-bb28-3b2734da687b	200ml	DHB-0235-200ML	20000	\N	t	2026-07-16 15:12:04.476	2026-07-19 14:18:47.174	t
08f0579f-afc3-4e9b-af68-4882d8c36f1b	e60a4b7d-e652-4115-9310-04dae4a2f227	200ml	DHB-0236-200ML	20000	\N	t	2026-07-16 15:12:07.334	2026-07-19 14:18:51.249	t
e03dec20-6e3b-4c8d-9ba7-ab5fa084ebf0	a1f0ff8c-81d4-48bf-b7c2-bc297b29bab8	200ml	DHB-0237-200ML	20000	\N	t	2026-07-16 15:12:10.579	2026-07-19 14:18:55.26	t
ddad6bcf-8676-4089-9737-6330be1401f0	d851ea0e-5b15-48d4-8d3c-c07e0836a988	200ml	DHB-0238-200ML	20000	\N	t	2026-07-16 15:12:13.514	2026-07-19 14:18:59.34	t
58fc03a3-f235-4b06-9daf-c84d3f7e9744	0e34cefc-9cc3-4e13-b25a-2a1b01bbd4c2	200ml	DHB-0239-200ML	20000	\N	t	2026-07-16 15:12:16.653	2026-07-19 14:19:02.808	t
b3399429-8973-4dbe-81da-2b65ec278de3	ea726d02-55d5-4257-885f-7cfafa201f43	200ml	DHB-0240-200ML	20000	\N	t	2026-07-16 15:12:20.01	2026-07-19 14:19:06.495	t
2068c2ae-e291-4e86-8691-30a2a97771e4	2a20229e-a62d-4427-9950-3e1846971720	200ml	DHB-0241-200ML	20000	\N	t	2026-07-16 15:12:23.09	2026-07-19 14:19:10.609	t
2af59551-29d8-4dde-bcd5-d020bd6da888	00f161f6-53e4-4191-85b2-81e573898f95	200ml	DHB-0242-200ML	20000	\N	t	2026-07-16 15:12:25.753	2026-07-19 14:19:14.277	t
863ed8f0-4f09-4348-afdc-1f42873ba1c2	71cb70a1-52af-43b0-b06b-5a51225a84a6	200ml	DHB-0243-200ML	20000	\N	t	2026-07-16 15:12:28.9	2026-07-19 14:19:18.372	t
1fad692d-bf34-4bb4-8d2c-4f39a8d811a0	b1b782a4-1c73-42fc-a864-120b7dcdb6d6	200ml	DHB-0255-200ML	20000	\N	t	2026-07-16 15:13:03.873	2026-07-19 14:20:06.095	t
175598f4-6919-41ff-9d52-cf076f1274bd	59110147-0dd3-4c94-b06c-f80a08d09dc2	200ml	DHB-0256-200ML	20000	\N	t	2026-07-16 15:13:06.4	2026-07-19 14:20:09.515	t
8ace45b2-d663-451d-bf16-831b21eeba94	8c4c41bf-b35f-464b-be5f-11e7ebe18569	200ml	DHB-0257-200ML	20000	\N	t	2026-07-16 15:13:09.173	2026-07-19 14:20:13.194	t
d723f2fa-2bb4-443c-bf7a-e5189fb69a9a	cb400a40-b9b3-49b4-a1d5-90cd684a69d2	200ml	DHB-0258-200ML	20000	\N	t	2026-07-16 15:13:11.951	2026-07-19 14:20:16.58	t
7707a2a2-c572-4e60-9393-6f5ed1cb5dbf	2e09f8a6-623b-4612-a9f4-4c1fc8b85d1a	200ml	DHB-0259-200ML	20000	\N	t	2026-07-16 15:13:15.002	2026-07-19 14:20:20.575	t
5abfb3bf-2334-4151-8da9-9e47459d8a32	fbb2f6c1-a13d-42e9-8af9-3327159f0a8c	200ml	DHB-0263-200ML	20000	\N	t	2026-07-16 15:13:26.324	2026-07-19 14:20:35.948	t
e3a80230-87ac-45ff-8302-b5293ef72b31	a275de9a-5f98-4ee6-8a04-415330eb7c9b	200ml	DHB-0264-200ML	20000	\N	t	2026-07-16 15:13:29.046	2026-07-19 14:20:40.308	t
fa2cfe88-1597-4e63-be2b-a3f16b2ba101	a91ae67a-695a-4cdc-a537-753e7469182d	200ml	DHB-0265-200ML	20000	\N	t	2026-07-16 15:13:31.725	2026-07-19 14:20:44.08	t
829961aa-671c-48db-826e-3bc3cadf2e72	8a55e6a6-c88d-4c6d-88e7-d4d07dca202b	200ml	DHB-0266-200ML	20000	\N	t	2026-07-16 15:13:34.476	2026-07-19 14:20:47.665	t
96d26431-011d-4c83-bfde-56a0b9e7a6c0	59a459d0-4195-4186-9b29-4a801aa14872	200ml	DHB-0267-200ML	20000	\N	t	2026-07-16 15:13:37.333	2026-07-19 14:20:51.537	t
1d5235db-3361-47dd-ad07-41bc0929ec54	47a8028b-d94e-4f27-b0b7-56a2ae1e8bae	200ml	DHB-0268-200ML	20000	\N	t	2026-07-16 15:13:40.308	2026-07-19 14:20:55.541	t
29a227fb-3c8a-4908-b7a5-7fe8515f7e60	fc4e72d9-de13-42f3-a44a-529a89e1e2d4	200ml	DHB-0269-200ML	20000	\N	t	2026-07-16 15:13:43.371	2026-07-19 14:21:00.056	t
dfcd3a4e-764f-4743-bc39-787e19ba743a	7333c793-92dc-4d5a-b91a-0b3dcd894eb2	200ml	DHB-0270-200ML	20000	\N	t	2026-07-16 15:13:46.853	2026-07-19 14:21:03.536	t
66c6280a-237e-4936-8b87-460f31c84e8f	2d7e52f0-0a83-46fd-908e-3bad0d6f2ebd	200ml	DHB-0271-200ML	20000	\N	t	2026-07-16 15:13:49.979	2026-07-19 14:21:07.223	t
7439a008-906c-4772-aefa-0e741815bce3	94daadee-0da8-419b-a232-88f91dfdefa5	200ml	DHB-0272-200ML	20000	\N	t	2026-07-16 15:13:53.76	2026-07-19 14:21:11.32	t
807faa5b-69c3-48a8-9b09-f6d2cff660cd	7845df49-d2ec-4e83-8e71-ac3a4a210ffa	200ml	DHB-0273-200ML	20000	\N	t	2026-07-16 15:13:57.05	2026-07-19 14:21:15.416	t
6cfd2c65-ed98-484c-8f52-dd8031f96da4	d2a0f31c-8663-49d1-9132-0c3005d100e9	200ml	DHB-0274-200ML	20000	\N	t	2026-07-16 15:14:00.084	2026-07-19 14:21:19.535	t
33ce9b40-ec83-47c2-b95e-facabbc23b2b	30a7e534-d700-4613-b061-6e9085db3e96	200ml	DHB-0275-200ML	20000	\N	t	2026-07-16 15:14:03.356	2026-07-19 14:21:23.576	t
db3574cc-6692-4ab8-8c1d-45efa146af0c	5c508d38-7c4b-4b8f-aeb1-f9e125d225bd	200ml	DHB-0276-200ML	20000	\N	t	2026-07-16 15:14:06.066	2026-07-19 14:21:27.518	t
8e65031d-425f-4542-99d5-7e483edc0120	e2f40d3e-b803-4edb-bee2-6b8a89aafca9	200ml	DHB-0277-200ML	20000	\N	t	2026-07-16 15:14:09.039	2026-07-19 14:21:31.9	t
75283f35-d1f0-445d-8975-2a642b1c279d	1b4f0479-08ff-4fb7-a48c-8d7d1a9319d7	200ml	DHB-0279-200ML	20000	\N	t	2026-07-16 15:14:14.842	2026-07-19 14:21:39.893	t
bfdb52ea-315d-4825-aa3e-2a711a696d8d	59dfaf31-6b17-4d0a-a15d-81cb250f40e4	200ml	DHB-0280-200ML	20000	\N	t	2026-07-16 15:14:17.783	2026-07-19 14:21:43.942	t
862eb460-d1ec-4d0b-808e-3c8c310cedf1	cb7b75da-eca0-4e78-bbfa-5a01bf0eb4fb	200ml	DHB-0281-200ML	20000	\N	t	2026-07-16 15:14:20.857	2026-07-19 14:21:47.868	t
9ca3ba2d-34a9-422e-8bb7-5f71035ed6b9	0a6ef255-7fab-4a0b-b69a-3a95b77894b6	200ml	DHB-0282-200ML	20000	\N	t	2026-07-16 15:14:23.925	2026-07-19 14:21:51.758	t
9b461832-6bc8-462c-8806-8cb5da510d07	ffa99d71-5c66-485b-962e-60b1383fd7a6	200ml	DHB-0283-200ML	20000	\N	t	2026-07-16 15:14:27.119	2026-07-19 14:21:55.551	t
463dc944-cf44-401c-8e97-c381b9a0c5c7	cc317f86-9b40-436e-92ef-0f0eab00699a	200ml	DHB-0284-200ML	20000	\N	t	2026-07-16 15:14:29.844	2026-07-19 14:21:59.722	t
e55e67bd-1641-42da-b55f-79f1c3385442	31cc7a30-cd6a-4095-9662-2e562b960e4f	200ml	DHB-0285-200ML	20000	\N	t	2026-07-16 15:14:33.159	2026-07-19 14:22:03.638	t
a3895c59-94b4-4ba4-a32d-9c3afafb2522	7eb16ed2-8737-4b3a-8e55-76aa65f55ea6	200ml	DHB-0286-200ML	20000	\N	t	2026-07-16 15:14:35.86	2026-07-19 14:22:08.11	t
6cf4a2d8-0d90-45bc-a25e-1d036e2cb2c7	1c13ab6e-6ce7-4c70-bd84-9f8bf4373d75	200ml	DHB-0287-200ML	20000	\N	t	2026-07-16 15:14:38.605	2026-07-19 14:22:12.125	t
9fd6b4dd-c432-4eba-b098-fbda152da0d8	654b5cd7-b1d8-478e-8930-7b1e302fd1ad	200ml	DHB-0288-200ML	20000	\N	t	2026-07-16 15:14:41.659	2026-07-19 14:22:16.425	t
77f7f1c5-a8e9-4e0f-a579-bb63faa84b78	2a992096-8c7a-41dd-98a7-2687949b3154	200ml	DHB-0289-200ML	20000	\N	t	2026-07-16 15:14:44.959	2026-07-19 14:22:20.042	t
c43db1df-d417-4024-99d6-e7fd3d9cafec	62caf1c8-0aed-4178-8905-e2973a1d16ce	200ml	DHB-0290-200ML	20000	\N	t	2026-07-16 15:14:47.939	2026-07-19 14:22:23.791	t
9b2c0ca2-1ebd-47ec-87ed-e66df4264446	5fdd1f1f-324f-4fee-9186-fd01bab67c16	200ml	DHB-0291-200ML	20000	\N	t	2026-07-16 15:14:50.731	2026-07-19 14:22:27.267	t
a43956e4-4f3c-4329-b73f-72ad997faaf6	b6891f3b-5f33-4b05-8ae5-e5d8deea26a9	200ml	DHB-0292-200ML	20000	\N	t	2026-07-16 15:14:53.625	2026-07-19 14:22:31.108	t
eb89a5c2-2fd4-4f3d-8775-cc5268bd3626	f6d65d00-7f47-4b55-8590-fdab9ce175aa	200ml	DHB-0299-200ML	20000	\N	t	2026-07-16 15:15:14.501	2026-07-19 14:22:58.327	t
a1216f41-a96c-49d1-90df-ee12f598c4d8	8a1a3ee2-53d8-4d82-bdfa-8536f274a554	200ml	DHB-0300-200ML	20000	\N	t	2026-07-16 15:15:17.886	2026-07-19 14:23:02.32	t
b3b8761d-0f4e-4fd4-af82-42f99785370a	99c569c0-af20-41ab-9b5a-6274d66d1523	200ml	DHB-0301-200ML	20000	\N	t	2026-07-16 15:15:20.757	2026-07-19 14:23:06.214	t
d98476de-bd4a-4a6f-9e55-3d835fe8289d	4edadee5-1848-452a-9dec-461df9ed5d93	200ml	DHB-0302-200ML	20000	\N	t	2026-07-16 15:15:23.832	2026-07-19 14:23:10.205	t
31e8f066-fc09-4a91-856a-4a0af4deadb8	3ea1c578-aacf-41b2-96e9-42c5f6cba8a0	200ml	DHB-0303-200ML	20000	\N	t	2026-07-16 15:15:26.806	2026-07-19 14:23:14.055	t
10c0b005-cf65-47f6-bdd2-f882c0ccf9d5	4842b000-f95f-41e2-a84c-1ed94570969a	200ml	DHB-0304-200ML	20000	\N	t	2026-07-16 15:15:30.18	2026-07-19 14:23:18.296	t
2b082d5d-cf6e-4aeb-a93c-ee586bb4941f	f45e847d-b184-445a-bdfe-b4727456655a	200ml	DHB-0305-200ML	20000	\N	t	2026-07-16 15:15:32.74	2026-07-19 14:23:21.879	t
f929b545-1579-4891-bc23-3f0aca873dd8	27cb9ac7-885f-4658-8d5f-f6f16d855bb8	200ml	DHB-0306-200ML	20000	\N	t	2026-07-16 15:15:35.502	2026-07-19 14:23:25.275	t
cb49bd97-2115-4fe1-b36b-82bac85a7d0c	6ac269ec-1522-4180-8e5d-47d1243fac64	200ml	DHB-0307-200ML	20000	\N	t	2026-07-16 15:15:39.416	2026-07-19 14:23:29.252	t
cfd76ef3-16a3-48d3-8a3c-288e6b034bec	33b2e338-22d7-4c7e-983c-dad575a28c34	200ml	DHB-0309-200ML	20000	\N	t	2026-07-16 15:15:45.633	2026-07-19 14:23:37.547	t
40d11d6a-e9ed-4ad0-b172-877fad93edf8	8feb25c6-e728-4e24-b303-8defd279762b	200ml	DHB-0319-200ML	20000	\N	t	2026-07-16 15:16:19.85	2026-07-19 14:24:17.886	t
f44670dc-3972-4a75-9353-83a7d06302fd	e1bb7c06-78d1-4a29-9862-59271f078511	200ml	DHB-0320-200ML	20000	\N	t	2026-07-16 15:16:22.814	2026-07-19 14:24:21.476	t
399155ba-fff6-4969-96ec-6e28aaea8f46	c91f8af4-a006-4018-8c6b-2e4b1773cc62	200ml	DHB-0321-200ML	20000	\N	t	2026-07-16 15:16:25.978	2026-07-19 14:24:24.974	t
\.


--
-- Data for Name: RateLimitEvent; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."RateLimitEvent" (id, key, route, points, "expireAt", "createdAt") FROM stdin;
59684e87-6e3a-435d-bd3d-d57e316c104c	f7bebfcce81f7c8d29ba457af76cee2cb48787147c828896d1a6c26cb643163f	pos_checkout	1	2026-07-19 16:50:05.452	2026-07-19 15:50:05.651
a399238d-2a39-49fb-8674-c4be1a05177b	13ae67b536b35f09bf8fbcaead99d0be8ad2adbac4543c1f76697402e8c96df9	login	1	2026-07-19 16:57:43.543	2026-07-19 16:42:43.914
467ad017-2f31-4dbe-8436-8dc42fae5b42	1259a41934c379fc8994ed7e374c086b6ee80824acaa4f580c9f7592efe2d315	pos_checkout	1	2026-07-19 18:09:09.768	2026-07-19 17:09:09.971
9b25444f-9af6-48c9-b7bc-1ae00f4189dc	0fb02647cf08a41ffd1226da509d5cbc7282050ef3b40022b434e192a1b6a37b	login	1	2026-07-20 15:19:14.387	2026-07-20 15:04:14.772
85892ad5-9bd7-4fe8-acc2-d371262bc3e8	5690e0238510150adc2ed101079eaf6261835959a4e8f3b7b435bfc14f8dd34b	pos_checkout	1	2026-07-14 22:45:44.206	2026-07-14 21:45:44.814
f39a15a6-7937-4318-86bd-e42e1ffafb68	bfacdb5240cedd8c2fc916b33238dfe8712af360a8ea19ce8502957306792c5a	pos_checkout	1	2026-07-14 23:10:02.872	2026-07-14 22:10:03.242
848ffa63-cfb4-40f9-ada5-b7df6980e865	f47a6ae0fa776d8dace9703abaa38ea1ce0599cc3942f92b51320749d467f4ae	login	1	2026-07-15 06:27:51.18	2026-07-15 06:12:51.563
087b6aab-9a07-4809-b162-042d83c74550	eff8e7ca506627fe15dda5e0e512fcaad70b6d520f37cc76597fdb4f2d83a1a3	login	1	2026-07-15 08:52:42.871	2026-07-15 08:37:44.946
ff8490b4-47d2-4175-af51-12c030965223	0e0e12b677013015f64107df89d72cdde4f465d7bd7107812aedfb19632696da	login	1	2026-07-15 21:14:48.912	2026-07-15 20:59:50.43
c1f28edb-1112-497d-b79c-6aa458b719af	f7bebfcce81f7c8d29ba457af76cee2cb48787147c828896d1a6c26cb643163f	pos_checkout	1	2026-07-16 16:08:19.123	2026-07-16 15:08:19.313
b750dee7-098d-430f-bfa6-581a8b7e51d2	682972e2b768fc20e26121595e2cddc6d1dca5e946421fae8afad77cfb1df232	pos_checkout	1	2026-07-16 16:17:21.384	2026-07-16 15:17:21.584
4b050401-bd02-4e47-8e33-7e9f3e55c5b4	682972e2b768fc20e26121595e2cddc6d1dca5e946421fae8afad77cfb1df232	pos_checkout	1	2026-07-16 16:17:40.909	2026-07-16 15:17:42.127
c30d23a6-ab02-467f-b117-5b987ee558c6	682972e2b768fc20e26121595e2cddc6d1dca5e946421fae8afad77cfb1df232	pos_checkout	1	2026-07-16 16:36:16.068	2026-07-16 15:36:16.263
e37f9934-4130-4ab9-9dc5-eb055e79777e	682972e2b768fc20e26121595e2cddc6d1dca5e946421fae8afad77cfb1df232	pos_checkout	1	2026-07-16 17:13:55.641	2026-07-16 16:13:56.953
0bd4af5b-20f4-4528-83b2-39b8d74c06ab	682972e2b768fc20e26121595e2cddc6d1dca5e946421fae8afad77cfb1df232	pos_checkout	1	2026-07-16 17:18:56.139	2026-07-16 16:18:56.324
1591b64c-91b5-4e46-a40f-fdf10b472b31	5fd2b602aa514c995eaca78a189e089a47e4f1c72d860fb6f469eaa26f76cd0b	login	1	2026-07-16 18:30:15.485	2026-07-16 18:15:16.982
51b1fa6b-5a35-43a8-bd9a-40a332041fcc	5bab2835908ad23038bc7f4a1428008caeb5f34c65523f0af2e9a54e8bb1a605	login	1	2026-07-19 10:36:17.144	2026-07-19 10:21:18.656
b22e0be8-048a-4110-b9cb-2e69af43db8e	5bab2835908ad23038bc7f4a1428008caeb5f34c65523f0af2e9a54e8bb1a605	login	1	2026-07-19 10:36:27.507	2026-07-19 10:21:27.872
05ec9310-1e70-4730-9366-eb27fe89e108	46db698c4b4dbd83d0fcb88013d5e492931cc0d5e252d33c4b60ae77e2f5ddec	pos_checkout	1	2026-07-19 11:22:20.508	2026-07-19 10:22:20.71
15ebc0ea-8498-41a9-88b1-b5abdc90f894	4044bd47bb2412950aade508364bbc537af79241d3a594e4c55f0db03307461f	login	1	2026-07-19 15:14:03.08	2026-07-19 14:59:04.584
\.


--
-- Data for Name: Return; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Return" (id, "saleId", "employeeId", reason, "totalAmount", "createdAt", "approvedByEmployeeId", "refundMethod", "stockMovementRef") FROM stdin;
\.


--
-- Data for Name: ReturnItem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ReturnItem" (id, "returnId", "variantId", quantity, amount) FROM stdin;
\.


--
-- Data for Name: Role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Role" (id, name, description) FROM stdin;
92c1db3d-1bd7-49a7-ac08-aa3b223bdfea	Admin	\N
457e87e1-50cd-4dda-b108-ac460a1ed577	Cashier	\N
5eb877a4-75bc-4c89-92a4-c1384e3903d8	CASHIER	Cashier Role
\.


--
-- Data for Name: RolePermission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."RolePermission" ("roleId", "permissionId") FROM stdin;
92c1db3d-1bd7-49a7-ac08-aa3b223bdfea	66aa65d8-c177-4810-996a-6f533068ef98
92c1db3d-1bd7-49a7-ac08-aa3b223bdfea	b1a0875a-9523-4f96-98ea-864e1d6b2f65
92c1db3d-1bd7-49a7-ac08-aa3b223bdfea	924fc95e-c26e-4c39-b3f2-83af37dea0f8
92c1db3d-1bd7-49a7-ac08-aa3b223bdfea	2cc0b58e-f492-46dc-955c-4786b6f60512
92c1db3d-1bd7-49a7-ac08-aa3b223bdfea	6677f381-8430-4854-bc5d-e6576cc18e45
92c1db3d-1bd7-49a7-ac08-aa3b223bdfea	665e7916-6e00-4b1e-8bf7-ecb7354732da
457e87e1-50cd-4dda-b108-ac460a1ed577	2cc0b58e-f492-46dc-955c-4786b6f60512
\.


--
-- Data for Name: Sale; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Sale" (id, reference, "employeeId", "customerName", subtotal, tax, discount, total, status, source, "createdAt", "completedAt", "saleSource", "sellerEmailSnapshot", "sellerEmployeeCodeSnapshot", "sellerNameSnapshot", "sellerRoleSnapshot", "sessionId", "shiftId", "soldByEmployeeId", "terminalId", "idempotencyKey") FROM stdin;
9117a89a-a099-4677-954c-3c60178dcf31	POS-916B3DB2	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	عميل نقدي	15000	0	0	15000	COMPLETED	POS	2026-07-14 08:45:35.271	2026-07-14 08:45:35.245	POS	cashier@dahabperfume.local	\N	Local Cashier	Cashier	0b85fac82661d387a10063ed9425c3d6e2be9f4d3db60f882f8ea54b547d02ec	\N	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	\N	\N
b86d1e63-d6e4-4076-b133-d152aa587f7f	POS-64C111E4	41b50e80-2df9-4834-9042-f383be8ec7b0	عميل نقدي	25000	0	0	25000	COMPLETED	POS	2026-07-14 14:56:43.279	2026-07-14 14:56:43.255	POS	system@dahab.local	\N	System Admin	Admin	68e0b13c4ea47ac2e7f3a45e796b755f112cb50e3240bfd6f4ddf5e06ea905d9	\N	41b50e80-2df9-4834-9042-f383be8ec7b0	\N	\N
7b2bf7d8-c64d-4748-963b-b64194dad9d1	SALE-ORD-ORD-84DC4874	41b50e80-2df9-4834-9042-f383be8ec7b0	مممم	15000	0	0	18000	COMPLETED	STOREFRONT	2026-07-14 15:08:22.239	\N	POS	\N	\N	\N	\N	\N	\N	\N	\N	\N
eef54d1d-a399-42fe-92b9-ab3dc5dfccd9	POS-B9A91D2B	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	عميل نقدي	25000	0	0	25000	COMPLETED	POS	2026-07-14 21:45:52.738	2026-07-14 21:45:52.722	POS	cashier@dahabperfume.local	\N	Local Cashier	Cashier	81fdf8cdd96e12e635ef9d858da03f3a91afa03553073ad17b6660c84c1889e7	\N	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	\N	\N
5ff571f6-24c1-4312-bde6-0de366daa7b7	POS-36C3A8E6	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	عميل نقدي	10000	0	0	10000	COMPLETED	POS	2026-07-14 22:10:07.314	2026-07-14 22:10:07.281	POS	cashier@dahabperfume.local	\N	Local Cashier	Cashier	0413d547869d694b35660a254b4ca412b9458cd16210834f320272b64c487c95	\N	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	\N	\N
f8a85ca9-6054-49bf-9213-eaa3a05ea788	SALE-ORD-ORD-D7268C78	41b50e80-2df9-4834-9042-f383be8ec7b0	نايف 	25000	0	0	28000	COMPLETED	STOREFRONT	2026-07-16 15:06:01.651	\N	POS	\N	\N	\N	\N	\N	\N	\N	\N	\N
a3c69d75-536f-4c89-b707-84e40266d169	POS-30292205	41b50e80-2df9-4834-9042-f383be8ec7b0	عميل نقدي	12000	0	0	12000	COMPLETED	POS	2026-07-16 15:08:21.963	2026-07-16 15:08:21.943	POS	system@dahab.local	\N	System Admin	Admin	5a366ce26004109a126d5f75d0875ae64f917bb43daa6286ada57c37ebcc52a3	\N	41b50e80-2df9-4834-9042-f383be8ec7b0	\N	\N
c840f4a4-4a2a-41a4-b68f-0b9192119357	POS-5F05730D	41b50e80-2df9-4834-9042-f383be8ec7b0	عميل نقدي	32000	0	0	32000	COMPLETED	POS	2026-07-16 15:17:24.989	2026-07-16 15:17:24.966	POS	system@dahab.local	\N	System Admin	Admin	a16e3c10ce6bf398ae37aba792fb7d68303dc6573356f46fe28fb833ece28e9d	\N	41b50e80-2df9-4834-9042-f383be8ec7b0	\N	\N
b6a55738-bb90-4ffe-8c3b-3f820f2c5314	POS-D58202CE	41b50e80-2df9-4834-9042-f383be8ec7b0	عميل نقدي	20000	0	0	20000	COMPLETED	POS	2026-07-16 15:17:44.887	2026-07-16 15:17:44.861	POS	system@dahab.local	\N	System Admin	Admin	a16e3c10ce6bf398ae37aba792fb7d68303dc6573356f46fe28fb833ece28e9d	\N	41b50e80-2df9-4834-9042-f383be8ec7b0	\N	\N
2e17e59a-8b3f-4c6f-90ba-d0dd28da55ea	POS-47235033	41b50e80-2df9-4834-9042-f383be8ec7b0	عميل نقدي	20000	0	0	20000	COMPLETED	POS	2026-07-16 15:36:18.997	2026-07-16 15:36:18.984	POS	system@dahab.local	\N	System Admin	Admin	a16e3c10ce6bf398ae37aba792fb7d68303dc6573356f46fe28fb833ece28e9d	\N	41b50e80-2df9-4834-9042-f383be8ec7b0	\N	\N
ed990345-87e9-4483-97df-63d6845eea5c	POS-F8577912	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	عميل نقدي	40000	0	0	40000	COMPLETED	POS	2026-07-16 16:18:59.688	2026-07-16 16:18:59.671	POS	cashier@dahabperfume.local	\N	Local Cashier	Cashier	e412448f70dac01c2cf5bde537157a9a8613e9e97cced6ce633ad4cd35e11f81	\N	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	\N	\N
53b4f3a4-5860-4557-a438-dce24edbae10	POS-259C6BEB	41b50e80-2df9-4834-9042-f383be8ec7b0	عميل نقدي	20000	0	0	20000	COMPLETED	POS	2026-07-19 10:22:23.528	2026-07-19 10:22:23.511	POS	system@dahab.local	\N	System Admin	Admin	1900361f584c25d1364a6c0888b4e75f522875df57a5c61b037b5292123aafdc	\N	41b50e80-2df9-4834-9042-f383be8ec7b0	\N	\N
b9408e69-1fbc-4219-963f-b4ac4dab06e9	POS-ACEE0EDE	41b50e80-2df9-4834-9042-f383be8ec7b0	عميل نقدي	6500	0	1500	6500	COMPLETED	POS	2026-07-19 15:50:08.457	2026-07-19 15:50:08.445	POS	system@dahab.local	\N	System Admin	Admin	cbcae173b15d9707c3fdf8d6aa766989e0fab5767060d9943559750ab43106d9	\N	41b50e80-2df9-4834-9042-f383be8ec7b0	\N	\N
bb83c1fb-9116-4c41-b815-e5eba79167a1	POS-57B0020B	41b50e80-2df9-4834-9042-f383be8ec7b0	عميل نقدي	20000	0	0	20000	COMPLETED	POS	2026-07-19 17:09:12.821	2026-07-19 17:09:12.799	POS	system@dahab.local	\N	System Admin	Admin	6691785c73c80289e43b568baa2a303df088b2bf01722444b31222659b8de9d9	\N	41b50e80-2df9-4834-9042-f383be8ec7b0	\N	\N
\.


--
-- Data for Name: SaleItem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."SaleItem" (id, "saleId", "variantId", sku, name, size, quantity, "unitPrice", total) FROM stdin;
ee27b9ce-e4ec-4087-91d8-033c54ee77b3	f8a85ca9-6054-49bf-9213-eaa3a05ea788	c42627a8-dfd4-464b-852f-22e54f1a1c08	DHB-0068-50ML	تريزور ميد نايت لانوي	50ml	1	10000	10000
2a9b3c95-44ea-412a-a450-955163acb642	f8a85ca9-6054-49bf-9213-eaa3a05ea788	9147630c-0d25-47d0-8b74-6692535bbb48	DHB-0068-100ML	تريزور ميد نايت لانوي	100ml	1	15000	15000
b0a80ace-0212-4b4c-84fc-bdbdc350225f	a3c69d75-536f-4c89-b707-84e40266d169	ddcdbbd4-bb30-45e1-b8d2-bea5b3fc5aa1	DHB-0111-100ML	CH	100ml	1	12000	12000
f59424ce-424f-476f-85b9-5915f694a9a1	c840f4a4-4a2a-41a4-b68f-0b9192119357	69c1500f-8ea7-48f7-9994-76e6c25816e5	DHB-0017-100ML	ان وايت	100ml	1	12000	12000
7b4c2b3f-05ab-4d18-93e0-152c93cce6d9	c840f4a4-4a2a-41a4-b68f-0b9192119357	611e7b1b-2f9b-4559-832e-679a667fc9a4	DHB-0017-200ML	ان وايت	200ml	1	20000	20000
185afd57-001f-4208-b422-7e5bdf42f52a	b6a55738-bb90-4ffe-8c3b-3f820f2c5314	611e7b1b-2f9b-4559-832e-679a667fc9a4	DHB-0017-200ML	ان وايت	200ml	1	20000	20000
e9533ec6-6884-47ad-95d6-55f0219e8963	2e17e59a-8b3f-4c6f-90ba-d0dd28da55ea	acefca3b-3aa7-4d98-9079-8cbbd2125557	DHB-0009-200ML	الور شانيل	200ml	1	20000	20000
92293ab2-b73c-4f87-8111-205d685b6930	ed990345-87e9-4483-97df-63d6845eea5c	da0d2075-ad0e-4766-a7dd-7ee57da08e3d	DHB-0012-200ML	الي صعب بيرفيوم	200ml	1	20000	20000
a899b8f9-33b7-4581-851b-08c3797679ea	ed990345-87e9-4483-97df-63d6845eea5c	2c542e01-cd78-4199-bd3f-1c6b4688e5af	DHB-0015-200ML	انج دي مون	200ml	1	20000	20000
836599de-5b79-4a2d-9eab-0ffe2d3296b2	53b4f3a4-5860-4557-a438-dce24edbae10	15a4009d-bd39-4325-9cc3-8ac12156f799	DHB-0007-200ML	اتيرنتي	200ml	1	20000	20000
9a8aa6a1-e860-4e03-a56a-78eea533f43c	b9408e69-1fbc-4219-963f-b4ac4dab06e9	a5629bea-4771-4a39-8db2-be7a1f8e806f	DHB-0043-50ML	بي ديليشيس	50ml	1	8000	8000
63923af1-c83a-4ebd-82e2-d5480008221b	bb83c1fb-9116-4c41-b815-e5eba79167a1	ecd17031-1dc1-4593-9b67-0db2efad8d92	DHB-0048-200ML	بوس فيمي	200ml	1	20000	20000
\.


--
-- Data for Name: Season; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Season" (id, name) FROM stdin;
28c9117e-5e1b-489a-828e-9813acc326ff	صيفي
9d676753-b84f-4ef7-84b8-1ec160e8e9a7	شتوي
3ef45d89-f354-4984-a4d8-308b605a9b0e	كل المواسم
\.


--
-- Data for Name: Session; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Session" (id, "employeeId", "expiresAt", "createdAt", "lastActivityAt") FROM stdin;
69a8a8cc9030cd952eb6e08e954ba54c1fa42c9508876657c49810e51a926d53	41b50e80-2df9-4834-9042-f383be8ec7b0	2026-07-23 16:16:51.136	2026-07-16 16:14:21.366	2026-07-16 16:16:51.136
68e0b13c4ea47ac2e7f3a45e796b755f112cb50e3240bfd6f4ddf5e06ea905d9	41b50e80-2df9-4834-9042-f383be8ec7b0	2026-07-21 15:09:33.069	2026-07-14 14:44:13.175	2026-07-14 15:09:33.069
07e1ca23295eabc1541933b4ea0682f19353d34fa33438a32569e1ab0168cc34	41b50e80-2df9-4834-9042-f383be8ec7b0	2026-07-21 22:09:14.737	2026-07-14 22:08:09.434	2026-07-14 22:09:14.737
23ad8a79306bd690718ea38bb39c1409d094ba0ccd60455f8a015a3f02dfd0b1	4c5a899c-e6e8-45bb-9829-3db589243422	2026-07-22 08:37:18.63	2026-07-15 08:22:19.838	2026-07-15 08:37:18.63
fc0c0ea09ed647b3e8f8cc9e67f4ff10681943b64bb08b46dc9657b53cb14eb1	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	2026-07-15 23:37:45.959	2026-07-15 08:37:45.96	2026-07-15 08:37:48.841
55c2387138bd618de8e10790e2537d6a1dce7c11cdda4956cae025f88d5addfa	41b50e80-2df9-4834-9042-f383be8ec7b0	2026-07-22 06:14:56.728	2026-07-15 06:12:53.296	2026-07-15 06:14:56.728
3aa59102b5f3f4aafe316433f6c96551d7aa26fec528e4380bbb3691ed6917aa	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	2026-07-15 22:54:49.78	2026-07-15 07:54:49.783	2026-07-15 07:55:20.816
e412448f70dac01c2cf5bde537157a9a8613e9e97cced6ce633ad4cd35e11f81	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	2026-07-17 07:16:59.634	2026-07-16 16:16:59.637	2026-07-16 18:13:40.88
45f7007b9a065df1dac0368439266119c13e6844a1c5be6ae4c7cbef023cbba4	41b50e80-2df9-4834-9042-f383be8ec7b0	2026-07-26 14:37:37.786	2026-07-19 14:37:10.377	2026-07-19 14:37:37.786
bc5be50d54b21587f1cdb275b2613979190324db89229aaa69f268e8989d47f0	41b50e80-2df9-4834-9042-f383be8ec7b0	2026-07-21 20:44:33.781	2026-07-14 20:44:26.891	2026-07-14 20:44:33.782
e3cc061e96b3ab2c5b82565e0bd12fa4b5be120f891e872413d2fb8468e6112d	41b50e80-2df9-4834-9042-f383be8ec7b0	2026-07-26 14:37:44.42	2026-07-19 14:37:44.422	2026-07-19 14:37:44.422
3504f546f766a4b696a8deb7dc76542cd2fe64a4502c0b7af14e124c2f1b5eb4	41b50e80-2df9-4834-9042-f383be8ec7b0	2026-07-27 15:14:01.375	2026-07-20 15:04:15.542	2026-07-20 15:14:01.375
329c334a3ae7cd9cabc23495d019285cba425f7d7994f4cf9cf8826b6cfbd693	41b50e80-2df9-4834-9042-f383be8ec7b0	2026-07-26 12:35:35.842	2026-07-19 12:35:32.409	2026-07-19 12:35:35.842
e782583481de429c0cc5ee70406de8fdcf8d3cafef2b0adfc5a1ef68b6295d54	41b50e80-2df9-4834-9042-f383be8ec7b0	2026-07-23 18:30:47.678	2026-07-16 18:15:17.776	2026-07-16 18:30:47.678
111a96cca116299993e578d5467c89c91df09dd048605229038b8a82a28d25f4	41b50e80-2df9-4834-9042-f383be8ec7b0	2026-07-26 15:40:05.331	2026-07-19 15:33:34.068	2026-07-19 15:40:05.331
23861ba23e3fa234c8ad300ed4c633181a0304180dbb4902af4351c63bf47461	41b50e80-2df9-4834-9042-f383be8ec7b0	2026-07-26 15:00:30.319	2026-07-19 14:59:05.383	2026-07-19 15:00:30.319
98ae4a79e96da00c326fea5200be5e147ec18f002c2268228dbc924263e9ef44	a772e23b-4a8d-4ace-94dc-bf40a9291f2e	2026-07-20 06:41:27.87	2026-07-19 15:41:27.872	2026-07-19 15:41:30.122
\.


--
-- Data for Name: Shift; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Shift" (id, "employeeId", "openingCashFils", "expectedCashFils", "actualCashFils", "varianceFils", "cardRecordedFils", "refundFils", status, notes, "terminalId", "approvedByEmployeeId", "openedAt", "closedAt") FROM stdin;
\.


--
-- Data for Name: ShippingZone; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."ShippingZone" (id, "nameAr", "nameEn", fee, "estimatedDeliveryTime", "isEnabled", "freeShippingThreshold") FROM stdin;
4ebb5588-6650-479b-9d73-c642724f9fc5	عمان	Amman	3000	24 hours	t	\N
e6e5fe26-9fa3-41a6-85b3-07be55ce2a24	إربد	Irbid	3000	24-48 hours	t	\N
b67d5af7-6438-4594-a331-41519700a977	الزرقاء	Zarqa	3000	24 hours	t	\N
e0d10aa9-ed59-4cac-b7e2-600a21009232	المفرق	Mafraq	4000	48 hours	t	\N
b529ef77-a776-4938-b96e-b71ac816c26d	عجلون	Ajloun	4000	48 hours	t	\N
c0bbbab3-bea8-4c08-896f-a876b89e01b9	جرش	Jerash	4000	48 hours	t	\N
d3ad8b05-975d-4a66-9db0-f862fe640a36	مادبا	Madaba	3000	24-48 hours	t	\N
1902e68f-d726-4f0e-bdd5-82fffb0f926d	البلقاء	Balqa	3000	24-48 hours	t	\N
da59b736-82b4-4cfd-9cf7-1318a2c3fc8b	الكرك	Karak	5000	48-72 hours	t	\N
0480eb8c-340f-4cdb-b068-843122c7c2dd	الطفيلة	Tafilah	5000	48-72 hours	t	\N
9c339d62-04be-4433-9794-90160aeed5bd	معان	Maan	5000	48-72 hours	t	\N
1e9f8bcd-80de-4854-a96c-c53bf0285868	العقبة	Aqaba	5000	48-72 hours	t	\N
\.


--
-- Data for Name: SiteSettings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."SiteSettings" (key, value) FROM stdin;
whatsapp_number	{"number":"962785050655"}
announcement_bar	{"textAr":"توصيل مجاني للطلبات فوق 50 د.أ","textEn":"Free delivery for orders above 50 JOD"}
homepage_content	{"heroTitleAr":"حين تُترجم الفخامة إلى عطر","heroTitleEn":"When Luxury Translates to Fragrance","heroDescAr":"دهب للعطور.. نفحات مختارة بعناية من الشرق، لترافق هويتك وتُشعرك بالأصالة والتميز.","heroDescEn":"Dahab Perfumes... carefully selected notes from the East, to accompany your identity and make you feel authentic."}
brand_story	{"titleAr":"عن دهب للعطور","titleEn":"About Dahab Perfumes","contentAr":"دهب للعطور.. دار عطور شرقية أصيلة تأسست لتقدم فخامة تناسب شخصيتك وهويتك العطرية الفريدة.","contentEn":"Dahab Perfumes... an authentic oriental fragrance house established to present luxury matching your unique personality."}
store_location_info	{"addressAr":"عمان، الأردن - شارع مكة","addressEn":"Amman, Jordan - Mecca St","hoursAr":"10:00 ص - 10:00 م","hoursEn":"10:00 AM - 10:00 PM","phone":"+962785050655"}
social_links	{"instagram":"https://instagram.com/dahab","facebook":"https://facebook.com/dahab"}
global_size_prices	{"50ml":8000,"100ml":12000,"200ml":20000}
inventory_settings	{"lowStockThreshold":0.05}
\.


--
-- Data for Name: StockAdjustment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."StockAdjustment" (id, sku, "oldStock", "newStock", reason, "createdAt") FROM stdin;
\.


--
-- Data for Name: StoreLocationSettings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."StoreLocationSettings" (id, "storeName", "addressAr", "addressEn", latitude, longitude, "mapPlaceUrl", "mapEmbedUrl", phone, whatsapp, "openingHours", "locationSectionEnabled", "directionsButtonEnabled", "mapZoom", "mapLabelAr", "mapLabelEn", "sectionOrder", "createdAt", "updatedAt") FROM stdin;
default	Dahab Perfumes	عمان، وسط البلد، شارع الأمير محمد	Amman, Downtown, Prince Mohammed St	31.9520646	35.9316391	https://maps.app.goo.gl/LAELMNn1uUe95JBN9	https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3384.811565576135!2d35.9334!3d31.9522!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x151b5f0022378dd7%3A0x6b4db63f684dc3cf!2sDahab%20Perfumes!5e0!3m2!1sen!2sjo!4v1700000000000!5m2!1sen!2sjo	+962790000000	+962790000000	10:00 AM - 11:00 PM	t	t	18	\N	\N	10	2026-07-14 07:36:12.385	2026-07-14 17:32:47.107
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
18f0ee9a-9412-488f-b078-388a96bc92eb	1a621c582b2a10aa852c9810ca39dcbb2d199a2a0adda4571e0c4850445f45b7	2026-07-13 19:17:27.400159+00	20260712180205_add_liquid_inventory_and_counts	\N	\N	2026-07-13 19:17:19.84283+00	1
065a0783-d6b8-4048-b1e3-014589504026	dc0c175e0ac3d314997a1471b7ca40211f1a2645db121e335b4d48d47e27f345	2026-07-13 19:16:53.595649+00	20260712121400_init_full_erp	\N	\N	2026-07-13 19:16:25.966167+00	1
d450dd0f-c696-40e0-9850-499b42464fdb	0a0c3faea7532f0de6256adeb2ae84471b7fdb8c80f3a76512fcd9b648307360	2026-07-13 19:16:55.562183+00	20260712121500_add_shipping_zones	\N	\N	2026-07-13 19:16:54.116133+00	1
19697de7-076a-4aca-ae1b-4561ca9e590c	1aac1a74fcbe1a631d6dd9032db7e1e08bc7c447ec744a32c19d7bb0a01b4160	2026-07-13 19:16:57.435972+00	20260712121600_add_lockout_fields	\N	\N	2026-07-13 19:16:56.128335+00	1
99678644-e5cd-496e-9ff3-2433a1b9354d	7de4c0b88fc2c04b5ebee259b45cedfdf05b5be871d67b4e156787ea51cc8fbd	2026-07-13 19:16:59.629005+00	20260712121700_add_idempotency_to_order	\N	\N	2026-07-13 19:16:57.962931+00	1
8e574a66-bcd6-4d60-bd27-e526c2d234e6	99a060eddd4b6869ca0d0f249d5bc1f61c8dc95f95b60118a0521df04324dd6f	2026-07-13 19:17:01.600354+00	20260712121800_add_review_and_stock_status_fields	\N	\N	2026-07-13 19:17:00.146833+00	1
1730d366-c289-4baf-a794-9a0ba8bb487f	d2363530d17c4b9f9d4da6b45e38e7f5c392a55521ad8be2d2732cf9cde38ba4	2026-07-13 19:17:03.852776+00	20260712133140_add_tax_settings_and_invoice_snapshots	\N	\N	2026-07-13 19:17:02.121894+00	1
d270f92f-55c1-4871-9b05-cee70b7a75e9	4f16e8526abd3866f5a8b69bef232f12495bd254f9cf2ddcdbcd8fdba5dd6725	2026-07-13 19:17:06.364123+00	20260712133200_link_invoice_to_order	\N	\N	2026-07-13 19:17:04.374665+00	1
d60847c8-f942-4964-8f85-2379999efb0b	359d608f5dd44288de7b5c39c3deee2c2178641bafd060ea7ca927104fea6366	2026-07-13 19:17:08.833961+00	20260712134706_add_accounting_integrity_fields	\N	\N	2026-07-13 19:17:06.887+00	1
4284590a-3d2d-4bb9-a227-cba63c89ee6f	81f1d854b3a6b4e92cff4aace167f723df74655b9432925d6572ba129233415b	2026-07-13 19:17:10.783296+00	20260712165500_rename_invoice_fields_to_fils	\N	\N	2026-07-13 19:17:09.354955+00	1
0579d4f8-d68c-422d-b8f7-1228a2fe7f9f	3e910126aad119d8330b451b8d8f3366694f09bf17913da0d4b6e3bf3c724dcf	2026-07-13 19:17:13.471425+00	20260712171500_add_employee_permissions_and_pins	\N	\N	2026-07-13 19:17:11.335298+00	1
983c3908-e951-4cb7-bdde-8ed49247583d	b0dccdf19221ff7f5853ff2ae4eafb7c5f7af8f6ef46aeb3f283e0847771d2aa	2026-07-13 19:17:17.3268+00	20260712173000_add_advanced_security_and_pos_models	\N	\N	2026-07-13 19:17:13.993345+00	1
32a64567-2549-463e-9074-9d487110ae9b	90df62c8d31e176c7e231afc0ffda61d495b7dc6971b0d8c8a330a46ad8de784	2026-07-13 19:17:19.317627+00	20260712173100_add_session_last_activity	\N	\N	2026-07-13 19:17:17.848202+00	1
\.


--
-- Name: Accord Accord_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Accord"
    ADD CONSTRAINT "Accord_pkey" PRIMARY KEY (id);


--
-- Name: AuditLog AuditLog_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."AuditLog"
    ADD CONSTRAINT "AuditLog_pkey" PRIMARY KEY (id);


--
-- Name: Category Category_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Category"
    ADD CONSTRAINT "Category_pkey" PRIMARY KEY (id);


--
-- Name: EmployeePermission EmployeePermission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."EmployeePermission"
    ADD CONSTRAINT "EmployeePermission_pkey" PRIMARY KEY ("employeeId", "permissionId");


--
-- Name: Employee Employee_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Employee"
    ADD CONSTRAINT "Employee_pkey" PRIMARY KEY (id);


--
-- Name: FragranceFamily FragranceFamily_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."FragranceFamily"
    ADD CONSTRAINT "FragranceFamily_pkey" PRIMARY KEY (id);


--
-- Name: Gender Gender_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Gender"
    ADD CONSTRAINT "Gender_pkey" PRIMARY KEY (id);


--
-- Name: GlobalPricingSettings GlobalPricingSettings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."GlobalPricingSettings"
    ADD CONSTRAINT "GlobalPricingSettings_pkey" PRIMARY KEY (id);


--
-- Name: HeldSale HeldSale_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."HeldSale"
    ADD CONSTRAINT "HeldSale_pkey" PRIMARY KEY (id);


--
-- Name: HomepageHeroCarouselSettings HomepageHeroCarouselSettings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."HomepageHeroCarouselSettings"
    ADD CONSTRAINT "HomepageHeroCarouselSettings_pkey" PRIMARY KEY (id);


--
-- Name: HomepageHeroSlide HomepageHeroSlide_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."HomepageHeroSlide"
    ADD CONSTRAINT "HomepageHeroSlide_pkey" PRIMARY KEY (id);


--
-- Name: ImportJobRow ImportJobRow_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ImportJobRow"
    ADD CONSTRAINT "ImportJobRow_pkey" PRIMARY KEY (id);


--
-- Name: ImportJob ImportJob_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ImportJob"
    ADD CONSTRAINT "ImportJob_pkey" PRIMARY KEY (id);


--
-- Name: InventoryMovement InventoryMovement_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."InventoryMovement"
    ADD CONSTRAINT "InventoryMovement_pkey" PRIMARY KEY (id);


--
-- Name: Invoice Invoice_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Invoice"
    ADD CONSTRAINT "Invoice_pkey" PRIMARY KEY (id);


--
-- Name: LoginAttempt LoginAttempt_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."LoginAttempt"
    ADD CONSTRAINT "LoginAttempt_pkey" PRIMARY KEY (id);


--
-- Name: OrderItem OrderItem_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."OrderItem"
    ADD CONSTRAINT "OrderItem_pkey" PRIMARY KEY (id);


--
-- Name: OrderStatusHistory OrderStatusHistory_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."OrderStatusHistory"
    ADD CONSTRAINT "OrderStatusHistory_pkey" PRIMARY KEY (id);


--
-- Name: Order Order_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "Order_pkey" PRIMARY KEY (id);


--
-- Name: Payment Payment_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Payment"
    ADD CONSTRAINT "Payment_pkey" PRIMARY KEY (id);


--
-- Name: PendingMfaChallenge PendingMfaChallenge_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."PendingMfaChallenge"
    ADD CONSTRAINT "PendingMfaChallenge_pkey" PRIMARY KEY (id);


--
-- Name: Permission Permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Permission"
    ADD CONSTRAINT "Permission_pkey" PRIMARY KEY (id);


--
-- Name: ProductAccord ProductAccord_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ProductAccord"
    ADD CONSTRAINT "ProductAccord_pkey" PRIMARY KEY ("productId", "accordId");


--
-- Name: ProductImage ProductImage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ProductImage"
    ADD CONSTRAINT "ProductImage_pkey" PRIMARY KEY (id);


--
-- Name: ProductNote ProductNote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ProductNote"
    ADD CONSTRAINT "ProductNote_pkey" PRIMARY KEY (id);


--
-- Name: ProductVariant ProductVariant_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ProductVariant"
    ADD CONSTRAINT "ProductVariant_pkey" PRIMARY KEY (id);


--
-- Name: Product Product_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_pkey" PRIMARY KEY (id);


--
-- Name: RateLimitEvent RateLimitEvent_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."RateLimitEvent"
    ADD CONSTRAINT "RateLimitEvent_pkey" PRIMARY KEY (id);


--
-- Name: ReturnItem ReturnItem_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ReturnItem"
    ADD CONSTRAINT "ReturnItem_pkey" PRIMARY KEY (id);


--
-- Name: Return Return_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Return"
    ADD CONSTRAINT "Return_pkey" PRIMARY KEY (id);


--
-- Name: RolePermission RolePermission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."RolePermission"
    ADD CONSTRAINT "RolePermission_pkey" PRIMARY KEY ("roleId", "permissionId");


--
-- Name: Role Role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Role"
    ADD CONSTRAINT "Role_pkey" PRIMARY KEY (id);


--
-- Name: SaleItem SaleItem_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."SaleItem"
    ADD CONSTRAINT "SaleItem_pkey" PRIMARY KEY (id);


--
-- Name: Sale Sale_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Sale"
    ADD CONSTRAINT "Sale_pkey" PRIMARY KEY (id);


--
-- Name: Season Season_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Season"
    ADD CONSTRAINT "Season_pkey" PRIMARY KEY (id);


--
-- Name: Session Session_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Session"
    ADD CONSTRAINT "Session_pkey" PRIMARY KEY (id);


--
-- Name: Shift Shift_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Shift"
    ADD CONSTRAINT "Shift_pkey" PRIMARY KEY (id);


--
-- Name: ShippingZone ShippingZone_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ShippingZone"
    ADD CONSTRAINT "ShippingZone_pkey" PRIMARY KEY (id);


--
-- Name: SiteSettings SiteSettings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."SiteSettings"
    ADD CONSTRAINT "SiteSettings_pkey" PRIMARY KEY (key);


--
-- Name: StockAdjustment StockAdjustment_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."StockAdjustment"
    ADD CONSTRAINT "StockAdjustment_pkey" PRIMARY KEY (id);


--
-- Name: StoreLocationSettings StoreLocationSettings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."StoreLocationSettings"
    ADD CONSTRAINT "StoreLocationSettings_pkey" PRIMARY KEY (id);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: Accord_name_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "Accord_name_key" ON public."Accord" USING btree (name);


--
-- Name: Category_slug_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "Category_slug_key" ON public."Category" USING btree (slug);


--
-- Name: Employee_email_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "Employee_email_key" ON public."Employee" USING btree (email);


--
-- Name: FragranceFamily_name_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "FragranceFamily_name_key" ON public."FragranceFamily" USING btree (name);


--
-- Name: Gender_name_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "Gender_name_key" ON public."Gender" USING btree (name);


--
-- Name: HomepageHeroSlide_displayOrder_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "HomepageHeroSlide_displayOrder_idx" ON public."HomepageHeroSlide" USING btree ("displayOrder");


--
-- Name: HomepageHeroSlide_endsAt_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "HomepageHeroSlide_endsAt_idx" ON public."HomepageHeroSlide" USING btree ("endsAt");


--
-- Name: HomepageHeroSlide_isEnabled_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "HomepageHeroSlide_isEnabled_idx" ON public."HomepageHeroSlide" USING btree ("isEnabled");


--
-- Name: HomepageHeroSlide_startsAt_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "HomepageHeroSlide_startsAt_idx" ON public."HomepageHeroSlide" USING btree ("startsAt");


--
-- Name: Invoice_number_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "Invoice_number_key" ON public."Invoice" USING btree (number);


--
-- Name: Invoice_orderId_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "Invoice_orderId_key" ON public."Invoice" USING btree ("orderId");


--
-- Name: Invoice_saleId_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "Invoice_saleId_key" ON public."Invoice" USING btree ("saleId");


--
-- Name: Order_idempotencyKey_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "Order_idempotencyKey_key" ON public."Order" USING btree ("idempotencyKey");


--
-- Name: Order_reference_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "Order_reference_key" ON public."Order" USING btree (reference);


--
-- Name: PendingMfaChallenge_employeeId_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "PendingMfaChallenge_employeeId_key" ON public."PendingMfaChallenge" USING btree ("employeeId");


--
-- Name: PendingMfaChallenge_token_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "PendingMfaChallenge_token_key" ON public."PendingMfaChallenge" USING btree (token);


--
-- Name: Permission_action_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "Permission_action_key" ON public."Permission" USING btree (action);


--
-- Name: ProductVariant_sku_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "ProductVariant_sku_idx" ON public."ProductVariant" USING btree (sku);


--
-- Name: ProductVariant_sku_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "ProductVariant_sku_key" ON public."ProductVariant" USING btree (sku);


--
-- Name: Product_sku_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "Product_sku_key" ON public."Product" USING btree (sku);


--
-- Name: Product_slug_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "Product_slug_key" ON public."Product" USING btree (slug);


--
-- Name: Role_name_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "Role_name_key" ON public."Role" USING btree (name);


--
-- Name: Sale_idempotencyKey_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "Sale_idempotencyKey_key" ON public."Sale" USING btree ("idempotencyKey");


--
-- Name: Sale_reference_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "Sale_reference_key" ON public."Sale" USING btree (reference);


--
-- Name: Season_name_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "Season_name_key" ON public."Season" USING btree (name);


--
-- Name: AuditLog AuditLog_employeeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."AuditLog"
    ADD CONSTRAINT "AuditLog_employeeId_fkey" FOREIGN KEY ("employeeId") REFERENCES public."Employee"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: EmployeePermission EmployeePermission_employeeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."EmployeePermission"
    ADD CONSTRAINT "EmployeePermission_employeeId_fkey" FOREIGN KEY ("employeeId") REFERENCES public."Employee"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: EmployeePermission EmployeePermission_permissionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."EmployeePermission"
    ADD CONSTRAINT "EmployeePermission_permissionId_fkey" FOREIGN KEY ("permissionId") REFERENCES public."Permission"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Employee Employee_roleId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Employee"
    ADD CONSTRAINT "Employee_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES public."Role"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: HeldSale HeldSale_employeeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."HeldSale"
    ADD CONSTRAINT "HeldSale_employeeId_fkey" FOREIGN KEY ("employeeId") REFERENCES public."Employee"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: HomepageHeroSlide HomepageHeroSlide_categoryId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."HomepageHeroSlide"
    ADD CONSTRAINT "HomepageHeroSlide_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES public."Category"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: HomepageHeroSlide HomepageHeroSlide_productId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."HomepageHeroSlide"
    ADD CONSTRAINT "HomepageHeroSlide_productId_fkey" FOREIGN KEY ("productId") REFERENCES public."Product"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: ImportJobRow ImportJobRow_jobId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ImportJobRow"
    ADD CONSTRAINT "ImportJobRow_jobId_fkey" FOREIGN KEY ("jobId") REFERENCES public."ImportJob"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ImportJob ImportJob_employeeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ImportJob"
    ADD CONSTRAINT "ImportJob_employeeId_fkey" FOREIGN KEY ("employeeId") REFERENCES public."Employee"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: InventoryMovement InventoryMovement_employeeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."InventoryMovement"
    ADD CONSTRAINT "InventoryMovement_employeeId_fkey" FOREIGN KEY ("employeeId") REFERENCES public."Employee"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Invoice Invoice_orderId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Invoice"
    ADD CONSTRAINT "Invoice_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES public."Order"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Invoice Invoice_saleId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Invoice"
    ADD CONSTRAINT "Invoice_saleId_fkey" FOREIGN KEY ("saleId") REFERENCES public."Sale"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: LoginAttempt LoginAttempt_employeeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."LoginAttempt"
    ADD CONSTRAINT "LoginAttempt_employeeId_fkey" FOREIGN KEY ("employeeId") REFERENCES public."Employee"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: OrderItem OrderItem_orderId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."OrderItem"
    ADD CONSTRAINT "OrderItem_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES public."Order"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: OrderItem OrderItem_productId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."OrderItem"
    ADD CONSTRAINT "OrderItem_productId_fkey" FOREIGN KEY ("productId") REFERENCES public."Product"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: OrderStatusHistory OrderStatusHistory_orderId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."OrderStatusHistory"
    ADD CONSTRAINT "OrderStatusHistory_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES public."Order"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Payment Payment_saleId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Payment"
    ADD CONSTRAINT "Payment_saleId_fkey" FOREIGN KEY ("saleId") REFERENCES public."Sale"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: PendingMfaChallenge PendingMfaChallenge_employeeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."PendingMfaChallenge"
    ADD CONSTRAINT "PendingMfaChallenge_employeeId_fkey" FOREIGN KEY ("employeeId") REFERENCES public."Employee"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ProductAccord ProductAccord_accordId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ProductAccord"
    ADD CONSTRAINT "ProductAccord_accordId_fkey" FOREIGN KEY ("accordId") REFERENCES public."Accord"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ProductAccord ProductAccord_productId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ProductAccord"
    ADD CONSTRAINT "ProductAccord_productId_fkey" FOREIGN KEY ("productId") REFERENCES public."Product"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ProductImage ProductImage_productId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ProductImage"
    ADD CONSTRAINT "ProductImage_productId_fkey" FOREIGN KEY ("productId") REFERENCES public."Product"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ProductNote ProductNote_productId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ProductNote"
    ADD CONSTRAINT "ProductNote_productId_fkey" FOREIGN KEY ("productId") REFERENCES public."Product"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ProductVariant ProductVariant_productId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ProductVariant"
    ADD CONSTRAINT "ProductVariant_productId_fkey" FOREIGN KEY ("productId") REFERENCES public."Product"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Product Product_categoryId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES public."Category"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Product Product_familyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_familyId_fkey" FOREIGN KEY ("familyId") REFERENCES public."FragranceFamily"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Product Product_genderId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_genderId_fkey" FOREIGN KEY ("genderId") REFERENCES public."Gender"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Product Product_seasonId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_seasonId_fkey" FOREIGN KEY ("seasonId") REFERENCES public."Season"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: ReturnItem ReturnItem_returnId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ReturnItem"
    ADD CONSTRAINT "ReturnItem_returnId_fkey" FOREIGN KEY ("returnId") REFERENCES public."Return"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ReturnItem ReturnItem_variantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ReturnItem"
    ADD CONSTRAINT "ReturnItem_variantId_fkey" FOREIGN KEY ("variantId") REFERENCES public."ProductVariant"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Return Return_employeeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Return"
    ADD CONSTRAINT "Return_employeeId_fkey" FOREIGN KEY ("employeeId") REFERENCES public."Employee"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Return Return_saleId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Return"
    ADD CONSTRAINT "Return_saleId_fkey" FOREIGN KEY ("saleId") REFERENCES public."Sale"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: RolePermission RolePermission_permissionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."RolePermission"
    ADD CONSTRAINT "RolePermission_permissionId_fkey" FOREIGN KEY ("permissionId") REFERENCES public."Permission"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: RolePermission RolePermission_roleId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."RolePermission"
    ADD CONSTRAINT "RolePermission_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES public."Role"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: SaleItem SaleItem_saleId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."SaleItem"
    ADD CONSTRAINT "SaleItem_saleId_fkey" FOREIGN KEY ("saleId") REFERENCES public."Sale"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: SaleItem SaleItem_variantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."SaleItem"
    ADD CONSTRAINT "SaleItem_variantId_fkey" FOREIGN KEY ("variantId") REFERENCES public."ProductVariant"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Sale Sale_employeeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Sale"
    ADD CONSTRAINT "Sale_employeeId_fkey" FOREIGN KEY ("employeeId") REFERENCES public."Employee"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Sale Sale_soldByEmployeeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Sale"
    ADD CONSTRAINT "Sale_soldByEmployeeId_fkey" FOREIGN KEY ("soldByEmployeeId") REFERENCES public."Employee"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Session Session_employeeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Session"
    ADD CONSTRAINT "Session_employeeId_fkey" FOREIGN KEY ("employeeId") REFERENCES public."Employee"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Shift Shift_employeeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Shift"
    ADD CONSTRAINT "Shift_employeeId_fkey" FOREIGN KEY ("employeeId") REFERENCES public."Employee"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Accord; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public."Accord" ENABLE ROW LEVEL SECURITY;

--
-- Name: AuditLog; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public."AuditLog" ENABLE ROW LEVEL SECURITY;

--
-- Name: Category; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public."Category" ENABLE ROW LEVEL SECURITY;

--
-- Name: Employee; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public."Employee" ENABLE ROW LEVEL SECURITY;

--
-- Name: EmployeePermission; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public."EmployeePermission" ENABLE ROW LEVEL SECURITY;

--
-- Name: FragranceFamily; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public."FragranceFamily" ENABLE ROW LEVEL SECURITY;

--
-- Name: Gender; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public."Gender" ENABLE ROW LEVEL SECURITY;

--
-- Name: GlobalPricingSettings; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public."GlobalPricingSettings" ENABLE ROW LEVEL SECURITY;

--
-- Name: HeldSale; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public."HeldSale" ENABLE ROW LEVEL SECURITY;

--
-- Name: HomepageHeroCarouselSettings; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public."HomepageHeroCarouselSettings" ENABLE ROW LEVEL SECURITY;

--
-- Name: HomepageHeroSlide; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public."HomepageHeroSlide" ENABLE ROW LEVEL SECURITY;

--
-- Name: ImportJob; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public."ImportJob" ENABLE ROW LEVEL SECURITY;

--
-- Name: ImportJobRow; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public."ImportJobRow" ENABLE ROW LEVEL SECURITY;

--
-- Name: InventoryMovement; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public."InventoryMovement" ENABLE ROW LEVEL SECURITY;

--
-- Name: Invoice; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public."Invoice" ENABLE ROW LEVEL SECURITY;

--
-- Name: LoginAttempt; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public."LoginAttempt" ENABLE ROW LEVEL SECURITY;

--
-- Name: Order; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public."Order" ENABLE ROW LEVEL SECURITY;

--
-- Name: OrderItem; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public."OrderItem" ENABLE ROW LEVEL SECURITY;

--
-- Name: OrderStatusHistory; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public."OrderStatusHistory" ENABLE ROW LEVEL SECURITY;

--
-- Name: Payment; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public."Payment" ENABLE ROW LEVEL SECURITY;

--
-- Name: PendingMfaChallenge; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public."PendingMfaChallenge" ENABLE ROW LEVEL SECURITY;

--
-- Name: Permission; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public."Permission" ENABLE ROW LEVEL SECURITY;

--
-- Name: Product; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public."Product" ENABLE ROW LEVEL SECURITY;

--
-- Name: ProductAccord; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public."ProductAccord" ENABLE ROW LEVEL SECURITY;

--
-- Name: ProductImage; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public."ProductImage" ENABLE ROW LEVEL SECURITY;

--
-- Name: ProductNote; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public."ProductNote" ENABLE ROW LEVEL SECURITY;

--
-- Name: ProductVariant; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public."ProductVariant" ENABLE ROW LEVEL SECURITY;

--
-- Name: RateLimitEvent; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public."RateLimitEvent" ENABLE ROW LEVEL SECURITY;

--
-- Name: Return; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public."Return" ENABLE ROW LEVEL SECURITY;

--
-- Name: ReturnItem; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public."ReturnItem" ENABLE ROW LEVEL SECURITY;

--
-- Name: Role; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public."Role" ENABLE ROW LEVEL SECURITY;

--
-- Name: RolePermission; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public."RolePermission" ENABLE ROW LEVEL SECURITY;

--
-- Name: Sale; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public."Sale" ENABLE ROW LEVEL SECURITY;

--
-- Name: SaleItem; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public."SaleItem" ENABLE ROW LEVEL SECURITY;

--
-- Name: Season; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public."Season" ENABLE ROW LEVEL SECURITY;

--
-- Name: Session; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public."Session" ENABLE ROW LEVEL SECURITY;

--
-- Name: Shift; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public."Shift" ENABLE ROW LEVEL SECURITY;

--
-- Name: ShippingZone; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public."ShippingZone" ENABLE ROW LEVEL SECURITY;

--
-- Name: SiteSettings; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public."SiteSettings" ENABLE ROW LEVEL SECURITY;

--
-- Name: StockAdjustment; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public."StockAdjustment" ENABLE ROW LEVEL SECURITY;

--
-- Name: StoreLocationSettings; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public."StoreLocationSettings" ENABLE ROW LEVEL SECURITY;

--
-- Name: _prisma_migrations; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public._prisma_migrations ENABLE ROW LEVEL SECURITY;

--
-- PostgreSQL database dump complete
--

\unrestrict ezdAOLVbwy3PyYC14YhhUH5mUxJ0IkoxpIFJLfytLY82BWKFROviuewhVZaakZ0

