// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/server.dart';
import 'package:food_delivery_landing/components/ui/brand_logo.dart'
    as _brand_logo;
import 'package:food_delivery_landing/components/delivery_promise.dart'
    as _delivery_promise;
import 'package:food_delivery_landing/components/delivery_zone.dart'
    as _delivery_zone;
import 'package:food_delivery_landing/components/footer.dart' as _footer;
import 'package:food_delivery_landing/components/get_the_app.dart'
    as _get_the_app;
import 'package:food_delivery_landing/components/hero_section.dart'
    as _hero_section;
import 'package:food_delivery_landing/components/how_it_works.dart'
    as _how_it_works;
import 'package:food_delivery_landing/components/module_split.dart'
    as _module_split;
import 'package:food_delivery_landing/components/navbar.dart' as _navbar;
import 'package:food_delivery_landing/components/showcase_section.dart'
    as _showcase_section;
import 'package:food_delivery_landing/components/why_choose_us.dart'
    as _why_choose_us;
import 'package:food_delivery_landing/app.dart' as _app;
import 'package:food_delivery_landing/theme.dart' as _theme;
import 'package:food_delivery_landing/ui_kit.dart' as _ui_kit;

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
  clients: {
    _navbar.Navbar: ClientTarget<_navbar.Navbar>(
      'navbar',
      params: __navbarNavbar,
    ),
  },
  styles: () => [
    ..._theme.brandTokens,
    ..._ui_kit.uiKit,
    ..._app.App.styles,
    ..._delivery_promise.DeliveryPromise.styles,
    ..._delivery_zone.DeliveryZone.styles,
    ..._footer.FooterSection.styles,
    ..._get_the_app.GetTheApp.styles,
    ..._hero_section.HeroSection.styles,
    ..._how_it_works.HowItWorks.styles,
    ..._module_split.ModuleSplit.styles,
    ..._navbar.NavbarState.styles,
    ..._showcase_section.ShowcaseSection.styles,
    ..._why_choose_us.WhyChooseUs.styles,
    ..._brand_logo.BrandLogo.styles,
    ..._brand_logo.BrandMark.styles,
  ],
);

Map<String, Object?> __navbarNavbar(_navbar.Navbar c) => {
  'brandFirst': c.brandFirst,
  'brandSecond': c.brandSecond,
  'orderUrl': c.orderUrl,
};
