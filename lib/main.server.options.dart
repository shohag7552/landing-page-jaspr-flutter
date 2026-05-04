// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/server.dart';
import 'package:food_delivery_landing/components/cta_banner.dart'
    as _cta_banner;
import 'package:food_delivery_landing/components/features_section.dart'
    as _features_section;
import 'package:food_delivery_landing/components/footer.dart' as _footer;
import 'package:food_delivery_landing/components/hero_section.dart'
    as _hero_section;
import 'package:food_delivery_landing/components/how_it_works.dart'
    as _how_it_works;
import 'package:food_delivery_landing/components/navbar.dart' as _navbar;
import 'package:food_delivery_landing/components/our_platform.dart'
    as _our_platform;
import 'package:food_delivery_landing/components/popular_dishes.dart'
    as _popular_dishes;
import 'package:food_delivery_landing/components/why_choose_us.dart'
    as _why_choose_us;
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
    ..._cta_banner.CtaBanner.styles,
    ..._features_section.FeaturesSection.styles,
    ..._footer.FooterSection.styles,
    ..._hero_section.HeroSection.styles,
    ..._how_it_works.HowItWorks.styles,
    ..._navbar.NavbarState.styles,
    ..._our_platform.OurPlatform.styles,
    ..._popular_dishes.PopularDishes.styles,
    ..._why_choose_us.WhyChooseUs.styles,
  ],
);
