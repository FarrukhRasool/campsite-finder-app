import 'package:flutter/material.dart';
import '../../resources/colors.dart';


class PriceSlider extends StatelessWidget {
  final double selectedMin;
  final double selectedMax;
  final ValueChanged<RangeValues> onChanged;
  final Color darkGreen;

  const PriceSlider({
    required this.selectedMin,
    required this.selectedMax,
    required this.onChanged,
    required this.darkGreen,
  });

  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      min: 0.0,
      max: 100000.0,
      values: RangeValues(selectedMin, selectedMax),
      divisions: 100,
      onChanged: onChanged,
      activeColor: darkGreen,
      inactiveColor: AppColors.grey400,
    );
  }
}