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
      desc: 'Title for the pantry page',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: 'Button text to add an item',
      args: [],
    );
  }

  /// `Update`
  String get update {
    return Intl.message(
      'Update',
      name: 'update',
      desc: 'Button text to update an item',
      args: [],
    );
  }

  /// `Reset`
  String get reset {
    return Intl.message(
      'Reset',
      name: 'reset',
      desc: 'Button text to reset the form',
      args: [],
    );
  }

  /// `Name`
  String get nameLabel {
    return Intl.message(
      'Name',
      name: 'nameLabel',
      desc: 'Label for the name input field',
      args: [],
    );
  }

  /// `Quantity`
  String get quantityLabel {
    return Intl.message(
      'Quantity',
      name: 'quantityLabel',
      desc: 'Label for the quantity input field',
      args: [],
    );
  }

  /// `Must be a positive number`
  String get mustBePositive {
    return Intl.message(
      'Must be a positive number',
      name: 'mustBePositive',
      desc: 'Error message when the quantity is not a positive number',
      args: [],
    );
  }

  /// `Must be between 1 and 30 characters`
  String get mustHaveCharacters {
    return Intl.message(
      'Must be between 1 and 30 characters',
      name: 'mustHaveCharacters',
      desc: 'Error message when the name is not between 1 and 30 characters',
      args: [],
    );
  }

  /// `Add Pantry Item`
  String get addPantryItem {
    return Intl.message(
      'Add Pantry Item',
      name: 'addPantryItem',
      desc: 'Button text to add an item to the pantry',
      args: [],
    );
  }

  /// `Shopping List`
  String get shoppingListTitle {
    return Intl.message(
      'Shopping List',
      name: 'shoppingListTitle',
      desc: 'Title for the shopping list page',
      args: [],
    );
  }

  /// `Add Shopping List Item`
  String get addShoppingListItem {
    return Intl.message(
      'Add Shopping List Item',
      name: 'addShoppingListItem',
      desc: 'Button text to add an item to the shopping list',
      args: [],
    );
  }

  /// `No items added yet.`
  String get noItems {
    return Intl.message(
      'No items added yet.',
      name: 'noItems',
      desc: 'Message displayed when there are no items in the list',
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
      desc: 'Name of the storage location',
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
      desc: 'Name of the category',
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
