/// English (the source language).
///
/// This is the complete set — every entry the site can render. A new language
/// starts as a copy of this file, so use it as the template rather than one of
/// the partial translations.
///
/// It is also the **fallback**: `SiteStrings` defaults every field to an empty
/// string, and `withFallbackTo` fills those in from here. That is why a
/// translation only carries what it has actually translated, and why English
/// text lives in this file and nowhere else.
library;

import '../site_strings.dart';

const stringsEn = SiteStrings(
  // ── Navigation ──
  clockAm: 'am',
  clockPm: 'pm',
  unitKm: 'km',
  navHome: 'Home',
  navDelivery: 'Delivery',
  navShop: 'Food & Shop',
  navHowItWorks: 'How it works',
  navContact: 'Contact',
  orderNow: 'Order now',
  getTheApp: 'Get the app',
  navAriaMain: 'Main',
  navAriaOpenMenu: 'Open menu',
  navAriaCloseMenu: 'Close menu',
  navAriaLightMode: 'Switch to light mode',
  navAriaDarkMode: 'Switch to dark mode',
  brandAriaHome: '{brand} — home',
  logoAlt: '{brand} logo',

  // ── Modules ──
  moduleFood: 'Food',
  moduleShop: 'Shop',

  // ── Hero ──
  heroBadge: 'Delivering across {city} · Open {hours}',
  heroImageAlt: 'A {brand} rider on the way to a customer',
  heroStatOrders: 'Orders delivered',
  heroStatDelivery: 'Average delivery',
  heroStatAreas: 'Areas covered',
  trackOrderRef: 'Order #4821',
  trackOnTheWay: 'On the way',
  trackEta: 'ETA',
  trackDistance: 'Distance',
  trackStatus: 'Status',
  trackEtaValue: '12 min',
  trackDistanceValue: '1.8 km',
  trackStatusValue: 'Paid',
  notifTitle: 'Order update',
  notifBody: 'Your rider is almost there — arriving in 3 min.',

  // ── Reassurance strip ──
  trustFastDelivery: 'Fast local delivery',
  trustLiveTracking: 'Live rider tracking',
  trustPayment: 'Card, wallet or cash',
  trustSupport: 'Real people on support',

  // ── Delivery area ──
  zoneEyebrow: 'Delivery area',
  zoneTitle: 'Do we deliver to you?',
  zoneCopy: 'We cover {areas} neighbourhoods within {radius} of the store.',
  zoneMapCaption: '{radius} from {address}',
  zoneOpenDaily: 'Open daily',
  zoneDeliveryFrom: 'Delivery from',
  zoneFreeOver: 'Free over',
  zoneNotListed: 'Not on the list? ',
  zoneMessageUs: 'Message us',

  // ── Food & Shop ──
  splitEyebrow: 'What we deliver',
  splitTitleBoth: 'Two stores. One cart.',
  splitTitleSingle: 'What we deliver',
  splitCopy: 'Order a meal and a pair of headphones together. One delivery, one rider.',
  splitBrowseFood: 'Browse food',
  splitBrowseShop: 'Browse products',

  // ── Popular products ──
  showcaseEyebrow: "What's available",
  showcaseTitle: 'Popular right now',
  showcaseChooseCategory: 'Choose a category',
  showcasePreferApp: 'Prefer the app?',
  showcaseOrderAria: 'Order {item}',

  // ── How it works ──
  stepsEyebrow: 'How it works',
  stepsTitle: 'Four steps to your door',
  step1Title: 'Browse',
  step1Body: 'Food and products, one cart.',
  step2Title: 'Order',
  step2Body: 'Pay by card, wallet or cash.',
  step3Title: 'We pack it',
  step3Body: 'A rider collects it from us.',
  step4Title: 'Delivered',
  step4Body: 'Tracked live to your door.',

  // ── Delivery team ──
  riderEyebrow: 'Our delivery team',
  riderPointTracking: 'Live map tracking',
  riderPointEta: 'A real ETA, updated as they ride',
  riderPointContact: 'Call or message your rider',
  riderPointContactless: 'Contactless drop-off',
  riderRecruitLead: 'Want to ride with us? ',
  riderRecruitLink: 'Deliver with {brand}',
  journeyStore: 'Our store',
  journeyStoreMeta: 'Packed',
  journeyOnTheWay: 'On the way',
  journeyOnTheWayMeta: 'Now',
  journeyDoor: 'Your door',
  journeyDoorMeta: '~12 min',
  riderCardName: 'Your rider is on the way',
  riderCardTeam: '{brand} delivery team',
  riderCardLive: 'Live',
  riderCardInitials: 'AM',
  riderMetricEta: 'ETA',
  riderMetricAway: 'Away',
  riderMetricRating: 'Rating',
  riderMetricEtaValue: '12 min',
  riderMetricAwayValue: '1.8 km',
  riderMetricRatingValue: '4.9',
  riderActionCall: 'Call',
  riderActionMessage: 'Message',

  // ── Get the app ──
  getAppEyebrow: 'Get started',
  getAppTitle: 'Order however you like',
  getAppCopy: 'Same account, same cart — on Android, iPhone, or the web.',
  getAppWebButton: 'Or order in your browser',
  getAppRating: '{rating} from {count}+ orders',
  getAppCity: 'Delivering across {city}',
  appShotFoodAlt: '{brand} app — food ordering screen',
  appShotShopAlt: '{brand} app — shop screen',
  badgePlayKicker: 'Get it on',
  badgePlayName: 'Google Play',
  badgeAppleKicker: 'Download on the',
  badgeAppleName: 'App Store',
  badgeComingSoon: 'Coming soon to',

  // ── Footer ──
  footerTagline: 'Food and products, delivered across {city}. One cart, one rider.',
  footerShop: 'Shop',
  footerHelp: 'Help',
  footerContactTitle: 'Visit or call us',
  footerFoodMenu: 'Food menu',
  footerShopProducts: 'Shop products',
  footerTrackOrder: 'Track your order',
  footerDeliveryAreas: 'Delivery areas',
  footerHowItWorks: 'How it works',
  footerGetTheApp: 'Get the app',
  footerContactUs: 'Contact us',
  footerOpenHours: 'Open {hours}',
  footerStoreLogin: 'Store login',
  footerDeliverWithUs: 'Deliver with us',
  footerTerms: 'Terms',
  footerPrivacy: 'Privacy',
  socialFacebook: 'Facebook',
  socialInstagram: 'Instagram',
  socialTwitter: 'X',

  // ── Policy pages ──
  policyTerms: 'Terms & Conditions',
  policyPrivacy: 'Privacy Policy',
  policyAbout: 'About {brand}',
  policyBack: '← Back to home',
  policyEmpty: 'This document has not been published yet.',
  policyMetaDescription: '{title} for {brand}, {city}.',

  // ── Fallback copy ──
  fallbackHeroTitle: 'Food and shopping,',
  fallbackHeroAccent: 'delivered',
  fallbackHeroSubtitle: 'Meals from our kitchen, products from our shop — one cart, one rider.',
  heroTitleTerminator: '.',
  fallbackFoodTitle: 'Hot meals, made to order',
  fallbackFoodPoints: [
    'Breakfast, lunch and dinner',
    'Customise before you order',
    'Live prep and delivery time',
  ],
  fallbackShopTitle: 'Products, picked and packed',
  fallbackShopPoints: [
    'Fashion, electronics and home',
    'Flash sales and member offers',
    'Live stock and easy returns',
  ],
  fallbackRiderTitle: 'Tracked all the way.',
  fallbackRiderSubtitle: 'Every order goes to one of our own riders — not a stranger from a marketplace.',
  fallbackCopyright: '© 2026 {brand}. All rights reserved.',
  fallbackMetaTitle: '{brand} — Order Food & Products Online | Fast Local Delivery',
  fallbackMetaDescription:
      'Order food and products online from {brand} in {city}. Hot meals from our kitchen and everything from our shop, delivered to your door with live rider tracking. Order on the web, or get the Android and iPhone app.',
  jsonLdDescription: 'Food and product delivery in {city}.',
  ogImageAlt: '{brand} — food and product delivery in {city}',
);
