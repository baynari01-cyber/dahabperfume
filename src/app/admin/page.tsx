import { requireAuth } from '@/lib/dal';
import { logout } from '@/actions/auth';

export default async function AdminDashboardPage() {
  const session = await requireAuth();

  return (
    <div className="p-8">
      <div className="flex justify-between items-center bg-white dark:bg-zinc-800 p-6 rounded-lg shadow-sm border border-zinc-100 dark:border-zinc-700">
        <div>
          <h1 className="text-2xl font-bold text-zinc-900 dark:text-white">Admin Dashboard</h1>
          <p className="text-zinc-600 dark:text-zinc-400 mt-1">
            Welcome back, {session.employee.name}
          </p>
        </div>
        
        <form action={logout}>
          <button 
            type="submit" 
            className="px-4 py-2 bg-zinc-100 dark:bg-zinc-700 hover:bg-zinc-200 dark:hover:bg-zinc-600 text-zinc-900 dark:text-white rounded-md text-sm font-medium transition-colors"
          >
            Sign out
          </button>
        </form>
      </div>

      <div className="mt-8 grid grid-cols-1 md:grid-cols-3 gap-6">
        {/* Dashboard widgets will go here */}
        <div className="bg-white dark:bg-zinc-800 p-6 rounded-lg shadow-sm border border-zinc-100 dark:border-zinc-700">
          <h3 className="text-lg font-medium text-zinc-900 dark:text-white">Total Orders</h3>
          <p className="mt-2 text-3xl font-bold text-emerald-600">0</p>
        </div>
        <div className="bg-white dark:bg-zinc-800 p-6 rounded-lg shadow-sm border border-zinc-100 dark:border-zinc-700">
          <h3 className="text-lg font-medium text-zinc-900 dark:text-white">Total Products</h3>
          <p className="mt-2 text-3xl font-bold text-emerald-600">0</p>
        </div>
        <div className="bg-white dark:bg-zinc-800 p-6 rounded-lg shadow-sm border border-zinc-100 dark:border-zinc-700">
          <h3 className="text-lg font-medium text-zinc-900 dark:text-white">Low Stock Alerts</h3>
          <p className="mt-2 text-3xl font-bold text-amber-500">0</p>
        </div>
      </div>
    </div>
  );
}
