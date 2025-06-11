import 'package:flutter/material.dart';
import '../../models/campsite.dart';
import '../campsitecard/campsite_card.dart';
import '../../resources/colors.dart';


class CampsiteList extends StatelessWidget {
  final List<Campsite> campsites;
  final Function(Campsite) onTap;

  const CampsiteList({required this.campsites, required this.onTap});

  @override
  Widget build(BuildContext context) {
    if (campsites.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search_off, size: 64, color: AppColors.grey300),
            SizedBox(height: 16),
            Text(
              'No Result Found',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 20,
                color: AppColors.grey300,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: campsites.length,
      itemBuilder: (context, index) => CampsiteCard(
        campsite: campsites[index],
        onTap: () => onTap(campsites[index]),
      ),
    );
  }
}
