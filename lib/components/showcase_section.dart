import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../content/site_links.dart';
import '../theme.dart';
import 'ui/icons.dart';

/// One item, as it appears in either tab.
class _Item {
  const _Item({
    required this.image,
    required this.title,
    required this.category,
    required this.price,
    required this.rating,
    required this.reviews,
    required this.meta,
  });

  final String image;
  final String title;
  final String category;
  final String price;
  final String rating;
  final String reviews;

  /// Prep time for food, pack size or stock for shop. The one field that
  /// differs between modules — everything else is shared.
  final String meta;
}

/// The catalogue proof: a tabbed grid showing food and shop items.
///
/// **The identical card in both tabs is doing the heavy lifting.** If food
/// items and shop items were styled differently, the page would read as two
/// sites stapled together. Same card, one hue swap, and it reads as one store
/// with two aisles.
///
/// The tabs run on hidden radio inputs and a sibling selector — no JavaScript,
/// no second `@client` island, and they work before hydration and with JS off.
class ShowcaseSection extends StatelessComponent {
  const ShowcaseSection({super.key});

  static const _food = <_Item>[
    _Item(
      image: 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?q=80&w=800&auto=format&fit=crop',
      title: 'Signature Smash Burger',
      category: 'Burgers',
      price: '\$12.99',
      rating: '4.8',
      reviews: '124',
      meta: '15–20 min',
    ),
    _Item(
      image: 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?q=80&w=800&auto=format&fit=crop',
      title: 'Wood-Fired Margherita',
      category: 'Pizza',
      price: '\$14.50',
      rating: '4.9',
      reviews: '208',
      meta: '20–25 min',
    ),
    _Item(
      image: 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?q=80&w=800&auto=format&fit=crop',
      title: 'Grilled Chicken Bowl',
      category: 'Healthy',
      price: '\$11.25',
      rating: '4.7',
      reviews: '96',
      meta: '15–20 min',
    ),
    _Item(
      image: 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?q=80&w=800&auto=format&fit=crop',
      title: 'Garden Caesar Salad',
      category: 'Salads',
      price: '\$9.75',
      rating: '4.6',
      reviews: '73',
      meta: '10–15 min',
    ),
  ];

  static const _shop = <_Item>[
    _Item(
      image: 'https://images.unsplash.com/photo-1550583724-b2692b85b150?q=80&w=800&auto=format&fit=crop',
      title: 'Fresh Whole Milk',
      category: 'Dairy',
      price: '\$2.40',
      rating: '4.8',
      reviews: '312',
      meta: '1 L carton',
    ),
    _Item(
      image: 'https://images.unsplash.com/photo-1518977676601-b53f82aba655?q=80&w=800&auto=format&fit=crop',
      title: 'Seasonal Fruit Box',
      category: 'Produce',
      price: '\$8.90',
      rating: '4.7',
      reviews: '145',
      meta: '2 kg box',
    ),
    _Item(
      image: 'https://images.unsplash.com/photo-1509440159596-0249088772ff?q=80&w=800&auto=format&fit=crop',
      title: 'Sourdough Loaf',
      category: 'Bakery',
      price: '\$4.20',
      rating: '4.9',
      reviews: '187',
      meta: 'Baked today',
    ),
    _Item(
      image: 'https://images.unsplash.com/photo-1584017911766-d451b3d0e843?q=80&w=800&auto=format&fit=crop',
      title: 'Everyday Essentials Pack',
      category: 'Household',
      price: '\$15.60',
      rating: '4.6',
      reviews: '64',
      meta: 'In stock',
    ),
  ];

