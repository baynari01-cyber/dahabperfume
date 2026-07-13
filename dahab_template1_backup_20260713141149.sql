--
-- PostgreSQL database dump
--

\restrict W5qzMhuch7wqgbXKD2GQqfSohhLqlOIuYGtSPYi0ZVDBMuyqmaUCpKlM2mWYO3T

-- Dumped from database version 17.5
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

--
-- Name: _prisma_dev_wal; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA _prisma_dev_wal;


ALTER SCHEMA _prisma_dev_wal OWNER TO postgres;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS '';


--
-- Name: capture_event(); Type: FUNCTION; Schema: _prisma_dev_wal; Owner: postgres
--

CREATE FUNCTION _prisma_dev_wal.capture_event() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
      BEGIN
        IF TG_TABLE_SCHEMA = '_prisma_dev_wal' THEN
          RETURN COALESCE(NEW, OLD);
        END IF;

        INSERT INTO "_prisma_dev_wal"."events" (
          txid,
          schema_name,
          table_name,
          op,
          row_data,
          old_row_data
        )
        VALUES (
          txid_current(),
          TG_TABLE_SCHEMA,
          TG_TABLE_NAME,
          lower(TG_OP),
          CASE WHEN TG_OP IN ('INSERT', 'UPDATE') THEN to_jsonb(NEW) ELSE NULL END,
          CASE WHEN TG_OP IN ('UPDATE', 'DELETE') THEN to_jsonb(OLD) ELSE NULL END
        );

        RETURN COALESCE(NEW, OLD);
      END;
      $$;


ALTER FUNCTION _prisma_dev_wal.capture_event() OWNER TO postgres;

--
-- Name: install_all_triggers(); Type: FUNCTION; Schema: _prisma_dev_wal; Owner: postgres
--

CREATE FUNCTION _prisma_dev_wal.install_all_triggers() RETURNS void
    LANGUAGE plpgsql
    AS $$
      DECLARE
        target REGCLASS;
      BEGIN
        FOR target IN
          SELECT c.oid::regclass
          FROM pg_class AS c
          JOIN pg_namespace AS n ON n.oid = c.relnamespace
          WHERE c.relkind IN ('r', 'p')
            AND n.nspname NOT IN ('_prisma_dev_wal', 'information_schema', 'pg_catalog')
            AND n.nspname NOT LIKE 'pg_temp_%'
            AND n.nspname NOT LIKE 'pg_toast%'
        LOOP
          IF EXISTS (
            SELECT 1
            FROM pg_trigger
            WHERE tgrelid = target
              AND tgname = 'prisma_dev_wal_capture'
          ) THEN
            CONTINUE;
          END IF;

          EXECUTE format(
            'CREATE TRIGGER %I AFTER INSERT OR UPDATE OR DELETE ON %s FOR EACH ROW EXECUTE FUNCTION "_prisma_dev_wal"."capture_event"()',
            'prisma_dev_wal_capture',
            target::text
          );
        END LOOP;
      END;
      $$;


ALTER FUNCTION _prisma_dev_wal.install_all_triggers() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: events; Type: TABLE; Schema: _prisma_dev_wal; Owner: postgres
--

CREATE TABLE _prisma_dev_wal.events (
    id bigint NOT NULL,
    txid bigint DEFAULT txid_current() NOT NULL,
    schema_name text NOT NULL,
    table_name text NOT NULL,
    op text NOT NULL,
    row_data jsonb,
    old_row_data jsonb,
    created_at timestamp with time zone DEFAULT clock_timestamp() NOT NULL
);


ALTER TABLE _prisma_dev_wal.events OWNER TO postgres;

--
-- Name: events_id_seq; Type: SEQUENCE; Schema: _prisma_dev_wal; Owner: postgres
--

CREATE SEQUENCE _prisma_dev_wal.events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE _prisma_dev_wal.events_id_seq OWNER TO postgres;

--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: _prisma_dev_wal; Owner: postgres
--

ALTER SEQUENCE _prisma_dev_wal.events_id_seq OWNED BY _prisma_dev_wal.events.id;


--
-- Name: Accord; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Accord" (
    id text NOT NULL,
    name text NOT NULL,
    color text
);


ALTER TABLE public."Accord" OWNER TO postgres;

--
-- Name: AuditLog; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public."AuditLog" OWNER TO postgres;

