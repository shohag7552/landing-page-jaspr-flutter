/// A tiny read-only Appwrite client.
///
/// Runs in **both** places: on the Dart VM while `jaspr build` renders the
/// page, and in the browser when the page refreshes itself on load. That is
/// why it uses `package:http` rather than `dart:io` — one client, one code
/// path, no conditional imports.
///
/// Deliberately not the Appwrite SDK: this only ever reads a handful of public
/// rows, and the SDK would pull in an auth surface it has no use for.
///
/// SECURITY: sends the **project id only**. The store panel's `AppwriteConfig`
/// also holds a server API key with write scope — that key must never reach a
/// browser. Public reads work without it because `business_setup`,
/// `store_setup`, `landing_setup` and `products` all grant
/// `Permission.read(Role.any())`.
library;

import 'dart:convert';

import 'package:http/http.dart' as http;

import 'appwrite_config.dart';

class AppwriteClient {
  AppwriteClient({
    this.endpoint = kAppwriteEndpoint,
    this.projectId = kAppwriteProjectId,
    this.databaseId = kAppwriteDatabaseId,
    this.timeout = const Duration(seconds: 8),
  });

  final String endpoint;
  final String projectId;
  final String databaseId;

  /// Kept short on purpose. A slow backend must not stall a site build, and in
  /// the browser the page is already on screen — a late refresh is worse than
  /// no refresh.
  final Duration timeout;

  bool get isConfigured => projectId.isNotEmpty && databaseId.isNotEmpty;

  /// Returns the rows of [table], or an empty list on any failure.
  ///
  /// Never throws. The page must render even when Appwrite is unreachable,
  /// half-configured, or has not been seeded — a buyer's first build happens
  /// before they have entered anything.
  Future<List<Map<String, dynamic>>> listRows(
    String table, {
    List<String> queries = const [],
  }) async {
    if (!isConfigured) {
      _warn(table, 'Appwrite is not configured');
      return const [];
    }

    final params = <String, String>{};
    for (var i = 0; i < queries.length; i++) {
      params['queries[$i]'] = queries[i];
    }

    final uri = Uri.parse('$endpoint/tablesdb/$databaseId/tables/$table/rows')
        .replace(queryParameters: params.isEmpty ? null : params);

    try {
      final response = await http.get(
        uri,
        headers: {
          'X-Appwrite-Project': projectId,
          'X-Appwrite-Response-Format': '1.8.0',
        },
      ).timeout(timeout);

      if (response.statusCode != 200) {
        _warn(table, 'HTTP ${response.statusCode}: ${_clip(response.body)}');
        return const [];
      }

      final decoded = jsonDecode(response.body);
      if (decoded is! Map<String, dynamic>) {
        _warn(table, 'unexpected response shape');
        return const [];
      }

      // Appwrite 1.8 returns `rows`; older builds return `documents`.
      final rows = decoded['rows'] ?? decoded['documents'];
      if (rows is! List) {
        _warn(table, 'no rows in response');
        return const [];
      }

      return rows.whereType<Map<String, dynamic>>().toList();
    } catch (e) {
      _warn(table, '$e');
      return const [];
    }
  }

  /// The single row of a setup table, or null when it has none.
  Future<Map<String, dynamic>?> firstRow(String table) async {
    final rows = await listRows(table, queries: const ['{"method":"limit","values":[1]}']);
    return rows.isEmpty ? null : rows.first;
  }

  void _warn(String table, String message) {
    // Loud on purpose: a silent fall back to placeholder copy is how a store
    // ends up publishing "Riverside" as its city.
    // ignore: avoid_print
    print('[landing] Appwrite read failed for "$table" — using defaults. $message');
  }

  static String _clip(String value) =>
      value.length <= 200 ? value : '${value.substring(0, 200)}…';
}
