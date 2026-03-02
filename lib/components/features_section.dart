import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

class FeaturesSection extends StatelessComponent {
  const FeaturesSection({super.key});

  @override
  Component build(BuildContext context) {

    return section(id: 'features', classes: 'features-section', [
      div(classes: 'container', [
        div(classes: 'section-header text-center', [
          span(classes: 'subtitle', [text('WHAT WE SERVE')]),
          h2(classes: 'title', [text('Your Favorite Food Delivery Partner')]),
        ]),
        div(classes: 'features-grid', [
          _buildFeatureCard(
            icon: '🛵',
            title: 'Easy To Order',
            description: 'You only need a few steps in ordering food.',
          ),
          _buildFeatureCard(
            icon: '📦',
            title: 'Fastest Delivery',
            description: 'Delivery that is always on time even faster.',
          ),
          _buildFeatureCard(
            icon: '🍽️',
            title: 'Best Quality',
            description: 'Not only fast for us quality is also number one.',
          ),
        ])
      ])
    ]);
  
  }

  Component _buildFeatureCard({required String icon, required String title, required String description}) {
    return div(classes: 'feature-card', [
      div(classes: 'feature-icon-wrapper', [
        div(classes: 'icon-bg', []),
        span(classes: 'icon-emoji', [text(icon)]),
      ]),
      h3(classes: 'feature-title', [text(title)]),
      p(classes: 'feature-desc', [text(description)]),
    ]);
  }

  @css
  static final styles = [
    css('.features-section').styles(
      padding: Spacing.symmetric(vertical: 100.px),
      backgroundColor: Colors.white,
    ),
    css('.section-header').styles(
      margin: Spacing.only(bottom: 64.px),
      display: Display.flex,
      flexDirection: FlexDirection.column,
      alignItems: AlignItems.center,
      gap: Gap.all(16.px),
    ),
    css('.text-center').styles(
      textAlign: TextAlign.center,
    ),
    css('.subtitle').styles(
      color: Color('#FF5E1E'),
      fontWeight: FontWeight.bold,
      letterSpacing: 2.px,
      fontSize: 1.rem,
    ),
    css('.title').styles(
      fontSize: 2.5.rem,
      color: Color('#0F172A'),
      maxWidth: 600.px,
      lineHeight: 1.2.em,
    ),
    css('.features-grid').styles(
      display: Display.grid,
      gridTemplate: const GridTemplate(columns: GridTracks([
        GridTrack(TrackSize.fr(1)),
        GridTrack(TrackSize.fr(1)),
        GridTrack(TrackSize.fr(1)),
      ])),
      gap: Gap.all(40.px),
      maxWidth: 1000.px,
      margin: Spacing.symmetric(horizontal: Unit.auto),
    ),
    css('.feature-card').styles(
      display: Display.flex,
      flexDirection: FlexDirection.column,
      alignItems: AlignItems.center,
      textAlign: TextAlign.center,
      padding: Spacing.all(32.px),
      radius: BorderRadius.circular(24.px),
      transition: Transition('all', duration: Duration(milliseconds: 300)),
      cursor: Cursor.pointer,
    ),
    css('.feature-card:hover').styles(
      backgroundColor: Colors.white,
      shadow: BoxShadow(offsetX: 0.px, offsetY: 24.px, blur: 48.px, color: Color.rgba(0,0,0,0.06)),
      transform: Transform.translate(y: (-8).px),
    ),
    css('.feature-icon-wrapper').styles(
      position: Position.relative(),
      width: 120.px,
      height: 120.px,
      display: Display.flex,
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.center,
      margin: Spacing.only(bottom: 24.px),
    ),
    css('.icon-bg').styles(
      position: Position.absolute(top: 0.px, left: 0.px, right: 0.px, bottom: 0.px),
      backgroundColor: Color('#FFF5F2'),
      radius: BorderRadius.circular(50.percent),
      transition: Transition('all', duration: Duration(milliseconds: 300)),
    ),
    css('.feature-card:hover .icon-bg').styles(
      transform: Transform.scale(1.1),
      backgroundColor: Color('#FF5E1E'),
    ),
    css('.icon-emoji').styles(
      fontSize: 3.rem,
      position: Position.relative(),
      zIndex: ZIndex(10),
    ),
    css('.feature-title').styles(
      fontSize: 1.5.rem,
      color: Color('#0F172A'),
      margin: Spacing.only(bottom: 16.px),
    ),
    css('.feature-desc').styles(
      color: Color('#64748B'),
      lineHeight: 1.6.em,
    ),
    css('@media (max-width: 992px)').styles(
      raw: {
        ' .features-grid': 'grid-template-columns: repeat(2, 1fr); gap: 32px;',
      }
    ),
    css('@media (max-width: 768px)').styles(
      raw: {
        ' .features-grid': 'grid-template-columns: 1fr; gap: 40px;',
        ' .title': 'font-size: 2rem;',
      }
    )
  ];
}
