/// Where the landing site reads its content from.
///
/// Pure Dart on purpose — no `dart:io` — because the model layer that uses
/// these constants is compiled into the browser bundle alongside the navbar
/// island. Only `appwrite_client.dart` touches the network, and only the
/// server entrypoint imports it.
///
/// Override per deployment without editing source:
/// ```
/// jaspr build \
///   --dart-define=APPWRITE_ENDPOINT=https://sgp.cloud.appwrite.io/v1 \
///   --dart-define=APPWRITE_PROJECT_ID=... \
///   --dart-define=APPWRITE_DATABASE_ID=food_delivery_db
/// ```
library;

const kAppwriteEndpoint = String.fromEnvironment(
  'APPWRITE_ENDPOINT',
  defaultValue: 'https://sgp.cloud.appwrite.io/v1',
);

const kAppwriteProjectId = String.fromEnvironment(
  'APPWRITE_PROJECT_ID',
  defaultValue: '694d7ed80012589bdb9c',
);

const kAppwriteDatabaseId = String.fromEnvironment(
  'APPWRITE_DATABASE_ID',
  defaultValue: 'food_delivery_db',
);

/// Bucket holding product and marketing images.
const kAppwriteBucketId = String.fromEnvironment(
  'APPWRITE_BUCKET_ID',
  defaultValue: '694d812100305bf791d7',
);

/// Table ids, mirroring `AppwriteConfig` in the store panel.
class AppwriteTables {
  static const businessSetup = 'business_setup';
  static const storeSetup = 'store_setup';
  static const landingSetup = 'landing_setup';
  static const products = 'products';
}

/// Resolves whatever the database holds in an image column to a usable URL.
///
/// `products.image_id` is misleadingly named: the store panel writes the full
/// view URL returned by its uploader into it. Older rows — and anything
/// entered by hand in the Appwrite console — may hold a bare file id instead,
/// so both are accepted.
String appwriteImageUrl(String raw) {
  final value = raw.trim();
  if (value.isEmpty) return '';
  if (value.startsWith('http://') || value.startsWith('https://')) return value;
  return '$kAppwriteEndpoint/storage/buckets/$kAppwriteBucketId/files/$value/view'
      '?project=$kAppwriteProjectId';
}
