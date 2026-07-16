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
        isVisible: false
      }
    });
    console.log(`Successfully hidden ${result.count} products with no images.`);
  } catch (error) {
    console.error('Error deleting products:', error);
  } finally {
    await prisma.$disconnect();
  }
}

main();
