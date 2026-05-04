import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

class WhyChooseUs extends StatelessComponent {
  const WhyChooseUs({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'why-us', classes: 'why-choose-us', [
      div(classes: 'container', [
        div(classes: 'section-header text-center', [
          span(classes: 'subtitle', [Component.text('WHY CHOOSE US')]),
          h2(classes: 'title', [
            Component.text('What makes us different?'),
          ]),
          p(classes: 'section-copy', [
            Component.text(
              'We\'re committed to delivering not just food and groceries, but a complete experience built on quality, speed, and trust.',
            ),
          ]),
        ]),
        div(classes: 'reasons-grid', [
          _buildReasonCard(
            icon: '🥗',
            title: 'Fresh & Quality Products',
            description:
                'We ensure only the best quality food and grocery items reach your doorstep. Every product is carefully selected and handled with care from store to delivery.',
            accent: '#16A34A',
            accentBg: '#ECFDF3',
          ),
          _buildReasonCard(
            icon: '⚡',
            title: 'Lightning Fast Delivery',
            description:
                'Our dedicated delivery team ensures your orders arrive fresh and on time, every time. Track your deliveryman live and know exactly when to expect your order.',
            accent: '#E94B1B',
            accentBg: '#FFF0E8',
          ),
          _buildReasonCard(
            icon: '🔒',
            title: 'Safe & Secure Payments',
            description:
                'Choose from multiple payment methods including cash on delivery and online payments. Your transactions are always protected and secure.',
            accent: '#4F46E5',
            accentBg: '#EEF2FF',
          ),
          _buildReasonCard(
            icon: '💬',
            title: '24/7 Customer Support',
            description:
                'Got a question or concern? Our support team is always ready to help you with your orders, deliveries, and any issues you might face.',
            accent: '#0891B2',
            accentBg: '#ECFEFF',
          ),
        ]),
      ]),
    ]);
  }

  Component _buildReasonCard({
    required String icon,
    required String title,
    required String description,
    required String accent,
    required String accentBg,
  }) {
    return div(classes: 'reason-card', [
      div(
        classes: 'reason-icon-wrapper',
        styles: Styles(backgroundColor: Color(accentBg)),
        [
          span(classes: 'reason-icon', [Component.text(icon)]),
        ],
      ),
      h3(classes: 'reason-title', [Component.text(title)]),
      p(classes: 'reason-desc', [Component.text(description)]),
    ]);
  }

  @css
  static final styles = [
    css('.why-choose-us').styles(
      padding: Spacing.symmetric(vertical: 112.px, horizontal: 24.px),
      backgroundColor: Colors.white,
    ),
    css('.why-choose-us .container').styles(
      width: 100.percent,
      maxWidth: 1180.px,
      margin: Spacing.symmetric(horizontal: Unit.auto),
    ),
    css('.why-choose-us .section-header').styles(
      margin: Spacing.only(bottom: 64.px),
      display: Display.flex,
      flexDirection: FlexDirection.column,
      alignItems: AlignItems.center,
      gap: Gap.all(14.px),
    ),
    css('.reasons-grid').styles(
      display: Display.grid,
      maxWidth: 1080.px,
      margin: Spacing.symmetric(horizontal: Unit.auto),
      gridTemplate: const GridTemplate(
        columns: GridTracks([
          GridTrack(TrackSize.fr(1)),
          GridTrack(TrackSize.fr(1)),
        ]),
      ),
      gap: Gap.all(28.px),
    ),
    css('.reason-card').styles(
      display: Display.flex,
      flexDirection: FlexDirection.column,
      padding: Spacing.all(36.px),
      radius: BorderRadius.circular(24.px),
      backgroundColor: Colors.white,
      transition: Transition('all', duration: Duration(milliseconds: 300)),
      raw: {'border': '1px solid rgba(17, 24, 39, 0.08)'},
    ),
    css('.reason-card:hover').styles(
      shadow: BoxShadow(offsetX: 0.px, offsetY: 24.px, blur: 56.px, color: Color.rgba(17, 24, 39, 0.08)),
      transform: Transform.translate(y: (-4).px),
    ),
    css('.reason-icon-wrapper').styles(
      width: 72.px,
      height: 72.px,
      display: Display.flex,
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.center,
      radius: BorderRadius.circular(20.px),
      margin: Spacing.only(bottom: 24.px),
    ),
    css('.reason-icon').styles(
      fontSize: 2.rem,
      lineHeight: 1.em,
    ),
    css('.reason-title').styles(
      fontSize: 1.35.rem,
      color: Color('#111827'),
      margin: Spacing.only(bottom: 14.px),
    ),
    css('.reason-desc').styles(
      color: Color('#667085'),
      lineHeight: 1.7.em,
      margin: Spacing.zero,
    ),
    css('@media (max-width: 992px)').styles(
      raw: {
        ' .why-choose-us': 'padding: 88px 24px;',
        ' .why-choose-us .section-header': 'margin-bottom: 48px;',
      },
    ),
    css('@media (max-width: 768px)').styles(
      raw: {
        ' .why-choose-us': 'padding: 64px 20px;',
        ' .why-choose-us .section-header': 'align-items: flex-start; text-align: left; margin-bottom: 36px;',
        ' .reasons-grid': 'grid-template-columns: 1fr; gap: 20px;',
        ' .reason-card': 'padding: 28px;',
      },
    ),
    css('@media (max-width: 520px)').styles(
      raw: {
        ' .why-choose-us': 'padding: 54px 16px;',
        ' .reasons-grid': 'gap: 18px;',
        ' .reason-card': 'padding: 20px; border-radius: 20px;',
        ' .reason-icon-wrapper': 'width: 56px; height: 56px; margin-bottom: 18px; border-radius: 16px;',
        ' .reason-title': 'font-size: 1.18rem;',
        ' .reason-desc': 'font-size: 0.94rem; line-height: 1.62;',
      },
    ),
  ];
}
