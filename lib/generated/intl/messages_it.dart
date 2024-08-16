// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a it locale. All the
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
  String get localeName => 'it';

  static String m0(version) => "Versione ${version}";

  static String m1(name) => "${Intl.select(name, {
            'All': 'Tutti',
            'Fruits': 'Frutta e Verdura',
            'Fish': 'Pesce',
            'Butcher': 'Macelleria',
            'Dairy': 'Latticini',
            'Fresh': 'Fresco',
            'Bakery': 'Panetteria',
            'Snacks': 'Snack',
            'Drinks': 'Bevande',
            'Frozen': 'Congelati',
            'Grocery': 'Alimentari',
            'Other': 'Altro',
          })}";

  static String m2(name) => "${Intl.select(name, {
            'All': 'Tutti',
            'Fridge': 'Frigorifero',
            'Freezer': 'Congelatore',
            'Cupboard': 'Credenza',
          })}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "add": MessageLookupByLibrary.simpleMessage("Aggiungi"),
        "addPantryItem":
            MessageLookupByLibrary.simpleMessage("Aggiungi alla dispensa"),
        "addShoppingListItem": MessageLookupByLibrary.simpleMessage(
            "Aggiungi alla lista della spesa"),
        "addedToPantry": MessageLookupByLibrary.simpleMessage(
            "Articolo aggiunto alla dispensa!"),
        "addedToShoppingList": MessageLookupByLibrary.simpleMessage(
            "Articolo aggiunto alla lista della spesa!"),
        "appDevelopedBy": MessageLookupByLibrary.simpleMessage(
            "Sviluppato da Benjamin Choron"),
        "appExpirationDateManagementContent": MessageLookupByLibrary.simpleMessage(
            "Questa applicazione offre la visualizzazione dei prodotti che si avvicinano alla loro data di scadenza entro cinque giorni prima della scadenza. Dopo la data di scadenza, rimangono visualizzati in rosso su questa lista fino a quando non vengono rimossi."),
        "appExpirationDateManagementTitle":
            MessageLookupByLibrary.simpleMessage(
                "Gestione delle date di scadenza"),
        "appInformationsButton":
            MessageLookupByLibrary.simpleMessage("Informazioni"),
        "appStorageInformationsContent": MessageLookupByLibrary.simpleMessage(
            "Questa applicazione utilizza la memorizzazione locale per salvare i tuoi dati. Ciò significa che i tuoi dati sono memorizzati sul tuo dispositivo e non sono condivisi con terzi. Attenzione, se elimini l\'app, perderai tutti questi dati."),
        "appStorageInformationsTitle": MessageLookupByLibrary.simpleMessage(
            "Informazioni di memorizzazione"),
        "appVersion": m0,
        "categoryName": m1,
        "darkTheme": MessageLookupByLibrary.simpleMessage("Scuro"),
        "expirationLabel":
            MessageLookupByLibrary.simpleMessage("Data di scadenza"),
        "expirationRange":
            MessageLookupByLibrary.simpleMessage("Entro 5 giorni"),
        "expirationTitle":
            MessageLookupByLibrary.simpleMessage("Date di scadenza"),
        "expired": MessageLookupByLibrary.simpleMessage("Scaduto"),
        "failedToAddItem": MessageLookupByLibrary.simpleMessage(
            "Impossibile aggiungere l\'elemento... Riprova più tardi."),
        "failedToRemoveItem": MessageLookupByLibrary.simpleMessage(
            "Impossibile rimuovere l\'elemento... Riprova più tardi."),
        "failedToUpdateItem": MessageLookupByLibrary.simpleMessage(
            "Impossibile aggiornare l\'elemento... Riprova più tardi."),
        "language": MessageLookupByLibrary.simpleMessage("Lingua"),
        "lightTheme": MessageLookupByLibrary.simpleMessage("Chiaro"),
        "mustBePositive": MessageLookupByLibrary.simpleMessage(
            "Deve essere un numero positivo"),
        "mustHaveCharacters": MessageLookupByLibrary.simpleMessage(
            "Deve contenere tra 1 e 30 caratteri"),
        "nameLabel": MessageLookupByLibrary.simpleMessage("Nome"),
        "noItems": MessageLookupByLibrary.simpleMessage(
            "Nessun elemento aggiunto al momento."),
        "pantryDialogActionNo": MessageLookupByLibrary.simpleMessage("No"),
        "pantryDialogActionYes": MessageLookupByLibrary.simpleMessage("Sì"),
        "pantryDialogConfirmContent": MessageLookupByLibrary.simpleMessage(
            "Vuoi davvero rimuovere questo elemento dalla tua dispensa?"),
        "pantryDialogDismissContent": MessageLookupByLibrary.simpleMessage(
            "Vuoi aggiungere questo elemento alla tua lista della spesa?"),
        "pantryDialogTitle": MessageLookupByLibrary.simpleMessage(
            "Rimozione di un elemento dalla dispensa"),
        "pantryTitle": MessageLookupByLibrary.simpleMessage("Dispensa"),
        "quantityLabel": MessageLookupByLibrary.simpleMessage("Quantità"),
        "recipesTitle": MessageLookupByLibrary.simpleMessage("Ricette"),
        "reset": MessageLookupByLibrary.simpleMessage("Reimposta"),
        "settingsTitle": MessageLookupByLibrary.simpleMessage("Impostazioni"),
        "shoppingListAddToPantryDialogActionNo":
            MessageLookupByLibrary.simpleMessage("No"),
        "shoppingListAddToPantryDialogActionYes":
            MessageLookupByLibrary.simpleMessage("Sì"),
        "shoppingListAddToPantryDialogConfirmContent":
            MessageLookupByLibrary.simpleMessage(
                "Hai acquistato questo articolo e desideri aggiungerlo alla dispensa?"),
        "shoppingListAddToPantryDialogTitle":
            MessageLookupByLibrary.simpleMessage(
                "Articolo acquistato dalla lista della spesa"),
        "shoppingListTitle":
            MessageLookupByLibrary.simpleMessage("Lista della spesa"),
        "storageName": m2,
        "systemTheme": MessageLookupByLibrary.simpleMessage("Sistema"),
        "theme": MessageLookupByLibrary.simpleMessage("Tema"),
        "update": MessageLookupByLibrary.simpleMessage("Aggiorna")
      };
}
