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
    title: 'Foodie - Premium Food Delivery',
    meta: {
      "description": "The best food delivery service in town. Fresh, fast, and delicious.",
      "viewport": "width=device-width, initial-scale=1.0",
    },
    head: [
      // Add multiple Google Fonts
      link(
          href:
              "https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Outfit:wght@500;600;700;800&display=swap",
          rel: "stylesheet"),
    ],
    styles: [
      // Base resets & typography
      css('html').styles(
        raw: {'scroll-behavior': 'smooth'},
      ),
      css('body').styles(
        margin: Spacing.zero,
        padding: Spacing.zero,
        fontFamily: const FontFamily.list([FontFamily('Inter'), FontFamilies.sansSerif]),
        backgroundColor: Colors.white,
        color: Color('#1E293B'),
        raw: {'overflow-x': 'hidden'},
      ),
      css('h1, h2, h3, h4, h5, h6').styles(
        fontFamily: const FontFamily.list([FontFamily('Outfit'), FontFamilies.sansSerif]),
        margin: Spacing.zero,
        fontWeight: FontWeight.bold,
      ),
      css('a').styles(
        textDecoration: TextDecoration(line: TextDecorationLine.none),
        color: Color.inherit,
      ),
      css('button').styles(
        fontFamily: const FontFamily.list([FontFamily('Inter'), FontFamilies.sansSerif]),
        cursor: Cursor.pointer,
        border: Border.unset,
        backgroundColor: Colors.transparent,
      ),
    ],
    body: const App(),
  ));
}
