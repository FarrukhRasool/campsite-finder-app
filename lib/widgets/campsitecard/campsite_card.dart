import 'package:flutter/material.dart';
import '../../models/campsite.dart';
import '../../resources/text_styles.dart';
import '../../resources/colors.dart';
import '../../utils/number_formatter.dart';
import 'campsite_card_image.dart';
import 'campsite_card_info.dart';

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
              CampsiteImage(photoUrl: campsite.photo),
              CampsiteInfo(campsite: campsite),
            ],
          ),
        ),
      ),
    );
  }
}

