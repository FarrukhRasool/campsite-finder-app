import 'package:flutter/material.dart';
import '../resources/colors.dart';
import '../resources/text_styles.dart';

class CampsiteFeatureIcons extends StatelessWidget {
  final bool isCloseToWater;
  final bool isCampFireAllowed;
  final String languages;
  final String closeToWaterTitle;
  final String notNearWaterTitle;
  final String campFireAllowedTitle;
  final String noCampfireTitle;

  const CampsiteFeatureIcons({
    super.key,
    required this.isCloseToWater,
    required this.isCampFireAllowed,
    required this.languages,
    required this.closeToWaterTitle,
    required this.notNearWaterTitle,
    required this.campFireAllowedTitle,
    required this.noCampfireTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: _featureItem(
            icon: Icons.water,
            iconColor: Colors.blue,
            label: isCloseToWater ? closeToWaterTitle : notNearWaterTitle,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _featureItem(
            icon: Icons.local_fire_department,
            iconColor: Colors.orange,
            label: isCampFireAllowed ? campFireAllowedTitle : noCampfireTitle,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _featureItem(
            icon: Icons.language,
            iconColor: Colors.purple,
            label: languages,
          ),
        ),
      ],
    );
  }

  Widget _featureItem({required IconData icon, required Color iconColor, required String label}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      decoration: BoxDecoration(
        color: lightGrey,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(icon, size: 24, color: iconColor),
          const SizedBox(height: 2),
          Text(
            label,
            style: labelStyle.copyWith(fontSize: 10, color: black),
          ),
        ],
      ),
    );
  }
} 