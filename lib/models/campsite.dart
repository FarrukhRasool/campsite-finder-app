import 'package:freezed_annotation/freezed_annotation.dart';

part 'campsite.freezed.dart';
part 'campsite.g.dart';

enum Language { en, de }

extension LanguageFlag on Language {
  String get flag {
    switch (this) {
      case Language.en:
        return '🇬🇧';
      case Language.de:
        return '🇩🇪';
    }
  }

  String get code {
    switch (this) {
      case Language.en:
        return 'en';
      case Language.de:
        return 'de';
    }
  }

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

@freezed
class Campsite with _$Campsite {
  const factory Campsite({
    required String id,
    required String label,
    required GeoLocation geoLocation,
    required bool isCloseToWater,
    required bool isCampFireAllowed,
    required List<String> hostLanguages,
    required double pricePerNight,
    required String photo,
    @Default([]) List<String> suitableFor,
  }) = _Campsite;

  factory Campsite.fromJson(Map<String, dynamic> json) => _$CampsiteFromJson(json);
}

@freezed
class GeoLocation with _$GeoLocation {
  const factory GeoLocation({
    required double lat,
    @JsonKey(name: 'long') required double lng,
  }) = _GeoLocation;

  factory GeoLocation.fromJson(Map<String, dynamic> json) => _$GeoLocationFromJson(json);
} 