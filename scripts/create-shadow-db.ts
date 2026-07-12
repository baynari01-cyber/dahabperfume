import { Client } from 'pg';

async function main() {
  const client = new Client({
    connectionString: 'postgres://postgres:postgres@localhost:51214/template1?sslmode=disable'
  });
  
  await client.connect();
  try {
    await client.query('CREATE DATABASE shadow_db;');
    console.log('Database shadow_db created successfully!');
  } catch (err: any) {
    console.error('Error creating database:', err.message);
  } finally {
    await client.end();
  }
}

main();
