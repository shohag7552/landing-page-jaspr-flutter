import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../content/site_content.dart';
import '../content/site_links.dart';
import '../theme.dart';
import 'ui/icons.dart';

/// "Do we deliver to you?"
///
/// High on the page on purpose. In radius-based delivery the single biggest
/// bounce cause is a visitor who scrolls an entire site before discovering
/// they're outside the area. Answering it early costs one screen and saves
/// every out-of-zone click.
///
/// Deliberately sparse: a radius, a list of names, three facts. Hours and fee
/// tables belong in the app, not on the page that has five seconds to land.
///
/// The rings are pure CSS — no map SDK, no API key, no tile bill.
class DeliveryZone extends StatelessComponent {
  const DeliveryZone({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'delivery', classes: 'section section--alt zone', [
      div(classes: 'container zone-grid', [
        div(classes: 'zone-map', [
          div(classes: 'zone-rings', [
            span(classes: 'zone-ring zone-ring--3', []),
            span(classes: 'zone-ring zone-ring--2', []),
            span(classes: 'zone-ring zone-ring--1', []),
            span(classes: 'zone-pin', [iconMapPin(size: 22)]),
          ]),
          span(classes: 'zone-map-caption', [Component.text('$kDeliveryRadiusKm from $kStoreAddress')]),
        ]),

        div(classes: 'zone-copy', [
          div(classes: 'section-header', [
            span(classes: 'section-eyebrow', [Component.text('Delivery area')]),
            h2(classes: 'section-title', [Component.text('Do we deliver to you?')]),
            p(classes: 'section-copy', [
              Component.text('We cover $kAreasCovered neighbourhoods within $kDeliveryRadiusKm of the store.'),
            ]),
          ]),

          div(classes: 'zone-areas', [
            for (final area in kCoveredAreas) span(classes: 'chip zone-area', [Component.text(area)]),
          ]),

          div(classes: 'zone-facts', [
            _fact('Open daily', kOpeningHours),
            _fact('Delivery from', kDeliveryFeeFrom),
            _fact('Free over', kFreeDeliveryOver),
          ]),

          p(classes: 'zone-note', [
            Component.text('Not on the list? '),
            a(href: kWhatsAppUrl, classes: 'link-arrow zone-note-link', [Component.text('Message us')]),
          ]),
        ]),
      ]),
    ]);
  }

  Component _fact(String label, String value) {
    return div(classes: 'zone-fact', [
      span(classes: 'zone-fact-label', [Component.text(label)]),
      span(classes: 'zone-fact-value', [Component.text(value)]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.zone-grid').styles(
      display: Display.grid,
      alignItems: AlignItems.center,
      gap: Gap.all(56.px),
      gridTemplate: const GridTemplate(
        columns: GridTracks([GridTrack(TrackSize.fr(0.8)), GridTrack(TrackSize.fr(1.2))]),
      ),
    ),

    // ── Radius visual ───────────────────────────────────────────────────
    css('.zone-map').styles(
      display: Display.flex,
      flexDirection: FlexDirection.column,
      alignItems: AlignItems.center,
      gap: Gap.all(20.px),
    ),
    css('.zone-rings').styles(
      display: Display.flex,
      position: Position.relative(),
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.center,
      width: 280.px,
      height: 280.px,
    ),
    css('.zone-ring').styles(
      position: Position.absolute(),
      raw: {'border-radius': '50%', 'border': '1px solid var(--brand-a28)'},
    ),
    css('.zone-ring--1').styles(width: 104.px, height: 104.px, backgroundColor: Color.variable('--brand-a10')),
    css('.zone-ring--2').styles(width: 190.px, height: 190.px),
    css('.zone-ring--3').styles(width: 276.px, height: 276.px),
    css('.zone-pin').styles(
      display: Display.inlineFlex,
      position: Position.relative(),
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.center,
      width: 52.px,
      height: 52.px,
      backgroundColor: Color.variable('--brand-500'),
      color: Color.variable('--brand-on'),
      raw: {'border-radius': '50%', 'box-shadow': 'var(--shadow-brand)'},
    ),
    css('.zone-map-caption').styles(
      color: Color.variable('--ink-400'),
      fontSize: 0.88.rem,
      textAlign: TextAlign.center,
    ),

    // ── Copy ────────────────────────────────────────────────────────────
    css('.zone-copy .section-header').styles(margin: Spacing.only(bottom: 26.px)),
    css('.zone-areas').styles(
      display: Display.flex,
      flexWrap: FlexWrap.wrap,
      gap: Gap.all(8.px),
      margin: Spacing.only(bottom: 30.px),
    ),
    css('.zone-area').styles(
      backgroundColor: Color.variable('--surface-card'),
      color: Color.variable('--ink-500'),
      fontSize: 0.85.rem,
      fontWeight: FontWeight.w500,
    ),

    css('.zone-facts').styles(
      display: Display.grid,
      gap: Gap.all(20.px),
      padding: Spacing.symmetric(vertical: 22.px),
      gridTemplate: const GridTemplate(
        columns: GridTracks([
          GridTrack(TrackSize.fr(1)),
          GridTrack(TrackSize.fr(1)),
          GridTrack(TrackSize.fr(1)),
        ]),
      ),
      raw: {'border-top': '1px solid var(--border-subtle)', 'border-bottom': '1px solid var(--border-subtle)'},
    ),
    css('.zone-fact').styles(
      display: Display.flex,
      flexDirection: FlexDirection.column,
      gap: Gap.all(4.px),
    ),
    css('.zone-fact-label').styles(
      color: Color.variable('--ink-400'),
      fontSize: 0.78.rem,
      textTransform: TextTransform.upperCase,
      letterSpacing: 0.7.px,
    ),
    css('.zone-fact-value').styles(
      color: Color.variable('--ink-900'),
      fontSize: 1.02.rem,
      fontWeight: FontWeight.bold,
    ),

    css('.zone-note').styles(
      margin: Spacing.only(top: 20.px),
      color: Color.variable('--ink-400'),
      fontSize: 0.92.rem,
    ),
    css('.zone-note-link').styles(fontSize: 0.92.rem),

    // ── Responsive ──────────────────────────────────────────────────────
    css.media(MediaQuery.screen(maxWidth: bpLg.px), [
      css('.zone-grid').styles(
        gap: Gap.all(40.px),
        gridTemplate: const GridTemplate(columns: GridTracks([GridTrack(TrackSize.fr(1))])),
      ),
    ]),
    css.media(MediaQuery.screen(maxWidth: bpMd.px), [
      css('.zone-rings').styles(width: 220.px, height: 220.px),
      css('.zone-ring--3').styles(width: 216.px, height: 216.px),
      css('.zone-ring--2').styles(width: 150.px, height: 150.px),
      css('.zone-ring--1').styles(width: 84.px, height: 84.px),
      css('.zone-facts').styles(gap: Gap.all(16.px)),
      css('.zone-fact-value').styles(fontSize: 0.95.rem),
    ]),
  ];
}
