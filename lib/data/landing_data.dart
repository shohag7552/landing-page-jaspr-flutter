/// Everything the page renders, in one object.
///
/// Pure Dart — no `dart:io`, no network. The server entrypoint builds one of
/// these from Appwrite (see `landing_repository.dart`) and hands it to the
/// tree; every field falls back to the constants in `lib/content/`, so a store
/// that has not filled in its landing setup still gets a complete page rather
/// than a scattering of blanks.
library;

import 'dart:convert';

import 'package:jaspr/jaspr.dart';

import '../content/site_content.dart' as defaults;
import '../content/site_links.dart' as links;
import 'appwrite_config.dart';

/// One product as it appears in the Food/Shop showcase.
class ShowcaseItem {
  const ShowcaseItem({
    required this.image,
    required this.title,
    required this.category,
    required this.price,
    required this.rating,
    required this.meta,
  });

  final String image;
  final String title;
  final String category;
  final String price;
  final String rating;

  /// Prep time for food, stock or discount for shop.
  final String meta;

  Map<String, dynamic> toJson() => {
    'image': image,
    'title': title,
    'category': category,
    'price': price,
    'rating': rating,
    'meta': meta,
  };

  factory ShowcaseItem.fromJson(Map<String, dynamic> json) => ShowcaseItem(
    image: json['image'] as String? ?? '',
    title: json['title'] as String? ?? '',
    category: json['category'] as String? ?? '',
    price: json['price'] as String? ?? '',
    rating: json['rating'] as String? ?? '',
    meta: json['meta'] as String? ?? '',
  );
}

class LandingData {
  const LandingData({
    required this.brandFirst,
    required this.brandSecond,
    required this.logoUrl,
    required this.city,
    required this.storeAddress,
    required this.openingHours,
    required this.deliveryRadius,
    required this.heroBadge,
    required this.heroTitle,
    required this.heroAccent,
    required this.heroSubtitle,
    required this.heroImage,
    required this.ordersDelivered,
    required this.avgDeliveryMinutes,
    required this.rating,
    required this.ratingCount,
    required this.coveredAreas,
    required this.deliveryFeeFrom,
    required this.freeDeliveryOver,
    required this.foodEnabled,
    required this.shopEnabled,
    required this.foodTitle,
    required this.foodPoints,
    required this.shopTitle,
    required this.shopPoints,
    required this.riderTitle,
    required this.riderSubtitle,
    required this.riderApplyUrl,
    required this.appFoodShot,
    required this.appShopShot,
    required this.webAppUrl,
    required this.appStoreUrl,
    required this.playStoreUrl,
    required this.storePanelUrl,
    required this.phone,
    required this.email,
    required this.whatsappUrl,
    required this.facebookUrl,
    required this.instagramUrl,
    required this.twitterUrl,
    required this.termsUrl,
    required this.privacyUrl,
    required this.copyright,
    required this.siteUrl,
    required this.metaTitle,
    required this.metaDescription,
    required this.ogImage,
    required this.brandHex,
    required this.showDelivery,
    required this.showShowcase,
    required this.showRider,
    required this.showApp,
    required this.foodItems,
    required this.shopItems,
    required this.isLive,
  });

  // Identity
  final String brandFirst;
  final String brandSecond;

  /// The store's own logo, from Store Setup. Empty falls back to the built-in
  /// mark so a store that has not uploaded one still gets a finished header.
  final String logoUrl;
  final String city;
  final String storeAddress;
  final String openingHours;
  final String deliveryRadius;

  // Hero
  final String heroBadge;
  final String heroTitle;
  final String heroAccent;
  final String heroSubtitle;
  final String heroImage;

  // Headline numbers
  final String ordersDelivered;
  final String avgDeliveryMinutes;
  final String rating;
  final String ratingCount;

  // Delivery area
  final List<String> coveredAreas;
  final String deliveryFeeFrom;
  final String freeDeliveryOver;

  // Modules — driven by the switches in Business Setup
  final bool foodEnabled;
  final bool shopEnabled;
  final String foodTitle;
  final List<String> foodPoints;
  final String shopTitle;
  final List<String> shopPoints;

  // Rider
  final String riderTitle;
  final String riderSubtitle;
  final String riderApplyUrl;

