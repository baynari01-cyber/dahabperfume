import { Header } from '@/components/Header';
import { Footer } from '@/components/Footer';

export default function PublicLayout({
  children,
  params,
}: {
  children: React.ReactNode;
  params: Promise<{ locale: string }>;
}) {
  return (
    <div className="flex flex-col min-h-screen">
      <Header />
      <div className="flex-1">
        {children}
      </div>
      <Footer />
    </div>
  );
}
