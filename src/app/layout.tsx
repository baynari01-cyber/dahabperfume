import type { Metadata } from "next";
import { Cairo, Tajawal } from "next/font/google";
import "./globals.css";

const cairo = Cairo({
  subsets: ["arabic"],
  variable: "--font-cairo",
  weight: ["400", "600", "700", "800"],
});

const tajawal = Tajawal({
  subsets: ["arabic"],
  variable: "--font-tajawal",
  weight: ["400", "500", "700"],
});

export const metadata: Metadata = {
  title: "Dahab Perfumes | دهب للعطور",
  description: "Dahab Perfumes - Premium Oriental Fragrances | دهب للعطور - فخامة تُترجم إلى عطر",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="ar" dir="rtl" className={`${cairo.variable} ${tajawal.variable}`}>
      <body className="antialiased min-h-screen flex flex-col">
        {children}
      </body>
    </html>
  );
}
