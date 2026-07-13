import { prisma } from '../src/lib/db';

async function main() {
  await prisma.storeLocationSettings.upsert({
    where: { id: 'default' },
    update: {
      storeName: 'دهب للعطور - Dahab Perfumes',
      addressAr: 'شارع الأمير محمد، مقابل زقاق سينما البتراء، وسط البلد، عمّان',
      addressEn: 'Prince Mohammed St, opposite Petra Cinema Alley, Downtown, Amman',
      latitude: 31.9515591,
      longitude: 35.9287313,
      mapPlaceUrl: 'https://maps.app.goo.gl/6vNgkpRotjgZZA1E6',
      mapEmbedUrl: 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3384.774577154245!2d35.9272305!3d31.9532394!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x151b5f7e6f6eb5e9%3A0x6b4eb5a5b51c8b3b!2sPrince%20Mohammad%20St%2C%20Amman!5e0!3m2!1sen!2sjo!4v1700000000000!5m2!1sen!2sjo',
      phone: '07 8505 0655',
      whatsapp: '0785050655',
      openingHours: 'يومياً: 10:00 صباحاً – 10:00 مساءً',
      locationSectionEnabled: true,
      directionsButtonEnabled: true,
      mapZoom: 15,
      mapLabelAr: 'خريطة الموقع التفاعلية',
      mapLabelEn: 'Interactive Location Map'
    },
    create: {
      id: 'default',
      storeName: 'دهب للعطور - Dahab Perfumes',
      addressAr: 'شارع الأمير محمد، مقابل زقاق سينما البتراء، وسط البلد، عمّان',
      addressEn: 'Prince Mohammed St, opposite Petra Cinema Alley, Downtown, Amman',
      latitude: 31.9515591,
      longitude: 35.9287313,
      mapPlaceUrl: 'https://maps.app.goo.gl/6vNgkpRotjgZZA1E6',
      mapEmbedUrl: 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3384.774577154245!2d35.9272305!3d31.9532394!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x151b5f7e6f6eb5e9%3A0x6b4eb5a5b51c8b3b!2sPrince%20Mohammad%20St%2C%20Amman!5e0!3m2!1sen!2sjo!4v1700000000000!5m2!1sen!2sjo',
      phone: '07 8505 0655',
      whatsapp: '0785050655',
      openingHours: 'يومياً: 10:00 صباحاً – 10:00 مساءً',
      locationSectionEnabled: true,
      directionsButtonEnabled: true,
      mapZoom: 15,
      mapLabelAr: 'خريطة الموقع التفاعلية',
      mapLabelEn: 'Interactive Location Map'
    }
  });
  console.log('Location settings updated');
}

main()
  .catch(e => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
