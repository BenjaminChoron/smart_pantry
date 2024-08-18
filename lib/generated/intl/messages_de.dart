// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a de locale. All the
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
  String get localeName => 'de';

  static String m0(version) => "Version ${version}";

  static String m1(name) => "${Intl.select(name, {
            'All': 'Alle',
            'Fruits': 'Obst & Gemüse',
            'Fish': 'Fisch',
            'Butcher': 'Metzgerei',
            'Dairy': 'Milchprodukte',
            'Fresh': 'Frisch',
            'Bakery': 'Bäckerei',
            'Snacks': 'Snacks',
            'Drinks': 'Getränke',
            'Frozen': 'Tiefkühl',
            'Grocery': 'Lebensmittel',
            'Other': 'Sonstiges',
          })}";

  static String m2(name) => "${Intl.select(name, {
            'Low': 'Niedrig',
            'Medium': 'Mittel',
            'High': 'Hoch',
          })}";

  static String m3(name) => "${Intl.select(name, {
            'Easy': 'Einfach',
            'Medium': 'Mittel',
            'Hard': 'Schwer',
          })}";

  static String m4(name) => "${Intl.select(name, {
            'Breakfast': 'Frühstück',
            'Lunch': 'Mittagessen',
            'Dinner': 'Abendessen',
            'Snack': 'Snack',
            'Dessert': 'Dessert',
          })}";

  static String m5(name) => "${Intl.select(name, {
            'All': 'Alle',
            'Fridge': 'Kühlschrank',
            'Freezer': 'Gefrierschrank',
            'Cupboard': 'Schrank',
          })}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "add": MessageLookupByLibrary.simpleMessage("Hinzufügen"),
        "addNewRecipe":
            MessageLookupByLibrary.simpleMessage("Neues Rezept hinzufügen"),
        "addPantryItem":
            MessageLookupByLibrary.simpleMessage("Zum Vorrat hinzufügen"),
        "addShoppingListItem": MessageLookupByLibrary.simpleMessage(
            "Zur Einkaufsliste hinzufügen"),
        "addedToPantry": MessageLookupByLibrary.simpleMessage(
            "Artikel zum Vorrat hinzugefügt!"),
        "addedToShoppingList": MessageLookupByLibrary.simpleMessage(
            "Artikel zur Einkaufsliste hinzugefügt!"),
        "appDevelopedBy": MessageLookupByLibrary.simpleMessage(
            "Entwickelt von Benjamin Choron"),
        "appExpirationDateManagementContent": MessageLookupByLibrary.simpleMessage(
            "Diese Anwendung bietet die Anzeige von Produkten, die sich ihrem Ablaufdatum nähern, innerhalb von fünf Tagen vor ihrem Ablauf. Nach dem Ablaufdatum bleiben sie rot auf dieser Liste angezeigt, bis sie entfernt werden."),
        "appExpirationDateManagementTitle":
            MessageLookupByLibrary.simpleMessage("Ablaufdatumverwaltung"),
        "appInformationsButton":
            MessageLookupByLibrary.simpleMessage("Informationen"),
        "appStorageInformationsContent": MessageLookupByLibrary.simpleMessage(
            "Diese Anwendung verwendet den lokalen Speicher, um Ihre Daten zu speichern. Das bedeutet, dass Ihre Daten auf Ihrem Gerät gespeichert sind und nicht mit Dritten geteilt werden. Achtung, wenn Sie die App löschen, verlieren Sie alle diese Daten."),
        "appStorageInformationsTitle":
            MessageLookupByLibrary.simpleMessage("Informationen zum Speicher"),
        "appVersion": m0,
        "categoryName": m1,
        "darkTheme": MessageLookupByLibrary.simpleMessage("Dunkel"),
        "expirationLabel": MessageLookupByLibrary.simpleMessage("Ablaufdatum"),
        "expirationRange":
            MessageLookupByLibrary.simpleMessage("Innerhalb von 5 Tagen"),
        "expirationTitle": MessageLookupByLibrary.simpleMessage("Ablaufdaten"),
        "expired": MessageLookupByLibrary.simpleMessage("Abgelaufen"),
        "failedToAddItem": MessageLookupByLibrary.simpleMessage(
            "Artikel konnte nicht hinzugefügt werden... Bitte versuchen Sie es später noch einmal."),
        "failedToRemoveItem": MessageLookupByLibrary.simpleMessage(
            "Artikel konnte nicht entfernt werden... Bitte versuchen Sie es später noch einmal."),
        "failedToUpdateItem": MessageLookupByLibrary.simpleMessage(
            "Artikel konnte nicht aktualisiert werden... Bitte versuchen Sie es später noch einmal."),
        "hours": MessageLookupByLibrary.simpleMessage("Stunden"),
        "language": MessageLookupByLibrary.simpleMessage("Sprache"),
        "lightTheme": MessageLookupByLibrary.simpleMessage("Hell"),
        "minutes": MessageLookupByLibrary.simpleMessage("Minuten"),
        "mustBePositive": MessageLookupByLibrary.simpleMessage(
            "Muss eine positive Zahl sein"),
        "mustHaveCharacters": MessageLookupByLibrary.simpleMessage(
            "Muss zwischen 1 und 30 Zeichen enthalten"),
        "nameLabel": MessageLookupByLibrary.simpleMessage("Name"),
        "noItems": MessageLookupByLibrary.simpleMessage(
            "Derzeit keine Artikel hinzugefügt."),
        "pantryDialogActionNo": MessageLookupByLibrary.simpleMessage("Nein"),
        "pantryDialogActionYes": MessageLookupByLibrary.simpleMessage("Ja"),
        "pantryDialogConfirmContent": MessageLookupByLibrary.simpleMessage(
            "Möchten Sie diesen Artikel wirklich aus Ihrem Vorrat entfernen?"),
        "pantryDialogDismissContent": MessageLookupByLibrary.simpleMessage(
            "Möchten Sie diesen Artikel zu Ihrer Einkaufsliste hinzufügen?"),
        "pantryDialogTitle": MessageLookupByLibrary.simpleMessage(
            "Entfernen eines Artikels aus dem Vorrat"),
        "pantryTitle": MessageLookupByLibrary.simpleMessage("Vorrat"),
        "quantityLabel": MessageLookupByLibrary.simpleMessage("Menge"),
        "recipeCost": MessageLookupByLibrary.simpleMessage("Kosten"),
        "recipeCostLabel": MessageLookupByLibrary.simpleMessage("Kosten"),
        "recipeCostName": m2,
        "recipeDescription":
            MessageLookupByLibrary.simpleMessage("Beschreibung"),
        "recipeDifficulty":
            MessageLookupByLibrary.simpleMessage("Schwierigkeit"),
        "recipeDifficultyLabel":
            MessageLookupByLibrary.simpleMessage("Schwierigkeit"),
        "recipeDifficultyName": m3,
        "recipeIngredients": MessageLookupByLibrary.simpleMessage("Zutaten"),
        "recipeSteps": MessageLookupByLibrary.simpleMessage("Schritte"),
        "recipeTimeLabel": MessageLookupByLibrary.simpleMessage("Zeit"),
        "recipeTypeLabel": MessageLookupByLibrary.simpleMessage("Typ"),
        "recipeTypeName": m4,
        "recipesTitle": MessageLookupByLibrary.simpleMessage("Rezepte"),
        "reset": MessageLookupByLibrary.simpleMessage("Zurücksetzen"),
        "settingsTitle": MessageLookupByLibrary.simpleMessage("Einstellungen"),
        "shoppingListAddToPantryDialogActionNo":
            MessageLookupByLibrary.simpleMessage("Nein"),
        "shoppingListAddToPantryDialogActionYes":
            MessageLookupByLibrary.simpleMessage("Ja"),
        "shoppingListAddToPantryDialogConfirmContent":
            MessageLookupByLibrary.simpleMessage(
                "Haben Sie diesen Artikel gekauft und möchten ihn zum Vorrat hinzufügen?"),
        "shoppingListAddToPantryDialogTitle":
            MessageLookupByLibrary.simpleMessage(
                "Gekaufter Artikel der Einkaufsliste"),
        "shoppingListRemoveDialogActionNo":
            MessageLookupByLibrary.simpleMessage("Nein"),
        "shoppingListRemoveDialogActionYes":
            MessageLookupByLibrary.simpleMessage("Ja"),
        "shoppingListRemoveDialogConfirmContent":
            MessageLookupByLibrary.simpleMessage(
                "Möchten Sie diesen Artikel wirklich von Ihrer Einkaufsliste entfernen?"),
        "shoppingListRemoveDialogTitle": MessageLookupByLibrary.simpleMessage(
            "Entfernen eines Artikels von der Einkaufsliste"),
        "shoppingListTitle":
            MessageLookupByLibrary.simpleMessage("Einkaufsliste"),
        "storageName": m5,
        "store": MessageLookupByLibrary.simpleMessage("Laden"),
        "systemTheme": MessageLookupByLibrary.simpleMessage("System"),
        "theme": MessageLookupByLibrary.simpleMessage("Thema"),
        "update": MessageLookupByLibrary.simpleMessage("Aktualisieren"),
        "whereToStore": MessageLookupByLibrary.simpleMessage(
            "Wo möchten Sie diesen Artikel aufbewahren?")
      };
}
