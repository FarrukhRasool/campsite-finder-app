import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/campsite/filtered_campsites_provider.dart';
import '../providers/filter/filter_provider.dart';
import '../providers/filter/filter_model.dart';
import '../models/campsite.dart';
import '../widgets/campsite/campsite_card.dart';
import 'campsite_detail_screen.dart';
import 'package:flutter/services.dart';
import '../widgets/common/price_box.dart';
import '../widgets/filter/campsite_filter_bottom_sheet.dart';
import '../resources/colors.dart';
import '../resources/constants.dart';

const availableLanguages = [
  {'code': 'en', 'label': 'English'},
  {'code': 'de', 'label': 'German'},
];

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  void _showFilterBottomSheet(BuildContext context, WidgetRef ref, CampsiteFilters filters) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: lightGrey,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => CampsiteFilterBottomSheet(
        filters: filters,
        darkGreen: darkGreen,
        availableLanguages: availableLanguages,
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final campsites = ref.watch(filteredCampsitesProvider);
    final filters = ref.watch(campsiteFiltersProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkGreen,
        leading: IconButton(
          icon: const Icon(Icons.filter_list),
          onPressed: () => _showFilterBottomSheet(context, ref, filters),
          color: white,
        ),
        title: const Text(
          campsitesAppBarTitle,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: white,
          ),
        ),
      ),
      body: Container(
        color: lightGrey,
        child: campsites.isEmpty
            ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.search_off, size: 64, color: grey300),
                    SizedBox(height: 16),
                    Text(
                      'No Result Found',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 20,
                        color: grey300,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              )
            : ListView.builder(
                itemCount: campsites.length,
                itemBuilder: (context, index) {
                  final campsite = campsites[index];
                  return CampsiteCard(
                    campsite: campsite,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CampsiteDetailScreen(campsite: campsite),
                        ),
                      );
                    },
                  );
                },
              ),
      ),
    );
  }
} 