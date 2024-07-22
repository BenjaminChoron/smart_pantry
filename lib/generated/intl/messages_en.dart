// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(name) => "${Intl.select(name, {
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
          })}";

  static String m1(name) => "${Intl.select(name, {
            'All': 'All',
            'Fridge': 'Fridge',
            'Freezer': 'Freezer',
            'Cupboard': 'Cupboard',
          })}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "add": MessageLookupByLibrary.simpleMessage("Add"),
        "addPantryItem":
            MessageLookupByLibrary.simpleMessage("Add Pantry Item"),
        "addShoppingListItem":
            MessageLookupByLibrary.simpleMessage("Add Shopping List Item"),
        "categoryName": m0,
        "darkTheme": MessageLookupByLibrary.simpleMessage("Dark"),
        "lightTheme": MessageLookupByLibrary.simpleMessage("Light"),
        "mustBePositive":
            MessageLookupByLibrary.simpleMessage("Must be a positive number"),
        "mustHaveCharacters": MessageLookupByLibrary.simpleMessage(
            "Must be between 1 and 30 characters"),
        "nameLabel": MessageLookupByLibrary.simpleMessage("Name"),
        "noItems": MessageLookupByLibrary.simpleMessage("No items added yet."),
        "pantryDialogActionNo": MessageLookupByLibrary.simpleMessage("No"),
        "pantryDialogActionYes": MessageLookupByLibrary.simpleMessage("Yes"),
        "pantryDialogConfirmContent": MessageLookupByLibrary.simpleMessage(
            "Do you really want to remove this item from your pantry?"),
        "pantryDialogDismissContent": MessageLookupByLibrary.simpleMessage(
            "Do you want to add this item to your shopping list?"),
        "pantryDialogTitle":
            MessageLookupByLibrary.simpleMessage("Pantry Item Removal"),
        "pantryTitle": MessageLookupByLibrary.simpleMessage("Pantry"),
        "quantityLabel": MessageLookupByLibrary.simpleMessage("Quantity"),
        "reset": MessageLookupByLibrary.simpleMessage("Reset"),
        "settingsTitle": MessageLookupByLibrary.simpleMessage("Settings"),
        "shoppingListTitle":
            MessageLookupByLibrary.simpleMessage("Shopping List"),
        "storageName": m1,
        "systemTheme": MessageLookupByLibrary.simpleMessage("System"),
        "theme": MessageLookupByLibrary.simpleMessage("Theme"),
        "update": MessageLookupByLibrary.simpleMessage("Update")
      };
}
