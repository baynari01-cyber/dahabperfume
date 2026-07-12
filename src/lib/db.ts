import { PrismaClient } from '@prisma/client';
import { Pool } from 'pg';
import { PrismaPg } from '@prisma/adapter-pg';

const globalForPrisma = globalThis as unknown as {
  prisma: PrismaClient | undefined;
};

// Check if we are running at build time or in a generic Node environment
// without a DATABASE_URL. In those cases, we shouldn't fail immediately
// but we shouldn't attempt to connect to the DB.
const connectionString = (process.env.NODE_ENV === 'test' && process.env.TEST_DATABASE_URL)
  ? process.env.TEST_DATABASE_URL
  : (process.env.DATABASE_URL || '');

export const prisma =
  globalForPrisma.prisma ??
  (connectionString
    ? new PrismaClient({ adapter: new PrismaPg(new Pool({ connectionString })) })
    : new PrismaClient()); // Fallback for build time without env vars

if (process.env.NODE_ENV !== 'production') globalForPrisma.prisma = prisma;
