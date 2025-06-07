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
                return Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: SwitchListTile(
                        contentPadding: EdgeInsets.zero,
                        title: const Text('Close to Water', style: TextStyle(fontFamily: 'Arial')),
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
                        title: const Text('Camp Fire Allowed', style: TextStyle(fontFamily: 'Arial')),
                        value: currentFilters.isCampFireAllowed ?? false,
                        onChanged: (value) {
                          ref.read(campsiteFiltersProvider.notifier).state =
                              currentFilters.copyWith(isCampFireAllowed: value);
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Enter Max Price per Night',
                        labelStyle: TextStyle(fontFamily: 'Arial', color: Color(0xFFCCCCCC)),
                        prefixText: '€ ',
                        prefixStyle: TextStyle(fontFamily: 'Arial', color: Color(0xFFCCCCCC)),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFCCCCCC)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFCCCCCC)),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      style: const TextStyle(fontFamily: 'Arial', color: Color(0xFF232323)),
                      onChanged: (value) {
                        final price = double.tryParse(value);
                        ref.read(campsiteFiltersProvider.notifier).state =
                            currentFilters.copyWith(maxPrice: price);
                      },
                    ),
                    const SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Speaking Language',
                        style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF232323),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
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
        backgroundColor: const Color(0xFF232323),
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