import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

class FooterSection extends StatelessComponent {
  const FooterSection({super.key});

  @override
  Component build(BuildContext context) {
    return footer(id: 'contact', classes: 'footer', [
      div(classes: 'container', [
        div(classes: 'footer-content', [
          // Brand Column
          div(classes: 'footer-brand', [
            div(classes: 'logo-container mb-4', [
              span(classes: 'logo-icon', [Component.text('🍔')]),
              span(classes: 'logo-text', [
                Component.text('Food'),
                span(classes: 'text-primary', [Component.text('Flow')]),
              ]),
            ]),
            p(classes: 'brand-desc', [
              Component.text(
                'Real-time food delivery infrastructure for restaurants, cloud kitchens, and operators that need speed customers can trust.',
              ),
            ]),
            div(classes: 'social-links', [
              a(href: '#', classes: 'social-icon', [Component.text('📘')]),
              a(href: '#', classes: 'social-icon', [Component.text('📸')]),
              a(href: '#', classes: 'social-icon', [Component.text('🐦')]),
            ]),
          ]),

          // Links Columns
          div(classes: 'footer-links-group', [
            _buildLinksColumn('Platform', ['Live Tracking', 'Checkout', 'Dispatch', 'Analytics']),
            _buildLinksColumn('Business', ['Restaurants', 'Cloud Kitchens', 'Enterprise', 'Integrations']),
            _buildLinksColumn('Support', ['Partner Login', 'Help Center', 'Status', 'Contact']),
          ]),

          // Subscribe Column
          div(classes: 'footer-subscribe', [
            h4(classes: 'footer-title', [Component.text('Scale delivery with confidence')]),
            p(classes: 'subscribe-desc', [
              Component.text('Get product updates, launch guidance, and operator insights in your inbox.'),
            ]),
            div(classes: 'subscribe-form', [
              input(type: InputType.email, attributes: {'placeholder': 'Work email'}, classes: 'subscribe-input'),
              button(classes: 'btn btn-primary subscribe-btn', [
                span(classes: 'icon', [Component.text('→')]),
              ]),
            ]),
          ]),
        ]),

        div(classes: 'footer-bottom', [
          p(classes: 'copyright', [Component.text('© 2026 FoodFlow. All rights reserved.')]),
          div(classes: 'legal-links', [
            a(href: '#', classes: 'legal-link', [Component.text('Terms & Conditions')]),
            span(classes: 'separator', [Component.text('•')]),
            a(href: '#', classes: 'legal-link', [Component.text('Privacy Policy')]),
          ]),
        ]),
      ]),
    ]);
  }

