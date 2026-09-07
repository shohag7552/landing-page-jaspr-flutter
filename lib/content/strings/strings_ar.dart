/// Arabic (العربية).
///
/// Right-to-left: the layout is flipped by `dir="rtl"` on `<html>`, driven by
/// `SiteLanguage.isRtl`. See the `[dir='rtl']` block in `lib/ui_kit.dart` for
/// the handful of rules that need mirroring by hand.
///
/// Only the entries below are translated; everything else falls back to the
/// English default in `SiteStrings`.
library;

import '../site_strings.dart';

const stringsAr = SiteStrings(
  // ── Units ──
  clockAm: 'ص',
  clockPm: 'م',
  unitKm: 'كم',

  // ── Navigation ──
  navHome: 'الرئيسية',
  navDelivery: 'التوصيل',
  navShop: 'الطعام والمتجر',
  navHowItWorks: 'كيف يعمل',
  navContact: 'اتصل بنا',
  orderNow: 'اطلب الآن',
  getTheApp: 'حمّل التطبيق',
  navAriaMain: 'القائمة الرئيسية',
  navAriaOpenMenu: 'فتح القائمة',
  navAriaCloseMenu: 'إغلاق القائمة',
  navAriaLightMode: 'التبديل إلى الوضع الفاتح',
  navAriaDarkMode: 'التبديل إلى الوضع الداكن',
  brandAriaHome: '{brand} — الرئيسية',
  logoAlt: 'شعار {brand}',

  // ── Modules ──
  moduleFood: 'الطعام',
  moduleShop: 'المتجر',

  // ── Hero ──
  heroBadge: 'نوصل في {city} · مفتوح {hours}',
  heroImageAlt: 'مندوب من {brand} في طريقه إلى العميل',
  heroStatOrders: 'طلب تم توصيله',
  heroStatDelivery: 'متوسط التوصيل',
  heroStatAreas: 'منطقة مغطاة',
  trackOrderRef: 'الطلب #4821',
  trackOnTheWay: 'في الطريق',
  trackEta: 'الوقت',
  trackDistance: 'المسافة',
  trackStatus: 'الحالة',
  trackEtaValue: '12 دقيقة',
  trackDistanceValue: '1.8 كم',
  trackStatusValue: 'مدفوع',
  notifTitle: 'تحديث الطلب',
  notifBody: 'مندوبك على وشك الوصول — خلال 3 دقائق.',

  // ── Reassurance strip ──
  trustFastDelivery: 'توصيل محلي سريع',
  trustLiveTracking: 'تتبع مباشر للمندوب',
  trustPayment: 'بطاقة أو محفظة أو نقداً',
  trustSupport: 'دعم من أشخاص حقيقيين',

  // ── Delivery area ──
  zoneEyebrow: 'منطقة التوصيل',
  zoneTitle: 'هل نوصل إليك؟',
  zoneCopy: 'نغطي {areas} حياً ضمن {radius} من المتجر.',
  zoneMapCaption: '{radius} من {address}',
  zoneOpenDaily: 'مفتوح يومياً',
  zoneDeliveryFrom: 'التوصيل يبدأ من',
  zoneFreeOver: 'مجاني فوق',
  zoneNotListed: 'منطقتك غير مدرجة؟ ',
  zoneMessageUs: 'راسلنا',

  // ── Food & Shop ──
  splitEyebrow: 'ما نوصله',
  splitTitleBoth: 'متجران. سلة واحدة.',
  splitTitleSingle: 'ما نوصله',
  splitCopy: 'اطلب وجبة وسماعات معاً. توصيل واحد، مندوب واحد.',
  splitBrowseFood: 'تصفح الطعام',
  splitBrowseShop: 'تصفح المنتجات',

  // ── Popular products ──
  showcaseEyebrow: 'المتوفر الآن',
  showcaseTitle: 'الأكثر طلباً',
  showcaseChooseCategory: 'اختر فئة',
  showcasePreferApp: 'تفضل التطبيق؟',
  showcaseOrderAria: 'اطلب {item}',

  // ── How it works ──
  stepsEyebrow: 'كيف يعمل',
  stepsTitle: 'أربع خطوات حتى بابك',
  step1Title: 'تصفح',
  step1Body: 'الطعام والمنتجات في سلة واحدة.',
  step2Title: 'اطلب',
  step2Body: 'ادفع بالبطاقة أو المحفظة أو نقداً.',
  step3Title: 'نحن نجهّزه',
  step3Body: 'يستلمه المندوب من عندنا.',
  step4Title: 'تم التوصيل',
  step4Body: 'متتبَّع مباشرة حتى بابك.',

  // ── Delivery team ──
  riderEyebrow: 'فريق التوصيل لدينا',
  riderPointTracking: 'تتبع مباشر على الخريطة',
  riderPointEta: 'وقت وصول حقيقي، يتحدث أثناء الطريق',
  riderPointContact: 'اتصل بالمندوب أو راسله',
  riderPointContactless: 'تسليم بدون تلامس',
  riderRecruitLead: 'تريد العمل معنا؟ ',
  riderRecruitLink: 'وصّل مع {brand}',
  journeyStore: 'متجرنا',
  journeyStoreMeta: 'تم التجهيز',
  journeyOnTheWay: 'في الطريق',
  journeyOnTheWayMeta: 'الآن',
  journeyDoor: 'بابك',
  journeyDoorMeta: '~12 دقيقة',
  riderCardName: 'مندوبك في الطريق',
  riderCardTeam: 'فريق توصيل {brand}',
  riderCardLive: 'مباشر',
  riderMetricEta: 'الوقت',
  riderMetricAway: 'يبعد',
  riderMetricRating: 'التقييم',
  riderMetricEtaValue: '12 دقيقة',
  riderMetricAwayValue: '1.8 كم',
  riderMetricRatingValue: '4.9',
  riderActionCall: 'اتصال',
  riderActionMessage: 'رسالة',

  // ── Get the app ──
  getAppEyebrow: 'ابدأ الآن',
  getAppTitle: 'اطلب كما يناسبك',
  getAppCopy: 'نفس الحساب ونفس السلة — على أندرويد أو آيفون أو الويب.',
  getAppWebButton: 'أو اطلب من المتصفح',
  getAppRating: '{rating} من {count}+ طلب',
  getAppCity: 'نوصل في {city}',
  appShotFoodAlt: 'تطبيق {brand} — شاشة طلب الطعام',
  appShotShopAlt: 'تطبيق {brand} — شاشة المتجر',
  badgeComingSoon: 'قريباً على',

  // ── Footer ──
  footerTagline: 'طعام ومنتجات، نوصلها في {city}. سلة واحدة، مندوب واحد.',
  footerShop: 'المتجر',
  footerHelp: 'المساعدة',
  footerContactTitle: 'زرنا أو اتصل بنا',
  footerFoodMenu: 'قائمة الطعام',
  footerShopProducts: 'منتجات المتجر',
  footerTrackOrder: 'تتبع طلبك',
  footerDeliveryAreas: 'مناطق التوصيل',
  footerHowItWorks: 'كيف يعمل',
  footerGetTheApp: 'حمّل التطبيق',
  footerContactUs: 'اتصل بنا',
  footerOpenHours: 'مفتوح {hours}',
  footerStoreLogin: 'دخول المتجر',
  footerDeliverWithUs: 'وصّل معنا',
  footerTerms: 'الشروط',
  footerPrivacy: 'الخصوصية',

  // ── Policy pages ──
  policyTerms: 'الشروط والأحكام',
  policyPrivacy: 'سياسة الخصوصية',
  policyAbout: 'عن {brand}',
  policyBack: '← العودة للرئيسية',
  policyEmpty: 'لم يتم نشر هذا المستند بعد.',
  policyMetaDescription: '{title} لـ {brand}، {city}.',

  // ── Fallback copy ──
  fallbackHeroTitle: 'طعام وتسوّق،',
  fallbackHeroAccent: 'يصل إليك',
  fallbackHeroSubtitle: 'وجبات من مطبخنا ومنتجات من متجرنا — سلة واحدة، مندوب واحد.',
  fallbackFoodTitle: 'وجبات ساخنة، تُحضَّر عند الطلب',
  fallbackFoodPoints: ['فطور وغداء وعشاء', 'خصّصها قبل الطلب', 'وقت التحضير والتوصيل مباشرة'],
  fallbackShopTitle: 'منتجات مختارة ومجهّزة',
  fallbackShopPoints: ['أزياء وإلكترونيات ومستلزمات منزل', 'عروض سريعة وعروض الأعضاء', 'مخزون مباشر وإرجاع سهل'],
  fallbackRiderTitle: 'متتبَّع طوال الطريق.',
  fallbackRiderSubtitle: 'كل طلب يذهب إلى أحد مندوبينا — لا إلى شخص غريب من سوق إلكتروني.',
  fallbackCopyright: '© 2026 {brand}. جميع الحقوق محفوظة.',
  fallbackMetaTitle: '{brand} — اطلب الطعام والمنتجات أونلاين | توصيل محلي سريع',
  fallbackMetaDescription:
      'اطلب الطعام والمنتجات أونلاين من {brand} في {city}. وجبات ساخنة من مطبخنا '
      'وكل شيء من متجرنا، يصل إلى بابك مع تتبع مباشر للمندوب. اطلب من الويب، '
      'أو حمّل تطبيق أندرويد وآيفون.',
  jsonLdDescription: 'توصيل الطعام والمنتجات في {city}.',
  ogImageAlt: '{brand} — توصيل الطعام والمنتجات في {city}',
);
