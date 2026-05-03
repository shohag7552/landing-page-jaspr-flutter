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
      classes: 'navbar ${isScrolled ? 'scrolled' : ''}',
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
            button(classes: 'mobile-menu-toggle', [
              span(classes: 'hamburger', []),
            ]),
          ])
        ])
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
    css('@media (max-width: 768px)').styles(
      raw: {' .desktop-only': 'display: none;', ' .mobile-only': 'display: flex;'},
    ),
    css('.mobile-controls').styles(
      alignItems: AlignItems.center,
      gap: Gap.all(12.px),
    ),
    css('.hamburger').styles(
      display: Display.block,
      width: 24.px,
      height: 2.px,
      backgroundColor: Color('#1E293B'),
      position: Position.relative(),
    ),
    // Note: before/after pseudo elements might be better in global styles for full raw support
  ];
}
