import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../content/site_strings.dart';
import '../data/landing_data.dart';
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
    final data = LandingScope.of(context);
    final t = data.strings;

    return section(id: 'delivery', classes: 'section section--alt zone', [
      div(classes: 'container zone-grid', [
        div(classes: 'zone-map', [
          // Decorative: it illustrates the radius, it is not a real map. Hidden
          // from screen readers, which would otherwise announce a pile of
          // empty spans between the heading and the area list.
          div(classes: 'zone-rings', attributes: const {'aria-hidden': 'true'}, [
            span(classes: 'zone-ring zone-ring--edge', []),
            span(classes: 'zone-ring zone-ring--core', []),

            // One coverage pulse travelling from the store out to the edge of
            // the radius, and a second half a cycle behind it.
            span(classes: 'zone-pulse zone-pulse--a', []),
            span(classes: 'zone-pulse zone-pulse--b', []),

            span(classes: 'zone-pin', [iconMapPin(size: 22)]),
          ]),
          span(classes: 'zone-map-caption', [
            Component.text(t.zoneMapCaption.fill({'radius': data.deliveryRadius, 'address': data.storeAddress})),
          ]),
        ]),

        div(classes: 'zone-copy', [
          div(classes: 'section-header', [
            span(classes: 'section-eyebrow', [Component.text(t.zoneEyebrow)]),
            h2(classes: 'section-title', [Component.text(t.zoneTitle)]),
            p(classes: 'section-copy', [
              Component.text(t.zoneCopy.fill({'areas': data.areasCovered, 'radius': data.deliveryRadius})),
            ]),
          ]),

          div(classes: 'zone-areas', [
            for (final area in data.coveredAreas)
              span(classes: 'chip zone-area', [Component.text(area)]),
          ]),

          div(classes: 'zone-facts', [
            _fact(t.zoneOpenDaily, data.openingHours),
            _fact(t.zoneDeliveryFrom, data.deliveryFeeFrom),
            _fact(t.zoneFreeOver, data.freeDeliveryOver),
          ]),

          p(classes: 'zone-note', [
            Component.text(t.zoneNotListed),
            a(href: data.whatsappUrl, classes: 'link-arrow zone-note-link', [Component.text(t.zoneMessageUs)]),
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
    // The visual's own palette. Translucent brand colour that reads well on
    // paper-white washes out to almost nothing on near-black, so dark mode
    // pushes each of these up rather than reusing the shared alphas.
    css('.zone').styles(
      raw: {
        '--zone-line-soft': 'color-mix(in srgb, var(--brand-500) 26%, transparent)',
        '--zone-line-strong': 'color-mix(in srgb, var(--brand-500) 45%, transparent)',
        '--zone-glow': 'color-mix(in srgb, var(--brand-500) 16%, transparent)',
        '--zone-pulse-line': 'color-mix(in srgb, var(--brand-500) 70%, transparent)',
      },
    ),
    css('html.dark-mode .zone').styles(
      raw: {
        '--zone-line-soft': 'color-mix(in srgb, var(--brand-500) 45%, transparent)',
        '--zone-line-strong': 'color-mix(in srgb, var(--brand-500) 75%, transparent)',
        '--zone-glow': 'color-mix(in srgb, var(--brand-500) 26%, transparent)',
        '--zone-pulse-line': 'var(--brand-500)',
      },
    ),

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
      raw: {'border-radius': '50%', 'border': '1px solid var(--zone-line-soft)'},
    ),
    // The store and its immediate surroundings. A soft glow rather than a flat
    // fill: a solid disc of translucent brand colour turns muddy on a dark
    // background, this stays clean in both themes.
    css('.zone-ring--core').styles(
      width: 104.px,
      height: 104.px,
      raw: {
        'background': 'radial-gradient(circle, var(--zone-glow) 0%, transparent 72%)',
        'border-color': 'var(--zone-line-strong)',
      },
    ),
    // The edge of the delivery area, drawn as a boundary rather than a band.
    css('.zone-ring--edge').styles(
      width: 276.px,
      height: 276.px,
      raw: {'border-style': 'dashed'},
    ),
    // ── The pin ─────────────────────────────────────────────────────────
    css('.zone-pin').styles(
      display: Display.inlineFlex,
      position: Position.relative(),
      zIndex: const ZIndex(2),
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.center,
      width: 52.px,
      height: 52.px,
      backgroundColor: Color.variable('--brand-500'),
      color: Color.variable('--brand-on'),
      raw: {'border-radius': '50%', 'box-shadow': 'var(--shadow-brand)'},
    ),
    // A halo that breathes under the pin. Pseudo-element rather than another
    // span: it is pure decoration and should not exist in the DOM.
    css('.zone-pin::before').styles(
      position: Position.absolute(),
      raw: {
        'content': '""',
        'inset': '-10px',
        'border-radius': '50%',
        'background': 'var(--zone-glow)',
        'animation': 'zone-halo 3.2s ease-in-out infinite',
      },
    ),

    // ── Coverage pulses ─────────────────────────────────────────────────
    // Sized to the outer ring and scaled up from the pin, so each pulse
    // traces exactly the area the store actually covers.
    css('.zone-pulse').styles(
      position: Position.absolute(),
      width: 276.px,
      height: 276.px,
      raw: {
        'inset': '0',
        'margin': 'auto',
        'border-radius': '50%',
        'border': '1px solid var(--zone-pulse-line)',
        'opacity': '0',
        'animation': 'zone-pulse 5s cubic-bezier(0.22, 0.61, 0.36, 1) infinite',
      },
    ),
    // Half a cycle behind, so only one line ever crosses the open band at a
    // time. Three pulses on a 4.2s loop read as clutter, not as coverage.
    css('.zone-pulse--b').styles(raw: {'animation-delay': '2.5s'}),

    // ── Keyframes ───────────────────────────────────────────────────────
    // `prefers-reduced-motion` is honoured globally (see main.server.dart):
    // it collapses these to a single instant frame, which leaves the pulses
    // invisible and the halo at rest — a clean static diagram.
    css.keyframes('zone-pulse', {
      // Starts at the pin's own size: 52px of 276px.
      '0%': const Styles(raw: {'transform': 'scale(0.19)', 'opacity': '0'}),
      '14%': const Styles(raw: {'opacity': '0.45'}),
      '100%': const Styles(raw: {'transform': 'scale(1)', 'opacity': '0'}),
    }),
    css.keyframes('zone-halo', {
      '0%, 100%': const Styles(raw: {'transform': 'scale(1)', 'opacity': '0.9'}),
      '50%': const Styles(raw: {'transform': 'scale(1.18)', 'opacity': '0.35'}),
    }),
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
      css('.zone-ring--edge').styles(width: 216.px, height: 216.px),
      css('.zone-ring--core').styles(width: 84.px, height: 84.px),
      css('.zone-pulse').styles(width: 216.px, height: 216.px),
      css('.zone-facts').styles(gap: Gap.all(16.px)),
      css('.zone-fact-value').styles(fontSize: 0.95.rem),
    ]),
  ];
}
