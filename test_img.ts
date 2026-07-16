import { prisma } from './src/lib/db'; async function check() { const imgs = await prisma.productImage.findMany({take: 5}); console.log(imgs); } check();
