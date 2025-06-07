import 'package:freezed_annotation/freezed_annotation.dart';
import 'base_model.dart';
import 'language.dart';

part 'campsite.freezed.dart';
part 'campsite.g.dart';

/// Represents a campsite location with its details
@freezed
class Campsite with _$Campsite implements BaseModel {
  const Campsite._(); // Add this line to implement BaseModel methods

  /// Creates a new Campsite instance
  const factory Campsite({
    /// Unique identifier for the campsite
    required String id,
    
    /// Name of the campsite
    required String label,
    
    /// Geographical location of the campsite
    required GeoLocation geoLocation,
    
    /// Whether the campsite is close to water
    required bool isCloseToWater,
    
    /// Whether campfires are allowed at the campsite
    required bool isCampFireAllowed,
    
    /// List of languages spoken by the host
    required List<String> hostLanguages,
    
    /// Price per night in euros
    required double pricePerNight,
    
    /// URL of the campsite's photo
    required String photo,
    
    /// List of features the campsite is suitable for
    @Default([]) List<String> suitableFor,
  }) = _Campsite;

  /// Creates a Campsite from a JSON map
  factory Campsite.fromJson(Map<String, dynamic> json) => _$CampsiteFromJson(json);

  @override
  List<String> validate() {
    final errors = <String>[];
    
    if (id.isEmpty) {
      errors.add('Campsite ID cannot be empty');
    }
    
    if (label.isEmpty) {
      errors.add('Campsite label cannot be empty');
    }
    
    if (pricePerNight < 0) {
      errors.add('Price per night cannot be negative');
    }
    
    if (photo.isEmpty) {
      errors.add('Photo URL cannot be empty');
    }
    
    return errors;
  }
}

/// Represents a geographical location with latitude and longitude
@freezed
class GeoLocation with _$GeoLocation implements BaseModel {
  const GeoLocation._(); // Add this line to implement BaseModel methods

  /// Creates a new GeoLocation instance
  const factory GeoLocation({
    /// Latitude coordinate
    required double lat,
    
    /// Longitude coordinate
    @JsonKey(name: 'long') required double lng,
  }) = _GeoLocation;

  /// Creates a GeoLocation from a JSON map
  factory GeoLocation.fromJson(Map<String, dynamic> json) => _$GeoLocationFromJson(json);

  @override
  List<String> validate() {
    final errors = <String>[];
    
    if (lat < -90 || lat > 90) {
      errors.add('Latitude must be between -90 and 90 degrees');
    }
    
    if (lng < -180 || lng > 180) {
      errors.add('Longitude must be between -180 and 180 degrees');
    }
    
    return errors;
  }
}

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