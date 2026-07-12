import { describe, it, expect, vi, beforeAll, afterAll } from 'vitest';
import { prisma } from '@/lib/db';

// Mock auth checks
let activeEmployeeId = 'emp-cms-admin';
vi.mock('@/lib/dal', () => {
  return {
    requirePermission: vi.fn(async (perm) => {
      if (activeEmployeeId === 'unauthorized') {
        throw new Error('غير مصرح لك بإجراء هذه العملية');
      }
      return { employeeId: activeEmployeeId };
    })
  };
});

vi.mock('server-only', () => ({}));
vi.mock('next/cache', () => ({
  revalidatePath: vi.fn()
}));
vi.mock('next/headers', () => ({
  headers: vi.fn(() => ({
    get: vi.fn((key) => {
      if (key === 'host') return 'localhost:3000';
      if (key === 'origin') return 'http://localhost:3000';
      return null;
    })
  }))
}));

import {
  getHeroCarouselSettings,
  updateHeroCarouselSettings,
  getHeroSlides,
  createHeroSlide,
  updateHeroSlide,
  deleteHeroSlide,
  reorderHeroSlides,
  getStoreLocationSettings,
  updateStoreLocationSettings
} from '@/actions/homepage-cms';

describe('Homepage CMS Integration & Visual Settings Audits', () => {
  let adminId = 'emp-cms-admin';
  let categoryId: string;
  let testProductId: string;

  beforeAll(async () => {
    const adminRole = await prisma.role.upsert({
      where: { name: 'ADMIN' },
      update: {},
      create: { name: 'ADMIN', description: 'Admin' }
    });

    await prisma.employee.upsert({
      where: { id: adminId },
      update: {},
      create: {
        id: adminId,
        email: 'cms-admin@dahab.local',
        passwordHash: 'dummy',
        name: 'CMS Admin',
        roleId: adminRole.id
      }
    });

    const cat = await prisma.category.create({
      data: {
        name: 'عطور تصنيف CMS',
        slug: 'cms-cat-slug-' + Date.now()
      }
    });
    categoryId = cat.id;

    const prod = await prisma.product.create({
      data: {
        nameAr: 'عطر CMS تجريبي',
        nameEn: 'CMS Test Perfume',
        slug: 'cms-test-perfume-slug-' + Date.now(),
        sku: 'CMS-SKU-001',
        categoryId: categoryId
      }
    });
    testProductId = prod.id;
  });

  afterAll(async () => {
    await prisma.homepageHeroSlide.deleteMany();
    await prisma.homepageHeroCarouselSettings.deleteMany();
    await prisma.storeLocationSettings.deleteMany();
    await prisma.product.deleteMany({ where: { id: testProductId } });
    await prisma.category.deleteMany({ where: { id: categoryId } });
    await prisma.employee.deleteMany({ where: { id: adminId } });
  });

  it('should enforce carousel settings timing validations and persistence', async () => {
    activeEmployeeId = adminId;

    // Save initial timing configuration
    const updateRes = await updateHeroCarouselSettings({
      enabled: true,
      autoplayEnabled: true,
      autoplayIntervalMs: 5000,
      pauseOnHover: true,
      showIndicators: true,
      showNavigation: true,
      transitionType: 'FADE'
    });

    expect(updateRes.success).toBe(true);
    expect(updateRes.settings.autoplayIntervalMs).toBe(5000);

    // Verify loading settings returns saved values
    const settings = await getHeroCarouselSettings();
    expect(settings.autoplayIntervalMs).toBe(5000);

    // Timing check limits: should fail if under 3000ms
    await expect(updateHeroCarouselSettings({
      enabled: true,
      autoplayEnabled: true,
      autoplayIntervalMs: 2000, // Invalid: under 3s
      pauseOnHover: true,
      showIndicators: true,
      showNavigation: true,
      transitionType: 'FADE'
    })).rejects.toThrow();
  });

  it('should filter public slides by startsAt / endsAt timelines and sorting order', async () => {
    activeEmployeeId = adminId;

    // Create 3 slides with different parameters
    const s1 = await createHeroSlide({
      titleAr: 'سلايد 1 صيفي',
      titleEn: 'Slide 1 Summer',
      descriptionAr: 'وصف صيف',
      descriptionEn: 'Desc Summer',
      imageDesktopPath: '/s1.jpg',
      imageMobilePath: '/s1-mob.jpg',
      altAr: 'صورة 1',
      altEn: 'Image 1',
      destinationType: 'NONE',
      displayOrder: 2, // higher order, should be sorted last
      isEnabled: true,
      openInNewTab: false,
      overlayStrength: 0.4,
      textPosition: 'CENTER'
    });

    const s2 = await createHeroSlide({
      titleAr: 'سلايد 2 معطل',
      titleEn: 'Slide 2 Disabled',
      descriptionAr: 'وصف معطل',
      descriptionEn: 'Desc Disabled',
      imageDesktopPath: '/s2.jpg',
      imageMobilePath: '/s2-mob.jpg',
      altAr: 'صورة 2',
      altEn: 'Image 2',
      destinationType: 'NONE',
      displayOrder: 0,
      isEnabled: false, // Disabled: should not appear in active filtered queries
      openInNewTab: false,
      overlayStrength: 0.4,
      textPosition: 'CENTER'
    });

    const s3 = await createHeroSlide({
      titleAr: 'سلايد 3 مجدول',
      titleEn: 'Slide 3 Future',
      descriptionAr: 'وصف مستقبلي',
      descriptionEn: 'Desc Future',
      imageDesktopPath: '/s3.jpg',
      imageMobilePath: '/s3-mob.jpg',
      altAr: 'صورة 3',
      altEn: 'Image 3',
      destinationType: 'NONE',
      displayOrder: 1,
      isEnabled: true,
      startsAt: new Date(Date.now() + 1000 * 60 * 60).toISOString(), // Future start date: should be filtered out
      openInNewTab: false,
      overlayStrength: 0.4,
      textPosition: 'CENTER'
    });

    const allSlides = await getHeroSlides();
    expect(allSlides.length).toBe(3);

    // Verify ordering query
    expect(allSlides[0].displayOrder).toBe(0); // s2
    expect(allSlides[1].displayOrder).toBe(1); // s3
    expect(allSlides[2].displayOrder).toBe(2); // s1

    // Filter active slides
    const now = new Date();
    const active = allSlides.filter(s => {
      if (!s.isEnabled) return false;
      if (s.startsAt && new Date(s.startsAt) > now) return false;
      if (s.endsAt && new Date(s.endsAt) < now) return false;
      return true;
    });

    // Only s1 should remain active
    expect(active.length).toBe(1);
    expect(active[0].id).toBe(s1.slide.id);

    // Cleanup
    await deleteHeroSlide(s1.slide.id);
    await deleteHeroSlide(s2.slide.id);
    await deleteHeroSlide(s3.slide.id);
  });

  it('should reject unsafe javascript: link templates in destination paths', async () => {
    activeEmployeeId = adminId;

    await expect(createHeroSlide({
      titleAr: 'سلايد جافا سكريبت ضار',
      titleEn: 'Unsafe JavaScript Slide',
      descriptionAr: 'وصف ضار',
      descriptionEn: 'Unsafe description',
      imageDesktopPath: '/x.jpg',
      imageMobilePath: '/x-mob.jpg',
      altAr: 'بديل',
      altEn: 'Alt',
      destinationType: 'EXTERNAL_URL',
      externalUrl: 'javascript:alert("XSS")', // Dangerous link
      displayOrder: 0,
      isEnabled: true,
      openInNewTab: false,
      overlayStrength: 0.4,
      textPosition: 'CENTER'
    })).rejects.toThrow('الرابط غير آمن');
  });

  it('should enforce coordinate validation limits and telephone checks on location configuration changes', async () => {
    activeEmployeeId = adminId;

    const validLoc = {
      storeName: 'معرض دهب للعطور',
      addressAr: 'عمان، الجاردنز',
      addressEn: 'Amman, Gardens St',
      latitude: 31.9822,
      longitude: 35.8925,
      mapPlaceUrl: 'https://maps.google.com/place',
      mapEmbedUrl: 'https://maps.google.com/embed',
      phone: '0790123456',
      whatsapp: '962790123456',
      openingHours: '10:00 - 22:00',
      locationSectionEnabled: true,
      directionsButtonEnabled: true,
      mapZoom: 15,
      mapLabelAr: 'فرعنا الرئيسي',
      mapLabelEn: 'Main Branch',
      sectionOrder: 10
    };

    const res = await updateStoreLocationSettings(validLoc);
    expect(res.success).toBe(true);

    // Coordinates check limits: invalid latitude (e.g. 95) must fail zod schema parsing
    await expect(updateStoreLocationSettings({
      ...validLoc,
      latitude: 95.0 // Invalid: must be <= 90
    })).rejects.toThrow();

    // Invalid phone number format or length must fail validation checks
    await expect(updateStoreLocationSettings({
      ...validLoc,
      phone: '' // Invalid empty
    })).rejects.toThrow();
  });

  it('should restrict CMS management access exclusively to authorized Admins', async () => {
    activeEmployeeId = 'unauthorized'; // Simulate unauthorized user

    await expect(updateHeroCarouselSettings({
      enabled: true,
      autoplayEnabled: true,
      autoplayIntervalMs: 5000,
      pauseOnHover: true,
      showIndicators: true,
      showNavigation: true,
      transitionType: 'FADE'
    })).rejects.toThrow('غير مصرح لك');
  });
});
