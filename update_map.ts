import { prisma } from './src/lib/db';

async function main() {
  await prisma.storeLocationSettings.upsert({
    where: { id: 'default' },
    update: {
      mapPlaceUrl: 'https://maps.app.goo.gl/GFmvPKq52rFhLWdw8',
      mapEmbedUrl: 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3384.811565576135!2d35.9334!3d31.9522!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x151b5f0022378dd7%3A0x6b4db63f684dc3cf!2sDahab%20Perfumes!5e0!3m2!1sen!2sjo!4v1700000000000!5m2!1sen!2sjo',
      phone: '+962790000000',
      whatsapp: '+962790000000',
      addressAr: 'عمان، وسط البلد، شارع الأمير محمد',
      addressEn: 'Amman, Downtown, Prince Mohammed St',
    },
    create: {
      id: 'default',
      storeName: 'Dahab Perfumes',
      mapPlaceUrl: 'https://maps.app.goo.gl/GFmvPKq52rFhLWdw8',
      mapEmbedUrl: 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3384.811565576135!2d35.9334!3d31.9522!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x151b5f0022378dd7%3A0x6b4db63f684dc3cf!2sDahab%20Perfumes!5e0!3m2!1sen!2sjo!4v1700000000000!5m2!1sen!2sjo',
      phone: '+962790000000',
      whatsapp: '+962790000000',
      addressAr: 'عمان، وسط البلد، شارع الأمير محمد',
      addressEn: 'Amman, Downtown, Prince Mohammed St',
      openingHours: '10:00 AM - 11:00 PM',
      latitude: 31.9522,
      longitude: 35.9334,
      locationSectionEnabled: true,
      directionsButtonEnabled: true,
      mapZoom: 15,
    }
  });
  console.log("Updated Map settings");
}

main().finally(() => prisma.$disconnect());
