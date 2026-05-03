import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

class HowItWorks extends StatelessComponent {
  const HowItWorks({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'how-it-works', classes: 'how-it-works', [
      div(classes: 'container', [
        div(classes: 'section-header text-center', [
          span(classes: 'subtitle', [Component.text('HOW IT WORKS')]),
          h2(classes: 'title', [
            Component.text('Get your food & groceries in 4 simple steps'),
          ]),
          p(classes: 'section-copy', [
            Component.text(
              'From browsing to doorstep delivery — ordering has never been easier. Just follow these simple steps and enjoy!',
            ),
          ]),
        ]),
        div(classes: 'steps-grid', [
          _buildStep(
            number: '01',
            icon: '🔍',
            title: 'Browse Menu',
            description: 'Explore our wide range of food & grocery items. Filter by category, search for your favorites.',
            isLast: false,
          ),
          _buildStep(
            number: '02',
            icon: '🛒',
            title: 'Place Your Order',
            description: 'Add items to your cart, choose your payment method, and confirm your order with a single tap.',
            isLast: false,
          ),
          _buildStep(
            number: '03',
            icon: '📍',
            title: 'Track Delivery',
            description: 'Watch your deliveryman in real-time on the map as they pick up and head towards you.',
            isLast: false,
          ),
          _buildStep(
            number: '04',
            icon: '🎉',
            title: 'Enjoy!',
            description: 'Receive your order fresh at your doorstep. Rate your experience and share feedback.',
            isLast: true,
          ),
        ]),
      ]),
    ]);
  }

  Component _buildStep({
    required String number,
    required String icon,
    required String title,
    required String description,
    required bool isLast,
  }) {
    return div(classes: 'step-item', [
      div(classes: 'step-number-wrapper', [
        div(classes: 'step-number', [
          Component.text(number),
        ]),
        if (!isLast) div(classes: 'step-connector', []),
      ]),
      div(classes: 'step-icon', [Component.text(icon)]),
      h3(classes: 'step-title', [Component.text(title)]),
      p(classes: 'step-desc', [Component.text(description)]),
    ]);
  }

  @css
  static final styles = [
    css('.how-it-works').styles(
      padding: Spacing.symmetric(vertical: 112.px, horizontal: 24.px),
      backgroundColor: Colors.white,
    ),
    css('.how-it-works .section-header').styles(
      margin: Spacing.only(bottom: 72.px),
      display: Display.flex,
      flexDirection: FlexDirection.column,
      alignItems: AlignItems.center,
      gap: Gap.all(14.px),
    ),
    css('.steps-grid').styles(
      display: Display.grid,
      maxWidth: 1180.px,
      margin: Spacing.symmetric(horizontal: Unit.auto),
      gridTemplate: const GridTemplate(columns: GridTracks([
        GridTrack(TrackSize.fr(1)),
        GridTrack(TrackSize.fr(1)),
        GridTrack(TrackSize.fr(1)),
        GridTrack(TrackSize.fr(1)),
      ])),
      gap: Gap.all(12.px),
    ),
    css('.step-item').styles(
      display: Display.flex,
      flexDirection: FlexDirection.column,
      alignItems: AlignItems.center,
      textAlign: TextAlign.center,
      padding: Spacing.all(28.px),
      position: Position.relative(),
    ),
    css('.step-number-wrapper').styles(
      display: Display.flex,
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.center,
      margin: Spacing.only(bottom: 24.px),
      position: Position.relative(),
      width: 100.percent,
    ),
    css('.step-number').styles(
      width: 56.px,
      height: 56.px,
      display: Display.flex,
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.center,
      backgroundColor: Color('#E94B1B'),
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 1.1.rem,
      radius: BorderRadius.circular(50.percent),
      position: Position.relative(),
      zIndex: ZIndex(2),
      shadow: BoxShadow(offsetX: 0.px, offsetY: 8.px, blur: 24.px, color: Color.rgba(233, 75, 27, 0.25)),
      fontFamily: const FontFamily.list([FontFamily('Outfit'), FontFamilies.sansSerif]),
    ),
    css('.step-connector').styles(
      position: Position.absolute(top: 28.px, left: 0.px, right: 0.px),
      height: 2.px,
      backgroundColor: Color('#E4E7EC'),
      zIndex: ZIndex(1),
      raw: {'left': '55%', 'right': '-45%'},
    ),
    css('.step-icon').styles(
      fontSize: 2.4.rem,
      margin: Spacing.only(bottom: 18.px),
      lineHeight: 1.em,
    ),
    css('.step-title').styles(
      fontSize: 1.25.rem,
      color: Color('#111827'),
      margin: Spacing.only(bottom: 12.px),
      fontWeight: FontWeight.bold,
    ),
    css('.step-desc').styles(
      color: Color('#667085'),
      lineHeight: 1.65.em,
      fontSize: 0.95.rem,
      margin: Spacing.zero,
      maxWidth: 260.px,
    ),
    css('@media (max-width: 992px)').styles(
      raw: {
        ' .steps-grid': 'grid-template-columns: repeat(2, 1fr); gap: 40px;',
        ' .step-connector': 'display: none;',
      }
    ),
    css('@media (max-width: 640px)').styles(
      raw: {
        ' .steps-grid': 'grid-template-columns: 1fr; gap: 32px;',
      }
    ),
  ];
}
