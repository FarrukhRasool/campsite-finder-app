import 'package:flutter/material.dart';
import '../../models/campsite.dart';
import '../../resources/text_styles.dart';
import '../../resources/colors.dart';
import '../../utils/number_formatter.dart';



class CampsiteImage extends StatelessWidget {
  final String? photoUrl;

  const CampsiteImage({required this.photoUrl});

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
          color: AppColors.lightGrey,
          child: const Icon(Icons.image, size: 60, color: AppColors.grey300),
        ),
      ),
    );
  }
}
