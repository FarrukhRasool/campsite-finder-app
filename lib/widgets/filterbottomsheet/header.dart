import 'package:flutter/material.dart';
// import '../../resources/constants.dart';
import '../../resources/text_styles.dart';
import 'package:campsite_finder/generated/l10n.dart';

class Header extends StatelessWidget {
  final VoidCallback onClose;

  const Header({required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(S.of(context).filterCampsitesTitle, style: headingStyle),
        IconButton(icon: const Icon(Icons.close), onPressed: onClose),
      ],
    );
  }
}