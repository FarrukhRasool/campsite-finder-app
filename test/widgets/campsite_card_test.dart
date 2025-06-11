import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:campsite_finder/models/campsite.dart';
import 'package:campsite_finder/widgets/campsitecard/campsite_card.dart';

void main() {
  testWidgets('CampsiteCard displays campsite information correctly',
      (WidgetTester tester) async {
    final campsite = Campsite(
      id: '1',
      label: 'Test Campsite',
      geoLocation: GeoLocation(lat: 48.8566, lng: 2.3522),
      isCloseToWater: true,
      isCampFireAllowed: false,
      hostLanguages: ['en'],
      pricePerNight: 25.0,
      photo: 'https://example.com/photo.jpg',
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CampsiteCard(campsite: campsite),
        ),
      ),
    );

    // Verify that the campsite information is displayed
    expect(find.text('Test Campsite'), findsOneWidget);
    expect(find.textContaining('€25'), findsOneWidget);
    // Optionally check for water/campfire icons or text if your UI displays them
  });
} 