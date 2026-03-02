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
            span(classes: 'subtitle', [text('POPULAR MENU')]),
            h2(classes: 'title', [text('Explore Our Top Trending Dishes')]),
          ]),
          button(classes: 'btn btn-outline', [
            text('View All Menu'),
            span(classes: 'icon', [text('→')]),
          ])
        ]),

        div(classes: 'dishes-grid', [
          _buildDishCard(
            image: 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?q=80&w=1999&auto=format&fit=crop',
            title: 'Classic Beef Burger',
            category: 'Burger',
            price: 12.99,
            rating: 4.8,
            reviews: 124,
            time: '15-20 Min',
          ),
          _buildDishCard(
            image: 'https://images.unsplash.com/photo-1590947132387-155cc3be3a01?q=80&w=2080&auto=format&fit=crop',
            title: 'Fresh Salmon Salad',
            category: 'Healthy',
            price: 18.50,
            rating: 4.9,
            reviews: 89,
            time: '10-15 Min',
          ),
          _buildDishCard(
            image: 'https://images.unsplash.com/photo-1604382354936-07c5d9983bd3?q=80&w=2070&auto=format&fit=crop',
            title: 'Margherita Pizza',
            category: 'Pizza',
            price: 16.00,
            rating: 4.7,
            reviews: 215,
            time: '20-25 Min',
          ),
          _buildDishCard(
            image: 'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?q=80&w=1974&auto=format&fit=crop',
            title: 'Spicy Noodles',
            category: 'Asian',
            price: 14.50,
            rating: 4.6,
            reviews: 142,
            time: '15-20 Min',
          ),
        ])
      ])
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
        div(classes: 'favorite-btn', [text('❤️')]),
      ]),
      div(classes: 'dish-content', [
        div(classes: 'dish-meta', [
          span(classes: 'dish-category', [text(category)]),
          div(classes: 'dish-rating', [
            span(classes: 'star', [text('⭐')]),
            span(classes: 'rating-value', [text(rating.toStringAsFixed(1))]),
            span(classes: 'review-count', [text('($reviews)')]),
          ])
        ]),
        h3(classes: 'dish-title', [text(title)]),
        div(classes: 'dish-footer', [
          div(classes: 'dish-price', [
            span(classes: 'currency', [text('\$')]),
            span(classes: 'price-amount', [text(price.toStringAsFixed(2))]),
          ]),
          button(classes: 'add-cart-btn', [
            span(classes: 'plus-icon', [text('+')])
          ])
        ])
      ])
    ]);
  }

  @css
  static final styles = [
    css('.popular-dishes').styles(
      padding: Spacing.symmetric(vertical: 100.px),
      backgroundColor: Color('#F8FAFC'),
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
      gap: Gap.all(16.px),
    ),
    css('.dishes-grid').styles(
      display: Display.grid,
      gridTemplate: const GridTemplate(columns: GridTracks([
        GridTrack(TrackSize.fr(1)),
        GridTrack(TrackSize.fr(1)),
        GridTrack(TrackSize.fr(1)),
        GridTrack(TrackSize.fr(1)),
      ])),
      gap: Gap.all(32.px),
    ),
    css('.dish-card').styles(
      backgroundColor: Colors.white,
      radius: BorderRadius.circular(24.px),
      overflow: Overflow.hidden,
      shadow: BoxShadow(offsetX: 0.px, offsetY: 12.px, blur: 24.px, color: Color.rgba(0,0,0,0.03)),
      transition: Transition('all', duration: Duration(milliseconds: 300)),
      cursor: Cursor.pointer,
    ),
    css('.dish-card:hover').styles(
      transform: Transform.translate(y: (-12).px),
      shadow: BoxShadow(offsetX: 0.px, offsetY: 24.px, blur: 48.px, color: Color.rgba(0,0,0,0.08)),
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
      backgroundColor: Colors.white,
      radius: BorderRadius.circular(50.percent),
      display: Display.flex,
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.center,
      shadow: BoxShadow(offsetX: 0.px, offsetY: 4.px, blur: 12.px, color: Color.rgba(0,0,0,0.1)),
      transition: Transition('transform', duration: Duration(milliseconds: 200)),
      color: Colors.red,
      fontSize: 1.rem,
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
      color: Color('#FF5E1E'),
      backgroundColor: Color('#FFF5F2'),
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
      color: Color('#0F172A'),
      fontSize: 0.875.rem,
    ),
    css('.review-count').styles(
      color: Color('#64748B'),
      fontSize: 0.875.rem,
    ),
    css('.dish-title').styles(
      fontSize: 1.25.rem,
      color: Color('#0F172A'),
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
      color: Color('#0F172A'),
    ),
    css('.currency').styles(
      fontSize: 1.rem,
      fontWeight: FontWeight.w600,
      color: Color('#FF5E1E'),
      margin: Spacing.only(top: 2.px),
    ),
    css('.price-amount').styles(
      fontSize: 1.5.rem,
      fontWeight: FontWeight.bold,
    ),
    css('.add-cart-btn').styles(
      width: 48.px,
      height: 48.px,
      backgroundColor: Color('#0F172A'),
      color: Colors.white,
      radius: BorderRadius.circular(16.px),
      display: Display.flex,
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.center,
      transition: Transition('all', duration: Duration(milliseconds: 300)),
    ),
    css('.add-cart-btn:hover').styles(
      backgroundColor: Color('#FF5E1E'),
      transform: Transform.rotate(90.deg),
    ),
    css('.plus-icon').styles(
      fontSize: 1.5.rem,
      fontWeight: FontWeight.w300,
    ),
    css('@media (max-width: 1200px)').styles(
      raw: {
        ' .dishes-grid': 'grid-template-columns: repeat(3, 1fr);',
      }
    ),
    css('@media (max-width: 992px)').styles(
      raw: {
        ' .dishes-grid': 'grid-template-columns: repeat(2, 1fr);',
        ' .popular-dishes .section-header': 'flex-direction: column; align-items: flex-start; gap: 24px;',
      }
    ),
    css('@media (max-width: 640px)').styles(
      raw: {
        ' .dishes-grid': 'grid-template-columns: 1fr;',
      }
    )
  ];
}