  // App
  final String appFoodShot;
  final String appShopShot;

  // Links
  final String webAppUrl;
  final String appStoreUrl;
  final String playStoreUrl;
  final String storePanelUrl;
  final String phone;
  final String email;
  final String whatsappUrl;
  final String facebookUrl;
  final String instagramUrl;
  final String twitterUrl;
  final String termsUrl;
  final String privacyUrl;
  final String copyright;

  // SEO
  final String siteUrl;
  final String metaTitle;
  final String metaDescription;
  final String ogImage;
  final String brandHex;

  // Section visibility
  final bool showDelivery;
  final bool showShowcase;
  final bool showRider;
  final bool showApp;

  // Catalogue
  final List<ShowcaseItem> foodItems;
  final List<ShowcaseItem> shopItems;

  /// True when at least one row came back from Appwrite. False means the page
  /// is rendering entirely from the built-in defaults.
  final bool isLive;

  /// Serialised into the page so the browser hydrates with exactly what the
  /// server rendered.
  ///
  /// Without this the client would rebuild from defaults and the real content
  /// would visibly flash to placeholder text and back on every load.
  Map<String, dynamic> toJson() => {
    'brandFirst': brandFirst,
    'brandSecond': brandSecond,
    'logoUrl': logoUrl,
    'city': city,
    'storeAddress': storeAddress,
    'openingHours': openingHours,
    'deliveryRadius': deliveryRadius,
    'heroBadge': heroBadge,
    'heroTitle': heroTitle,
    'heroAccent': heroAccent,
    'heroSubtitle': heroSubtitle,
    'heroImage': heroImage,
    'ordersDelivered': ordersDelivered,
    'avgDeliveryMinutes': avgDeliveryMinutes,
    'rating': rating,
    'ratingCount': ratingCount,
    'coveredAreas': coveredAreas,
    'deliveryFeeFrom': deliveryFeeFrom,
    'freeDeliveryOver': freeDeliveryOver,
    'foodEnabled': foodEnabled,
    'shopEnabled': shopEnabled,
    'foodTitle': foodTitle,
    'foodPoints': foodPoints,
    'shopTitle': shopTitle,
    'shopPoints': shopPoints,
    'riderTitle': riderTitle,
    'riderSubtitle': riderSubtitle,
    'riderApplyUrl': riderApplyUrl,
    'appFoodShot': appFoodShot,
    'appShopShot': appShopShot,
    'webAppUrl': webAppUrl,
    'appStoreUrl': appStoreUrl,
    'playStoreUrl': playStoreUrl,
    'storePanelUrl': storePanelUrl,
    'phone': phone,
    'email': email,
    'whatsappUrl': whatsappUrl,
    'facebookUrl': facebookUrl,
    'instagramUrl': instagramUrl,
    'twitterUrl': twitterUrl,
    'termsUrl': termsUrl,
    'privacyUrl': privacyUrl,
    'copyright': copyright,
    'siteUrl': siteUrl,
    'metaTitle': metaTitle,
    'metaDescription': metaDescription,
    'ogImage': ogImage,
    'brandHex': brandHex,
    'showDelivery': showDelivery,
    'showShowcase': showShowcase,
    'showRider': showRider,
    'showApp': showApp,
    'foodItems': foodItems.map((e) => e.toJson()).toList(),
    'shopItems': shopItems.map((e) => e.toJson()).toList(),
    'isLive': isLive,
  };

