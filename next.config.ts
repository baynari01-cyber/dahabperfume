import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  images: {
    remotePatterns: [
      {
        protocol: 'https',
        hostname: 'placehold.co',
      },
    ],
    dangerouslyAllowSVG: true,
  },
  async redirects() {
    return [
      {
        source: '/',
        destination: '/ar',
        permanent: true,
      },
    ];
  },
};

export default nextConfig;
