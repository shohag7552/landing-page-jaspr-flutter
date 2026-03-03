// import 'package:jaspr/dom.dart';
// import 'package:jaspr/jaspr.dart';
//
// import '../components/counter.dart';
//
// class Home extends StatelessComponent {
//   const Home({super.key});
//
//   @override
//   Component build(BuildContext context) {
//     return section([
//       img(src: 'images/logo.svg', width: 80),
//       h1([.Component.text('Welcome')]),
//       p([.Component.text('You successfully create a new Jaspr site.')]),
//       div(styles: Styles(height: 100.px), []),
//       const Counter(),
//     ]);
//   }
// }

import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

class Home extends StatelessComponent {
  const Home({super.key});

  @override
  Component build(BuildContext context) { // 👈 Changed to Component (Removed Iterable and sync*)
    return div(classes: 'landing-container', [ // 👈 Changed 'yield' to 'return'

      // 1. Navbar
      header(classes: 'navbar', [
        div(classes: 'logo', [Component.text('FoodFast Script')]),
        nav([
          a(href: '#features', [Component.text('Features')]),
          a(href: '#demo', [Component.text('App Demo')]),
          a(href: '#pricing', [Component.text('Pricing')]),
        ]),
      ]),

      // 2. Hero Section
      section(classes: 'hero', [
        h1([Component.text('Launch Your Food Delivery App in Days, Not Months.')]),
        p([Component.text('A complete, scalable food delivery system built with Flutter and Appwrite. Includes User App, Store Manager, and backend Go functions.')]),
        div(classes: 'cta-buttons', [
          a(href: 'YOUR_LEMON_SQUEEZY_OR_CODECANYON_LINK', classes: 'btn-primary', [
            Component.text('Get the Script')
          ]),
          a(href: '#demo', classes: 'btn-secondary', [
            Component.text('View Demo')
          ]),
        ]),
      ]),

      // 3. Features Section
      section(id: 'features', classes: 'features-grid', [
        h2([Component.text('Everything You Need to Scale')]),
        div(classes: 'grid-container', [
          _featureCard('🚀', 'Real-time Tracking', 'Live order status updates using Appwrite real-time.'),
          _featureCard('🔔', 'Smart Notifications', 'Topic-based FCM routing via Go serverless functions.'),
          _featureCard('📱', 'Cross-Platform', 'Clean Flutter codebase ready for iOS and Android.'),
        ]),
      ]),

      // 4. Footer
      footer(classes: 'footer', [
        p([Component.text('© 2026 Mehdi Hassan Suhag. All rights reserved.')]),
      ])
    ]);
  }

  // Helper method for reusable UI components
  Component _featureCard(String icon, String title, String description) {
    return div(classes: 'feature-card', [
      span(classes: 'icon', [Component.text(icon)]),
      h3([Component.text(title)]),
      p([Component.text(description)]),
    ]);
  }
}