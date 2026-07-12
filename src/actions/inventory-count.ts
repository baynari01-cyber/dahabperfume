'use server';

import { prisma } from '@/lib/db';
import { requirePermission } from '@/lib/dal';
import crypto from 'crypto';

export async function createCountSession(data: {
  title: string;
  assignedEmployeeId: string;
  scopeType: 'ALL' | 'LIQUID' | 'CATEGORY' | 'SPECIFIC';
  categoryIds?: string[];
  productIds?: string[];
  notes?: string;
}) {
  const session = await requirePermission('inventory.counts.create');
  
  // 1. Generate unique reference: CNT-YYYYMMDD-HEX
  const dateStr = new Date().toISOString().slice(0, 10).replace(/-/g, '');
  const randHex = crypto.randomBytes(3).toString('hex').toUpperCase();
  const reference = `CNT-${dateStr}-${randHex}`;
  
  // 2. Fetch products based on scopeType
  let products: any[] = [];
  if (data.scopeType === 'ALL') {
    products = await prisma.product.findMany({ include: { liquidStock: true, variants: true } });
  } else if (data.scopeType === 'LIQUID') {
    products = await prisma.product.findMany({
      where: { inventoryMode: 'DIRECT_LIQUID' },
      include: { liquidStock: true, variants: true }
    });
  } else if (data.scopeType === 'CATEGORY') {
    products = await prisma.product.findMany({
      where: { categoryId: { in: data.categoryIds || [] } },
      include: { liquidStock: true, variants: true }
    });
  } else if (data.scopeType === 'SPECIFIC') {
    products = await prisma.product.findMany({
      where: { id: { in: data.productIds || [] } },
      include: { liquidStock: true, variants: true }
    });
  }

  // 3. Capture current stock levels, version snapshots, and movement markers
  const startMarkers: Record<string, { lastMovementId: string | null; lastMovementTime: string }> = {};
  const stockVersionSnapshot: Record<string, number> = {};
  const expectedQuantityMlSnapshot: Record<string, number> = {};
  const linesData = [];

  for (const prod of products) {
    let expectedMl = 0;
    let expectedUnits = 0;
    
    if (prod.inventoryMode === 'DIRECT_LIQUID') {
      expectedMl = prod.liquidStock?.quantityMl || 0;
      stockVersionSnapshot[prod.id] = prod.liquidStock?.version ?? 0;
      expectedQuantityMlSnapshot[prod.id] = expectedMl;

      const lastMov = await prisma.productLiquidMovement.findFirst({
        where: { productId: prod.id },
        orderBy: { createdAt: 'desc' }
      });
      startMarkers[prod.id] = {
        lastMovementId: lastMov?.id || null,
        lastMovementTime: (lastMov?.createdAt || new Date()).toISOString()
      };
    } else {
      expectedUnits = prod.variants.reduce((sum: number, v: any) => sum + v.stock, 0);
      const skus = prod.variants.map((v: any) => v.sku);
      const lastMov = await prisma.inventoryMovement.findFirst({
        where: { sku: { in: skus } },
        orderBy: { createdAt: 'desc' }
      });
      startMarkers[prod.id] = {
        lastMovementId: lastMov?.id || null,
        lastMovementTime: (lastMov?.createdAt || new Date()).toISOString()
      };
    }

    linesData.push({
      productId: prod.id,
      inventoryMode: prod.inventoryMode,
      expectedQuantityMlSnapshot: expectedMl,
      expectedUnitsSnapshot: expectedUnits,
      countedQuantityMl: 0,
      countedUnits: 0,
      varianceMl: 0,
      varianceUnits: 0,
      countStatus: 'PENDING'
    });
  }

  const notesMetadata = {
    userNotes: data.notes || '',
    countStartedAt: new Date().toISOString(),
    startMarkers,
    stockVersionSnapshot,
    expectedQuantityMlSnapshot
  };

  const countSession = await prisma.inventoryCountSession.create({
    data: {
      reference,
      title: data.title,
      status: 'ASSIGNED',
      assignedEmployeeId: data.assignedEmployeeId,
      assignedByEmployeeId: session.employeeId,
      scopeType: data.scopeType,
      startedAt: new Date(),
      notes: JSON.stringify(notesMetadata),
      lines: {
        create: linesData
      }
    },
    include: {
      lines: true
    }
  });

  return countSession;
}

