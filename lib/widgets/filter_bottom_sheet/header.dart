import 'package:flutter/material.dart';
// import '../../resources/constants.dart';
import '../../resources/text_styles.dart';
import 'package:campsite_finder/l10n/app_localizations.dart';

class Header extends StatelessWidget {
  final VoidCallback onClose;

  const Header({Key? key, required this.onClose}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(l10n.filterCampsitesTitle, style: headingStyle),
        IconButton(
          icon: const Icon(Icons.close),
          onPressed: onClose,
        ),
      ],
    );
  }
}