--
-- Name: Category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Category" (
    id text NOT NULL,
    slug text NOT NULL,
    name text NOT NULL,
    description text
);


ALTER TABLE public."Category" OWNER TO postgres;

--
-- Name: Collection; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Collection" (
    id text NOT NULL,
    slug text NOT NULL,
    name text NOT NULL,
    description text,
    image text
);


ALTER TABLE public."Collection" OWNER TO postgres;

--
-- Name: ConsumptionRecord; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ConsumptionRecord" (
    id text NOT NULL,
    "materialId" text NOT NULL,
    quantity double precision NOT NULL,
    "saleId" text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."ConsumptionRecord" OWNER TO postgres;

--
-- Name: Employee; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public."Employee" OWNER TO postgres;

--
-- Name: EmployeePermission; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public."EmployeePermission" OWNER TO postgres;

--
-- Name: FragranceFamily; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."FragranceFamily" (
    id text NOT NULL,
    name text NOT NULL
);


ALTER TABLE public."FragranceFamily" OWNER TO postgres;

--
-- Name: Gender; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Gender" (
    id text NOT NULL,
    name text NOT NULL
);


ALTER TABLE public."Gender" OWNER TO postgres;

--
-- Name: GlobalPricingSettings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."GlobalPricingSettings" (
    id text DEFAULT '1'::text NOT NULL,
    "taxRate" double precision DEFAULT 0.0 NOT NULL,
    "currencyCode" text DEFAULT 'JOD'::text NOT NULL,
    "currencySymbol" text DEFAULT 'د.أ'::text NOT NULL,
    "pricesIncludeTax" boolean DEFAULT true NOT NULL,
    "taxEnabled" boolean DEFAULT false NOT NULL
);


ALTER TABLE public."GlobalPricingSettings" OWNER TO postgres;

--
-- Name: HeldSale; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public."HeldSale" OWNER TO postgres;

--
-- Name: HomepageHeroCarouselSettings; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public."HomepageHeroCarouselSettings" OWNER TO postgres;

--
-- Name: HomepageHeroSlide; Type: TABLE; Schema: public; Owner: postgres
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
    "collectionId" text,
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


ALTER TABLE public."HomepageHeroSlide" OWNER TO postgres;

--
-- Name: ImportJob; Type: TABLE; Schema: public; Owner: postgres
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
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "employeeId" text NOT NULL,
    "completedAt" timestamp(3) without time zone,
    "confirmedBy" text,
    "errorSummary" text,
    "startedAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."ImportJob" OWNER TO postgres;

--
-- Name: ImportJobRow; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ImportJobRow" (
    id text NOT NULL,
    "jobId" text NOT NULL,
    "rowNumber" integer NOT NULL,
    sku text,
    "nameAr" text,
    status text NOT NULL,
    "errorMessage" text,
    "resultStatus" text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "entityReference" text,
    "normalizedData" text,
    "rawData" text,
    warnings text
);


ALTER TABLE public."ImportJobRow" OWNER TO postgres;

--
-- Name: InventoryCountLine; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."InventoryCountLine" (
    id text NOT NULL,
    "countSessionId" text NOT NULL,
    "productId" text NOT NULL,
    "inventoryMode" text NOT NULL,
    "expectedQuantityMlSnapshot" integer NOT NULL,
    "countedQuantityMl" integer NOT NULL,
    "varianceMl" integer NOT NULL,
    "expectedUnitsSnapshot" integer,
    "countedUnits" integer,
    "varianceUnits" integer,
    "countStatus" text NOT NULL,
    "employeeNote" text,
    "managerNote" text,
    "countedAt" timestamp(3) without time zone
);


ALTER TABLE public."InventoryCountLine" OWNER TO postgres;

