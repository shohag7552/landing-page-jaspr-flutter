/// Shared visual primitives.
///
/// The rule that keeps this codebase sane: **every section-local class is
/// prefixed with its section** (`hero-`, `zone-`, `tracking-`, `showcase-`).
/// Anything unprefixed — `.btn`, `.card`, `.container` — lives here.
///
/// Before this file existed, `.btn` and `.container` were defined inside
/// `navbar.dart` while five other sections used them, so editing the navbar
/// silently restyled the page. Don't reintroduce that.
///
/// NOTE ON FILE LOCATION: like `theme.dart`, this must stay at `lib/` root.
/// Jaspr sorts `lib/*.dart` before `lib/components/*`, so a component can
/// still override a primitive at equal specificity. In `lib/styles/` the
/// cascade would invert.
library;

import 'package:jaspr/dom.dart';

import 'theme.dart';

@css
List<StyleRule> get uiKit => [
  // ── Layout ────────────────────────────────────────────────────────────
  css('.container').styles(
    width: 100.percent,
    maxWidth: 1180.px,
    margin: Spacing.symmetric(horizontal: Unit.auto),
    padding: Spacing.symmetric(horizontal: 28.px),
    boxSizing: BoxSizing.borderBox,
  ),
  css('.section').styles(
    padding: Spacing.symmetric(vertical: 104.px, horizontal: 0.px),
    backgroundColor: Color.variable('--surface-0'),
    position: Position.relative(),
  ),
  css('.section--alt').styles(
    backgroundColor: Color.variable('--surface-1'),
  ),
  css('.section--tight').styles(
    padding: Spacing.symmetric(vertical: 72.px, horizontal: 0.px),
  ),

  // ── Section headers ───────────────────────────────────────────────────
  css('.section-header').styles(
    display: Display.flex,
    flexDirection: FlexDirection.column,
    maxWidth: 720.px,
    margin: Spacing.only(bottom: 56.px),
    gap: Gap.all(14.px),
  ),
  css('.section-header.text-center').styles(
    alignItems: AlignItems.center,
    textAlign: TextAlign.center,
    margin: Spacing.only(bottom: 56.px, left: Unit.auto, right: Unit.auto),
  ),
  css('.section-eyebrow').styles(
    color: Color.variable('--brand-500'),
    fontSize: 0.78.rem,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.6.px,
    textTransform: TextTransform.upperCase,
  ),
  css('.section-title').styles(
    color: Color.variable('--ink-900'),
    fontFamily: const FontFamily.list([FontFamily('Outfit'), FontFamilies.sansSerif]),
    fontSize: 2.6.rem,
    fontWeight: FontWeight.bold,
    lineHeight: 1.14.em,
    letterSpacing: (-0.6).px,
  ),
  css('.section-copy').styles(
    color: Color.variable('--ink-400'),
    fontSize: 1.05.rem,
    lineHeight: 1.7.em,
  ),

  // ── Buttons ───────────────────────────────────────────────────────────
  // Geometry is identical across every variant on purpose. Where the page
  // offers two ways to do the same thing (order on web / get the app), the
  // two buttons must read as equals — same height, same radius, same
  // padding — differing only in fill.
  css('.btn').styles(
    display: Display.inlineFlex,
    alignItems: AlignItems.center,
    justifyContent: JustifyContent.center,
    gap: Gap.all(9.px),
    height: 50.px,
    padding: Spacing.symmetric(horizontal: 24.px),
    radius: BorderRadius.circular(14.px),
    fontFamily: const FontFamily.list([FontFamily('Inter'), FontFamilies.sansSerif]),
    fontSize: 0.97.rem,
    fontWeight: FontWeight.w600,
    lineHeight: 1.em,
    cursor: Cursor.pointer,
    boxSizing: BoxSizing.borderBox,
    transition: Transition('all', duration: Duration(milliseconds: 240)),
    raw: {'border': '1px solid transparent', 'white-space': 'nowrap', 'text-align': 'center'},
  ),
  css('.btn-primary').styles(
    backgroundColor: Color.variable('--brand-500'),
    color: Color.variable('--brand-on'),
    raw: {'box-shadow': 'var(--shadow-brand)'},
  ),
  css('.btn-primary:hover').styles(
    backgroundColor: Color.variable('--brand-600'),
    transform: Transform.translate(y: (-2).px),
  ),
  // The companion to .btn-primary. An elevated white surface rather than a
  // hollow outline, so it holds equal visual weight instead of reading as a
  // fallback.
  css('.btn-secondary').styles(
    backgroundColor: Color.variable('--surface-card'),
    color: Color.variable('--ink-900'),
    raw: {'border': '1px solid var(--border-strong)', 'box-shadow': 'var(--shadow-sm)'},
  ),
  css('.btn-secondary:hover').styles(
    transform: Transform.translate(y: (-2).px),
    raw: {'border-color': 'var(--brand-500)', 'box-shadow': 'var(--shadow-card)'},
  ),
  css('.btn-ghost').styles(
    color: Color.variable('--ink-700'),
    backgroundColor: Colors.transparent,
  ),
  css('.btn-ghost:hover').styles(
    color: Color.variable('--brand-500'),
    backgroundColor: Color.variable('--brand-soft'),
  ),
  css('.btn-lg').styles(
    height: 56.px,
    padding: Spacing.symmetric(horizontal: 28.px),
    fontSize: 1.02.rem,
  ),
  css('.btn-block').styles(
    display: Display.flex,
    width: 100.percent,
  ),
  css('.btn .btn-icon').styles(
    display: Display.inlineFlex,
    transition: Transition('transform', duration: Duration(milliseconds: 240)),
  ),
  css('.btn:hover .btn-icon').styles(
    transform: Transform.translate(x: 3.px),
  ),

  // ── Surfaces ──────────────────────────────────────────────────────────
  css('.card').styles(
    backgroundColor: Color.variable('--surface-card'),
    padding: Spacing.all(28.px),
    boxSizing: BoxSizing.borderBox,
    transition: Transition('all', duration: Duration(milliseconds: 280)),
    raw: {
      'border': '1px solid var(--border-subtle)',
      'border-radius': 'var(--radius-lg)',
      'box-shadow': 'var(--shadow-sm)',
    },
  ),
  css('.card--lift:hover').styles(
    transform: Transform.translate(y: (-4).px),
    raw: {'box-shadow': 'var(--shadow-card)', 'border-color': 'var(--brand-a28)'},
  ),

  // ── Chips ─────────────────────────────────────────────────────────────
  css('.chip').styles(
    display: Display.inlineFlex,
    alignItems: AlignItems.center,
    gap: Gap.all(7.px),
    padding: Spacing.symmetric(horizontal: 13.px, vertical: 8.px),
    backgroundColor: Color.variable('--surface-card'),
    color: Color.variable('--ink-700'),
    fontSize: 0.85.rem,
    fontWeight: FontWeight.w600,
    lineHeight: 1.em,
    raw: {
      'border': '1px solid var(--border-subtle)',
      'border-radius': 'var(--radius-pill)',
      'white-space': 'nowrap',
    },
  ),
  css('.chip--food').styles(
    backgroundColor: Color.variable('--module-food-soft'),
    color: Color.variable('--module-food'),
    raw: {'border-color': 'transparent'},
  ),
  css('.chip--shop').styles(
    backgroundColor: Color.variable('--module-shop-soft'),
    color: Color.variable('--module-shop'),
    raw: {'border-color': 'transparent'},
  ),
  css('.chip--success').styles(
    backgroundColor: Color.variable('--success-soft'),
    color: Color.variable('--success-ink'),
    raw: {'border-color': 'transparent'},
  ),

  // ── Icon tiles ────────────────────────────────────────────────────────
  css('.icon-tile').styles(
    display: Display.inlineFlex,
    alignItems: AlignItems.center,
    justifyContent: JustifyContent.center,
    width: 56.px,
    height: 56.px,
    backgroundColor: Color.variable('--brand-soft'),
    color: Color.variable('--brand-500'),
    raw: {'border-radius': 'var(--radius-md)', 'flex-shrink': '0'},
  ),
  css('.icon-tile--sm').styles(width: 42.px, height: 42.px),
  css('.icon-tile--food').styles(
    backgroundColor: Color.variable('--module-food-soft'),
    color: Color.variable('--module-food'),
  ),
  css('.icon-tile--shop').styles(
    backgroundColor: Color.variable('--module-shop-soft'),
    color: Color.variable('--module-shop'),
  ),
  css('.icon-tile--rider').styles(
    backgroundColor: Color.variable('--rider-soft'),
    color: Color.variable('--rider'),
  ),
  css('.icon-tile--success').styles(
    backgroundColor: Color.variable('--success-soft'),
    color: Color.variable('--success-ink'),
  ),

  // ── Inline link with a trailing arrow ─────────────────────────────────
  css('.link-arrow').styles(
    display: Display.inlineFlex,
    alignItems: AlignItems.center,
    gap: Gap.all(7.px),
    color: Color.variable('--brand-500'),
    fontWeight: FontWeight.w600,
    fontSize: 0.96.rem,
    transition: Transition('gap', duration: Duration(milliseconds: 240)),
  ),
  css('.link-arrow:hover').styles(gap: Gap.all(11.px)),

  // ── Utilities ─────────────────────────────────────────────────────────
  css('.text-center').styles(textAlign: TextAlign.center),
  // Accessible label that is present for screen readers but not painted.
  css('.sr-only').styles(
    position: Position.absolute(),
    width: 1.px,
    height: 1.px,
    padding: Spacing.zero,
    margin: Spacing.all((-1).px),
    border: Border.unset,
    raw: {'overflow': 'hidden', 'clip': 'rect(0 0 0 0)', 'white-space': 'nowrap'},
  ),
  // Anchor targets must clear the fixed navbar.
  css('[id]').styles(raw: {'scroll-margin-top': '92px'}),

  // ── Accessibility: visible focus ──────────────────────────────────────
  // The original design had no focus styling at all, which makes the page
  // unusable by keyboard.
  css('a:focus-visible, button:focus-visible, input:focus-visible').styles(
    raw: {'outline': '3px solid var(--brand-a28)', 'outline-offset': '3px', 'border-radius': 'var(--radius-sm)'},
  ),

  // NOTE: the `prefers-reduced-motion` guard lives in the document head
  // (main.server.dart) — jaspr's typed MediaQuery has no constructor for it.

  // ── Responsive ────────────────────────────────────────────────────────
  css.media(MediaQuery.screen(maxWidth: bpLg.px), [
    css('.section').styles(padding: Spacing.symmetric(vertical: 84.px, horizontal: 0.px)),
    css('.section-title').styles(fontSize: 2.3.rem),
  ]),
  css.media(MediaQuery.screen(maxWidth: bpMd.px), [
    css('.container').styles(padding: Spacing.symmetric(horizontal: 20.px)),
    css('.section').styles(padding: Spacing.symmetric(vertical: 64.px, horizontal: 0.px)),
    css('.section--tight').styles(padding: Spacing.symmetric(vertical: 44.px, horizontal: 0.px)),
    css('.section-header').styles(margin: Spacing.only(bottom: 36.px)),
    css('.section-header.text-center').styles(
      alignItems: AlignItems.start,
      textAlign: TextAlign.left,
      margin: Spacing.only(bottom: 36.px),
    ),
    css('.section-title').styles(fontSize: 1.98.rem),
    css('.section-copy').styles(fontSize: 0.99.rem),
  ]),
  css.media(MediaQuery.screen(maxWidth: bpSm.px), [
    css('.container').styles(padding: Spacing.symmetric(horizontal: 16.px)),
    css('.section').styles(padding: Spacing.symmetric(vertical: 52.px, horizontal: 0.px)),
    css('.section-title').styles(fontSize: 1.72.rem),
    css('.section-eyebrow').styles(fontSize: 0.72.rem, letterSpacing: 1.2.px),
    css('.section-copy').styles(fontSize: 0.95.rem),
    css('.card').styles(padding: Spacing.all(20.px)),
    css('.btn').styles(height: 48.px, padding: Spacing.symmetric(horizontal: 18.px), fontSize: 0.93.rem),
    css('.btn-lg').styles(height: 52.px, padding: Spacing.symmetric(horizontal: 22.px), fontSize: 0.97.rem),
  ]),
];
