import { redirect } from 'next/navigation';

export default async function POSCounterPage() {
  redirect('/pos/cashier');
}
