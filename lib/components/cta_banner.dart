import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

class CtaBanner extends StatelessComponent {
  const CtaBanner({super.key});

  @override
  Component build(BuildContext context) {
    return section(classes: 'cta-banner', [
      div(classes: 'cta-container container', [
        div(classes: 'cta-content', [
          div(classes: 'cta-icon-row', [
            span(classes: 'cta-emoji', [Component.text('📱')]),
          ]),
          h2(classes: 'cta-title', [
            Component.text('Ready to order? Download our app now!'),
          ]),
          p(classes: 'cta-desc', [
            Component.text(
              'Get the full experience on your phone. Browse products, place orders, track deliveries, and enjoy seamless food & grocery delivery.',
            ),
          ]),
          div(classes: 'cta-buttons', [
            button(classes: 'store-btn apple-btn', [
              div(classes: 'store-btn-icon', [Component.text('🍎')]),
              div(classes: 'store-btn-text', [
                span(classes: 'store-btn-small', [Component.text('Download on the')]),
                span(classes: 'store-btn-name', [Component.text('App Store')]),
              ]),
            ]),
            button(classes: 'store-btn google-btn', [
              div(classes: 'store-btn-icon', [Component.text('▶')]),
              div(classes: 'store-btn-text', [
                span(classes: 'store-btn-small', [Component.text('Get it on')]),
                span(classes: 'store-btn-name', [Component.text('Google Play')]),
              ]),
            ]),
          ]),
        ]),
      ]),
    ]);
  }

  @css
  static final styles = [
    css('.cta-banner').styles(
      padding: Spacing.symmetric(vertical: 48.px, horizontal: 24.px),
      backgroundColor: Color('#F8FAFC'),
    ),
    css('.cta-container').styles(
      maxWidth: 1080.px,
      margin: Spacing.symmetric(horizontal: Unit.auto),
      padding: Spacing.symmetric(vertical: 80.px, horizontal: 48.px),
      radius: BorderRadius.circular(32.px),
      textAlign: TextAlign.center,
      backgroundColor: Color('#111827'),
      raw: {
        'background-image':
            'radial-gradient(circle at 20% 50%, rgba(233, 75, 27, 0.20), transparent 50%), radial-gradient(circle at 80% 50%, rgba(79, 70, 229, 0.12), transparent 50%)',
      },
    ),
    css('.cta-content').styles(
      display: Display.flex,
      flexDirection: FlexDirection.column,
      alignItems: AlignItems.center,
      gap: Gap.all(20.px),
    ),
    css('.cta-icon-row').styles(
      margin: Spacing.only(bottom: 8.px),
    ),
    css('.cta-emoji').styles(
      fontSize: 3.5.rem,
      lineHeight: 1.em,
    ),
    css('.cta-title').styles(
      fontSize: 2.75.rem,
      color: Colors.white,
      maxWidth: 680.px,
      lineHeight: 1.12.em,
    ),
    css('.cta-desc').styles(
      color: Color('#CBD5E1'),
      fontSize: 1.1.rem,
      lineHeight: 1.7.em,
      maxWidth: 560.px,
      margin: Spacing.zero,
    ),
    css('.cta-buttons').styles(
      display: Display.flex,
      gap: Gap.all(16.px),
      margin: Spacing.only(top: 12.px),
      flexWrap: FlexWrap.wrap,
      justifyContent: JustifyContent.center,
    ),
    css('.store-btn').styles(
      display: Display.flex,
      alignItems: AlignItems.center,
      gap: Gap.all(14.px),
      padding: Spacing.symmetric(horizontal: 28.px, vertical: 16.px),
      radius: BorderRadius.circular(16.px),
      cursor: Cursor.pointer,
      transition: Transition('all', duration: Duration(milliseconds: 300)),
      border: Border.unset,
      textAlign: TextAlign.left,
      minWidth: 202.px,
    ),
    css('.apple-btn').styles(
      backgroundColor: Colors.white,
      color: Color('#111827'),
    ),
    css('.google-btn').styles(
      backgroundColor: Color('#E94B1B'),
      color: Colors.white,
    ),
    css('.store-btn:hover').styles(
      transform: Transform.translate(y: (-4).px),
      shadow: BoxShadow(offsetX: 0.px, offsetY: 16.px, blur: 40.px, color: Color.rgba(0, 0, 0, 0.24)),
    ),
    css('.store-btn-icon').styles(
      fontSize: 1.8.rem,
      lineHeight: 1.em,
    ),
    css('.store-btn-text').styles(
      display: Display.flex,
      flexDirection: FlexDirection.column,
    ),
    css('.store-btn-small').styles(
      fontSize: 0.72.rem,
      raw: {'opacity': '0.7'},
      lineHeight: 1.2.em,
    ),
    css('.store-btn-name').styles(
      fontSize: 1.2.rem,
      fontWeight: FontWeight.bold,
      fontFamily: const FontFamily.list([FontFamily('Outfit'), FontFamilies.sansSerif]),
      lineHeight: 1.3.em,
    ),
    css('@media (max-width: 768px)').styles(
      raw: {
        ' .cta-banner': 'padding: 40px 20px;',
        ' .cta-container': 'padding: 56px 28px; border-radius: 24px;',
        ' .cta-title': 'font-size: 2rem;',
        ' .cta-buttons': 'flex-direction: column; width: 100%; max-width: 320px;',
        ' .store-btn': 'width: 100%; justify-content: center;',
      },
    ),
    css('@media (max-width: 520px)').styles(
      raw: {
        ' .cta-banner': 'padding: 28px 16px;',
        ' .cta-container': 'padding: 38px 18px; border-radius: 20px;',
        ' .cta-content': 'gap: 16px;',
        ' .cta-emoji': 'font-size: 2.5rem;',
        ' .cta-title': 'font-size: 1.62rem; line-height: 1.16;',
        ' .cta-desc': 'font-size: 0.94rem; line-height: 1.62;',
        ' .cta-buttons': 'max-width: none;',
        ' .store-btn': 'padding: 14px 18px; min-width: 0; min-height: 54px;',
        ' .store-btn-name': 'font-size: 1.08rem;',
      },
    ),
  ];
}
