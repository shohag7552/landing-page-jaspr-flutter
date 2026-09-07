/// Every word the site renders that does not come from the database.
///
/// **This is the file to translate.** Each language is one `SiteStrings`
/// object; see `lib/content/strings/` for the ones that ship, and
/// `site_languages.dart` for how to add your own.
///
/// Every field carries its English text as the default, so a translation only
/// has to override what it has actually translated — anything left out falls
/// back to English rather than rendering blank.
///
/// Entries with `{placeholders}` have values dropped into them at render time.
/// A translation is free to move them around: `'{city} — খোলা {hours}'` is as
/// valid as the English order. Use `.fill({'city': ..., 'hours': ...})`.
library;

class SiteStrings {
  const SiteStrings({
    this.clockAm = '',
    this.clockPm = '',
    this.unitKm = '',
    this.navHome = '',
    this.navDelivery = '',
    this.navShop = '',
    this.navHowItWorks = '',
    this.navContact = '',
    this.orderNow = '',
    this.getTheApp = '',
    this.navAriaMain = '',
    this.navAriaOpenMenu = '',
    this.navAriaCloseMenu = '',
    this.navAriaLightMode = '',
    this.navAriaDarkMode = '',
    this.brandAriaHome = '',
    this.logoAlt = '',
    this.moduleFood = '',
    this.moduleShop = '',
    this.heroBadge = '',
    this.heroImageAlt = '',
    this.heroStatOrders = '',
    this.heroStatDelivery = '',
    this.heroStatAreas = '',
    this.trackOrderRef = '',
    this.trackOnTheWay = '',
    this.trackEta = '',
    this.trackDistance = '',
    this.trackStatus = '',
    this.trackEtaValue = '',
    this.trackDistanceValue = '',
    this.trackStatusValue = '',
    this.notifTitle = '',
    this.notifBody = '',
    this.trustFastDelivery = '',
    this.trustLiveTracking = '',
    this.trustPayment = '',
    this.trustSupport = '',
    this.zoneEyebrow = '',
    this.zoneTitle = '',
    this.zoneCopy = '',
    this.zoneMapCaption = '',
    this.zoneOpenDaily = '',
    this.zoneDeliveryFrom = '',
    this.zoneFreeOver = '',
    this.zoneNotListed = '',
    this.zoneMessageUs = '',
    this.splitEyebrow = '',
    this.splitTitleBoth = '',
    this.splitTitleSingle = '',
    this.splitCopy = '',
    this.splitBrowseFood = '',
    this.splitBrowseShop = '',
    this.showcaseEyebrow = '',
    this.showcaseTitle = '',
    this.showcaseChooseCategory = '',
    this.showcasePreferApp = '',
    this.showcaseOrderAria = '',
    this.stepsEyebrow = '',
    this.stepsTitle = '',
    this.step1Title = '',
    this.step1Body = '',
    this.step2Title = '',
    this.step2Body = '',
    this.step3Title = '',
    this.step3Body = '',
    this.step4Title = '',
    this.step4Body = '',
    this.riderEyebrow = '',
    this.riderPointTracking = '',
    this.riderPointEta = '',
    this.riderPointContact = '',
    this.riderPointContactless = '',
    this.riderRecruitLead = '',
    this.riderRecruitLink = '',
    this.journeyStore = '',
    this.journeyStoreMeta = '',
    this.journeyOnTheWay = '',
    this.journeyOnTheWayMeta = '',
    this.journeyDoor = '',
    this.journeyDoorMeta = '',
    this.riderCardName = '',
    this.riderCardTeam = '',
    this.riderCardLive = '',
    this.riderCardInitials = '',
    this.riderMetricEta = '',
    this.riderMetricAway = '',
    this.riderMetricRating = '',
    this.riderMetricEtaValue = '',
    this.riderMetricAwayValue = '',
    this.riderMetricRatingValue = '',
    this.riderActionCall = '',
    this.riderActionMessage = '',
    this.getAppEyebrow = '',
    this.getAppTitle = '',
    this.getAppCopy = '',
    this.getAppWebButton = '',
    this.getAppRating = '',
    this.getAppCity = '',
    this.appShotFoodAlt = '',
    this.appShotShopAlt = '',
    this.badgePlayKicker = '',
    this.badgePlayName = '',
    this.badgeAppleKicker = '',
    this.badgeAppleName = '',
    this.badgeComingSoon = '',
    this.footerTagline = '',
    this.footerShop = '',
    this.footerHelp = '',
    this.footerContactTitle = '',
    this.footerFoodMenu = '',
    this.footerShopProducts = '',
    this.footerTrackOrder = '',
    this.footerDeliveryAreas = '',
    this.footerHowItWorks = '',
    this.footerGetTheApp = '',
    this.footerContactUs = '',
    this.footerOpenHours = '',
    this.footerStoreLogin = '',
    this.footerDeliverWithUs = '',
    this.footerTerms = '',
    this.footerPrivacy = '',
    this.socialFacebook = '',
    this.socialInstagram = '',
    this.socialTwitter = '',
    this.policyTerms = '',
    this.policyPrivacy = '',
    this.policyAbout = '',
    this.policyBack = '',
    this.policyEmpty = '',
    this.policyMetaDescription = '',
    this.fallbackHeroTitle = '',
    this.fallbackHeroAccent = '',
    this.fallbackHeroSubtitle = '',
    this.heroTitleTerminator = '',
    this.fallbackFoodTitle = '',
    this.fallbackFoodPoints = const [],
    this.fallbackShopTitle = '',
    this.fallbackShopPoints = const [],
    this.fallbackRiderTitle = '',
    this.fallbackRiderSubtitle = '',
    this.fallbackCopyright = '',
    this.fallbackMetaTitle = '',
    this.fallbackMetaDescription = '',
    this.jsonLdDescription = '',
    this.ogImageAlt = '',
  });

