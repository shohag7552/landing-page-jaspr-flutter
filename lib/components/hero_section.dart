import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

class HeroSection extends StatelessComponent {
  const HeroSection({super.key});

  @override
  Component build(BuildContext context) {

    return section(classes: 'hero', [
      div(classes: 'hero-container container', [
        // Left Content
        div(classes: 'hero-content', [
          div(classes: 'hero-badge', [
            span(classes: 'badge-icon', [text('🏍️')]),
            span(classes: 'badge-text', [text('Fastest Delivery in Town')]),
          ]),
          h1(classes: 'hero-title', [
            text('Claim Best Offer\non Fast '),
            span(classes: 'text-primary', [text('Food')]),
            br(),
            span(classes: 'text-primary', [text('Delivery')]),
          ]),
          p(classes: 'hero-subtitle', [
            text('Experience the convenience of having your favorite meals delivered straight to your door. Fresh, hot, and lightning fast.'),
          ]),
          div(classes: 'hero-actions', [
            button(classes: 'btn btn-primary btn-lg', [
              text('Order Now'),
              span(classes: 'icon', [text('→')]),
            ]),
            button(classes: 'btn btn-outline btn-lg', [
              span(classes: 'icon-play', [text('▶')]),
              text('How to Order'),
            ]),
          ]),
          div(classes: 'hero-stats', [
            _buildStat('4.9', 'Customer Rating', '⭐'),
            _buildStat('200+', 'Restaurants', '🏪'),
            _buildStat('Top', 'Quality Food', '🏆'),
          ])
        ]),

        // Right Content / Image Area
        div(classes: 'hero-visual', [
          div(classes: 'visual-backdrop', []),
          img(
            src: 'https://images.unsplash.com/photo-1504674900247-0877df9cc836?q=80&w=2070&auto=format&fit=crop',
            alt: 'Delicious food banner',
            classes: 'hero-image',
          ),
          // Floating Card
          div(classes: 'floating-card', [
            div(classes: 'card-icon', [text('🛵')]),
            div(classes: 'card-content', [
              span(classes: 'card-title', [text('Fast Delivery')]),
              span(classes: 'card-subtitle', [text('Under 30 mins')]),
            ])
          ])
        ])
      ])
    ]);
  
  }

  Component _buildStat(String value, String label, String icon) {
    return div(classes: 'stat-item', [
      div(classes: 'stat-icon', [text(icon)]),
      div(classes: 'stat-info', [
        span(classes: 'stat-value', [text(value)]),
        span(classes: 'stat-label', [text(label)]),
      ])
    ]);
  }

