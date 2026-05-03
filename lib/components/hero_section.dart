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
              Component.text('Real-time delivery operations for modern restaurants'),
            ]),
          ]),
          h1(classes: 'hero-title', [
            Component.text('Move every order from craving to doorstep faster.'),
          ]),
          p(classes: 'hero-subtitle', [
            Component.text(
              'FoodFlow connects customers, kitchens, riders, and operators in one high-performance delivery platform built for live tracking, reliable checkout, and commercial scale.',
            ),
          ]),
          div(classes: 'hero-actions', [
            button(classes: 'btn btn-primary btn-lg', [
              Component.text('Launch Ordering'),
              span(classes: 'icon', [Component.text('→')]),
            ]),
            button(classes: 'btn btn-outline btn-lg', [
              Component.text('See Platform Demo'),
            ]),
          ]),
          div(classes: 'hero-stats', [
            _buildStat('Live', 'Courier visibility'),
            _buildStat('99.9%', 'Uptime-ready architecture'),
            _buildStat('Multi', 'Restaurant workflows'),
          ]),
        ]),
        div(classes: 'hero-visual', [
          img(
            src:
                'https://images.unsplash.com/photo-1555396273-367ea4eb4db5?q=80&w=1974&auto=format&fit=crop',
            alt: 'Restaurant team preparing food delivery orders',
            classes: 'hero-image',
          ),
          div(classes: 'tracking-panel', [
            div(classes: 'panel-topline', [
              span(classes: 'panel-label', [Component.text('Order #4821')]),
              span(classes: 'panel-status', [Component.text('On route')]),
            ]),
            div(classes: 'route-line', [
              span(classes: 'route-point active', []),
              span(classes: 'route-bar complete', []),
              span(classes: 'route-point active', []),
              span(classes: 'route-bar', []),
              span(classes: 'route-point', []),
            ]),
            div(classes: 'panel-metrics', [
              _buildMetric('18 min', 'ETA'),
              _buildMetric('2.4 km', 'Distance'),
              _buildMetric('Paid', 'Checkout'),
            ]),
          ]),
          div(classes: 'operator-card', [
            span(classes: 'operator-kicker', [Component.text('Partner Console')]),
            span(classes: 'operator-title', [Component.text('42 active orders')]),
            span(classes: 'operator-copy', [
              Component.text('Kitchen, dispatch, and customer updates stay in sync.'),
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
          fontSize: 4.4.rem,
          lineHeight: 1.02.em,
          color: Color('#111827'),
          margin: Spacing.only(bottom: 26.px),
          letterSpacing: 0.px,
        ),
        css('.hero-subtitle').styles(
          fontSize: 1.18.rem,
          color: Color('#596579'),
          lineHeight: 1.75.em,
          margin: Spacing.only(bottom: 38.px),
          maxWidth: 620.px,
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
        css('.operator-card').styles(
          position: Position.absolute(top: 44.px, right: (-26).px),
          width: 248.px,
          backgroundColor: Color('#111827'),
          color: Colors.white,
          padding: Spacing.all(22.px),
          radius: BorderRadius.circular(22.px),
          zIndex: ZIndex(30),
          shadow: BoxShadow(
            offsetX: 0.px,
            offsetY: 26.px,
            blur: 50.px,
            color: Color.rgba(17, 24, 39, 0.24),
          ),
        ),
        css('.operator-kicker').styles(
          display: Display.block,
          color: Color('#FDBA74'),
          fontSize: 0.78.rem,
          fontWeight: FontWeight.w600,
          margin: Spacing.only(bottom: 10.px),
          textTransform: TextTransform.upperCase,
        ),
        css('.operator-title').styles(
          display: Display.block,
          fontSize: 1.45.rem,
          fontWeight: FontWeight.bold,
          margin: Spacing.only(bottom: 8.px),
        ),
        css('.operator-copy').styles(
          display: Display.block,
          color: Color('#CBD5E1'),
          lineHeight: 1.5.em,
          fontSize: 0.9.rem,
        ),
        css('@media (max-width: 992px)').styles(raw: {
          ' .hero':
              'padding-top: 128px; padding-bottom: 72px; min-height: auto;',
          ' .hero-container':
              'grid-template-columns: 1fr; gap: 56px; text-align: center;',
          ' .hero-content': 'max-width: 760px; margin: 0 auto;',
          ' .hero-badge': 'margin: 0 auto 26px;',
          ' .hero-title': 'font-size: 3.35rem;',
          ' .hero-subtitle': 'margin-left: auto; margin-right: auto;',
          ' .hero-actions': 'justify-content: center;',
          ' .hero-stats': 'margin: 0 auto;',
          ' .hero-visual': 'min-height: 540px;',
          ' .hero-image': 'height: 540px;',
          ' .operator-card': 'right: 18px;',
          ' .tracking-panel': 'left: 18px;',
        }),
        css('@media (max-width: 768px)').styles(raw: {
          ' .hero-container': 'padding: 0 20px;',
          ' .hero-title': 'font-size: 2.65rem;',
          ' .hero-subtitle': 'font-size: 1.04rem;',
          ' .hero-actions': 'flex-direction: column; width: 100%;',
          ' .btn-lg': 'width: 100%; justify-content: center;',
          ' .hero-stats': 'grid-template-columns: 1fr;',
          ' .hero-visual': 'min-height: auto;',
          ' .hero-image': 'height: 430px; border-radius: 24px;',
          ' .tracking-panel':
              'position: relative; left: auto; bottom: auto; width: auto; margin: -88px 14px 0;',
          ' .operator-card': 'display: none;',
        }),
      ];
}