  // ── Navigation ────────────────────────────────────────────────────────
  final String clockAm;

  final String clockPm;

  final String unitKm;

  final String navHome;

  final String navDelivery;

  final String navShop;

  final String navHowItWorks;

  final String navContact;

  final String orderNow;

  final String getTheApp;

  /// Screen-reader labels. Not visible, but read aloud — worth translating.
  final String navAriaMain;

  final String navAriaOpenMenu;

  final String navAriaCloseMenu;

  final String navAriaLightMode;

  final String navAriaDarkMode;

  /// Placeholders: {brand}
  final String brandAriaHome;

  /// Placeholders: {brand}
  final String logoAlt;

  // ── Modules ───────────────────────────────────────────────────────────
  final String moduleFood;

  final String moduleShop;

  // ── Hero ──────────────────────────────────────────────────────────────
  /// Placeholders: {city}, {hours}
  final String heroBadge;

  /// Placeholders: {brand}
  final String heroImageAlt;

  final String heroStatOrders;

  final String heroStatDelivery;

  final String heroStatAreas;

  /// The sample order card floating over the hero image.
  final String trackOrderRef;

  final String trackOnTheWay;

  final String trackEta;

  final String trackDistance;

  final String trackStatus;

  final String trackEtaValue;

  final String trackDistanceValue;

  final String trackStatusValue;

  final String notifTitle;

  final String notifBody;

  // ── Reassurance strip ─────────────────────────────────────────────────
  final String trustFastDelivery;

  final String trustLiveTracking;

  final String trustPayment;

  final String trustSupport;

  // ── Delivery area ─────────────────────────────────────────────────────
  final String zoneEyebrow;

  final String zoneTitle;

  /// Placeholders: {areas}, {radius}
  final String zoneCopy;

  /// Placeholders: {radius}, {address}
  final String zoneMapCaption;

  final String zoneOpenDaily;

  final String zoneDeliveryFrom;

  final String zoneFreeOver;

  final String zoneNotListed;

  final String zoneMessageUs;

  // ── Food & Shop ───────────────────────────────────────────────────────
  final String splitEyebrow;

  final String splitTitleBoth;

  final String splitTitleSingle;

  final String splitCopy;

  final String splitBrowseFood;

  final String splitBrowseShop;

  // ── Popular products ──────────────────────────────────────────────────
  final String showcaseEyebrow;

