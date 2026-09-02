import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../content/site_content.dart';
import '../content/site_links.dart';
import '../theme.dart';
import 'ui/icons.dart';

class HeroSection extends StatelessComponent {
  const HeroSection({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'home', classes: 'hero', [
      div(classes: 'hero-container container', [
        div(classes: 'hero-content', [
          div(classes: 'hero-badge', [
            span(classes: 'badge-dot', []),
            span(classes: 'badge-text', [
              Component.text('Delivering across $kCity · Open $kOpeningHours'),
            ]),
          ]),

          h1(classes: 'hero-title', [
            Component.text('Hot food and daily essentials, '),
            span(classes: 'hero-title-accent', [Component.text('at your door')]),
            Component.text('.'),
          ]),

          // The thesis. Everything on this page that says "two" has to resolve
          // back into "one order" — this is where that starts.
          p(classes: 'hero-subtitle', [
            Component.text(
              'One app, one cart, one rider. Order from our kitchen and our shop '
              'in a single order — and follow it live from checkout to doorstep.',
            ),
          ]),

          div(classes: 'hero-modules', [
            span(classes: 'chip chip--food', [iconUtensils(size: 15), Component.text('Food')]),
            span(classes: 'chip chip--shop', [iconBag(size: 15), Component.text('Groceries & essentials')]),
          ]),

          // Two ways in, at identical geometry. The grid — rather than a flex
          // row — is what forces equal width; intrinsic sizing would make the
          // longer label wider and quietly rank one path above the other.
          div(classes: 'hero-actions', [
            a(
              href: kWebAppUrl,
              classes: 'btn btn-primary btn-lg',
              target: Target.blank,
              attributes: const {'rel': 'noopener'},
              [
                Component.text('Order now'),
                span(classes: 'btn-icon', [iconArrowRight(size: 18)]),
              ],
            ),
            a(href: '#get-app', classes: 'btn btn-secondary btn-lg', [
              span(classes: 'hero-store-glyphs', [iconApple(size: 16), iconPlay(size: 15)]),
              Component.text('Get the app'),
            ]),
          ]),

          div(classes: 'hero-quick-info', [
            _buildQuickInfo(iconClock(size: 15), '$kDeliveryWindow min average'),
            _buildQuickInfo(iconTruck(size: 15), 'Free delivery over $kFreeDeliveryOver'),
            _buildQuickInfo(iconStar(size: 15), '$kRating from $kRatingCount+ orders'),
          ]),

          div(classes: 'hero-stats', [
            _buildStat('$kOrdersDelivered+', 'Orders delivered'),
            _buildStat('$kAvgDeliveryMinutes min', 'Average delivery'),
            _buildStat(kAreasCovered, 'Areas covered'),
          ]),
        ]),

        div(classes: 'hero-visual', [
          img(
            src: 'https://images.unsplash.com/photo-1526367790999-0150786686a2?q=80&w=1400&auto=format&fit=crop',
            alt: 'A $kBrandName rider handing an order to a customer at their door',
            classes: 'hero-image',
            width: 1400,
            height: 933,
            attributes: const {'fetchpriority': 'high', 'decoding': 'async'},
          ),

          // The live-tracking panel does the rider story above the fold, for
          // free, and is module-neutral — it works for a curry or a crate of
          // milk.
          div(classes: 'tracking-panel', [
            div(classes: 'panel-topline', [
              span(classes: 'panel-label', [Component.text('Order #4821')]),
              span(classes: 'panel-status', [Component.text('On the way')]),
            ]),
            div(classes: 'route-line', [
              span(classes: 'route-point active', []),
              span(classes: 'route-bar complete', []),
              span(classes: 'route-point active', []),
              span(classes: 'route-bar complete', []),
              span(classes: 'route-point active', []),
              span(classes: 'route-bar', []),
              span(classes: 'route-point', []),
            ]),
            div(classes: 'panel-metrics', [
              _buildMetric('12 min', 'ETA'),
              _buildMetric('1.8 km', 'Distance'),
              _buildMetric('Paid', 'Status'),
            ]),
          ]),

          div(classes: 'notification-card', [
            div(classes: 'icon-tile icon-tile--sm notif-icon', [iconBell(size: 19)]),
            div(classes: 'notif-body', [
              span(classes: 'notif-title', [Component.text('Order update')]),
              span(classes: 'notif-text', [Component.text('Your rider is almost there — arriving in 3 min.')]),
            ]),
          ]),
        ]),
      ]),
    ]);
  }

