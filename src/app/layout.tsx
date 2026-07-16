import type { Metadata } from "next";
import { Cairo, Tajawal } from "next/font/google";
import "./globals.css";

const cairo = Cairo({
  subsets: ["arabic"],
  variable: "--font-cairo",
  weight: ["400", "600", "700", "800"],
  display: 'swap',
});

const tajawal = Tajawal({
  subsets: ["arabic"],
  variable: "--font-tajawal",
  weight: ["400", "500", "700"],
  display: 'swap',
});

const BASE_URL = 'https://dahabperfumes.com';

export const metadata: Metadata = {
  metadataBase: new URL(BASE_URL),
  title: {
    default: 'دهب للعطور | Dahab Perfumes — عطور فاخرة في عمّان، الأردن',
    template: '%s | دهب للعطور',
  },
  description:
    'دهب للعطور — وجهتك الأولى للعطور الشرقية الفاخرة في عمّان منذ 2007. اكتشف تشكيلتنا من العود والمسك والبخور والعطور المميزة. Dahab Perfumes — Premium Oriental Fragrances in Amman, Jordan since 2007.',
  keywords: [
    'دهب للعطور',
    'عطور عمّان',
    'عطور الأردن',
    'عطور فاخرة',
    'عطور شرقية',
    'عود',
    'مسك',
    'بخور',
    'عطور رجالية',
    'عطور نسائية',
    'Dahab Perfumes',
    'Perfumes Jordan',
    'Perfumes Amman',
    'Oriental Fragrances',
    'Oud',
    'Musk',
    'Arabic Perfume',
    'luxury perfume jordan',
    'دهب عطور وسط البلد',
    'محل عطور عمان',
  ],
  authors: [{ name: 'دهب للعطور', url: BASE_URL }],
  creator: 'دهب للعطور — Dahab Perfumes',
  publisher: 'دهب للعطور — Dahab Perfumes',
  robots: {
    index: true,
    follow: true,
    googleBot: {
      index: true,
      follow: true,
      'max-video-preview': -1,
      'max-image-preview': 'large',
      'max-snippet': -1,
    },
  },
  openGraph: {
    type: 'website',
    locale: 'ar_JO',
    alternateLocale: ['en_US'],
    url: BASE_URL,
    siteName: 'دهب للعطور | Dahab Perfumes',
    title: 'دهب للعطور | Dahab Perfumes — عطور فاخرة في عمّان',
    description:
      'وجهتك الأولى للعطور الشرقية الفاخرة في عمّان. اكتشف مجموعاتنا من العود والمسك والعطور الراقية. Your premier destination for luxury oriental fragrances in Amman, Jordan.',
    images: [
      {
        url: `${BASE_URL}/og-image.jpg`,
        width: 1200,
        height: 630,
        alt: 'دهب للعطور — Dahab Perfumes',
      },
    ],
  },
  twitter: {
    card: 'summary_large_image',
    title: 'دهب للعطور | Dahab Perfumes',
    description: 'عطور شرقية فاخرة من قلب عمّان منذ 2007',
    images: [`${BASE_URL}/og-image.jpg`],
  },
  // تحقق Google Search Console — أضف verification code هنا عند الربط
  // verification: {
  //   google: 'YOUR_GOOGLE_VERIFICATION_CODE',
  // },
  alternates: {
    canonical: BASE_URL,
    languages: {
      'ar': `${BASE_URL}/ar`,
      'en': `${BASE_URL}/en`,
    },
  },
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
