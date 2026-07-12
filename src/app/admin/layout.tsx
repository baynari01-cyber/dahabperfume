import { requireAuth } from '@/lib/dal';

export default async function AdminLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  // We check auth here. Note: this runs for all /admin routes.
  // BUT we don't want it to run on /admin/login. So we either skip /admin/login
  // or put it in a (dashboard) route group. Since /admin/login is inside /admin,
  // we can check if it's not the login page.
  // Actually, layout.tsx in /admin wraps /admin/login too! 
  // It's better to move dashboard pages to /admin/(dashboard) or just do nothing here 
  // and do requireAuth in each page, OR we can conditionally skip if not possible.
  // Let's just render children here, and enforce requireAuth in page.tsx components
  // OR we restructure to use route groups. Let's use a route group later if needed.
  
  return (
    <div className="min-h-screen bg-zinc-50 dark:bg-zinc-900">
      {children}
    </div>
  );
}
