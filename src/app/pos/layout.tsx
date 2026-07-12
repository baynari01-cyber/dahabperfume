import { requireAuth } from '@/lib/dal';

export default async function POSLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <div className="h-screen bg-zinc-100 dark:bg-zinc-900 overflow-hidden flex flex-col font-body" dir="rtl">
      {/* POS Top Bar */}
      <header className="bg-white dark:bg-zinc-800 border-b border-zinc-200 dark:border-zinc-700 p-4 flex justify-between items-center shadow-sm z-10 shrink-0">
        <div className="flex items-center gap-4">
          <div className="text-[var(--color-champagne-600)] font-heading font-bold text-xl tracking-widest">
            DAHAB POS
          </div>
          <div className="h-6 w-px bg-zinc-300 dark:bg-zinc-700"></div>
          <div className="text-sm font-bold text-zinc-600 dark:text-zinc-400">
            نقطة البيع - الفرع الرئيسي
          </div>
        </div>
        <div className="flex items-center gap-4 text-sm">
          <div className="bg-emerald-100 text-emerald-800 dark:bg-emerald-900/30 dark:text-emerald-400 px-3 py-1 rounded-full font-medium">
            متصل
          </div>
          <div className="font-medium text-zinc-700 dark:text-zinc-300">
            الكاشير
          </div>
        </div>
      </header>
      
      {/* POS Content Area */}
      <div className="flex-1 overflow-hidden flex">
        {children}
      </div>
    </div>
  );
}
