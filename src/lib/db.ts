import { PrismaClient } from '@prisma/client';
import { Pool } from 'pg';
import { PrismaPg } from '@prisma/adapter-pg';

declare global {
  // eslint-disable-next-line no-var
  var __prismaPool: Pool | undefined;
  // eslint-disable-next-line no-var
  var __prismaClient: PrismaClient | undefined;
}

const connectionString = (process.env.NODE_ENV === 'test' && process.env.TEST_DATABASE_URL)
  ? process.env.TEST_DATABASE_URL
  : (process.env.DATABASE_URL || '');

let pool: Pool;
let prismaClient: PrismaClient;

if (process.env.NODE_ENV === 'production') {
  pool = new Pool({ connectionString });
  const adapter = new PrismaPg(pool);
  prismaClient = new PrismaClient({ adapter });
} else {
  // In development, strictly cache the client and pool
  if (!global.__prismaPool) {
    global.__prismaPool = new Pool({ connectionString });
  }
  pool = global.__prismaPool;

  if (!global.__prismaClient) {
    const adapter = new PrismaPg(pool);
    global.__prismaClient = new PrismaClient({
      adapter,
      log: ['error', 'warn'],
    });
  }
  prismaClient = global.__prismaClient;
}

export const prisma = prismaClient;
export { pool };

