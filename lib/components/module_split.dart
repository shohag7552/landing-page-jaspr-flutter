import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../content/site_links.dart';
import '../theme.dart';
import 'ui/icons.dart';

/// Food and Shop, presented as two halves of one order.
///
/// The two cards are deliberately identical in structure — same height, same
/// bullet count, same link treatment — and differ only in their module hue.
/// Visual parity *is* the argument: neither module is the sideshow, and both
/// arrive in one delivery.
class ModuleSplit extends StatelessComponent {
  const ModuleSplit({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'shop', classes: 'section split', [
      div(classes: 'container', [
        div(classes: 'section-header text-center', [
          span(classes: 'section-eyebrow', [Component.text('What we deliver')]),
          h2(classes: 'section-title', [Component.text('Two stores. One cart.')]),
          p(classes: 'section-copy', [
            Component.text('Order a meal and a pair of headphones together. One delivery, one rider.'),
          ]),
        ]),

        div(classes: 'split-grid', [
          _buildModule(
            variant: 'food',
            icon: iconUtensils(size: 26),
            chip: 'Food',
            title: 'Hot meals, made to order',
            points: const [
              'Breakfast, lunch and dinner',
              'Customise before you order',
              'Live prep and delivery time',
            ],
            ctaLabel: 'Browse food',
            ctaHref: kBrowseFoodUrl,
          ),
          _buildModule(
            variant: 'shop',
            icon: iconBag(size: 26),
            chip: 'Shop',
            title: 'Products, picked and packed',
            points: const [
              'Fashion, electronics and home',
              'Flash sales and member offers',
              'Live stock and easy returns',
            ],
            ctaLabel: 'Browse products',
            ctaHref: kBrowseShopUrl,
          ),
        ]),

      ]),
    ]);
  }

  Component _buildModule({
    required String variant,
    required Component icon,
    required String chip,
    required String title,
    required List<String> points,
    required String ctaLabel,
    required String ctaHref,
  }) {
    return div(classes: 'card card--lift split-card split-card--$variant', [
      div(classes: 'split-card-head', [
        span(classes: 'icon-tile icon-tile--$variant', [icon]),
        span(classes: 'chip chip--$variant', [Component.text(chip)]),
      ]),
      h3(classes: 'split-card-title', [Component.text(title)]),
      ul(classes: 'split-points', [
        for (final point in points)
          li(classes: 'split-point', [
            span(classes: 'split-check', [iconCheck(size: 14)]),
            span(classes: 'split-point-text', [Component.text(point)]),
          ]),
      ]),
      a(
        href: ctaHref,
        classes: 'link-arrow split-cta',
        target: Target.blank,
        attributes: const {'rel': 'noopener'},
        [
          Component.text(ctaLabel),
          span(classes: 'btn-icon', [iconArrowRight(size: 17)]),
        ],
      ),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.split-grid').styles(
      display: Display.grid,
      alignItems: AlignItems.stretch,
      gap: Gap.all(26.px),
      gridTemplate: const GridTemplate(
        columns: GridTracks([GridTrack(TrackSize.fr(1)), GridTrack(TrackSize.fr(1))]),
      ),
    ),
    css('.split-card').styles(
      display: Display.flex,
      flexDirection: FlexDirection.column,
      gap: Gap.all(18.px),
      padding: Spacing.all(32.px),
    ),
    css('.split-card-head').styles(
      display: Display.flex,
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.spaceBetween,
      gap: Gap.all(12.px),
    ),
    css('.split-card-title').styles(
      color: Color.variable('--ink-900'),
      fontFamily: const FontFamily.list([FontFamily('Outfit'), FontFamilies.sansSerif]),
      fontSize: 1.5.rem,
      fontWeight: FontWeight.bold,
      lineHeight: 1.22.em,
    ),
    css('.split-points').styles(
      display: Display.flex,
      flexDirection: FlexDirection.column,
      gap: Gap.all(12.px),
      margin: Spacing.zero,
      padding: Spacing.zero,
      // The action link must sit on the same baseline in both cards even when
      // one title wraps to two lines.
      raw: {'list-style': 'none', 'flex': '1'},
    ),
    css('.split-point').styles(
      display: Display.flex,
      alignItems: AlignItems.start,
      gap: Gap.all(11.px),
    ),
    css('.split-check').styles(
      display: Display.inlineFlex,
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.center,
      width: 22.px,
      height: 22.px,
      margin: Spacing.only(top: 1.px),
      backgroundColor: Color.variable('--success-soft'),
      color: Color.variable('--success-ink'),
      raw: {'border-radius': '50%', 'flex-shrink': '0'},
    ),
    css('.split-point-text').styles(
      color: Color.variable('--ink-500'),
      fontSize: 0.96.rem,
      lineHeight: 1.55.em,
    ),
    css('.split-cta').styles(margin: Spacing.only(top: 4.px)),
    css('.split-card--shop .split-cta').styles(color: Color.variable('--module-shop')),


    css.media(MediaQuery.screen(maxWidth: bpLg.px), [
      css('.split-grid').styles(
        gap: Gap.all(20.px),
        gridTemplate: const GridTemplate(columns: GridTracks([GridTrack(TrackSize.fr(1))])),
      ),
    ]),
    css.media(MediaQuery.screen(maxWidth: bpMd.px), [
      css('.split-card').styles(padding: Spacing.all(24.px)),
      css('.split-card-title').styles(fontSize: 1.32.rem),
    ]),
  ];
}
