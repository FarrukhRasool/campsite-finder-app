import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:campsite_finder/l10n/app_localizations.dart';
import 'screens/home_screen.dart';
import 'resources/theme.dart';

void main() {
  runApp(
    const ProviderScope(
      child: CampsiteFinderApp(),
    ),
  );
}

class CampsiteFinderApp extends StatelessWidget {
  const CampsiteFinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campsite Finder',
      theme: AppTheme.lightTheme,
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
