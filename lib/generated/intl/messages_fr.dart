// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a fr locale. All the
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
  String get localeName => 'fr';

  static String m0(name) => "${Intl.select(name, {
            'All': 'Tous',
            'Fruits': 'Fruits',
            'Vegetables': 'Légumes',
            'Meat': 'Viande',
            'Seafood': 'Fruits de mer',
            'Dairy': 'Produits laitiers',
            'Bakery': 'Boulangerie',
            'Snacks': 'Collations',
            'Drinks': 'Boissons',
            'Frozen': 'Surgelés',
            'Other': 'Autre',
          })}";

  static String m1(name) => "${Intl.select(name, {
            'All': 'Tous',
            'Fridge': 'Réfrigérateur',
            'Freezer': 'Congélateur',
            'Cupboard': 'Placard',
          })}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "add": MessageLookupByLibrary.simpleMessage("Ajouter"),
        "addPantryItem":
            MessageLookupByLibrary.simpleMessage("Ajouter au garde-manger"),
        "addShoppingListItem": MessageLookupByLibrary.simpleMessage(
            "Ajouter à la liste de courses"),
        "categoryName": m0,
        "darkTheme": MessageLookupByLibrary.simpleMessage("Sombre"),
        "failedToAddItem": MessageLookupByLibrary.simpleMessage(
            "Impossible d\'ajouter l\'élément... Veuillez réessayer plus tard."),
        "failedToRemoveItem": MessageLookupByLibrary.simpleMessage(
            "Impossible de supprimer l\'élément... Veuillez réessayer plus tard."),
        "failedToUpdateItem": MessageLookupByLibrary.simpleMessage(
            "Impossible de mettre à jour l\'élément... Veuillez réessayer plus tard."),
        "language": MessageLookupByLibrary.simpleMessage("Langue"),
        "lightTheme": MessageLookupByLibrary.simpleMessage("Clair"),
        "mustBePositive":
            MessageLookupByLibrary.simpleMessage("Doit être un nombre positif"),
        "mustHaveCharacters": MessageLookupByLibrary.simpleMessage(
            "Doit contenir entre 1 et 30 caractères"),
        "nameLabel": MessageLookupByLibrary.simpleMessage("Nom"),
        "noItems": MessageLookupByLibrary.simpleMessage(
            "Aucun élément ajouté pour le moment."),
        "pantryDialogActionNo": MessageLookupByLibrary.simpleMessage("Non"),
        "pantryDialogActionYes": MessageLookupByLibrary.simpleMessage("Oui"),
        "pantryDialogConfirmContent": MessageLookupByLibrary.simpleMessage(
            "Voulez-vous vraiment supprimer cet élément de votre garde-manger ?"),
        "pantryDialogDismissContent": MessageLookupByLibrary.simpleMessage(
            "Voulez-vous ajouter cet élément à votre liste de courses ?"),
        "pantryDialogTitle": MessageLookupByLibrary.simpleMessage(
            "Suppression d\'un élément du garde-manger"),
        "pantryTitle": MessageLookupByLibrary.simpleMessage("Garde-manger"),
        "quantityLabel": MessageLookupByLibrary.simpleMessage("Quantité"),
        "reset": MessageLookupByLibrary.simpleMessage("Réinitialiser"),
        "settingsTitle": MessageLookupByLibrary.simpleMessage("Paramètres"),
        "shoppingListDialogActionNo":
            MessageLookupByLibrary.simpleMessage("Non"),
        "shoppingListDialogActionYes":
            MessageLookupByLibrary.simpleMessage("Oui"),
        "shoppingListDialogConfirmContent": MessageLookupByLibrary.simpleMessage(
            "Voulez-vous vraiment supprimer cet élément de votre liste de courses ?"),
        "shoppingListDialogTitle": MessageLookupByLibrary.simpleMessage(
            "Suppression d\'un élément de la liste de courses"),
        "shoppingListTitle":
            MessageLookupByLibrary.simpleMessage("Liste de courses"),
        "storageName": m1,
        "systemTheme": MessageLookupByLibrary.simpleMessage("Système"),
        "theme": MessageLookupByLibrary.simpleMessage("Thème"),
        "update": MessageLookupByLibrary.simpleMessage("Mettre à jour")
      };
}
