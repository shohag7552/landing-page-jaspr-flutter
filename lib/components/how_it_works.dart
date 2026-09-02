import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../theme.dart';
import 'ui/icons.dart';

/// Four steps, module-neutral.
///
/// Step 03 is where the rider enters the story; the section that follows picks
/// him up and makes the delivery promise explicit.
class HowItWorks extends StatelessComponent {
  const HowItWorks({super.key});

  static final _steps = <(String, Component, String, String)>[
    (
      '01',
      iconSearch(size: 22),
      'Browse food & shop',
      'Open the app or the website and add anything you like — a hot meal, your weekly groceries, or both.',
    ),
    (
      '02',
      iconCart(size: 22),
      'Place your order',
      'Checkout in a few taps. Pay by card, wallet or cash at the door — whichever suits you.',
    ),
    (
      '03',
      iconTruck(size: 22),
      'We pack it, a rider picks it up',
      'Our team packs your order and hands it to one of our own riders, who sets off straight to you.',
    ),
    (
      '04',
      iconHome(size: 22),
      'Delivered to your door',
      'Watch the rider approach on the live map and get a knock when your order arrives.',
    ),
  ];

  @override
  Component build(BuildContext context) {
    return section(id: 'how-it-works', classes: 'section steps', [
      div(classes: 'container', [
        div(classes: 'section-header text-center', [
          span(classes: 'section-eyebrow', [Component.text('How it works')]),
          h2(classes: 'section-title', [Component.text('From your screen to your door in four steps')]),
          p(classes: 'section-copy', [
            Component.text('No phone calls, no guessing when it will turn up.'),
          ]),
        ]),

        div(classes: 'steps-grid', [
          for (final (number, icon, title, desc) in _steps)
            div(classes: 'step-item', [
              span(classes: 'step-number', [Component.text(number)]),
              span(classes: 'icon-tile step-icon', [icon]),
              h3(classes: 'step-title', [Component.text(title)]),
              p(classes: 'step-desc', [Component.text(desc)]),
            ]),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.steps-grid').styles(
      display: Display.grid,
      alignItems: AlignItems.start,
      gap: Gap.all(24.px),
      gridTemplate: const GridTemplate(
        columns: GridTracks([
          GridTrack(TrackSize.fr(1)),
          GridTrack(TrackSize.fr(1)),
          GridTrack(TrackSize.fr(1)),
          GridTrack(TrackSize.fr(1)),
        ]),
      ),
    ),
    css('.step-item').styles(
      display: Display.flex,
      position: Position.relative(),
      flexDirection: FlexDirection.column,
      gap: Gap.all(13.px),
      padding: Spacing.all(26.px),
      backgroundColor: Color.variable('--surface-card'),
      raw: {
        'border': '1px solid var(--border-subtle)',
        'border-radius': 'var(--radius-lg)',
        'box-shadow': 'var(--shadow-sm)',
      },
    ),
    css('.step-number').styles(
      position: Position.absolute(top: 20.px, right: 22.px),
      color: Color.variable('--ink-900'),
      fontFamily: const FontFamily.list([FontFamily('Outfit'), FontFamilies.sansSerif]),
      fontSize: 1.5.rem,
      fontWeight: FontWeight.w800,
      opacity: 0.1,
    ),
    css('.step-icon').styles(width: 48.px, height: 48.px),
    css('.step-title').styles(
      color: Color.variable('--ink-900'),
      fontSize: 1.08.rem,
      fontWeight: FontWeight.bold,
      lineHeight: 1.3.em,
    ),
    css('.step-desc').styles(
      color: Color.variable('--ink-400'),
      fontSize: 0.93.rem,
      lineHeight: 1.62.em,
    ),

    css.media(MediaQuery.screen(maxWidth: bpLg.px), [
      css('.steps-grid').styles(
        gridTemplate: const GridTemplate(
          columns: GridTracks([GridTrack(TrackSize.fr(1)), GridTrack(TrackSize.fr(1))]),
        ),
      ),
    ]),
    css.media(MediaQuery.screen(maxWidth: bpSm.px), [
      css('.steps-grid').styles(
        gap: Gap.all(14.px),
        gridTemplate: const GridTemplate(columns: GridTracks([GridTrack(TrackSize.fr(1))])),
      ),
      css('.step-item').styles(padding: Spacing.all(20.px)),
    ]),
  ];
}
