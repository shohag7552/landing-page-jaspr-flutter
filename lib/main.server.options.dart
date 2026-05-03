// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/server.dart';
import 'package:food_delivery_landing/components/features_section.dart'
    as _features_section;
import 'package:food_delivery_landing/components/footer.dart' as _footer;
import 'package:food_delivery_landing/components/hero_section.dart'
    as _hero_section;
import 'package:food_delivery_landing/components/navbar.dart' as _navbar;
import 'package:food_delivery_landing/components/popular_dishes.dart'
    as _popular_dishes;
import 'package:food_delivery_landing/app.dart' as _app;

/// Default [ServerOptions] for use with your Jaspr project.
///
/// Use this to initialize Jaspr **before** calling [runApp].
///
/// Example:
/// ```dart
/// import 'main.server.options.dart';
///
/// void main() {
///   Jaspr.initializeApp(
///     options: defaultServerOptions,
///   );
///
///   runApp(...);
/// }
/// ```
ServerOptions get defaultServerOptions => ServerOptions(
  clientId: 'main.client.dart.js',
  clients: {_navbar.Navbar: ClientTarget<_navbar.Navbar>('navbar')},
  styles: () => [
    ..._app.AppState.styles,
    ..._features_section.FeaturesSection.styles,
    ..._footer.FooterSection.styles,
    ..._hero_section.HeroSection.styles,
    ..._navbar.NavbarState.styles,
    ..._popular_dishes.PopularDishes.styles,
  ],
);
