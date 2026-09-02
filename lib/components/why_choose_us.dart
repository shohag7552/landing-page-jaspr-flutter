import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../theme.dart';
import 'ui/icons.dart';

/// A slim reassurance band, sitting directly under the hero.
///
/// This used to be a second bordered card grid, near-identical to the features
/// section two sections further down. Two card grids that look the same is a
/// repetition the reader feels even if they can't name it — so this one gives
/// up its cards and becomes the classic under-hero trust bar instead.
class WhyChooseUs extends StatelessComponent {
  const WhyChooseUs({super.key});

  static final _points = <(Component, String)>[
    (iconTruck(size: 20), 'Fast local delivery'),
    (iconRoute(size: 20), 'Live rider tracking'),
    (iconCreditCard(size: 20), 'Card, wallet or cash'),
    (iconHeadset(size: 20), 'Real people on support'),
  ];

  @override
  Component build(BuildContext context) {
    return section(classes: 'reassurance', [
      div(classes: 'container reassurance-row', [
        for (final (icon, label) in _points)
          div(classes: 'reassurance-item', [
            span(classes: 'reassurance-icon', [icon]),
            span(classes: 'reassurance-label', [Component.text(label)]),
          ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.reassurance').styles(
      padding: Spacing.symmetric(vertical: 26.px),
      backgroundColor: Color.variable('--surface-1'),
      raw: {'border-top': '1px solid var(--border-subtle)', 'border-bottom': '1px solid var(--border-subtle)'},
    ),
    css('.reassurance-row').styles(
      display: Display.grid,
      alignItems: AlignItems.center,
      gap: Gap.all(20.px),
      gridTemplate: const GridTemplate(
        columns: GridTracks([
          GridTrack(TrackSize.fr(1)),
          GridTrack(TrackSize.fr(1)),
          GridTrack(TrackSize.fr(1)),
          GridTrack(TrackSize.fr(1)),
        ]),
      ),
    ),
    css('.reassurance-item').styles(
      display: Display.flex,
      alignItems: AlignItems.center,
      gap: Gap.all(11.px),
    ),
    css('.reassurance-icon').styles(
      display: Display.inlineFlex,
      color: Color.variable('--brand-500'),
      raw: {'flex-shrink': '0'},
    ),
    css('.reassurance-label').styles(
      color: Color.variable('--ink-700'),
      fontSize: 0.93.rem,
      fontWeight: FontWeight.w600,
      lineHeight: 1.35.em,
    ),

    css.media(MediaQuery.screen(maxWidth: bpMd.px), [
      css('.reassurance').styles(padding: Spacing.symmetric(vertical: 20.px)),
      css('.reassurance-row').styles(
        gap: Gap.all(14.px),
        gridTemplate: const GridTemplate(
          columns: GridTracks([GridTrack(TrackSize.fr(1)), GridTrack(TrackSize.fr(1))]),
        ),
      ),
      css('.reassurance-label').styles(fontSize: 0.87.rem),
    ]),
    css.media(MediaQuery.screen(maxWidth: bpSm.px), [
      css('.reassurance-label').styles(fontSize: 0.82.rem),
      css('.reassurance-item').styles(gap: Gap.all(9.px)),
    ]),
  ];
}
