/// The entrypoint for the **server** environment.
///
/// The [main] method will only be executed on the server during pre-rendering.
/// To run code on the client, check the `main.client.dart` file.
library;

import 'package:jaspr/dom.dart';
// Server-specific Jaspr import.
import 'package:jaspr/server.dart';

// Imports the [App] component.
import 'app.dart';
import 'components/navbar.dart' show kThemeStorageKey;
import 'content/site_content.dart';
import 'content/site_links.dart';
import 'theme.dart';

// This file is generated automatically by Jaspr, do not remove or edit.
import 'main.server.options.dart';

const _title = '$kBrandName — Order Food & Groceries Online | Fast Local Delivery';
const _description =
    'Order food and groceries online from $kBrandName in $kCity. Fresh meals and '
    'everyday essentials delivered to your door, with live rider tracking and '
    'secure payment. Order on the web or get the app.';

/// TODO(owner): replace with your own 1200×630 share image. This is what
/// people see when your link is pasted into WhatsApp or Facebook, so it is
/// worth making properly — a photo of your food and a bag of groceries, with
/// your logo, works well.
const _ogImage = '$kSiteUrl/images/og-cover.jpg';

/// Applies the saved theme before the first paint.
///
/// Without this the class is only added after hydration, so anyone using dark
/// mode gets a white flash on every page load.
const _noFlashThemeScript =
    '(function(){try{var t=localStorage.getItem("$kThemeStorageKey");'
    'if(t==="dark")document.documentElement.classList.add("dark-mode");}catch(e){}})();';

/// `prefers-reduced-motion` has no constructor in Jaspr's typed MediaQuery,
/// so this one media query is written by hand.
const _reducedMotionCss =
    '@media (prefers-reduced-motion: reduce){*,*::before,*::after{'
    'animation-duration:0.01ms !important;animation-iteration-count:1 !important;'
    'transition-duration:0.01ms !important;scroll-behavior:auto !important}}';

/// Tells Google this is a real local business with a real service area.
const _localBusinessJsonLd =
    '{"@context":"https://schema.org","@type":"GroceryStore",'
    '"name":"$kBrandName",'
    '"description":"Food and grocery delivery in $kCity.",'
    '"url":"$kSiteUrl",'
    '"telephone":"$kSupportPhone",'
    '"email":"$kSupportEmail",'
    '"image":"$_ogImage",'
    '"priceRange":"\$\$",'
    '"address":{"@type":"PostalAddress","streetAddress":"$kStoreAddress","addressLocality":"$kCity"},'
    '"areaServed":{"@type":"GeoCircle",'
    '"geoMidpoint":{"@type":"GeoCoordinates","address":"$kStoreAddress"},'
    '"geoRadius":"5000"},'
    '"aggregateRating":{"@type":"AggregateRating","ratingValue":"$kRating","reviewCount":"1200"}}';

/// Open Graph needs `property=`, which `Document(meta:)` cannot emit.
Iterable<Component> _ogMeta(Map<String, String> tags) {
  return tags.entries.map(
    (e) => Component.element(
      tag: 'meta',
      attributes: {'property': e.key, 'content': e.value},
      children: const [],
    ),
  );
}

