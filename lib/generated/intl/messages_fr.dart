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

  static String m0(version) => "Version ${version}";

  static String m1(name) => "${Intl.select(name, {
            'All': 'Tout',
            'Fruits': 'Fruits & Légumes',
            'Fish': 'Poissonnerie',
            'Butcher': 'Boucherie',
            'Dairy': 'Produits Laitiers',
            'Fresh': 'Frais',
            'Bakery': 'Boulangerie',
            'Snacks': 'Snacks',
            'Drinks': 'Boissons',
            'Frozen': 'Surgelés',
            'Grocery': 'Épicerie',
            'Other': 'Autre',
          })}";

  static String m2(name) => "${Intl.select(name, {
            'Low': 'Faible',
            'Medium': 'Moyen',
            'High': 'Élevé',
          })}";

  static String m3(name) => "${Intl.select(name, {
            'Easy': 'Facile',
            'Medium': 'Moyen',
            'Hard': 'Difficile',
          })}";

  static String m4(name) => "${Intl.select(name, {
            'Breakfast': 'Petit-déjeuner',
            'Lunch': 'Déjeuner',
            'Dinner': 'Dîner',
            'Snack': 'Collation',
            'Dessert': 'Dessert',
          })}";

  static String m5(name) => "${Intl.select(name, {
            'All': 'Tous',
            'Fridge': 'Réfrigérateur',
            'Freezer': 'Congélateur',
            'Cupboard': 'Placard',
          })}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "add": MessageLookupByLibrary.simpleMessage("Ajouter"),
        "addNewRecipe": MessageLookupByLibrary.simpleMessage(
            "Ajouter une nouvelle recette"),
        "addPantryItem":
            MessageLookupByLibrary.simpleMessage("Ajouter au garde-manger"),
        "addShoppingListItem": MessageLookupByLibrary.simpleMessage(
            "Ajouter à la liste de courses"),
        "addedToPantry": MessageLookupByLibrary.simpleMessage(
            "Article ajouté au garde-manger !"),
        "addedToShoppingList": MessageLookupByLibrary.simpleMessage(
            "Article ajouté à la liste de courses !"),
        "appDevelopedBy": MessageLookupByLibrary.simpleMessage(
            "Développé par Benjamin Choron"),
        "appExpirationDateManagementContent": MessageLookupByLibrary.simpleMessage(
            "Cette application offre l\'affichage des produits approchant de leur date d\'expiration dans les cinq jours précédant leur expiration. Après la date d\'expiration, ils restent affichés en rouge sur cette liste jusqu\'à ce qu\'ils soient supprimés."),
        "appExpirationDateManagementTitle":
            MessageLookupByLibrary.simpleMessage(
                "Gestion des dates d\'expiration"),
        "appInformationsButton":
            MessageLookupByLibrary.simpleMessage("Informations"),
        "appStorageInformationsContent": MessageLookupByLibrary.simpleMessage(
            "Cette application utilise le stockage local pour enregistrer vos données. Cela signifie que vos données sont stockées sur votre appareil et ne sont pas partagées avec des tiers. Attention, si vous supprimez l\'application, vous perdrez toutes ces données."),
        "appStorageInformationsTitle":
            MessageLookupByLibrary.simpleMessage("Informations de stockage"),
        "appVersion": m0,
        "categoryName": m1,
        "darkTheme": MessageLookupByLibrary.simpleMessage("Sombre"),
        "expirationLabel":
            MessageLookupByLibrary.simpleMessage("Date d\'expiration"),
        "expirationRange":
            MessageLookupByLibrary.simpleMessage("Dans les 5 jours"),
        "expirationTitle":
            MessageLookupByLibrary.simpleMessage("Dates d\'expiration"),
        "expired": MessageLookupByLibrary.simpleMessage("Expiré"),
        "failedToAddItem": MessageLookupByLibrary.simpleMessage(
            "Impossible d\'ajouter l\'élément... Veuillez réessayer plus tard."),
        "failedToRemoveItem": MessageLookupByLibrary.simpleMessage(
            "Impossible de supprimer l\'élément... Veuillez réessayer plus tard."),
        "failedToUpdateItem": MessageLookupByLibrary.simpleMessage(
            "Impossible de mettre à jour l\'élément... Veuillez réessayer plus tard."),
        "hours": MessageLookupByLibrary.simpleMessage("Heures"),
        "language": MessageLookupByLibrary.simpleMessage("Langue"),
        "lightTheme": MessageLookupByLibrary.simpleMessage("Clair"),
        "minutes": MessageLookupByLibrary.simpleMessage("Minutes"),
        "mustBePositive":
            MessageLookupByLibrary.simpleMessage("Doit être un nombre positif"),
        "mustHaveCharacters": MessageLookupByLibrary.simpleMessage(
            "Doit contenir entre 1 et 30 caractères"),
        "nameLabel": MessageLookupByLibrary.simpleMessage("Nom"),
        "newIngredientLabel":
            MessageLookupByLibrary.simpleMessage("Nouvel ingrédient"),
        "noItems": MessageLookupByLibrary.simpleMessage(
            "Aucun élément ajouté pour le moment."),
        "pantryDialogActionNo": MessageLookupByLibrary.simpleMessage("Non"),
        "pantryDialogActionYes": MessageLookupByLibrary.simpleMessage("Oui"),
        "pantryDialogConfirmContent": MessageLookupByLibrary.simpleMessage(
            "Voulez-vous vraiment supprimer cet élément de votre garde-manger ?"),
        "pantryDialogDismissContent": MessageLookupByLibrary.simpleMessage(
            "Voulez-vous ajouter cet élément à votre liste de courses ?"),
        "pantryDialogDismissTitle": MessageLookupByLibrary.simpleMessage(
            "Ajouter à la liste de courses"),
        "pantryDialogTitle": MessageLookupByLibrary.simpleMessage(
            "Suppression d\'un élément du garde-manger"),
        "pantryTitle": MessageLookupByLibrary.simpleMessage("Garde-manger"),
        "quantityLabel": MessageLookupByLibrary.simpleMessage("Quantité"),
        "recipeCost": MessageLookupByLibrary.simpleMessage("Coût"),
        "recipeCostLabel": MessageLookupByLibrary.simpleMessage("Coût"),
        "recipeCostName": m2,
        "recipeDescription":
            MessageLookupByLibrary.simpleMessage("Description"),
        "recipeDifficulty": MessageLookupByLibrary.simpleMessage("Difficulté"),
        "recipeDifficultyLabel":
            MessageLookupByLibrary.simpleMessage("Difficulté"),
        "recipeDifficultyName": m3,
        "recipeIngredients":
            MessageLookupByLibrary.simpleMessage("Ingrédients"),
        "recipeRemoveDialogActionNo":
            MessageLookupByLibrary.simpleMessage("Non"),
        "recipeRemoveDialogActionYes":
            MessageLookupByLibrary.simpleMessage("Oui"),
        "recipeRemoveDialogConfirmContent":
            MessageLookupByLibrary.simpleMessage(
                "Voulez-vous vraiment supprimer cette recette ?"),
        "recipeRemoveDialogTitle":
            MessageLookupByLibrary.simpleMessage("Supprimer la recette"),
        "recipeSteps": MessageLookupByLibrary.simpleMessage("Étapes"),
        "recipeTimeLabel": MessageLookupByLibrary.simpleMessage("Temps"),
        "recipeTypeLabel": MessageLookupByLibrary.simpleMessage("Type"),
        "recipeTypeName": m4,
        "recipesTitle": MessageLookupByLibrary.simpleMessage("Recettes"),
        "reset": MessageLookupByLibrary.simpleMessage("Réinitialiser"),
        "settingsTitle": MessageLookupByLibrary.simpleMessage("Paramètres"),
        "shoppingListAddToPantryDialogActionNo":
            MessageLookupByLibrary.simpleMessage("Non"),
        "shoppingListAddToPantryDialogActionYes":
            MessageLookupByLibrary.simpleMessage("Oui"),
        "shoppingListAddToPantryDialogConfirmContent":
            MessageLookupByLibrary.simpleMessage(
                "Avez-vous acheté cet article et souhaitez-vous l\'ajouter au garde-manger ?"),
        "shoppingListAddToPantryDialogTitle":
            MessageLookupByLibrary.simpleMessage(
                "Article acheté de la liste de courses"),
        "shoppingListRemoveDialogActionNo":
            MessageLookupByLibrary.simpleMessage("Non"),
        "shoppingListRemoveDialogActionYes":
            MessageLookupByLibrary.simpleMessage("Oui"),
        "shoppingListRemoveDialogConfirmContent":
            MessageLookupByLibrary.simpleMessage(
                "Voulez-vous vraiment supprimer cet élément de votre liste de courses ?"),
        "shoppingListRemoveDialogTitle": MessageLookupByLibrary.simpleMessage(
            "Suppression d\'un élément de la liste de courses"),
        "shoppingListTitle":
            MessageLookupByLibrary.simpleMessage("Liste de courses"),
        "stepsLabel": MessageLookupByLibrary.simpleMessage("Étapes"),
        "storageName": m5,
        "store": MessageLookupByLibrary.simpleMessage("Stocker"),
        "systemTheme": MessageLookupByLibrary.simpleMessage("Système"),
        "theme": MessageLookupByLibrary.simpleMessage("Thème"),
        "update": MessageLookupByLibrary.simpleMessage("Mettre à jour"),
        "whereToStore": MessageLookupByLibrary.simpleMessage(
            "Où voulez-vous stocker cet article ?")
      };
}
