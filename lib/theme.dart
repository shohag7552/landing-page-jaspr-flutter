/// Brand tokens — the single place a store owner rebrands this site.
///
/// Everything visual on the page resolves through the custom properties below.
/// Change `--brand-500` and the whole site follows: buttons, links, gradients,
/// shadows, chips, hovers, focus rings.
///
/// Why custom properties rather than Dart constants: most of the interesting
/// colour work happens inside `raw:` CSS strings (gradients, borders, shadows),
/// where a Dart `Color` cannot reach but `var(--token)` composes freely.
///
/// NOTE ON FILE LOCATION: this file must stay at `lib/` root. Jaspr's style
/// collector (`comparePathsWithPriority`) sorts `lib/*.dart` *before*
/// `lib/components/*`, so component rules still win over these at equal
/// specificity. Moving it to `lib/styles/` would invert the cascade.
library;

import 'package:jaspr/dom.dart';

// ─── Breakpoints ────────────────────────────────────────────────────────────
// CSS custom properties cannot be used in media query conditions, so the
// responsive scale lives here as Dart constants. Four values, one job each.

/// Phone.
const bpSm = 520;

/// Large phone / small tablet.
const bpMd = 768;

/// Tablet → single column. Navigation switches to mobile here too.
const bpLg = 992;

/// Wide desktop — grid density only.
const bpXl = 1200;

/// The brand colour as a plain hex string.
///
/// Needed because a few places are not CSS and so cannot read `var()`:
/// the `theme-color` meta tag (which tints mobile browser chrome) and any
/// future manifest. Keep it identical to `--brand-500` below.
const kBrandHex = '#C6453E';

@css
List<StyleRule> get brandTokens => [
  css(':root').styles(
    raw: {
      // ── Brand ──────────────────────────────────────────────────────────
      // Rebrand starts and, in most cases, ends here.
      // Change this ONE value and the whole site follows. Everything below is
      // derived from it with color-mix() rather than restated, so there is no
      // second orange hiding in a gradient or a shadow.
      '--brand-500': kBrandHex,
      '--brand-600': 'color-mix(in srgb, var(--brand-500) 86%, #000)',
      '--brand-soft': 'color-mix(in srgb, var(--brand-500) 11%, #FFF)',
      '--brand-on': '#FFFFFF',
      '--brand-a10': 'color-mix(in srgb, var(--brand-500) 10%, transparent)',
      '--brand-a14': 'color-mix(in srgb, var(--brand-500) 14%, transparent)',
      '--brand-a18': 'color-mix(in srgb, var(--brand-500) 18%, transparent)',
      '--brand-a28': 'color-mix(in srgb, var(--brand-500) 28%, transparent)',

      // ── Ink (text) ─────────────────────────────────────────────────────
      '--ink-900': '#111827',
      '--ink-800': '#182230',
      '--ink-700': '#344054',
      '--ink-500': '#596579',
      '--ink-400': '#667085',
      '--ink-a06': 'rgba(17, 24, 39, 0.06)',
      '--ink-a08': 'rgba(17, 24, 39, 0.08)',
      '--ink-a10': 'rgba(17, 24, 39, 0.10)',
      '--ink-a12': 'rgba(17, 24, 39, 0.12)',
      '--ink-a18': 'rgba(17, 24, 39, 0.18)',

      // ── Surfaces ───────────────────────────────────────────────────────
      '--surface-0': '#FFFCFA',
      '--surface-1': '#F8FAFC',
      '--surface-2': '#F2F4F7',
      '--surface-card': '#FFFFFF',
      '--surface-raised': 'rgba(255, 255, 255, 0.94)',
      '--surface-invert': '#0B111D',
      '--border-subtle': 'var(--ink-a08)',
      '--border-strong': 'var(--ink-a12)',

      // ── Modules ────────────────────────────────────────────────────────
      // Module hues identify food vs shop in exactly three places: the module
      // chip, the icon tile, and the active tab underline. Never a section
      // background, never a button fill — the brand accent owns all chrome.
      '--module-food': 'var(--brand-500)',
      '--module-food-soft': 'var(--brand-soft)',
      '--module-shop': '#12805C',
      '--module-shop-soft': '#ECFDF3',

      // ── Status ─────────────────────────────────────────────────────────
      '--success': '#16A34A',
      '--success-soft': '#ECFDF3',
      '--success-ink': '#047857',
      '--rider': '#4F46E5',
      '--rider-soft': '#EEF2FF',

      // ── Scale ──────────────────────────────────────────────────────────
      '--radius-sm': '12px',
      '--radius-md': '18px',
      '--radius-lg': '22px',
      '--radius-xl': '32px',
      '--radius-pill': '999px',
      '--shadow-sm': '0 4px 10px rgba(17, 24, 39, 0.06)',
      '--shadow-card': '0 26px 56px rgba(17, 24, 39, 0.10)',
      '--shadow-lift': '0 30px 60px rgba(17, 24, 39, 0.14)',
      '--shadow-brand': '0 16px 30px var(--brand-a28)',

      // ── Type ───────────────────────────────────────────────────────────
      '--font-body': "'Inter', system-ui, -apple-system, sans-serif",
      '--font-display': "'Outfit', 'Inter', system-ui, sans-serif",
    },
  ),

  // ── Dark theme ────────────────────────────────────────────────────────
  // Redefines token *values* only. Because every component reads
  // `var(--ink-900)` rather than `#111827`, no per-component dark rule is
  // needed — the handful that remain in main.server.dart are structural.
  css('html.dark-mode').styles(
    raw: {
      '--brand-soft': 'var(--brand-a14)',
      '--brand-on': '#FFFFFF',

      '--ink-900': '#F8FAFC',
      '--ink-800': '#E5E7EB',
      '--ink-700': '#CBD5E1',
      '--ink-500': '#AAB4C5',
      '--ink-400': '#AAB4C5',
      '--ink-a06': 'rgba(255, 255, 255, 0.06)',
      '--ink-a08': 'rgba(255, 255, 255, 0.10)',
      '--ink-a10': 'rgba(255, 255, 255, 0.10)',
      '--ink-a12': 'rgba(255, 255, 255, 0.14)',
      '--ink-a18': 'rgba(255, 255, 255, 0.18)',

      '--surface-0': '#080C14',
      '--surface-1': '#0B111D',
      '--surface-2': '#1F2937',
      '--surface-card': '#111827',
      '--surface-raised': 'rgba(17, 24, 39, 0.86)',
      '--surface-invert': '#0B111D',

      '--module-shop': '#34D399',
      '--module-shop-soft': 'rgba(18, 128, 92, 0.18)',

      '--success-soft': 'rgba(22, 163, 74, 0.14)',
      '--success-ink': '#86EFAC',
      '--rider': '#A5B4FC',
      '--rider-soft': 'rgba(79, 70, 229, 0.16)',

      '--shadow-sm': '0 4px 10px rgba(0, 0, 0, 0.24)',
      '--shadow-card': '0 26px 56px rgba(0, 0, 0, 0.28)',
      '--shadow-lift': '0 30px 60px rgba(0, 0, 0, 0.36)',
    },
  ),
];
