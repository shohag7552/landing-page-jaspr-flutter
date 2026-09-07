/// Bengali (বাংলা).
///
/// Only the entries below are translated; everything else falls back to the
/// English default in `SiteStrings`. Add a line here to translate more.
library;

import '../site_strings.dart';

const stringsBn = SiteStrings(
  // ── Units ──
  clockAm: 'পূর্বাহ্ন',
  clockPm: 'অপরাহ্ন',
  unitKm: 'কিমি',

  // ── Navigation ──
  navHome: 'হোম',
  navDelivery: 'ডেলিভারি',
  navShop: 'খাবার ও শপ',
  navHowItWorks: 'যেভাবে কাজ করে',
  navContact: 'যোগাযোগ',
  orderNow: 'অর্ডার করুন',
  getTheApp: 'অ্যাপ নিন',
  navAriaMain: 'মূল মেনু',
  navAriaOpenMenu: 'মেনু খুলুন',
  navAriaCloseMenu: 'মেনু বন্ধ করুন',
  navAriaLightMode: 'লাইট মোডে যান',
  navAriaDarkMode: 'ডার্ক মোডে যান',
  brandAriaHome: '{brand} — হোম',
  logoAlt: '{brand} লোগো',

  // ── Modules ──
  moduleFood: 'খাবার',
  moduleShop: 'শপ',

  // ── Hero ──
  heroBadge: '{city} জুড়ে ডেলিভারি · খোলা {hours}',
  heroImageAlt: '{brand} এর একজন রাইডার গ্রাহকের পথে',
  heroStatOrders: 'অর্ডার ডেলিভারি হয়েছে',
  heroStatDelivery: 'গড় ডেলিভারি',
  heroStatAreas: 'এলাকা কভার',
  trackOrderRef: 'অর্ডার #৪৮২১',
  trackOnTheWay: 'পথে আছে',
  trackEta: 'সময়',
  trackDistance: 'দূরত্ব',
  trackStatus: 'অবস্থা',
  trackEtaValue: '১২ মিনিট',
  trackDistanceValue: '১.৮ কিমি',
  trackStatusValue: 'পরিশোধিত',
  notifTitle: 'অর্ডার আপডেট',
  notifBody: 'আপনার রাইডার প্রায় পৌঁছে গেছে — ৩ মিনিটে আসছে।',

  // ── Reassurance strip ──
  trustFastDelivery: 'দ্রুত স্থানীয় ডেলিভারি',
  trustLiveTracking: 'লাইভ রাইডার ট্র্যাকিং',
  trustPayment: 'কার্ড, ওয়ালেট বা ক্যাশ',
  trustSupport: 'সত্যিকারের মানুষের সহায়তা',

  // ── Delivery area ──
  zoneEyebrow: 'ডেলিভারি এলাকা',
  zoneTitle: 'আমরা কি আপনার এলাকায় যাই?',
  zoneCopy: 'দোকান থেকে {radius} এর মধ্যে আমরা {areas} টি এলাকায় ডেলিভারি দিই।',
  zoneMapCaption: '{address} থেকে {radius}',
  zoneOpenDaily: 'প্রতিদিন খোলা',
  zoneDeliveryFrom: 'ডেলিভারি শুরু',
  zoneFreeOver: 'ফ্রি ডেলিভারি',
  zoneNotListed: 'তালিকায় নেই? ',
  zoneMessageUs: 'আমাদের মেসেজ করুন',

  // ── Food & Shop ──
  splitEyebrow: 'আমরা যা ডেলিভারি করি',
  splitTitleBoth: 'দুটি দোকান। একটি কার্ট।',
  splitTitleSingle: 'আমরা যা ডেলিভারি করি',
  splitCopy: 'একসাথে খাবার আর হেডফোন অর্ডার করুন। এক ডেলিভারি, এক রাইডার।',
  splitBrowseFood: 'খাবার দেখুন',
  splitBrowseShop: 'পণ্য দেখুন',

  // ── Popular products ──
  showcaseEyebrow: 'যা পাওয়া যাচ্ছে',
  showcaseTitle: 'এখন জনপ্রিয়',
  showcaseChooseCategory: 'ক্যাটাগরি বাছুন',
  showcasePreferApp: 'অ্যাপ পছন্দ করেন?',
  showcaseOrderAria: '{item} অর্ডার করুন',

  // ── How it works ──
  stepsEyebrow: 'যেভাবে কাজ করে',
  stepsTitle: 'চার ধাপে আপনার দরজায়',
  step1Title: 'দেখুন',
  step1Body: 'খাবার ও পণ্য, এক কার্টে।',
  step2Title: 'অর্ডার',
  step2Body: 'কার্ড, ওয়ালেট বা ক্যাশে পরিশোধ।',
  step3Title: 'আমরা প্যাক করি',
  step3Body: 'একজন রাইডার আমাদের থেকে নিয়ে যায়।',
  step4Title: 'ডেলিভারি',
  step4Body: 'লাইভ ট্র্যাকিংসহ আপনার দরজায়।',

  // ── Delivery team ──
  riderEyebrow: 'আমাদের ডেলিভারি টিম',
  riderPointTracking: 'লাইভ ম্যাপ ট্র্যাকিং',
  riderPointEta: 'সত্যিকারের সময়, পথেই আপডেট হয়',
  riderPointContact: 'রাইডারকে কল বা মেসেজ',
  riderPointContactless: 'কন্টাক্টলেস ডেলিভারি',
  riderRecruitLead: 'আমাদের সাথে রাইড করবেন? ',
  riderRecruitLink: '{brand} এর সাথে ডেলিভারি দিন',
  journeyStore: 'আমাদের দোকান',
  journeyStoreMeta: 'প্যাক হয়েছে',
  journeyOnTheWay: 'পথে আছে',
  journeyOnTheWayMeta: 'এখন',
  journeyDoor: 'আপনার দরজা',
  journeyDoorMeta: '~১২ মিনিট',
  riderCardName: 'আপনার রাইডার পথে আছে',
  riderCardTeam: '{brand} ডেলিভারি টিম',
  riderCardLive: 'লাইভ',
  riderMetricEta: 'সময়',
  riderMetricAway: 'দূরে',
  riderMetricRating: 'রেটিং',
  riderMetricEtaValue: '১২ মিনিট',
  riderMetricAwayValue: '১.৮ কিমি',
  riderMetricRatingValue: '৪.৯',
  riderActionCall: 'কল',
  riderActionMessage: 'মেসেজ',

  // ── Get the app ──
  getAppEyebrow: 'শুরু করুন',
  getAppTitle: 'যেভাবে খুশি অর্ডার করুন',
  getAppCopy: 'একই অ্যাকাউন্ট, একই কার্ট — অ্যান্ড্রয়েড, আইফোন বা ওয়েবে।',
  getAppWebButton: 'অথবা ব্রাউজারে অর্ডার করুন',
  getAppRating: '{count}+ অর্ডারে {rating}',
  getAppCity: '{city} জুড়ে ডেলিভারি',
  appShotFoodAlt: '{brand} অ্যাপ — খাবার অর্ডারের স্ক্রিন',
  appShotShopAlt: '{brand} অ্যাপ — শপ স্ক্রিন',
  badgeComingSoon: 'শীঘ্রই আসছে',

  // ── Footer ──
  footerTagline: '{city} জুড়ে খাবার ও পণ্য ডেলিভারি। এক কার্ট, এক রাইডার।',
  footerShop: 'শপ',
  footerHelp: 'সহায়তা',
  footerContactTitle: 'দেখা করুন বা কল করুন',
  footerFoodMenu: 'খাবারের মেনু',
  footerShopProducts: 'শপের পণ্য',
  footerTrackOrder: 'অর্ডার ট্র্যাক করুন',
  footerDeliveryAreas: 'ডেলিভারি এলাকা',
  footerHowItWorks: 'যেভাবে কাজ করে',
  footerGetTheApp: 'অ্যাপ নিন',
  footerContactUs: 'যোগাযোগ করুন',
  footerOpenHours: 'খোলা {hours}',
  footerStoreLogin: 'স্টোর লগইন',
  footerDeliverWithUs: 'আমাদের সাথে ডেলিভারি দিন',
  footerTerms: 'শর্তাবলী',
  footerPrivacy: 'প্রাইভেসি',

  // ── Policy pages ──
  policyTerms: 'শর্তাবলী',
  policyPrivacy: 'প্রাইভেসি পলিসি',
  policyAbout: '{brand} সম্পর্কে',
  policyBack: '← হোমে ফিরে যান',
  policyEmpty: 'এই ডকুমেন্টটি এখনো প্রকাশ করা হয়নি।',
  policyMetaDescription: '{brand}, {city} এর {title}।',

  // ── Fallback copy ──
  fallbackHeroTitle: 'খাবার ও কেনাকাটা,',
  fallbackHeroAccent: 'ডেলিভারি',
  fallbackHeroSubtitle: 'আমাদের রান্নাঘরের খাবার, আমাদের শপের পণ্য — এক কার্ট, এক রাইডার।',
  fallbackFoodTitle: 'গরম খাবার, অর্ডার অনুযায়ী তৈরি',
  fallbackFoodPoints: ['সকাল, দুপুর ও রাতের খাবার', 'অর্ডারের আগে পছন্দমতো সাজান', 'লাইভ প্রস্তুতি ও ডেলিভারির সময়'],
  fallbackShopTitle: 'পণ্য, বাছাই ও প্যাক করা',
  fallbackShopPoints: ['ফ্যাশন, ইলেকট্রনিক্স ও ঘরের জিনিস', 'ফ্ল্যাশ সেল ও সদস্য অফার', 'লাইভ স্টক ও সহজ রিটার্ন'],
  fallbackRiderTitle: 'পুরো পথ ট্র্যাক করুন।',
  fallbackRiderSubtitle: 'প্রতিটি অর্ডার যায় আমাদের নিজের রাইডারের কাছে — মার্কেটপ্লেসের অচেনা কারো কাছে নয়।',
  fallbackCopyright: '© ২০২৬ {brand}। সর্বস্বত্ব সংরক্ষিত।',
  fallbackMetaTitle: '{brand} — অনলাইনে খাবার ও পণ্য অর্ডার | দ্রুত স্থানীয় ডেলিভারি',
  fallbackMetaDescription:
      '{city} এ {brand} থেকে অনলাইনে খাবার ও পণ্য অর্ডার করুন। আমাদের রান্নাঘরের গরম খাবার '
      'এবং শপের সবকিছু লাইভ রাইডার ট্র্যাকিংসহ আপনার দরজায়। ওয়েবে অর্ডার করুন, '
      'বা অ্যান্ড্রয়েড ও আইফোন অ্যাপ নিন।',
  jsonLdDescription: '{city} এ খাবার ও পণ্য ডেলিভারি।',
  ogImageAlt: '{brand} — {city} এ খাবার ও পণ্য ডেলিভারি',
);