  Component _buildLinksColumn(String title, List<String> links) {
    return div(classes: 'footer-column', [
      h4(classes: 'footer-title', [Component.text(title)]),
      ul(classes: 'footer-links', [
        for (final link in links)
          li(classes: 'footer-item', [
            a(href: '#', classes: 'footer-link', [Component.text(link)]),
          ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.footer').styles(
      padding: Spacing.only(top: 80.px, bottom: 24.px, left: 24.px, right: 24.px),
      margin: Spacing.zero,
      color: Colors.white,
      backgroundColor: Color('#111827'),
    ),
    css('.footer .container').styles(
      width: 100.percent,
      maxWidth: 1180.px,
      margin: Spacing.symmetric(horizontal: Unit.auto),
    ),
    css('.footer-content').styles(
      display: Display.grid,
      margin: Spacing.only(bottom: 64.px),
      gridTemplate: GridTemplate(
        columns: GridTracks([
          GridTrack(TrackSize.auto),
          GridTrack(TrackSize.fr(1)),
          GridTrack(TrackSize.auto),
        ]),
      ),
      gap: Gap.all(56.px),
    ),
    css('.mb-4').styles(
      margin: Spacing.only(bottom: 16.px),
    ),
    css('.footer .logo-text').styles(
      color: Colors.white,
    ),
    css('.brand-desc').styles(
      color: Color('#CBD5E1'),
      lineHeight: 1.7.em,
      margin: Spacing.only(bottom: 32.px),
      maxWidth: 320.px,
    ),
    css('.social-links').styles(
      display: Display.flex,
      gap: Gap.all(16.px),
    ),
    css('.social-icon').styles(
      width: 40.px,
      height: 40.px,
      backgroundColor: Color('#1F2937'),
      radius: BorderRadius.circular(50.percent),
      display: Display.flex,
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.center,
      color: Colors.white,
      transition: Transition('all', duration: Duration(milliseconds: 300)),
      textDecoration: TextDecoration(line: TextDecorationLine.none),
    ),
    css('.social-icon:hover').styles(
      backgroundColor: Color('#E94B1B'),
      transform: Transform.translate(y: (-4).px),
    ),
    css('.footer-links-group').styles(
      display: Display.grid,
      gridTemplate: GridTemplate(
        columns: GridTracks([
          GridTrack(TrackSize.fr(1)),
          GridTrack(TrackSize.fr(1)),
          GridTrack(TrackSize.fr(1)),
        ]),
      ),
      gap: Gap.all(32.px),
    ),
    css('.footer-title').styles(
      fontSize: 1.25.rem,
      fontWeight: FontWeight.bold,
      margin: Spacing.only(bottom: 24.px),
      color: Colors.white,
    ),
    css('.footer-links').styles(
      raw: {'list-style': 'none'},
      padding: Spacing.zero,
      margin: Spacing.zero,
      display: Display.flex,
      flexDirection: FlexDirection.column,
      gap: Gap.all(16.px),
    ),
    css('.footer-link').styles(
      color: Color('#CBD5E1'),
      textDecoration: TextDecoration(line: TextDecorationLine.none),
      transition: Transition('color', duration: Duration(milliseconds: 200)),
      fontSize: 0.95.rem,
    ),
    css('.footer-link:hover').styles(
      color: Color('#FDBA74'),
    ),
    css('.subscribe-desc').styles(
      color: Color('#CBD5E1'),
      lineHeight: 1.6.em,
      margin: Spacing.only(bottom: 24.px),
    ),
    css('.footer-subscribe').styles(
      width: 100.percent,
      maxWidth: 320.px,
    ),
    css('.subscribe-form').styles(
      position: Position.relative(),
      display: Display.flex,
      alignItems: AlignItems.center,
    ),
    css('.subscribe-input').styles(
      width: 100.percent,
      backgroundColor: Color('#1F2937'),
      border: Border.unset,
      radius: BorderRadius.circular(50.px),
      padding: Spacing.only(top: 16.px, bottom: 16.px, left: 24.px, right: 64.px),
      color: Colors.white,
      fontSize: 0.95.rem,
      fontFamily: const FontFamily.list([FontFamily('Inter'), FontFamilies.sansSerif]),
    ),
    css('.subscribe-input:focus').styles(
      raw: {'outline': '1px solid #E94B1B'},
    ),
    css('.subscribe-btn').styles(
      display: Display.flex,
      position: Position.absolute(right: 6.px),
      width: 40.px,
      height: 40.px,
      padding: Spacing.zero,
      radius: BorderRadius.circular(50.percent),
      justifyContent: JustifyContent.center,
      alignItems: AlignItems.center,
    ),
    css('.footer-bottom').styles(
      display: Display.flex,
      padding: Spacing.only(top: 32.px),
      justifyContent: JustifyContent.spaceBetween,
      alignItems: AlignItems.center,
      raw: {'border-top': '1px solid #1F2937'},
    ),
    css('.copyright').styles(
      margin: Spacing.zero,
      color: Color('#94A3B8'),
      fontSize: 0.875.rem,
    ),
    css('.legal-links').styles(
      display: Display.flex,
      alignItems: AlignItems.center,
      gap: Gap.all(16.px),
    ),
    css('.legal-link').styles(
      color: Color('#94A3B8'),
      textDecoration: TextDecoration(line: TextDecorationLine.none),
      fontSize: 0.875.rem,
      transition: Transition('color', duration: Duration(milliseconds: 200)),
    ),
    css('.legal-link:hover').styles(
      color: Color('#FDBA74'),
    ),
    css('.separator').styles(
      color: Color('#334155'),
    ),
    css('@media (max-width: 1024px)').styles(
      raw: {
        ' .footer-content': 'grid-template-columns: 1fr; gap: 48px;',
        ' .footer-brand': 'max-width: 400px;',
        ' .footer-subscribe': 'max-width: 460px;',
      },
    ),
    css('@media (max-width: 640px)').styles(
      raw: {
        ' .footer': 'padding: 56px 16px 24px;',
        ' .footer-content': 'gap: 34px; margin-bottom: 40px;',
        ' .brand-desc': 'max-width: none; font-size: 0.94rem;',
        ' .footer-links-group': 'grid-template-columns: 1fr 1fr; gap: 28px 22px;',
        ' .footer-title': 'font-size: 1.06rem; margin-bottom: 16px;',
        ' .footer-links': 'gap: 12px;',
        ' .footer-link': 'font-size: 0.9rem;',
        ' .footer-subscribe': 'max-width: none;',
        ' .subscribe-input': 'min-height: 50px;',
        ' .footer-bottom': 'flex-direction: column; gap: 16px; text-align: center;',
        ' .legal-links': 'flex-wrap: wrap; justify-content: center; gap: 10px;',
      },
    ),
    css('@media (max-width: 420px)').styles(
      raw: {
        ' .footer-links-group': 'grid-template-columns: 1fr;',
      },
    ),
  ];
}
