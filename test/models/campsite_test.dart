import 'package:flutter_test/flutter_test.dart';
import 'package:campsite_finder/models/campsite.dart';

void main() {
  group('Campsite Model Tests', () {
    test('should create a Campsite from JSON', () {
      final json = {
        'id': '1',
        'label': 'Test Campsite',
        'geoLocation': {
          'lat': 48.8566,
          'lng': 2.3522,
        },
        'country': 'France',
        'closeToWater': true,
        'campFireAllowed': false,
        'hostLanguage': 'English',
        'pricePerNight': 25.0,
        'photo': 'https://example.com/photo.jpg',
      };

      final campsite = Campsite.fromJson(json);

      expect(campsite.id, '1');
      expect(campsite.label, 'Test Campsite');
      expect(campsite.geoLocation.lat, 48.8566);
      expect(campsite.geoLocation.lng, 2.3522);
      expect(campsite.country, 'France');
      expect(campsite.closeToWater, true);
      expect(campsite.campFireAllowed, false);
      expect(campsite.hostLanguage, 'English');
      expect(campsite.pricePerNight, 25.0);
      expect(campsite.photo, 'https://example.com/photo.jpg');
    });

    test('should convert Campsite to JSON', () {
      final campsite = Campsite(
        id: '1',
        label: 'Test Campsite',
        geoLocation: const GeoLocation(lat: 48.8566, lng: 2.3522),
        country: 'France',
        closeToWater: true,
        campFireAllowed: false,
        hostLanguage: 'English',
        pricePerNight: 25.0,
        photo: 'https://example.com/photo.jpg',
      );

      final json = campsite.toJson();

      expect(json['id'], '1');
      expect(json['label'], 'Test Campsite');
      final geoLocationJson = (json['geoLocation'] as GeoLocation).toJson();
      expect(geoLocationJson['lat'], 48.8566);
      expect(geoLocationJson['lng'], 2.3522);
      expect(json['country'], 'France');
      expect(json['closeToWater'], true);
      expect(json['campFireAllowed'], false);
      expect(json['hostLanguage'], 'English');
      expect(json['pricePerNight'], 25.0);
      expect(json['photo'], 'https://example.com/photo.jpg');
    });
  });
} 