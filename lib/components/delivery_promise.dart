import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../data/landing_data.dart';
import '../theme.dart';
import 'ui/icons.dart';

/// The rider story, told properly.
///
/// This is the thing a local store has that a marketplace does not: the person
/// who brings the order works here. The section makes that concrete — named
/// rider, live map, real ETA, a way to reach them — because "we deliver" is a
/// claim every competitor makes, and this is the part that is actually
/// different.
///
/// The journey visual deliberately reuses the hero tracking panel's language
/// so the page has one visual vocabulary for delivery rather than two.
class DeliveryPromise extends StatelessComponent {
  const DeliveryPromise({super.key});

  static final _points = <(Component, String)>[
    (iconRoute(size: 20), 'Live map tracking'),
    (iconClock(size: 20), 'A real ETA, updated as they ride'),
    (iconChat(size: 20), 'Call or message your rider'),
    (iconShield(size: 20), 'Contactless drop-off'),
  ];

  @override
  Component build(BuildContext context) {
    final data = LandingScope.of(context);

    return section(id: 'tracking', classes: 'section section--alt tracking', [
      div(classes: 'container tracking-grid', [
        div(classes: 'tracking-copy', [
          div(classes: 'section-header', [
            span(classes: 'section-eyebrow', [Component.text('Our delivery team')]),
            h2(classes: 'section-title', [Component.text(data.riderTitle)]),
            p(classes: 'section-copy', [
              Component.text(data.riderSubtitle),
            ]),
          ]),

          div(classes: 'tracking-points', [
            for (final (icon, title) in _points)
              div(classes: 'tracking-point', [
                span(classes: 'icon-tile icon-tile--sm icon-tile--rider', [icon]),
                h3(classes: 'tracking-point-title', [Component.text(title)]),
              ]),
          ]),

          p(classes: 'tracking-recruit', [
            Component.text('Want to ride with us? '),
            a(href: data.riderApplyUrl, classes: 'link-arrow tracking-recruit-link', [
              Component.text('Deliver with ${data.brandName}'),
              span(classes: 'btn-icon', [iconArrowRight(size: 15)]),
            ]),
          ]),
        ]),

        // Store → Rider → Door
        div(classes: 'tracking-visual', [
          div(classes: 'journey', [
            _buildNode(iconBag(size: 20), 'Our store', 'Packed', true),
            div(classes: 'journey-bar journey-bar--done', []),
            _buildNode(iconTruck(size: 20), 'On the way', 'Now', true),
            div(classes: 'journey-bar', []),
            _buildNode(iconHome(size: 20), 'Your door', '~12 min', false),
          ]),

          div(classes: 'rider-card', [
            div(classes: 'rider-head', [
              span(classes: 'rider-avatar', [Component.text('AM')]),
              div(classes: 'rider-id', [
                span(classes: 'rider-name', [Component.text('Your rider is on the way')]),
                span(classes: 'rider-role', [Component.text('${data.brandName} delivery team')]),
              ]),
              span(classes: 'chip chip--success', [Component.text('Live')]),
            ]),
            div(classes: 'rider-metrics', [
              _buildMetricBox('12 min', 'ETA'),
              _buildMetricBox('1.8 km', 'Away'),
              _buildMetricBox('4.9', 'Rating'),
            ]),
            div(classes: 'rider-actions', [
              span(classes: 'rider-action', [iconPhone(size: 16), Component.text('Call')]),
              span(classes: 'rider-action', [iconChat(size: 16), Component.text('Message')]),
            ]),
          ]),
        ]),
      ]),
    ]);
  }

  Component _buildNode(Component icon, String label, String meta, bool done) {
    return div(classes: 'journey-node ${done ? 'is-done' : ''}', [
      span(classes: 'journey-dot', [icon]),
      span(classes: 'journey-label', [Component.text(label)]),
      span(classes: 'journey-meta', [Component.text(meta)]),
    ]);
  }

