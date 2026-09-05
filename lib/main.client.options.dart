// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/client.dart';

import 'package:food_delivery_landing/components/landing_root.dart'
    deferred as _landing_root;

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
    'landing_root': ClientLoader(
      (p) => _landing_root.LandingRoot(
        initialJson: p['initialJson'] as String,
        page: p['page'] as String,
      ),
      loader: _landing_root.loadLibrary,
    ),
  },
);