  @override
  Component build(BuildContext context) {
    return section(id: 'showcase', classes: 'section section--alt showcase', [
      div(classes: 'container', [
        div(classes: 'section-header text-center', [
          span(classes: 'section-eyebrow', [Component.text("What's available")]),
          h2(classes: 'section-title', [Component.text('Popular right now')]),
          p(classes: 'section-copy', [
            Component.text('A taste of what our neighbours are ordering today — from both sides of the store.'),
          ]),
        ]),

        // The radios must be direct siblings of BOTH the tab row and the
        // panels for `~` to reach them. Don't nest them.
        fieldset(classes: 'showcase-tabset', [
          legend(classes: 'sr-only', [Component.text('Choose a category')]),
          input(
            type: InputType.radio,
            id: 'tab-food',
            name: 'showcase-tab',
            classes: 'showcase-radio',
            attributes: const {'checked': 'checked'},
          ),
          input(
            type: InputType.radio,
            id: 'tab-shop',
            name: 'showcase-tab',
            classes: 'showcase-radio',
          ),
          div(classes: 'showcase-tabs', [
            label(classes: 'showcase-tab', htmlFor: 'tab-food', [
              iconUtensils(size: 16),
              Component.text('Food'),
            ]),
            label(classes: 'showcase-tab', htmlFor: 'tab-shop', [
              iconBag(size: 16),
              Component.text('Shop'),
            ]),
          ]),
          div(classes: 'showcase-panels', [
            div(classes: 'showcase-panel showcase-panel--food', [
              for (final item in _food) _buildItemCard(item, 'food'),
            ]),
            div(classes: 'showcase-panel showcase-panel--shop', [
              for (final item in _shop) _buildItemCard(item, 'shop'),
            ]),
          ]),
        ]),

        // The app path, stated once, quietly — the web path already has the
        // hero and the module cards.
        div(classes: 'showcase-footnote', [
          span(classes: 'showcase-footnote-text', [Component.text('Prefer the app?')]),
          a(
            href: kPlayStoreUrl,
            classes: 'showcase-store',
            target: Target.blank,
            attributes: const {'rel': 'noopener'},
            [iconPlay(size: 15), Component.text('Google Play')],
          ),
          a(
            href: kAppStoreUrl,
            classes: 'showcase-store',
            target: Target.blank,
            attributes: const {'rel': 'noopener'},
            [iconApple(size: 15), Component.text('App Store')],
          ),
        ]),
      ]),
    ]);
  }

