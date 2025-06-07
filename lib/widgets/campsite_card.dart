import 'package:flutter/material.dart';
import '../models/campsite.dart';
import '../resources/text_styles.dart';
import '../constants.dart';
import '../resources/colors.dart';

class CampsiteCard extends StatelessWidget {
  final Campsite campsite;
  final VoidCallback? onTap;

  const CampsiteCard({
    Key? key,
    required this.campsite,
    this.onTap,
  }) : super(key: key);

  String formatPrice(num price) {
    final str = price.toStringAsFixed(0);
    final buffer = StringBuffer();
    int count = 0;
    for (int i = str.length - 1; i >= 0; i--) {
      buffer.write(str[i]);
      count++;
      if (count % 3 == 0 && i != 0) {
        buffer.write('.');
      }
    }
    return buffer.toString().split('').reversed.join();
  }

  List<Language> _parseLanguages(List<dynamic>? langs) {
    if (langs == null) return [];
    return langs.map((e) => LanguageFlag.fromCode(e.toString())).whereType<Language>().toList();
  }

  List<Widget> _buildLanguageWidgets(List<dynamic>? langs) {
    if (langs == null) return [];
    return langs.map((e) {
      final lang = LanguageFlag.fromCode(e.toString());
      if (lang != null) {
        return Text(lang.flag, style: const TextStyle(fontSize: 20));
      } else {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Text(
            e.toString(),
            style: labelStyle,
          ),
        );
      }
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final languages = _buildLanguageWidgets(campsite.hostLanguages);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: grey300.withOpacity(0.15),
            blurRadius: 24,
            spreadRadius: 4,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Card(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 0,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.network(
                  campsite.photo ?? '',
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 180,
                    color: lightGrey,
                    child: const Icon(Icons.image, size: 60, color: grey300),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      (campsite.label ?? '').isNotEmpty
                          ? campsite.label![0].toUpperCase() + campsite.label!.substring(1)
                          : '',
                      style: headingStyle.copyWith(fontSize: 20, fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(height: 8),
                    if (campsite.pricePerNight != null)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '€${formatPrice(campsite.pricePerNight!)}',
                            style: headingStyle.copyWith(fontSize: 18, fontWeight: FontWeight.bold, color: black),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '/night',
                            style: labelStyle.copyWith(fontSize: 16, color: black),
                          ),
                        ],
                      ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.water, size: 18, color: Colors.blue),
                        const SizedBox(width: 6),
                        Text(
                          campsite.isCloseToWater == true ? closeToWaterTitle : 'Not Near Water',
                          style: labelStyle.copyWith(fontSize: 14, color: black),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.local_fire_department, size: 18, color: Colors.orange),
                        const SizedBox(width: 6),
                        Text(
                          campsite.isCampFireAllowed == true ? campFireAllowedTitle : 'No Campfire',
                          style: labelStyle.copyWith(fontSize: 14, color: black),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    if (languages.isNotEmpty)
                      Row(
                        children: [
                          const Icon(Icons.language, size: 18, color: Colors.purple),
                          const SizedBox(width: 6),
                          const Text(speakingLanguageTitle, style: labelStyle),
                          ...languages,
                        ],
                      ),
                    if (campsite.suitableFor != null && campsite.suitableFor!.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Row(
                          children: [
                            const Icon(Icons.check_circle, size: 18, color: Colors.teal),
                            const SizedBox(width: 6),
                            Expanded(
                              child: Text(
                                'Suitable for: ${campsite.suitableFor!.join(", ")}',
                                style: labelStyle.copyWith(fontSize: 14, color: black),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 