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

// This file is generated automatically by Jaspr, do not remove or edit.
import 'main.server.options.dart';

void main() {
  Jaspr.initializeApp(
    options: defaultServerOptions,
  );

  runApp(Document(
    title: 'Foodie - Real-Time Food Delivery Platform',
    meta: {
      "description": "A high-performance food delivery platform with real-time order tracking, seamless checkout, and scalable restaurant operations.",
      "viewport": "width=device-width, initial-scale=1.0",
    },
    head: [
      // Add multiple Google Fonts
      link(
          href: "https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Outfit:wght@500;600;700;800&display=swap",
          rel: "stylesheet"),
    ],
    styles: [
      // Base resets & typography
      css('html').styles(
        raw: {'scroll-behavior': 'smooth'},
      ),
      css('body').styles(
        padding: Spacing.zero,
        margin: Spacing.zero,
        color: Color('#182230'),
        fontFamily: const FontFamily.list([FontFamily('Inter'), FontFamilies.sansSerif]),
        backgroundColor: Color('#FFFDF8'),
        raw: {'overflow-x': 'hidden'},
      ),
      css('h1, h2, h3, h4, h5, h6').styles(
        margin: Spacing.zero,
        fontFamily: const FontFamily.list([FontFamily('Outfit'), FontFamilies.sansSerif]),
        fontWeight: FontWeight.bold,
      ),
      css('a').styles(
        color: Color.inherit,
        textDecoration: TextDecoration(line: TextDecorationLine.none),
      ),
      css('button').styles(
        border: Border.unset,
        cursor: Cursor.pointer,
        fontFamily: const FontFamily.list([FontFamily('Inter'), FontFamilies.sansSerif]),
        backgroundColor: Colors.transparent,
      ),
      css('html.dark-mode body').styles(
        color: Color('#E5E7EB'),
        backgroundColor: Color('#080C14'),
      ),
      css('html.dark-mode .app-wrapper').styles(
        backgroundColor: Color('#080C14'),
      ),
      css('html.dark-mode .hero').styles(
        backgroundColor: Color('#080C14'),
        raw: {
          'background-image':
              'radial-gradient(circle at 15% 15%, rgba(233, 75, 27, 0.18), transparent 30%), linear-gradient(180deg, #080C14 0%, #111827 100%)',
        },
      ),
      css('html.dark-mode .features-section').styles(
        backgroundColor: Color('#0B111D'),
      ),
      css('html.dark-mode .popular-dishes').styles(
        backgroundColor: Color('#111827'),
      ),
      css('html.dark-mode .navbar.scrolled').styles(
        backgroundColor: const Color.rgba(11, 17, 29, 0.94),
        shadow: BoxShadow(offsetX: 0.px, offsetY: 16.px, blur: 40.px, color: Color.rgba(0, 0, 0, 0.28)),
        raw: {'backdrop-filter': 'blur(18px)', 'border-bottom': '1px solid rgba(255, 255, 255, 0.08)'},
      ),
      css('html.dark-mode .logo-text, html.dark-mode .hero-title, html.dark-mode .title, html.dark-mode .feature-title, html.dark-mode .dish-title, html.dark-mode .stat-value, html.dark-mode .panel-label, html.dark-mode .metric-value').styles(
        color: Color('#F8FAFC'),
      ),
      css('html.dark-mode .hero-subtitle, html.dark-mode .section-copy, html.dark-mode .marketplace-copy, html.dark-mode .feature-desc, html.dark-mode .stat-label, html.dark-mode .review-count, html.dark-mode .metric-label, html.dark-mode .operator-copy').styles(
        color: Color('#AAB4C5'),
      ),
      css('html.dark-mode .nav-link, html.dark-mode .btn-ghost').styles(
        color: Color('#CBD5E1'),
      ),
      css('html.dark-mode .nav-link:hover, html.dark-mode .nav-link.active, html.dark-mode .btn-ghost:hover').styles(
        color: Color('#FDBA74'),
      ),
      css('html.dark-mode .hero-badge, html.dark-mode .feature-card, html.dark-mode .dish-card, html.dark-mode .stat-item, html.dark-mode .tracking-panel').styles(
        backgroundColor: const Color.rgba(17, 24, 39, 0.86),
        raw: {'border': '1px solid rgba(255, 255, 255, 0.10)'},
      ),
      css('html.dark-mode .badge-text').styles(
        color: Color('#E5E7EB'),
      ),
      css('html.dark-mode .btn-outline').styles(
        backgroundColor: const Color.rgba(17, 24, 39, 0.78),
        color: Color('#F8FAFC'),
        raw: {'border': '1px solid rgba(255, 255, 255, 0.14)'},
      ),
      css('html.dark-mode .btn-outline:hover').styles(
        color: Color('#FDBA74'),
        raw: {'border-color': '#FDBA74'},
      ),
      css('html.dark-mode .btn-primary').styles(
        backgroundColor: Color('#E94B1B'),
        shadow: BoxShadow(offsetX: 0.px, offsetY: 14.px, blur: 26.px, color: Color.rgba(233, 75, 27, 0.28)),
      ),
      css('html.dark-mode .feature-icon-wrapper, html.dark-mode .dish-category').styles(
        backgroundColor: const Color.rgba(233, 75, 27, 0.14),
      ),
      css('html.dark-mode .dish-price, html.dark-mode .rating-value, html.dark-mode .price-amount').styles(
        color: Color('#F8FAFC'),
      ),
      css('html.dark-mode .favorite-btn').styles(
        backgroundColor: const Color.rgba(17, 24, 39, 0.88),
        color: Color('#F8FAFC'),
      ),
      css('html.dark-mode .add-cart-btn').styles(
        backgroundColor: Color('#E94B1B'),
      ),
      css('html.dark-mode .panel-status').styles(
        backgroundColor: const Color.rgba(22, 163, 74, 0.14),
        color: Color('#86EFAC'),
      ),
      css('html.dark-mode .route-point, html.dark-mode .route-bar').styles(
        backgroundColor: Color('#374151'),
      ),
      css('html.dark-mode .route-point.active, html.dark-mode .route-bar.complete').styles(
        backgroundColor: Color('#FDBA74'),
      ),
      css('html.dark-mode .theme-toggle-track').styles(
        backgroundColor: Color('#111827'),
        raw: {'border-color': 'rgba(255, 255, 255, 0.16)'},
      ),
      css('html.dark-mode .hamburger').styles(
        backgroundColor: Color('#F8FAFC'),
      ),
    ],
    body: const App(),
  ));
}
