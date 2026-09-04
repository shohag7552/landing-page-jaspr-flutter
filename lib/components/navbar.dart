import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:universal_web/js_interop.dart';
import 'package:universal_web/web.dart' as web;

import '../content/site_links.dart';
import '../theme.dart';
import 'ui/brand_logo.dart';
import 'ui/icons.dart';

/// Theme preference key. Read by the no-flash script in main.server.dart too —
/// keep the two in sync.
const kThemeStorageKey = 'kikomart-theme';

@client
class Navbar extends StatefulComponent {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => NavbarState();
}

class NavbarState extends State<Navbar> {
  bool isScrolled = false;
  bool isDarkMode = false;
  bool isMenuOpen = false;

  /// The nav item currently highlighted. Driven by scroll position, not by
  /// what was last clicked, so it stays honest if the reader scrolls away.
  String activeId = _navItems.first.$1;

  web.EventListener? _scrollListener;
  web.EventListener? _resizeListener;

  /// After a click we hold the highlight still for a moment. Smooth scrolling
  /// fires a scroll event for every frame of the animation, and without this
  /// the underline strobes through every section between here and the target.
  int _holdUntilMs = 0;

  /// Where a section counts as "current": just below the fixed navbar, which
  /// is also roughly where its heading lands thanks to `scroll-margin-top`.
  static const _spyLine = 120;

  @override
  void initState() {
    super.initState();
    if (kIsWeb) {
      // The theme class is already on <html> by now — the no-flash script in
      // the document head applied it before first paint. Read it back rather
      // than re-applying, so we never flash.
      isDarkMode = web.document.documentElement?.classList.contains('dark-mode') ?? false;
      _scrollListener = ((web.Event event) => _handleScroll()).toJS;
      _resizeListener = ((web.Event event) => _handleScroll()).toJS;
      web.window.addEventListener('scroll', _scrollListener);
      // Section offsets move when the layout reflows, so recompute on resize.
      web.window.addEventListener('resize', _resizeListener);
      _handleScroll();
    }
  }

  void _handleScroll() {
    if (!mounted) {
      return;
    }

    final shouldShowBackground = web.window.scrollY > 8;
    final nextActive = _activeSection();

    if (shouldShowBackground == isScrolled && nextActive == activeId) {
      return;
    }

    setState(() {
      isScrolled = shouldShowBackground;
      activeId = nextActive;
    });
  }

  /// The section whose top has most recently passed under the navbar.
  ///
  /// Picks the greatest offset still above the line rather than the last one
  /// in the list, because the nav order and the DOM order need not agree.
  String _activeSection() {
    if (DateTime.now().millisecondsSinceEpoch < _holdUntilMs) {
      return activeId;
    }

    final root = web.document.documentElement;
    if (root == null) {
      return activeId;
    }

    final scrollY = web.window.scrollY;

    // The last section can be too short to ever reach the line, so anyone who
    // has hit the bottom of the page is looking at it by definition.
    if (scrollY + web.window.innerHeight >= root.scrollHeight - 2) {
      return _navItems.last.$1;
    }

    final line = scrollY + _spyLine;
    var current = _navItems.first.$1;
    var bestTop = double.negativeInfinity;

    for (final (href, _) in _navItems) {
      final element = web.document.querySelector(href);
      if (element == null) {
        continue;
      }

      final top = element.getBoundingClientRect().top + scrollY;
      if (top <= line && top > bestTop) {
        bestTop = top;
        current = href;
      }
    }

    return current;
  }

  /// Highlight the clicked item straight away; the browser handles the scroll.
  ///
  /// IMPORTANT: every anchor that calls this must bind through `events:`,
  /// never through `onClick:`. Jaspr's `onClick` helper calls
  /// `preventDefault()` when the target is an anchor (see `events.dart` in the
  /// jaspr package), which cancels the browser's own hash navigation — the
  /// link then highlights but never scrolls. The raw event map does not.
  void _selectSection(String href) {
    _holdUntilMs = DateTime.now().millisecondsSinceEpoch + 700;
    _closeMenu();

    if (href == activeId) {
      return;
    }

    setState(() {
      activeId = href;
    });
  }

  void _toggleTheme() {
    final nextTheme = !isDarkMode;

    _applyTheme(nextTheme);
    web.window.localStorage.setItem(kThemeStorageKey, nextTheme ? 'dark' : 'light');

    setState(() {
      isDarkMode = nextTheme;
    });
  }

