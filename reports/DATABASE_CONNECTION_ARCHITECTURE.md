# DATABASE CONNECTION ARCHITECTURE

This report documents the official database driver, pooling, and prepared-statement policy configurations across all environments.

---

## 1. Environment Configurations

### Local Development / Test
- **Database Engine**: Direct PostgreSQL 16+ instance.
- **Connection Driver**: `pg` (node-postgres) with Prisma Client.
- **Prepared Statements**: Fully enabled and operating normally.
- **Pooling Policy**: Singleton pooled instance using `pg.Pool` or standard Prisma Client pooling options.

### Supabase Runtime
- **Pooling Mode**: Transaction-mode pooling (via PgBouncer on port `6543` or Supabase Connection Pooler on port `5432`).
- **Prepared Statements**: Disabled (pgBouncer transaction mode does not support prepared statements).
- **Prepared-statement Policy**: Configured using `pg` driver query configuration (via Prisma parameters `pgbouncer=true` or query-level statement configuration).
- **Transaction-mode Limitations**: Node-postgres does not use named prepared statements when connection pooling is configured in Transaction mode.

---

## 2. Technical Parameters Matrix

| Parameter / Policy | Configuration Value / Policy Details |
| :--- | :--- |
| **Direct URL (`DIRECT_URL`)** | `postgres://postgres:postgres@localhost:51214/dahab` (used for migration execution and schema synchronization to bypass transaction poolers). |
| **Runtime URL (`DATABASE_URL`)** | `postgres://postgres:postgres@localhost:51214/dahab?pgbouncer=true` (or active runtime address for standard query pooling execution). |
| **Default Pool Size** | Local: `10` connections per worker. Supabase: Optimized dynamic pool size constraints. |
| **Migration Connection** | Direct-to-database TCP connection bypassing connection poolers (uses `DIRECT_URL`). |
| **Connection Timeout** | `30` seconds default connection timeout parameter. |
| **Prepared-statement Policy** | Supported locally on direct TCP connection; dynamically disabled on Supabase Transaction pools using connection URL options. |
| **Monkeypatch Policy** | **None.** No global modifications of `pg.Client.prototype.query` or `pg.Pool.prototype.query` are applied. Concurrency is handled at the transaction layer via standard lock mutexes. |
