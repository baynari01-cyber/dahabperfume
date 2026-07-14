'use client';

import React, { useState } from 'react';
import { useRouter, useSearchParams } from 'next/navigation';
import Link from 'next/link';

interface SalesFiltersProps {
  filterEmployee: string;
  filterSource: string;
  filterPayMethod: string;
  filterStartDate?: string;
  filterEndDate?: string;
  employees: { id: string; name: string }[];
}

export function SalesFilters({ filterEmployee, filterSource, filterPayMethod, filterStartDate, filterEndDate, employees }: SalesFiltersProps) {
  const router = useRouter();
  const searchParams = useSearchParams();

  const [employee, setEmployee] = useState(filterEmployee);
  const [source, setSource] = useState(filterSource);
  const [payMethod, setPayMethod] = useState(filterPayMethod);
  const [startDate, setStartDate] = useState(filterStartDate || '');
  const [endDate, setEndDate] = useState(filterEndDate || '');

  const applyFilters = () => {
    const params = new URLSearchParams(searchParams.toString());
    if (employee) params.set('employeeId', employee); else params.delete('employeeId');
    if (source) params.set('source', source); else params.delete('source');
    if (payMethod) params.set('payMethod', payMethod); else params.delete('payMethod');
    if (startDate) params.set('startDate', startDate); else params.delete('startDate');
    if (endDate) params.set('endDate', endDate); else params.delete('endDate');
    router.push(`?${params.toString()}`);
  };

  const exportCSV = () => {
    window.location.href = `/api/export/sales?${searchParams.toString()}`;
  };

  return (
    <div className="bg-white p-4 rounded-lg shadow-sm border border-[var(--color-ivory-200)] mb-6">
      <div className="flex flex-wrap gap-4 text-sm mb-4">
        <div>
          <label className="block text-xs font-bold text-zinc-600 mb-1">الموظف (الكاشير)</label>
          <select className="border rounded p-2 text-xs" value={employee} onChange={e => setEmployee(e.target.value)}>
            <option value="">الجميع</option>
            {employees.map(e => <option key={e.id} value={e.id}>{e.name}</option>)}
          </select>
        </div>

        <div>
          <label className="block text-xs font-bold text-zinc-600 mb-1">نوع الطلب (المصدر)</label>
          <select className="border rounded p-2 text-xs" value={source} onChange={e => setSource(e.target.value)}>
            <option value="">الجميع</option>
            <option value="POS">نقطة بيع (كاش)</option>
            <option value="STOREFRONT">طلب متجر (توصيل)</option>
          </select>
        </div>
        
        <div>
          <label className="block text-xs font-bold text-zinc-600 mb-1">طريقة الدفع</label>
          <select className="border rounded p-2 text-xs" value={payMethod} onChange={e => setPayMethod(e.target.value)}>
            <option value="">الجميع</option>
            <option value="CASH">نقدي</option>
            <option value="CARD">بطاقة</option>
          </select>
        </div>

        <div>
          <label className="block text-xs font-bold text-zinc-600 mb-1">من تاريخ</label>
          <input type="date" className="border rounded p-2 text-xs" value={startDate} onChange={e => setStartDate(e.target.value)} />
        </div>

        <div>
          <label className="block text-xs font-bold text-zinc-600 mb-1">إلى تاريخ</label>
          <input type="date" className="border rounded p-2 text-xs" value={endDate} onChange={e => setEndDate(e.target.value)} />
        </div>
      </div>

      <div className="flex justify-between items-center border-t border-zinc-100 pt-4 mt-2">
        <div className="flex gap-2">
          <button onClick={applyFilters} className="bg-[var(--color-charcoal-900)] text-white px-4 py-2 rounded text-xs font-bold">
            تطبيق الفلاتر
          </button>
          <Link href="/admin/sales" className="text-zinc-500 hover:text-red-600 px-4 py-2 text-xs font-bold">
            إلغاء الفلاتر
          </Link>
        </div>
        <div className="flex gap-2">
          <button onClick={exportCSV} className="bg-emerald-600 text-white px-4 py-2 rounded text-xs font-bold hover:bg-emerald-700 transition-colors">
            تصدير إلى Excel/CSV
          </button>
          <button onClick={() => window.print()} className="bg-red-600 text-white px-4 py-2 rounded text-xs font-bold hover:bg-red-700 transition-colors">
            تصدير كـ PDF
          </button>
        </div>
      </div>
    </div>
  );
}