  @css
  static final styles = [
    css('.hero').styles(
      padding: Spacing.only(top: 140.px, bottom: 80.px),
      // backgroundColor: Color('#6836E7'),
      backgroundColor: Color('#F8FAFC'),
      position: Position.relative(),
      overflow: Overflow.hidden,
      minHeight: 100.vh,
      display: Display.flex,
      alignItems: AlignItems.center,
    ),
    css('.hero-container').styles(
      display: Display.grid,
      gridTemplate: const GridTemplate(columns: GridTracks([GridTrack(TrackSize.fr(1)), GridTrack(TrackSize.fr(1))])),
      gap: Gap.all(64.px),
      alignItems: AlignItems.center,
      maxWidth: 1200.px,
      margin: Spacing.symmetric(horizontal: Unit.auto),
      padding: Spacing.symmetric(horizontal: 24.px),
    ),
    css('.hero-badge').styles(
      display: Display.inlineFlex,
      alignItems: AlignItems.center,
      gap: Gap.all(8.px),
      padding: Spacing.symmetric(horizontal: 16.px, vertical: 8.px),
      backgroundColor: Color('#FFF5F2'),
      radius: BorderRadius.circular(50.px),
      margin: Spacing.only(bottom: 24.px),
    ),
    css('.badge-text').styles(
      color: Color('#FF5E1E'),
      fontWeight: FontWeight.w600,
      fontSize: 0.875.rem,
    ),
    css('.hero-title').styles(
      fontSize: 4.5.rem,
      lineHeight: 1.1.em,
      color: Color('#0F172A'),
      margin: Spacing.only(bottom: 24.px),
      letterSpacing: (-1).px,
    ),
    css('.hero-subtitle').styles(
      fontSize: 1.125.rem,
      color: Color('#64748B'),
      lineHeight: 1.6.em,
      margin: Spacing.only(bottom: 40.px),
      maxWidth: 480.px,
    ),
    css('.hero-actions').styles(
      display: Display.flex,
      gap: Gap.all(16.px),
      margin: Spacing.only(bottom: 48.px),
    ),
    css('.btn-lg').styles(
      padding: Spacing.symmetric(horizontal: 32.px, vertical: 16.px),
      fontSize: 1.125.rem,
    ),
    css('.btn-outline').styles(
      backgroundColor: Colors.transparent,
      color: Color('#1E293B'),
      raw: {'border': '1px solid #E2E8F0'},
      shadow: BoxShadow(offsetX: 0.px, offsetY: 4.px, blur: 6.px, color: Color.rgba(0,0,0,0.02)),
    ),
    css('.btn-outline:hover').styles(
      raw: {'border-color': '#FF5E1E'},
      color: Color('#FF5E1E'),
      backgroundColor: Color('#FFF5F2'),
    ),
    css('.icon-play').styles(
      display: Display.flex,
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.center,
      width: 24.px,
      height: 24.px,
      backgroundColor: Color('#FF5E1E'),
      color: Colors.white,
      radius: BorderRadius.circular(50.percent),
      fontSize: 0.75.rem,
    ),
    css('.hero-stats').styles(
      display: Display.flex,
      gap: Gap.all(32.px),
      raw: {'border-top': '1px solid #E2E8F0'},
      padding: Spacing.only(top: 32.px),
    ),
    css('.stat-item').styles(
      display: Display.flex,
      alignItems: AlignItems.center,
      gap: Gap.all(12.px),
    ),
    css('.stat-icon').styles(
      fontSize: 1.5.rem,
      backgroundColor: Colors.white,
      width: 40.px,
      height: 40.px,
      display: Display.flex,
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.center,
      radius: BorderRadius.circular(50.percent),
      shadow: BoxShadow(offsetX: 0.px, offsetY: 4.px, blur: 12.px, color: Color.rgba(0,0,0,0.05)),
    ),
    css('.stat-info').styles(
      display: Display.flex,
      flexDirection: FlexDirection.column,
    ),
    css('.stat-value').styles(
      fontWeight: FontWeight.bold,
      color: Color('#0F172A'),
      fontSize: 1.125.rem,
    ),
    css('.stat-label').styles(
      color: Color('#64748B'),
      fontSize: 0.875.rem,
    ),
    css('.hero-visual').styles(
      position: Position.relative(),
    ),
    css('.visual-backdrop').styles(
      position: Position.absolute(top: 10.percent, right: (-10).percent, bottom: (-10).percent, left: 10.percent),
      backgroundColor: Color('#FF5E1E'),
      radius: BorderRadius.circular(50.percent),
      opacity: 0.1,
      filter: Filter.blur(100.px),
    ),
    css('.hero-image').styles(
      width: 100.percent,
      height: Unit.auto,
      radius: BorderRadius.circular(32.px),
      shadow: BoxShadow(offsetX: 0.px, offsetY: 24.px, blur: 48.px, color: Color.rgba(0,0,0,0.1)),
      position: Position.relative(),
      zIndex: ZIndex(10),
    ),
    css('.floating-card').styles(
      position: Position.absolute(bottom: (-24).px, left: (-24).px),
      backgroundColor: Colors.white,
      padding: Spacing.symmetric(horizontal: 24.px, vertical: 16.px),
      radius: BorderRadius.circular(16.px),
      display: Display.flex,
      alignItems: AlignItems.center,
      gap: Gap.all(16.px),
      shadow: BoxShadow(offsetX: 0.px, offsetY: 12.px, blur: 24.px, color: Color.rgba(0,0,0,0.08)),
      zIndex: ZIndex(20),
      raw: {'animation': 'bounce 3s infinite ease-in-out'},
    ),
    css('.card-icon').styles(
      fontSize: 2.rem,
      backgroundColor: Color('#FFF5F2'),
      width: 48.px,
      height: 48.px,
      display: Display.flex,
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.center,
      radius: BorderRadius.circular(12.px),
    ),
    css('.card-content').styles(
      display: Display.flex,
      flexDirection: FlexDirection.column,
    ),
    css('.card-title').styles(
      fontWeight: FontWeight.bold,
      color: Color('#0F172A'),
    ),
    css('.card-subtitle').styles(
      color: Color('#64748B'),
      fontSize: 0.875.rem,
    ),
    // Media Query for smaller screens
    css('@media (max-width: 992px)').styles(
      raw: {
        ' .hero-container': 'grid-template-columns: 1fr; gap: 48px; text-align: center;',
        ' .hero-badge': 'margin: 0 auto 24px;',
        ' .hero-title': 'font-size: 3.5rem;',
        ' .hero-subtitle': 'margin: 0 auto 40px;',
        ' .hero-actions': 'justify-content: center;',
        ' .hero-stats': 'justify-content: center;',
      }
    ),
    css('@media (max-width: 768px)').styles(
      raw: {
        ' .hero-title': 'font-size: 2.5rem;',
        ' .hero-actions': 'flex-direction: column; width: 100%;',
        ' .btn-lg': 'width: 100%; justify-content: center;',
        ' .hero-stats': 'flex-wrap: wrap;',
        ' .floating-card': 'bottom: -16px; left: 16px; right: 16px;',
      }
    )
  ];
}
