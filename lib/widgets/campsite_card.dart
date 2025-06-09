import 'package:flutter/material.dart';
import '../models/campsite.dart';
import '../resources/text_styles.dart';
import '../resources/constants.dart';
import '../resources/colors.dart';
import '../utils/number_formatter.dart';


class CampsiteCard extends StatelessWidget {
  final Campsite campsite;
  final VoidCallback? onTap;

  const CampsiteCard({
    Key? key,
    required this.campsite,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 0,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _CampsiteImage(photoUrl: campsite.photo),
              _CampsiteInfo(campsite: campsite),
            ],
          ),
        ),
      ),
    );
  }
}



class _CampsiteImage extends StatelessWidget {
  final String? photoUrl;

  const _CampsiteImage({required this.photoUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      child: Image.network(
        photoUrl ?? '',
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
    );
  }
}



class _CampsiteInfo extends StatelessWidget {
  final Campsite campsite;

  const _CampsiteInfo({required this.campsite});

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
                style: headingStyle.copyWith(fontSize: 18, fontWeight: FontWeight.bold, color: black),
              ),
              const SizedBox(width: 4),
              Text('/night', style: labelStyle.copyWith(fontSize: 16, color: black)),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              _SpecPill(
                icon: Icons.water,
                label: campsite.isCloseToWater ? closeToWaterTitle : notNearWaterTitle,
                isActive: campsite.isCloseToWater,
                activeColor: Colors.blue,
                small: true,
              ),
              const SizedBox(width: 6),
              _SpecPill(
                icon: Icons.local_fire_department,
                label: campsite.isCampFireAllowed ? campFireAllowedTitle : noCampfireTitle,
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
                      style: labelStyle.copyWith(fontSize: 14, color: black),
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

class _SpecPill extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final Color activeColor;
  final bool small;

  const _SpecPill({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.activeColor,
    this.small = false,
  });

  @override
  Widget build(BuildContext context) {
    final double iconSize = small ? 14 : 18;
    final double fontSize = small ? 12 : 14;
    final EdgeInsets padding = small
        ? const EdgeInsets.symmetric(horizontal: 8, vertical: 3)
        : const EdgeInsets.symmetric(horizontal: 12, vertical: 6);
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : grey300.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isActive ? activeColor : grey300,
          width: 1.1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: iconSize,
            color: isActive ? activeColor : grey300,
          ),
          const SizedBox(width: 4),
          Text(
            label,
            style: labelStyle.copyWith(
              color: isActive ? activeColor : grey300,
              fontWeight: FontWeight.w600,
              fontSize: fontSize,
            ),
          ),
        ],
      ),
    );
  }
}

