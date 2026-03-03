import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr_router/jaspr_router.dart';


@client
class Navbar extends StatefulComponent {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => NavbarState();
}

class NavbarState extends State<Navbar> {
  bool isScrolled = false;

  @override
  void initState() {
    super.initState();
    if (kIsWeb) {
      // html.window.addEventListener scroll removed to prevent js_interop compiler errors on Jaspr server side
    }
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
              span(classes: 'text-primary', [Component.text('ie')]),
            ]),
          ]),

          // Desktop Links
          nav(classes: 'nav-links desktop-only', [
            Link(to: '#home', classes: 'nav-link active', child: Component.text('Home')),
            Link(to: '#menu', classes: 'nav-link', child: Component.text('Menu')),
            Link(to: '#features', classes: 'nav-link', child: Component.text('Services')),
            Link(to: '#contact', classes: 'nav-link', child: Component.text('Contact')),
          ]),

          // Action Buttons
          div(classes: 'nav-actions desktop-only', [
            button(classes: 'btn btn-ghost', [Component.text('Log In')]),
            button(classes: 'btn btn-primary', [
              Component.text('Sign Up'),
              span(classes: 'icon', [Component.text('→')]),
            ]),
          ]),

          // Mobile Menu Toggle
          button(classes: 'mobile-menu-toggle mobile-only', [
            span(classes: 'hamburger', []),
          ])
        ])
      ],
    );
  }

  @css
  static final styles = [
    css('.navbar').styles(
      position: Position.fixed(top: 0.px, left: 0.px, right: 0.px),
      zIndex: ZIndex(1000),
      padding: Spacing.symmetric(vertical: 24.px),
      transition: Transition('all', duration: Duration(milliseconds: 300)),
      backgroundColor: Colors.transparent,
    ),
    css('.navbar.scrolled').styles(
      padding: Spacing.symmetric(vertical: 16.px),
      shadow: BoxShadow(offsetX: 0.px, offsetY: 4.px, blur: 20.px, color: Color.rgba(0, 0, 0, 0.05)),
      // backdropFilter: 'blur(10px)', // requires raw css for blur right now
      backgroundColor: const Color.rgba(255, 255, 255, 0.9),
    ),
    css('.navbar .container').styles(
      display: Display.flex,
      width: 100.percent,
      maxWidth: 1200.px,
      padding: Spacing.symmetric(horizontal: 24.px),
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
      color: Color('#1E293B'),
      fontFamily: const FontFamily.list([FontFamily('Outfit'), FontFamilies.sansSerif]),
      fontSize: 1.75.rem,
      fontWeight: FontWeight.bold,
      letterSpacing: (-0.5).px,
    ),
    css('.text-primary').styles(
      color: Color('#FF5E1E'),
    ),
    css('.nav-links').styles(
      display: Display.flex,
      gap: Gap.all(32.px),
    ),
    css('.nav-link').styles(
      fontSize: 1.rem,
      fontWeight: FontWeight.w500,
      color: Color('#64748B'),
      transition: Transition('color', duration: Duration(milliseconds: 200)),
      position: Position.relative(),
    ),
    css('.nav-link:hover').styles(
      color: Color('#FF5E1E'),
    ),
    css('.nav-link.active').styles(
      color: Color('#FF5E1E'),
    ),
    // Advanced underline effect for nav links using raw custom css in the App later if needed
    css('.nav-actions').styles(
      display: Display.flex,
      alignItems: AlignItems.center,
      gap: Gap.all(16.px),
    ),
    css('.btn').styles(
      padding: Spacing.symmetric(horizontal: 24.px, vertical: 12.px),
      radius: BorderRadius.circular(50.px),
      fontSize: 1.rem,
      fontWeight: FontWeight.w600,
      transition: Transition('all', duration: Duration(milliseconds: 300)),
      display: Display.flex,
      alignItems: AlignItems.center,
      gap: Gap.all(8.px),
    ),
    css('.btn-ghost').styles(
      color: Color('#1E293B'),
    ),
    css('.btn-ghost:hover').styles(
      color: Color('#FF5E1E'),
      backgroundColor: Color('#FFF6F3'),
    ),
    css('.btn-primary').styles(
      backgroundColor: Color('#FF5E1E'),
      color: Colors.white,
      shadow: BoxShadow(offsetX: 0.px, offsetY: 8.px, blur: 16.px, color: Color.rgba(255, 94, 30, 0.25)),
    ),
    css('.btn-primary:hover').styles(
      transform: Transform.translate(y: (-2).px),
      shadow: BoxShadow(offsetX: 0.px, offsetY: 12.px, blur: 20.px, color: Color.rgba(255, 94, 30, 0.35)),
    ),
    css('.btn-primary .icon').styles(
      transition: Transition('transform', duration: Duration(milliseconds: 300)),
    ),
    css('.btn-primary:hover .icon').styles(
      transform: Transform.translate(x: 4.px),
    ),
    css('.mobile-only').styles(
      display: Display.none,
    ),
    css('@media (max-width: 768px)').styles(
      raw: {' .desktop-only': 'display: none;', ' .mobile-only': 'display: block;'},
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
