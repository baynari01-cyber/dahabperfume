import { NextResponse } from 'next/server';
import type { NextRequest } from 'next/server';

const SESSION_COOKIE_NAME = 'dahab_session';

export default function proxy(request: NextRequest) {
  const { pathname } = request.nextUrl;
  const sessionToken = request.cookies.get(SESSION_COOKIE_NAME)?.value;
  const roleCookie = request.cookies.get('dahab_role')?.value;

  const isAdminRoute = pathname.startsWith('/admin') && !pathname.startsWith('/admin/login');
  const isPosRoute = pathname.startsWith('/pos') && !pathname.startsWith('/pos/login');

  // 2. Absolute POS Cashier Isolation (P2-002)
  if (isAdminRoute && roleCookie === 'Cashier') {
    // Cashiers are completely isolated to /pos
    return NextResponse.redirect(new URL('/pos/cashier', request.url));
  }

  // Early routing check: if accessing protected routes without a cookie, redirect immediately.
  // Full database-backed session validation happens in Server Components and Server Actions.
  if (isAdminRoute && !sessionToken) {
    return NextResponse.redirect(new URL('/admin/login', request.url));
  }

  if (isPosRoute && !sessionToken) {
    return NextResponse.redirect(new URL('/pos/login', request.url));
  }

  // We intentionally allow access to /admin/login and /pos/login even if a sessionToken cookie exists.
  // This is because proxy.ts cannot validate the token against the database.
  // If the token is invalid/expired in the DB, redirecting them away from the login page
  // would cause an infinite redirect loop.

  // Locale handling logic
  const isPublicRoute = !pathname.startsWith('/admin') && !pathname.startsWith('/pos');
  if (isPublicRoute) {
    if (pathname === '/') {
      return NextResponse.redirect(new URL('/ar', request.url));
    }
    
    // If it doesn't start with /ar or /en, redirect to /ar/path
    const localeMatch = pathname.match(/^\/(ar|en)(\/|$)/);
    if (!localeMatch) {
      return NextResponse.redirect(new URL(`/ar${pathname}`, request.url));
    }
  }

  return NextResponse.next();
}

export const config = {
  matcher: [
    /*
     * Match all request paths except for the ones starting with:
     * - api (API routes)
     * - _next/static (static files)
     * - _next/image (image optimization files)
     * - favicon.ico (favicon file)
     * - logo.png and any other static files
     */
    '/((?!api|_next/static|_next/image|favicon.ico|.*\\.(?:svg|png|jpg|jpeg|gif|webp)$).*)',
  ],
};
