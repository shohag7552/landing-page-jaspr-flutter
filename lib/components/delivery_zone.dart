import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../content/site_content.dart';
import '../content/site_links.dart';
import '../theme.dart';
import 'ui/icons.dart';

/// "Do we deliver to you?"
///
/// This section is high on the page on purpose. In radius-based local commerce
/// the single biggest bounce cause is a visitor who scrolls an entire site
/// before discovering they're outside the delivery area. Answering it early
/// costs one screen and saves every out-of-zone click; the in-zone reader gets
/// a reason to keep going.
///
/// The radius rings are pure CSS — no map SDK, no API key, no tile bill.
class DeliveryZone extends StatelessComponent {
  const DeliveryZone({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'delivery', classes: 'section section--alt zone', [
      div(classes: 'container', [
        div(classes: 'section-header', [
          span(classes: 'section-eyebrow', [Component.text('Delivery area')]),
          h2(classes: 'section-title', [Component.text('Do we deliver to you?')]),
          p(classes: 'section-copy', [
            Component.text(
              'We deliver within $kDeliveryRadiusKm of our store in $kCity. '
              "Here's where we go, when we're open, and what delivery costs.",
            ),
          ]),
        ]),

        div(classes: 'zone-grid', [
          // Radius visual
          div(classes: 'zone-map', [
            div(classes: 'zone-rings', [
              span(classes: 'zone-ring zone-ring--3', []),
              span(classes: 'zone-ring zone-ring--2', []),
              span(classes: 'zone-ring zone-ring--1', []),
              span(classes: 'zone-pin', [iconMapPin(size: 22)]),
            ]),
            div(classes: 'zone-map-caption', [
              span(classes: 'zone-map-store', [Component.text(kStoreAddress)]),
              span(classes: 'zone-map-radius', [Component.text('$kDeliveryRadiusKm delivery radius')]),
            ]),
          ]),

          div(classes: 'zone-panels', [
            // Areas
            div(classes: 'card zone-card', [
              div(classes: 'zone-card-head', [
                span(classes: 'icon-tile icon-tile--sm', [iconMapPin(size: 18)]),
                h3(classes: 'zone-card-title', [Component.text('Areas we cover')]),
              ]),
              div(classes: 'zone-areas', [
                for (final area in kCoveredAreas) span(classes: 'chip zone-area', [Component.text(area)]),
              ]),
              p(classes: 'zone-note', [
                Component.text('Not on the list? '),
                a(href: kWhatsAppUrl, classes: 'link-arrow zone-note-link', [Component.text('Message us')]),
                Component.text(" — we're adding areas."),
              ]),
            ]),

            div(classes: 'zone-pair', [
              // Hours
              div(classes: 'card zone-card', [
                div(classes: 'zone-card-head', [
                  span(classes: 'icon-tile icon-tile--sm', [iconClock(size: 18)]),
                  h3(classes: 'zone-card-title', [Component.text('Opening hours')]),
                ]),
                div(classes: 'zone-rows', [
                  for (final (day, hours) in kHours)
                    div(classes: 'zone-row', [
                      span(classes: 'zone-row-key', [Component.text(day)]),
                      span(classes: 'zone-row-val', [Component.text(hours)]),
                    ]),
                ]),
              ]),

              // Fees
              div(classes: 'card zone-card', [
                div(classes: 'zone-card-head', [
                  span(classes: 'icon-tile icon-tile--sm', [iconTruck(size: 18)]),
                  h3(classes: 'zone-card-title', [Component.text('Delivery fees')]),
                ]),
                div(classes: 'zone-rows', [
                  for (final (band, fee) in kDeliveryFees)
                    div(classes: 'zone-row', [
                      span(classes: 'zone-row-key', [Component.text(band)]),
                      span(classes: 'zone-row-val', [Component.text(fee)]),
                    ]),
                  div(classes: 'zone-row zone-row--free', [
                    span(classes: 'zone-row-key', [Component.text('Orders over $kFreeDeliveryOver')]),
                    span(classes: 'chip chip--success', [Component.text('Free')]),
                  ]),
                ]),
                p(classes: 'zone-min', [Component.text('Minimum order $kMinimumOrder')]),
              ]),
            ]),
          ]),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.zone-grid').styles(
      display: Display.grid,
      alignItems: AlignItems.start,
      gap: Gap.all(32.px),
      gridTemplate: const GridTemplate(
        columns: GridTracks([GridTrack(TrackSize.fr(0.85)), GridTrack(TrackSize.fr(1.15))]),
      ),
    ),

    // ── Radius visual ───────────────────────────────────────────────────
    css('.zone-map').styles(
      display: Display.flex,
      flexDirection: FlexDirection.column,
      alignItems: AlignItems.center,
      gap: Gap.all(18.px),
      padding: Spacing.symmetric(vertical: 40.px, horizontal: 24.px),
      backgroundColor: Color.variable('--surface-card'),
      raw: {
        'border': '1px solid var(--border-subtle)',
        'border-radius': 'var(--radius-xl)',
        'box-shadow': 'var(--shadow-sm)',
        'background-image': 'radial-gradient(circle at 50% 42%, var(--brand-a10), transparent 62%)',
      },
    ),
    css('.zone-rings').styles(
      display: Display.flex,
      position: Position.relative(),
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.center,
      width: 260.px,
      height: 260.px,
    ),
    css('.zone-ring').styles(
      position: Position.absolute(),
      raw: {'border-radius': '50%', 'border': '1px dashed var(--brand-a28)'},
    ),
    css('.zone-ring--1').styles(width: 96.px, height: 96.px, backgroundColor: Color.variable('--brand-a10')),
    css('.zone-ring--2').styles(width: 176.px, height: 176.px),
    css('.zone-ring--3').styles(width: 256.px, height: 256.px),
    css('.zone-pin').styles(
      display: Display.inlineFlex,
      position: Position.relative(),
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.center,
      width: 48.px,
      height: 48.px,
      backgroundColor: Color.variable('--brand-500'),
      color: Color.variable('--brand-on'),
      raw: {'border-radius': '50%', 'box-shadow': 'var(--shadow-brand)'},
    ),
    css('.zone-map-caption').styles(
      display: Display.flex,
      flexDirection: FlexDirection.column,
      alignItems: AlignItems.center,
      gap: Gap.all(4.px),
      textAlign: TextAlign.center,
    ),
    css('.zone-map-store').styles(
      color: Color.variable('--ink-900'),
      fontSize: 0.95.rem,
      fontWeight: FontWeight.bold,
    ),
    css('.zone-map-radius').styles(
      color: Color.variable('--ink-400'),
      fontSize: 0.85.rem,
    ),

    // ── Panels ──────────────────────────────────────────────────────────
    css('.zone-panels').styles(
      display: Display.flex,
      flexDirection: FlexDirection.column,
      gap: Gap.all(20.px),
    ),
    css('.zone-pair').styles(
      display: Display.grid,
      gap: Gap.all(20.px),
      gridTemplate: const GridTemplate(
        columns: GridTracks([GridTrack(TrackSize.fr(1)), GridTrack(TrackSize.fr(1))]),
      ),
    ),
    css('.zone-card').styles(
      display: Display.flex,
      flexDirection: FlexDirection.column,
      gap: Gap.all(16.px),
    ),
    css('.zone-card-head').styles(
      display: Display.flex,
      alignItems: AlignItems.center,
      gap: Gap.all(12.px),
    ),
    css('.zone-card-title').styles(
      color: Color.variable('--ink-900'),
      fontSize: 1.08.rem,
      fontWeight: FontWeight.bold,
    ),

    css('.zone-areas').styles(
      display: Display.flex,
      flexWrap: FlexWrap.wrap,
      gap: Gap.all(8.px),
    ),
    css('.zone-area').styles(
      backgroundColor: Color.variable('--surface-1'),
      fontSize: 0.83.rem,
      fontWeight: FontWeight.w500,
    ),
    css('.zone-note').styles(
      color: Color.variable('--ink-400'),
      fontSize: 0.88.rem,
      lineHeight: 1.6.em,
    ),
    css('.zone-note-link').styles(fontSize: 0.88.rem),

    css('.zone-rows').styles(
      display: Display.flex,
      flexDirection: FlexDirection.column,
      gap: Gap.all(2.px),
    ),
    css('.zone-row').styles(
      display: Display.flex,
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.spaceBetween,
      gap: Gap.all(12.px),
      padding: Spacing.symmetric(vertical: 10.px),
      raw: {'border-bottom': '1px solid var(--border-subtle)'},
    ),
    css('.zone-row:last-child').styles(raw: {'border-bottom': 'none'}),
    css('.zone-row-key').styles(
      color: Color.variable('--ink-500'),
      fontSize: 0.88.rem,
    ),
    css('.zone-row-val').styles(
      color: Color.variable('--ink-900'),
      fontSize: 0.9.rem,
      fontWeight: FontWeight.w600,
      raw: {'white-space': 'nowrap'},
    ),
    css('.zone-min').styles(
      color: Color.variable('--ink-400'),
      fontSize: 0.82.rem,
    ),

    // ── Responsive ──────────────────────────────────────────────────────
    css.media(MediaQuery.screen(maxWidth: bpLg.px), [
      css('.zone-grid').styles(
        gap: Gap.all(24.px),
        gridTemplate: const GridTemplate(columns: GridTracks([GridTrack(TrackSize.fr(1))])),
      ),
    ]),
    css.media(MediaQuery.screen(maxWidth: bpMd.px), [
      css('.zone-pair').styles(
        gridTemplate: const GridTemplate(columns: GridTracks([GridTrack(TrackSize.fr(1))])),
      ),
      css('.zone-map').styles(padding: Spacing.symmetric(vertical: 30.px, horizontal: 18.px)),
      css('.zone-rings').styles(width: 210.px, height: 210.px),
      css('.zone-ring--3').styles(width: 206.px, height: 206.px),
      css('.zone-ring--2').styles(width: 144.px, height: 144.px),
      css('.zone-ring--1').styles(width: 82.px, height: 82.px),
    ]),
  ];
}
