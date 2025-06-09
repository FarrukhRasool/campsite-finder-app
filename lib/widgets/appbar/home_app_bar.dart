import 'package:flutter/material.dart';
// import '../../resources/constants.dart';
import 'package:campsite_finder/generated/l10n.dart';


class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onFilterPressed;

  const HomeAppBar({required this.onFilterPressed});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.filter_list),
        onPressed: onFilterPressed,
      ),
      title: Text(
        S.of(context).campsitesAppBarTitle,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
    );
  }
}