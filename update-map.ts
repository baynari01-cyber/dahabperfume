import { prisma } from './src/lib/db';

async function main() {
  const settings = await prisma.storeLocationSettings.findFirst();
  if (!settings) {
    await prisma.storeLocationSettings.create({
      data: {
        id: 'default',
        addressAr: 'وسط البلد، عمان',
        addressEn: 'Downtown, Amman',
        mapPlaceUrl: 'https://maps.app.goo.gl/6vNgkpRotjgZZA1E6',
        mapEmbedUrl: 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d108398.81881665487!2d35.83416410403754!3d31.954753579483327!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x151ca07246b96587%3A0x6b772b1d3db0fc0b!2sAmman!5e0!3m2!1sen!2sjo!4v1714488392120!5m2!1sen!2sjo',
        phone: '0799999999',
        whatsapp: '0799999999',
        locationSectionEnabled: true,
        latitude: 31.9547,
        longitude: 35.9106,
        openingHours: '10:00 AM - 10:00 PM',
      }
    });
  } else {
    await prisma.storeLocationSettings.update({
      where: { id: settings.id },
      data: {
        addressAr: settings.addressAr || 'وسط البلد، عمان',
        addressEn: settings.addressEn || 'Downtown, Amman',
        mapPlaceUrl: 'https://maps.app.goo.gl/6vNgkpRotjgZZA1E6',
        mapEmbedUrl: settings.mapEmbedUrl || 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d108398.81881665487!2d35.83416410403754!3d31.954753579483327!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x151ca07246b96587%3A0x6b772b1d3db0fc0b!2sAmman!5e0!3m2!1sen!2sjo!4v1714488392120!5m2!1sen!2sjo',
        phone: settings.phone || '0799999999',
        whatsapp: settings.whatsapp || '0799999999',
        locationSectionEnabled: true,
      }
    });
  }
  console.log('Map settings updated.');
}

main().catch(console.error).finally(() => process.exit(0));