export async function getEmployeeCountSession(sessionId: string) {
  // Enforce pos:access or settings/counts permission
  const session = await requirePermission('pos:access');
  
  let blindCountEnabled = true;
  if (prisma.siteSettings) {
    const settings = await prisma.siteSettings.findUnique({
      where: { key: 'blind_count_enabled' }
    });
    if (settings) {
      blindCountEnabled = settings.value === 'true';
    }
  }

  const countSession = await prisma.inventoryCountSession.findUnique({
    where: { id: sessionId },
    include: {
      lines: {
        include: {
          product: true
        }
      }
    }
  });

  if (!countSession) {
    throw new Error('جلسة الجرد غير موجودة');
  }

  // True blind-count non-disclosure: completely omit expected values if blind count is enabled
  if (blindCountEnabled) {
    const cleanLines = countSession.lines.map((line: any) => ({
      countSessionId: countSession.id,
      countLineId: line.id,
      productId: line.productId,
      image: line.product.image || null,
      SKU: line.product.sku,
      productNameAr: line.product.nameAr,
      productNameEn: line.product.nameEn || '',
      countingUnit: line.inventoryMode === 'DIRECT_LIQUID' ? 'ml' : 'unit',
      countedQuantityMl: line.countedQuantityMl,
      countedUnits: line.countedUnits,
      employeeNote: line.employeeNote,
      status: line.countStatus
    }));

    return {
      id: countSession.id,
      reference: countSession.reference,
      title: countSession.title,
      status: countSession.status,
      lines: cleanLines
    } as any;
  }

  return countSession;
}

export async function saveCountSessionDraft(sessionId: string, linesCounted: Array<{
  lineId: string;
  countedQuantityMl: number;
  countedUnits?: number;
  employeeNote?: string;
}>) {
  await requirePermission('inventory.counts.submit');
  
  const updates = linesCounted.map(counted => 
    prisma.inventoryCountLine.update({
      where: { id: counted.lineId },
      data: {
        countedQuantityMl: counted.countedQuantityMl,
        countedUnits: counted.countedUnits ?? 0,
        employeeNote: counted.employeeNote || null
      }
    })
  );

  await prisma.$transaction(updates);
  return { success: true };
}

export async function submitCountSession(sessionId: string, linesCounted: Array<{
  lineId: string;
  countedQuantityMl: number;
  countedUnits?: number;
  employeeNote?: string;
}>) {
  const session = await requirePermission('inventory.counts.submit');
  
  const countSession = await prisma.inventoryCountSession.findUnique({
    where: { id: sessionId },
    include: { lines: true }
  });

  if (!countSession) {
    throw new Error('جلسة الجرد غير موجودة');
  }

  const updates = [];
  for (const counted of linesCounted) {
    const line = countSession.lines.find(l => l.id === counted.lineId);
    if (!line) continue;

    let varianceMl = 0;
    let varianceUnits = 0;

    if (line.inventoryMode === 'DIRECT_LIQUID') {
      varianceMl = counted.countedQuantityMl - line.expectedQuantityMlSnapshot;
    } else {
      const countedU = counted.countedUnits ?? 0;
      varianceUnits = countedU - (line.expectedUnitsSnapshot ?? 0);
    }

    updates.push(
      prisma.inventoryCountLine.update({
        where: { id: line.id },
        data: {
          countedQuantityMl: counted.countedQuantityMl,
          countedUnits: counted.countedUnits ?? 0,
          varianceMl,
          varianceUnits,
          countStatus: 'COUNTED',
          employeeNote: counted.employeeNote || null,
          countedAt: new Date()
        }
      })
    );
  }

  await prisma.$transaction(updates);

  const updatedSession = await prisma.inventoryCountSession.update({
    where: { id: sessionId },
    data: {
      status: 'SUBMITTED',
      submittedAt: new Date()
    }
  });

  return updatedSession;
}

