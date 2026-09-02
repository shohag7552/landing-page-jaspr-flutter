import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../content/site_content.dart';
import '../theme.dart';
import 'ui/icons.dart';

/// Six consumer benefits.
///
/// Note what these are *not*: platform capabilities. A shopper does not care
/// that the system supports real-time dispatch — they care that they get told
/// when the food leaves. Every line here is written from the customer's side
/// of the door.
class FeaturesSection extends StatelessComponent {
  const FeaturesSection({super.key});

  static final _features = <(Component, String, String)>[
    (
      iconSearch(size: 24),
      'Easy ordering',
      'Search once and find it — meals and groceries sit in the same app, in the same cart.',
    ),
    (
      iconRoute(size: 24),
      'Live tracking',
      "Watch your order move from our counter to your street. No wondering where it's got to.",
    ),
    (
      iconClock(size: 24),
      'Honest ETAs',
      'We show the time it will really take, and update it if the road disagrees.',
    ),
    (
      iconCreditCard(size: 24),
      'Pay your way',
      'Card, digital wallet, or cash at the door. Your details stay encrypted.',
    ),
    (
      iconBell(size: 24),
      'Order updates',
      'A nudge when it is accepted, packed, picked up and arriving. Nothing more.',
    ),
    (
      iconStar(size: 24),
      'Rate & review',
      'Tell us how it went. We read every one, and it shapes what we stock and cook.',
    ),
  ];

  @override
  Component build(BuildContext context) {
    return section(id: 'features', classes: 'section features', [
      div(classes: 'container', [
        div(classes: 'section-header text-center', [
          span(classes: 'section-eyebrow', [Component.text('Why $kBrandName')]),
          h2(classes: 'section-title', [Component.text('Built to make ordering effortless')]),
          p(classes: 'section-copy', [
            Component.text('The small things that decide whether you order from us again.'),
          ]),
        ]),

        div(classes: 'features-grid', [
          for (final (icon, title, desc) in _features)
            div(classes: 'card card--lift feature-card', [
              span(classes: 'icon-tile feature-icon', [icon]),
              h3(classes: 'feature-title', [Component.text(title)]),
              p(classes: 'feature-desc', [Component.text(desc)]),
            ]),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.features-grid').styles(
      display: Display.grid,
      gap: Gap.all(22.px),
      gridTemplate: const GridTemplate(
        columns: GridTracks([
          GridTrack(TrackSize.fr(1)),
          GridTrack(TrackSize.fr(1)),
          GridTrack(TrackSize.fr(1)),
        ]),
      ),
    ),
    css('.feature-card').styles(
      display: Display.flex,
      flexDirection: FlexDirection.column,
      gap: Gap.all(14.px),
    ),
    css('.feature-title').styles(
      color: Color.variable('--ink-900'),
      fontSize: 1.1.rem,
      fontWeight: FontWeight.bold,
    ),
    css('.feature-desc').styles(
      color: Color.variable('--ink-400'),
      fontSize: 0.94.rem,
      lineHeight: 1.65.em,
    ),

    css.media(MediaQuery.screen(maxWidth: bpLg.px), [
      css('.features-grid').styles(
        gridTemplate: const GridTemplate(
          columns: GridTracks([GridTrack(TrackSize.fr(1)), GridTrack(TrackSize.fr(1))]),
        ),
      ),
    ]),
    css.media(MediaQuery.screen(maxWidth: bpSm.px), [
      css('.features-grid').styles(
        gap: Gap.all(14.px),
        gridTemplate: const GridTemplate(columns: GridTracks([GridTrack(TrackSize.fr(1))])),
      ),
    ]),
  ];
}
