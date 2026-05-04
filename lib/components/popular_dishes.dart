import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';

class PopularDishes extends StatelessComponent {
  const PopularDishes({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'menu', classes: 'popular-dishes', [
      div(classes: 'container', [
        div(classes: 'section-header', [
          div(classes: 'header-content', [
            span(classes: 'subtitle', [Component.text('CUSTOMER EXPERIENCE')]),
            h2(classes: 'title', [Component.text('A marketplace that makes ordering feel effortless.')]),
            p(classes: 'marketplace-copy', [
              Component.text(
                'Showcase bestsellers, surface accurate prep times, and convert hungry visitors with a storefront that feels fast before the rider even starts moving.',
              ),
            ]),
          ]),
          button(classes: 'btn btn-outline', [
            Component.text('Explore Storefront'),
            span(classes: 'icon', [Component.text('→')]),
          ]),
        ]),

        div(classes: 'dishes-grid', [
          _buildDishCard(
            image: 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?q=80&w=1999&auto=format&fit=crop',
            title: 'Signature Smash Burger',
            category: 'Burger',
            price: 12.99,
            rating: 4.8,
            reviews: 124,
            time: '15-20 Min',
          ),
          _buildDishCard(
            image: 'https://images.pexels.com/photos/374052/pexels-photo-374052.jpeg',
            title: 'Fresh Salmon Power Salad',
            category: 'Healthy',
            price: 18.50,
            rating: 4.9,
            reviews: 89,
            time: '10-15 Min',
          ),
          _buildDishCard(
            image: 'https://images.unsplash.com/photo-1604382354936-07c5d9983bd3?q=80&w=2070&auto=format&fit=crop',
            title: 'Stone-Fired Margherita',
            category: 'Pizza',
            price: 16.00,
            rating: 4.7,
            reviews: 215,
            time: '20-25 Min',
          ),
          _buildDishCard(
            image: 'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?q=80&w=1974&auto=format&fit=crop',
            title: 'Chili Garlic Noodles',
            category: 'Asian',
            price: 14.50,
            rating: 4.6,
            reviews: 142,
            time: '15-20 Min',
          ),
        ]),
      ]),
    ]);
  }

