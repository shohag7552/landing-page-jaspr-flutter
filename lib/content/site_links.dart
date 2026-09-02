/// Every outbound destination on the site, in one place.
///
/// Store owner: replace these with your own before going live. Anything left
/// as '#' renders as a disabled link rather than a dead one.
library;

// ── Ordering ────────────────────────────────────────────────────────────────

/// The customer web app. This is the "order in the browser" path.
const kWebAppUrl = 'https://food-app-c2fe8.web.app/';

/// Deep links into the web app. Adjust to match your routes.
const kBrowseFoodUrl = '$kWebAppUrl#food';
const kBrowseShopUrl = '$kWebAppUrl#shop';
const kTrackOrderUrl = '$kWebAppUrl#orders';

/// TODO(owner): your App Store listing.
const kAppStoreUrl = '#';

/// TODO(owner): your Google Play listing.
const kPlayStoreUrl = '#';

// ── Business-side ───────────────────────────────────────────────────────────

/// Where you manage your store. Linked quietly from the footer only.
const kStorePanelUrl = 'https://store-app-c2fe8.web.app/';

/// TODO(owner): rider recruitment form or WhatsApp link.
const kRiderApplyUrl = '#';

// ── Contact ─────────────────────────────────────────────────────────────────

const kSupportPhone = '+1 (555) 010-0199';
const kSupportPhoneHref = 'tel:+15550100199';
const kSupportEmail = 'hello@kikomart.example';
const kSupportEmailHref = 'mailto:hello@kikomart.example';
const kWhatsAppUrl = '#';

// ── Social ──────────────────────────────────────────────────────────────────

const kFacebookUrl = '#';
const kInstagramUrl = '#';
const kTwitterUrl = '#';

// ── Legal ───────────────────────────────────────────────────────────────────

const kTermsUrl = '#';
const kPrivacyUrl = '#';

/// True when a link has been filled in by the owner.
bool isLive(String url) => url != '#';