  Component _buildMetricBox(String value, String label) {
    return div(classes: 'rider-metric', [
      span(classes: 'rider-metric-value', [Component.text(value)]),
      span(classes: 'rider-metric-label', [Component.text(label)]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.tracking-grid').styles(
      display: Display.grid,
      alignItems: AlignItems.center,
      gap: Gap.all(56.px),
      gridTemplate: const GridTemplate(
        columns: GridTracks([GridTrack(TrackSize.fr(1)), GridTrack(TrackSize.fr(1))]),
      ),
    ),
    css('.tracking-copy .section-header').styles(margin: Spacing.only(bottom: 30.px)),

    css('.tracking-points').styles(
      display: Display.grid,
      gap: Gap.all(20.px),
      gridTemplate: const GridTemplate(
        columns: GridTracks([GridTrack(TrackSize.fr(1)), GridTrack(TrackSize.fr(1))]),
      ),
    ),
    css('.tracking-point').styles(
      display: Display.flex,
      alignItems: AlignItems.center,
      gap: Gap.all(13.px),
    ),
    css('.tracking-point-title').styles(
      color: Color.variable('--ink-900'),
      fontSize: 0.99.rem,
      fontWeight: FontWeight.bold,
    ),
    css('.tracking-recruit').styles(
      margin: Spacing.only(top: 28.px),
      color: Color.variable('--ink-400'),
      fontSize: 0.92.rem,
    ),
    css('.tracking-recruit-link').styles(fontSize: 0.92.rem),

    // ── Journey ─────────────────────────────────────────────────────────
    css('.tracking-visual').styles(
      display: Display.flex,
      flexDirection: FlexDirection.column,
      gap: Gap.all(22.px),
      padding: Spacing.all(30.px),
      backgroundColor: Color.variable('--surface-card'),
      raw: {
        'border': '1px solid var(--border-subtle)',
        'border-radius': 'var(--radius-xl)',
        'box-shadow': 'var(--shadow-card)',
      },
    ),
    css('.journey').styles(
      display: Display.flex,
      alignItems: AlignItems.start,
      gap: Gap.all(6.px),
    ),
    css('.journey-node').styles(
      display: Display.flex,
      flexDirection: FlexDirection.column,
      alignItems: AlignItems.center,
      gap: Gap.all(7.px),
      textAlign: TextAlign.center,
      raw: {'flex': '0 0 auto', 'width': '84px'},
    ),
    css('.journey-dot').styles(
      display: Display.inlineFlex,
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.center,
      width: 46.px,
      height: 46.px,
      backgroundColor: Color.variable('--surface-2'),
      color: Color.variable('--ink-400'),
      raw: {'border-radius': '50%'},
    ),
    css('.journey-node.is-done .journey-dot').styles(
      backgroundColor: Color.variable('--brand-500'),
      color: Color.variable('--brand-on'),
      raw: {'box-shadow': 'var(--shadow-brand)'},
    ),
    css('.journey-label').styles(
      color: Color.variable('--ink-900'),
      fontSize: 0.82.rem,
      fontWeight: FontWeight.w600,
      lineHeight: 1.25.em,
    ),
    css('.journey-meta').styles(
      color: Color.variable('--ink-400'),
      fontSize: 0.75.rem,
    ),
    css('.journey-bar').styles(
      height: 3.px,
      margin: Spacing.only(top: 22.px),
      backgroundColor: Color.variable('--surface-2'),
      raw: {'flex': '1', 'border-radius': '2px'},
    ),
    css('.journey-bar--done').styles(backgroundColor: Color.variable('--brand-500')),

    // ── Rider card ──────────────────────────────────────────────────────
    css('.rider-card').styles(
      display: Display.flex,
      flexDirection: FlexDirection.column,
      gap: Gap.all(16.px),
      padding: Spacing.all(20.px),
      backgroundColor: Color.variable('--surface-1'),
      raw: {'border': '1px solid var(--border-subtle)', 'border-radius': 'var(--radius-lg)'},
    ),
    css('.rider-head').styles(
      display: Display.flex,
      alignItems: AlignItems.center,
      gap: Gap.all(12.px),
    ),
    css('.rider-avatar').styles(
      display: Display.inlineFlex,
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.center,
      width: 42.px,
      height: 42.px,
      backgroundColor: Color.variable('--rider-soft'),
      color: Color.variable('--rider'),
      fontSize: 0.85.rem,
      fontWeight: FontWeight.bold,
      raw: {'border-radius': '50%', 'flex-shrink': '0'},
    ),
    css('.rider-id').styles(
      display: Display.flex,
      flexDirection: FlexDirection.column,
      gap: Gap.all(2.px),
      raw: {'flex': '1', 'min-width': '0'},
    ),
    css('.rider-name').styles(
      color: Color.variable('--ink-900'),
      fontSize: 0.93.rem,
      fontWeight: FontWeight.bold,
    ),
    css('.rider-role').styles(
      color: Color.variable('--ink-400'),
      fontSize: 0.79.rem,
    ),
    css('.rider-metrics').styles(
      display: Display.grid,
      gap: Gap.all(10.px),
      gridTemplate: const GridTemplate(
        columns: GridTracks([
          GridTrack(TrackSize.fr(1)),
          GridTrack(TrackSize.fr(1)),
          GridTrack(TrackSize.fr(1)),
        ]),
      ),
    ),
    css('.rider-metric').styles(
      display: Display.flex,
      flexDirection: FlexDirection.column,
      gap: Gap.all(2.px),
      padding: Spacing.symmetric(horizontal: 12.px, vertical: 11.px),
      backgroundColor: Color.variable('--surface-card'),
      raw: {'border': '1px solid var(--border-subtle)', 'border-radius': 'var(--radius-sm)'},
    ),
    css('.rider-metric-value').styles(
      color: Color.variable('--ink-900'),
      fontSize: 0.98.rem,
      fontWeight: FontWeight.bold,
    ),
    css('.rider-metric-label').styles(
      color: Color.variable('--ink-400'),
      fontSize: 0.72.rem,
      textTransform: TextTransform.upperCase,
      letterSpacing: 0.6.px,
    ),
    css('.rider-actions').styles(
      display: Display.grid,
      gap: Gap.all(10.px),
      gridTemplate: const GridTemplate(
        columns: GridTracks([GridTrack(TrackSize.fr(1)), GridTrack(TrackSize.fr(1))]),
      ),
    ),
    css('.rider-action').styles(
      display: Display.inlineFlex,
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.center,
      gap: Gap.all(8.px),
      padding: Spacing.symmetric(vertical: 11.px),
      backgroundColor: Color.variable('--surface-card'),
      color: Color.variable('--ink-700'),
      fontSize: 0.88.rem,
      fontWeight: FontWeight.w600,
      raw: {'border': '1px solid var(--border-strong)', 'border-radius': 'var(--radius-sm)'},
    ),

    // ── Responsive ──────────────────────────────────────────────────────
    css.media(MediaQuery.screen(maxWidth: bpLg.px), [
      css('.tracking-grid').styles(
        gap: Gap.all(38.px),
        gridTemplate: const GridTemplate(columns: GridTracks([GridTrack(TrackSize.fr(1))])),
      ),
    ]),
    css.media(MediaQuery.screen(maxWidth: bpMd.px), [
      css('.tracking-points').styles(
        gap: Gap.all(16.px),
        gridTemplate: const GridTemplate(columns: GridTracks([GridTrack(TrackSize.fr(1))])),
      ),
      css('.tracking-visual').styles(padding: Spacing.all(20.px)),
      css('.journey-node').styles(raw: {'flex': '0 0 auto', 'width': '68px'}),
      css('.journey-dot').styles(width: 40.px, height: 40.px),
      css('.journey-bar').styles(margin: Spacing.only(top: 19.px)),
      css('.journey-label').styles(fontSize: 0.76.rem),
    ]),
  ];
}