  Component _buildDishCard({
    required String image,
    required String title,
    required String category,
    required double price,
    required double rating,
    required int reviews,
    required String time,
  }) {
    return div(classes: 'dish-card', [
      div(classes: 'dish-image-wrapper', [
        img(src: image, alt: title, classes: 'dish-image'),
        div(classes: 'dish-time-badge', [
          span(classes: 'dish-time-dot', []),
          Component.text(time),
        ]),
        div(classes: 'favorite-btn', [Component.text('+')]),
      ]),
      div(classes: 'dish-content', [
        div(classes: 'dish-meta', [
          span(classes: 'dish-category', [Component.text(category)]),
          div(classes: 'dish-rating', [
            span(classes: 'star', [Component.text('⭐')]),
            span(classes: 'rating-value', [Component.text(rating.toStringAsFixed(1))]),
            span(classes: 'review-count', [Component.text('($reviews)')]),
          ]),
        ]),
        h3(classes: 'dish-title', [Component.text(title)]),
        div(classes: 'dish-footer', [
          div(classes: 'dish-price', [
            span(classes: 'currency', [Component.text('\$')]),
            span(classes: 'price-amount', [Component.text(price.toStringAsFixed(2))]),
          ]),
          button(classes: 'add-cart-btn', [
            span(classes: 'plus-icon', [Component.text('+')]),
          ]),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.popular-dishes').styles(
      padding: Spacing.symmetric(vertical: 100.px, horizontal: 24.px),
      backgroundColor: Color('#F8FAFC'),
    ),
    css('.popular-dishes .container').styles(
      width: 100.percent,
      maxWidth: 1180.px,
      margin: Spacing.symmetric(horizontal: Unit.auto),
    ),
    css('.popular-dishes .section-header').styles(
      display: Display.flex,
      justifyContent: JustifyContent.spaceBetween,
      alignItems: AlignItems.end,
      margin: Spacing.only(bottom: 64.px),
    ),
    css('.header-content').styles(
      display: Display.flex,
      flexDirection: FlexDirection.column,
      gap: Gap.all(14.px),
      maxWidth: 690.px,
    ),
    css('.marketplace-copy').styles(
      color: Color('#667085'),
      lineHeight: 1.7.em,
      fontSize: 1.02.rem,
      margin: Spacing.zero,
    ),
    css('.dishes-grid').styles(
      display: Display.grid,
      gridTemplate: const GridTemplate(
        columns: GridTracks([
          GridTrack(TrackSize.fr(1)),
          GridTrack(TrackSize.fr(1)),
          GridTrack(TrackSize.fr(1)),
          GridTrack(TrackSize.fr(1)),
        ]),
      ),
      gap: Gap.all(24.px),
    ),
    css('.dish-card').styles(
      radius: BorderRadius.circular(22.px),
      overflow: Overflow.hidden,
      shadow: BoxShadow(offsetX: 0.px, offsetY: 12.px, blur: 28.px, color: Color.rgba(17, 24, 39, 0.05)),
      cursor: Cursor.pointer,
      transition: Transition('all', duration: Duration(milliseconds: 300)),
      backgroundColor: Colors.white,
      raw: {'border': '1px solid rgba(17, 24, 39, 0.08)'},
    ),
    css('.dish-card:hover').styles(
      shadow: BoxShadow(offsetX: 0.px, offsetY: 26.px, blur: 56.px, color: Color.rgba(17, 24, 39, 0.12)),
      transform: Transform.translate(y: (-8).px),
    ),
    css('.dish-image-wrapper').styles(
      position: Position.relative(),
      height: 240.px,
      width: 100.percent,
      overflow: Overflow.hidden,
    ),
    css('.dish-image').styles(
      width: 100.percent,
      height: 100.percent,
      raw: {'object-fit': 'cover'},
      transition: Transition('transform', duration: Duration(milliseconds: 500)),
    ),
    css('.dish-card:hover .dish-image').styles(
      transform: Transform.scale(1.05),
    ),
    css('.favorite-btn').styles(
      position: Position.absolute(top: 16.px, right: 16.px),
      width: 40.px,
      height: 40.px,
      backgroundColor: const Color.rgba(255, 255, 255, 0.92),
      radius: BorderRadius.circular(50.percent),
      display: Display.flex,
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.center,
      shadow: BoxShadow(offsetX: 0.px, offsetY: 4.px, blur: 12.px, color: Color.rgba(0, 0, 0, 0.1)),
      transition: Transition('transform', duration: Duration(milliseconds: 200)),
      color: Color('#111827'),
      fontSize: 1.25.rem,
      fontWeight: FontWeight.bold,
    ),
    css('.dish-time-badge').styles(
      position: Position.absolute(left: 16.px, bottom: 16.px),
      display: Display.flex,
      alignItems: AlignItems.center,
      gap: Gap.all(8.px),
      padding: Spacing.symmetric(horizontal: 12.px, vertical: 8.px),
      radius: BorderRadius.circular(999.px),
      backgroundColor: const Color.rgba(255, 255, 255, 0.92),
      color: Color('#111827'),
      fontSize: 0.8.rem,
      fontWeight: FontWeight.w700,
      shadow: BoxShadow(offsetX: 0.px, offsetY: 8.px, blur: 20.px, color: Color.rgba(0, 0, 0, 0.12)),
      raw: {'backdrop-filter': 'blur(10px)'},
    ),
    css('.dish-time-dot').styles(
      width: 7.px,
      height: 7.px,
      radius: BorderRadius.circular(50.percent),
      backgroundColor: Color('#16A34A'),
    ),
    css('.favorite-btn:hover').styles(
      transform: Transform.scale(1.1),
    ),
    css('.dish-content').styles(
      padding: Spacing.all(24.px),
    ),
    css('.dish-meta').styles(
      display: Display.flex,
      justifyContent: JustifyContent.spaceBetween,
      alignItems: AlignItems.center,
      margin: Spacing.only(bottom: 16.px),
    ),
    css('.dish-category').styles(
      color: Color('#E94B1B'),
      backgroundColor: Color('#FFF0E8'),
      padding: Spacing.symmetric(horizontal: 12.px, vertical: 4.px),
      radius: BorderRadius.circular(8.px),
      fontSize: 0.75.rem,
      fontWeight: FontWeight.w600,
      textTransform: TextTransform.upperCase,
    ),
    css('.dish-rating').styles(
      display: Display.flex,
      alignItems: AlignItems.center,
      gap: Gap.all(4.px),
    ),
    css('.star').styles(
      fontSize: 1.rem,
    ),
    css('.rating-value').styles(
      fontWeight: FontWeight.bold,
      color: Color('#111827'),
      fontSize: 0.875.rem,
    ),
    css('.review-count').styles(
      color: Color('#667085'),
      fontSize: 0.875.rem,
    ),
    css('.dish-title').styles(
      fontSize: 1.25.rem,
      color: Color('#111827'),
      margin: Spacing.only(bottom: 24.px),
      fontWeight: FontWeight.bold,
    ),
    css('.dish-footer').styles(
      display: Display.flex,
      justifyContent: JustifyContent.spaceBetween,
      alignItems: AlignItems.center,
    ),
    css('.dish-price').styles(
      display: Display.flex,
      alignItems: AlignItems.start,
      color: Color('#111827'),
    ),
    css('.currency').styles(
      fontSize: 1.rem,
      fontWeight: FontWeight.w600,
      color: Color('#E94B1B'),
      margin: Spacing.only(top: 2.px),
    ),
    css('.price-amount').styles(
      fontSize: 1.5.rem,
      fontWeight: FontWeight.bold,
    ),
    css('.add-cart-btn').styles(
      width: 48.px,
      height: 48.px,
      backgroundColor: Color('#111827'),
      color: Colors.white,
      radius: BorderRadius.circular(16.px),
      display: Display.flex,
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.center,
      transition: Transition('all', duration: Duration(milliseconds: 300)),
    ),
    css('.add-cart-btn:hover').styles(
      transform: Transform.rotate(90.deg),
      backgroundColor: Color('#E94B1B'),
    ),
    css('.plus-icon').styles(
      fontSize: 1.5.rem,
      fontWeight: FontWeight.w300,
    ),
    css('@media (max-width: 1200px)').styles(
      raw: {
        ' .dishes-grid': 'grid-template-columns: repeat(3, 1fr);',
      },
    ),
    css('@media (max-width: 992px)').styles(
      raw: {
        ' .popular-dishes': 'padding: 88px 24px;',
        ' .dishes-grid': 'grid-template-columns: repeat(2, 1fr);',
        ' .popular-dishes .section-header': 'flex-direction: column; align-items: flex-start; gap: 24px;',
      },
    ),
    css('@media (max-width: 640px)').styles(
      raw: {
        ' .popular-dishes': 'padding: 58px 16px;',
        ' .popular-dishes .section-header': 'align-items: stretch; gap: 18px; margin-bottom: 34px;',
        ' .popular-dishes .btn': 'width: 100%; justify-content: center;',
        ' .dishes-grid': 'grid-template-columns: 1fr;',
        ' .dish-card': 'border-radius: 18px;',
        ' .dish-image-wrapper': 'height: 205px;',
        ' .dish-time-badge': 'left: 12px; bottom: 12px; padding: 7px 10px; font-size: 0.76rem;',
        ' .favorite-btn': 'top: 12px; right: 12px; width: 38px; height: 38px;',
        ' .dish-content': 'padding: 18px;',
        ' .dish-meta': 'align-items: flex-start; gap: 10px; margin-bottom: 14px;',
        ' .dish-title': 'font-size: 1.12rem; margin-bottom: 20px;',
        ' .add-cart-btn': 'width: 44px; height: 44px; border-radius: 14px;',
      },
    ),
    css('@media (max-width: 380px)').styles(
      raw: {
        ' .dish-meta': 'flex-direction: column;',
        ' .dish-image-wrapper': 'height: 180px;',
      },
    ),
  ];
}
