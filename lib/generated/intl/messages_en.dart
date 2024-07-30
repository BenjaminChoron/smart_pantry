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
        "addedToPantry":
            MessageLookupByLibrary.simpleMessage("Item added to pantry!"),
        "addedToShoppingList": MessageLookupByLibrary.simpleMessage(
            "Item added to shopping list!"),
        "categoryName": m0,
        "darkTheme": MessageLookupByLibrary.simpleMessage("Dark"),
        "expirationRange":
            MessageLookupByLibrary.simpleMessage("Within 5 days"),
        "expirationTitle":
            MessageLookupByLibrary.simpleMessage("Expiration Dates"),
        "expired": MessageLookupByLibrary.simpleMessage("Expired"),
        "failedToAddItem": MessageLookupByLibrary.simpleMessage(
            "Failed to add item... Please try again later."),
        "failedToRemoveItem": MessageLookupByLibrary.simpleMessage(
            "Failed to remove item... Please try again later."),
        "failedToUpdateItem": MessageLookupByLibrary.simpleMessage(
            "Failed to update item... Please try again later."),
        "language": MessageLookupByLibrary.simpleMessage("Language"),
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
            "Do you want to add this item to your pantry?"),
        "pantryDialogTitle":
            MessageLookupByLibrary.simpleMessage("Pantry Item Removal"),
        "pantryTitle": MessageLookupByLibrary.simpleMessage("Pantry"),
        "quantityLabel": MessageLookupByLibrary.simpleMessage("Quantity"),
        "reset": MessageLookupByLibrary.simpleMessage("Reset"),
        "settingsTitle": MessageLookupByLibrary.simpleMessage("Settings"),
        "shoppingListAddToPantryDialogActionNo":
            MessageLookupByLibrary.simpleMessage("No"),
        "shoppingListAddToPantryDialogActionYes":
            MessageLookupByLibrary.simpleMessage("Yes"),
        "shoppingListAddToPantryDialogConfirmContent":
            MessageLookupByLibrary.simpleMessage(
                "Did you purchase that item and want to add it to the pantry?"),
        "shoppingListAddToPantryDialogTitle":
            MessageLookupByLibrary.simpleMessage(
                "Shopping List Purchased Item"),
        "shoppingListRemoveDialogActionNo":
            MessageLookupByLibrary.simpleMessage("No"),
        "shoppingListRemoveDialogActionYes":
            MessageLookupByLibrary.simpleMessage("Yes"),
        "shoppingListRemoveDialogConfirmContent":
            MessageLookupByLibrary.simpleMessage(
                "Do you really want to remove this item from your shopping list?"),
        "shoppingListRemoveDialogTitle":
            MessageLookupByLibrary.simpleMessage("Shopping List Item Removal"),
        "shoppingListTitle":
            MessageLookupByLibrary.simpleMessage("Shopping List"),
        "storageName": m1,
        "systemTheme": MessageLookupByLibrary.simpleMessage("System"),
        "theme": MessageLookupByLibrary.simpleMessage("Theme"),
        "update": MessageLookupByLibrary.simpleMessage("Update")
      };
}
