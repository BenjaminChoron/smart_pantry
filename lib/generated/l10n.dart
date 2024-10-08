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

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: 'Button text to add an item',
      args: [],
    );
  }

  /// `Item added to pantry!`
  String get addedToPantry {
    return Intl.message(
      'Item added to pantry!',
      name: 'addedToPantry',
      desc: 'Message displayed when an item is added to the pantry',
      args: [],
    );
  }

  /// `Item added to shopping list!`
  String get addedToShoppingList {
    return Intl.message(
      'Item added to shopping list!',
      name: 'addedToShoppingList',
      desc: 'Message displayed when an item is added to the shopping list',
      args: [],
    );
  }

  /// `Add New Recipe`
  String get addNewRecipe {
    return Intl.message(
      'Add New Recipe',
      name: 'addNewRecipe',
      desc: 'Button text to add a new recipe',
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

  /// `Add Shopping List Item`
  String get addShoppingListItem {
    return Intl.message(
      'Add Shopping List Item',
      name: 'addShoppingListItem',
      desc: 'Button text to add an item to the shopping list',
      args: [],
    );
  }

  /// `Developed by Benjamin Choron`
  String get appDevelopedBy {
    return Intl.message(
      'Developed by Benjamin Choron',
      name: 'appDevelopedBy',
      desc: 'The developer of the application',
      args: [],
    );
  }

  /// `This application offers the display of products approaching their expiration date within five days before they expire. After the expiration date, they remain displayed in red on this list until they are removed.`
  String get appExpirationDateManagementContent {
    return Intl.message(
      'This application offers the display of products approaching their expiration date within five days before they expire. After the expiration date, they remain displayed in red on this list until they are removed.',
      name: 'appExpirationDateManagementContent',
      desc: 'Content for the expiration date management section',
      args: [],
    );
  }

  /// `Expiration date management`
  String get appExpirationDateManagementTitle {
    return Intl.message(
      'Expiration date management',
      name: 'appExpirationDateManagementTitle',
      desc: 'Title for the expiration date management section',
      args: [],
    );
  }

  /// `Informations`
  String get appInformationsButton {
    return Intl.message(
      'Informations',
      name: 'appInformationsButton',
      desc: 'Button text to display app informations',
      args: [],
    );
  }

  /// `Apply filters`
  String get applyFilters {
    return Intl.message(
      'Apply filters',
      name: 'applyFilters',
      desc: 'Button text to apply filters',
      args: [],
    );
  }

  /// `This application uses local storage to save your data. This means that your data is stored on your device and is not shared with any third party. Warning, if you delete the app, you will lose all this data.`
  String get appStorageInformationsContent {
    return Intl.message(
      'This application uses local storage to save your data. This means that your data is stored on your device and is not shared with any third party. Warning, if you delete the app, you will lose all this data.',
      name: 'appStorageInformationsContent',
      desc: 'Content for the storage information section',
      args: [],
    );
  }

  /// `Information related to storage`
  String get appStorageInformationsTitle {
    return Intl.message(
      'Information related to storage',
      name: 'appStorageInformationsTitle',
      desc: 'Title for the storage information section',
      args: [],
    );
  }

  /// `Version {version}`
  String appVersion(Object version) {
    return Intl.message(
      'Version $version',
      name: 'appVersion',
      desc: 'The version of the application',
      args: [version],
    );
  }

  /// `{name, select, All {All} Fruits {Fruits & Vegetables} Fish {Fish Shop} Butcher {Butcher Shop} Dairy {Dairy} Fresh {Fresh} Bakery {Bakery} Snacks {Snacks} Drinks {Drinks} Frozen {Frozen} Grocery {Grocery} Other {Other}}`
  String categoryName(Object name) {
    return Intl.select(
      name,
      {
        'All': 'All',
        'Fruits': 'Fruits & Vegetables',
        'Fish': 'Fish Shop',
        'Butcher': 'Butcher Shop',
        'Dairy': 'Dairy',
        'Fresh': 'Fresh',
        'Bakery': 'Bakery',
        'Snacks': 'Snacks',
        'Drinks': 'Drinks',
        'Frozen': 'Frozen',
        'Grocery': 'Grocery',
        'Other': 'Other',
      },
      name: 'categoryName',
      desc: 'Name of the category',
      args: [name],
    );
  }

  /// `Clear filters`
  String get clearFilters {
    return Intl.message(
      'Clear filters',
      name: 'clearFilters',
      desc: 'Button text to clear filters',
      args: [],
    );
  }

  /// `Dark`
  String get darkTheme {
    return Intl.message(
      'Dark',
      name: 'darkTheme',
      desc: 'Label for the dark theme',
      args: [],
    );
  }

  /// `Expiration Date`
  String get expirationLabel {
    return Intl.message(
      'Expiration Date',
      name: 'expirationLabel',
      desc: 'Label for the expiration date input field',
      args: [],
    );
  }

  /// `Within 5 days`
  String get expirationRange {
    return Intl.message(
      'Within 5 days',
      name: 'expirationRange',
      desc: 'Title of the expiration list view',
      args: [],
    );
  }

  /// `Expiration Dates`
  String get expirationTitle {
    return Intl.message(
      'Expiration Dates',
      name: 'expirationTitle',
      desc: 'Title for the expiration dates page',
      args: [],
    );
  }

  /// `Expired`
  String get expired {
    return Intl.message(
      'Expired',
      name: 'expired',
      desc: 'Label for the expired status',
      args: [],
    );
  }

  /// `Failed to add item... Please try again later.`
  String get failedToAddItem {
    return Intl.message(
      'Failed to add item... Please try again later.',
      name: 'failedToAddItem',
      desc: 'Error message when an item cannot be added',
      args: [],
    );
  }

  /// `Failed to remove item... Please try again later.`
  String get failedToRemoveItem {
    return Intl.message(
      'Failed to remove item... Please try again later.',
      name: 'failedToRemoveItem',
      desc: 'Error message when an item cannot be removed',
      args: [],
    );
  }

  /// `Failed to update item... Please try again later.`
  String get failedToUpdateItem {
    return Intl.message(
      'Failed to update item... Please try again later.',
      name: 'failedToUpdateItem',
      desc: 'Error message when an item cannot be updated',
      args: [],
    );
  }

  /// `Filter by`
  String get filterBy {
    return Intl.message(
      'Filter by',
      name: 'filterBy',
      desc: 'Label for the filter by category',
      args: [],
    );
  }

  /// `hours`
  String get hours {
    return Intl.message(
      'hours',
      name: 'hours',
      desc: 'Label for the hours',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: 'Label for the language setting',
      args: [],
    );
  }

  /// `Light`
  String get lightTheme {
    return Intl.message(
      'Light',
      name: 'lightTheme',
      desc: 'Label for the light theme',
      args: [],
    );
  }

  /// `minutes`
  String get minutes {
    return Intl.message(
      'minutes',
      name: 'minutes',
      desc: 'Label for the minutes',
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

  /// `Name`
  String get nameLabel {
    return Intl.message(
      'Name',
      name: 'nameLabel',
      desc: 'Label for the name input field',
      args: [],
    );
  }

  /// `New Ingredient`
  String get newIngredientLabel {
    return Intl.message(
      'New Ingredient',
      name: 'newIngredientLabel',
      desc: 'Label for the new ingredient input field',
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

  /// `No`
  String get pantryDialogActionNo {
    return Intl.message(
      'No',
      name: 'pantryDialogActionNo',
      desc: 'Button text to cancel the action',
      args: [],
    );
  }

  /// `Yes`
  String get pantryDialogActionYes {
    return Intl.message(
      'Yes',
      name: 'pantryDialogActionYes',
      desc: 'Button text to confirm the action',
      args: [],
    );
  }

  /// `Do you really want to remove this item from your pantry?`
  String get pantryDialogConfirmContent {
    return Intl.message(
      'Do you really want to remove this item from your pantry?',
      name: 'pantryDialogConfirmContent',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to add this item to your shopping list?`
  String get pantryDialogDismissContent {
    return Intl.message(
      'Do you want to add this item to your shopping list?',
      name: 'pantryDialogDismissContent',
      desc: 'Content for the dialog to add a pantry item to the pantry',
      args: [],
    );
  }

  /// `Add to shopping list`
  String get pantryDialogDismissTitle {
    return Intl.message(
      'Add to shopping list',
      name: 'pantryDialogDismissTitle',
      desc: 'Title for the dialog to add a pantry item to the shopping list',
      args: [],
    );
  }

  /// `Pantry Item Removal`
  String get pantryDialogTitle {
    return Intl.message(
      'Pantry Item Removal',
      name: 'pantryDialogTitle',
      desc: 'Title for the dialog to remove pantry item',
      args: [],
    );
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

  /// `Quantity`
  String get quantityLabel {
    return Intl.message(
      'Quantity',
      name: 'quantityLabel',
      desc: 'Label for the quantity input field',
      args: [],
    );
  }

  /// `Cost`
  String get recipeCost {
    return Intl.message(
      'Cost',
      name: 'recipeCost',
      desc: 'Label for the recipe cost',
      args: [],
    );
  }

  /// `Cost`
  String get recipeCostLabel {
    return Intl.message(
      'Cost',
      name: 'recipeCostLabel',
      desc: 'Label for the recipe cost',
      args: [],
    );
  }

  /// `{name, select, Low {Low} Medium {Medium} High {High}}`
  String recipeCostName(Object name) {
    return Intl.select(
      name,
      {
        'Low': 'Low',
        'Medium': 'Medium',
        'High': 'High',
      },
      name: 'recipeCostName',
      desc: 'Name of the recipe cost',
      args: [name],
    );
  }

  /// `Description`
  String get recipeDescription {
    return Intl.message(
      'Description',
      name: 'recipeDescription',
      desc: 'Label for the recipe description',
      args: [],
    );
  }

  /// `Difficulty`
  String get recipeDifficulty {
    return Intl.message(
      'Difficulty',
      name: 'recipeDifficulty',
      desc: 'Label for the recipe difficulty',
      args: [],
    );
  }

  /// `Difficulty`
  String get recipeDifficultyLabel {
    return Intl.message(
      'Difficulty',
      name: 'recipeDifficultyLabel',
      desc: 'Label for the recipe difficulty',
      args: [],
    );
  }

  /// `{name, select, Easy {Easy} Medium {Medium} Hard {Hard}}`
  String recipeDifficultyName(Object name) {
    return Intl.select(
      name,
      {
        'Easy': 'Easy',
        'Medium': 'Medium',
        'Hard': 'Hard',
      },
      name: 'recipeDifficultyName',
      desc: 'Name of the recipe difficulty',
      args: [name],
    );
  }

  /// `Ingredients`
  String get recipeIngredients {
    return Intl.message(
      'Ingredients',
      name: 'recipeIngredients',
      desc: 'Label for the recipe ingredients',
      args: [],
    );
  }

  /// `No`
  String get recipeRemoveDialogActionNo {
    return Intl.message(
      'No',
      name: 'recipeRemoveDialogActionNo',
      desc: 'Button text to cancel the action',
      args: [],
    );
  }

  /// `Yes`
  String get recipeRemoveDialogActionYes {
    return Intl.message(
      'Yes',
      name: 'recipeRemoveDialogActionYes',
      desc: 'Button text to confirm the action',
      args: [],
    );
  }

  /// `Do you really want to remove this recipe?`
  String get recipeRemoveDialogConfirmContent {
    return Intl.message(
      'Do you really want to remove this recipe?',
      name: 'recipeRemoveDialogConfirmContent',
      desc: 'Content for the dialog to remove a recipe',
      args: [],
    );
  }

  /// `Remove recipe`
  String get recipeRemoveDialogTitle {
    return Intl.message(
      'Remove recipe',
      name: 'recipeRemoveDialogTitle',
      desc: 'Title for the dialog to remove a recipe',
      args: [],
    );
  }

  /// `Steps`
  String get recipeSteps {
    return Intl.message(
      'Steps',
      name: 'recipeSteps',
      desc: 'Label for the recipe steps',
      args: [],
    );
  }

  /// `Recipes`
  String get recipesTitle {
    return Intl.message(
      'Recipes',
      name: 'recipesTitle',
      desc: 'Title for the recipes page',
      args: [],
    );
  }

  /// `Time`
  String get recipeTimeLabel {
    return Intl.message(
      'Time',
      name: 'recipeTimeLabel',
      desc: '',
      args: [],
    );
  }

  /// `Type`
  String get recipeTypeLabel {
    return Intl.message(
      'Type',
      name: 'recipeTypeLabel',
      desc: 'Label for the recipe type',
      args: [],
    );
  }

  /// `{name, select, Breakfast {Breakfast} MainCourse {Main Course} Starter {Stater} Snack {Snack} Dessert {Dessert} Drink {Drink}}`
  String recipeTypeName(Object name) {
    return Intl.select(
      name,
      {
        'Breakfast': 'Breakfast',
        'MainCourse': 'Main Course',
        'Starter': 'Stater',
        'Snack': 'Snack',
        'Dessert': 'Dessert',
        'Drink': 'Drink',
      },
      name: 'recipeTypeName',
      desc: 'Name of the recipe type',
      args: [name],
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

  /// `Settings`
  String get settingsTitle {
    return Intl.message(
      'Settings',
      name: 'settingsTitle',
      desc: 'Title for the settings page',
      args: [],
    );
  }

  /// `No`
  String get shoppingListAddToPantryDialogActionNo {
    return Intl.message(
      'No',
      name: 'shoppingListAddToPantryDialogActionNo',
      desc: 'Button text to cancel the action',
      args: [],
    );
  }

  /// `Yes`
  String get shoppingListAddToPantryDialogActionYes {
    return Intl.message(
      'Yes',
      name: 'shoppingListAddToPantryDialogActionYes',
      desc: 'Button text to confirm the action',
      args: [],
    );
  }

  /// `Did you purchase that item and want to add it to the pantry?`
  String get shoppingListAddToPantryDialogConfirmContent {
    return Intl.message(
      'Did you purchase that item and want to add it to the pantry?',
      name: 'shoppingListAddToPantryDialogConfirmContent',
      desc: 'Content for the dialog to remove a shopping list item',
      args: [],
    );
  }

  /// `Shopping List Purchased Item`
  String get shoppingListAddToPantryDialogTitle {
    return Intl.message(
      'Shopping List Purchased Item',
      name: 'shoppingListAddToPantryDialogTitle',
      desc:
          'Title for the dialog to remove shopping list item and add it to the pantry',
      args: [],
    );
  }

  /// `No`
  String get shoppingListRemoveDialogActionNo {
    return Intl.message(
      'No',
      name: 'shoppingListRemoveDialogActionNo',
      desc: 'Button text to cancel the action',
      args: [],
    );
  }

  /// `Yes`
  String get shoppingListRemoveDialogActionYes {
    return Intl.message(
      'Yes',
      name: 'shoppingListRemoveDialogActionYes',
      desc: 'Button text to confirm the action',
      args: [],
    );
  }

  /// `Do you really want to remove this item from your shopping list?`
  String get shoppingListRemoveDialogConfirmContent {
    return Intl.message(
      'Do you really want to remove this item from your shopping list?',
      name: 'shoppingListRemoveDialogConfirmContent',
      desc: '',
      args: [],
    );
  }

  /// `Shopping List Item Removal`
  String get shoppingListRemoveDialogTitle {
    return Intl.message(
      'Shopping List Item Removal',
      name: 'shoppingListRemoveDialogTitle',
      desc: 'Title for the dialog to remove shopping list item',
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

  /// `Steps`
  String get stepsLabel {
    return Intl.message(
      'Steps',
      name: 'stepsLabel',
      desc: 'Label for the recipe steps',
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

  /// `Store`
  String get store {
    return Intl.message(
      'Store',
      name: 'store',
      desc: 'Button text to store an item',
      args: [],
    );
  }

  /// `System`
  String get systemTheme {
    return Intl.message(
      'System',
      name: 'systemTheme',
      desc: 'Label for the system theme',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message(
      'Theme',
      name: 'theme',
      desc: 'Label for the theme setting',
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

  /// `Where do you want to store this item?`
  String get whereToStore {
    return Intl.message(
      'Where do you want to store this item?',
      name: 'whereToStore',
      desc:
          'Label for the storage location in the shopping list to pantry dialog',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'it'),
      Locale.fromSubtags(languageCode: 'pt'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'CN'),
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
