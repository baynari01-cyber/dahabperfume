import { prisma } from '../src/lib/db';

async function main() {
  try {
    const result = await prisma.product.updateMany({
      where: {
        images: {
          none: {}
        }
      },
      data: {
        isVisible: true
      }
    });
    console.log(`Successfully unhidden ${result.count} products with no images.`);
  } catch (error) {
    console.error('Error unhiding products:', error);
  } finally {
    await prisma.$disconnect();
  }
}

main();