  Component _buildItemCard(_Item item, String variant) {
    return article(classes: 'card card--lift item-card', [
      div(classes: 'item-media', [
        img(
          src: item.image,
          alt: item.title,
          classes: 'item-image',
          width: 800,
          height: 600,
          attributes: const {'loading': 'lazy', 'decoding': 'async'},
        ),
        span(classes: 'chip item-meta-badge', [Component.text(item.meta)]),
      ]),
      div(classes: 'item-body', [
        div(classes: 'item-toprow', [
          span(classes: 'item-category item-category--$variant', [Component.text(item.category)]),
          span(classes: 'item-rating', [
            span(classes: 'item-star', [iconStar(size: 13)]),
            span(classes: 'item-rating-value', [Component.text(item.rating)]),
            span(classes: 'item-reviews', [Component.text('(${item.reviews})')]),
          ]),
        ]),
        h3(classes: 'item-title', [Component.text(item.title)]),
        div(classes: 'item-bottomrow', [
          span(classes: 'item-price', [Component.text(item.price)]),
          a(
            href: variant == 'food' ? kBrowseFoodUrl : kBrowseShopUrl,
            classes: 'item-add',
            target: Target.blank,
            attributes: {'rel': 'noopener', 'aria-label': 'Order ${item.title}'},
            [iconCart(size: 16)],
          ),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.showcase-tabset').styles(
      margin: Spacing.zero,
      padding: Spacing.zero,
      raw: {'border': 'none', 'min-width': '0'},
    ),

    // Hidden, but still focusable — that is what keeps the tabs keyboard
    // operable with no JavaScript.
    css('.showcase-radio').styles(
      position: Position.absolute(),
      width: 1.px,
      height: 1.px,
      opacity: 0,
      raw: {'pointer-events': 'none'},
    ),

    css('.showcase-tabs').styles(
      display: Display.inlineFlex,
      gap: Gap.all(4.px),
      margin: Spacing.only(bottom: 30.px),
      padding: Spacing.all(5.px),
      backgroundColor: Color.variable('--surface-2'),
      raw: {'border-radius': 'var(--radius-pill)'},
    ),
    css('.showcase-tab').styles(
      display: Display.inlineFlex,
      alignItems: AlignItems.center,
      gap: Gap.all(8.px),
      padding: Spacing.symmetric(horizontal: 22.px, vertical: 11.px),
      color: Color.variable('--ink-500'),
      fontSize: 0.94.rem,
      fontWeight: FontWeight.w600,
      cursor: Cursor.pointer,
      transition: const Transition('all', duration: Duration(milliseconds: 220)),
      raw: {'border-radius': 'var(--radius-pill)', 'user-select': 'none'},
    ),
    css('.showcase-tab:hover').styles(color: Color.variable('--ink-900')),

    css('.showcase-panel').styles(display: Display.none),
    css('.showcase-panels').styles(raw: {'min-width': '0'}),

    // The tab machinery.
    css('#tab-food:checked ~ .showcase-panels .showcase-panel--food').styles(display: Display.grid),
    css('#tab-shop:checked ~ .showcase-panels .showcase-panel--shop').styles(display: Display.grid),
    css('#tab-food:checked ~ .showcase-tabs label[for="tab-food"]').styles(
      backgroundColor: Color.variable('--surface-card'),
      color: Color.variable('--module-food'),
      raw: {'box-shadow': 'var(--shadow-sm)'},
    ),
    css('#tab-shop:checked ~ .showcase-tabs label[for="tab-shop"]').styles(
      backgroundColor: Color.variable('--surface-card'),
      color: Color.variable('--module-shop'),
      raw: {'box-shadow': 'var(--shadow-sm)'},
    ),
    css('.showcase-radio:focus-visible ~ .showcase-tabs').styles(
      raw: {'outline': '3px solid var(--brand-a28)', 'outline-offset': '3px'},
    ),

    css('.showcase-panel').styles(
      gap: Gap.all(22.px),
      gridTemplate: const GridTemplate(
        columns: GridTracks([
          GridTrack(TrackSize.fr(1)),
          GridTrack(TrackSize.fr(1)),
          GridTrack(TrackSize.fr(1)),
          GridTrack(TrackSize.fr(1)),
        ]),
      ),
    ),

    // ── The card, shared by both modules ────────────────────────────────
    css('.item-card').styles(
      display: Display.flex,
      flexDirection: FlexDirection.column,
      overflow: Overflow.hidden,
      padding: Spacing.zero,
    ),
    css('.item-media').styles(position: Position.relative()),
    css('.item-image').styles(
      width: 100.percent,
      height: 176.px,
      raw: {'object-fit': 'cover'},
    ),
    css('.item-meta-badge').styles(
      position: Position.absolute(top: 12.px, left: 12.px),
      backgroundColor: Color.variable('--surface-raised'),
      fontSize: 0.75.rem,
      raw: {'backdrop-filter': 'blur(8px)'},
    ),
    css('.item-body').styles(
      display: Display.flex,
      flexDirection: FlexDirection.column,
      gap: Gap.all(10.px),
      padding: Spacing.all(18.px),
      raw: {'flex': '1'},
    ),
    css('.item-toprow').styles(
      display: Display.flex,
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.spaceBetween,
      gap: Gap.all(10.px),
    ),
    css('.item-category').styles(
      color: Color.variable('--brand-500'),
      fontSize: 0.76.rem,
      fontWeight: FontWeight.bold,
      textTransform: TextTransform.upperCase,
      letterSpacing: 0.8.px,
    ),
    css('.item-category--shop').styles(color: Color.variable('--module-shop')),
    css('.item-rating').styles(
      display: Display.inlineFlex,
      alignItems: AlignItems.center,
      gap: Gap.all(4.px),
    ),
    css('.item-star').styles(
      display: Display.inlineFlex,
      color: Color.variable('--brand-500'),
    ),
    css('.item-rating-value').styles(
      color: Color.variable('--ink-900'),
      fontSize: 0.83.rem,
      fontWeight: FontWeight.bold,
    ),
    css('.item-reviews').styles(
      color: Color.variable('--ink-400'),
      fontSize: 0.78.rem,
    ),
    css('.item-title').styles(
      color: Color.variable('--ink-900'),
      fontSize: 1.05.rem,
      fontWeight: FontWeight.bold,
      lineHeight: 1.3.em,
      raw: {'flex': '1'},
    ),
    css('.item-bottomrow').styles(
      display: Display.flex,
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.spaceBetween,
      gap: Gap.all(10.px),
      margin: Spacing.only(top: 2.px),
    ),
    css('.item-price').styles(
      color: Color.variable('--ink-900'),
      fontFamily: const FontFamily.list([FontFamily('Outfit'), FontFamilies.sansSerif]),
      fontSize: 1.2.rem,
      fontWeight: FontWeight.bold,
    ),
    css('.item-add').styles(
      display: Display.inlineFlex,
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.center,
      width: 40.px,
      height: 40.px,
      backgroundColor: Color.variable('--brand-soft'),
      color: Color.variable('--brand-500'),
      transition: const Transition('all', duration: Duration(milliseconds: 220)),
      raw: {'border-radius': 'var(--radius-sm)'},
    ),
    css('.item-add:hover').styles(
      backgroundColor: Color.variable('--brand-500'),
      color: Color.variable('--brand-on'),
    ),

    // ── Footnote ────────────────────────────────────────────────────────
    css('.showcase-footnote').styles(
      display: Display.flex,
      flexWrap: FlexWrap.wrap,
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.center,
      gap: Gap.all(12.px),
      margin: Spacing.only(top: 34.px),
    ),
    css('.showcase-footnote-text').styles(
      color: Color.variable('--ink-400'),
      fontSize: 0.93.rem,
    ),
    css('.showcase-store').styles(
      display: Display.inlineFlex,
      alignItems: AlignItems.center,
      gap: Gap.all(8.px),
      padding: Spacing.symmetric(horizontal: 15.px, vertical: 9.px),
      backgroundColor: Color.variable('--surface-card'),
      color: Color.variable('--ink-900'),
      fontSize: 0.88.rem,
      fontWeight: FontWeight.w600,
      transition: const Transition('all', duration: Duration(milliseconds: 220)),
      raw: {'border': '1px solid var(--border-strong)', 'border-radius': 'var(--radius-pill)'},
    ),
    css('.showcase-store:hover').styles(raw: {'border-color': 'var(--brand-500)'}),

    // ── Responsive ──────────────────────────────────────────────────────
    css.media(MediaQuery.screen(maxWidth: bpXl.px), [
      css('.showcase-panel').styles(
        gridTemplate: const GridTemplate(
          columns: GridTracks([
            GridTrack(TrackSize.fr(1)),
            GridTrack(TrackSize.fr(1)),
            GridTrack(TrackSize.fr(1)),
          ]),
        ),
      ),
    ]),
    css.media(MediaQuery.screen(maxWidth: bpLg.px), [
      css('.showcase-panel').styles(
        gap: Gap.all(18.px),
        gridTemplate: const GridTemplate(
          columns: GridTracks([GridTrack(TrackSize.fr(1)), GridTrack(TrackSize.fr(1))]),
        ),
      ),
    ]),
    css.media(MediaQuery.screen(maxWidth: bpMd.px), [
      css('.showcase-tab').styles(
        padding: Spacing.symmetric(horizontal: 16.px, vertical: 10.px),
      ),
      css('.showcase-footnote').styles(justifyContent: JustifyContent.start),
      css('.item-image').styles(height: 150.px),
    ]),
    css.media(MediaQuery.screen(maxWidth: bpSm.px), [
      css('.showcase-panel').styles(
        gap: Gap.all(14.px),
        gridTemplate: const GridTemplate(columns: GridTracks([GridTrack(TrackSize.fr(1))])),
      ),
      css('.showcase-tabs').styles(display: Display.flex, width: 100.percent),
      css('.showcase-tab').styles(justifyContent: JustifyContent.center, raw: {'flex': '1'}),
      css('.item-image').styles(height: 190.px),
    ]),
  ];
}
