import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../content/site_content.dart';
import '../content/site_links.dart';
import '../theme.dart';
import 'ui/icons.dart';

/// The download section — copy on one side, the actual app on the other.
///
/// Real screenshots in real phone frames, one per module. Nothing sells an
/// app like showing it: an illustration or a stock photo here reads as a
/// placeholder, and a shopper deciding whether to install wants to see the
/// screen they are about to use.
///
/// Screenshots live in `web/images/`. Replace them whenever the app UI
/// changes — they are the one asset on this page that dates fastest.
class GetTheApp extends StatelessComponent {
  const GetTheApp({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'get-app', classes: 'section getapp', [
      div(classes: 'container getapp-grid', [
        div(classes: 'getapp-copy', [
          div(classes: 'section-header', [
            span(classes: 'section-eyebrow', [Component.text('Get started')]),
            h2(classes: 'section-title', [Component.text('Order however you like')]),
            p(classes: 'section-copy', [
              Component.text('Same account, same cart — on Android, iPhone, or the web.'),
            ]),
          ]),

          // Three ways in. The stores sit side by side and the web button
          // spans them, so no single path is presented as the fallback.
          div(classes: 'getapp-actions', [
            div(classes: 'getapp-stores', [
              _storeBadge(kPlayStoreUrl, iconPlay(size: 21), 'Get it on', 'Google Play'),
              _storeBadge(kAppStoreUrl, iconApple(size: 22), 'Download on the', 'App Store'),
            ]),
            a(
              href: kWebAppUrl,
              classes: 'btn btn-secondary btn-block getapp-web',
              target: Target.blank,
              attributes: const {'rel': 'noopener'},
              [
                iconMonitor(size: 18),
                Component.text('Or order in your browser'),
                span(classes: 'btn-icon', [iconArrowRight(size: 17)]),
              ],
            ),
          ]),

          div(classes: 'getapp-meta', [
            span(classes: 'getapp-meta-item', [iconStar(size: 15), Component.text('$kRating from $kRatingCount+ orders')]),
            span(classes: 'getapp-meta-item', [iconMapPin(size: 15), Component.text('Delivering across $kCity')]),
          ]),
        ]),

        div(classes: 'getapp-visual', [
          _phone('/images/app-food.png', '$kBrandName app — food ordering screen', 'Food', 'food'),
          _phone('/images/app-shop.png', '$kBrandName app — shop screen', 'Shop', 'shop'),
        ]),
      ]),
    ]);
  }

  Component _phone(String src, String alt, String label, String variant) {
    return div(classes: 'phone phone--$variant', [
      div(classes: 'phone-frame', [
        span(classes: 'phone-notch', []),
        img(
          src: src,
          alt: alt,
          classes: 'phone-screen',
          width: 560,
          height: 1244,
          attributes: const {'loading': 'lazy', 'decoding': 'async'},
        ),
      ]),
      span(classes: 'chip chip--$variant phone-label', [Component.text(label)]),
    ]);
  }

  /// NOTE FOR THE STORE OWNER: Apple and Google require their *official* badge
  /// artwork on published listings and forbid recolouring it. This custom pill
  /// matches the site and is fine for a marketing page, but swap in the
  /// official assets before you submit your apps.
  Component _storeBadge(String href, Component glyph, String kicker, String name) {
    final live = isLive(href);
    return a(
      href: href,
      classes: 'store-badge ${live ? '' : 'is-pending'}',
      target: live ? Target.blank : null,
      attributes: live ? const {'rel': 'noopener'} : const {'aria-disabled': 'true'},
      [
        span(classes: 'store-badge-glyph', [glyph]),
        span(classes: 'store-badge-text', [
          span(classes: 'store-badge-kicker', [Component.text(live ? kicker : 'Coming soon to')]),
          span(classes: 'store-badge-name', [Component.text(name)]),
        ]),
      ],
    );
  }

