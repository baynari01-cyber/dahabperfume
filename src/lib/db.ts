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

function wrapClient(client: any) {
  if (!client.__isMutexWrapped) {
    client.__isMutexWrapped = true;
    const originalQuery = client.query.bind(client);
    
    // @ts-ignore: pg query method overloads are complex
    client.query = (...args: any[]) => {
      if (!client.__queryMutex) {
        client.__queryMutex = Promise.resolve();
      }
      
      const lastArg = args[args.length - 1];
      const hasCallback = typeof lastArg === 'function';
      
      if (hasCallback) {
        const callback = args.pop();
        const next = client.__queryMutex.then(() => {
          return new Promise<any>((resolve, reject) => {
            originalQuery.call(client, ...args, (err: any, res: any) => {
              if (err) {
                reject(err);
              } else {
                resolve(res);
              }
              callback(err, res);
            });
          });
        });
        client.__queryMutex = next.catch(() => {}) as unknown as Promise<void>;
        return next;
      }

      const next = client.__queryMutex.then(() => originalQuery.apply(client, args as any));
      client.__queryMutex = next.catch(() => {}) as unknown as Promise<void>;
      return next;
    };
  }
  client.__queryMutex = Promise.resolve();
}

function makePool(): Pool {
  const p = new Pool({
    connectionString,
    max: 10,
    idleTimeoutMillis: 30000,
    connectionTimeoutMillis: 2000,
  });

  const originalConnect = p.connect;
  // @ts-ignore: pg connect method overloads are complex
  p.connect = (callback?: any) => {
    if (callback) {
      return originalConnect.call(p, (err: any, client: any, release: any) => {
        if (err) return callback(err);
        wrapClient(client);
        callback(null, client, release);
      });
    }

    // @ts-ignore
    return originalConnect.call(p).then((client: any) => {
      wrapClient(client);
      return client;
    });
  };

  return p;
}

let pool: Pool;
let prismaClient: PrismaClient;

if (process.env.NODE_ENV === 'production') {
  pool = makePool();
  const adapter = new PrismaPg(pool);
  prismaClient = new PrismaClient({ adapter });
} else {
  // In development, strictly cache both the pool and the client
  if (!global.__prismaPool) {
    global.__prismaPool = makePool();
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

