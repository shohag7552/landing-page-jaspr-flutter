import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../content/site_content.dart';
import '../content/site_links.dart';
import '../theme.dart';
import 'ui/icons.dart';

/// Three ways in: Android, iPhone, and the browser.
///
/// This is the conversion section, and the three cards are deliberately equal —
/// same height, same bullet count, and `margin-top: auto` on every action row
/// so all three actions land on one baseline no matter how the copy wraps.
///
/// On a phone the **Web** card moves to the top: a visitor who has installed
/// nothing can act immediately, and asking for an install before they have
/// ever bought anything is the wrong first request.
class GetTheApp extends StatelessComponent {
  const GetTheApp({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'get-app', classes: 'section getapp', [
      div(classes: 'container', [
        div(classes: 'section-header text-center', [
          span(classes: 'section-eyebrow', [Component.text('Get started')]),
          h2(classes: 'section-title', [Component.text('Order however you like')]),
          p(classes: 'section-copy', [
            Component.text(
              'Same account, same cart, same prices — on Android, iPhone, or straight from your browser.',
            ),
          ]),
        ]),

        div(classes: 'getapp-grid', [
          _buildPlatform(
            modifier: 'web',
            icon: iconMonitor(size: 26),
            label: 'Web',
            title: 'Order in your browser',
            points: const [
              'Nothing to install — works on any device',
              'Guest checkout, no account needed',
              'Your cart is waiting when you sign in',
            ],
            action: a(
              href: kWebAppUrl,
              classes: 'btn btn-primary btn-block',
              target: Target.blank,
              attributes: const {'rel': 'noopener'},
              [
                Component.text('Open the web app'),
                span(classes: 'btn-icon', [iconArrowRight(size: 17)]),
              ],
            ),
          ),
          _buildPlatform(
            modifier: 'android',
            icon: iconSmartphone(size: 26),
            label: 'Android',
            title: 'Get it on Android',
            points: const [
              'Push updates at every order status',
              'Saved addresses and payment methods',
              'One-tap reorder of your favourites',
            ],
            action: _storeButton(kPlayStoreUrl, iconPlay(size: 20), 'GET IT ON', 'Google Play'),
          ),
          _buildPlatform(
            modifier: 'ios',
            icon: iconSmartphone(size: 26),
            label: 'iPhone',
            title: 'Get it on iPhone',
            points: const [
              'Push updates at every order status',
              'Saved addresses and payment methods',
              'One-tap reorder of your favourites',
            ],
            action: _storeButton(kAppStoreUrl, iconApple(size: 21), 'Download on the', 'App Store'),
          ),
        ]),

        p(classes: 'getapp-note', [
          Component.text('Delivering across $kCity, $kOpeningHours daily.'),
        ]),
      ]),
    ]);
  }

  Component _buildPlatform({
    required String modifier,
    required Component icon,
    required String label,
    required String title,
    required List<String> points,
    required Component action,
  }) {
    return div(classes: 'card getapp-card getapp-card--$modifier', [
      div(classes: 'getapp-head', [
        span(classes: 'icon-tile getapp-icon', [icon]),
        span(classes: 'chip getapp-chip', [Component.text(label)]),
      ]),
      h3(classes: 'getapp-title', [Component.text(title)]),
      ul(classes: 'getapp-points', [
        for (final point in points)
          li(classes: 'getapp-point', [
            span(classes: 'getapp-check', [iconCheck(size: 13)]),
            span(classes: 'getapp-point-text', [Component.text(point)]),
          ]),
      ]),
      div(classes: 'getapp-action', [action]),
    ]);
  }