  final String showcaseTitle;

  final String showcaseChooseCategory;

  final String showcasePreferApp;

  /// Placeholders: {item}
  final String showcaseOrderAria;

  // ── How it works ──────────────────────────────────────────────────────
  final String stepsEyebrow;

  final String stepsTitle;

  final String step1Title;

  final String step1Body;

  final String step2Title;

  final String step2Body;

  final String step3Title;

  final String step3Body;

  final String step4Title;

  final String step4Body;

  // ── Delivery team ─────────────────────────────────────────────────────
  final String riderEyebrow;

  final String riderPointTracking;

  final String riderPointEta;

  final String riderPointContact;

  final String riderPointContactless;

  final String riderRecruitLead;

  /// Placeholders: {brand}
  final String riderRecruitLink;

  final String journeyStore;

  final String journeyStoreMeta;

  final String journeyOnTheWay;

  final String journeyOnTheWayMeta;

  final String journeyDoor;

  final String journeyDoorMeta;

  final String riderCardName;

  /// Placeholders: {brand}
  final String riderCardTeam;

  final String riderCardLive;

  final String riderCardInitials;

  final String riderMetricEta;

  final String riderMetricAway;

  final String riderMetricRating;

  final String riderMetricEtaValue;

  final String riderMetricAwayValue;

  final String riderMetricRatingValue;

  final String riderActionCall;

  final String riderActionMessage;

  // ── Get the app ───────────────────────────────────────────────────────
  final String getAppEyebrow;

  final String getAppTitle;

  final String getAppCopy;

  final String getAppWebButton;

  /// Placeholders: {rating}, {count}
  final String getAppRating;

  /// Placeholders: {city}
  final String getAppCity;

  /// Placeholders: {brand}
  final String appShotFoodAlt;

  /// Placeholders: {brand}
  final String appShotShopAlt;

  /// Store badges. Apple and Google publish their own translated wordmarks —
  /// match their official artwork for your locale where you can.
  final String badgePlayKicker;

  final String badgePlayName;

  final String badgeAppleKicker;

  final String badgeAppleName;

  final String badgeComingSoon;

  // ── Footer ────────────────────────────────────────────────────────────
  /// Placeholders: {city}
  final String footerTagline;

  final String footerShop;

  final String footerHelp;

  final String footerContactTitle;

  final String footerFoodMenu;

  final String footerShopProducts;

  final String footerTrackOrder;

  final String footerDeliveryAreas;

  final String footerHowItWorks;

  final String footerGetTheApp;

  final String footerContactUs;

  /// Placeholders: {hours}
  final String footerOpenHours;

  final String footerStoreLogin;

  final String footerDeliverWithUs;

  final String footerTerms;

  final String footerPrivacy;

  final String socialFacebook;

  final String socialInstagram;

  final String socialTwitter;

  // ── Policy pages ──────────────────────────────────────────────────────
  final String policyTerms;

  final String policyPrivacy;

  /// Placeholders: {brand}
  final String policyAbout;

  final String policyBack;

  final String policyEmpty;

  /// Placeholders: {title}, {brand}, {city}
  final String policyMetaDescription;

  // ── Fallback copy ─────────────────────────────────────────────────────
  // Used only until the store fills in Settings → Landing Page.
  final String fallbackHeroTitle;

  final String fallbackHeroAccent;

  final String fallbackHeroSubtitle;

  /// Closes the headline after the highlighted words. Not every language ends
  /// a sentence with a full stop — set it to '' to drop it entirely.
  final String heroTitleTerminator;

  final String fallbackFoodTitle;

  final List<String> fallbackFoodPoints;

  final String fallbackShopTitle;

  final List<String> fallbackShopPoints;

  final String fallbackRiderTitle;

  final String fallbackRiderSubtitle;

  /// Placeholders: {brand}
  final String fallbackCopyright;

  /// Placeholders: {brand}
  final String fallbackMetaTitle;

  /// Placeholders: {brand}, {city}
  final String fallbackMetaDescription;

  /// Placeholders: {city}
  final String jsonLdDescription;

  /// Placeholders: {brand}, {city}
  final String ogImageAlt;

