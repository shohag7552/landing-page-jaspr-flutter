/// Reports how much of the site each language actually translates.
///
///     dart run tool/i18n_check.dart
///
/// Every language falls back to English entry by entry, so an untranslated
/// entry is never blank — it just quietly stays English. That is the right
/// behaviour at runtime and an unhelpful one while translating, because
/// nothing on the page tells you what you missed. This lists it.
///
/// Run it after adding a language or extending one.
library;

import 'package:food_delivery_landing/content/site_languages.dart';
import 'package:food_delivery_landing/content/strings/strings_en.dart';

const _allEntries = <String>[
  'clockAm',
  'clockPm',
  'unitKm',
  'navHome',
  'navDelivery',
  'navShop',
  'navHowItWorks',
  'navContact',
  'orderNow',
  'getTheApp',
  'navAriaMain',
  'navAriaOpenMenu',
  'navAriaCloseMenu',
  'navAriaLightMode',
  'navAriaDarkMode',
  'brandAriaHome',
  'logoAlt',
  'moduleFood',
  'moduleShop',
  'heroBadge',
  'heroImageAlt',
  'heroStatOrders',
  'heroStatDelivery',
  'heroStatAreas',
  'trackOrderRef',
  'trackOnTheWay',
  'trackEta',
  'trackDistance',
  'trackStatus',
  'trackEtaValue',
  'trackDistanceValue',
  'trackStatusValue',
  'notifTitle',
  'notifBody',
  'trustFastDelivery',
  'trustLiveTracking',
  'trustPayment',
  'trustSupport',
  'zoneEyebrow',
  'zoneTitle',
  'zoneCopy',
  'zoneMapCaption',
  'zoneOpenDaily',
  'zoneDeliveryFrom',
  'zoneFreeOver',
  'zoneNotListed',
  'zoneMessageUs',
  'splitEyebrow',
  'splitTitleBoth',
  'splitTitleSingle',
  'splitCopy',
  'splitBrowseFood',
  'splitBrowseShop',
  'showcaseEyebrow',
  'showcaseTitle',
  'showcaseChooseCategory',
  'showcasePreferApp',
  'showcaseOrderAria',
  'stepsEyebrow',
  'stepsTitle',
  'step1Title',
  'step1Body',
  'step2Title',
  'step2Body',
  'step3Title',
  'step3Body',
  'step4Title',
  'step4Body',
  'riderEyebrow',
  'riderPointTracking',
  'riderPointEta',
  'riderPointContact',
  'riderPointContactless',
  'riderRecruitLead',
  'riderRecruitLink',
  'journeyStore',
  'journeyStoreMeta',
  'journeyOnTheWay',
  'journeyOnTheWayMeta',
  'journeyDoor',
  'journeyDoorMeta',
  'riderCardName',
  'riderCardTeam',
  'riderCardLive',
  'riderCardInitials',
  'riderMetricEta',
  'riderMetricAway',
  'riderMetricRating',
  'riderMetricEtaValue',
  'riderMetricAwayValue',
  'riderMetricRatingValue',
  'riderActionCall',
  'riderActionMessage',
  'getAppEyebrow',
  'getAppTitle',
  'getAppCopy',
  'getAppWebButton',
  'getAppRating',
  'getAppCity',
  'appShotFoodAlt',
  'appShotShopAlt',
  'badgePlayKicker',
  'badgePlayName',
  'badgeAppleKicker',
  'badgeAppleName',
  'badgeComingSoon',
  'footerTagline',
  'footerShop',
  'footerHelp',
  'footerContactTitle',
  'footerFoodMenu',
  'footerShopProducts',
  'footerTrackOrder',
  'footerDeliveryAreas',
  'footerHowItWorks',
  'footerGetTheApp',
  'footerContactUs',
  'footerOpenHours',
  'footerStoreLogin',
  'footerDeliverWithUs',
  'footerTerms',
  'footerPrivacy',
  'socialFacebook',
  'socialInstagram',
  'socialTwitter',
  'policyTerms',
  'policyPrivacy',
  'policyAbout',
  'policyBack',
  'policyEmpty',
  'policyMetaDescription',
  'fallbackHeroTitle',
  'fallbackHeroAccent',
  'fallbackHeroSubtitle',
  'heroTitleTerminator',
  'fallbackFoodTitle',
  'fallbackFoodPoints',
  'fallbackShopTitle',
  'fallbackShopPoints',
  'fallbackRiderTitle',
  'fallbackRiderSubtitle',
  'fallbackCopyright',
  'fallbackMetaTitle',
  'fallbackMetaDescription',
  'jsonLdDescription',
  'ogImageAlt'
];

