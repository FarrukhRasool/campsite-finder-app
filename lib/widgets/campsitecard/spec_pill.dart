import 'package:flutter/material.dart';
import '../../models/campsite.dart';
import '../../resources/text_styles.dart';
import '../../resources/constants.dart';
import '../../resources/colors.dart';
import '../../utils/number_formatter.dart';



class SpecPill extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final Color activeColor;
  final bool small;

  const SpecPill({
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
