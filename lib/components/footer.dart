import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../data/landing_data.dart';
import '../theme.dart';
import 'ui/brand_logo.dart';
import 'ui/icons.dart';

/// Consumer footer.
///
/// The newsletter signup that used to live here had no form and no handler —
/// a dead control asking for a "work email" on a page for shoppers. It is
/// replaced by the thing a local customer actually wants: a phone number, an
/// address, and opening hours.
///
/// `Store login` and `Deliver with us` sit in the bottom utility row. They are
/// real destinations for a small slice of visitors — the owner, and people
/// looking for rider work — but they must never compete with ordering.
class FooterSection extends StatelessComponent {
  const FooterSection({super.key});

  static const _helpLinks = <(String, String)>[
    ('Delivery areas', '#delivery'),
    ('How it works', '#how-it-works'),
    ('Get the app', '#get-app'),
    ('Contact us', '#contact'),
  ];

  @override
  Component build(BuildContext context) {
    final data = LandingScope.of(context);
    final shopLinks = <(String, String)>[
      if (data.foodEnabled) ('Food menu', data.webAppUrl),
      if (data.shopEnabled) ('Shop products', data.webAppUrl),
      ('Track your order', data.webAppUrl),
    ];

    return footer(id: 'contact', classes: 'footer', [
      div(classes: 'container', [
        div(classes: 'footer-top', [
          // Brand
          div(classes: 'footer-brand', [
            BrandLogo(
              brandFirst: data.brandFirst,
              brandSecond: data.brandSecond,
              logoUrl: data.logoUrl,
            ),
            p(classes: 'footer-tagline', [
              Component.text(
                'Food and products, delivered across ${data.city}. One cart, one rider.',
              ),
            ]),
            div(classes: 'footer-social', [
              _socialLink(data.facebookUrl, 'Facebook', 'f'),
              _socialLink(data.instagramUrl, 'Instagram', 'ig'),
              _socialLink(data.twitterUrl, 'X', 'x'),
            ]),
          ]),

          _linksColumn('Shop', shopLinks),
          _linksColumn('Help', _helpLinks),

          // Contact — replaces the old dead newsletter form.
          div(classes: 'footer-col footer-contact', [
            h3(classes: 'footer-col-title', [Component.text('Visit or call us')]),
            div(classes: 'footer-contact-list', [
              _contactRow(iconMapPin(size: 17), data.storeAddress, null),
              _contactRow(iconPhone(size: 17), data.phone, data.phoneHref),
              _contactRow(iconChat(size: 17), data.email, data.emailHref),
              _contactRow(iconClock(size: 17), 'Open ${data.openingHours}', null),
            ]),
          ]),
        ]),

        div(classes: 'footer-bottom', [
          span(classes: 'footer-copy', [
            Component.text(data.copyright),
          ]),
          div(classes: 'footer-utility', [
            a(
              href: data.storePanelUrl,
              classes: 'footer-utility-link',
              target: Target.blank,
              attributes: const {'rel': 'noopener'},
              [Component.text('Store login')],
            ),
            a(href: data.riderApplyUrl, classes: 'footer-utility-link', [Component.text('Deliver with us')]),
            a(href: data.termsUrl, classes: 'footer-utility-link', [Component.text('Terms')]),
            a(href: data.privacyUrl, classes: 'footer-utility-link', [Component.text('Privacy')]),
          ]),
        ]),
      ]),
    ]);
  }

  Component _linksColumn(String title, List<(String, String)> links) {
    return div(classes: 'footer-col', [
      h3(classes: 'footer-col-title', [Component.text(title)]),
      nav(classes: 'footer-links', attributes: {'aria-label': title}, [
        for (final (label, href) in links)
          a(href: href, classes: 'footer-link', [Component.text(label)]),
      ]),
    ]);
  }

  Component _contactRow(Component icon, String text, String? href) {
    final body = href == null
        ? span(classes: 'footer-contact-text', [Component.text(text)])
        : a(href: href, classes: 'footer-contact-text footer-contact-link', [Component.text(text)]);

    return div(classes: 'footer-contact-row', [
      span(classes: 'footer-contact-icon', [icon]),
      body,
    ]);
  }

  Component _socialLink(String href, String label, String glyph) {
    return a(
      href: href,
      classes: 'footer-social-link',
      target: Target.blank,
      attributes: {'rel': 'noopener', 'aria-label': label},
      [span(classes: 'footer-social-glyph', [Component.text(glyph)])],
    );
  }