bool _sameList(List<String> a, List<String> b) =>
    a.length == b.length && List.generate(a.length, (i) => a[i] == b[i]).every((x) => x);

/// The entries [code] renders differently from English.
Set<String> _translatedEntries(String code) {
  final s = kSiteLanguages[code]!.strings;
  final e = stringsEn;
  final translated = <String>{};
    if (s.clockAm != e.clockAm) translated.add('clockAm');
    if (s.clockPm != e.clockPm) translated.add('clockPm');
    if (s.unitKm != e.unitKm) translated.add('unitKm');
    if (s.navHome != e.navHome) translated.add('navHome');
    if (s.navDelivery != e.navDelivery) translated.add('navDelivery');
    if (s.navShop != e.navShop) translated.add('navShop');
    if (s.navHowItWorks != e.navHowItWorks) translated.add('navHowItWorks');
    if (s.navContact != e.navContact) translated.add('navContact');
    if (s.orderNow != e.orderNow) translated.add('orderNow');
    if (s.getTheApp != e.getTheApp) translated.add('getTheApp');
    if (s.navAriaMain != e.navAriaMain) translated.add('navAriaMain');
    if (s.navAriaOpenMenu != e.navAriaOpenMenu) translated.add('navAriaOpenMenu');
    if (s.navAriaCloseMenu != e.navAriaCloseMenu) translated.add('navAriaCloseMenu');
    if (s.navAriaLightMode != e.navAriaLightMode) translated.add('navAriaLightMode');
    if (s.navAriaDarkMode != e.navAriaDarkMode) translated.add('navAriaDarkMode');
    if (s.brandAriaHome != e.brandAriaHome) translated.add('brandAriaHome');
    if (s.logoAlt != e.logoAlt) translated.add('logoAlt');
    if (s.moduleFood != e.moduleFood) translated.add('moduleFood');
    if (s.moduleShop != e.moduleShop) translated.add('moduleShop');
    if (s.heroBadge != e.heroBadge) translated.add('heroBadge');
    if (s.heroImageAlt != e.heroImageAlt) translated.add('heroImageAlt');
    if (s.heroStatOrders != e.heroStatOrders) translated.add('heroStatOrders');
    if (s.heroStatDelivery != e.heroStatDelivery) translated.add('heroStatDelivery');
    if (s.heroStatAreas != e.heroStatAreas) translated.add('heroStatAreas');
    if (s.trackOrderRef != e.trackOrderRef) translated.add('trackOrderRef');
    if (s.trackOnTheWay != e.trackOnTheWay) translated.add('trackOnTheWay');
    if (s.trackEta != e.trackEta) translated.add('trackEta');
    if (s.trackDistance != e.trackDistance) translated.add('trackDistance');
    if (s.trackStatus != e.trackStatus) translated.add('trackStatus');
    if (s.trackEtaValue != e.trackEtaValue) translated.add('trackEtaValue');
    if (s.trackDistanceValue != e.trackDistanceValue) translated.add('trackDistanceValue');
    if (s.trackStatusValue != e.trackStatusValue) translated.add('trackStatusValue');
    if (s.notifTitle != e.notifTitle) translated.add('notifTitle');
    if (s.notifBody != e.notifBody) translated.add('notifBody');
    if (s.trustFastDelivery != e.trustFastDelivery) translated.add('trustFastDelivery');
    if (s.trustLiveTracking != e.trustLiveTracking) translated.add('trustLiveTracking');
    if (s.trustPayment != e.trustPayment) translated.add('trustPayment');
    if (s.trustSupport != e.trustSupport) translated.add('trustSupport');
    if (s.zoneEyebrow != e.zoneEyebrow) translated.add('zoneEyebrow');
    if (s.zoneTitle != e.zoneTitle) translated.add('zoneTitle');
    if (s.zoneCopy != e.zoneCopy) translated.add('zoneCopy');
    if (s.zoneMapCaption != e.zoneMapCaption) translated.add('zoneMapCaption');
    if (s.zoneOpenDaily != e.zoneOpenDaily) translated.add('zoneOpenDaily');
    if (s.zoneDeliveryFrom != e.zoneDeliveryFrom) translated.add('zoneDeliveryFrom');
    if (s.zoneFreeOver != e.zoneFreeOver) translated.add('zoneFreeOver');
    if (s.zoneNotListed != e.zoneNotListed) translated.add('zoneNotListed');
    if (s.zoneMessageUs != e.zoneMessageUs) translated.add('zoneMessageUs');
    if (s.splitEyebrow != e.splitEyebrow) translated.add('splitEyebrow');
    if (s.splitTitleBoth != e.splitTitleBoth) translated.add('splitTitleBoth');
    if (s.splitTitleSingle != e.splitTitleSingle) translated.add('splitTitleSingle');
    if (s.splitCopy != e.splitCopy) translated.add('splitCopy');
    if (s.splitBrowseFood != e.splitBrowseFood) translated.add('splitBrowseFood');
    if (s.splitBrowseShop != e.splitBrowseShop) translated.add('splitBrowseShop');
    if (s.showcaseEyebrow != e.showcaseEyebrow) translated.add('showcaseEyebrow');
    if (s.showcaseTitle != e.showcaseTitle) translated.add('showcaseTitle');
    if (s.showcaseChooseCategory != e.showcaseChooseCategory) translated.add('showcaseChooseCategory');
    if (s.showcasePreferApp != e.showcasePreferApp) translated.add('showcasePreferApp');
    if (s.showcaseOrderAria != e.showcaseOrderAria) translated.add('showcaseOrderAria');
    if (s.stepsEyebrow != e.stepsEyebrow) translated.add('stepsEyebrow');
    if (s.stepsTitle != e.stepsTitle) translated.add('stepsTitle');
    if (s.step1Title != e.step1Title) translated.add('step1Title');
    if (s.step1Body != e.step1Body) translated.add('step1Body');
    if (s.step2Title != e.step2Title) translated.add('step2Title');
    if (s.step2Body != e.step2Body) translated.add('step2Body');
    if (s.step3Title != e.step3Title) translated.add('step3Title');
    if (s.step3Body != e.step3Body) translated.add('step3Body');
    if (s.step4Title != e.step4Title) translated.add('step4Title');
    if (s.step4Body != e.step4Body) translated.add('step4Body');
    if (s.riderEyebrow != e.riderEyebrow) translated.add('riderEyebrow');
    if (s.riderPointTracking != e.riderPointTracking) translated.add('riderPointTracking');
    if (s.riderPointEta != e.riderPointEta) translated.add('riderPointEta');
    if (s.riderPointContact != e.riderPointContact) translated.add('riderPointContact');
    if (s.riderPointContactless != e.riderPointContactless) translated.add('riderPointContactless');
    if (s.riderRecruitLead != e.riderRecruitLead) translated.add('riderRecruitLead');
    if (s.riderRecruitLink != e.riderRecruitLink) translated.add('riderRecruitLink');
    if (s.journeyStore != e.journeyStore) translated.add('journeyStore');
    if (s.journeyStoreMeta != e.journeyStoreMeta) translated.add('journeyStoreMeta');
    if (s.journeyOnTheWay != e.journeyOnTheWay) translated.add('journeyOnTheWay');
    if (s.journeyOnTheWayMeta != e.journeyOnTheWayMeta) translated.add('journeyOnTheWayMeta');
    if (s.journeyDoor != e.journeyDoor) translated.add('journeyDoor');
    if (s.journeyDoorMeta != e.journeyDoorMeta) translated.add('journeyDoorMeta');
    if (s.riderCardName != e.riderCardName) translated.add('riderCardName');
    if (s.riderCardTeam != e.riderCardTeam) translated.add('riderCardTeam');
    if (s.riderCardLive != e.riderCardLive) translated.add('riderCardLive');
    if (s.riderCardInitials != e.riderCardInitials) translated.add('riderCardInitials');
    if (s.riderMetricEta != e.riderMetricEta) translated.add('riderMetricEta');
    if (s.riderMetricAway != e.riderMetricAway) translated.add('riderMetricAway');
    if (s.riderMetricRating != e.riderMetricRating) translated.add('riderMetricRating');
    if (s.riderMetricEtaValue != e.riderMetricEtaValue) translated.add('riderMetricEtaValue');
    if (s.riderMetricAwayValue != e.riderMetricAwayValue) translated.add('riderMetricAwayValue');
    if (s.riderMetricRatingValue != e.riderMetricRatingValue) translated.add('riderMetricRatingValue');
    if (s.riderActionCall != e.riderActionCall) translated.add('riderActionCall');
    if (s.riderActionMessage != e.riderActionMessage) translated.add('riderActionMessage');
    if (s.getAppEyebrow != e.getAppEyebrow) translated.add('getAppEyebrow');
    if (s.getAppTitle != e.getAppTitle) translated.add('getAppTitle');
    if (s.getAppCopy != e.getAppCopy) translated.add('getAppCopy');
    if (s.getAppWebButton != e.getAppWebButton) translated.add('getAppWebButton');
    if (s.getAppRating != e.getAppRating) translated.add('getAppRating');
    if (s.getAppCity != e.getAppCity) translated.add('getAppCity');
    if (s.appShotFoodAlt != e.appShotFoodAlt) translated.add('appShotFoodAlt');
    if (s.appShotShopAlt != e.appShotShopAlt) translated.add('appShotShopAlt');
    if (s.badgePlayKicker != e.badgePlayKicker) translated.add('badgePlayKicker');
    if (s.badgePlayName != e.badgePlayName) translated.add('badgePlayName');
    if (s.badgeAppleKicker != e.badgeAppleKicker) translated.add('badgeAppleKicker');
    if (s.badgeAppleName != e.badgeAppleName) translated.add('badgeAppleName');
    if (s.badgeComingSoon != e.badgeComingSoon) translated.add('badgeComingSoon');
    if (s.footerTagline != e.footerTagline) translated.add('footerTagline');
    if (s.footerShop != e.footerShop) translated.add('footerShop');
    if (s.footerHelp != e.footerHelp) translated.add('footerHelp');
    if (s.footerContactTitle != e.footerContactTitle) translated.add('footerContactTitle');
    if (s.footerFoodMenu != e.footerFoodMenu) translated.add('footerFoodMenu');
    if (s.footerShopProducts != e.footerShopProducts) translated.add('footerShopProducts');
    if (s.footerTrackOrder != e.footerTrackOrder) translated.add('footerTrackOrder');
    if (s.footerDeliveryAreas != e.footerDeliveryAreas) translated.add('footerDeliveryAreas');
    if (s.footerHowItWorks != e.footerHowItWorks) translated.add('footerHowItWorks');
    if (s.footerGetTheApp != e.footerGetTheApp) translated.add('footerGetTheApp');
    if (s.footerContactUs != e.footerContactUs) translated.add('footerContactUs');
    if (s.footerOpenHours != e.footerOpenHours) translated.add('footerOpenHours');
    if (s.footerStoreLogin != e.footerStoreLogin) translated.add('footerStoreLogin');
    if (s.footerDeliverWithUs != e.footerDeliverWithUs) translated.add('footerDeliverWithUs');
    if (s.footerTerms != e.footerTerms) translated.add('footerTerms');
    if (s.footerPrivacy != e.footerPrivacy) translated.add('footerPrivacy');
    if (s.socialFacebook != e.socialFacebook) translated.add('socialFacebook');
    if (s.socialInstagram != e.socialInstagram) translated.add('socialInstagram');
    if (s.socialTwitter != e.socialTwitter) translated.add('socialTwitter');
    if (s.policyTerms != e.policyTerms) translated.add('policyTerms');
    if (s.policyPrivacy != e.policyPrivacy) translated.add('policyPrivacy');
    if (s.policyAbout != e.policyAbout) translated.add('policyAbout');
    if (s.policyBack != e.policyBack) translated.add('policyBack');
    if (s.policyEmpty != e.policyEmpty) translated.add('policyEmpty');
    if (s.policyMetaDescription != e.policyMetaDescription) translated.add('policyMetaDescription');
    if (s.fallbackHeroTitle != e.fallbackHeroTitle) translated.add('fallbackHeroTitle');
    if (s.fallbackHeroAccent != e.fallbackHeroAccent) translated.add('fallbackHeroAccent');
    if (s.fallbackHeroSubtitle != e.fallbackHeroSubtitle) translated.add('fallbackHeroSubtitle');
    if (s.heroTitleTerminator != e.heroTitleTerminator) translated.add('heroTitleTerminator');
    if (s.fallbackFoodTitle != e.fallbackFoodTitle) translated.add('fallbackFoodTitle');
    if (!_sameList(s.fallbackFoodPoints, e.fallbackFoodPoints)) translated.add('fallbackFoodPoints');
    if (s.fallbackShopTitle != e.fallbackShopTitle) translated.add('fallbackShopTitle');
    if (!_sameList(s.fallbackShopPoints, e.fallbackShopPoints)) translated.add('fallbackShopPoints');
    if (s.fallbackRiderTitle != e.fallbackRiderTitle) translated.add('fallbackRiderTitle');
    if (s.fallbackRiderSubtitle != e.fallbackRiderSubtitle) translated.add('fallbackRiderSubtitle');
    if (s.fallbackCopyright != e.fallbackCopyright) translated.add('fallbackCopyright');
    if (s.fallbackMetaTitle != e.fallbackMetaTitle) translated.add('fallbackMetaTitle');
    if (s.fallbackMetaDescription != e.fallbackMetaDescription) translated.add('fallbackMetaDescription');
    if (s.jsonLdDescription != e.jsonLdDescription) translated.add('jsonLdDescription');
    if (s.ogImageAlt != e.ogImageAlt) translated.add('ogImageAlt');
  return translated;
}

void main() {
  final total = _allEntries.length;
  var incomplete = false;

  for (final lang in kSiteLanguages.values) {
    if (lang.code == 'en') {
      print('en   English              $total/$total   source language');
      continue;
    }

    final done = _translatedEntries(lang.code);
    final missing = _allEntries.where((k) => !done.contains(k)).toList();
    final pct = (done.length * 100 / total).round();
    print('${lang.code.padRight(5)}${lang.name.padRight(21)}'
        '${done.length}/$total   $pct percent');

    if (missing.isNotEmpty) {
      incomplete = true;
      final shown = missing.take(10).join(', ');
      final rest = missing.length > 10 ? ' and ${missing.length - 10} more' : '';
      print('     still English: $shown$rest');
    }
  }

  print('');
  print(incomplete
      ? 'Untranslated entries fall back to English, so the site still renders.'
      : 'Every language is complete.');
}
