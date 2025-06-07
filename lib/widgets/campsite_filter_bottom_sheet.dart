import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/campsite_provider.dart';
import 'price_box.dart';
import '../resources/text_styles.dart';
import '../constants.dart';
import '../resources/colors.dart';

class CampsiteFilterBottomSheet extends ConsumerWidget {
  final CampsiteFilters filters;
  final Color darkGreen;
  final List<Map<String, String>> availableLanguages;
  const CampsiteFilterBottomSheet({
    Key? key,
    required this.filters,
    required this.darkGreen,
    required this.availableLanguages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentFilters = ref.watch(campsiteFiltersProvider);
    final selectedLanguages = currentFilters.speakingLanguages ?? [];
    final minSlider = 0.0;
    final sliderMax = 100000.0;
    final selectedMin = currentFilters.minPrice ?? minSlider;
    final selectedMax = currentFilters.maxPrice ?? sliderMax;
    return Padding(
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
                filterCampsitesTitle,
                style: headingStyle,
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text(
                closeToWaterTitle,
                style: sectionHeadingStyle,
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
              title: const Text(
                campFireAllowedTitle,
                style: sectionHeadingStyle,
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
            child: const Text(
              priceRangeTitle,
              style: sectionHeadingStyle,
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
            inactiveColor: lightGrey,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PriceBox(label: minLabel, value: selectedMin.toStringAsFixed(0)),
              PriceBox(label: maxLabel, value: selectedMax.toStringAsFixed(0)),
            ],
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerLeft,
            child: const Text(
              speakingLanguageTitle,
              style: sectionHeadingStyle,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Wrap(
              alignment: WrapAlignment.start,
              spacing: 8,
              children: [
                for (final lang in availableLanguages)
                  FilterChip(
                    label: Text(lang['label']!, style: labelStyle),
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
              child: const Text(resetFiltersLabel, style: TextStyle(fontFamily: 'Arial', fontSize: 16)),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
} 