  @css
  static List<StyleRule> get styles => [
    css('.footer').styles(
      padding: Spacing.only(top: 76.px, bottom: 30.px),
      backgroundColor: Color.variable('--surface-1'),
      raw: {'border-top': '1px solid var(--border-subtle)'},
    ),
    css('.footer-top').styles(
      display: Display.grid,
      gap: Gap.all(44.px),
      padding: Spacing.only(bottom: 40.px),
      gridTemplate: const GridTemplate(
        columns: GridTracks([
          GridTrack(TrackSize.fr(1.5)),
          GridTrack(TrackSize.fr(1)),
          GridTrack(TrackSize.fr(1)),
          GridTrack(TrackSize.fr(1.4)),
        ]),
      ),
    ),

    css('.footer-brand').styles(
      display: Display.flex,
      flexDirection: FlexDirection.column,
      gap: Gap.all(16.px),
      maxWidth: 320.px,
    ),
    css('.footer-tagline').styles(
      color: Color.variable('--ink-400'),
      fontSize: 0.94.rem,
      lineHeight: 1.68.em,
    ),
    css('.footer-social').styles(
      display: Display.flex,
      gap: Gap.all(10.px),
    ),
    css('.footer-social-link').styles(
      display: Display.inlineFlex,
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.center,
      width: 38.px,
      height: 38.px,
      backgroundColor: Color.variable('--surface-card'),
      color: Color.variable('--ink-500'),
      fontSize: 0.82.rem,
      fontWeight: FontWeight.bold,
      transition: const Transition('all', duration: Duration(milliseconds: 220)),
      raw: {'border': '1px solid var(--border-subtle)', 'border-radius': '50%'},
    ),
    css('.footer-social-link:hover').styles(
      backgroundColor: Color.variable('--brand-soft'),
      color: Color.variable('--brand-500'),
      raw: {'border-color': 'var(--brand-500)'},
    ),

    css('.footer-col').styles(
      display: Display.flex,
      flexDirection: FlexDirection.column,
      gap: Gap.all(15.px),
    ),
    css('.footer-col-title').styles(
      color: Color.variable('--ink-900'),
      fontSize: 0.94.rem,
      fontWeight: FontWeight.bold,
    ),
    css('.footer-links').styles(
      display: Display.flex,
      flexDirection: FlexDirection.column,
      gap: Gap.all(11.px),
    ),
    css('.footer-link').styles(
      color: Color.variable('--ink-400'),
      fontSize: 0.92.rem,
      transition: const Transition('color', duration: Duration(milliseconds: 200)),
    ),
    css('.footer-link:hover').styles(color: Color.variable('--brand-500')),

    css('.footer-contact-list').styles(
      display: Display.flex,
      flexDirection: FlexDirection.column,
      gap: Gap.all(12.px),
    ),
    css('.footer-contact-row').styles(
      display: Display.flex,
      alignItems: AlignItems.start,
      gap: Gap.all(11.px),
    ),
    css('.footer-contact-icon').styles(
      display: Display.inlineFlex,
      margin: Spacing.only(top: 2.px),
      color: Color.variable('--brand-500'),
      raw: {'flex-shrink': '0'},
    ),
    css('.footer-contact-text').styles(
      color: Color.variable('--ink-400'),
      fontSize: 0.92.rem,
      lineHeight: 1.5.em,
    ),
    css('.footer-contact-link:hover').styles(color: Color.variable('--brand-500')),

    css('.footer-bottom').styles(
      display: Display.flex,
      flexWrap: FlexWrap.wrap,
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.spaceBetween,
      gap: Gap.all(16.px),
      padding: Spacing.only(top: 26.px),
      raw: {'border-top': '1px solid var(--border-subtle)'},
    ),
    css('.footer-copy').styles(
      color: Color.variable('--ink-400'),
      fontSize: 0.86.rem,
    ),
    css('.footer-utility').styles(
      display: Display.flex,
      flexWrap: FlexWrap.wrap,
      gap: Gap.all(20.px),
    ),
    css('.footer-utility-link').styles(
      color: Color.variable('--ink-400'),
      fontSize: 0.86.rem,
      transition: const Transition('color', duration: Duration(milliseconds: 200)),
    ),
    css('.footer-utility-link:hover').styles(color: Color.variable('--brand-500')),

    css.media(MediaQuery.screen(maxWidth: bpLg.px), [
      css('.footer-top').styles(
        gap: Gap.all(34.px),
        gridTemplate: const GridTemplate(
          columns: GridTracks([GridTrack(TrackSize.fr(1)), GridTrack(TrackSize.fr(1))]),
        ),
      ),
      css('.footer-brand').styles(maxWidth: 100.percent),
    ]),
    css.media(MediaQuery.screen(maxWidth: bpSm.px), [
      css('.footer').styles(padding: Spacing.only(top: 52.px, bottom: 24.px)),
      css('.footer-top').styles(
        gap: Gap.all(28.px),
        gridTemplate: const GridTemplate(columns: GridTracks([GridTrack(TrackSize.fr(1))])),
      ),
      css('.footer-bottom').styles(
        flexDirection: FlexDirection.column,
        alignItems: AlignItems.start,
        gap: Gap.all(14.px),
      ),
      css('.footer-utility').styles(gap: Gap.all(14.px)),
    ]),
  ];
}
