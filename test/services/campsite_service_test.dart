import 'package:flutter_test/flutter_test.dart';
import 'package:campsite_finder/services/campsite_service.dart';
import 'package:campsite_finder/models/campsite.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([http.Client])
import 'campsite_service_test.mocks.dart';

void main() {
  late CampsiteService campsiteService;
  late MockClient mockClient;

  setUp(() {
    mockClient = MockClient();
    campsiteService = CampsiteService(client: mockClient);
  });

  group('CampsiteService Tests', () {
    test('should fetch campsites successfully', () async {
      final mockResponse = '''
        [
          {
            "id": "1",
            "label": "Test Campsite",
            "geoLocation": {
              "lat": 48.8566,
              "lng": 2.3522
            },
            "country": "France",
            "closeToWater": true,
            "campFireAllowed": false,
            "hostLanguage": "English",
            "pricePerNight": 25.0,
            "photo": "https://example.com/photo.jpg"
          }
        ]
      ''';

      when(mockClient.get(Uri.parse('${CampsiteService.baseUrl}/campsites')))
          .thenAnswer((_) async => http.Response(mockResponse, 200));

      final campsites = await campsiteService.getCampsites();

      expect(campsites.length, 1);
      expect(campsites[0].id, '1');
      expect(campsites[0].label, 'Test Campsite');
      expect(campsites[0].country, 'France');
    });

    test('should throw exception when API call fails', () async {
      when(mockClient.get(Uri.parse('${CampsiteService.baseUrl}/campsites')))
          .thenAnswer((_) async => http.Response('Error', 500));

      expect(
        () => campsiteService.getCampsites(),
        throwsException,
      );
    });
  });
} 