/// Line icons, drawn in Dart.
///
/// These replace the emoji the page used to use as icons. Emoji render as a
/// different glyph on every operating system, cannot inherit colour, and
/// cannot take a stroke weight.
///
/// Every icon strokes with `currentcolor`, so an icon takes the colour of
/// whatever contains it — which is also why dark mode needs no icon rules.
///
/// Paths adapted from Lucide (ISC licence).
library;

import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

Component _icon(double size, List<Component> children) {
  return svg(
    viewBox: '0 0 24 24',
    width: size.px,
    height: size.px,
    attributes: const {
      'fill': 'none',
      'stroke': 'currentColor',
      'stroke-width': '1.75',
      'stroke-linecap': 'round',
      'stroke-linejoin': 'round',
      'aria-hidden': 'true',
      'focusable': 'false',
    },
    children,
  );
}

Component _p(String data) => path(d: data, const []);

Component _c(String cx, String cy, String r) => circle(attributes: {'cx': cx, 'cy': cy, 'r': r}, const []);

Component _r(String x, String y, String w, String h, String rx) =>
    rect(attributes: {'x': x, 'y': y, 'width': w, 'height': h, 'rx': rx}, const []);

// ── Commerce ────────────────────────────────────────────────────────────────

Component iconBag({double size = 24}) => _icon(size, [
  _p('M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z'),
  _p('M3 6h18'),
  _p('M16 10a4 4 0 0 1-8 0'),
]);

Component iconCart({double size = 24}) => _icon(size, [
  _c('8', '21', '1'),
  _c('19', '21', '1'),
  _p('M2.05 2.05h2l2.66 12.42a2 2 0 0 0 2 1.58h9.78a2 2 0 0 0 1.95-1.57l1.65-7.43H5.12'),
]);

Component iconUtensils({double size = 24}) => _icon(size, [
  _p('M3 2v7c0 1.1.9 2 2 2h1a2 2 0 0 0 2-2V2'),
  _p('M6 2v20'),
  _p('M18 2v20'),
  _p('M18 12c2.2 0 3-1.5 3-4.5S20 2 18 2'),
]);

Component iconLeaf({double size = 24}) => _icon(size, [
  _p('M11 20A7 7 0 0 1 9.8 6.1C15.5 5 17 4.48 19 2c1 2 2 4.18 2 8 0 5.5-4.78 10-10 10Z'),
  _p('M2 21c0-3 1.85-5.36 5.08-6C9.5 14.52 12 13 13 12'),
]);

Component iconStar({double size = 24}) => _icon(size, [
  _p('m12 2 3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2Z'),
]);

Component iconTag({double size = 24}) => _icon(size, [
  _p(
    'M12.586 2.586A2 2 0 0 0 11.172 2H4a2 2 0 0 0-2 2v7.172a2 2 0 0 0 .586 1.414l8.704 8.704a2.426 2.426 0 0 0 3.42 0l6.58-6.58a2.426 2.426 0 0 0 0-3.42Z',
  ),
  _p('M7.5 7.5h.01'),
]);

// ── Delivery ────────────────────────────────────────────────────────────────

Component iconTruck({double size = 24}) => _icon(size, [
  _p('M14 18V6a2 2 0 0 0-2-2H4a2 2 0 0 0-2 2v11a1 1 0 0 0 1 1h2'),
  _p('M15 18H9'),
  _p('M19 18h2a1 1 0 0 0 1-1v-3.65a1 1 0 0 0-.22-.62l-3.48-4.35A1 1 0 0 0 17.52 8H14'),
  _c('17', '18', '2'),
  _c('7', '18', '2'),
]);

Component iconMapPin({double size = 24}) => _icon(size, [
  _p('M20 10c0 4.993-5.539 10.193-7.399 11.799a1 1 0 0 1-1.202 0C9.539 20.193 4 14.993 4 10a8 8 0 0 1 16 0'),
  _c('12', '10', '3'),
]);

Component iconRoute({double size = 24}) => _icon(size, [
  _c('6', '19', '3'),
  _p('M9 19h8.5a3.5 3.5 0 0 0 0-7h-11a3.5 3.5 0 0 1 0-7H15'),
  _c('18', '5', '3'),
]);

Component iconClock({double size = 24}) => _icon(size, [
  _c('12', '12', '10'),
  _p('M12 6v6l4 2'),
]);

Component iconHome({double size = 24}) => _icon(size, [
  _p('M15 21v-8a1 1 0 0 0-1-1h-4a1 1 0 0 0-1 1v8'),
  _p('M3 10a2 2 0 0 1 .709-1.528l7-6a2 2 0 0 1 2.582 0l7 6A2 2 0 0 1 21 10v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z'),
]);

// ── Trust & support ─────────────────────────────────────────────────────────

Component iconShield({double size = 24}) => _icon(size, [
  _p(
    'M20 13c0 5-3.5 7.5-7.66 8.95a1 1 0 0 1-.67-.01C7.5 20.5 4 18 4 13V6a1 1 0 0 1 1-1c2 0 4.5-1.2 6.24-2.72a1.17 1.17 0 0 1 1.52 0C14.51 3.81 17 5 19 5a1 1 0 0 1 1 1z',
  ),
  _p('m9 12 2 2 4-4'),
]);

Component iconCreditCard({double size = 24}) => _icon(size, [
  _r('2', '5', '20', '14', '2'),
  _p('M2 10h20'),
]);