export async function detectStaleLines(sessionId: string) {
  const countSession = await prisma.inventoryCountSession.findUnique({
    where: { id: sessionId },
    include: { lines: true }
  });

  if (!countSession) {
    throw new Error('جلسة الجرد غير موجودة');
  }

  const notesJson = JSON.parse(countSession.notes || '{}');
  const startMarkers = notesJson.startMarkers || {};
  const stockVersionSnapshot = notesJson.stockVersionSnapshot || {};
  const staleLineIds: string[] = [];

  for (const line of countSession.lines) {
    if (line.inventoryMode === 'DIRECT_LIQUID') {
      const currentStock = await prisma.productLiquidStock.findUnique({
        where: { productId: line.productId }
      });
      const expectedVersion = stockVersionSnapshot[line.productId] ?? 0;
      if (currentStock && currentStock.version !== expectedVersion) {
        staleLineIds.push(line.id);
      }
    } else {
      const startMarker = startMarkers[line.productId];
      if (!startMarker) continue;

      const prod = await prisma.product.findUnique({
        where: { id: line.productId },
        include: { variants: true }
      });
      const skus = prod?.variants.map((v: any) => v.sku) || [];
      const lastMov = await prisma.inventoryMovement.findFirst({
        where: { sku: { in: skus } },
        orderBy: { createdAt: 'desc' }
      });
      if (lastMov && lastMov.id !== startMarker.lastMovementId) {
        staleLineIds.push(line.id);
      }
    }
  }

  if (staleLineIds.length > 0) {
    await prisma.inventoryCountLine.updateMany({
      where: { id: { in: staleLineIds } },
      data: { countStatus: 'STALE' }
    });
  }

  return staleLineIds;
}