  /// NOTE FOR THE STORE OWNER: Apple and Google both require their *official*
  /// badge artwork on published listings and forbid recolouring it. This
  /// custom pill matches the site, which is fine for a marketing page, but
  /// swap in the official badges before you submit your apps.
  Component _storeButton(String href, Component glyph, String kicker, String name) {
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
      alignItems: AlignItems.stretch,
      gap: Gap.all(22.px),
      gridTemplate: const GridTemplate(
        columns: GridTracks([
          GridTrack(TrackSize.fr(1)),
          GridTrack(TrackSize.fr(1)),
          GridTrack(TrackSize.fr(1)),
        ]),
      ),
    ),
    css('.getapp-card').styles(
      display: Display.flex,
      flexDirection: FlexDirection.column,
      gap: Gap.all(16.px),
      padding: Spacing.all(28.px),
    ),
    css('.getapp-card--web').styles(
      raw: {
        'border-color': 'var(--brand-a28)',
        'background-image': 'radial-gradient(circle at 100% 0%, var(--brand-a10), transparent 55%)',
      },
    ),
    css('.getapp-head').styles(
      display: Display.flex,
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.spaceBetween,
      gap: Gap.all(12.px),
    ),
    css('.getapp-chip').styles(
      backgroundColor: Color.variable('--surface-1'),
      fontSize: 0.78.rem,
      textTransform: TextTransform.upperCase,
      letterSpacing: 0.7.px,
    ),
    css('.getapp-title').styles(
      color: Color.variable('--ink-900'),
      fontFamily: const FontFamily.list([FontFamily('Outfit'), FontFamilies.sansSerif]),
      fontSize: 1.3.rem,
      fontWeight: FontWeight.bold,
      lineHeight: 1.25.em,
    ),
    css('.getapp-points').styles(
      display: Display.flex,
      flexDirection: FlexDirection.column,
      gap: Gap.all(10.px),
      margin: Spacing.zero,
      padding: Spacing.zero,
      raw: {'list-style': 'none'},
    ),
    css('.getapp-point').styles(
      display: Display.flex,
      alignItems: AlignItems.start,
      gap: Gap.all(10.px),
    ),
    css('.getapp-check').styles(
      display: Display.inlineFlex,
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.center,
      width: 20.px,
      height: 20.px,
      margin: Spacing.only(top: 1.px),
      backgroundColor: Color.variable('--success-soft'),
      color: Color.variable('--success-ink'),
      raw: {'border-radius': '50%', 'flex-shrink': '0'},
    ),
    css('.getapp-point-text').styles(
      color: Color.variable('--ink-500'),
      fontSize: 0.91.rem,
      lineHeight: 1.55.em,
    ),
    // This is what puts all three actions on one baseline.
    css('.getapp-action').styles(
      display: Display.flex,
      margin: Spacing.only(top: Unit.auto),
      padding: Spacing.only(top: 6.px),
      raw: {'margin-top': 'auto'},
    ),

    // ── Store badges ────────────────────────────────────────────────────
    css('.store-badge').styles(
      display: Display.flex,
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.center,
      gap: Gap.all(11.px),
      width: 100.percent,
      height: 50.px,
      padding: Spacing.symmetric(horizontal: 18.px),
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
      fontSize: 0.64.rem,
      textTransform: TextTransform.upperCase,
      letterSpacing: 0.5.px,
      opacity: 0.8,
    ),
    css('.store-badge-name').styles(
      fontSize: 1.rem,
      fontWeight: FontWeight.w600,
      raw: {'white-space': 'nowrap'},
    ),

    css('.getapp-note').styles(
      margin: Spacing.only(top: 28.px),
      color: Color.variable('--ink-400'),
      fontSize: 0.9.rem,
      textAlign: TextAlign.center,
    ),

    // ── Responsive ──────────────────────────────────────────────────────
    css.media(MediaQuery.screen(maxWidth: bpLg.px), [
      css('.getapp-grid').styles(
        gap: Gap.all(18.px),
        gridTemplate: const GridTemplate(columns: GridTracks([GridTrack(TrackSize.fr(1))])),
      ),
      // Web first on small screens — it is the only option that needs nothing
      // installed, and it converts a first-time visitor on the spot.
      css('.getapp-card--web').styles(raw: {'order': '-1'}),
      css('.getapp-note').styles(textAlign: TextAlign.left),
    ]),
    css.media(MediaQuery.screen(maxWidth: bpMd.px), [
      css('.getapp-card').styles(padding: Spacing.all(22.px)),
      css('.getapp-title').styles(fontSize: 1.2.rem),
    ]),
  ];
}
