import { describe, it, expect, vi, beforeAll, afterAll } from 'vitest';
import { prisma } from '@/lib/db';

vi.mock('server-only', () => ({}));
vi.mock('next/cache', () => ({
  revalidatePath: vi.fn()
}));

vi.mock('@/lib/dal', () => {
  return {
    requirePermission: vi.fn(async () => {
      return { employeeId: 'emp-imports-test' };
    })
  };
});

import { createImportJob, executeImportDryRun, executeImportCommit, getImportReport } from '@/actions/imports';

describe('Admin Import Workflow Validation & Mutation-Free Dry Run', () => {
  let categoryId: string;
  const empId = 'emp-imports-test';

  beforeAll(async () => {
    const role = await prisma.role.upsert({
      where: { name: 'ADMIN' },
      update: {},
      create: { name: 'ADMIN', description: 'Admin' }
    });

    await prisma.employee.upsert({
      where: { id: empId },
      update: {},
      create: {
        id: empId,
        email: 'imports-test@dahab.local',
        passwordHash: 'dummy',
        name: 'Imports Tester',
        roleId: role.id
      }
    });

    const category = await prisma.category.upsert({
      where: { slug: 'general' },
      update: {},
      create: { name: 'General', slug: 'general' }
    });
    categoryId = category.id;
  });

  afterAll(async () => {
    // Cascade clean import jobs
    await prisma.importJobRow.deleteMany({ where: { job: { employeeId: empId } } });
    await prisma.importJob.deleteMany({ where: { employeeId: empId } });
    
    // Clean up products created during import
    const products = await prisma.product.findMany({ where: { sku: { startsWith: 'IMPT-SKU-' } } });
    for (const p of products) {
      await prisma.productVariant.deleteMany({ where: { productId: p.id } });
      await prisma.product.delete({ where: { id: p.id } });
    }

    await prisma.employee.deleteMany({ where: { id: empId } });
  });

  it('Verify full workflow: create job, run dry run (assert mutation-free), commit job, and generate reports', async () => {
    // 1. Create Import Job
    const jobRes = await createImportJob({
      fileName: 'products_upload_test.csv',
      fileType: 'CSV',
      totalRows: 3
    });

    expect(jobRes.success).toBe(true);
    expect(jobRes.jobId).toBeDefined();
    const jobId = jobRes.jobId;

    // Simulate parsed data containing 3 rows: 2 valid, 1 invalid (missing Name)
    const mockRows = [
      { sku: 'IMPT-SKU-001', nameAr: 'عطر تجريبي أول' },
      { sku: 'IMPT-SKU-002', nameAr: '' }, // Invalid row (missing Name)
      { sku: 'IMPT-SKU-003', nameAr: 'عطر تجريبي ثالث' }
    ];

    // Record baseline database counts before Dry Run
    const beforeProducts = await prisma.product.count();
    const beforeVariants = await prisma.productVariant.count();

    // 2. Execute Dry Run
    const dryRunRes = await executeImportDryRun(jobId, mockRows);
    expect(dryRunRes.success).toBe(true);
    expect(dryRunRes.totalRows).toBe(3);
    expect(dryRunRes.successRows).toBe(2);
    expect(dryRunRes.failedRows).toBe(1);

    // Assert that Dry Run made ZERO mutations to the catalog tables
    const afterDryRunProducts = await prisma.product.count();
    const afterDryRunVariants = await prisma.productVariant.count();
    expect(afterDryRunProducts).toBe(beforeProducts);
    expect(afterDryRunVariants).toBe(beforeVariants);

    // 3. Execute Commit
    const commitRes = await executeImportCommit(jobId) as any;
    expect(commitRes.success).toBe(true);
    expect(commitRes.createdCount).toBe(2);
    expect(commitRes.updatedCount).toBe(0);

    // Assert that products are now created in database
    const afterCommitProducts = await prisma.product.count();
    const afterCommitVariants = await prisma.productVariant.count();
    expect(afterCommitProducts).toBe(beforeProducts + 2);
    expect(afterCommitVariants).toBe(beforeVariants + 4); // each product has 2 variants

    // 4. Retrieve Job report
    const jobReport = await getImportReport(jobId);
    expect(jobReport).not.toBeNull();
    expect(jobReport?.status).toBe('COMPLETED');
    expect(jobReport?.rows.length).toBe(3);
    expect(jobReport?.rows.find(r => r.sku === 'IMPT-SKU-002')?.status).toBe('INVALID');
    expect(jobReport?.rows.find(r => r.sku === 'IMPT-SKU-001')?.resultStatus).toBe('CREATED');
  });
});
