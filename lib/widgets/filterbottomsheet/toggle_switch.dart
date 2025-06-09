import 'package:flutter/material.dart';
import '../../resources/text_styles.dart';

class ToggleSwitch extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  const ToggleSwitch({required this.title, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SwitchListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(title, style: sectionHeadingStyle),
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}