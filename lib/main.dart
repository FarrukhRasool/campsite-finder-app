import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:campsite_finder/l10n/app_localizations.dart';
import 'screens/home_screen.dart';
import 'resources/theme.dart';
import 'providers/language_provider.dart';
import 'providers/theme_provider.dart';
import 'widgets/campsite_location_map.dart';

void main() {
  runApp(
    const ProviderScope(
      child: CampsiteFinderApp(),
    ),
  );
}

class CampsiteFinderApp extends ConsumerWidget {
  const CampsiteFinderApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedLocale = ref.watch(languageProvider);
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Campsite Finder',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      locale: Locale(selectedLocale),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: const HomeScreen(),
    );
  }
}
