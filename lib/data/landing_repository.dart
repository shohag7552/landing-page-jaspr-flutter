/// Fetches everything the page needs, in one call.
///
/// Server-side only — it reaches the network through `dart:io`. The browser
/// bundle must never import this file; it only needs `landing_data.dart`.
library;

import 'appwrite_client.dart';
import 'appwrite_config.dart';
import 'landing_data.dart';

class LandingRepository {
  LandingRepository({AppwriteClient? client})
      : _client = client ?? AppwriteClient();

  final AppwriteClient _client;

  /// How many products each storefront tab shows.
  static const _showcaseLimit = 4;

  /// Reads the three setup rows and the two product lists.
  ///
  /// Never throws and never returns null. If Appwrite is unreachable, not yet
  /// seeded, or half-configured, the missing pieces fall back to the built-in
  /// defaults — a store's first build happens before any of this exists.
  Future<LandingData> fetch() async {
    // One round trip each, in parallel: the whole thing sits on the critical
    // path of every build.
    final results = await Future.wait([
      _client.firstRow(AppwriteTables.businessSetup),
      _client.firstRow(AppwriteTables.storeSetup),
      _client.firstRow(AppwriteTables.landingSetup),
      _client.firstRow(AppwriteTables.privacyPolicy),
      _popularProducts('food'),
      _popularProducts('ecommerce'),
    ]);

    final business = results[0] as Map<String, dynamic>?;
    final store = results[1] as Map<String, dynamic>?;
    final landing = results[2] as Map<String, dynamic>?;
    final policies = results[3] as Map<String, dynamic>?;
    final foodRows = results[4] as List<Map<String, dynamic>>;
    final shopRows = results[5] as List<Map<String, dynamic>>;

    final currency = (business?['currency_symbol'] ?? r'$').toString();
    final foodMeta = _prepWindow(business);

    return LandingData.fromRows(
      business: business,
      store: store,
      landing: landing,
      policies: policies,
      foodItems: foodRows
          .map((row) => showcaseItemFromRow(row, currency: currency, foodMeta: foodMeta))
          .where((item) => item.title.isNotEmpty)
          .toList(),
      shopItems: shopRows
          .map((row) => showcaseItemFromRow(row, currency: currency, foodMeta: foodMeta))
          .where((item) => item.title.isNotEmpty)
          .toList(),
    );
  }

  /// Best sellers for one module.
  ///
  /// Ordered by `order_count`, which the seed script backfills and indexes, so
  /// "Popular right now" is true rather than just the newest rows.
  Future<List<Map<String, dynamic>>> _popularProducts(String module) {
    return _client.listRows(
      AppwriteTables.products,
      queries: [
        '{"method":"equal","attribute":"module_type","values":["$module"]}',
        '{"method":"equal","attribute":"is_available","values":[true]}',
        '{"method":"orderDesc","attribute":"order_count"}',
        '{"method":"limit","values":[$_showcaseLimit]}',
      ],
    );
  }

  /// "15–20 min", from the store's own delivery window.
  String _prepWindow(Map<String, dynamic>? business) {
    final min = business?['min_delivery_time'];
    final max = business?['max_delivery_time'];
    if (min is num && max is num && max > 0) {
      return '${min.toInt()}–${max.toInt()} min';
    }
    return '';
  }
}
