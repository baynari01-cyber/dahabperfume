import { readFileSync } from 'fs';
import { resolve } from 'path';

function check() {
  let dbUrl = process.env.DATABASE_URL;

  if (!dbUrl) {
    try {
      const envPath = resolve(process.cwd(), '.env');
      const envContent = readFileSync(envPath, 'utf-8');
      const match = envContent.match(/^DATABASE_URL=['"]?(.*?)['"]?$/m);
      if (match) dbUrl = match[1];
    } catch (e) {
      // ignore
    }
  }

  if (!dbUrl) return;

  try {
    const url = new URL(dbUrl);
    const dbName = url.pathname.slice(1); // remove leading slash
    if (dbName === 'template0' || dbName === 'template1' || dbName === 'postgres') {
      console.error('❌ FATAL: DATABASE_URL is pointing to a template or system database!');
      console.error(`URL: ${dbUrl}`);
      console.error('Execution blocked to prevent data corruption.');
      process.exit(1);
    }
  } catch (e) {
    // If URL parsing fails, fallback to simple end check
    if (dbUrl.endsWith('/template0') || dbUrl.endsWith('/template1') || dbUrl.endsWith('/postgres')) {
      console.error('❌ FATAL: DATABASE_URL is pointing to a template or system database!');
      process.exit(1);
    }
  }
}

check();
