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
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
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
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Pantry`
  String get pantryTitle {
    return Intl.message(
      'Pantry',
      name: 'pantryTitle',
      desc: '',
      args: [],
    );
  }

  /// `Shopping List`
  String get shoppingListTitle {
    return Intl.message(
      'Shopping List',
      name: 'shoppingListTitle',
      desc: '',
      args: [],
    );
  }

  /// `{name, select, All {All} Fridge {Fridge} Freezer {Freezer} Cupboard {Cupboard}}`
  String storageName(Object name) {
    return Intl.select(
      name,
      {
        'All': 'All',
        'Fridge': 'Fridge',
        'Freezer': 'Freezer',
        'Cupboard': 'Cupboard',
      },
      name: 'storageName',
      desc: '',
      args: [name],
    );
  }

  /// `{name, select, All {All} Fruits {Fruits} Vegetables {Vegetables} Meat {Meat} Seafood {Seafood} Dairy {Dairy} Bakery {Bakery} Snacks {Snacks} Drinks {Drinks} Frozen {Frozen} Other {Other}}`
  String categoryName(Object name) {
    return Intl.select(
      name,
      {
        'All': 'All',
        'Fruits': 'Fruits',
        'Vegetables': 'Vegetables',
        'Meat': 'Meat',
        'Seafood': 'Seafood',
        'Dairy': 'Dairy',
        'Bakery': 'Bakery',
        'Snacks': 'Snacks',
        'Drinks': 'Drinks',
        'Frozen': 'Frozen',
        'Other': 'Other',
      },
      name: 'categoryName',
      desc: '',
      args: [name],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'fr'),
    ];
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
