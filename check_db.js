const { Client } = require('pg');

const client = new Client({ connectionString: process.env.DATABASE_URL });
async function check() {
  await client.connect();
  const res = await client.query('SELECT COUNT(*) FROM "ProductImage"');
  console.log('ProductImage count:', res.rows[0].count);
  const products = await client.query('SELECT COUNT(*) FROM "Product"');
  console.log('Product count:', products.rows[0].count);
  const images = await client.query('SELECT id, "productId", url FROM "ProductImage" LIMIT 5');
  console.log('Sample images:', images.rows);
  await client.end();
}
check();
