import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

class OurPlatform extends StatelessComponent {
  const OurPlatform({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'platform', classes: 'our-platform', [
      div(classes: 'container', [
        div(classes: 'section-header text-center', [
          span(classes: 'subtitle', [Component.text('OUR PLATFORM')]),
          h2(classes: 'title', [
            Component.text('Two powerful apps, one seamless experience'),
          ]),
          p(classes: 'section-copy', [
            Component.text(
              'Whether you\'re ordering your favorite meals or delivering them — our apps are designed to make every step smooth, fast, and reliable.',
            ),
          ]),
        ]),
        div(classes: 'platform-grid', [
          // User App Card
          div(classes: 'platform-card user-card', [
            div(classes: 'platform-card-header', [
              div(classes: 'platform-icon-wrapper user-icon', [
                span(classes: 'platform-icon', [Component.text('📱')]),
              ]),
              div(classes: 'platform-badge user-badge', [
                Component.text('Customer App'),
              ]),
            ]),
            h3(classes: 'platform-title', [
              Component.text('Order with Ease'),
            ]),
            p(classes: 'platform-desc', [
              Component.text(
                'Browse products, place orders, and track your delivery in real-time — all from one intuitive app.',
              ),
            ]),
            ul(classes: 'platform-features', [
              _buildFeatureItem('Browse food & grocery items by category'),
              _buildFeatureItem('Add to cart and checkout seamlessly'),
              _buildFeatureItem('Track deliveryman live on the map'),
              _buildFeatureItem('Get real-time order status notifications'),
              _buildFeatureItem('Multiple payment options available'),
              _buildFeatureItem('Rate & review your orders'),
            ]),
            button(classes: 'btn btn-primary platform-cta', [
              Component.text('Download User App'),
              span(classes: 'icon', [Component.text('→')]),
            ]),
          ]),

          // Delivery App Card
          div(classes: 'platform-card delivery-card', [
            div(classes: 'platform-card-header', [
              div(classes: 'platform-icon-wrapper delivery-icon', [
                span(classes: 'platform-icon', [Component.text('🚚')]),
              ]),
              div(classes: 'platform-badge delivery-badge', [
                Component.text('Delivery App'),
              ]),
            ]),
            h3(classes: 'platform-title', [
              Component.text('Deliver & Earn'),
            ]),
            p(classes: 'platform-desc', [
              Component.text(
                'Accept delivery requests, navigate to locations, and manage your earnings — all in one powerful delivery app.',
              ),
            ]),
            ul(classes: 'platform-features', [
              _buildFeatureItem('Receive and accept delivery requests'),
              _buildFeatureItem('Get optimized navigation to pickup & drop'),
              _buildFeatureItem('Update order status in real-time'),
              _buildFeatureItem('Track your daily & weekly earnings'),
              _buildFeatureItem('Manage your availability schedule'),
              _buildFeatureItem('View delivery history & statistics'),
            ]),
            button(classes: 'btn btn-outline platform-cta', [
              Component.text('Download Delivery App'),
              span(classes: 'icon', [Component.text('→')]),
            ]),
          ]),
        ]),
      ]),
    ]);
  }

  Component _buildFeatureItem(String text) {
    return li(classes: 'platform-feature-item', [
      span(classes: 'check-icon', [Component.text('✓')]),
      Component.text(text),
    ]);
  }