--
-- Name: InventoryCountSession; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."InventoryCountSession" (
    id text NOT NULL,
    reference text NOT NULL,
    title text NOT NULL,
    status text NOT NULL,
    "assignedEmployeeId" text NOT NULL,
    "assignedByEmployeeId" text NOT NULL,
    "reviewedByEmployeeId" text,
    "approvedByEmployeeId" text,
    "scopeType" text NOT NULL,
    "startedAt" timestamp(3) without time zone,
    "submittedAt" timestamp(3) without time zone,
    "reviewedAt" timestamp(3) without time zone,
    "approvedAt" timestamp(3) without time zone,
    notes text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."InventoryCountSession" OWNER TO postgres;

--
-- Name: InventoryMovement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."InventoryMovement" (
    id text NOT NULL,
    sku text NOT NULL,
    type text NOT NULL,
    quantity integer NOT NULL,
    "employeeId" text NOT NULL,
    reference text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."InventoryMovement" OWNER TO postgres;

--
-- Name: Invoice; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public."Invoice" OWNER TO postgres;

--
-- Name: LoginAttempt; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public."LoginAttempt" OWNER TO postgres;

--
-- Name: Order; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public."Order" OWNER TO postgres;

--
-- Name: OrderItem; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public."OrderItem" OWNER TO postgres;

--
-- Name: OrderStatusHistory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."OrderStatusHistory" (
    id text NOT NULL,
    "orderId" text NOT NULL,
    status text NOT NULL,
    notes text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."OrderStatusHistory" OWNER TO postgres;

--
-- Name: Payment; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public."Payment" OWNER TO postgres;

--
-- Name: Permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Permission" (
    id text NOT NULL,
    action text NOT NULL,
    description text
);


ALTER TABLE public."Permission" OWNER TO postgres;

--
-- Name: Product; Type: TABLE; Schema: public; Owner: postgres
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
    "collectionId" text,
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
    "inventoryMode" text DEFAULT 'FINISHED_PRODUCT'::text NOT NULL,
    "notesStatus" text DEFAULT 'VERIFIED'::text NOT NULL
);


ALTER TABLE public."Product" OWNER TO postgres;

--
-- Name: ProductAccord; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ProductAccord" (
    "productId" text NOT NULL,
    "accordId" text NOT NULL,
    value integer NOT NULL,
    "order" integer DEFAULT 0 NOT NULL
);


ALTER TABLE public."ProductAccord" OWNER TO postgres;

--
-- Name: ProductFormula; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ProductFormula" (
    id text NOT NULL,
    "productId" text NOT NULL,
    name text NOT NULL,
    size text NOT NULL,
    "isActive" boolean DEFAULT true NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."ProductFormula" OWNER TO postgres;

--
-- Name: ProductFormulaItem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ProductFormulaItem" (
    id text NOT NULL,
    "formulaId" text NOT NULL,
    "materialId" text NOT NULL,
    quantity double precision NOT NULL
);


ALTER TABLE public."ProductFormulaItem" OWNER TO postgres;

--
-- Name: ProductImage; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public."ProductImage" OWNER TO postgres;

--
-- Name: ProductLiquidMovement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ProductLiquidMovement" (
    id text NOT NULL,
    "productId" text NOT NULL,
    type text NOT NULL,
    "quantityBeforeMl" integer NOT NULL,
    "quantityChangeMl" integer NOT NULL,
    "quantityAfterMl" integer NOT NULL,
    "relatedSaleId" text,
    "relatedInvoiceId" text,
    "employeeId" text NOT NULL,
    reason text,
    "idempotencyKey" text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."ProductLiquidMovement" OWNER TO postgres;

--
-- Name: ProductLiquidStock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ProductLiquidStock" (
    "productId" text NOT NULL,
    "quantityMl" integer DEFAULT 0 NOT NULL,
    "lowStockThresholdMl" integer DEFAULT 1000 NOT NULL,
    "verificationStatus" text DEFAULT 'UNVERIFIED'::text NOT NULL,
    "lastVerifiedAt" timestamp(3) without time zone,
    "lastVerifiedByEmployeeId" text,
    version integer DEFAULT 1 NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."ProductLiquidStock" OWNER TO postgres;

--
-- Name: ProductNote; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ProductNote" (
    id text NOT NULL,
    "productId" text NOT NULL,
    "displayOrder" integer DEFAULT 0 NOT NULL,
    "nameAr" text NOT NULL,
    "nameEn" text NOT NULL,
    "noteType" text NOT NULL
);


ALTER TABLE public."ProductNote" OWNER TO postgres;

--
-- Name: ProductVariant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ProductVariant" (
    id text NOT NULL,
    "productId" text NOT NULL,
    size text NOT NULL,
    sku text NOT NULL,
    price integer NOT NULL,
    "compareAt" integer,
    stock integer DEFAULT 0 NOT NULL,
    "isActive" boolean DEFAULT true NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "usesGlobalPricing" boolean DEFAULT true NOT NULL
);


