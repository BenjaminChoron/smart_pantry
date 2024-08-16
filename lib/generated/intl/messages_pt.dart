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

  static String m0(version) => "Versão ${version}";

  static String m1(name) => "${Intl.select(name, {
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

  static String m2(name) => "${Intl.select(name, {
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
        "addedToPantry":
            MessageLookupByLibrary.simpleMessage("Item adicionado à despensa!"),
        "addedToShoppingList": MessageLookupByLibrary.simpleMessage(
            "Item adicionado à lista de compras!"),
        "appDevelopedBy": MessageLookupByLibrary.simpleMessage(
            "Desenvolvido por Benjamin Choron"),
        "appExpirationDateManagementContent": MessageLookupByLibrary.simpleMessage(
            "Este aplicativo oferece a exibição de produtos que se aproximam da data de validade dentro de cinco dias antes de expirarem. Após a data de validade, eles permanecem exibidos em vermelho nesta lista até serem removidos."),
        "appExpirationDateManagementTitle":
            MessageLookupByLibrary.simpleMessage(
                "Gerenciamento de datas de validade"),
        "appInformationsButton":
            MessageLookupByLibrary.simpleMessage("Informações"),
        "appStorageInformationsContent": MessageLookupByLibrary.simpleMessage(
            "Este aplicativo usa armazenamento local para salvar seus dados. Isso significa que seus dados são armazenados em seu dispositivo e não são compartilhados com terceiros. Aviso, se você excluir o aplicativo, perderá todos esses dados."),
        "appStorageInformationsTitle": MessageLookupByLibrary.simpleMessage(
            "Informações de armazenamento"),
        "appVersion": m0,
        "categoryName": m1,
        "darkTheme": MessageLookupByLibrary.simpleMessage("Escuro"),
        "expirationLabel":
            MessageLookupByLibrary.simpleMessage("Data de validade"),
        "expirationRange": MessageLookupByLibrary.simpleMessage("Em 5 dias"),
        "expirationTitle":
            MessageLookupByLibrary.simpleMessage("Datas de validade"),
        "expired": MessageLookupByLibrary.simpleMessage("Expirado"),
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
        "recipesTitle": MessageLookupByLibrary.simpleMessage("Receitas"),
        "reset": MessageLookupByLibrary.simpleMessage("Redefinir"),
        "settingsTitle": MessageLookupByLibrary.simpleMessage("Configurações"),
        "shoppingListAddToPantryDialogActionNo":
            MessageLookupByLibrary.simpleMessage("Não"),
        "shoppingListAddToPantryDialogActionYes":
            MessageLookupByLibrary.simpleMessage("Sim"),
        "shoppingListAddToPantryDialogConfirmContent":
            MessageLookupByLibrary.simpleMessage(
                "Você comprou este item e deseja adicioná-lo à despensa?"),
        "shoppingListAddToPantryDialogTitle":
            MessageLookupByLibrary.simpleMessage(
                "Item comprado da lista de compras"),
        "shoppingListTitle":
            MessageLookupByLibrary.simpleMessage("Lista de compras"),
        "storageName": m2,
        "systemTheme": MessageLookupByLibrary.simpleMessage("Sistema"),
        "theme": MessageLookupByLibrary.simpleMessage("Tema"),
        "update": MessageLookupByLibrary.simpleMessage("Atualizar")
      };
}