  Component _buildStat(String value, String label) {
    return div(classes: 'stat-item', [
      span(classes: 'stat-value', [Component.text(value)]),
      span(classes: 'stat-label', [Component.text(label)]),
    ]);
  }

  Component _buildQuickInfo(Component icon, String label) {
    return div(classes: 'quick-info-item', [
      span(classes: 'quick-info-icon', [icon]),
      span(classes: 'quick-info-label', [Component.text(label)]),
    ]);
  }

  Component _buildMetric(String value, String label) {
    return div(classes: 'metric', [
      span(classes: 'metric-value', [Component.text(value)]),
      span(classes: 'metric-label', [Component.text(label)]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.hero').styles(
      display: Display.flex,
      position: Position.relative(),
      alignItems: AlignItems.center,
      padding: Spacing.only(top: 132.px, bottom: 92.px),
      overflow: Overflow.hidden,
      backgroundColor: Color.variable('--surface-0'),
      raw: {
        'background-image':
            'radial-gradient(circle at 15% 12%, var(--brand-a10), transparent 30%), '
                'linear-gradient(180deg, var(--surface-0) 0%, var(--surface-1) 100%)',
      },
    ),
    css('.hero-container').styles(
      display: Display.grid,
      alignItems: AlignItems.center,
      gap: Gap.all(64.px),
      gridTemplate: const GridTemplate(
        columns: GridTracks([GridTrack(TrackSize.fr(1.03)), GridTrack(TrackSize.fr(0.97))]),
      ),
    ),
    css('.hero-content').styles(maxWidth: 660.px),

    css('.hero-badge').styles(
      display: Display.inlineFlex,
      alignItems: AlignItems.center,
      gap: Gap.all(10.px),
      margin: Spacing.only(bottom: 24.px),
      padding: Spacing.symmetric(horizontal: 14.px, vertical: 9.px),
      backgroundColor: Color.variable('--surface-card'),
      raw: {
        'border': '1px solid var(--border-subtle)',
        'border-radius': 'var(--radius-pill)',
        'box-shadow': 'var(--shadow-sm)',
      },
    ),
    css('.badge-dot').styles(
      width: 8.px,
      height: 8.px,
      backgroundColor: Color.variable('--success'),
      raw: {'border-radius': '50%', 'box-shadow': '0 0 0 4px var(--success-soft)', 'flex-shrink': '0'},
    ),
    css('.badge-text').styles(
      color: Color.variable('--ink-700'),
      fontSize: 0.86.rem,
      fontWeight: FontWeight.w600,
      raw: {'white-space': 'nowrap'},
    ),

    css('.hero-title').styles(
      margin: Spacing.only(bottom: 20.px),
      color: Color.variable('--ink-900'),
      fontFamily: const FontFamily.list([FontFamily('Outfit'), FontFamilies.sansSerif]),
      fontSize: 3.7.rem,
      fontWeight: FontWeight.w800,
      lineHeight: 1.06.em,
      letterSpacing: (-1.4).px,
    ),
    css('.hero-title-accent').styles(color: Color.variable('--brand-500')),
    css('.hero-subtitle').styles(
      margin: Spacing.only(bottom: 24.px),
      maxWidth: 560.px,
      color: Color.variable('--ink-400'),
      fontSize: 1.1.rem,
      lineHeight: 1.7.em,
    ),

    css('.hero-modules').styles(
      display: Display.flex,
      flexWrap: FlexWrap.wrap,
      gap: Gap.all(10.px),
      margin: Spacing.only(bottom: 28.px),
    ),

    // Equal-weight CTA pair.
    css('.hero-actions').styles(
      display: Display.grid,
      gap: Gap.all(14.px),
      margin: Spacing.only(bottom: 30.px),
      maxWidth: 470.px,
      gridTemplate: const GridTemplate(
        columns: GridTracks([GridTrack(TrackSize.fr(1)), GridTrack(TrackSize.fr(1))]),
      ),
    ),
    css('.hero-store-glyphs').styles(
      display: Display.inlineFlex,
      alignItems: AlignItems.center,
      gap: Gap.all(6.px),
      color: Color.variable('--ink-700'),
    ),

    css('.hero-quick-info').styles(
      display: Display.flex,
      flexWrap: FlexWrap.wrap,
      gap: Gap.all(10.px),
      margin: Spacing.only(bottom: 34.px),
    ),
    css('.quick-info-item').styles(
      display: Display.inlineFlex,
      alignItems: AlignItems.center,
      gap: Gap.all(8.px),
      padding: Spacing.symmetric(horizontal: 13.px, vertical: 9.px),
      backgroundColor: Color.variable('--surface-card'),
      raw: {'border': '1px solid var(--border-subtle)', 'border-radius': 'var(--radius-pill)'},
    ),
    css('.quick-info-icon').styles(
      display: Display.inlineFlex,
      color: Color.variable('--brand-500'),
    ),
    css('.quick-info-label').styles(
      color: Color.variable('--ink-500'),
      fontSize: 0.87.rem,
      fontWeight: FontWeight.w500,
      raw: {'white-space': 'nowrap'},
    ),

    css('.hero-stats').styles(
      display: Display.grid,
      gap: Gap.all(14.px),
      padding: Spacing.only(top: 28.px),
      gridTemplate: const GridTemplate(
        columns: GridTracks([
          GridTrack(TrackSize.fr(1)),
          GridTrack(TrackSize.fr(1)),
          GridTrack(TrackSize.fr(1)),
        ]),
      ),
      raw: {'border-top': '1px solid var(--border-subtle)'},
    ),
    css('.stat-item').styles(
      display: Display.flex,
      flexDirection: FlexDirection.column,
      gap: Gap.all(5.px),
    ),
    css('.stat-value').styles(
      color: Color.variable('--ink-900'),
      fontFamily: const FontFamily.list([FontFamily('Outfit'), FontFamilies.sansSerif]),
      fontSize: 1.6.rem,
      fontWeight: FontWeight.bold,
      lineHeight: 1.1.em,
    ),
    css('.stat-label').styles(
      color: Color.variable('--ink-400'),
      fontSize: 0.85.rem,
    ),

    // ── Visual ──────────────────────────────────────────────────────────
    css('.hero-visual').styles(position: Position.relative()),
    css('.hero-image').styles(
      width: 100.percent,
      height: 520.px,
      raw: {'object-fit': 'cover', 'border-radius': 'var(--radius-xl)', 'box-shadow': 'var(--shadow-card)'},
    ),

    css('.tracking-panel').styles(
      position: Position.absolute(left: (-26).px, bottom: 34.px),
      width: 300.px,
      padding: Spacing.all(18.px),
      backgroundColor: Color.variable('--surface-raised'),
      boxSizing: BoxSizing.borderBox,
      raw: {
        'border': '1px solid var(--border-subtle)',
        'border-radius': 'var(--radius-lg)',
        'box-shadow': 'var(--shadow-card)',
        'backdrop-filter': 'blur(14px)',
      },
    ),
    css('.panel-topline').styles(
      display: Display.flex,
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.spaceBetween,
      margin: Spacing.only(bottom: 15.px),
    ),
    css('.panel-label').styles(
      color: Color.variable('--ink-900'),
      fontSize: 0.92.rem,
      fontWeight: FontWeight.bold,
    ),
    css('.panel-status').styles(
      padding: Spacing.symmetric(horizontal: 10.px, vertical: 5.px),
      backgroundColor: Color.variable('--success-soft'),
      color: Color.variable('--success-ink'),
      fontSize: 0.74.rem,
      fontWeight: FontWeight.bold,
      raw: {'border-radius': 'var(--radius-pill)'},
    ),
    css('.route-line').styles(
      display: Display.flex,
      alignItems: AlignItems.center,
      margin: Spacing.only(bottom: 16.px),
    ),
    css('.route-point').styles(
      width: 11.px,
      height: 11.px,
      backgroundColor: Color.variable('--surface-2'),
      raw: {'border-radius': '50%', 'flex-shrink': '0'},
    ),
    css('.route-point.active').styles(backgroundColor: Color.variable('--brand-500')),
    css('.route-bar').styles(
      height: 3.px,
      backgroundColor: Color.variable('--surface-2'),
      raw: {'flex': '1', 'border-radius': '2px'},
    ),
    css('.route-bar.complete').styles(backgroundColor: Color.variable('--brand-500')),
    css('.panel-metrics').styles(
      display: Display.grid,
      gap: Gap.all(8.px),
      gridTemplate: const GridTemplate(
        columns: GridTracks([
          GridTrack(TrackSize.fr(1)),
          GridTrack(TrackSize.fr(1)),
          GridTrack(TrackSize.fr(1)),
        ]),
      ),
    ),
    css('.metric').styles(
      display: Display.flex,
      flexDirection: FlexDirection.column,
      gap: Gap.all(2.px),
    ),
    css('.metric-value').styles(
      color: Color.variable('--ink-900'),
      fontSize: 0.95.rem,
      fontWeight: FontWeight.bold,
    ),
    css('.metric-label').styles(
      color: Color.variable('--ink-400'),
      fontSize: 0.72.rem,
      textTransform: TextTransform.upperCase,
      letterSpacing: 0.6.px,
    ),

    css('.notification-card').styles(
      display: Display.flex,
      position: Position.absolute(top: 30.px, right: (-22).px),
      alignItems: AlignItems.center,
      gap: Gap.all(12.px),
      width: 270.px,
      padding: Spacing.all(14.px),
      backgroundColor: Color.variable('--surface-raised'),
      boxSizing: BoxSizing.borderBox,
      raw: {
        'border': '1px solid var(--border-subtle)',
        'border-radius': 'var(--radius-md)',
        'box-shadow': 'var(--shadow-card)',
        'backdrop-filter': 'blur(14px)',
      },
    ),
    css('.notif-body').styles(
      display: Display.flex,
      flexDirection: FlexDirection.column,
      gap: Gap.all(3.px),
    ),
    css('.notif-title').styles(
      color: Color.variable('--ink-900'),
      fontSize: 0.88.rem,
      fontWeight: FontWeight.bold,
    ),
    css('.notif-text').styles(
      color: Color.variable('--ink-400'),
      fontSize: 0.79.rem,
      lineHeight: 1.45.em,
    ),

    // ── Responsive ──────────────────────────────────────────────────────
    css.media(MediaQuery.screen(maxWidth: bpLg.px), [
      css('.hero').styles(padding: Spacing.only(top: 116.px, bottom: 72.px)),
      css('.hero-container').styles(
        gap: Gap.all(52.px),
        gridTemplate: const GridTemplate(columns: GridTracks([GridTrack(TrackSize.fr(1))])),
      ),
      css('.hero-content').styles(maxWidth: 100.percent),
      css('.hero-title').styles(fontSize: 3.rem, letterSpacing: (-1).px),
      css('.hero-actions').styles(maxWidth: 440.px),
      css('.hero-image').styles(height: 440.px),
    ]),
    css.media(MediaQuery.screen(maxWidth: bpMd.px), [
      css('.hero').styles(padding: Spacing.only(top: 104.px, bottom: 56.px)),
      css('.hero-container').styles(gap: Gap.all(38.px)),
      css('.hero-title').styles(fontSize: 2.4.rem, letterSpacing: (-0.7).px),
      css('.hero-subtitle').styles(fontSize: 1.rem),
      css('.hero-actions').styles(maxWidth: 100.percent),
      css('.hero-image').styles(height: 340.px),
      // These float outside the image on desktop; on a phone that overflows.
      css('.tracking-panel').styles(
        position: Position.relative(left: 0.px, bottom: 0.px),
        width: 100.percent,
        margin: Spacing.only(top: 16.px),
      ),
      css('.notification-card').styles(display: Display.none),
    ]),
    css.media(MediaQuery.screen(maxWidth: bpSm.px), [
      css('.hero').styles(padding: Spacing.only(top: 92.px, bottom: 46.px)),
      css('.hero-title').styles(fontSize: 2.rem),
      css('.hero-subtitle').styles(fontSize: 0.97.rem),
      css('.badge-text').styles(fontSize: 0.78.rem, raw: {'white-space': 'normal'}),
      // Stacked, still full-width, still equal.
      css('.hero-actions').styles(
        gridTemplate: const GridTemplate(columns: GridTracks([GridTrack(TrackSize.fr(1))])),
      ),
      css('.hero-stats').styles(
        gap: Gap.all(16.px),
        gridTemplate: const GridTemplate(
          columns: GridTracks([GridTrack(TrackSize.fr(1)), GridTrack(TrackSize.fr(1))]),
        ),
      ),
      css('.stat-value').styles(fontSize: 1.35.rem),
      css('.hero-image').styles(height: 260.px),
    ]),
  ];
}
