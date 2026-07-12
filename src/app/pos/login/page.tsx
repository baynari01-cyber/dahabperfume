import React from 'react';
import Link from 'next/link';
import { requirePermission } from '@/lib/dal';

export default async function POSPage() {
  // POS security check
  await requirePermission('pos:access');

  return (
    <div className="min-h-screen bg-[var(--color-ivory-100)] py-12 px-6">
      <div className="max-w-4xl mx-auto bg-white border border-[var(--color-ivory-200)] rounded-xl p-8 shadow-md">
        <h1 className="text-3xl font-bold font-heading text-[var(--color-forest-900)] mb-6 border-b border-zinc-100 pb-4">
          Dahab Perfumes POS - LOGIN
        </h1>
        <p className="text-zinc-600 mb-8">
          Counter interface for retail checkout transactions, formula calculation, and receipt printing.
        </p>
        <Link 
          href="/pos"
          className="inline-block bg-[var(--color-forest-800)] text-white px-6 py-2 rounded hover:bg-[var(--color-forest-900)] transition-colors"
        >
          Return to Counter
        </Link>
      </div>
    </div>
  );
}
