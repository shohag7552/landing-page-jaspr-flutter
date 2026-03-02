import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr_router/jaspr_router.dart';

class FooterSection extends StatelessComponent {
  const FooterSection({super.key});

  @override
  Component build(BuildContext context) {

    return footer(classes: 'footer', [
      div(classes: 'container', [
        div(classes: 'footer-content', [
          // Brand Column
          div(classes: 'footer-brand', [
            div(classes: 'logo-container mb-4', [
              span(classes: 'logo-icon', [text('🍔')]),
              span(classes: 'logo-text', [
                text('Food'),
                span(classes: 'text-primary', [text('ie')]),
              ]),
            ]),
            p(classes: 'brand-desc', [
              text('Our job is to filling your tummy with delicious food and with fast and free delivery.')
            ]),
            div(classes: 'social-links', [
              a(href: '#', classes: 'social-icon', [text('📘')]),
              a(href: '#', classes: 'social-icon', [text('📸')]),
              a(href: '#', classes: 'social-icon', [text('🐦')]),
            ])
          ]),

          // Links Columns
          div(classes: 'footer-links-group', [
            _buildLinksColumn('About', ['About Us', 'Features', 'News', 'Menu']),
            _buildLinksColumn('Company', ['Why Foodie?', 'Partner With Us', 'FAQ', 'Blog']),
            _buildLinksColumn('Support', ['Account', 'Support Center', 'Feedback', 'Contact Us']),
          ]),
          
          // Subscribe Column
          div(classes: 'footer-subscribe', [
            h4(classes: 'footer-title', [text('Get in Touch')]),
            p(classes: 'subscribe-desc', [text('Question or feedback? We\'d love to hear from you')]),
            div(classes: 'subscribe-form', [
               input(type: InputType.email, attributes: {'placeholder': 'Email Address'}, classes: 'subscribe-input'),
               button(classes: 'btn btn-primary subscribe-btn', [
                 span(classes: 'icon', [text('→')]),
               ])
            ])
          ])
        ]),

        div(classes: 'footer-bottom', [
          p(classes: 'copyright', [
            text('© 2026 Foodie. All rights reserved.')
          ]),
          div(classes: 'legal-links', [
            a(href: '#', classes: 'legal-link', [text('Terms & Conditions')]),
            span(classes: 'separator', [text('•')]),
            a(href: '#', classes: 'legal-link', [text('Privacy Policy')]),
          ])
        ])
      ])
    ]);
  
  }

  Component _buildLinksColumn(String title, List<String> links) {
    return div(classes: 'footer-column', [
      h4(classes: 'footer-title', [text(title)]),
      ul(classes: 'footer-links', [
        for (final link in links)
          li(classes: 'footer-item', [
            a(href: '#', classes: 'footer-link', [text(link)])
          ])
      ])
    ]);
  }

  @css
  static final styles = [
    css('.footer').styles(
      backgroundColor: Color('#0F172A'),
      color: Colors.white,
      padding: Spacing.only(top: 80.px, bottom: 24.px),
      
      margin: Spacing.only(top: 80.px),
    ),
    css('.footer-content').styles(
      display: Display.grid,
      gridTemplate: GridTemplate(columns: GridTracks([
        GridTrack(TrackSize.auto),
        GridTrack(TrackSize.fr(1)),
        GridTrack(TrackSize.auto),
      ])),
      gap: Gap.all(64.px),
      margin: Spacing.only(bottom: 64.px),
    ),
    css('.mb-4').styles(
      margin: Spacing.only(bottom: 16.px),
    ),
    css('.footer .logo-text').styles(
      color: Colors.white,
    ),
    css('.brand-desc').styles(
      color: Color('#94A3B8'),
      lineHeight: 1.6.em,
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
      backgroundColor: Color('#1E293B'),
      radius: BorderRadius.circular(50.percent),
      display: Display.flex,
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.center,
      color: Colors.white,
      transition: Transition('all', duration: Duration(milliseconds: 300)),
      textDecoration: TextDecoration(line: TextDecorationLine.none),
    ),
    css('.social-icon:hover').styles(
      backgroundColor: Color('#FF5E1E'),
      transform: Transform.translate(y: (-4).px),
    ),
    css('.footer-links-group').styles(
      display: Display.grid,
      gridTemplate: GridTemplate(columns: GridTracks([
        GridTrack(TrackSize.fr(1)),
        GridTrack(TrackSize.fr(1)),
        GridTrack(TrackSize.fr(1)),
      ])),
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
      color: Color('#94A3B8'),
      textDecoration: TextDecoration(line: TextDecorationLine.none),
      transition: Transition('color', duration: Duration(milliseconds: 200)),
      fontSize: 0.95.rem,
    ),
    css('.footer-link:hover').styles(
      color: Color('#FF5E1E'),
    ),
    css('.subscribe-desc').styles(
      color: Color('#94A3B8'),
      lineHeight: 1.6.em,
      margin: Spacing.only(bottom: 24.px),
    ),
    css('.subscribe-form').styles(
      position: Position.relative(),
      display: Display.flex,
      alignItems: AlignItems.center,
    ),
    css('.subscribe-input').styles(
      width: 100.percent,
      backgroundColor: Color('#1E293B'),
      border: Border.unset,
      radius: BorderRadius.circular(50.px),
      padding: Spacing.only(top: 16.px, bottom: 16.px, left: 24.px, right: 64.px),
      color: Colors.white,
      fontSize: 0.95.rem,
      fontFamily: const FontFamily.list([FontFamily('Inter'), FontFamilies.sansSerif]),
    ),
    css('.subscribe-input:focus').styles(
      raw: {'outline': '1px solid #FF5E1E'},
    ),
    css('.subscribe-btn').styles(
      position: Position.absolute(right: 6.px),
      width: 40.px,
      height: 40.px,
      padding: Spacing.zero,
      radius: BorderRadius.circular(50.percent),
      display: Display.flex,
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.center,
    ),
    css('.footer-bottom').styles(
      display: Display.flex,
      justifyContent: JustifyContent.spaceBetween,
      alignItems: AlignItems.center,
      padding: Spacing.only(top: 32.px),
      raw: {'border-top': '1px solid #1E293B'},
    ),
    css('.copyright').styles(
      color: Color('#64748B'),
      fontSize: 0.875.rem,
    ),
    css('.legal-links').styles(
      display: Display.flex,
      alignItems: AlignItems.center,
      gap: Gap.all(16.px),
    ),
    css('.legal-link').styles(
      color: Color('#64748B'),
      textDecoration: TextDecoration(line: TextDecorationLine.none),
      fontSize: 0.875.rem,
      transition: Transition('color', duration: Duration(milliseconds: 200)),
    ),
    css('.legal-link:hover').styles(
      color: Color('#FF5E1E'),
    ),
    css('.separator').styles(
      color: Color('#334155'),
    ),
    css('@media (max-width: 1024px)').styles(
      raw: {
        ' .footer-content': 'grid-template-columns: 1fr; gap: 48px;',
        ' .footer-brand': 'max-width: 400px;',
      }
    ),
    css('@media (max-width: 640px)').styles(
      raw: {
        ' .footer-links-group': 'grid-template-columns: 1fr; gap: 32px;',
        ' .footer-bottom': 'flex-direction: column; gap: 16px; text-align: center;',
      }
    )
  ];
}
