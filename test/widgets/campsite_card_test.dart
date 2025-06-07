import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:campsite_finder/models/campsite.dart';
import 'package:campsite_finder/screens/home_screen.dart';

void main() {
  testWidgets('CampsiteCard displays campsite information correctly',
      (WidgetTester tester) async {
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

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CampsiteCard(campsite: campsite),
        ),
      ),
    );

    // Verify that the campsite information is displayed
    expect(find.text('Test Campsite'), findsOneWidget);
    expect(find.text('Country: France'), findsOneWidget);
    expect(find.text('Price: €25.00 per night'), findsOneWidget);
    expect(find.text('Near Water'), findsOneWidget);
    expect(find.text('Camp Fire Allowed'), findsNothing);
  });
} 