ALTER TABLE public."ProductVariant" OWNER TO postgres;

--
-- Name: RateLimitEvent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."RateLimitEvent" (
    id text NOT NULL,
    key text NOT NULL,
    route text NOT NULL,
    points integer DEFAULT 1 NOT NULL,
    "expireAt" timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."RateLimitEvent" OWNER TO postgres;

--
-- Name: RawMaterial; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."RawMaterial" (
    id text NOT NULL,
    sku text NOT NULL,
    name text NOT NULL,
    "categoryId" text NOT NULL,
    unit text NOT NULL,
    "costPerUnit" integer NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."RawMaterial" OWNER TO postgres;

--
-- Name: RawMaterialCategory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."RawMaterialCategory" (
    id text NOT NULL,
    name text NOT NULL
);


ALTER TABLE public."RawMaterialCategory" OWNER TO postgres;

--
-- Name: RawMaterialMovement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."RawMaterialMovement" (
    id text NOT NULL,
    "materialId" text NOT NULL,
    type text NOT NULL,
    quantity double precision NOT NULL,
    reference text,
    notes text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."RawMaterialMovement" OWNER TO postgres;

--
-- Name: RawMaterialStock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."RawMaterialStock" (
    id text NOT NULL,
    "materialId" text NOT NULL,
    quantity double precision NOT NULL,
    "minThreshold" double precision,
    "lastUpdated" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."RawMaterialStock" OWNER TO postgres;

--
-- Name: Return; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Return" (
    id text NOT NULL,
    "saleId" text NOT NULL,
    "employeeId" text NOT NULL,
    reason text,
    "totalAmount" integer NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Return" OWNER TO postgres;

--
-- Name: ReturnItem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ReturnItem" (
    id text NOT NULL,
    "returnId" text NOT NULL,
    "variantId" text NOT NULL,
    quantity integer NOT NULL,
    amount integer NOT NULL
);


ALTER TABLE public."ReturnItem" OWNER TO postgres;

--
-- Name: Role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Role" (
    id text NOT NULL,
    name text NOT NULL,
    description text
);


ALTER TABLE public."Role" OWNER TO postgres;

--
-- Name: RolePermission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."RolePermission" (
    "roleId" text NOT NULL,
    "permissionId" text NOT NULL
);


ALTER TABLE public."RolePermission" OWNER TO postgres;

--
-- Name: Sale; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public."Sale" OWNER TO postgres;

--
-- Name: SaleItem; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public."SaleItem" OWNER TO postgres;

--
-- Name: Season; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Season" (
    id text NOT NULL,
    name text NOT NULL
);


ALTER TABLE public."Season" OWNER TO postgres;

--
-- Name: Session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Session" (
    id text NOT NULL,
    "employeeId" text NOT NULL,
    "expiresAt" timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "lastActivityAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Session" OWNER TO postgres;

--
-- Name: Shift; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public."Shift" OWNER TO postgres;

--
-- Name: ShippingZone; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public."ShippingZone" OWNER TO postgres;

--
-- Name: SiteSettings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SiteSettings" (
    key text NOT NULL,
    value text NOT NULL
);


ALTER TABLE public."SiteSettings" OWNER TO postgres;

--
-- Name: StockAdjustment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."StockAdjustment" (
    id text NOT NULL,
    sku text NOT NULL,
    "oldStock" integer NOT NULL,
    "newStock" integer NOT NULL,
    reason text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."StockAdjustment" OWNER TO postgres;

--
-- Name: StoreLocationSettings; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public."StoreLocationSettings" OWNER TO postgres;

--
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public._prisma_migrations OWNER TO postgres;

--
-- Name: events id; Type: DEFAULT; Schema: _prisma_dev_wal; Owner: postgres
--

ALTER TABLE ONLY _prisma_dev_wal.events ALTER COLUMN id SET DEFAULT nextval('_prisma_dev_wal.events_id_seq'::regclass);


--
-- Data for Name: events; Type: TABLE DATA; Schema: _prisma_dev_wal; Owner: postgres
--

COPY _prisma_dev_wal.events (id, txid, schema_name, table_name, op, row_data, old_row_data, created_at) FROM stdin;
\.


--
-- Data for Name: Accord; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Accord" (id, name, color) FROM stdin;
