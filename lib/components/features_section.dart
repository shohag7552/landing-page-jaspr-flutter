import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

class FeaturesSection extends StatelessComponent {
  const FeaturesSection({super.key});

  @override
  Component build(BuildContext context) {

    return section(id: 'features', classes: 'features-section', [
      div(classes: 'container', [
        div(classes: 'section-header text-center', [
          span(classes: 'subtitle', [Component.text('PLATFORM CAPABILITIES')]),
          h2(classes: 'title', [
            Component.text('Built for fast orders, confident customers, and scalable restaurant growth.'),
          ]),
          p(classes: 'section-copy', [
            Component.text(
              'From checkout to dispatch, every workflow is designed to reduce friction for diners while giving operators the visibility they need to run at volume.',
            ),
          ]),
        ]),
        div(classes: 'features-grid', [
          _buildFeatureCard(
            icon: 'LIVE',
            title: 'Real-time order tracking',
            description:
                'Customers see every handoff as it happens, while support teams get live status context before tickets ever escalate.',
          ),
          _buildFeatureCard(
            icon: 'PAY',
            title: 'Seamless payment flow',
            description:
                'A polished checkout experience keeps orders moving with clear totals, secure payment readiness, and fewer abandoned carts.',
          ),
          _buildFeatureCard(
            icon: 'API',
            title: 'Robust backend architecture',
            description:
                'Scalable services, reliable data flows, and integration-friendly patterns support restaurant networks, riders, and admin teams.',
          ),
        ])
      ])
    ]);
  
  }

  Component _buildFeatureCard({required String icon, required String title, required String description}) {
    return div(classes: 'feature-card', [
      div(classes: 'feature-icon-wrapper', [
        span(classes: 'icon-emoji', [Component.text(icon)]),
      ]),
      h3(classes: 'feature-title', [Component.text(title)]),
      p(classes: 'feature-desc', [Component.text(description)]),
    ]);
  }

  @css
  static final styles = [
    css('.features-section').styles(
      padding: Spacing.symmetric(vertical: 112.px, horizontal: 24.px),
      backgroundColor: Colors.white,
    ),
    css('.section-header').styles(
      margin: Spacing.only(bottom: 58.px),
      display: Display.flex,
      flexDirection: FlexDirection.column,
      alignItems: AlignItems.center,
      gap: Gap.all(14.px),
    ),
    css('.text-center').styles(
      textAlign: TextAlign.center,
    ),
    css('.subtitle').styles(
      color: Color('#E94B1B'),
      fontWeight: FontWeight.bold,
      letterSpacing: 1.8.px,
      fontSize: 0.82.rem,
    ),
    css('.title').styles(
      fontSize: 2.75.rem,
      color: Color('#111827'),
      maxWidth: 780.px,
      lineHeight: 1.12.em,
      letterSpacing: 0.px,
    ),
    css('.section-copy').styles(
      color: Color('#667085'),
      fontSize: 1.05.rem,
      lineHeight: 1.7.em,
      maxWidth: 720.px,
      margin: Spacing.zero,
    ),
    css('.features-grid').styles(
      display: Display.grid,
      maxWidth: 1080.px,
      margin: Spacing.symmetric(horizontal: Unit.auto),
      gridTemplate: const GridTemplate(columns: GridTracks([
        GridTrack(TrackSize.fr(1)),
        GridTrack(TrackSize.fr(1)),
        GridTrack(TrackSize.fr(1)),
      ])),
      gap: Gap.all(24.px),
    ),
    css('.feature-card').styles(
      display: Display.flex,
      flexDirection: FlexDirection.column,
      alignItems: AlignItems.start,
      textAlign: TextAlign.left,
      padding: Spacing.all(34.px),
      radius: BorderRadius.circular(22.px),
      transition: Transition('all', duration: Duration(milliseconds: 300)),
      cursor: Cursor.pointer,
      backgroundColor: Color('#FFFFFF'),
      raw: {'border': '1px solid rgba(17, 24, 39, 0.08)'},
    ),
    css('.feature-card:hover').styles(
      shadow: BoxShadow(offsetX: 0.px, offsetY: 26.px, blur: 56.px, color: Color.rgba(17,24,39,0.10)),
      transform: Transform.translate(y: (-6).px),
      raw: {'border-color': 'rgba(233, 75, 27, 0.28)'},
    ),
    css('.feature-icon-wrapper').styles(
      position: Position.relative(),
      width: 64.px,
      height: 64.px,
      display: Display.flex,
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.center,
      margin: Spacing.only(bottom: 24.px),
      radius: BorderRadius.circular(18.px),
      backgroundColor: Color('#FFF0E8'),
    ),
    css('.icon-emoji').styles(
      fontSize: 0.86.rem,
      position: Position.relative(),
      zIndex: ZIndex(10),
      color: Color('#E94B1B'),
      fontWeight: FontWeight.bold,
      letterSpacing: 0.8.px,
    ),
    css('.feature-title').styles(
      fontSize: 1.35.rem,
      color: Color('#111827'),
      margin: Spacing.only(bottom: 14.px),
    ),
    css('.feature-desc').styles(
      color: Color('#667085'),
      lineHeight: 1.7.em,
      margin: Spacing.zero,
    ),
    css('@media (max-width: 992px)').styles(
      raw: {
        ' .features-grid': 'grid-template-columns: repeat(2, 1fr); gap: 32px;',
      }
    ),
    css('@media (max-width: 768px)').styles(
      raw: {
        ' .features-grid': 'grid-template-columns: 1fr; gap: 20px;',
        ' .title': 'font-size: 2rem;',
      }
    )
  ];
}