  void _toggleMenu() {
    setState(() {
      isMenuOpen = !isMenuOpen;
    });
  }

  void _closeMenu() {
    if (!isMenuOpen) {
      return;
    }

    setState(() {
      isMenuOpen = false;
    });
  }

  void _applyTheme(bool useDarkMode) {
    final root = web.document.documentElement;
    if (root == null) {
      return;
    }

    if (useDarkMode) {
      root.classList.add('dark-mode');
    } else {
      root.classList.remove('dark-mode');
    }
  }

  @override
  void dispose() {
    if (kIsWeb) {
      if (_scrollListener != null) {
        web.window.removeEventListener('scroll', _scrollListener);
      }
      if (_resizeListener != null) {
        web.window.removeEventListener('resize', _resizeListener);
      }
    }
    super.dispose();
  }

  /// Ordered to match the page, not by importance. With an underline that
  /// tracks scroll position, a nav whose order disagrees with the document
  /// makes the highlight jump backwards as you read.
  static const _navItems = <(String, String)>[
    ('#home', 'Home'),
    ('#delivery', 'Delivery'),
    ('#shop', 'Food & Shop'),
    ('#how-it-works', 'How it works'),
    ('#contact', 'Contact'),
  ];

  @override
  Component build(BuildContext context) {
    return header(
      classes: 'navbar ${isScrolled || isMenuOpen ? 'scrolled' : ''} ${isMenuOpen ? 'menu-open' : ''}',
      [
        div(classes: 'container nav-inner', [
          const BrandLogo(),

          nav(classes: 'nav-links desktop-only', attributes: const {'aria-label': 'Main'}, [
            for (final (href, label) in _navItems)
              a(
                href: href,
                classes: 'nav-link ${href == activeId ? 'active' : ''}',
                // NOT `onClick`. See _selectSection.
                events: {'click': (_) => _selectSection(href)},
                [Component.text(label)],
              ),
          ]),

          // Two ways in, both present. "Order now" is solid because it is the
          // action with no friction; "Get the app" is an anchor rather than a
          // second button so the pair still fits at tablet width.
          div(classes: 'nav-actions desktop-only', [
            a(href: '#get-app', classes: 'nav-applink', [Component.text('Get the app')]),
            _buildThemeToggle(),
            a(
              href: kWebAppUrl,
              classes: 'btn btn-primary',
              target: Target.blank,
              attributes: const {'rel': 'noopener'},
              [
                Component.text('Order now'),
                span(classes: 'btn-icon', [iconArrowRight(size: 17)]),
              ],
            ),
          ]),

          div(classes: 'mobile-controls mobile-only', [
            _buildThemeToggle(),
            button(
              classes: 'mobile-menu-toggle ${isMenuOpen ? 'active' : ''}',
              type: ButtonType.button,
              onClick: _toggleMenu,
              attributes: {'aria-label': isMenuOpen ? 'Close menu' : 'Open menu', 'aria-expanded': '$isMenuOpen'},
              [span(classes: 'hamburger', [])],
            ),
          ]),
        ]),

        div(classes: 'mobile-menu mobile-only ${isMenuOpen ? 'open' : ''}', [
          div(classes: 'mobile-menu-panel', [
            nav(classes: 'mobile-nav-links', attributes: const {'aria-label': 'Main'}, [
              for (final (href, label) in _navItems)
                a(
                  href: href,
                  classes: 'mobile-nav-link ${href == activeId ? 'active' : ''}',
                  // NOT `onClick`. See _selectSection.
                  events: {'click': (_) => _selectSection(href)},
                  [Component.text(label)],
                ),
            ]),
            div(classes: 'mobile-nav-actions', [
              a(
                href: kWebAppUrl,
                classes: 'btn btn-primary btn-block',
                target: Target.blank,
                attributes: const {'rel': 'noopener'},
                events: {'click': (_) => _closeMenu()},
                [Component.text('Order now')],
              ),
              a(
                href: '#get-app',
                classes: 'btn btn-secondary btn-block',
                events: {'click': (_) => _closeMenu()},
                [Component.text('Get the app')],
              ),
            ]),
          ]),
        ]),
      ],
    );
  }

