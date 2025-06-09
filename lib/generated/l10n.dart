// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Filter Campsites`
  String get filterCampsitesTitle {
    return Intl.message(
      'Filter Campsites',
      name: 'filterCampsitesTitle',
      desc: '',
      args: [],
    );
  }

  /// `Price Range`
  String get priceRangeTitle {
    return Intl.message(
      'Price Range',
      name: 'priceRangeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Close to Water`
  String get closeToWaterTitle {
    return Intl.message(
      'Close to Water',
      name: 'closeToWaterTitle',
      desc: '',
      args: [],
    );
  }

  /// `Camp Fire Allowed`
  String get campFireAllowedTitle {
    return Intl.message(
      'Camp Fire Allowed',
      name: 'campFireAllowedTitle',
      desc: '',
      args: [],
    );
  }

  /// `Speaking Language`
  String get speakingLanguageTitle {
    return Intl.message(
      'Speaking Language',
      name: 'speakingLanguageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Reset Filters`
  String get resetFiltersLabel {
    return Intl.message(
      'Reset Filters',
      name: 'resetFiltersLabel',
      desc: '',
      args: [],
    );
  }

  /// `Min.`
  String get minLabel {
    return Intl.message('Min.', name: 'minLabel', desc: '', args: []);
  }

  /// `Max.`
  String get maxLabel {
    return Intl.message('Max.', name: 'maxLabel', desc: '', args: []);
  }

  /// `Campsites`
  String get campsitesAppBarTitle {
    return Intl.message(
      'Campsites',
      name: 'campsitesAppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Not Near Water`
  String get notNearWaterTitle {
    return Intl.message(
      'Not Near Water',
      name: 'notNearWaterTitle',
      desc: '',
      args: [],
    );
  }

  /// `No Campfire`
  String get noCampfireTitle {
    return Intl.message(
      'No Campfire',
      name: 'noCampfireTitle',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[Locale.fromSubtags(languageCode: 'en')];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
