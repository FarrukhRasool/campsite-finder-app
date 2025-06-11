import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:campsite_finder/providers/campsite_provider.dart';
import 'package:campsite_finder/models/campsite.dart';
import 'package:campsite_finder/services/campsite_service.dart';

void main() {
  group('Campsite API & Filter Tests', () {
    test('API returns a list of campsites', () async {
      final service = CampsiteService();
      final campsites = await service.getCampsites();
      expect(campsites, isA<List<Campsite>>());
      expect(campsites.isNotEmpty, true);
    });

    test('Filter: Close to Water', () async {
      final container = ProviderContainer(overrides: [
        campsitesProvider.overrideWith((ref) => Future.value([
          Campsite(
            id: '1',
            label: 'A',
            geoLocation: GeoLocation(lat: 1, lng: 1),
            isCloseToWater: true,
            isCampFireAllowed: true,
            hostLanguages: ['en'],
            pricePerNight: 10,
            photo: '',
          ),
          Campsite(
            id: '2',
            label: 'B',
            geoLocation: GeoLocation(lat: 2, lng: 2),
            isCloseToWater: false,
            isCampFireAllowed: true,
            hostLanguages: ['en'],
            pricePerNight: 20,
            photo: '',
          ),
        ])),
        campsiteFiltersProvider.overrideWith((ref) => CampsiteFilters(isCloseToWater: true)),
      ]);
      final filtered = container.read(filteredCampsitesProvider);
      expect(filtered.length, 1);
      expect(filtered.first.isCloseToWater, true);
    });

    test('Filter: Campfire Allowed', () async {
      final container = ProviderContainer(overrides: [
        campsitesProvider.overrideWith((ref) => Future.value([
          Campsite(
            id: '1',
            label: 'A',
            geoLocation: GeoLocation(lat: 1, lng: 1),
            isCloseToWater: true,
            isCampFireAllowed: false,
            hostLanguages: ['en'],
            pricePerNight: 10,
            photo: '',
          ),
          Campsite(
            id: '2',
            label: 'B',
            geoLocation: GeoLocation(lat: 2, lng: 2),
            isCloseToWater: true,
            isCampFireAllowed: true,
            hostLanguages: ['en'],
            pricePerNight: 20,
            photo: '',
          ),
        ])),
        campsiteFiltersProvider.overrideWith((ref) => CampsiteFilters(isCampFireAllowed: true)),
      ]);
      final filtered = container.read(filteredCampsitesProvider);
      expect(filtered.length, 1);
      expect(filtered.first.isCampFireAllowed, true);
    });

    test('Filter: Price Range', () async {
      final container = ProviderContainer(overrides: [
        campsitesProvider.overrideWith((ref) => Future.value([
          Campsite(
            id: '1',
            label: 'A',
            geoLocation: GeoLocation(lat: 1, lng: 1),
            isCloseToWater: true,
            isCampFireAllowed: true,
            hostLanguages: ['en'],
            pricePerNight: 10,
            photo: '',
          ),
          Campsite(
            id: '2',
            label: 'B',
            geoLocation: GeoLocation(lat: 2, lng: 2),
            isCloseToWater: true,
            isCampFireAllowed: true,
            hostLanguages: ['en'],
            pricePerNight: 50,
            photo: '',
          ),
        ])),
        campsiteFiltersProvider.overrideWith((ref) => CampsiteFilters(minPrice: 15, maxPrice: 60)),
      ]);
      final filtered = container.read(filteredCampsitesProvider);
      expect(filtered.length, 1);
      expect(filtered.first.pricePerNight, 50);
    });

    test('Filter: Host Languages', () async {
      final container = ProviderContainer(overrides: [
        campsitesProvider.overrideWith((ref) => Future.value([
          Campsite(
            id: '1',
            label: 'A',
            geoLocation: GeoLocation(lat: 1, lng: 1),
            isCloseToWater: true,
            isCampFireAllowed: true,
            hostLanguages: ['en'],
            pricePerNight: 10,
            photo: '',
          ),
          Campsite(
            id: '2',
            label: 'B',
            geoLocation: GeoLocation(lat: 2, lng: 2),
            isCloseToWater: true,
            isCampFireAllowed: true,
            hostLanguages: ['de'],
            pricePerNight: 20,
            photo: '',
          ),
        ])),
        campsiteFiltersProvider.overrideWith((ref) => CampsiteFilters(speakingLanguages: ['de'])),
      ]);
      final filtered = container.read(filteredCampsitesProvider);
      expect(filtered.length, 1);
      expect(filtered.first.hostLanguages, contains('de'));
    });
  });
} 