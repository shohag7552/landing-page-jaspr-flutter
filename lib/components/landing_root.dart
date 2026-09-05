import 'dart:convert';

import 'package:jaspr/jaspr.dart';

import '../app.dart';
import '../data/landing_data.dart';
import '../data/landing_repository.dart';

/// The page root, and the reason content updates without a rebuild.
///
/// The server renders the whole page from Appwrite and hands the same data
/// down as JSON in [initialJson]. In the browser this component hydrates from
/// that payload — so the first frame is byte-identical to the server's, with
/// no flash of placeholder text — and then re-reads Appwrite and rebuilds with
/// whatever the store has changed since the site was built.
///
/// That is what lets a buyer upload the built folder to any host, edit copy in
/// the store panel, and see it on the next reload without Dart, without the
/// Jaspr CLI, and without redeploying.
///
/// The one thing a reload cannot refresh is `<title>`, the meta description
/// and the Open Graph tags: search engines and chat apps read those from the
/// served HTML without running JavaScript, so they stay at their build-time
/// values until the site is rebuilt.
@client
class LandingRoot extends StatefulComponent {
  const LandingRoot({required this.initialJson, super.key});

  /// [LandingData] as JSON. A single String keeps the client payload trivially
  /// serialisable, rather than teaching the framework about the whole model.
  final String initialJson;

  @override
  State<LandingRoot> createState() => LandingRootState();
}

class LandingRootState extends State<LandingRoot> {
  late LandingData _data = _decode(component.initialJson);

  @override
  void initState() {
    super.initState();
    // Server-side this is already the freshest possible data, and re-fetching
    // during pre-rendering would double every build's requests.
    if (kIsWeb) {
      _refresh();
    }
  }

  /// Re-reads Appwrite and swaps in the result.
  ///
  /// Deliberately silent on failure: the page is already on screen showing the
  /// last-built content, so an offline visitor or a slow backend should change
  /// nothing rather than blank the page or show an error.
  Future<void> _refresh() async {
    try {
      final fresh = await LandingRepository().fetch();
      if (!mounted || !fresh.isLive) return;
      setState(() => _data = fresh);
    } catch (_) {
      // Keep what the server rendered.
    }
  }

  static LandingData _decode(String json) {
    try {
      final decoded = jsonDecode(json);
      if (decoded is Map<String, dynamic>) return LandingData.fromJson(decoded);
    } catch (_) {
      // A malformed payload should still render a complete page.
    }
    return LandingData.fallback();
  }

  @override
  Component build(BuildContext context) {
    return LandingScope(data: _data, child: const App());
  }
}