  Component _buildThemeToggle() {
    return button(
      classes: 'theme-toggle ${isDarkMode ? 'dark' : 'light'}',
      type: ButtonType.button,
      onClick: _toggleTheme,
      attributes: {'aria-label': isDarkMode ? 'Switch to light mode' : 'Switch to dark mode'},
      [
        span(classes: 'theme-toggle-track', [
          span(classes: 'theme-toggle-thumb', [isDarkMode ? iconMoon(size: 14) : iconSun(size: 14)]),
        ]),
      ],
    );
  }

  @css
  static List<StyleRule> get styles => [
    css('.navbar').styles(
      position: Position.fixed(top: 0.px, left: 0.px, right: 0.px),
      zIndex: const ZIndex(1000),
      padding: Spacing.symmetric(vertical: 18.px),
      backgroundColor: Colors.transparent,
      transition: const Transition('all', duration: Duration(milliseconds: 300)),
      raw: {'backdrop-filter': 'blur(0px)'},
    ),
    css('.navbar.scrolled, .navbar.menu-open').styles(
      padding: Spacing.symmetric(vertical: 12.px),
      backgroundColor: Color.variable('--surface-raised'),
      raw: {
        'backdrop-filter': 'blur(18px)',
        'box-shadow': 'var(--shadow-card)',
        'border-bottom': '1px solid var(--border-subtle)',
      },
    ),
    css('.nav-inner').styles(
      display: Display.flex,
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.spaceBetween,
      gap: Gap.all(20.px),
    ),

    css('.nav-links').styles(
      display: Display.flex,
      alignItems: AlignItems.center,
      gap: Gap.all(26.px),
    ),
    css('.nav-link').styles(
      position: Position.relative(),
      color: Color.variable('--ink-500'),
      fontSize: 0.94.rem,
      fontWeight: FontWeight.w500,
      transition: const Transition('color', duration: Duration(milliseconds: 200)),
    ),
    css('.nav-link:hover, .nav-link.active').styles(
      color: Color.variable('--brand-500'),
    ),
    css('.nav-link.active::after').styles(
      position: Position.absolute(left: 0.px, right: 0.px, bottom: (-7).px),
      height: 2.px,
      backgroundColor: Color.variable('--brand-500'),
      raw: {'content': '""', 'border-radius': '2px'},
    ),

    css('.nav-actions').styles(
      display: Display.flex,
      alignItems: AlignItems.center,
      gap: Gap.all(16.px),
    ),
    css('.nav-applink').styles(
      color: Color.variable('--ink-700'),
      fontSize: 0.94.rem,
      fontWeight: FontWeight.w600,
      transition: const Transition('color', duration: Duration(milliseconds: 200)),
    ),
    css('.nav-applink:hover').styles(color: Color.variable('--brand-500')),

    // ── Theme toggle ────────────────────────────────────────────────────
    css('.theme-toggle').styles(
      display: Display.flex,
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.center,
      width: 56.px,
      height: 32.px,
      padding: Spacing.zero,
      backgroundColor: Colors.transparent,
      transition: const Transition('all', duration: Duration(milliseconds: 300)),
      raw: {'border': 'none', 'border-radius': 'var(--radius-pill)'},
    ),
    css('.theme-toggle-track').styles(
      display: Display.flex,
      alignItems: AlignItems.center,
      width: 56.px,
      height: 32.px,
      padding: Spacing.all(3.px),
      backgroundColor: Color.variable('--surface-2'),
      boxSizing: BoxSizing.borderBox,
      raw: {'border': '1px solid var(--border-strong)', 'border-radius': 'var(--radius-pill)'},
    ),
    css('.theme-toggle-thumb').styles(
      display: Display.flex,
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.center,
      width: 24.px,
      height: 24.px,
      backgroundColor: Color.variable('--surface-card'),
      color: Color.variable('--brand-500'),
      transition: const Transition('all', duration: Duration(milliseconds: 300)),
      raw: {'border-radius': '50%', 'box-shadow': 'var(--shadow-sm)'},
    ),
    css('.theme-toggle.dark .theme-toggle-thumb').styles(
      transform: Transform.translate(x: 24.px),
      backgroundColor: Color.variable('--surface-2'),
    ),

    // ── Mobile ──────────────────────────────────────────────────────────
    css('.mobile-only').styles(display: Display.none),
    css('.mobile-controls').styles(
      alignItems: AlignItems.center,
      gap: Gap.all(10.px),
    ),
    css('.mobile-menu-toggle').styles(
      display: Display.flex,
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.center,
      width: 44.px,
      height: 44.px,
      backgroundColor: Color.variable('--surface-2'),
      raw: {'border': '1px solid var(--border-strong)', 'border-radius': 'var(--radius-sm)'},
    ),
    css('.hamburger').styles(
      display: Display.block,
      position: Position.relative(),
      width: 22.px,
      height: 2.px,
      backgroundColor: Color.variable('--ink-900'),
      transition: const Transition('all', duration: Duration(milliseconds: 200)),
      raw: {'border-radius': '2px'},
    ),
    css('.hamburger::before, .hamburger::after').styles(
      position: Position.absolute(left: 0.px),
      width: 22.px,
      height: 2.px,
      backgroundColor: Color.variable('--ink-900'),
      transition: const Transition('all', duration: Duration(milliseconds: 200)),
      raw: {'content': '""', 'border-radius': '2px'},
    ),
    css('.hamburger::before').styles(position: Position.absolute(top: (-7).px)),
    css('.hamburger::after').styles(position: Position.absolute(top: 7.px)),

    css('.mobile-menu').styles(
      display: Display.none,
      width: 100.percent,
      maxWidth: 1180.px,
      margin: Spacing.symmetric(horizontal: Unit.auto),
      padding: Spacing.only(left: 20.px, right: 20.px, top: 12.px),
      boxSizing: BoxSizing.borderBox,
      raw: {'max-height': 'calc(100vh - 76px)', 'overflow-y': 'auto'},
    ),
    css('.mobile-menu-panel').styles(
      padding: Spacing.all(10.px),
      backgroundColor: Color.variable('--surface-card'),
      raw: {
        'border': '1px solid var(--border-subtle)',
        'border-radius': 'var(--radius-xl)',
        'box-shadow': 'var(--shadow-card)',
      },
    ),
    css('.mobile-nav-links').styles(
      display: Display.flex,
      flexDirection: FlexDirection.column,
      gap: Gap.all(4.px),
      padding: Spacing.all(6.px),
    ),
    css('.mobile-nav-link').styles(
      padding: Spacing.symmetric(horizontal: 15.px, vertical: 13.px),
      color: Color.variable('--ink-700'),
      fontWeight: FontWeight.w600,
      raw: {'border-radius': 'var(--radius-sm)'},
    ),
    css('.mobile-nav-link.active, .mobile-nav-link:hover').styles(
      backgroundColor: Color.variable('--brand-soft'),
      color: Color.variable('--brand-500'),
    ),
    css('.mobile-nav-actions').styles(
      display: Display.grid,
      gap: Gap.all(10.px),
      padding: Spacing.only(top: 10.px, bottom: 8.px, left: 6.px, right: 6.px),
    ),

    // ── Responsive ──────────────────────────────────────────────────────
    // Navigation switches to mobile at the same width the hero collapses to
    // a single column. Previously these were 900 and 992, leaving a 92px
    // band where the layout was stacked but the nav was still desktop.
    css.media(MediaQuery.screen(maxWidth: bpLg.px), [
      css('.desktop-only').styles(display: Display.none),
      css('.mobile-only').styles(display: Display.flex),
      css('.mobile-menu').styles(display: Display.none),
      css('.mobile-menu.open').styles(display: Display.block),
      css('.mobile-menu-toggle.active .hamburger').styles(backgroundColor: Colors.transparent),
      css('.mobile-menu-toggle.active .hamburger::before').styles(
        position: Position.absolute(top: 0.px),
        transform: Transform.rotate(45.deg),
      ),
      css('.mobile-menu-toggle.active .hamburger::after').styles(
        position: Position.absolute(top: 0.px),
        transform: Transform.rotate((-45).deg),
      ),
    ]),
    css.media(MediaQuery.screen(maxWidth: bpSm.px), [
      css('.navbar').styles(padding: Spacing.symmetric(vertical: 10.px)),
      css('.navbar.scrolled, .navbar.menu-open').styles(padding: Spacing.symmetric(vertical: 8.px)),
      css('.mobile-menu').styles(padding: Spacing.only(left: 16.px, right: 16.px, top: 10.px)),
      css('.mobile-menu-toggle').styles(width: 40.px, height: 40.px),
      css('.theme-toggle, .theme-toggle-track').styles(width: 50.px, height: 30.px),
      css('.theme-toggle-thumb').styles(width: 22.px, height: 22.px),
      css('.theme-toggle.dark .theme-toggle-thumb').styles(transform: Transform.translate(x: 20.px)),
    ]),
  ];
}
