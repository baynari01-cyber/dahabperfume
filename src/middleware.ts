import { NextResponse } from 'next/server';
import type { NextRequest } from 'next/server';

const SESSION_COOKIE_NAME = 'dahab_session';

export function middleware(request: NextRequest) {
  const { pathname } = request.nextUrl;
  const sessionToken = request.cookies.get(SESSION_COOKIE_NAME)?.value;

  const isAdminRoute = pathname.startsWith('/admin') && pathname !== '/admin/login';
  const isPosRoute = pathname.startsWith('/pos') && pathname !== '/pos/login';

  // Early routing check: if accessing protected routes without a cookie, redirect immediately.
  // Full database-backed session validation happens in Server Components and Server Actions.
  if (isAdminRoute && !sessionToken) {
    return NextResponse.redirect(new URL('/admin/login', request.url));
  }

  if (isPosRoute && !sessionToken) {
    return NextResponse.redirect(new URL('/pos/login', request.url));
  }

  // Prevent logged-in users from seeing login pages
  if ((pathname === '/admin/login' || pathname === '/pos/login') && sessionToken) {
    // We don't know their role here, but we can default to /admin or /pos
    const redirectPath = pathname.startsWith('/admin') ? '/admin' : '/pos';
    return NextResponse.redirect(new URL(redirectPath, request.url));
  }

  // Locale handling logic (simplified):
  // Default to /ar if hitting root
  if (pathname === '/') {
    return NextResponse.redirect(new URL('/ar', request.url));
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
     */
    '/((?!api|_next/static|_next/image|favicon.ico).*)',
  ],
};
