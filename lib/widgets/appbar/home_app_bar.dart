import 'package:flutter/material.dart';
// import '../../resources/constants.dart';
import 'package:campsite_finder/l10n/app_localizations.dart';


class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onFilterPressed;

  const HomeAppBar({required this.onFilterPressed});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.filter_list),
        onPressed: onFilterPressed,
      ),
      title: Text(
        l10n.campsitesAppBarTitle,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
    );
  }
}