export async function approveCountSession(sessionId: string, managerNotes?: string) {
  // 1. Authenticate & Authorize manager
  const session = await requirePermission('inventory.counts.approve');
  const managerId = session.employeeId;

  // 2. Database Unique / Idempotency guard inside one PostgreSQL transaction
  const finalResult = await prisma.$transaction(async (tx) => {
    // 3. Reload session & stock details
    const countSession = await tx.inventoryCountSession.findUnique({
      where: { id: sessionId },
      include: {
        lines: {
          include: {
            product: {
              include: {
                variants: true,
                liquidStock: true
              }
            }
          }
        }
      }
    });

    if (!countSession) {
      throw new Error('جلسة الجرد غير موجودة');
    }

    // 4. Reject duplicate approvals (State-based idempotency lock)
    if (countSession.status === 'APPROVED') {
      throw new Error('جلسة الجرد معتمدة مسبقاً');
    }

    // 5. Enforce preventSelfApproval
    if (countSession.assignedEmployeeId === managerId) {
      throw new Error('لا يمكن للمشرف اعتماد جلسة الجرد المسندة لنفسه (منع الموافقة الذاتية)');
    }

    let isAnyLineStale = false;
    const notesJson = JSON.parse(countSession.notes || '{}');
    const stockVersionSnapshotMap = notesJson.stockVersionSnapshot || {};
    const startMarkers = notesJson.startMarkers || {};

    // 6. Verify stock versions and movement history
    for (const line of countSession.lines) {
      if (line.inventoryMode === 'DIRECT_LIQUID') {
        const currentStock = await tx.productLiquidStock.findUnique({
          where: { productId: line.productId }
        });
        const expectedVersion = stockVersionSnapshotMap[line.productId] ?? 0;
        if (currentStock && currentStock.version !== expectedVersion) {
          isAnyLineStale = true;
          await tx.inventoryCountLine.update({
            where: { id: line.id },
            data: { countStatus: 'STALE' }
          });
        }
      } else {
        const startMarker = startMarkers[line.productId];
        const skus = line.product.variants.map((v: any) => v.sku);
        const lastMov = await tx.inventoryMovement.findFirst({
          where: { sku: { in: skus } },
          orderBy: { createdAt: 'desc' }
        });
        if (startMarker && lastMov && lastMov.id !== startMarker.lastMovementId) {
          isAnyLineStale = true;
          await tx.inventoryCountLine.update({
            where: { id: line.id },
            data: { countStatus: 'STALE' }
          });
        }
      }
    }

    // If any line is stale, mark session status RECOUNT_REQUIRED and abort stock updates
    if (isAnyLineStale) {
      await tx.inventoryCountSession.update({
        where: { id: sessionId },
        data: { status: 'RECOUNT_REQUIRED' }
      });
      return { success: false, status: 'RECOUNT_REQUIRED', error: 'تم إحباط الاعتماد لوجود حركات مخزنية متداخلة (حالة متأخرة)' };
    }

    // 7. Calculate corrections and apply mutations
    for (const line of countSession.lines) {
      if (line.inventoryMode === 'DIRECT_LIQUID') {
        const currentStock = line.product.liquidStock;
        if (!currentStock) continue;

        const beforeMl = currentStock.quantityMl;
        const afterMl = beforeMl + line.varianceMl;

        // Apply stock adjustment, increment stock version
        await tx.productLiquidStock.update({
          where: { productId: line.productId },
          data: {
            quantityMl: afterMl,
            version: { increment: 1 },
            lastVerifiedAt: new Date(),
            lastVerifiedByEmployeeId: managerId,
            verificationStatus: 'VERIFIED'
          }
        });

        // Create one immutable correction movement
        await tx.productLiquidMovement.create({
          data: {
            productId: line.productId,
            type: 'CORRECTION',
            quantityBeforeMl: beforeMl,
            quantityChangeMl: line.varianceMl,
            quantityAfterMl: afterMl,
            employeeId: managerId,
            reason: `جرد معتمد: ${countSession.reference}`
          }
        });
      } else {
        if (line.varianceUnits !== 0) {
          const variant = line.product.variants.find(v => v.isActive) || line.product.variants[0];
          if (!variant) continue;

          await tx.productVariant.update({
            where: { id: variant.id },
            data: {
              stock: { increment: line.varianceUnits ?? 0 }
            }
          });

          await tx.inventoryMovement.create({
            data: {
              sku: variant.sku,
              type: 'CORRECTION',
              quantity: line.varianceUnits ?? 0,
              employeeId: managerId,
              reference: `COUNT_CORRECTION_${countSession.reference}`
            }
          });
        }
      }
    }

    // 8. Save employee and manager snapshots, mark count approved
    const updatedSession = await tx.inventoryCountSession.update({
      where: { id: sessionId },
      data: {
        status: 'APPROVED',
        approvedByEmployeeId: managerId,
        approvedAt: new Date(),
        notes: JSON.stringify({
          ...notesJson,
          managerNotes: managerNotes || '',
          approvedBySnapshot: session.employeeId
        })
      }
    });

    // 9. Create AuditLog
    await tx.auditLog.create({
      data: {
        employeeId: managerId,
        action: 'INVENTORY_COUNT_APPROVED',
        entityType: 'InventoryCountSession',
        entityId: sessionId,
        details: JSON.stringify({ reference: countSession.reference })
      }
    });

    return { success: true, status: 'APPROVED', session: updatedSession };
  });

  if (!finalResult.success) {
    throw new Error(finalResult.error);
  }

  return finalResult;
}