  factory LandingData.fromJson(Map<String, dynamic> json) {
    final base = LandingData.fallback();
    return LandingData(
      brandFirst: json['brandFirst'] as String? ?? base.brandFirst,
      brandSecond: json['brandSecond'] as String? ?? base.brandSecond,
      logoUrl: json['logoUrl'] as String? ?? base.logoUrl,
      city: json['city'] as String? ?? base.city,
      storeAddress: json['storeAddress'] as String? ?? base.storeAddress,
      openingHours: json['openingHours'] as String? ?? base.openingHours,
      deliveryRadius: json['deliveryRadius'] as String? ?? base.deliveryRadius,
      heroBadge: json['heroBadge'] as String? ?? base.heroBadge,
      heroTitle: json['heroTitle'] as String? ?? base.heroTitle,
      heroAccent: json['heroAccent'] as String? ?? base.heroAccent,
      heroSubtitle: json['heroSubtitle'] as String? ?? base.heroSubtitle,
      heroImage: json['heroImage'] as String? ?? base.heroImage,
      ordersDelivered: json['ordersDelivered'] as String? ?? base.ordersDelivered,
      avgDeliveryMinutes: json['avgDeliveryMinutes'] as String? ?? base.avgDeliveryMinutes,
      rating: json['rating'] as String? ?? base.rating,
      ratingCount: json['ratingCount'] as String? ?? base.ratingCount,
      coveredAreas: (json['coveredAreas'] as List? ?? const []).map((e) => e.toString()).toList(),
      deliveryFeeFrom: json['deliveryFeeFrom'] as String? ?? base.deliveryFeeFrom,
      freeDeliveryOver: json['freeDeliveryOver'] as String? ?? base.freeDeliveryOver,
      foodEnabled: json['foodEnabled'] as bool? ?? base.foodEnabled,
      shopEnabled: json['shopEnabled'] as bool? ?? base.shopEnabled,
      foodTitle: json['foodTitle'] as String? ?? base.foodTitle,
      foodPoints: (json['foodPoints'] as List? ?? const []).map((e) => e.toString()).toList(),
      shopTitle: json['shopTitle'] as String? ?? base.shopTitle,
      shopPoints: (json['shopPoints'] as List? ?? const []).map((e) => e.toString()).toList(),
      riderTitle: json['riderTitle'] as String? ?? base.riderTitle,
      riderSubtitle: json['riderSubtitle'] as String? ?? base.riderSubtitle,
      riderApplyUrl: json['riderApplyUrl'] as String? ?? base.riderApplyUrl,
      appFoodShot: json['appFoodShot'] as String? ?? base.appFoodShot,
      appShopShot: json['appShopShot'] as String? ?? base.appShopShot,
      webAppUrl: json['webAppUrl'] as String? ?? base.webAppUrl,
      appStoreUrl: json['appStoreUrl'] as String? ?? base.appStoreUrl,
      playStoreUrl: json['playStoreUrl'] as String? ?? base.playStoreUrl,
      storePanelUrl: json['storePanelUrl'] as String? ?? base.storePanelUrl,
      phone: json['phone'] as String? ?? base.phone,
      email: json['email'] as String? ?? base.email,
      whatsappUrl: json['whatsappUrl'] as String? ?? base.whatsappUrl,
      facebookUrl: json['facebookUrl'] as String? ?? base.facebookUrl,
      instagramUrl: json['instagramUrl'] as String? ?? base.instagramUrl,
      twitterUrl: json['twitterUrl'] as String? ?? base.twitterUrl,
      termsUrl: json['termsUrl'] as String? ?? base.termsUrl,
      privacyUrl: json['privacyUrl'] as String? ?? base.privacyUrl,
      copyright: json['copyright'] as String? ?? base.copyright,
      siteUrl: json['siteUrl'] as String? ?? base.siteUrl,
      metaTitle: json['metaTitle'] as String? ?? base.metaTitle,
      metaDescription: json['metaDescription'] as String? ?? base.metaDescription,
      ogImage: json['ogImage'] as String? ?? base.ogImage,
      brandHex: json['brandHex'] as String? ?? base.brandHex,
      showDelivery: json['showDelivery'] as bool? ?? base.showDelivery,
      showShowcase: json['showShowcase'] as bool? ?? base.showShowcase,
      showRider: json['showRider'] as bool? ?? base.showRider,
      showApp: json['showApp'] as bool? ?? base.showApp,
      foodItems: (json['foodItems'] as List? ?? const [])
          .map((e) => ShowcaseItem.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      shopItems: (json['shopItems'] as List? ?? const [])
          .map((e) => ShowcaseItem.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      isLive: json['isLive'] as bool? ?? base.isLive,
    );
  }

  String get brandName => '$brandFirst $brandSecond';
  String get phoneHref => 'tel:${phone.replaceAll(RegExp(r'[^0-9+]'), '')}';
  String get emailHref => 'mailto:$email';
  int get areasCovered => coveredAreas.length;

  /// Both modules on, so the page tells the two-stores-one-cart story.
  bool get isDualModule => foodEnabled && shopEnabled;

  /// Showcase only earns its place when there is something to show.
  bool get hasShowcase => showShowcase && (foodItems.isNotEmpty || shopItems.isNotEmpty);

  /// The page as it looks with nothing configured — also the fallback for
  /// every individual field that comes back blank.
  static LandingData fallback() => LandingData(
    brandFirst: defaults.kBrandFirst,
    brandSecond: defaults.kBrandSecond,
    logoUrl: '',
    city: defaults.kCity,
    storeAddress: defaults.kStoreAddress,
    openingHours: defaults.kOpeningHours,
    deliveryRadius: defaults.kDeliveryRadiusKm,
    heroBadge: 'Delivering across ${defaults.kCity} · Open ${defaults.kOpeningHours}',
    heroTitle: 'Food and shopping,',
    heroAccent: 'delivered',
    heroSubtitle: 'Meals from our kitchen, products from our shop — one cart, one rider.',
    heroImage: 'https://images.unsplash.com/photo-1526367790999-0150786686a2?q=80&w=1400&auto=format&fit=crop',
    ordersDelivered: defaults.kOrdersDelivered,
    avgDeliveryMinutes: defaults.kAvgDeliveryMinutes,
    rating: defaults.kRating,
    ratingCount: defaults.kRatingCount,
    coveredAreas: defaults.kCoveredAreas,
    deliveryFeeFrom: defaults.kDeliveryFeeFrom,
    freeDeliveryOver: defaults.kFreeDeliveryOver,
    foodEnabled: true,
    shopEnabled: true,
    foodTitle: 'Hot meals, made to order',
    foodPoints: const [
      'Breakfast, lunch and dinner',
      'Customise before you order',
      'Live prep and delivery time',
    ],
    shopTitle: 'Products, picked and packed',
    shopPoints: const [
      'Fashion, electronics and home',
      'Flash sales and member offers',
      'Live stock and easy returns',
    ],
    riderTitle: 'Tracked all the way.',
    riderSubtitle: 'Every order goes to one of our own riders — not a stranger from a marketplace.',
    riderApplyUrl: links.kRiderApplyUrl,
    appFoodShot: '/images/app-food.png',
    appShopShot: '/images/app-shop.png',
    webAppUrl: links.kWebAppUrl,
    appStoreUrl: links.kAppStoreUrl,
    playStoreUrl: links.kPlayStoreUrl,
    storePanelUrl: links.kStorePanelUrl,
    phone: links.kSupportPhone,
    email: links.kSupportEmail,
    whatsappUrl: links.kWhatsAppUrl,
    facebookUrl: links.kFacebookUrl,
    instagramUrl: links.kInstagramUrl,
    twitterUrl: links.kTwitterUrl,
    termsUrl: links.kTermsUrl,
    privacyUrl: links.kPrivacyUrl,
    copyright: '© 2026 ${defaults.kBrandName}. All rights reserved.',
    siteUrl: defaults.kSiteUrl,
    metaTitle: '${defaults.kBrandName} — Order Food & Products Online | Fast Local Delivery',
    metaDescription:
        'Order food and products online from ${defaults.kBrandName} in ${defaults.kCity}. '
        'Hot meals from our kitchen and everything from our shop, delivered to your door '
        'with live rider tracking. Order on the web, or get the Android and iPhone app.',
    ogImage: '${defaults.kSiteUrl}/images/og-cover.jpg',
    brandHex: '#C6453E',
    showDelivery: true,
    showShowcase: true,
    showRider: true,
    showApp: true,
    foodItems: const [],
    shopItems: const [],
    isLive: false,
  );

  /// Assembles the page data from the three setup rows plus the product lists.
  ///
  /// Every field is `pick`ed: a blank column falls back to the default rather
  /// than rendering an empty heading. A half-filled `landing_setup` therefore
  /// degrades field by field instead of all at once.
  factory LandingData.fromRows({
    Map<String, dynamic>? business,
    Map<String, dynamic>? store,
    Map<String, dynamic>? landing,
    List<ShowcaseItem> foodItems = const [],
    List<ShowcaseItem> shopItems = const [],
  }) {
    final base = LandingData.fallback();
    final b = business ?? const {};
    final s = store ?? const {};
    final l = landing ?? const {};
    final live = business != null || store != null || landing != null;

    String pick(Map<String, dynamic> row, String key, String orElse) {
      final value = row[key];
      if (value == null) return orElse;
      final text = value.toString().trim();
      return text.isEmpty ? orElse : text;
    }

    bool flag(Map<String, dynamic> row, String key, bool orElse) {
      final value = row[key];
      return value is bool ? value : orElse;
    }

    List<String> list(Map<String, dynamic> row, String key, List<String> orElse) {
      final parsed = decodeStringList(row[key]);
      return parsed.isEmpty ? orElse : parsed;
    }

    /// Money formatting follows the store's own currency symbol.
    final currency = pick(b, 'currency_symbol', r'$');
    String money(dynamic value, String orElse) {
      if (value == null) return orElse;
      final number = value is num ? value : num.tryParse(value.toString());
      if (number == null) return orElse;
      final text = number == number.roundToDouble() ? number.toStringAsFixed(0) : number.toStringAsFixed(2);
      return '$currency$text';
    }

    final storeName = localised(s['store_name']);
    final businessName = localised(b['business_name']);
    final brandName = storeName.isNotEmpty ? storeName : (businessName.isNotEmpty ? businessName : base.brandName);
    final parts = brandName.split(' ');
    final brandFirst = parts.first;
    final brandSecond = parts.length > 1 ? parts.sublist(1).join(' ') : '';

    final city = pick(s, 'city', base.city);
    final address = pick(s, 'address', pick(b, 'store_location', base.storeAddress));
    final hours = formatBusinessHours(b['business_hours'], base.openingHours);

    final radiusRaw = b['max_delivery_radius'];
    final radius = radiusRaw == null
        ? base.deliveryRadius
        : '${(radiusRaw is num ? radiusRaw : num.tryParse('$radiusRaw') ?? 0).toStringAsFixed(0)} km';

    // A store running one module should not advertise the other.
    final foodEnabled = flag(b, 'is_food_module_enabled', base.foodEnabled);
    final shopEnabled = flag(b, 'is_ecommerce_module_enabled', base.shopEnabled);

    final resolvedName = brandSecond.isEmpty ? brandFirst : '$brandFirst $brandSecond';
    final siteUrl = pick(l, 'site_url', base.siteUrl);

    return LandingData(
      brandFirst: brandFirst,
      brandSecond: brandSecond,
      logoUrl: pick(s, 'logo_url', ''),
      city: city,
      storeAddress: address,
      openingHours: hours,
      deliveryRadius: radius,
      heroBadge: pick(l, 'hero_badge_text', 'Delivering across $city · Open $hours'),
      heroTitle: pick(l, 'hero_title', base.heroTitle),
      heroAccent: pick(l, 'hero_title_accent', base.heroAccent),
      heroSubtitle: pick(l, 'hero_subtitle', base.heroSubtitle),
      heroImage: pick(l, 'hero_image_url', pick(s, 'cover_url', base.heroImage)),
      ordersDelivered: pick(l, 'stat_orders_delivered', base.ordersDelivered),
      avgDeliveryMinutes: pick(b, 'max_delivery_time', base.avgDeliveryMinutes),
      rating: pick(l, 'stat_rating', base.rating),
      ratingCount: pick(l, 'stat_rating_count', base.ratingCount),
      coveredAreas: list(l, 'covered_areas', base.coveredAreas),
      deliveryFeeFrom: money(b['min_delivery_fee'], base.deliveryFeeFrom),
      freeDeliveryOver: money(b['free_delivery_above'], base.freeDeliveryOver),
      foodEnabled: foodEnabled,
      shopEnabled: shopEnabled,
      foodTitle: pick(l, 'food_card_title', base.foodTitle),
      foodPoints: list(l, 'food_card_points', base.foodPoints),
      shopTitle: pick(l, 'shop_card_title', base.shopTitle),
      shopPoints: list(l, 'shop_card_points', base.shopPoints),
      riderTitle: pick(l, 'rider_title', base.riderTitle),
      riderSubtitle: pick(l, 'rider_subtitle', base.riderSubtitle),
      riderApplyUrl: pick(l, 'rider_apply_url', base.riderApplyUrl),
      appFoodShot: pick(l, 'app_screenshot_food_url', base.appFoodShot),
      appShopShot: pick(l, 'app_screenshot_shop_url', base.appShopShot),
      webAppUrl: pick(s, 'website', base.webAppUrl),
      appStoreUrl: pick(b, 'ios_store_url', base.appStoreUrl),
      playStoreUrl: pick(b, 'android_store_url', base.playStoreUrl),
      storePanelUrl: base.storePanelUrl,
      phone: pick(s, 'phone', base.phone),
      email: pick(s, 'email', base.email),
      whatsappUrl: pick(l, 'whatsapp_url', base.whatsappUrl),
      facebookUrl: pick(s, 'facebook', base.facebookUrl),
      instagramUrl: pick(s, 'instagram', base.instagramUrl),
      twitterUrl: pick(s, 'twitter', base.twitterUrl),
      termsUrl: pick(l, 'terms_url', base.termsUrl),
      privacyUrl: pick(l, 'privacy_url', base.privacyUrl),
      copyright: pick(b, 'copyright_text', '© 2026 $resolvedName. All rights reserved.'),
      siteUrl: siteUrl,
      metaTitle: pick(l, 'meta_title', '$resolvedName — Order Food & Products Online | Fast Local Delivery'),
      metaDescription: pick(l, 'meta_description', pick(s, 'description', base.metaDescription)),
      ogImage: pick(l, 'og_image_url', pick(s, 'cover_url', '$siteUrl/images/og-cover.jpg')),
      brandHex: _normaliseHex(pick(l, 'brand_color', base.brandHex), base.brandHex),
      showDelivery: flag(l, 'show_delivery_section', base.showDelivery),
      showShowcase: flag(l, 'show_showcase_section', base.showShowcase),
      showRider: flag(l, 'show_rider_section', base.showRider),
      showApp: flag(l, 'show_app_section', base.showApp),
      foodItems: foodItems,
      shopItems: shopItems,
      isLive: live,
    );
  }

  /// Lists arrive as a JSON string in one column; a comma-separated string is
  /// tolerated so a row hand-edited in the Appwrite console still renders.
  static List<String> decodeStringList(dynamic raw) {
    if (raw == null) return const [];
    if (raw is List) {
      return raw.map((e) => e.toString().trim()).where((e) => e.isNotEmpty).toList();
    }

    final text = raw.toString().trim();
    if (text.isEmpty) return const [];

    if (text.startsWith('[')) {
      try {
        final decoded = jsonDecode(text);
        if (decoded is List) {
          return decoded.map((e) => e.toString().trim()).where((e) => e.isNotEmpty).toList();
        }
      } catch (_) {
        // Fall through to comma splitting.
      }
    }

    return text.split(RegExp(r'[,\n]')).map((e) => e.trim()).where((e) => e.isNotEmpty).toList();
  }

  /// A colour that is not a valid hex would break every `color-mix()` on the
  /// page, so anything unparseable falls back rather than shipping broken CSS.
  static String _normaliseHex(String value, String orElse) {
    final text = value.trim();
    return RegExp(r'^#([0-9a-fA-F]{3}|[0-9a-fA-F]{6})$').hasMatch(text) ? text : orElse;
  }
}

/// Resolves a localised value to plain text.
///
/// Several columns store `{"en":"Burger","bn":"বারগার"}` rather than a string,
/// so rendering them directly puts raw JSON on the page. Prefers [language],
/// then English, then whatever the first entry is — a store that only filled
/// in Bengali still gets its own words rather than an empty heading.
String localised(dynamic raw, {String language = 'en'}) {
  if (raw == null) return '';

  if (raw is Map) {
    final map = Map<String, dynamic>.from(raw);
    for (final key in [language, 'en']) {
      final value = map[key]?.toString().trim();
      if (value != null && value.isNotEmpty) return value;
    }
    for (final value in map.values) {
      final text = value?.toString().trim() ?? '';
      if (text.isNotEmpty) return text;
    }
    return '';
  }

  final text = raw.toString().trim();
  if (!text.startsWith('{')) return text;

  try {
    final decoded = jsonDecode(text);
    if (decoded is Map) return localised(decoded, language: language);
  } catch (_) {
    // Not JSON after all — it is just a string that happens to start with "{".
  }
  return text;
}

/// Turns the store's weekly schedule into one line a shopper can read.
///
/// `business_setup.business_hours` holds a JSON map keyed by weekday index,
/// each day carrying `is_open` and a list of `time_slots`. Rendering that raw
/// would dump a wall of JSON onto the page.
///
/// Reports the **most common** open day rather than the widest range across
/// the week: a single late Tuesday should not advertise the whole week as
/// open until midnight. Days that differ are still visible in the app.
String formatBusinessHours(dynamic raw, String orElse) {
  if (raw == null) return orElse;
  final text = raw.toString().trim();
  if (text.isEmpty) return orElse;

  Map<String, dynamic> schedule;
  try {
    final decoded = jsonDecode(text);
    if (decoded is! Map) return orElse;
    schedule = Map<String, dynamic>.from(decoded);
  } catch (_) {
    // Older rows stored a plain string like "9am - 6pm"; keep showing it.
    return text;
  }

  final counts = <String, int>{};
  for (final day in schedule.values) {
    if (day is! Map) continue;
    if (day['is_open'] != true) continue;

    final slots = day['time_slots'];
    if (slots is! List || slots.isEmpty) continue;

    final rendered = slots
        .whereType<Map>()
        .map(
          (slot) =>
              '${_clock(slot['open_hour'], slot['open_minute'])} – '
              '${_clock(slot['close_hour'], slot['close_minute'])}',
        )
        .join(', ');

    if (rendered.isEmpty) continue;
    counts[rendered] = (counts[rendered] ?? 0) + 1;
  }

  if (counts.isEmpty) return orElse;

  var best = counts.keys.first;
  for (final entry in counts.entries) {
    if (entry.value > counts[best]!) best = entry.key;
  }
  return best;
}

String _clock(dynamic hour, dynamic minute) {
  final h = hour is num ? hour.toInt() : int.tryParse('$hour') ?? 0;
  final m = minute is num ? minute.toInt() : int.tryParse('$minute') ?? 0;
  final suffix = h < 12 ? 'am' : 'pm';
  final display = h % 12 == 0 ? 12 : h % 12;
  final mm = m.toString().padLeft(2, '0');
  return '$display:$mm$suffix';
}

/// Builds a [ShowcaseItem] from a `products` row.
ShowcaseItem showcaseItemFromRow(
  Map<String, dynamic> row, {
  required String currency,
  required String foodMeta,
}) {
  final price = row['price'];
  final priceText = price is num
      ? '$currency${price == price.roundToDouble() ? price.toStringAsFixed(0) : price.toStringAsFixed(2)}'
      : '';
  final rating = row['avg_rating'];
  final isFood = (row['module_type'] ?? 'food').toString() == 'food';

  return ShowcaseItem(
    image: appwriteImageUrl((row['image_id'] ?? '').toString()),
    title: localised(row['name']),
    category: (row['module_type'] ?? '').toString() == 'food' ? 'Food' : 'Shop',
    price: priceText,
    rating: rating is num ? rating.toStringAsFixed(1) : '',
    meta: isFood
        ? foodMeta
        : ((row['stock'] ?? 0) as num) > 0
        ? 'In stock'
        : 'Sold out',
  );
}

/// Carries [LandingData] down the tree.
///
/// An inherited component rather than a global so the same code works when the
/// site is switched to `mode: server`, where each request renders its own data.
class LandingScope extends InheritedComponent {
  const LandingScope({required this.data, required super.child, super.key});

  final LandingData data;

  /// The data for this subtree.
  ///
  /// Falls back to defaults rather than throwing when no scope is found. A
  /// `@client` island hydrates as its own root, so a component used both on
  /// the page and inside an island would otherwise crash in the browser only —
  /// the worst place to find out. Prefer passing values into islands instead.
  static LandingData of(BuildContext context) {
    final scope = context.dependOnInheritedComponentOfExactType<LandingScope>();
    return scope?.data ?? LandingData.fallback();
  }

  @override
  bool updateShouldNotify(LandingScope oldComponent) => oldComponent.data != data;
}
