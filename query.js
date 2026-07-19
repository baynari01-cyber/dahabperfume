const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

async function main() {
  const latest = await prisma.product.findMany({
    where: { sku: { startsWith: 'DHB-' } }
  });
  
  // Sort them manually since they are strings and we want numerical sort
  const maxSku = latest
    .map(p => {
      const match = p.sku.match(/DHB-(\d+)/);
      return match ? parseInt(match[1], 10) : 0;
    })
    .reduce((max, current) => Math.max(max, current), 0);
    
  console.log('Max SKU number is:', maxSku);
}
main();
