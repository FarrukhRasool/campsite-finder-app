import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../models/campsite.dart';
import '../resources/colors.dart';
import '../resources/text_styles.dart';
import '../utils/number_formatter.dart';
import 'package:campsite_finder/l10n/app_localizations.dart';
import '../widgets/campsite_feature_icons.dart';
import '../widgets/campsite_location_map.dart';
import '../l10n/app_localizations.dart';

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
      backgroundColor: AppColors.white,
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
                campsite.photo.replaceFirst('http://', 'https://'),
                height: 220,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 220,
                    color: AppColors.grey300,
                    child: const Icon(Icons.image, size: 60, color: AppColors.white),
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
                        style: headingStyle.copyWith(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.black),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '/${AppLocalizations.of(context)!.night}',
                        style: labelStyle.copyWith(fontSize: 16, color: AppColors.black),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  CampsiteFeatureIcons(
                    isCloseToWater: campsite.isCloseToWater,
                    isCampFireAllowed: campsite.isCampFireAllowed,
                    languages: languages,
                    closeToWaterTitle: AppLocalizations.of(context)!.closeToWaterTitle,
                    notNearWaterTitle: AppLocalizations.of(context)!.notNearWaterTitle,
                    campFireAllowedTitle: AppLocalizations.of(context)!.campFireAllowedTitle,
                    noCampfireTitle: AppLocalizations.of(context)!.noCampfireTitle,
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.darkGreen,
                        foregroundColor: AppColors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        textStyle: const TextStyle(fontFamily: 'Arial', fontSize: 16),
                      ),
                      onPressed: () {
                        Fluttertoast.showToast(
                        msg: AppLocalizations.of(context)!.thankyou,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: AppColors.darkGreen,
                        textColor: Colors.white,
                        fontSize: 14.0,
  );
                      },
                      child: Text(AppLocalizations.of(context)!.booknow),
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
                                backgroundColor: AppColors.grey300.withOpacity(0.2),
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
                AppLocalizations.of(context)!.location,
                style: sectionHeadingStyle,
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CampsiteLocationMap(
                latitude: 48.137154,
                longitude: 11.576124,
               ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
} 