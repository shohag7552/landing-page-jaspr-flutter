import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr_router/jaspr_router.dart';
import 'package:universal_web/js_interop.dart';
import 'package:universal_web/web.dart' as web;

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
  web.EventListener? _scrollListener;

  @override
  void initState() {
    super.initState();
    if (kIsWeb) {
      isDarkMode = web.window.localStorage.getItem('foodflow-theme') == 'dark';
      _applyTheme(isDarkMode);
      _scrollListener = ((web.Event event) => _handleScroll()).toJS;
      web.window.addEventListener('scroll', _scrollListener);
      _handleScroll();
    }
  }

  void _handleScroll() {
    final shouldShowBackground = web.window.scrollY > 8;

    if (shouldShowBackground == isScrolled || !mounted) {
      return;
    }

    setState(() {
      isScrolled = shouldShowBackground;
    });
  }

  void _toggleTheme() {
    final nextTheme = !isDarkMode;

    _applyTheme(nextTheme);
    web.window.localStorage.setItem('foodflow-theme', nextTheme ? 'dark' : 'light');

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
    if (kIsWeb && _scrollListener != null) {
      web.window.removeEventListener('scroll', _scrollListener);
    }
    super.dispose();
  }

  @override
  Component build(BuildContext context) {
    return header(
      classes: 'navbar ${isScrolled || isMenuOpen ? 'scrolled' : ''} ${isMenuOpen ? 'menu-open' : ''}',
      [
        div(classes: 'container', [
          // Logo
          div(classes: 'logo-container', [
            span(classes: 'logo-icon', [Component.text('🍔')]),
            span(classes: 'logo-text', [
              Component.text('Food'),
              span(classes: 'text-primary', [Component.text('Flow')]),
            ]),
          ]),

          // Desktop Links
          nav(classes: 'nav-links desktop-only', [
            Link(to: '#home', classes: 'nav-link active', child: Component.text('Home')),
            Link(to: '#menu', classes: 'nav-link', child: Component.text('Marketplace')),
            Link(to: '#features', classes: 'nav-link', child: Component.text('Platform')),
            Link(to: '#contact', classes: 'nav-link', child: Component.text('Contact')),
          ]),

          // Action Buttons
          div(classes: 'nav-actions desktop-only', [
            button(classes: 'btn btn-ghost', [Component.text('Partner Login')]),
            _buildThemeToggle(),
            button(classes: 'btn btn-primary', [
              Component.text('Book Demo'),
              span(classes: 'icon', [Component.text('→')]),
            ]),
          ]),

          // Mobile Menu Toggle
          div(classes: 'mobile-controls mobile-only', [
            _buildThemeToggle(),
            button(
              classes: 'mobile-menu-toggle ${isMenuOpen ? 'active' : ''}',
              type: ButtonType.button,
              onClick: _toggleMenu,
              attributes: {'aria-label': isMenuOpen ? 'Close menu' : 'Open menu'},
              [
                span(classes: 'hamburger', []),
              ],
            ),
          ]),
        ]),
        div(classes: 'mobile-menu mobile-only ${isMenuOpen ? 'open' : ''}', [
          div(classes: 'mobile-menu-panel', [
            nav(classes: 'mobile-nav-links', [
              Link(to: '#home', classes: 'mobile-nav-link active', child: Component.text('Home')),
              Link(to: '#menu', classes: 'mobile-nav-link', child: Component.text('Marketplace')),
              Link(to: '#features', classes: 'mobile-nav-link', child: Component.text('Platform')),
              Link(to: '#contact', classes: 'mobile-nav-link', child: Component.text('Contact')),
            ]),
            div(classes: 'mobile-nav-actions', [
              button(classes: 'btn btn-ghost mobile-action', onClick: _closeMenu, [
                Component.text('Partner Login'),
              ]),
              button(classes: 'btn btn-primary mobile-action', onClick: _closeMenu, [
                Component.text('Book Demo'),
                span(classes: 'icon', [Component.text('→')]),
              ]),
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
          span(classes: 'theme-toggle-thumb', [
            Component.text(isDarkMode ? '☾' : '☀'),
          ]),
        ]),
      ],
    );
  }

  @css
  static final styles = [
    css('.navbar').styles(
      position: Position.fixed(top: 0.px, left: 0.px, right: 0.px),
      zIndex: ZIndex(1000),
      padding: Spacing.symmetric(vertical: 22.px),
      transition: Transition('all', duration: Duration(milliseconds: 300)),
      backgroundColor: Colors.transparent,
      raw: {'backdrop-filter': 'blur(0px)'},
    ),
    css('.navbar.menu-open').styles(
      backgroundColor: Colors.white,
      raw: {'backdrop-filter': 'blur(18px)'},
    ),
    css('.navbar.scrolled').styles(
      padding: Spacing.symmetric(vertical: 16.px),
      shadow: BoxShadow(offsetX: 0.px, offsetY: 16.px, blur: 40.px, color: Color.rgba(15, 23, 42, 0.08)),
      backgroundColor: Colors.white,
      raw: {'backdrop-filter': 'blur(18px)'},
    ),
    css('.navbar .container').styles(
      display: Display.flex,
      width: 100.percent,
      maxWidth: 1180.px,
      padding: Spacing.symmetric(horizontal: 28.px),
      margin: Spacing.symmetric(horizontal: Unit.auto),
      boxSizing: BoxSizing.borderBox,
      justifyContent: JustifyContent.spaceBetween,
      alignItems: AlignItems.center,
    ),
    css('.logo-container').styles(
      display: Display.flex,
      cursor: Cursor.pointer,
      alignItems: AlignItems.center,
      gap: Gap.all(12.px),
    ),
    css('.logo-icon').styles(
      fontSize: 2.rem,
      lineHeight: 1.em,
      raw: {'filter': 'drop-shadow(0px 4px 8px rgba(255, 94, 30, 0.3))'},
    ),
    css('.logo-text').styles(
      color: Color('#111827'),
      fontFamily: const FontFamily.list([FontFamily('Outfit'), FontFamilies.sansSerif]),
      fontSize: 1.55.rem,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.px,
    ),
    css('.text-primary').styles(
      color: Color('#E94B1B'),
    ),
    css('.nav-links').styles(
      display: Display.flex,
      gap: Gap.all(28.px),
    ),
    css('.nav-link').styles(
      fontSize: 0.95.rem,
      fontWeight: FontWeight.w500,
      color: Color('#596579'),
      transition: Transition('color', duration: Duration(milliseconds: 200)),
      position: Position.relative(),
    ),
    css('.nav-link:hover').styles(
      color: Color('#E94B1B'),
    ),
    css('.nav-link.active').styles(
      color: Color('#E94B1B'),
    ),
    // Advanced underline effect for nav links using raw custom css in the App later if needed
    css('.nav-actions').styles(
      display: Display.flex,
      alignItems: AlignItems.center,
      gap: Gap.all(14.px),
    ),
    css('.btn').styles(
      padding: Spacing.symmetric(horizontal: 22.px, vertical: 12.px),
      radius: BorderRadius.circular(14.px),
      fontSize: 0.95.rem,
      fontWeight: FontWeight.w600,
      transition: Transition('all', duration: Duration(milliseconds: 300)),
      display: Display.flex,
      alignItems: AlignItems.center,
      gap: Gap.all(8.px),
    ),
    css('.btn-ghost').styles(
      color: Color('#182230'),
    ),
    css('.btn-ghost:hover').styles(
      color: Color('#E94B1B'),
      backgroundColor: Color('#FFF0E8'),
    ),
    css('.btn-primary').styles(
      backgroundColor: Color('#111827'),
      color: Colors.white,
      shadow: BoxShadow(offsetX: 0.px, offsetY: 14.px, blur: 26.px, color: Color.rgba(17, 24, 39, 0.18)),
    ),
    css('.btn-primary:hover').styles(
      transform: Transform.translate(y: (-2).px),
      backgroundColor: Color('#E94B1B'),
      shadow: BoxShadow(offsetX: 0.px, offsetY: 16.px, blur: 30.px, color: Color.rgba(233, 75, 27, 0.28)),
    ),
    css('.btn-primary .icon').styles(
      transition: Transition('transform', duration: Duration(milliseconds: 300)),
    ),
    css('.btn-primary:hover .icon').styles(
      transform: Transform.translate(x: 4.px),
    ),
    css('.theme-toggle').styles(
      display: Display.flex,
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.center,
      padding: Spacing.zero,
      width: 58.px,
      height: 34.px,
      radius: BorderRadius.circular(999.px),
      transition: Transition('all', duration: Duration(milliseconds: 300)),
    ),
    css('.theme-toggle-track').styles(
      display: Display.flex,
      alignItems: AlignItems.center,
      width: 58.px,
      height: 34.px,
      padding: Spacing.all(4.px),
      radius: BorderRadius.circular(999.px),
      backgroundColor: Color('#F2F4F7'),
      raw: {'border': '1px solid rgba(17, 24, 39, 0.12)'},
    ),
    css('.theme-toggle-thumb').styles(
      display: Display.flex,
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.center,
      width: 26.px,
      height: 26.px,
      radius: BorderRadius.circular(50.percent),
      backgroundColor: Colors.white,
      color: Color('#E94B1B'),
      fontSize: 0.86.rem,
      shadow: BoxShadow(offsetX: 0.px, offsetY: 4.px, blur: 10.px, color: Color.rgba(17, 24, 39, 0.12)),
      transition: Transition('all', duration: Duration(milliseconds: 300)),
    ),
    css('.theme-toggle.dark .theme-toggle-track').styles(
      backgroundColor: Color('#111827'),
      raw: {'border-color': 'rgba(255, 255, 255, 0.16)'},
    ),
    css('.theme-toggle.dark .theme-toggle-thumb').styles(
      transform: Transform.translate(x: 24.px),
      color: Color('#FDBA74'),
      backgroundColor: Color('#1F2937'),
    ),
    css('.mobile-only').styles(
      display: Display.none,
    ),
    css('.mobile-controls').styles(
      alignItems: AlignItems.center,
      gap: Gap.all(12.px),
    ),
    css('.mobile-menu-toggle').styles(
      width: 44.px,
      height: 44.px,
      display: Display.flex,
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.center,
      radius: BorderRadius.circular(14.px),
      backgroundColor: Color('#F2F4F7'),
      raw: {'border': '1px solid rgba(17, 24, 39, 0.10)'},
    ),
    css('.hamburger').styles(
      display: Display.block,
      width: 24.px,
      height: 2.px,
      backgroundColor: Color('#1E293B'),
      position: Position.relative(),
      transition: Transition('all', duration: Duration(milliseconds: 200)),
    ),
    css('.hamburger::before, .hamburger::after').styles(
      position: Position.absolute(left: 0.px),
      width: 24.px,
      height: 2.px,
      backgroundColor: Color('#1E293B'),
      transition: Transition('all', duration: Duration(milliseconds: 200)),
      raw: {
        'content': '""',
      },
    ),
    css('.hamburger::before').styles(position: Position.absolute(top: (-7).px)),
    css('.hamburger::after').styles(position: Position.absolute(top: 7.px)),
    css('.mobile-menu').styles(
      display: Display.none,
      maxWidth: 1180.px,
      width: 100.percent,
      margin: Spacing.symmetric(horizontal: Unit.auto),
      padding: Spacing.only(left: 20.px, right: 20.px, top: 12.px),
      boxSizing: BoxSizing.borderBox,
      raw: {'max-height': 'calc(100vh - 72px)', 'overflow-y': 'auto'},
    ),
    css('.mobile-nav-links').styles(
      display: Display.flex,
      flexDirection: FlexDirection.column,
      gap: Gap.all(6.px),
      padding: Spacing.all(8.px),
    ),
    css('.mobile-menu-panel').styles(
      backgroundColor: Colors.white,
      padding: Spacing.all(10.px),
      radius: BorderRadius.circular(24.px),
      shadow: BoxShadow(offsetX: 0.px, offsetY: 18.px, blur: 45.px, color: Color.rgba(17, 24, 39, 0.12)),
      raw: {'border': '1px solid rgba(17, 24, 39, 0.08)'},
    ),
    css('.mobile-nav-link').styles(
      padding: Spacing.symmetric(horizontal: 16.px, vertical: 13.px),
      radius: BorderRadius.circular(14.px),
      color: Color('#344054'),
      fontWeight: FontWeight.w600,
    ),
    css('.mobile-nav-link.active, .mobile-nav-link:hover').styles(
      color: Color('#E94B1B'),
      backgroundColor: Color('#FFF0E8'),
    ),
    css('.mobile-nav-actions').styles(
      display: Display.grid,
      gridTemplate: const GridTemplate(
        columns: GridTracks([
          GridTrack(TrackSize.fr(1)),
          GridTrack(TrackSize.fr(1)),
        ]),
      ),
      gap: Gap.all(12.px),
      padding: Spacing.only(top: 12.px, bottom: 10.px),
    ),
    css('.mobile-action').styles(
      justifyContent: JustifyContent.center,
      width: 100.percent,
    ),
    css('@media (max-width: 900px)').styles(
      raw: {
        ' .navbar': 'padding: 12px 0;',
        ' .navbar.scrolled': 'padding: 10px 0;',
        ' .navbar .container': 'padding: 0 20px;',
        ' .desktop-only': 'display: none;',
        ' .mobile-only': 'display: flex;',
        ' .mobile-menu': 'display: none;',
        ' .mobile-menu.open': 'display: block;',
        ' .mobile-menu-toggle.active .hamburger': 'background-color: transparent;',
        ' .mobile-menu-toggle.active .hamburger::before': 'top: 0; transform: rotate(45deg);',
        ' .mobile-menu-toggle.active .hamburger::after': 'top: 0; transform: rotate(-45deg);',
      },
    ),
    css('@media (max-width: 520px)').styles(
      raw: {
        ' .navbar': 'padding: 10px 0;',
        ' .navbar.scrolled': 'padding: 8px 0;',
        ' .navbar .container': 'padding: 0 16px;',
        ' .logo-icon': 'font-size: 1.7rem;',
        ' .logo-text': 'font-size: 1.32rem;',
        ' .theme-toggle, .theme-toggle-track': 'width: 52px; height: 32px;',
        ' .theme-toggle-thumb': 'width: 24px; height: 24px;',
        ' .theme-toggle.dark .theme-toggle-thumb': 'transform: translateX(20px);',
        ' .mobile-controls': 'gap: 8px;',
        ' .mobile-menu': 'padding: 10px 16px 0;',
        ' .mobile-menu-toggle': 'width: 40px; height: 40px; border-radius: 12px;',
        ' .mobile-menu-panel': 'padding: 8px; border-radius: 20px;',
        ' .mobile-nav-links': 'padding: 4px;',
        ' .mobile-nav-link': 'padding: 12px 14px;',
        ' .mobile-nav-actions': 'grid-template-columns: 1fr;',
      },
    ),
  ];
}
