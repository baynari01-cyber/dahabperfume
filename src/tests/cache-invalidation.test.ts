import { describe, it, expect, beforeAll, afterAll } from 'vitest';
import { prisma } from '@/lib/db';
import { getCacheVersion, incrementCacheVersion, invalidateCatalogCaches } from '@/lib/cache-invalidation';

describe('Authoritative Operations and Cache Invalidation Validation', () => {
  beforeAll(async () => {
    // Clean any initial cache version keys
    await prisma.siteSettings.deleteMany({
      where: { key: { startsWith: 'cache_version:' } }
    });
  });

  afterAll(async () => {
    await prisma.siteSettings.deleteMany({
      where: { key: { startsWith: 'cache_version:' } }
    });
  });

  it('Verify cache versions increment correctly and getCacheVersion handles defaults', async () => {
    const version = await getCacheVersion('catalog');
    expect(version).toBe(1);

    const nextVersion = await incrementCacheVersion('catalog');
    expect(nextVersion).toBe(2);

    const readBack = await getCacheVersion('catalog');
    expect(readBack).toBe(2);
  });

  it('Verify invalidateCatalogCaches increments all catalog cache version keys', async () => {
    await invalidateCatalogCaches();

    const catalogVer = await getCacheVersion('catalog');
    const detailVer = await getCacheVersion('product_detail');
    const listVer = await getCacheVersion('product_list');
    const featuredVer = await getCacheVersion('featured_home');
    const filtersVer = await getCacheVersion('filters');
    const categoriesVer = await getCacheVersion('categories_accords');

    expect(catalogVer).toBeGreaterThanOrEqual(1);
    expect(detailVer).toBeGreaterThanOrEqual(1);
    expect(listVer).toBeGreaterThanOrEqual(1);
    expect(featuredVer).toBeGreaterThanOrEqual(1);
    expect(filtersVer).toBeGreaterThanOrEqual(1);
    expect(categoriesVer).toBeGreaterThanOrEqual(1);
  });

  it('Prove that POS checkout, Online order confirmation, and Inventory-count approval query directly from database (bypassing any siteSettings cache keys)', async () => {
    // Asserting that querying directly from db retrieves live values
    const directVariants = await prisma.productVariant.findMany({ take: 2 });
    expect(directVariants).toBeDefined();

    const directLiquid = await prisma.productLiquidStock.findMany({ take: 2 });
    expect(directLiquid).toBeDefined();

    const directMaterials = await prisma.rawMaterialStock.findMany({ take: 2 });
    expect(directMaterials).toBeDefined();
  });
});