  @css
  static final styles = [
    css('.our-platform').styles(
      padding: Spacing.symmetric(vertical: 112.px, horizontal: 24.px),
      backgroundColor: Color('#F8FAFC'),
    ),
    css('.our-platform .container').styles(
      width: 100.percent,
      maxWidth: 1180.px,
      margin: Spacing.symmetric(horizontal: Unit.auto),
    ),
    css('.our-platform .section-header').styles(
      margin: Spacing.only(bottom: 64.px),
      display: Display.flex,
      flexDirection: FlexDirection.column,
      alignItems: AlignItems.center,
      gap: Gap.all(14.px),
    ),
    css('.platform-grid').styles(
      display: Display.grid,
      maxWidth: 1080.px,
      margin: Spacing.symmetric(horizontal: Unit.auto),
      gridTemplate: const GridTemplate(
        columns: GridTracks([
          GridTrack(TrackSize.fr(1)),
          GridTrack(TrackSize.fr(1)),
        ]),
      ),
      gap: Gap.all(32.px),
    ),
    css('.platform-card').styles(
      display: Display.flex,
      flexDirection: FlexDirection.column,
      padding: Spacing.all(40.px),
      radius: BorderRadius.circular(28.px),
      backgroundColor: Colors.white,
      transition: Transition('all', duration: Duration(milliseconds: 300)),
      raw: {'border': '1px solid rgba(17, 24, 39, 0.08)'},
    ),
    css('.platform-card:hover').styles(
      shadow: BoxShadow(offsetX: 0.px, offsetY: 26.px, blur: 60.px, color: Color.rgba(17, 24, 39, 0.10)),
      transform: Transform.translate(y: (-6).px),
    ),
    css('.platform-card-header').styles(
      display: Display.flex,
      alignItems: AlignItems.center,
      gap: Gap.all(16.px),
      margin: Spacing.only(bottom: 28.px),
    ),
    css('.platform-icon-wrapper').styles(
      width: 64.px,
      height: 64.px,
      display: Display.flex,
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.center,
      radius: BorderRadius.circular(18.px),
    ),
    css('.user-icon').styles(
      backgroundColor: Color('#FFF0E8'),
    ),
    css('.delivery-icon').styles(
      backgroundColor: Color('#EEF2FF'),
    ),
    css('.platform-icon').styles(
      fontSize: 1.8.rem,
      lineHeight: 1.em,
    ),
    css('.platform-badge').styles(
      padding: Spacing.symmetric(horizontal: 14.px, vertical: 6.px),
      radius: BorderRadius.circular(999.px),
      fontSize: 0.82.rem,
      fontWeight: FontWeight.w600,
      textTransform: TextTransform.upperCase,
      letterSpacing: 0.8.px,
    ),
    css('.user-badge').styles(
      backgroundColor: Color('#FFF0E8'),
      color: Color('#E94B1B'),
    ),
    css('.delivery-badge').styles(
      backgroundColor: Color('#EEF2FF'),
      color: Color('#4F46E5'),
    ),
    css('.platform-title').styles(
      fontSize: 1.75.rem,
      color: Color('#111827'),
      margin: Spacing.only(bottom: 14.px),
    ),
    css('.platform-desc').styles(
      color: Color('#667085'),
      lineHeight: 1.7.em,
      margin: Spacing.only(bottom: 28.px),
    ),
    css('.platform-features').styles(
      padding: Spacing.zero,
      margin: Spacing.only(bottom: 32.px),
      display: Display.flex,
      flexDirection: FlexDirection.column,
      gap: Gap.all(14.px),
      raw: {'list-style': 'none', 'flex': '1'},
    ),
    css('.platform-feature-item').styles(
      display: Display.flex,
      alignItems: AlignItems.center,
      gap: Gap.all(12.px),
      color: Color('#344054'),
      fontSize: 0.95.rem,
      lineHeight: 1.5.em,
    ),
    css('.check-icon').styles(
      color: Color('#16A34A'),
      fontWeight: FontWeight.bold,
      fontSize: 1.1.rem,
      width: 24.px,
      height: 24.px,
      display: Display.flex,
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.center,
      backgroundColor: Color('#ECFDF3'),
      radius: BorderRadius.circular(50.percent),
      raw: {'flex-shrink': '0'},
    ),
    css('.platform-cta').styles(
      width: 100.percent,
      justifyContent: JustifyContent.center,
    ),
    css('@media (max-width: 992px)').styles(
      raw: {
        ' .our-platform': 'padding: 88px 24px;',
        ' .our-platform .section-header': 'margin-bottom: 48px;',
        ' .platform-card': 'padding: 32px;',
      },
    ),
    css('@media (max-width: 768px)').styles(
      raw: {
        ' .our-platform': 'padding: 64px 20px;',
        ' .our-platform .section-header': 'align-items: flex-start; text-align: left; margin-bottom: 36px;',
        ' .platform-grid': 'grid-template-columns: 1fr; gap: 24px;',
        ' .platform-card': 'padding: 28px;',
      },
    ),
    css('@media (max-width: 520px)').styles(
      raw: {
        ' .our-platform': 'padding: 54px 16px;',
        ' .platform-grid': 'gap: 18px;',
        ' .platform-card': 'padding: 20px; border-radius: 20px;',
        ' .platform-card-header': 'align-items: center; gap: 12px; margin-bottom: 20px;',
        ' .platform-icon-wrapper': 'width: 52px; height: 52px; border-radius: 15px;',
        ' .platform-badge': 'font-size: 0.72rem; letter-spacing: 0.4px;',
        ' .platform-title': 'font-size: 1.34rem;',
        ' .platform-desc': 'font-size: 0.94rem; line-height: 1.62; margin-bottom: 22px;',
        ' .platform-features': 'gap: 12px; margin-bottom: 24px;',
        ' .platform-feature-item': 'align-items: flex-start;',
        ' .platform-cta': 'min-height: 48px;',
      },
    ),
    css('@media (max-width: 380px)').styles(
      raw: {
        ' .platform-card-header': 'flex-direction: column; align-items: flex-start;',
      },
    ),
  ];
}