  /// Fills every entry this translation left out from [base].
  ///
  /// A language file only carries what it has actually translated; everything
  /// else arrives here empty and is taken from English. That is what lets a
  /// half-finished translation render a complete page instead of blanks.
  SiteStrings withFallbackTo(SiteStrings base) => SiteStrings(
    clockAm: clockAm.isEmpty ? base.clockAm : clockAm,
    clockPm: clockPm.isEmpty ? base.clockPm : clockPm,
    unitKm: unitKm.isEmpty ? base.unitKm : unitKm,
    navHome: navHome.isEmpty ? base.navHome : navHome,
    navDelivery: navDelivery.isEmpty ? base.navDelivery : navDelivery,
    navShop: navShop.isEmpty ? base.navShop : navShop,
    navHowItWorks: navHowItWorks.isEmpty ? base.navHowItWorks : navHowItWorks,
    navContact: navContact.isEmpty ? base.navContact : navContact,
    orderNow: orderNow.isEmpty ? base.orderNow : orderNow,
    getTheApp: getTheApp.isEmpty ? base.getTheApp : getTheApp,
    navAriaMain: navAriaMain.isEmpty ? base.navAriaMain : navAriaMain,
    navAriaOpenMenu: navAriaOpenMenu.isEmpty ? base.navAriaOpenMenu : navAriaOpenMenu,
    navAriaCloseMenu: navAriaCloseMenu.isEmpty ? base.navAriaCloseMenu : navAriaCloseMenu,
    navAriaLightMode: navAriaLightMode.isEmpty ? base.navAriaLightMode : navAriaLightMode,
    navAriaDarkMode: navAriaDarkMode.isEmpty ? base.navAriaDarkMode : navAriaDarkMode,
    brandAriaHome: brandAriaHome.isEmpty ? base.brandAriaHome : brandAriaHome,
    logoAlt: logoAlt.isEmpty ? base.logoAlt : logoAlt,
    moduleFood: moduleFood.isEmpty ? base.moduleFood : moduleFood,
    moduleShop: moduleShop.isEmpty ? base.moduleShop : moduleShop,
    heroBadge: heroBadge.isEmpty ? base.heroBadge : heroBadge,
    heroImageAlt: heroImageAlt.isEmpty ? base.heroImageAlt : heroImageAlt,
    heroStatOrders: heroStatOrders.isEmpty ? base.heroStatOrders : heroStatOrders,
    heroStatDelivery: heroStatDelivery.isEmpty ? base.heroStatDelivery : heroStatDelivery,
    heroStatAreas: heroStatAreas.isEmpty ? base.heroStatAreas : heroStatAreas,
    trackOrderRef: trackOrderRef.isEmpty ? base.trackOrderRef : trackOrderRef,
    trackOnTheWay: trackOnTheWay.isEmpty ? base.trackOnTheWay : trackOnTheWay,
    trackEta: trackEta.isEmpty ? base.trackEta : trackEta,
    trackDistance: trackDistance.isEmpty ? base.trackDistance : trackDistance,
    trackStatus: trackStatus.isEmpty ? base.trackStatus : trackStatus,
    trackEtaValue: trackEtaValue.isEmpty ? base.trackEtaValue : trackEtaValue,
    trackDistanceValue: trackDistanceValue.isEmpty ? base.trackDistanceValue : trackDistanceValue,
    trackStatusValue: trackStatusValue.isEmpty ? base.trackStatusValue : trackStatusValue,
    notifTitle: notifTitle.isEmpty ? base.notifTitle : notifTitle,
    notifBody: notifBody.isEmpty ? base.notifBody : notifBody,
    trustFastDelivery: trustFastDelivery.isEmpty ? base.trustFastDelivery : trustFastDelivery,
    trustLiveTracking: trustLiveTracking.isEmpty ? base.trustLiveTracking : trustLiveTracking,
    trustPayment: trustPayment.isEmpty ? base.trustPayment : trustPayment,
    trustSupport: trustSupport.isEmpty ? base.trustSupport : trustSupport,
    zoneEyebrow: zoneEyebrow.isEmpty ? base.zoneEyebrow : zoneEyebrow,
    zoneTitle: zoneTitle.isEmpty ? base.zoneTitle : zoneTitle,
    zoneCopy: zoneCopy.isEmpty ? base.zoneCopy : zoneCopy,
    zoneMapCaption: zoneMapCaption.isEmpty ? base.zoneMapCaption : zoneMapCaption,
    zoneOpenDaily: zoneOpenDaily.isEmpty ? base.zoneOpenDaily : zoneOpenDaily,
    zoneDeliveryFrom: zoneDeliveryFrom.isEmpty ? base.zoneDeliveryFrom : zoneDeliveryFrom,
    zoneFreeOver: zoneFreeOver.isEmpty ? base.zoneFreeOver : zoneFreeOver,
    zoneNotListed: zoneNotListed.isEmpty ? base.zoneNotListed : zoneNotListed,
    zoneMessageUs: zoneMessageUs.isEmpty ? base.zoneMessageUs : zoneMessageUs,
    splitEyebrow: splitEyebrow.isEmpty ? base.splitEyebrow : splitEyebrow,
    splitTitleBoth: splitTitleBoth.isEmpty ? base.splitTitleBoth : splitTitleBoth,
    splitTitleSingle: splitTitleSingle.isEmpty ? base.splitTitleSingle : splitTitleSingle,
    splitCopy: splitCopy.isEmpty ? base.splitCopy : splitCopy,
    splitBrowseFood: splitBrowseFood.isEmpty ? base.splitBrowseFood : splitBrowseFood,
    splitBrowseShop: splitBrowseShop.isEmpty ? base.splitBrowseShop : splitBrowseShop,
    showcaseEyebrow: showcaseEyebrow.isEmpty ? base.showcaseEyebrow : showcaseEyebrow,
    showcaseTitle: showcaseTitle.isEmpty ? base.showcaseTitle : showcaseTitle,
    showcaseChooseCategory: showcaseChooseCategory.isEmpty ? base.showcaseChooseCategory : showcaseChooseCategory,
    showcasePreferApp: showcasePreferApp.isEmpty ? base.showcasePreferApp : showcasePreferApp,
    showcaseOrderAria: showcaseOrderAria.isEmpty ? base.showcaseOrderAria : showcaseOrderAria,
    stepsEyebrow: stepsEyebrow.isEmpty ? base.stepsEyebrow : stepsEyebrow,
    stepsTitle: stepsTitle.isEmpty ? base.stepsTitle : stepsTitle,
    step1Title: step1Title.isEmpty ? base.step1Title : step1Title,
    step1Body: step1Body.isEmpty ? base.step1Body : step1Body,
    step2Title: step2Title.isEmpty ? base.step2Title : step2Title,
    step2Body: step2Body.isEmpty ? base.step2Body : step2Body,
    step3Title: step3Title.isEmpty ? base.step3Title : step3Title,
    step3Body: step3Body.isEmpty ? base.step3Body : step3Body,
    step4Title: step4Title.isEmpty ? base.step4Title : step4Title,
    step4Body: step4Body.isEmpty ? base.step4Body : step4Body,
    riderEyebrow: riderEyebrow.isEmpty ? base.riderEyebrow : riderEyebrow,
    riderPointTracking: riderPointTracking.isEmpty ? base.riderPointTracking : riderPointTracking,
    riderPointEta: riderPointEta.isEmpty ? base.riderPointEta : riderPointEta,
    riderPointContact: riderPointContact.isEmpty ? base.riderPointContact : riderPointContact,
    riderPointContactless: riderPointContactless.isEmpty ? base.riderPointContactless : riderPointContactless,
    riderRecruitLead: riderRecruitLead.isEmpty ? base.riderRecruitLead : riderRecruitLead,
    riderRecruitLink: riderRecruitLink.isEmpty ? base.riderRecruitLink : riderRecruitLink,
    journeyStore: journeyStore.isEmpty ? base.journeyStore : journeyStore,
    journeyStoreMeta: journeyStoreMeta.isEmpty ? base.journeyStoreMeta : journeyStoreMeta,
    journeyOnTheWay: journeyOnTheWay.isEmpty ? base.journeyOnTheWay : journeyOnTheWay,
    journeyOnTheWayMeta: journeyOnTheWayMeta.isEmpty ? base.journeyOnTheWayMeta : journeyOnTheWayMeta,
    journeyDoor: journeyDoor.isEmpty ? base.journeyDoor : journeyDoor,
    journeyDoorMeta: journeyDoorMeta.isEmpty ? base.journeyDoorMeta : journeyDoorMeta,
    riderCardName: riderCardName.isEmpty ? base.riderCardName : riderCardName,
    riderCardTeam: riderCardTeam.isEmpty ? base.riderCardTeam : riderCardTeam,
    riderCardLive: riderCardLive.isEmpty ? base.riderCardLive : riderCardLive,
    riderCardInitials: riderCardInitials.isEmpty ? base.riderCardInitials : riderCardInitials,
    riderMetricEta: riderMetricEta.isEmpty ? base.riderMetricEta : riderMetricEta,
    riderMetricAway: riderMetricAway.isEmpty ? base.riderMetricAway : riderMetricAway,
    riderMetricRating: riderMetricRating.isEmpty ? base.riderMetricRating : riderMetricRating,
    riderMetricEtaValue: riderMetricEtaValue.isEmpty ? base.riderMetricEtaValue : riderMetricEtaValue,
    riderMetricAwayValue: riderMetricAwayValue.isEmpty ? base.riderMetricAwayValue : riderMetricAwayValue,
    riderMetricRatingValue: riderMetricRatingValue.isEmpty ? base.riderMetricRatingValue : riderMetricRatingValue,
    riderActionCall: riderActionCall.isEmpty ? base.riderActionCall : riderActionCall,
    riderActionMessage: riderActionMessage.isEmpty ? base.riderActionMessage : riderActionMessage,
    getAppEyebrow: getAppEyebrow.isEmpty ? base.getAppEyebrow : getAppEyebrow,
    getAppTitle: getAppTitle.isEmpty ? base.getAppTitle : getAppTitle,
    getAppCopy: getAppCopy.isEmpty ? base.getAppCopy : getAppCopy,
    getAppWebButton: getAppWebButton.isEmpty ? base.getAppWebButton : getAppWebButton,
    getAppRating: getAppRating.isEmpty ? base.getAppRating : getAppRating,
    getAppCity: getAppCity.isEmpty ? base.getAppCity : getAppCity,
    appShotFoodAlt: appShotFoodAlt.isEmpty ? base.appShotFoodAlt : appShotFoodAlt,
    appShotShopAlt: appShotShopAlt.isEmpty ? base.appShotShopAlt : appShotShopAlt,
    badgePlayKicker: badgePlayKicker.isEmpty ? base.badgePlayKicker : badgePlayKicker,
    badgePlayName: badgePlayName.isEmpty ? base.badgePlayName : badgePlayName,
    badgeAppleKicker: badgeAppleKicker.isEmpty ? base.badgeAppleKicker : badgeAppleKicker,
    badgeAppleName: badgeAppleName.isEmpty ? base.badgeAppleName : badgeAppleName,
    badgeComingSoon: badgeComingSoon.isEmpty ? base.badgeComingSoon : badgeComingSoon,
    footerTagline: footerTagline.isEmpty ? base.footerTagline : footerTagline,
    footerShop: footerShop.isEmpty ? base.footerShop : footerShop,
    footerHelp: footerHelp.isEmpty ? base.footerHelp : footerHelp,
    footerContactTitle: footerContactTitle.isEmpty ? base.footerContactTitle : footerContactTitle,
    footerFoodMenu: footerFoodMenu.isEmpty ? base.footerFoodMenu : footerFoodMenu,
    footerShopProducts: footerShopProducts.isEmpty ? base.footerShopProducts : footerShopProducts,
    footerTrackOrder: footerTrackOrder.isEmpty ? base.footerTrackOrder : footerTrackOrder,
    footerDeliveryAreas: footerDeliveryAreas.isEmpty ? base.footerDeliveryAreas : footerDeliveryAreas,
    footerHowItWorks: footerHowItWorks.isEmpty ? base.footerHowItWorks : footerHowItWorks,
    footerGetTheApp: footerGetTheApp.isEmpty ? base.footerGetTheApp : footerGetTheApp,
    footerContactUs: footerContactUs.isEmpty ? base.footerContactUs : footerContactUs,
    footerOpenHours: footerOpenHours.isEmpty ? base.footerOpenHours : footerOpenHours,
    footerStoreLogin: footerStoreLogin.isEmpty ? base.footerStoreLogin : footerStoreLogin,
    footerDeliverWithUs: footerDeliverWithUs.isEmpty ? base.footerDeliverWithUs : footerDeliverWithUs,
    footerTerms: footerTerms.isEmpty ? base.footerTerms : footerTerms,
    footerPrivacy: footerPrivacy.isEmpty ? base.footerPrivacy : footerPrivacy,
    socialFacebook: socialFacebook.isEmpty ? base.socialFacebook : socialFacebook,
    socialInstagram: socialInstagram.isEmpty ? base.socialInstagram : socialInstagram,
    socialTwitter: socialTwitter.isEmpty ? base.socialTwitter : socialTwitter,
    policyTerms: policyTerms.isEmpty ? base.policyTerms : policyTerms,
    policyPrivacy: policyPrivacy.isEmpty ? base.policyPrivacy : policyPrivacy,
    policyAbout: policyAbout.isEmpty ? base.policyAbout : policyAbout,
    policyBack: policyBack.isEmpty ? base.policyBack : policyBack,
    policyEmpty: policyEmpty.isEmpty ? base.policyEmpty : policyEmpty,
    policyMetaDescription: policyMetaDescription.isEmpty ? base.policyMetaDescription : policyMetaDescription,
    fallbackHeroTitle: fallbackHeroTitle.isEmpty ? base.fallbackHeroTitle : fallbackHeroTitle,
    fallbackHeroAccent: fallbackHeroAccent.isEmpty ? base.fallbackHeroAccent : fallbackHeroAccent,
    fallbackHeroSubtitle: fallbackHeroSubtitle.isEmpty ? base.fallbackHeroSubtitle : fallbackHeroSubtitle,
    heroTitleTerminator: heroTitleTerminator.isEmpty ? base.heroTitleTerminator : heroTitleTerminator,
    fallbackFoodTitle: fallbackFoodTitle.isEmpty ? base.fallbackFoodTitle : fallbackFoodTitle,
    fallbackFoodPoints: fallbackFoodPoints.isEmpty ? base.fallbackFoodPoints : fallbackFoodPoints,
    fallbackShopTitle: fallbackShopTitle.isEmpty ? base.fallbackShopTitle : fallbackShopTitle,
    fallbackShopPoints: fallbackShopPoints.isEmpty ? base.fallbackShopPoints : fallbackShopPoints,
    fallbackRiderTitle: fallbackRiderTitle.isEmpty ? base.fallbackRiderTitle : fallbackRiderTitle,
    fallbackRiderSubtitle: fallbackRiderSubtitle.isEmpty ? base.fallbackRiderSubtitle : fallbackRiderSubtitle,
    fallbackCopyright: fallbackCopyright.isEmpty ? base.fallbackCopyright : fallbackCopyright,
    fallbackMetaTitle: fallbackMetaTitle.isEmpty ? base.fallbackMetaTitle : fallbackMetaTitle,
    fallbackMetaDescription: fallbackMetaDescription.isEmpty ? base.fallbackMetaDescription : fallbackMetaDescription,
    jsonLdDescription: jsonLdDescription.isEmpty ? base.jsonLdDescription : jsonLdDescription,
    ogImageAlt: ogImageAlt.isEmpty ? base.ogImageAlt : ogImageAlt,
  );
}

/// Replaces `{name}` tokens with values.
///
/// A missing key leaves its token visible rather than throwing — a visible
/// `{city}` on the page is a bug you notice, a silent crash on someone's
/// storefront is not.
extension StringTemplate on String {
  String fill(Map<String, Object?> values) {
    var out = this;
    values.forEach((key, value) {
      out = out.replaceAll('{$key}', '$value');
    });
    return out;
  }
}
