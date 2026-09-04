/// The brand mark.
///
/// Drawn inline rather than loaded from a file: it inherits the surrounding
/// text colour (so dark mode needs no extra rule), costs no HTTP request, and
/// never goes stale in a cache.
///
/// The mark carries both modules in one shape — a shopping bag whose handle
/// arcs into a leaf. Retail and fresh food, one icon.
library;

import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../theme.dart';

/// The mark on its own, no wordmark.
class BrandMark extends StatelessComponent {
  const BrandMark({this.size = 38, super.key});

  final double size;

  @override
  Component build(BuildContext context) {
    return span(classes: 'brand-mark', [
      svg(
        viewBox: '0 0 40 40',
        width: size.px,
        height: size.px,
        attributes: const {'aria-hidden': 'true', 'focusable': 'false'},
        [
          // Tile
          rect(
            attributes: const {'x': '0', 'y': '0', 'width': '40', 'height': '40', 'rx': '11', 'fill': 'url(#kmGrad)'},
            const [],
          ),
          // Bag body
          path(
            d: 'M12 15h16l-1.35 12.1A2.6 2.6 0 0 1 24.06 29.5H15.94a2.6 2.6 0 0 1-2.59-2.4Z',
            attributes: const {'fill': 'rgba(255,255,255,0.96)'},
            const [],
          ),
          // Handle arcing into a leaf
          path(
            d: 'M16 15.5v-1.6a4 4 0 0 1 8 0v1.6',
            attributes: const {
              'fill': 'none',
              'stroke': 'rgba(255,255,255,0.96)',
              'stroke-width': '2.1',
              'stroke-linecap': 'round',
            },
            const [],
          ),
          path(
            d: 'M24 13.9c1.9-.1 3.3-1 4-2.6-1.9-.7-3.4-.3-4.4 1',
            attributes: const {'fill': 'rgba(255,255,255,0.96)'},
            const [],
          ),
          // Leaf vein
          path(
            d: 'M19.4 19.6h1.2M17.6 22.4h4.8',
            attributes: const {
              'stroke': 'var(--brand-600)',
              'stroke-width': '1.6',
              'stroke-linecap': 'round',
              'opacity': '0.55',
            },
            const [],
          ),
          Component.element(
            tag: 'defs',
            children: [
              Component.element(
                tag: 'linearGradient',
                attributes: const {'id': 'kmGrad', 'x1': '0', 'y1': '0', 'x2': '1', 'y2': '1'},
                children: [
                  Component.element(
                    tag: 'stop',
                    attributes: const {'offset': '0%', 'stop-color': 'var(--brand-500)'},
                    children: const [],
                  ),
                  Component.element(
                    tag: 'stop',
                    attributes: const {'offset': '100%', 'stop-color': 'var(--brand-600)'},
                    children: const [],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.brand-mark').styles(
      display: Display.inlineFlex,
      alignItems: AlignItems.center,
      raw: {'filter': 'drop-shadow(0 6px 14px var(--brand-a28))'},
    ),
  ];
}

/// Mark plus wordmark. Used in the navbar and the footer.
class BrandLogo extends StatelessComponent {
  const BrandLogo({
    required this.brandFirst,
    required this.brandSecond,
    this.size = 38,
    super.key,
  });

  /// Passed in rather than read from [LandingScope]: this renders inside the
  /// navbar, which is a `@client` island. On hydration that subtree rebuilds
  /// on its own, with no scope above it to read.
  final String brandFirst;
  final String brandSecond;
  final double size;

  @override
  Component build(BuildContext context) {
    final name = brandSecond.isEmpty ? brandFirst : '$brandFirst $brandSecond';

    return a(
      href: '#home',
      classes: 'brand-logo',
      attributes: {'aria-label': '$name — home'},
      [
        BrandMark(size: size),
        span(classes: 'brand-word', [
          Component.text(brandSecond.isEmpty ? brandFirst : '$brandFirst '),
          if (brandSecond.isNotEmpty)
            span(classes: 'brand-word-accent', [Component.text(brandSecond)]),
        ]),
      ],
    );
  }

  @css
  static List<StyleRule> get styles => [
    css('.brand-logo').styles(
      display: Display.flex,
      cursor: Cursor.pointer,
      alignItems: AlignItems.center,
      gap: Gap.all(11.px),
    ),
    css('.brand-word').styles(
      color: Color.variable('--ink-900'),
      fontFamily: const FontFamily.list([FontFamily('Outfit'), FontFamilies.sansSerif]),
      fontSize: 1.5.rem,
      fontWeight: FontWeight.bold,
      letterSpacing: (-0.2).px,
    ),
    css('.brand-word-accent').styles(
      color: Color.variable('--brand-500'),
    ),
    css.media(MediaQuery.screen(maxWidth: bpSm.px), [
      css('.brand-word').styles(fontSize: 1.28.rem),
    ]),
  ];
}