void main() {
  Jaspr.initializeApp(
    options: defaultServerOptions,
  );

  runApp(
    Document(
      title: _title,
      lang: 'en',
      meta: {
        'description': _description,
        'viewport': 'width=device-width, initial-scale=1.0',
        'theme-color': kBrandHex,
        // NOTE: Open Graph tags are NOT here. Document(meta:) renders
        // `name="..."`, but the Open Graph protocol requires `property="..."`,
        // and Facebook/WhatsApp read only `property`. They are emitted as raw
        // <meta property> elements in `head:` below instead.
        'twitter:card': 'summary_large_image',
        'twitter:title': _title,
        'twitter:description': _description,
        'twitter:image': _ogImage,
      },
      head: [
        // Link previews. This page's whole distribution model is someone
        // pasting the URL into a chat, so these are not optional polish — a
        // share with no card is a dead post.
        ..._ogMeta({
          'og:type': 'website',
          'og:site_name': kBrandName,
          'og:title': _title,
          'og:description': _description,
          'og:url': kSiteUrl,
          'og:image': _ogImage,
          'og:image:width': '1200',
          'og:image:height': '630',
          'og:image:alt': '$kBrandName — food and grocery delivery in $kCity',
          'og:locale': 'en_US',
        }),
        link(href: kSiteUrl, rel: 'canonical'),
        link(href: 'https://fonts.googleapis.com', rel: 'preconnect'),
        link(href: 'https://fonts.gstatic.com', rel: 'preconnect', attributes: const {'crossorigin': ''}),
        link(
          href:
              'https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700'
              '&family=Outfit:wght@500;600;700;800&display=swap',
          rel: 'stylesheet',
        ),
        // Must run before first paint — do not add `defer` or `async`.
        script(content: _noFlashThemeScript),
        Component.element(tag: 'style', children: const [RawText(_reducedMotionCss)]),
        script(
          attributes: const {'type': 'application/ld+json'},
          content: _localBusinessJsonLd,
        ),
      ],
      styles: [
        // ── Base resets & typography ────────────────────────────────────
        css('html').styles(raw: {'scroll-behavior': 'smooth'}),
        css('*, *::before, *::after').styles(raw: {'box-sizing': 'border-box'}),
        css('body').styles(
          margin: Spacing.zero,
          padding: Spacing.zero,
          backgroundColor: Color.variable('--surface-0'),
          color: Color.variable('--ink-800'),
          fontFamily: const FontFamily.list([FontFamily('Inter'), FontFamilies.sansSerif]),
          raw: {'overflow-x': 'hidden', '-webkit-font-smoothing': 'antialiased'},
        ),
        css('h1, h2, h3, h4, h5, h6').styles(
          margin: Spacing.zero,
          fontFamily: const FontFamily.list([FontFamily('Outfit'), FontFamilies.sansSerif]),
          fontWeight: FontWeight.bold,
        ),
        css('p').styles(margin: Spacing.zero),
        css('a').styles(
          color: Color.inherit,
          textDecoration: const TextDecoration(line: TextDecorationLine.none),
        ),
        css('button').styles(
          border: Border.unset,
          backgroundColor: Colors.transparent,
          cursor: Cursor.pointer,
          fontFamily: const FontFamily.list([FontFamily('Inter'), FontFamilies.sansSerif]),
        ),
        css('img').styles(raw: {'max-width': '100%', 'display': 'block'}),
        css('svg').styles(raw: {'display': 'block', 'flex-shrink': '0'}),

        // ── Dark mode ───────────────────────────────────────────────────
        // This used to be ~40 rules re-stating the entire palette. Almost all
        // of them are gone: components read `var(--ink-900)` and friends, and
        // `lib/theme.dart` redefines those under `html.dark-mode`. What is
        // left is genuinely structural — things whose *shape*, not colour,
        // changes with the theme.
        css('html.dark-mode .hero').styles(
          raw: {
            'background-image':
                'radial-gradient(circle at 15% 12%, var(--brand-a18), transparent 30%), '
                    'linear-gradient(180deg, var(--surface-0) 0%, var(--surface-card) 100%)',
          },
        ),
        css('html.dark-mode .navbar.scrolled, html.dark-mode .navbar.menu-open').styles(
          raw: {'border-bottom': '1px solid var(--border-subtle)'},
        ),
        css('html.dark-mode .store-badge').styles(
          backgroundColor: Color.variable('--surface-2'),
          color: Color.variable('--ink-900'),
        ),
        css('html.dark-mode .hero-store-glyphs').styles(color: Color.variable('--ink-700')),
      ],
      body: const App(),
    ),
  );
}
