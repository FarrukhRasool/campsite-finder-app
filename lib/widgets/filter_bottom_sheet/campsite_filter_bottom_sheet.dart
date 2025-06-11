import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/campsite.dart';
import '../../providers/campsite_provider.dart';
import '../../resources/colors.dart';
import '../../resources/text_styles.dart';
import 'price_box.dart';
import 'price_slider.dart';
import 'toggle_switch.dart';
import 'header.dart';
import 'package:campsite_finder/l10n/app_localizations.dart';

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
    final selectedMin = currentFilters.minPrice ?? 0.0;
    final selectedMax = currentFilters.maxPrice ?? 100000.0;
    final l10n = AppLocalizations.of(context)!;

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
          Header(onClose: () => Navigator.pop(context)),
          const SizedBox(height: 24),
          ToggleSwitch(
            title: l10n.closeToWaterTitle,
            value: currentFilters.isCloseToWater ?? false,
            onChanged: (val) => _updateFilter(ref, currentFilters.copyWith(isCloseToWater: val)),
          ),
          ToggleSwitch(
            title: l10n.campFireAllowedTitle,
            value: currentFilters.isCampFireAllowed ?? false,
            onChanged: (val) => _updateFilter(ref, currentFilters.copyWith(isCampFireAllowed: val)),
          ),
          const SizedBox(height: 16),
          Text(l10n.priceRangeTitle, style: sectionHeadingStyle),
          PriceSlider(
            selectedMin: selectedMin,
            selectedMax: selectedMax,
            onChanged: (values) => _updateFilter(ref, currentFilters.copyWith(minPrice: values.start, maxPrice: values.end)),
            darkGreen: darkGreen,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PriceBox(label: l10n.minLabel, value: selectedMin.toStringAsFixed(0)),
              PriceBox(label: l10n.maxLabel, value: selectedMax.toStringAsFixed(0)),
            ],
          ),
          const SizedBox(height: 24),
          Text(l10n.speakingLanguageTitle, style: sectionHeadingStyle),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            children: availableLanguages.map((lang) {
              final isSelected = selectedLanguages.contains(lang['code']);
              return FilterChip(
                label: Text(lang['label']!, style: greenlabelStyle),
                selected: isSelected, 
                backgroundColor: AppColors.lightGrey, 
                onSelected: (selected) {
                  final newList = List<String>.from(selectedLanguages);
                  selected ? newList.add(lang['code']!) : newList.remove(lang['code']);
                  _updateFilter(ref, currentFilters.copyWith(speakingLanguages: newList));
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 40,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
              ),
              onPressed: () {
                _updateFilter(ref, CampsiteFilters());
                Navigator.pop(context);
              },
              child: Text(l10n.resetFiltersLabel, style: TextStyle(fontFamily: 'Arial', fontSize: 16)),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  void _updateFilter(WidgetRef ref, CampsiteFilters filters) {
    ref.read(campsiteFiltersProvider.notifier).state = filters;
  }
}






