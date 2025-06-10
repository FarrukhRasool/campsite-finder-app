import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../../resources/constants.dart';
import 'package:campsite_finder/l10n/app_localizations.dart';
import '../../providers/language_provider.dart';
import '../../providers/theme_provider.dart';

class HomeAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final VoidCallback onFilterPressed;

  const HomeAppBar({Key? key, required this.onFilterPressed}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final currentLanguage = ref.watch(languageProvider);
    final currentThemeMode = ref.watch(themeModeProvider);

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
        // Theme Selector
        PopupMenuButton<ThemeMode>(
          icon: Icon(currentThemeMode == ThemeMode.dark ? Icons.dark_mode : Icons.light_mode),
          iconSize: 24,
          position: PopupMenuPosition.under,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          offset: const Offset(0, 8),
          onSelected: (ThemeMode themeMode) {
            ref.read(themeModeProvider.notifier).state = themeMode;
          },
          itemBuilder: (BuildContext context) => [
            PopupMenuItem<ThemeMode>(
              value: ThemeMode.light,
              height: 36,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.light_mode, size: 20),
                  const SizedBox(width: 8),
                  Text('Light Theme', style: TextStyle(
                    fontSize: 14,
                    fontWeight: currentThemeMode == ThemeMode.light ? FontWeight.bold : FontWeight.normal,
                  )),
                ],
              ),
            ),
            PopupMenuItem<ThemeMode>(
              value: ThemeMode.dark,
              height: 36,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.dark_mode, size: 20),
                  const SizedBox(width: 8),
                  Text('Dark Theme', style: TextStyle(
                    fontSize: 14,
                    fontWeight: currentThemeMode == ThemeMode.dark ? FontWeight.bold : FontWeight.normal,
                  )),
                ],
              ),
            ),
            PopupMenuItem<ThemeMode>(
              value: ThemeMode.system,
              height: 36,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.brightness_auto, size: 20),
                  const SizedBox(width: 8),
                  Text('System Theme', style: TextStyle(
                    fontSize: 14,
                    fontWeight: currentThemeMode == ThemeMode.system ? FontWeight.bold : FontWeight.normal,
                  )),
                ],
              ),
            ),
          ],
        ),
        // Language Selector
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