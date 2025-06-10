import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../../resources/constants.dart';
import 'package:campsite_finder/l10n/app_localizations.dart';
import '../../providers/language_provider.dart';

class HomeAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final VoidCallback onFilterPressed;

  const HomeAppBar({Key? key, required this.onFilterPressed}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final currentLanguage = ref.watch(languageProvider);

    return AppBar(
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.filter_list),
        onPressed: onFilterPressed,
      ),
      title: Text(
        l10n.campsitesAppBarTitle,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
      actions: [
        PopupMenuButton<String>(
          icon: const Icon(Icons.language),
          iconSize: 24,
          position: PopupMenuPosition.under,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          offset: const Offset(0, 8),
          onSelected: (String languageCode) {
            ref.read(languageProvider.notifier).state = languageCode;
          },
          itemBuilder: (BuildContext context) => [
            PopupMenuItem<String>(
              value: 'en',
              height: 36,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('🇬🇧'),
                  const SizedBox(width: 8),
                  Text('English', style: TextStyle(
                    fontSize: 14,
                    fontWeight: currentLanguage == 'en' ? FontWeight.bold : FontWeight.normal,
                  )),
                ],
              ),
            ),
            PopupMenuItem<String>(
              value: 'de',
              height: 36,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('🇩🇪'),
                  const SizedBox(width: 8),
                  Text('Deutsch', style: TextStyle(
                    fontSize: 14,
                    fontWeight: currentLanguage == 'de' ? FontWeight.bold : FontWeight.normal,
                  )),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}