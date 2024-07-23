// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pt locale. All the
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
  String get localeName => 'pt';

  static String m0(name) => "${Intl.select(name, {
            'All': 'Todos',
            'Fruits': 'Frutas & Legumes',
            'Fish': 'Peixaria',
            'Butcher': 'Açougue',
            'Dairy': 'Laticínios',
            'Fresh': 'Frescos',
            'Bakery': 'Padaria',
            'Snacks': 'Lanches',
            'Drinks': 'Bebidas',
            'Frozen': 'Congelados',
            'Grocery': 'Mercearia',
            'Other': 'Outros',
          })}";

  static String m1(name) => "${Intl.select(name, {
            'All': 'Todos',
            'Fridge': 'Geladeira',
            'Freezer': 'Freezer',
            'Cupboard': 'Armário',
          })}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "add": MessageLookupByLibrary.simpleMessage("Adicionar"),
        "addPantryItem":
            MessageLookupByLibrary.simpleMessage("Adicionar à despensa"),
        "addShoppingListItem": MessageLookupByLibrary.simpleMessage(
            "Adicionar à lista de compras"),
        "categoryName": m0,
        "darkTheme": MessageLookupByLibrary.simpleMessage("Escuro"),
        "failedToAddItem": MessageLookupByLibrary.simpleMessage(
            "Falha ao adicionar item... Por favor, tente novamente mais tarde."),
        "failedToRemoveItem": MessageLookupByLibrary.simpleMessage(
            "Falha ao remover item... Por favor, tente novamente mais tarde."),
        "failedToUpdateItem": MessageLookupByLibrary.simpleMessage(
            "Falha ao atualizar item... Por favor, tente novamente mais tarde."),
        "language": MessageLookupByLibrary.simpleMessage("Idioma"),
        "lightTheme": MessageLookupByLibrary.simpleMessage("Claro"),
        "mustBePositive":
            MessageLookupByLibrary.simpleMessage("Deve ser um número positivo"),
        "mustHaveCharacters": MessageLookupByLibrary.simpleMessage(
            "Deve ter entre 1 e 30 caracteres"),
        "nameLabel": MessageLookupByLibrary.simpleMessage("Nome"),
        "noItems": MessageLookupByLibrary.simpleMessage(
            "Nenhum item adicionado no momento."),
        "pantryDialogActionNo": MessageLookupByLibrary.simpleMessage("Não"),
        "pantryDialogActionYes": MessageLookupByLibrary.simpleMessage("Sim"),
        "pantryDialogConfirmContent": MessageLookupByLibrary.simpleMessage(
            "Você realmente deseja remover este item da sua despensa?"),
        "pantryDialogDismissContent": MessageLookupByLibrary.simpleMessage(
            "Deseja adicionar este item à sua lista de compras?"),
        "pantryDialogTitle":
            MessageLookupByLibrary.simpleMessage("Remoção de item da despensa"),
        "pantryTitle": MessageLookupByLibrary.simpleMessage("Despensa"),
        "quantityLabel": MessageLookupByLibrary.simpleMessage("Quantidade"),
        "reset": MessageLookupByLibrary.simpleMessage("Redefinir"),
        "settingsTitle": MessageLookupByLibrary.simpleMessage("Configurações"),
        "shoppingListDialogActionNo":
            MessageLookupByLibrary.simpleMessage("Não"),
        "shoppingListDialogActionYes":
            MessageLookupByLibrary.simpleMessage("Sim"),
        "shoppingListDialogConfirmContent": MessageLookupByLibrary.simpleMessage(
            "Você realmente deseja remover este item da sua lista de compras?"),
        "shoppingListDialogTitle": MessageLookupByLibrary.simpleMessage(
            "Remoção de item da lista de compras"),
        "shoppingListTitle":
            MessageLookupByLibrary.simpleMessage("Lista de compras"),
        "storageName": m1,
        "systemTheme": MessageLookupByLibrary.simpleMessage("Sistema"),
        "theme": MessageLookupByLibrary.simpleMessage("Tema"),
        "update": MessageLookupByLibrary.simpleMessage("Atualizar")
      };
}
