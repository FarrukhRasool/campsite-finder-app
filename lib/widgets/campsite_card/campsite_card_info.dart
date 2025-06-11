import 'package:flutter/material.dart';
import '../../models/campsite.dart';
import '../../resources/text_styles.dart';
import '../../resources/colors.dart';
import '../../utils/number_formatter.dart';
import 'spec_pill.dart';
import 'package:campsite_finder/l10n/app_localizations.dart';

class CampsiteInfo extends StatelessWidget {
  final Campsite campsite;

  const CampsiteInfo({required this.campsite});

  @override
  Widget build(BuildContext context) {
    final languages = _buildLanguageWidgets(campsite.hostLanguages);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  (campsite.label).isNotEmpty
                      ? campsite.label[0].toUpperCase() + campsite.label.substring(1)
                      : '',
                  style: headingStyle.copyWith(fontSize: 20, fontWeight: FontWeight.normal),
                ),
              ),
              if (languages.isNotEmpty)
                Row(
                  children: [
                    const Icon(Icons.language, size: 16, color: Colors.purple),
                    const SizedBox(width: 2),
                    ...languages,
                  ],
                ),
            ],
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
              Text('/night', style: labelStyle.copyWith(fontSize: 16, color: AppColors.black)),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              SpecPill(
                icon: Icons.water,
                label: campsite.isCloseToWater ? AppLocalizations.of(context)!.closeToWaterTitle : AppLocalizations.of(context)!.notNearWaterTitle,
                isActive: campsite.isCloseToWater,
                activeColor: Colors.blue,
                small: true,
              ),
              const SizedBox(width: 6),
              SpecPill(
                icon: Icons.local_fire_department,
                label: campsite.isCampFireAllowed ? AppLocalizations.of(context)!.campFireAllowedTitle : AppLocalizations.of(context)!.noCampfireTitle,
                isActive: campsite.isCampFireAllowed,
                activeColor: Colors.orange,
                small: true,
              ),
            ],
          ),
          if (campsite.suitableFor.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Row(
                children: [
                  const Icon(Icons.check_circle, size: 18, color: Colors.teal),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      'Suitable for: ${campsite.suitableFor.join(", ")}',
                      style: labelStyle.copyWith(fontSize: 14, color: AppColors.black),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
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
}