  @css
  static List<StyleRule> get styles => [
    css('.getapp-grid').styles(
      display: Display.grid,
      alignItems: AlignItems.center,
      gap: Gap.all(56.px),
      gridTemplate: const GridTemplate(
        columns: GridTracks([GridTrack(TrackSize.fr(1)), GridTrack(TrackSize.fr(1))]),
      ),
    ),
    css('.getapp-copy .section-header').styles(margin: Spacing.only(bottom: 30.px)),

    // ── Actions ─────────────────────────────────────────────────────────
    css('.getapp-actions').styles(
      display: Display.flex,
      flexDirection: FlexDirection.column,
      gap: Gap.all(12.px),
      maxWidth: 440.px,
    ),
    css('.getapp-stores').styles(
      display: Display.grid,
      gap: Gap.all(12.px),
      gridTemplate: const GridTemplate(
        columns: GridTracks([GridTrack(TrackSize.fr(1)), GridTrack(TrackSize.fr(1))]),
      ),
    ),
    css('.getapp-web').styles(justifyContent: JustifyContent.center),

    css('.store-badge').styles(
      display: Display.flex,
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.center,
      gap: Gap.all(10.px),
      height: 56.px,
      padding: Spacing.symmetric(horizontal: 16.px),
      backgroundColor: Color.variable('--ink-900'),
      color: Color.variable('--surface-card'),
      boxSizing: BoxSizing.borderBox,
      transition: const Transition('all', duration: Duration(milliseconds: 240)),
      raw: {'border-radius': '14px'},
    ),
    css('.store-badge:hover').styles(
      transform: Transform.translate(y: (-2).px),
      raw: {'box-shadow': 'var(--shadow-card)'},
    ),
    css('.store-badge.is-pending').styles(
      backgroundColor: Color.variable('--surface-2'),
      color: Color.variable('--ink-400'),
      cursor: Cursor.notAllowed,
    ),
    css('.store-badge.is-pending:hover').styles(transform: Transform.translate(y: 0.px)),
    css('.store-badge-glyph').styles(display: Display.inlineFlex),
    css('.store-badge-text').styles(
      display: Display.flex,
      flexDirection: FlexDirection.column,
      alignItems: AlignItems.start,
      lineHeight: 1.15.em,
    ),
    css('.store-badge-kicker').styles(
      fontSize: 0.63.rem,
      textTransform: TextTransform.upperCase,
      letterSpacing: 0.5.px,
      opacity: 0.75,
    ),
    css('.store-badge-name').styles(
      fontSize: 0.98.rem,
      fontWeight: FontWeight.w600,
      raw: {'white-space': 'nowrap'},
    ),

    css('.getapp-meta').styles(
      display: Display.flex,
      flexWrap: FlexWrap.wrap,
      gap: Gap.all(20.px),
      margin: Spacing.only(top: 26.px),
    ),
    css('.getapp-meta-item').styles(
      display: Display.inlineFlex,
      alignItems: AlignItems.center,
      gap: Gap.all(8.px),
      color: Color.variable('--ink-400'),
      fontSize: 0.88.rem,
    ),

    // ── Phones ──────────────────────────────────────────────────────────
    css('.getapp-visual').styles(
      display: Display.flex,
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.center,
      gap: Gap.all(22.px),
    ),
    css('.phone').styles(
      display: Display.flex,
      flexDirection: FlexDirection.column,
      alignItems: AlignItems.center,
      gap: Gap.all(14.px),
    ),
    // A slight offset keeps the pair from reading as a flat pair of rectangles.
    css('.phone--food').styles(transform: Transform.translate(y: (-18).px)),
    css('.phone--shop').styles(transform: Transform.translate(y: 18.px)),
    css('.phone-frame').styles(
      display: Display.block,
      position: Position.relative(),
      width: 230.px,
      padding: Spacing.all(9.px),
      backgroundColor: Color.variable('--ink-900'),
      boxSizing: BoxSizing.borderBox,
      raw: {'border-radius': '34px', 'box-shadow': 'var(--shadow-lift)'},
    ),
    css('.phone-notch').styles(
      position: Position.absolute(top: 9.px, left: 50.percent),
      zIndex: const ZIndex(2),
      width: 78.px,
      height: 18.px,
      backgroundColor: Color.variable('--ink-900'),
      transform: Transform.translate(x: (-50).percent),
      raw: {'border-radius': '0 0 12px 12px'},
    ),
    css('.phone-screen').styles(
      display: Display.block,
      width: 100.percent,
      height: Unit.auto,
      raw: {'border-radius': '26px'},
    ),
    css('.phone-label').styles(backgroundColor: Color.variable('--surface-card')),

    // ── Responsive ──────────────────────────────────────────────────────
    css.media(MediaQuery.screen(maxWidth: bpLg.px), [
      css('.getapp-grid').styles(
        gap: Gap.all(44.px),
        gridTemplate: const GridTemplate(columns: GridTracks([GridTrack(TrackSize.fr(1))])),
      ),
      css('.getapp-actions').styles(maxWidth: 100.percent),
      // Show the app before asking anyone to install it.
      css('.getapp-visual').styles(raw: {'order': '-1'}),
    ]),
    css.media(MediaQuery.screen(maxWidth: bpMd.px), [
      css('.getapp-visual').styles(gap: Gap.all(14.px)),
      css('.phone-frame').styles(width: 180.px, padding: Spacing.all(7.px), raw: {'border-radius': '28px'}),
      css('.phone-screen').styles(raw: {'border-radius': '22px'}),
      css('.phone-notch').styles(width: 62.px, height: 15.px),
    ]),
    css.media(MediaQuery.screen(maxWidth: bpSm.px), [
      css('.getapp-stores').styles(
        gridTemplate: const GridTemplate(columns: GridTracks([GridTrack(TrackSize.fr(1))])),
      ),
      css('.phone-frame').styles(width: 148.px),
      css('.phone--food, .phone--shop').styles(transform: Transform.translate(y: 0.px)),
    ]),
  ];
}
