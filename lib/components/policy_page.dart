import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../data/landing_data.dart';
import '../theme.dart';
import 'footer.dart';
import 'navbar.dart';

/// Which document a [PolicyPage] shows.
enum PolicyKind { terms, privacy, about }

/// A standalone page for one of the store's legal documents.
///
/// These are real URLs rather than a panel on the landing page, because a
/// privacy policy link is something app stores ask for at submission and
/// customers expect to be able to bookmark.
///
/// Content comes from the `privacy_policy` table — the same rows the store
/// already edits under Settings → Policies, and the same ones the customer app
/// shows. Nothing is duplicated for the website.
class PolicyPage extends StatelessComponent {
  const PolicyPage({required this.kind, super.key});

  final PolicyKind kind;

  String _title(LandingData data) => switch (kind) {
    PolicyKind.terms => 'Terms & Conditions',
    PolicyKind.privacy => 'Privacy Policy',
    PolicyKind.about => 'About ${data.brandName}',
  };

  String _body(LandingData data) => switch (kind) {
    PolicyKind.terms => data.termsHtml,
    PolicyKind.privacy => data.privacyHtml,
    PolicyKind.about => data.aboutHtml,
  };

  /// True when the value carries markup rather than plain text.
  static bool _looksLikeHtml(String value) => RegExp(r'<[a-zA-Z/]').hasMatch(value);

  @override
  Component build(BuildContext context) {
    final data = LandingScope.of(context);
    final title = _title(data);
    final body = _body(data);

    return div(classes: 'app-wrapper', [
      // Its own title and description: a policy page indexed as "Order Food
      // Online" helps nobody.
      Document.head(
        title: '$title — ${data.brandName}',
        meta: {'description': '$title for ${data.brandName}, ${data.city}.'},
      ),

      Navbar(
        brandFirst: data.brandFirst,
        brandSecond: data.brandSecond,
        orderUrl: data.webAppUrl,
        logoUrl: data.logoUrl,
        linkPrefix: '/',
      ),

      section(classes: 'policy', [
        div(classes: 'container policy-inner', [
          a(href: '/', classes: 'link-arrow policy-back', [Component.text('← Back to home')]),
          h1(classes: 'policy-title', [Component.text(title)]),

          if (body.isEmpty)
            p(classes: 'policy-empty', [
              Component.text('This document has not been published yet.'),
            ])
          else
            // These fields hold whatever the store pasted: sometimes real
            // markup, sometimes plain text with line breaks. Markup already
            // carries its own paragraphs, so honouring source newlines there
            // doubles the spacing and splits sentences; plain text needs
            // exactly that to stay readable.
            div(
              classes: 'policy-body ${_looksLikeHtml(body) ? '' : 'policy-body--text'}',
              [RawText(body)],
            ),
        ]),
      ]),

      const FooterSection(),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.policy').styles(
      padding: Spacing.only(top: 150.px, bottom: 90.px),
      backgroundColor: Color.variable('--surface-0'),
      raw: {'min-height': '70vh'},
    ),
    css('.policy-inner').styles(maxWidth: 820.px),
    css('.policy-back').styles(
      display: Display.inlineFlex,
      margin: Spacing.only(bottom: 22.px),
      fontSize: 0.92.rem,
    ),
    css('.policy-title').styles(
      margin: Spacing.only(bottom: 26.px),
      color: Color.variable('--ink-900'),
      fontFamily: const FontFamily.list([FontFamily('Outfit'), FontFamilies.sansSerif]),
      fontSize: 2.6.rem,
      fontWeight: FontWeight.bold,
      lineHeight: 1.15.em,
      letterSpacing: (-0.6).px,
    ),
    css('.policy-empty').styles(
      color: Color.variable('--ink-400'),
      fontSize: 1.02.rem,
    ),

    // The markup is whatever the store's editor produced, so style by element
    // rather than by class — there are no classes to hook onto.
    css('.policy-body').styles(
      color: Color.variable('--ink-700'),
      fontSize: 1.rem,
      lineHeight: 1.75.em,
      raw: {'overflow-wrap': 'break-word'},
    ),
    // Only for documents pasted as plain text, where the line breaks are the
    // only structure there is.
    css('.policy-body--text').styles(raw: {'white-space': 'pre-line'}),
    css('.policy-body p').styles(margin: Spacing.only(bottom: 16.px)),
    css('.policy-body h1, .policy-body h2, .policy-body h3').styles(
      margin: Spacing.only(top: 30.px, bottom: 12.px),
      color: Color.variable('--ink-900'),
      fontSize: 1.3.rem,
      lineHeight: 1.3.em,
    ),
    css('.policy-body ul, .policy-body ol').styles(
      margin: Spacing.only(bottom: 16.px),
      padding: Spacing.only(left: 22.px),
    ),
    css('.policy-body li').styles(margin: Spacing.only(bottom: 8.px)),
    css('.policy-body a').styles(
      color: Color.variable('--brand-500'),
      textDecoration: const TextDecoration(line: TextDecorationLine.underline),
    ),
    css('.policy-body strong, .policy-body b').styles(color: Color.variable('--ink-900')),
    css('.policy-body img').styles(
      margin: Spacing.symmetric(vertical: 16.px),
      raw: {'max-width': '100%', 'height': 'auto', 'border-radius': 'var(--radius-md)'},
    ),
    css('.policy-body table').styles(
      width: 100.percent,
      raw: {'border-collapse': 'collapse', 'display': 'block', 'overflow-x': 'auto'},
    ),

    css.media(MediaQuery.screen(maxWidth: bpMd.px), [
      css('.policy').styles(padding: Spacing.only(top: 120.px, bottom: 60.px)),
      css('.policy-title').styles(fontSize: 1.98.rem),
    ]),
  ];
}
