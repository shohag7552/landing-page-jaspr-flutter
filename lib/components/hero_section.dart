import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class HeroSection extends StatelessComponent {
  const HeroSection({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'home', classes: 'hero', [
      div(classes: 'hero-container container', [
        div(classes: 'hero-content', [
          div(classes: 'hero-badge', [
            span(classes: 'badge-dot', []),
            span(classes: 'badge-text', [
              Component.text('Food & Grocery — delivered to your door'),
            ]),
          ]),
          h1(classes: 'hero-title', [
            Component.text('Order food & groceries online, delivered at your doorstep.'),
          ]),
          p(classes: 'hero-subtitle', [
            Component.text(
              'Browse your favorite products, place orders in a few taps, and track your deliveryman in real-time. Get instant notifications at every step — from kitchen to your door.',
            ),
          ]),
          div(classes: 'hero-quick-info', [
            _buildQuickInfo('✓', 'No hidden fees'),
            _buildQuickInfo('⚡', 'Fast checkout'),
            _buildQuickInfo('📍', 'Live updates'),
          ]),
          div(classes: 'hero-actions', [
            button(classes: 'btn btn-primary btn-lg', [
              Component.text('Download App'),
              span(classes: 'icon', [Component.text('→')]),
            ]),
            button(classes: 'btn btn-outline btn-lg', [
              Component.text('Explore Menu'),
            ]),
          ]),
          div(classes: 'hero-stats', [
            _buildStat('1000+', 'Products Available'),
            _buildStat('30 min', 'Average Delivery'),
            _buildStat('Live', 'Order Tracking'),
          ]),
        ]),
        div(classes: 'hero-visual', [
          img(
            src: 'https://images.unsplash.com/photo-1526367790999-0150786686a2?q=80&w=2071&auto=format&fit=crop',
            alt: 'Happy customer receiving food delivery at doorstep',
            classes: 'hero-image',
          ),
          div(classes: 'tracking-panel', [
            div(classes: 'panel-topline', [
              span(classes: 'panel-label', [Component.text('Order #4821')]),
              span(classes: 'panel-status', [Component.text('On the way')]),
            ]),
            div(classes: 'route-line', [
              span(classes: 'route-point active', []),
              span(classes: 'route-bar complete', []),
              span(classes: 'route-point active', []),
              span(classes: 'route-bar complete', []),
              span(classes: 'route-point active', []),
              span(classes: 'route-bar', []),
              span(classes: 'route-point', []),
            ]),
            div(classes: 'panel-metrics', [
              _buildMetric('12 min', 'ETA'),
              _buildMetric('1.8 km', 'Distance'),
              _buildMetric('Paid', 'Status'),
            ]),
          ]),
          div(classes: 'notification-card', [
            div(classes: 'notif-icon', [Component.text('🔔')]),
            div(classes: 'notif-body', [
              span(classes: 'notif-title', [Component.text('Order Update')]),
              span(classes: 'notif-text', [
                Component.text('Your rider is almost there! Arriving in 3 min.'),
              ]),
            ]),
          ]),
        ]),
      ]),
    ]);
  }

  Component _buildStat(String value, String label) {
    return div(classes: 'stat-item', [
      span(classes: 'stat-value', [Component.text(value)]),
      span(classes: 'stat-label', [Component.text(label)]),
    ]);
  }

  Component _buildQuickInfo(String icon, String label) {
    return div(classes: 'quick-info-item', [
      span(classes: 'quick-info-icon', [Component.text(icon)]),
      span(classes: 'quick-info-label', [Component.text(label)]),
    ]);
  }

  Component _buildMetric(String value, String label) {
    return div(classes: 'metric', [
      span(classes: 'metric-value', [Component.text(value)]),
      span(classes: 'metric-label', [Component.text(label)]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.hero').styles(
      display: Display.flex,
      position: Position.relative(),
      minHeight: 100.vh,
      padding: Spacing.only(top: 140.px, bottom: 96.px),
      overflow: Overflow.hidden,
      alignItems: AlignItems.center,
      backgroundColor: Color('#FFFDF8'),
      raw: {
        'background-image':
            'radial-gradient(circle at 15% 15%, rgba(233, 75, 27, 0.10), transparent 28%), linear-gradient(180deg, #FFFDF8 0%, #F8FAFC 100%)',
      },
    ),
    css('.hero-container').styles(
      display: Display.grid,
      width: 100.percent,
      gridTemplate: const GridTemplate(
        columns: GridTracks([
          GridTrack(TrackSize.fr(1.03)),
          GridTrack(TrackSize.fr(0.97)),
        ]),
      ),
      gap: Gap.all(72.px),
      alignItems: AlignItems.center,
      maxWidth: 1180.px,
      margin: Spacing.symmetric(horizontal: Unit.auto),
      padding: Spacing.symmetric(horizontal: 28.px),
      boxSizing: BoxSizing.borderBox,
    ),
    css('.hero-content').styles(
      maxWidth: 660.px,
    ),
    css('.hero-badge').styles(
      display: Display.inlineFlex,
      alignItems: AlignItems.center,
      gap: Gap.all(10.px),
      padding: Spacing.symmetric(horizontal: 14.px, vertical: 9.px),
      backgroundColor: Colors.white,
      radius: BorderRadius.circular(999.px),
      margin: Spacing.only(bottom: 26.px),
      shadow: BoxShadow(
        offsetX: 0.px,
        offsetY: 12.px,
        blur: 30.px,
        color: Color.rgba(17, 24, 39, 0.06),
      ),
      raw: {'border': '1px solid rgba(233, 75, 27, 0.14)'},
    ),
    css('.badge-text').styles(
      raw: {'white-space': 'normal'},
    ),
    css('.badge-dot').styles(
      width: 8.px,
      height: 8.px,
      radius: BorderRadius.circular(50.percent),
      backgroundColor: Color('#16A34A'),
      shadow: BoxShadow(
        offsetX: 0.px,
        offsetY: 0.px,
        blur: 0.px,
        spread: 5.px,
        color: Color.rgba(22, 163, 74, 0.12),
      ),
    ),
    css('.badge-text').styles(
      color: Color('#344054'),
      fontWeight: FontWeight.w600,
      fontSize: 0.9.rem,
    ),
    css('.hero-title').styles(
      fontSize: 4.2.rem,
      lineHeight: 1.06.em,
      color: Color('#111827'),
      margin: Spacing.only(bottom: 26.px),
      letterSpacing: 0.px,
    ),
    css('.hero-subtitle').styles(
      fontSize: 1.18.rem,
      color: Color('#596579'),
      lineHeight: 1.75.em,
      margin: Spacing.only(bottom: 24.px),
      maxWidth: 620.px,
    ),
    css('.hero-quick-info').styles(
      display: Display.flex,
      flexWrap: FlexWrap.wrap,
      gap: Gap.all(10.px),
      margin: Spacing.only(bottom: 34.px),
    ),
    css('.quick-info-item').styles(
      display: Display.flex,
      alignItems: AlignItems.center,
      gap: Gap.all(8.px),
      padding: Spacing.symmetric(horizontal: 12.px, vertical: 9.px),
      radius: BorderRadius.circular(999.px),
      backgroundColor: Colors.white,
      color: Color('#344054'),
      fontSize: 0.88.rem,
      fontWeight: FontWeight.w600,
      raw: {'border': '1px solid rgba(17, 24, 39, 0.08)'},
    ),
    css('.quick-info-icon').styles(
      color: Color('#E94B1B'),
      lineHeight: 1.em,
    ),
    css('.hero-actions').styles(
      display: Display.flex,
      gap: Gap.all(16.px),
      margin: Spacing.only(bottom: 52.px),
      flexWrap: FlexWrap.wrap,
    ),
    css('.btn-lg').styles(
      padding: Spacing.symmetric(horizontal: 30.px, vertical: 17.px),
      fontSize: 1.rem,
    ),
    css('.btn-outline').styles(
      backgroundColor: Colors.white,
      color: Color('#182230'),
      raw: {'border': '1px solid rgba(17, 24, 39, 0.12)'},
      shadow: BoxShadow(
        offsetX: 0.px,
        offsetY: 10.px,
        blur: 28.px,
        color: Color.rgba(17, 24, 39, 0.06),
      ),
    ),
    css('.btn-outline:hover').styles(
      raw: {'border-color': '#E94B1B'},
      color: Color('#E94B1B'),
      transform: Transform.translate(y: (-2).px),
    ),
    css('.hero-stats').styles(
      display: Display.grid,
      gridTemplate: const GridTemplate(
        columns: GridTracks([
          GridTrack(TrackSize.fr(1)),
          GridTrack(TrackSize.fr(1)),
          GridTrack(TrackSize.fr(1)),
        ]),
      ),
      gap: Gap.all(18.px),
      maxWidth: 640.px,
    ),
    css('.stat-item').styles(
      display: Display.flex,
      flexDirection: FlexDirection.column,
      padding: Spacing.all(18.px),
      backgroundColor: const Color.rgba(255, 255, 255, 0.72),
      radius: BorderRadius.circular(18.px),
      raw: {'border': '1px solid rgba(17, 24, 39, 0.08)'},
    ),
    css('.stat-value').styles(
      fontWeight: FontWeight.bold,
      color: Color('#111827'),
      fontSize: 1.2.rem,
      margin: Spacing.only(bottom: 6.px),
    ),
    css('.stat-label').styles(
      color: Color('#667085'),
      fontSize: 0.86.rem,
      lineHeight: 1.35.em,
    ),
    css('.hero-visual').styles(
      position: Position.relative(),
      minHeight: 620.px,
      width: 100.percent,
      raw: {'max-width': '100%'},
    ),
    css('.hero-image').styles(
      width: 100.percent,
      height: 620.px,
      radius: BorderRadius.circular(34.px),
      shadow: BoxShadow(
        offsetX: 0.px,
        offsetY: 30.px,
        blur: 70.px,
        color: Color.rgba(17, 24, 39, 0.18),
      ),
      position: Position.relative(),
      zIndex: ZIndex(10),
      raw: {'object-fit': 'cover'},
    ),
    css('.tracking-panel').styles(
      position: Position.absolute(bottom: 28.px, left: (-24).px),
      width: 360.px,
      maxWidth: 100.percent,
      backgroundColor: const Color.rgba(255, 255, 255, 0.94),
      padding: Spacing.all(22.px),
      radius: BorderRadius.circular(22.px),
      shadow: BoxShadow(
        offsetX: 0.px,
        offsetY: 24.px,
        blur: 50.px,
        color: Color.rgba(17, 24, 39, 0.16),
      ),
      zIndex: ZIndex(20),
      raw: {'backdrop-filter': 'blur(16px)'},
    ),
    css('.panel-topline').styles(
      display: Display.flex,
      justifyContent: JustifyContent.spaceBetween,
      alignItems: AlignItems.center,
      margin: Spacing.only(bottom: 20.px),
    ),
    css('.panel-label').styles(
      color: Color('#111827'),
      fontWeight: FontWeight.bold,
    ),
    css('.panel-status').styles(
      color: Color('#047857'),
      backgroundColor: Color('#ECFDF3'),
      padding: Spacing.symmetric(horizontal: 10.px, vertical: 5.px),
      radius: BorderRadius.circular(999.px),
      fontSize: 0.78.rem,
      fontWeight: FontWeight.w600,
    ),
    css('.route-line').styles(
      display: Display.flex,
      alignItems: AlignItems.center,
      margin: Spacing.only(bottom: 20.px),
    ),
    css('.route-point').styles(
      width: 13.px,
      height: 13.px,
      radius: BorderRadius.circular(50.percent),
      backgroundColor: Color('#E4E7EC'),
    ),
    css('.route-point.active').styles(
      backgroundColor: Color('#E94B1B'),
    ),
    css('.route-bar').styles(
      height: 3.px,
      backgroundColor: Color('#E4E7EC'),
      raw: {'flex': '1'},
    ),
    css('.route-bar.complete').styles(
      backgroundColor: Color('#E94B1B'),
    ),
    css('.panel-metrics').styles(
      display: Display.grid,
      gridTemplate: const GridTemplate(
        columns: GridTracks([
          GridTrack(TrackSize.fr(1)),
          GridTrack(TrackSize.fr(1)),
          GridTrack(TrackSize.fr(1)),
        ]),
      ),
      gap: Gap.all(12.px),
    ),
    css('.metric').styles(
      display: Display.flex,
      flexDirection: FlexDirection.column,
      gap: Gap.all(4.px),
    ),
    css('.metric-value').styles(
      color: Color('#111827'),
      fontWeight: FontWeight.bold,
      fontSize: 0.94.rem,
    ),
    css('.metric-label').styles(
      color: Color('#667085'),
      fontSize: 0.78.rem,
    ),
    // Notification card replaces operator card
    css('.notification-card').styles(
      position: Position.absolute(top: 44.px, right: (-26).px),
      width: 300.px,
      backgroundColor: Colors.white,
      padding: Spacing.all(20.px),
      radius: BorderRadius.circular(22.px),
      zIndex: ZIndex(30),
      display: Display.flex,
      alignItems: AlignItems.center,
      gap: Gap.all(16.px),
      shadow: BoxShadow(
        offsetX: 0.px,
        offsetY: 26.px,
        blur: 50.px,
        color: Color.rgba(17, 24, 39, 0.18),
      ),
      raw: {'border': '1px solid rgba(17, 24, 39, 0.06)'},
    ),
    css('.notif-icon').styles(
      width: 48.px,
      height: 48.px,
      display: Display.flex,
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.center,
      backgroundColor: Color('#FFF0E8'),
      radius: BorderRadius.circular(14.px),
      fontSize: 1.4.rem,
      raw: {'flex-shrink': '0'},
    ),
    css('.notif-body').styles(
      display: Display.flex,
      flexDirection: FlexDirection.column,
      gap: Gap.all(4.px),
    ),
    css('.notif-title').styles(
      fontWeight: FontWeight.bold,
      color: Color('#111827'),
      fontSize: 0.92.rem,
    ),
    css('.notif-text').styles(
      color: Color('#667085'),
      fontSize: 0.84.rem,
      lineHeight: 1.45.em,
    ),
    css('@media (max-width: 992px)').styles(
      raw: {
        ' .hero': 'padding-top: 128px; padding-bottom: 72px; min-height: auto;',
        ' .hero-container': 'grid-template-columns: 1fr; gap: 56px; text-align: center;',
        ' .hero-content': 'max-width: 760px; margin: 0 auto;',
        ' .hero-badge': 'margin: 0 auto 26px;',
        ' .hero-title': 'font-size: 3.35rem;',
        ' .hero-subtitle': 'margin-left: auto; margin-right: auto;',
        ' .hero-actions': 'justify-content: center;',
        ' .hero-stats': 'margin: 0 auto;',
        ' .hero-visual': 'min-height: 540px;',
        ' .hero-image': 'height: 540px;',
        ' .notification-card': 'right: 18px;',
        ' .tracking-panel': 'left: 18px;',
      },
    ),
    css('@media (max-width: 900px)').styles(
      raw: {
        ' .hero': 'padding-top: 116px; padding-bottom: 72px;',
        ' .hero-container': 'gap: 44px;',
        ' .hero-title': 'font-size: 3rem;',
        ' .hero-visual': 'width: min(100%, 680px); margin: 0 auto; min-height: 500px;',
        ' .hero-image': 'height: 500px;',
      },
    ),
    css('@media (max-width: 768px)').styles(
      raw: {
        ' .hero': 'padding-top: 104px; padding-bottom: 58px;',
        ' .hero-container': 'padding: 0 20px; gap: 34px; text-align: left;',
        ' .hero-content': 'max-width: 100%;',
        ' .hero-badge': 'margin: 0 0 22px; max-width: 100%;',
        ' .hero-title': 'font-size: 2.55rem; line-height: 1.08;',
        ' .hero-subtitle': 'font-size: 1.02rem; margin-left: 0; margin-right: 0; margin-bottom: 30px;',
        ' .hero-quick-info': 'margin-bottom: 28px;',
        ' .hero-actions': 'flex-direction: column; width: 100%;',
        ' .btn-lg': 'width: 100%; justify-content: center;',
        ' .hero-stats': 'grid-template-columns: 1fr; gap: 12px; width: 100%;',
        ' .hero-visual': 'display: flex; flex-direction: column; min-height: auto; width: 100%;',
        ' .hero-image': 'height: 380px; border-radius: 24px;',
        ' .tracking-panel':
            'position: relative; left: auto; bottom: auto; width: 100%; max-width: none; margin: 14px 0 0; box-shadow: 0 16px 34px rgba(17, 24, 39, 0.10);',
        ' .notification-card': 'display: none;',
      },
    ),
    css('@media (max-width: 520px)').styles(
      raw: {
        ' .hero': 'padding-top: 92px; padding-bottom: 48px;',
        ' .hero-container': 'padding: 0 16px; gap: 28px;',
        ' .hero-badge': 'display: inline-flex; width: auto; padding: 8px 11px; margin-bottom: 18px;',
        ' .badge-dot': 'width: 7px; height: 7px;',
        ' .badge-text': 'font-size: 0.76rem; line-height: 1.35;',
        ' .hero-title': 'font-size: 2.05rem; line-height: 1.1; margin-bottom: 18px;',
        ' .hero-subtitle': 'font-size: 0.95rem; line-height: 1.62; margin-bottom: 18px;',
        ' .hero-quick-info': 'display: grid; grid-template-columns: 1fr; gap: 8px; margin-bottom: 22px;',
        ' .quick-info-item':
            'justify-content: flex-start; padding: 10px 12px; border-radius: 14px; font-size: 0.86rem;',
        ' .hero-actions': 'gap: 12px; margin-bottom: 26px;',
        ' .btn-lg': 'padding: 14px 18px; min-height: 48px;',
        ' .hero-stats': 'grid-template-columns: repeat(3, 1fr); gap: 8px;',
        ' .stat-item': 'padding: 12px 8px; border-radius: 16px; text-align: center; align-items: center;',
        ' .stat-value': 'font-size: 1.05rem;',
        ' .stat-label': 'font-size: 0.72rem; line-height: 1.25;',
        ' .hero-image': 'height: 300px; border-radius: 18px;',
        ' .tracking-panel': 'margin-top: 12px; padding: 15px; border-radius: 18px;',
        ' .panel-topline': 'margin-bottom: 16px;',
        ' .route-line': 'margin-bottom: 16px;',
        ' .panel-metrics': 'gap: 8px;',
        ' .metric-value': 'font-size: 0.86rem;',
        ' .metric-label': 'font-size: 0.72rem;',
      },
    ),
    css('@media (max-width: 380px)').styles(
      raw: {
        ' .hero-title': 'font-size: 1.82rem;',
        ' .quick-info-item': 'font-size: 0.82rem;',
        ' .hero-stats': 'grid-template-columns: 1fr;',
        ' .stat-item': 'padding: 13px 14px;',
        ' .stat-label': 'font-size: 0.78rem;',
        ' .hero-image': 'height: 250px;',
        ' .tracking-panel': 'padding: 14px;',
        ' .panel-status': 'font-size: 0.7rem; padding: 4px 8px;',
      },
    ),
  ];
}
