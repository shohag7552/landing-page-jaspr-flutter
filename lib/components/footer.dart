import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../content/site_strings.dart';
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

  static List<(String, String)> _helpLinks(SiteStrings t) => [
    (t.footerDeliveryAreas, '#delivery'),
    (t.footerHowItWorks, '#how-it-works'),
    (t.footerGetTheApp, '#get-app'),
    (t.footerContactUs, '#contact'),
  ];

  @override
  Component build(BuildContext context) {
    final data = LandingScope.of(context);
    final t = data.strings;
    final shopLinks = <(String, String)>[
      if (data.foodEnabled) (t.footerFoodMenu, data.webAppUrl),
      if (data.shopEnabled) (t.footerShopProducts, data.webAppUrl),
      (t.footerTrackOrder, data.webAppUrl),
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
                t.footerTagline.fill({'city': data.city}),
              ),
            ]),
            div(classes: 'footer-social', [
              _socialLink(data.facebookUrl, t.socialFacebook, 'f'),
              _socialLink(data.instagramUrl, t.socialInstagram, 'ig'),
              _socialLink(data.twitterUrl, t.socialTwitter, 'x'),
            ]),
          ]),

          _linksColumn(t.footerShop, shopLinks),
          _linksColumn(t.footerHelp, _helpLinks(t)),

          // Contact — replaces the old dead newsletter form.
          div(classes: 'footer-col footer-contact', [
            h3(classes: 'footer-col-title', [Component.text(t.footerContactTitle)]),
            div(classes: 'footer-contact-list', [
              _contactRow(iconMapPin(size: 17), data.storeAddress, null),
              _contactRow(iconPhone(size: 17), data.phone, data.phoneHref),
              _contactRow(iconChat(size: 17), data.email, data.emailHref),
              _contactRow(iconClock(size: 17), t.footerOpenHours.fill({'hours': data.openingHours}), null),
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
              [Component.text(t.footerStoreLogin)],
            ),
            a(href: data.riderApplyUrl, classes: 'footer-utility-link', [Component.text(t.footerDeliverWithUs)]),
            // Points at this site's own page when the store has written the
            // document, at its external URL otherwise, and is dropped when
            // there is neither — a dead "Terms" link is worse than none.
            if (data.hasTerms)
              a(href: data.termsHref, classes: 'footer-utility-link', [Component.text(t.footerTerms)]),
            if (data.hasPrivacy)
              a(href: data.privacyHref, classes: 'footer-utility-link', [Component.text(t.footerPrivacy)]),
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
