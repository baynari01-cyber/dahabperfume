const fs = require('fs');
const path = require('path');

const adminDir = path.join(process.cwd(), 'src', 'app', 'admin');

function walk(dir) {
  const files = fs.readdirSync(dir);
  for (const file of files) {
    const fullPath = path.join(dir, file);
    if (fs.statSync(fullPath).isDirectory()) {
      walk(fullPath);
    } else if (fullPath.endsWith('page.tsx')) {
      let content = fs.readFileSync(fullPath, 'utf8');
      if (content.includes('<AdminSidebar')) {
        // Replace <AdminSidebar employeeName={...} />
        // Replace <AdminSidebar employeeName={...} permissions={...} />
        // with <AdminSidebar employeeName={...} roleName={session.employee.role.name} />
        content = content.replace(/<AdminSidebar employeeName={([^}]+)}[^>]*\/>/g, (match, p1) => {
          let roleProp = 'session?.employee?.role?.name || "ADMIN"';
          // if it uses `user?.name`, maybe session is `user` or something else
          if (p1.includes('user')) {
             roleProp = '"ADMIN"'; // Fallback
          }
          return `<AdminSidebar employeeName={${p1}} roleName={${roleProp}} />`;
        });
        fs.writeFileSync(fullPath, content);
      }
    }
  }
}

walk(adminDir);
console.log('Sidebar references updated.');
