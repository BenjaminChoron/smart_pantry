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

  static String m0(name) => "${Intl.select(name, {
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

  static String m1(name) => "${Intl.select(name, {
            'All': 'Alle',
            'Fridge': 'Kühlschrank',
            'Freezer': 'Gefrierschrank',
            'Cupboard': 'Schrank',
          })}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "add": MessageLookupByLibrary.simpleMessage("Hinzufügen"),
        "addPantryItem":
            MessageLookupByLibrary.simpleMessage("Zum Vorrat hinzufügen"),
        "addShoppingListItem": MessageLookupByLibrary.simpleMessage(
            "Zur Einkaufsliste hinzufügen"),
        "addedToPantry": MessageLookupByLibrary.simpleMessage(
            "Artikel zum Vorrat hinzugefügt!"),
        "addedToShoppingList": MessageLookupByLibrary.simpleMessage(
            "Artikel zur Einkaufsliste hinzugefügt!"),
        "categoryName": m0,
        "darkTheme": MessageLookupByLibrary.simpleMessage("Dunkel"),
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
        "language": MessageLookupByLibrary.simpleMessage("Sprache"),
        "lightTheme": MessageLookupByLibrary.simpleMessage("Hell"),
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
        "storageName": m1,
        "systemTheme": MessageLookupByLibrary.simpleMessage("System"),
        "theme": MessageLookupByLibrary.simpleMessage("Thema"),
        "update": MessageLookupByLibrary.simpleMessage("Aktualisieren")
      };
}
