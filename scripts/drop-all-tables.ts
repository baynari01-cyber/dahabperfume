import { Client } from 'pg';

async function main() {
  const client = new Client({
    connectionString: 'postgres://postgres:postgres@localhost:51214/template1?sslmode=disable'
  });
  
  await client.connect();
  try {
    // Drop all tables
    await client.query(`
      DROP SCHEMA public CASCADE;
      CREATE SCHEMA public;
      GRANT ALL ON SCHEMA public TO postgres;
      GRANT ALL ON SCHEMA public TO public;
    `);
    console.log('All tables dropped. Schema is clean!');
  } catch (err: any) {
    console.error('Error dropping tables:', err.message);
  } finally {
    await client.end();
  }
}

main();
