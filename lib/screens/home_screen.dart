import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/campsite_provider.dart';
import '../models/campsite.dart';
import '../widgets/campsite_card.dart';
import 'campsite_detail_screen.dart';
import 'package:flutter/services.dart';

const availableLanguages = [
  {'code': 'en', 'label': 'English'},
  {'code': 'de', 'label': 'German'},
];

const darkGreen = Color(0xFF207A3D);

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  void _showFilterBottomSheet(BuildContext context, WidgetRef ref, CampsiteFilters filters) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFFF8F8F8),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 16,
          right: 16,
          top: 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Filter Campsites',
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Consumer(
              builder: (context, ref, child) {
                final currentFilters = ref.watch(campsiteFiltersProvider);
                final selectedLanguages = currentFilters.speakingLanguages ?? [];
                final minSlider = 0.0;
                final sliderMax = 100000.0;
                final selectedMin = currentFilters.minPrice ?? minSlider;
                final selectedMax = currentFilters.maxPrice ?? sliderMax;
                return Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: SwitchListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          'Close to Water',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 16,
                            color: darkGreen,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        value: currentFilters.isCloseToWater ?? false,
                        onChanged: (value) {
                          ref.read(campsiteFiltersProvider.notifier).state =
                              currentFilters.copyWith(isCloseToWater: value);
                        },
                      ),
                    ),
                    const SizedBox(height: 2),
                    SizedBox(
                      width: double.infinity,
                      child: SwitchListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          'Camp Fire Allowed',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 16,
                            color: darkGreen,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        value: currentFilters.isCampFireAllowed ?? false,
                        onChanged: (value) {
                          ref.read(campsiteFiltersProvider.notifier).state =
                              currentFilters.copyWith(isCampFireAllowed: value);
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Price Range',
                        style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 16,
                          color: darkGreen,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    RangeSlider(
                      min: minSlider,
                      max: sliderMax,
                      values: RangeValues(selectedMin, selectedMax),
                      divisions: ((sliderMax - minSlider) ~/ 1000),
                      onChanged: (values) {
                        ref.read(campsiteFiltersProvider.notifier).state =
                            currentFilters.copyWith(minPrice: values.start, maxPrice: values.end);
                      },
                      activeColor: darkGreen,
                      inactiveColor: Colors.grey[300],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _PriceBox(label: 'Min.', value: selectedMin.toStringAsFixed(0)),
                        _PriceBox(label: 'Max.', value: selectedMax.toStringAsFixed(0)),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Speaking Language',
                        style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 16,
                          color: darkGreen,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Wrap(
                        alignment: WrapAlignment.start,
                        spacing: 8,
                        children: [
                          for (final lang in availableLanguages)
                            FilterChip(
                              label: Text(lang['label']!, style: const TextStyle(fontFamily: 'Arial')),
                              selected: selectedLanguages.contains(lang['code']),
                              onSelected: (selected) {
                                final newList = List<String>.from(selectedLanguages);
                                if (selected) {
                                  newList.add(lang['code']!);
                                } else {
                                  newList.remove(lang['code']);
                                }
                                ref.read(campsiteFiltersProvider.notifier).state =
                                    currentFilters.copyWith(speakingLanguages: newList);
                              },
                            ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                onPressed: () {
                  ref.read(campsiteFiltersProvider.notifier).state = CampsiteFilters();
                  Navigator.pop(context);
                },
                child: const Text('Reset Filters', style: TextStyle(fontFamily: 'Arial', fontSize: 16)),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
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
          color: Colors.white,
        ),
        title: const Text(
          'Campsites',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        color: const Color(0xFFF8F8F8),
        child: campsites.isEmpty
            ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.search_off, size: 64, color: Color(0xFFCCCCCC)),
                    SizedBox(height: 16),
                    Text(
                      'No Result Found',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 20,
                        color: Color(0xFFCCCCCC),
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

class _PriceBox extends StatelessWidget {
  final String label;
  final String value;
  const _PriceBox({required this.label, required this.value});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[400]!),
        borderRadius: BorderRadius.circular(8),
        color: Colors.transparent,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'Arial',
              fontSize: 14,
              color: Color(0xFFCCCCCC),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            value,
            style: const TextStyle(
              fontFamily: 'Arial',
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
} 