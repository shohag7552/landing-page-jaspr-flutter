/// The languages this site can render in.
///
/// ## Adding a language
///
/// 1. Copy `strings/strings_bn.dart` to `strings/strings_<code>.dart` and
///    translate the values. Only override what you translate — every field
///    falls back to its English text, so a half-finished translation still
///    renders a complete page.
/// 2. Add one entry to [kSiteLanguages] below.
/// 3. Add the same code to the dropdown in the store panel
///    (`landing_setup_screen.dart`) so the owner can pick it.
///
/// Nothing else needs touching. The site reads the chosen code from
/// `landing_setup.language`.
library;

import 'site_strings.dart';
import 'strings/strings_ar.dart';
import 'strings/strings_bn.dart';
import 'strings/strings_en.dart';

/// One language the site can be rendered in.
class SiteLanguage {
  const SiteLanguage({
    required this.code,
    required this.name,
    required this.strings,
    this.isRtl = false,
    this.fontStack,
    this.googleFontFamily,
    String? ogLocale,
  }) : _ogLocale = ogLocale;

  final String? _ogLocale;

  /// Used by Facebook and WhatsApp when the link is shared. Defaults to the
  /// language code with a matching region, which is right often enough.
  String get ogLocale => _ogLocale ?? _defaultOgLocale;

  String get _defaultOgLocale => switch (code) {
    'en' => 'en_US',
    'bn' => 'bn_BD',
    'ar' => 'ar_AR',
    _ => code,
  };

  /// BCP 47 code, used for `<html lang>` and `og:locale`.
  final String code;

  /// Shown in the store panel's language picker, in the language itself —
  /// someone looking for their own language should not have to read English
  /// to find it.
  final String name;

  final SiteStrings strings;

  /// Arabic, Hebrew, Urdu and Persian read right to left. Setting this flips
  /// the whole layout; see the `[dir='rtl']` rules in `lib/ui_kit.dart`.
  final bool isRtl;

  /// Extra families to put in front of the default stack, for scripts the
  /// site's Latin fonts do not cover.
  final String? fontStack;

  /// Loaded from Google Fonts alongside Inter and Outfit when this language
  /// is active. Null means the default fonts already cover the script.
  final String? googleFontFamily;
}

/// Every language on offer, keyed by code. `en` must stay present: it is the
/// fallback when a store's saved language is one this build does not have,
/// and the source every other language falls back to entry by entry.
///
/// Not `const`, because each translation is merged with English at startup —
/// see [SiteStrings.withFallbackTo].
final kSiteLanguages = <String, SiteLanguage>{
  'en': SiteLanguage(
    code: 'en',
    name: 'English',
    strings: stringsEn,
  ),
  'bn': SiteLanguage(
    code: 'bn',
    name: 'বাংলা',
    strings: stringsBn.withFallbackTo(stringsEn),
    // Inter has no Bengali glyphs; without this the page renders as boxes.
    fontStack: "'Noto Sans Bengali'",
    googleFontFamily: 'Noto+Sans+Bengali:wght@400;500;600;700',
  ),
  'ar': SiteLanguage(
    code: 'ar',
    name: 'العربية',
    strings: stringsAr.withFallbackTo(stringsEn),
    isRtl: true,
    fontStack: "'Noto Sans Arabic'",
    googleFontFamily: 'Noto+Sans+Arabic:wght@400;500;600;700',
  ),
};

const kDefaultLanguage = 'en';

/// The language for [code], falling back to English.
///
/// A store that saved a code this build no longer ships still gets a working
/// site rather than a crash.
SiteLanguage languageFor(String? code) =>
    kSiteLanguages[code] ?? kSiteLanguages[kDefaultLanguage]!;
