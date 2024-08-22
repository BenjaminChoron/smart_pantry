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

  static String m0(version) => "Version ${version}";

  static String m1(name) => "${Intl.select(name, {
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

  static String m2(name) => "${Intl.select(name, {
            'Low': 'Low',
            'Medium': 'Medium',
            'High': 'High',
          })}";

  static String m3(name) => "${Intl.select(name, {
            'Easy': 'Easy',
            'Medium': 'Medium',
            'Hard': 'Hard',
          })}";

  static String m4(name) => "${Intl.select(name, {
            'Breakfast': 'Breakfast',
            'MainCourse': 'Main Course',
            'Starter': 'Stater',
            'Snack': 'Snack',
            'Dessert': 'Dessert',
            'Drink': 'Drink',
          })}";

  static String m5(name) => "${Intl.select(name, {
            'All': 'All',
            'Fridge': 'Fridge',
            'Freezer': 'Freezer',
            'Cupboard': 'Cupboard',
          })}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "add": MessageLookupByLibrary.simpleMessage("Add"),
        "addNewRecipe": MessageLookupByLibrary.simpleMessage("Add New Recipe"),
        "addPantryItem":
            MessageLookupByLibrary.simpleMessage("Add Pantry Item"),
        "addShoppingListItem":
            MessageLookupByLibrary.simpleMessage("Add Shopping List Item"),
        "addedToPantry":
            MessageLookupByLibrary.simpleMessage("Item added to pantry!"),
        "addedToShoppingList": MessageLookupByLibrary.simpleMessage(
            "Item added to shopping list!"),
        "appDevelopedBy": MessageLookupByLibrary.simpleMessage(
            "Developed by Benjamin Choron"),
        "appExpirationDateManagementContent": MessageLookupByLibrary.simpleMessage(
            "This application offers the display of products approaching their expiration date within five days before they expire. After the expiration date, they remain displayed in red on this list until they are removed."),
        "appExpirationDateManagementTitle":
            MessageLookupByLibrary.simpleMessage("Expiration date management"),
        "appInformationsButton":
            MessageLookupByLibrary.simpleMessage("Informations"),
        "appStorageInformationsContent": MessageLookupByLibrary.simpleMessage(
            "This application uses local storage to save your data. This means that your data is stored on your device and is not shared with any third party. Warning, if you delete the app, you will lose all this data."),
        "appStorageInformationsTitle": MessageLookupByLibrary.simpleMessage(
            "Information related to storage"),
        "appVersion": m0,
        "applyFilters": MessageLookupByLibrary.simpleMessage("Apply filters"),
        "categoryName": m1,
        "clearFilters": MessageLookupByLibrary.simpleMessage("Clear filters"),
        "darkTheme": MessageLookupByLibrary.simpleMessage("Dark"),
        "expirationLabel":
            MessageLookupByLibrary.simpleMessage("Expiration Date"),
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
        "filterBy": MessageLookupByLibrary.simpleMessage("Filter by"),
        "hours": MessageLookupByLibrary.simpleMessage("hours"),
        "language": MessageLookupByLibrary.simpleMessage("Language"),
        "lightTheme": MessageLookupByLibrary.simpleMessage("Light"),
        "minutes": MessageLookupByLibrary.simpleMessage("minutes"),
        "mustBePositive":
            MessageLookupByLibrary.simpleMessage("Must be a positive number"),
        "mustHaveCharacters": MessageLookupByLibrary.simpleMessage(
            "Must be between 1 and 30 characters"),
        "nameLabel": MessageLookupByLibrary.simpleMessage("Name"),
        "newIngredientLabel":
            MessageLookupByLibrary.simpleMessage("New Ingredient"),
        "noItems": MessageLookupByLibrary.simpleMessage("No items added yet."),
        "pantryDialogActionNo": MessageLookupByLibrary.simpleMessage("No"),
        "pantryDialogActionYes": MessageLookupByLibrary.simpleMessage("Yes"),
        "pantryDialogConfirmContent": MessageLookupByLibrary.simpleMessage(
            "Do you really want to remove this item from your pantry?"),
        "pantryDialogDismissContent": MessageLookupByLibrary.simpleMessage(
            "Do you want to add this item to your shopping list?"),
        "pantryDialogDismissTitle":
            MessageLookupByLibrary.simpleMessage("Add to shopping list"),
        "pantryDialogTitle":
            MessageLookupByLibrary.simpleMessage("Pantry Item Removal"),
        "pantryTitle": MessageLookupByLibrary.simpleMessage("Pantry"),
        "quantityLabel": MessageLookupByLibrary.simpleMessage("Quantity"),
        "recipeCost": MessageLookupByLibrary.simpleMessage("Cost"),
        "recipeCostLabel": MessageLookupByLibrary.simpleMessage("Cost"),
        "recipeCostName": m2,
        "recipeDescription":
            MessageLookupByLibrary.simpleMessage("Description"),
        "recipeDifficulty": MessageLookupByLibrary.simpleMessage("Difficulty"),
        "recipeDifficultyLabel":
            MessageLookupByLibrary.simpleMessage("Difficulty"),
        "recipeDifficultyName": m3,
        "recipeIngredients":
            MessageLookupByLibrary.simpleMessage("Ingredients"),
        "recipeRemoveDialogActionNo":
            MessageLookupByLibrary.simpleMessage("No"),
        "recipeRemoveDialogActionYes":
            MessageLookupByLibrary.simpleMessage("Yes"),
        "recipeRemoveDialogConfirmContent":
            MessageLookupByLibrary.simpleMessage(
                "Do you really want to remove this recipe?"),
        "recipeRemoveDialogTitle":
            MessageLookupByLibrary.simpleMessage("Remove recipe"),
        "recipeSteps": MessageLookupByLibrary.simpleMessage("Steps"),
        "recipeTimeLabel": MessageLookupByLibrary.simpleMessage("Time"),
        "recipeTypeLabel": MessageLookupByLibrary.simpleMessage("Type"),
        "recipeTypeName": m4,
        "recipesTitle": MessageLookupByLibrary.simpleMessage("Recipes"),
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
        "stepsLabel": MessageLookupByLibrary.simpleMessage("Steps"),
        "storageName": m5,
        "store": MessageLookupByLibrary.simpleMessage("Store"),
        "systemTheme": MessageLookupByLibrary.simpleMessage("System"),
        "theme": MessageLookupByLibrary.simpleMessage("Theme"),
        "update": MessageLookupByLibrary.simpleMessage("Update"),
        "whereToStore": MessageLookupByLibrary.simpleMessage(
            "Where do you want to store this item?")
      };
}
