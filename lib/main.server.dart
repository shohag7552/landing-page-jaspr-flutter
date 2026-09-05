/// The entrypoint for the **server** environment.
///
/// The [main] method will only be executed on the server during pre-rendering.
/// To run code on the client, check the `main.client.dart` file.
library;

import 'dart:convert';

import 'package:jaspr/dom.dart';
// Server-specific Jaspr import.
import 'package:jaspr/server.dart';
import 'package:jaspr_router/jaspr_router.dart';

// Imports the [App] component.
import 'components/landing_root.dart';
import 'components/navbar.dart' show kThemeStorageKey;
import 'data/landing_data.dart';
import 'data/landing_repository.dart';

// This file is generated automatically by Jaspr, do not remove or edit.
import 'main.server.options.dart';



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


/// One route per page the static build should generate.
///
/// The policy routes are only declared when the store has actually written
/// that document — publishing an empty "Privacy Policy" page would be worse
/// than not having one.
List<RouteBase> _routes(String payload, LandingData data) => [
  Route(path: '/', builder: (context, state) => LandingRoot(initialJson: payload)),
  if (data.termsHtml.isNotEmpty)
    Route(
      path: '/terms',
      builder: (context, state) => LandingRoot(initialJson: payload, page: 'terms'),
    ),
  if (data.privacyHtml.isNotEmpty)
    Route(
      path: '/privacy',
      builder: (context, state) => LandingRoot(initialJson: payload, page: 'privacy'),
    ),
  if (data.aboutHtml.isNotEmpty)
    Route(
      path: '/about',
      builder: (context, state) => LandingRoot(initialJson: payload, page: 'about'),
    ),
];

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

/// Tells Google this is a real local business with a real service area.
String _localBusinessJsonLd(LandingData d) =>
    '{"@context":"https://schema.org","@type":"Store",'
    '"name":"${_esc(d.brandName)}",'
    '"description":"Food and product delivery in ${_esc(d.city)}.",'
    '"url":"${_esc(d.siteUrl)}",'
    '"telephone":"${_esc(d.phone)}",'
    '"email":"${_esc(d.email)}",'
    '"image":"${_esc(d.ogImage)}",'
    '"priceRange":"\$\$",'
    '"address":{"@type":"PostalAddress","streetAddress":"${_esc(d.storeAddress)}",'
    '"addressLocality":"${_esc(d.city)}"},'
    '"areaServed":{"@type":"GeoCircle",'
    '"geoMidpoint":{"@type":"GeoCoordinates","address":"${_esc(d.storeAddress)}"},'
    '"geoRadius":"5000"},'
    '"aggregateRating":{"@type":"AggregateRating","ratingValue":"${_esc(d.rating)}",'
    '"reviewCount":"${_esc(d.ratingCount.replaceAll(RegExp(r'[^0-9]'), ''))}"}}';

/// Store-entered text lands inside a JSON string literal, so quotes and
/// newlines have to be escaped or the whole block becomes invalid JSON-LD.
String _esc(String value) => value
    .replaceAll(r'\', r'\\')
    .replaceAll('"', r'\"')
    .replaceAll('\n', ' ')
    .trim();

/// The brand colour is a value, not a stylesheet, so it is injected as a
/// custom property override rather than templated into every rule.
String _brandOverrideCss(String hex) => ':root{--brand-500:$hex}';

Future<void> main() async {
  Jaspr.initializeApp(
    options: defaultServerOptions,
  );

  // Runs once per build in `mode: static`, and once per request should this
  // ever be switched to `mode: server` — the call site is identical either way.
  final data = await LandingRepository().fetch();

  runApp(
    Document(
      title: data.metaTitle,
      lang: 'en',
      meta: {
        'description': data.metaDescription,
        'viewport': 'width=device-width, initial-scale=1.0',
        'theme-color': data.brandHex,
        // NOTE: Open Graph tags are NOT here. Document(meta:) renders
        // `name="..."`, but the Open Graph protocol requires `property="..."`,
        // and Facebook/WhatsApp read only `property`. They are emitted as raw
        // <meta property> elements in `head:` below instead.
        'twitter:card': 'summary_large_image',
        'twitter:title': data.metaTitle,
        'twitter:description': data.metaDescription,
        'twitter:image': data.ogImage,
      },
      head: [
        // Link previews. This page's whole distribution model is someone
        // pasting the URL into a chat, so these are not optional polish — a
        // share with no card is a dead post.
        ..._ogMeta({
          'og:type': 'website',
          'og:site_name': data.brandName,
          'og:title': data.metaTitle,
          'og:description': data.metaDescription,
          'og:url': data.siteUrl,
          'og:image': data.ogImage,
          'og:image:width': '1200',
          'og:image:height': '630',
          'og:image:alt': '${data.brandName} — food and product delivery in ${data.city}',
          'og:locale': 'en_US',
        }),
        link(href: data.siteUrl, rel: 'canonical'),
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
          content: _localBusinessJsonLd(data),
        ),
        // Overrides the token defined in lib/theme.dart. Every other shade on
        // the page derives from it via color-mix(), so this one line re-skins
        // the site from the store panel.
        Component.element(tag: 'style', children: [RawText(_brandOverrideCss(data.brandHex))]),
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
      // The router exists so the static build discovers /terms and /privacy
      // and writes a real HTML file for each. Links between pages are plain
      // anchors, so the router itself never reaches the browser.
      body: Router(routes: _routes(jsonEncode(data.toJson()), data)),
    ),
  );
}
