'use client';

import React, { useState, useTransition } from 'react';
import { saveCountSessionDraft, submitCountSession } from '@/actions/inventory-count';

interface POSCashierInventoryCountFormProps {
  countSession: {
    id: string;
    reference: string;
    title: string;
    lines: Array<{
      id: string;
      productId: string;
      inventoryMode: string;
      expectedQuantityMlSnapshot: number;
      countedQuantityMl: number;
      expectedUnitsSnapshot: number | null;
      countedUnits: number | null;
      employeeNote: string | null;
      product: {
        nameAr: string;
        nameEn: string;
        sku: string;
      };
    }>;
  };
}

export function POSCashierInventoryCountForm({ countSession }: POSCashierInventoryCountFormProps) {
  const [linesState, setLinesState] = useState(
    countSession.lines.map(line => ({
      lineId: line.id,
      inventoryMode: line.inventoryMode,
      countedQuantityMl: line.countedQuantityMl || 0,
      countedUnits: line.countedUnits || 0,
      literInput: line.countedQuantityMl ? (line.countedQuantityMl / 1000).toString() : '',
      employeeNote: line.employeeNote || '',
      productName: line.product.nameAr,
      sku: line.product.sku
    }))
  );

  const [isPending, startTransition] = useTransition();
  const [isSubmitPending, startSubmitTransition] = useTransition();

  const handleLiterChange = (idx: number, val: string) => {
    const parsed = parseFloat(val) || 0;
    const mlValue = Math.round(parsed * 1000);
    
    const updated = [...linesState];
    updated[idx].literInput = val;
    updated[idx].countedQuantityMl = mlValue;
    setLinesState(updated);
  };

  const handleMlChange = (idx: number, val: string) => {
    const parsed = parseInt(val, 10) || 0;
    
    const updated = [...linesState];
    updated[idx].countedQuantityMl = parsed;
    updated[idx].literInput = (parsed / 1000).toString();
    setLinesState(updated);
  };

  const handleUnitsChange = (idx: number, val: string) => {
    const parsed = parseInt(val, 10) || 0;
    
    const updated = [...linesState];
    updated[idx].countedUnits = parsed;
    setLinesState(updated);
  };

  const handleNoteChange = (idx: number, val: string) => {
    const updated = [...linesState];
    updated[idx].employeeNote = val;
    setLinesState(updated);
  };

  const handleSaveDraft = () => {
    const payload = linesState.map(l => ({
      lineId: l.lineId,
      countedQuantityMl: l.countedQuantityMl,
      countedUnits: l.countedUnits,
      employeeNote: l.employeeNote
    }));

    startTransition(async () => {
      await saveCountSessionDraft(countSession.id, payload);
      alert('تم حفظ المسودة بنجاح');
    });
  };

  const handleSubmit = () => {
    if (!confirm('هل أنت متأكد من رغبتك في اعتماد وإرسال عملية الجرد؟ لن تتمكن من التعديل بعد الإرسال.')) {
      return;
    }

    const payload = linesState.map(l => ({
      lineId: l.lineId,
      countedQuantityMl: l.countedQuantityMl,
      countedUnits: l.countedUnits,
      employeeNote: l.employeeNote
    }));

    startSubmitTransition(async () => {
      try {
        await submitCountSession(countSession.id, payload);
        alert('تم تقديم طلب الجرد بنجاح بنجاح');
        window.location.reload();
      } catch (e: any) {
        alert(e.message || 'حدث خطأ أثناء إرسال الجرد');
      }
    });
  };

  return (
    <div className="space-y-6" dir="rtl">
      <div className="bg-white p-4 md:p-6 rounded-lg border border-[var(--color-ivory-200)] shadow-sm space-y-4">
        {linesState.map((line, idx) => (
          <div key={line.lineId} className="p-4 bg-zinc-50/55 rounded-lg border border-zinc-100/50 flex flex-col md:flex-row md:items-center justify-between gap-4">
            <div className="space-y-1">
              <h3 className="font-bold text-zinc-900 text-sm">{line.productName}</h3>
              <p className="text-[10px] text-zinc-500">SKU: {line.sku} | النمط: {line.inventoryMode}</p>
            </div>

            <div className="flex flex-wrap items-center gap-4">
              {line.inventoryMode === 'DIRECT_LIQUID' ? (
                <div className="flex items-center gap-3">
                  <div className="flex flex-col gap-1 w-24">
                    <label className="text-[9px] font-bold text-zinc-400">الكمية (لتر)</label>
                    <input 
                      type="number" 
                      step="0.001"
                      value={line.literInput}
                      onChange={(e) => handleLiterChange(idx, e.target.value)}
                      placeholder="0.0"
                      className="border border-zinc-300 rounded px-2.5 py-1.5 text-xs text-left bg-white outline-none focus:ring-1 focus:ring-[var(--color-champagne-600)]"
                    />
                  </div>

                  <span className="text-zinc-300 font-bold self-end mb-2">/</span>

                  <div className="flex flex-col gap-1 w-24">
                    <label className="text-[9px] font-bold text-zinc-400">الكمية (مل)</label>
                    <input 
                      type="number" 
                      value={line.countedQuantityMl}
                      onChange={(e) => handleMlChange(idx, e.target.value)}
                      placeholder="0"
                      className="border border-zinc-300 rounded px-2.5 py-1.5 text-xs text-left bg-white outline-none focus:ring-1 focus:ring-[var(--color-champagne-600)]"
                    />
                  </div>
                </div>
              ) : (
                <div className="flex flex-col gap-1 w-32">
                  <label className="text-[9px] font-bold text-zinc-400">العدد الفعلي (علب)</label>
                  <input 
                    type="number" 
                    value={line.countedUnits}
                    onChange={(e) => handleUnitsChange(idx, e.target.value)}
                    placeholder="0"
                    className="border border-zinc-300 rounded px-2.5 py-1.5 text-xs text-left bg-white outline-none focus:ring-1 focus:ring-[var(--color-champagne-600)]"
                  />
                </div>
              )}

              <div className="flex flex-col gap-1 w-44 md:w-56">
                <label className="text-[9px] font-bold text-zinc-400">ملاحظات الجرد</label>
                <input 
                  type="text" 
                  value={line.employeeNote}
                  onChange={(e) => handleNoteChange(idx, e.target.value)}
                  placeholder="ملاحظات الموظف"
                  className="border border-zinc-300 rounded px-2.5 py-1.5 text-xs bg-white outline-none focus:ring-1 focus:ring-[var(--color-champagne-600)]"
                />
              </div>
            </div>
          </div>
        ))}
      </div>

      <div className="flex justify-end gap-4">
        <button
          onClick={handleSaveDraft}
          disabled={isPending || isSubmitPending}
          className="bg-neutral-800 hover:bg-neutral-700 text-white font-bold px-6 py-2.5 rounded text-xs transition-colors"
        >
          {isPending ? 'جاري الحفظ...' : 'حفظ كمسودة'}
        </button>
        <button
          onClick={handleSubmit}
          disabled={isPending || isSubmitPending}
          className="bg-[var(--color-forest-800)] hover:bg-[var(--color-forest-900)] text-white font-bold px-6 py-2.5 rounded text-xs transition-colors shadow-md"
        >
          {isSubmitPending ? 'جاري الإرسال...' : 'تقديم واعتماد الجرد'}
        </button>
      </div>
    </div>
  );
}
