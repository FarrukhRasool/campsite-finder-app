import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../models/campsite.dart';
import '../resources/colors.dart';
import '../resources/text_styles.dart';
import '../utils/number_formatter.dart';
import 'package:campsite_finder/l10n/app_localizations.dart';

class CampsiteDetailScreen extends StatelessWidget {
  final Campsite campsite;

  const CampsiteDetailScreen({
    super.key,
    required this.campsite,
  });

 String buildLanguageString(List<dynamic>? langs) {
  if (langs == null || langs.isEmpty) return '';

  return langs.map((code) {
    final langCode = code.toString();
    if (langCode == 'en') return 'English';
    if (langCode == 'de') return 'German';
    return langCode; // fallback to code if unknown
  }).join(', ');
}

  @override
  Widget build(BuildContext context) {
    final languages = buildLanguageString(campsite.hostLanguages);
    final name = (campsite.label).isNotEmpty
        ? campsite.label[0].toUpperCase() + campsite.label.substring(1)
        : '';
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        title: Text(
          name,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              child: Image.network(
                campsite.photo,
                height: 220,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 220,
                    color: grey300,
                    child: const Icon(Icons.image, size: 60, color: white),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: headingStyle.copyWith(fontSize: 20, fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '€${NumberFormatter.formatPrice(campsite.pricePerNight)}',
                        style: headingStyle.copyWith(fontSize: 18, fontWeight: FontWeight.bold, color: black),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '/night',
                        style: labelStyle.copyWith(fontSize: 16, color: black),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const Icon(Icons.water, size: 28, color: Colors.blue),
                          const SizedBox(height: 4),
                          Text(
                            campsite.isCloseToWater ? AppLocalizations.of(context)!.closeToWaterTitle : AppLocalizations.of(context)!.notNearWaterTitle,
                            style: labelStyle.copyWith(fontSize: 13, color: black),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Icon(Icons.local_fire_department, size: 28, color: Colors.orange),
                          const SizedBox(height: 4),
                          Text(
                            campsite.isCampFireAllowed ? AppLocalizations.of(context)!.campFireAllowedTitle : AppLocalizations.of(context)!.noCampfireTitle,
                            style: labelStyle.copyWith(fontSize: 13, color: black),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Icon(Icons.language, size: 28, color: Colors.purple),
                          const SizedBox(height: 4),
                          Text(
                            languages,
                            style: labelStyle.copyWith(fontSize: 13, color: black),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: darkGreen,
                        foregroundColor: white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        textStyle: const TextStyle(fontFamily: 'Arial', fontSize: 16),
                      ),
                      onPressed: () {
                        Fluttertoast.showToast(
                        msg: "Thank you",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: darkGreen,
                        textColor: Colors.white,
                        fontSize: 14.0,
  );
                      },
                      child: const Text('Book Now'),
                    ),
                  ),
                  if (campsite.suitableFor.isNotEmpty) ...[
                    const SizedBox(height: 24),
                    Text(
                      'Suitable For:',
                      style: sectionHeadingStyle,
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      children: campsite.suitableFor
                          .map((item) => Chip(
                                label: Text(item),
                                backgroundColor: grey300.withOpacity(0.2),
                              ))
                          .toList(),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Location',
                style: sectionHeadingStyle,
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                height: 200,
                child: FlutterMap(
                  options: MapOptions(
                    center: LatLng(
                      campsite.geoLocation.lat,
                      campsite.geoLocation.lng,
                    ),
                    zoom: 13.0,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.example.campsite_finder',
                    ),
                    MarkerLayer(
                      markers: [
                        Marker(
                          point: LatLng(
                            campsite.geoLocation.lat,
                            campsite.geoLocation.lng,
                          ),
                          width: 80,
                          height: 80,
                          child: const Icon(
                            Icons.location_on,
                            color: Colors.red,
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
} 