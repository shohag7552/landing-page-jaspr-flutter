// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/client.dart';

import 'package:food_delivery_landing/components/navbar.dart'
    deferred as _navbar;
import 'package:food_delivery_landing/app.dart' deferred as _app;

/// Default [ClientOptions] for use with your Jaspr project.
///
/// Use this to initialize Jaspr **before** calling [runApp].
///
/// Example:
/// ```dart
/// import 'main.client.options.dart';
///
/// void main() {
///   Jaspr.initializeApp(
///     options: defaultClientOptions,
///   );
///
///   runApp(...);
/// }
/// ```
ClientOptions get defaultClientOptions => ClientOptions(
  clients: {
    'app': ClientLoader((p) => _app.App(), loader: _app.loadLibrary),
    'navbar': ClientLoader(
      (p) => _navbar.Navbar(),
      loader: _navbar.loadLibrary,
    ),
  },
);
