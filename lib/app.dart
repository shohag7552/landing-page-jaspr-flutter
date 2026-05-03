import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import 'components/cta_banner.dart';
import 'components/features_section.dart';
import 'components/footer.dart';
import 'components/hero_section.dart';
import 'components/how_it_works.dart';
import 'components/navbar.dart';
import 'components/our_platform.dart';
import 'components/why_choose_us.dart';

class App extends StatefulComponent {
  const App({super.key});

  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> {

  @override
  void initState() {
    super.initState();
    if (kIsWeb) {
      print("Client initialized");
    }
  }

  @override
  Component build(BuildContext context) {
    return div(classes: 'app-wrapper', [
      const Navbar(),
      const HeroSection(),
      const FeaturesSection(),
      const HowItWorks(),
      const OurPlatform(),
      const WhyChooseUs(),
      const CtaBanner(),
      const FooterSection(),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.app-wrapper').styles(
      display: Display.flex,
      minHeight: 100.vh,
      flexDirection: FlexDirection.column,
      fontFamily: const FontFamily.list([FontFamily('Inter'), FontFamilies.sansSerif]),
    ),
  ];
}