Component iconBell({double size = 24}) => _icon(size, [
  _p('M10.268 21a2 2 0 0 0 3.464 0'),
  _p('M3.262 15.326A1 1 0 0 0 4 17h16a1 1 0 0 0 .74-1.673C19.41 13.956 18 12.499 18 8A6 6 0 0 0 6 8c0 4.499-1.411 5.956-2.738 7.326'),
]);

Component iconPhone({double size = 24}) => _icon(size, [
  _p(
    'M13.832 16.568a1 1 0 0 0 1.213-.303l.355-.465A2 2 0 0 1 17 15h3a2 2 0 0 1 2 2v3a2 2 0 0 1-2 2A18 18 0 0 1 2 4a2 2 0 0 1 2-2h3a2 2 0 0 1 2 2v3a2 2 0 0 1-.8 1.6l-.468.351a1 1 0 0 0-.292 1.233 14 14 0 0 0 6.392 6.384',
  ),
]);

Component iconChat({double size = 24}) => _icon(size, [
  _p('M12 20a8 8 0 1 0-6.895-3.949L4 21l4.949-1.105A7.96 7.96 0 0 0 12 20Z'),
]);

Component iconHeadset({double size = 24}) => _icon(size, [
  _p('M3 14v-3a9 9 0 0 1 18 0v3'),
  _p('M21 16a2 2 0 0 1-2 2h-1a1 1 0 0 1-1-1v-4a1 1 0 0 1 1-1h3'),
  _p('M3 16a2 2 0 0 0 2 2h1a1 1 0 0 0 1-1v-4a1 1 0 0 0-1-1H3'),
]);

Component iconSearch({double size = 24}) => _icon(size, [
  _c('11', '11', '8'),
  _p('m21 21-4.3-4.3'),
]);

Component iconCheck({double size = 24}) => _icon(size, [
  _p('M20 6 9 17l-5-5'),
]);

Component iconArrowRight({double size = 24}) => _icon(size, [
  _p('M5 12h14'),
  _p('m12 5 7 7-7 7'),
]);

Component iconSparkle({double size = 24}) => _icon(size, [
  _p(
    'M9.937 15.5A2 2 0 0 0 8.5 14.063l-6.135-1.582a.5.5 0 0 1 0-.962L8.5 9.936A2 2 0 0 0 9.937 8.5l1.582-6.135a.5.5 0 0 1 .963 0L14.063 8.5A2 2 0 0 0 15.5 9.937l6.135 1.581a.5.5 0 0 1 0 .964L15.5 14.063a2 2 0 0 0-1.437 1.437l-1.582 6.135a.5.5 0 0 1-.963 0z',
  ),
]);

// ── Chrome ──────────────────────────────────────────────────────────────────

Component iconSun({double size = 24}) => _icon(size, [
  _c('12', '12', '4'),
  _p('M12 2v2'),
  _p('M12 20v2'),
  _p('m4.93 4.93 1.41 1.41'),
  _p('m17.66 17.66 1.41 1.41'),
  _p('M2 12h2'),
  _p('M20 12h2'),
  _p('m6.34 17.66-1.41 1.41'),
  _p('m19.07 4.93-1.41 1.41'),
]);

Component iconMoon({double size = 24}) => _icon(size, [
  _p('M12 3a6 6 0 0 0 9 9 9 9 0 1 1-9-9Z'),
]);

Component iconMonitor({double size = 24}) => _icon(size, [
  _r('2', '3', '20', '14', '2'),
  _p('M8 21h8'),
  _p('M12 17v4'),
]);

Component iconSmartphone({double size = 24}) => _icon(size, [
  _r('5', '2', '14', '20', '2'),
  _p('M12 18h.01'),
]);

// ── Brand glyphs (filled, not stroked) ──────────────────────────────────────

Component _glyph(double size, String data) {
  return svg(
    viewBox: '0 0 24 24',
    width: size.px,
    height: size.px,
    attributes: const {'fill': 'currentColor', 'aria-hidden': 'true', 'focusable': 'false'},
    [path(d: data, const [])],
  );
}

Component iconApple({double size = 20}) => _glyph(
  size,
  'M17.05 12.54c-.02-2.3 1.88-3.4 1.96-3.46-1.07-1.56-2.73-1.78-3.32-1.8-1.41-.14-2.76.83-3.48.83-.72 0-1.83-.81-3.01-.79-1.55.02-2.98.9-3.78 2.29-1.61 2.8-.41 6.94 1.15 9.21.76 1.11 1.67 2.36 2.86 2.31 1.15-.05 1.58-.74 2.97-.74 1.39 0 1.78.74 3 .72 1.24-.02 2.02-1.13 2.78-2.25.88-1.29 1.24-2.54 1.26-2.6-.03-.01-2.41-.93-2.43-3.68Zm-2.29-6.77c.63-.77 1.06-1.83.94-2.9-.91.04-2.01.61-2.67 1.37-.59.68-1.1 1.76-.96 2.8 1.02.08 2.06-.52 2.69-1.27Z',
);

Component iconPlay({double size = 20}) => _glyph(
  size,
  'M3.27 2.3a1.7 1.7 0 0 0-.4 1.17v17.06c0 .48.14.88.4 1.16l.06.06 9.55-9.55v-.22L3.33 2.43l-.06-.13Zm12.9 6.42-3.29-1.9-2.42 2.42 2.42 2.42 3.3-1.9c.94-.54.94-1.42 0-1.96l-.01.92ZM3.9 22.2c.31.33.83.37 1.41.04l11.5-6.63-2.86-2.86L3.9 22.2ZM5.31 1.76c-.58-.33-1.1-.29-1.41.04l10.05 10.05 2.86-2.86L5.31 1.76Z',
);
