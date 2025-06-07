/// Represents supported languages in the application
enum Language {
  /// English language
  en,
  /// German language
  de,
}

/// Extension methods for the Language enum
extension LanguageFlag on Language {
  /// Returns the flag emoji for the language
  String get flag {
    switch (this) {
      case Language.en:
        return '🇬🇧';
      case Language.de:
        return '🇩🇪';
    }
  }

  /// Returns the language code
  String get code {
    switch (this) {
      case Language.en:
        return 'en';
      case Language.de:
        return 'de';
    }
  }

  /// Creates a Language enum from a language code
  /// Returns null if the code is not supported
  static Language? fromCode(String code) {
    switch (code) {
      case 'en':
        return Language.en;
      case 'de':
        return Language.de;
      default:
        return null;
    }
  }
} 