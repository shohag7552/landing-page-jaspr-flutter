/// Every word on the page that is specific to *your* business.
///
/// Store owner: this file plus `site_links.dart` and `lib/theme.dart` are the
/// three files you need to touch to make this site your own.
library;

// ── Identity ────────────────────────────────────────────────────────────────

/// Rendered as two words so the second half can carry the brand colour.
const kBrandFirst = 'Kiko';
const kBrandSecond = 'Mart';
const kBrandName = '$kBrandFirst $kBrandSecond';

const kCity = 'Riverside';
const kStoreAddress = '48 Market Street, Riverside';
const kOpeningHours = '9:00am – 11:00pm';
const kDeliveryRadiusKm = '5 km';

/// Public URL this site is served from — used for canonical and og:url.
const kSiteUrl = 'https://kikomart.example';

// ── Headline numbers ────────────────────────────────────────────────────────
// Keep these honest. A shopper who is told "32 min" and waits 70 does not
// order twice.

const kAvgDeliveryMinutes = '32';
const kDeliveryWindow = '30–45';
const kRating = '4.8';
const kRatingCount = '1,200';
const kOrdersDelivered = '12,000';
const kAreasCovered = '9';
const kFreeDeliveryOver = '\$25';
const kMinimumOrder = '\$10';

// ── Delivery zone ───────────────────────────────────────────────────────────

const kCoveredAreas = <String>[
  'Riverside Central',
  'Old Town',
  'Harbour Point',
  'Elm Park',
  'Northgate',
  'Willow Bank',
  'Station Quarter',
  'Greenfield',
  'Mill Road',
];

/// Day label → hours. Shown as-is in the delivery section.
const kHours = <(String, String)>[
  ('Monday – Thursday', '9:00am – 11:00pm'),
  ('Friday – Saturday', '9:00am – 12:00am'),
  ('Sunday', '10:00am – 10:00pm'),
];

/// Distance band → fee.
const kDeliveryFees = <(String, String)>[
  ('Under 2 km', '\$1.99'),
  ('2 – 3.5 km', '\$2.99'),
  ('3.5 – 5 km', '\$3.99'),
];
