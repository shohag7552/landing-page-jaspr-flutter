import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import 'components/delivery_promise.dart';
import 'components/delivery_zone.dart';
import 'components/footer.dart';
import 'components/get_the_app.dart';
import 'components/hero_section.dart';
import 'components/how_it_works.dart';
import 'components/module_split.dart';
import 'components/navbar.dart';
import 'components/showcase_section.dart';
import 'components/why_choose_us.dart';

/// The page.
///
/// The order answers a local visitor's questions in the order they actually
/// ask them:
///
///   1. What is this?              → Hero
///   2. Is it any good?            → Reassurance strip
///   3. Do you deliver to me?      → Delivery zone   ← the big one
///   4. What can I buy?            → Food & Shop → Showcase
///   5. How does it reach me?      → How it works → Tracked all the way
///   6. How do I order?            → Get the app
///   7. Can I reach a human?       → Footer
///
/// Question 3 sits high on purpose: in radius-based delivery, a visitor who
/// scrolls the whole page before finding out they're outside the zone is a
/// wasted click, and one who learns early that they're covered reads on.
///
/// There is deliberately no separate "features" grid. Six benefit cards on
/// top of the reassurance strip, the four steps and the rider points said the
/// same things a fourth time, and reading it back that repetition was the
/// bulk of what made the page feel heavy.
class App extends StatelessComponent {
  const App({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'app-wrapper', [
      const Navbar(),
      const HeroSection(),
      const WhyChooseUs(),
      const DeliveryZone(),
      const ModuleSplit(),
      const ShowcaseSection(),
      const HowItWorks(),
      const DeliveryPromise(),
      const GetTheApp(),
      const FooterSection(),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.app-wrapper').styles(
      display: Display.flex,
      minHeight: 100.vh,
      flexDirection: FlexDirection.column,
      backgroundColor: Color.variable('--surface-0'),
      fontFamily: const FontFamily.list([FontFamily('Inter'), FontFamilies.sansSerif]),
      raw: {'overflow-x': 'clip'},
    ),
  ];
}
