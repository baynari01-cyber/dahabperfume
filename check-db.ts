import { prisma } from './src/lib/db';
async function main() {
  const count = await prisma.employee.count();
  console.log(`Total employees: ${count}`);
  const emp = await prisma.employee.findUnique({ where: { email: 'cashier@dahabperfume.local' } });
  console.log('Cashier employee:', emp ? 'Found' : 'Not found');
  if (emp) console.log('IsActive:', emp.isActive);
}
main().catch(console.error).finally(() => prisma.$disconnect());
