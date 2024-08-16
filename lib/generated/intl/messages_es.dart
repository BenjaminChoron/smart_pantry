// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a es locale. All the
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
  String get localeName => 'es';

  static String m0(version) => "Versión ${version}";

  static String m1(name) => "${Intl.select(name, {
            'All': 'Todos',
            'Fruits': 'Frutas y Verduras',
            'Fish': 'Pescado',
            'Butcher': 'Carnicería',
            'Dairy': 'Lácteos',
            'Fresh': 'Frescos',
            'Bakery': 'Panadería',
            'Snacks': 'Snacks',
            'Drinks': 'Bebidas',
            'Frozen': 'Congelados',
            'Grocery': 'Comestibles',
            'Other': 'Otros',
          })}";

  static String m2(name) => "${Intl.select(name, {
            'All': 'Todos',
            'Fridge': 'Refrigerador',
            'Freezer': 'Congelador',
            'Cupboard': 'Alacena',
          })}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "add": MessageLookupByLibrary.simpleMessage("Agregar"),
        "addPantryItem":
            MessageLookupByLibrary.simpleMessage("Agregar a la despensa"),
        "addShoppingListItem": MessageLookupByLibrary.simpleMessage(
            "Agregar a la lista de compras"),
        "addedToPantry": MessageLookupByLibrary.simpleMessage(
            "¡Elemento agregado a la despensa!"),
        "addedToShoppingList": MessageLookupByLibrary.simpleMessage(
            "¡Elemento agregado a la lista de compras!"),
        "appDevelopedBy": MessageLookupByLibrary.simpleMessage(
            "Desarrollado por Benjamin Choron"),
        "appExpirationDateManagementContent": MessageLookupByLibrary.simpleMessage(
            "Esta aplicación ofrece la visualización de productos que se acercan a su fecha de vencimiento dentro de los cinco días anteriores a su vencimiento. Después de la fecha de vencimiento, permanecen en rojo en esta lista hasta que se eliminan."),
        "appExpirationDateManagementTitle":
            MessageLookupByLibrary.simpleMessage(
                "Gestión de fechas de vencimiento"),
        "appInformationsButton":
            MessageLookupByLibrary.simpleMessage("Informaciones"),
        "appStorageInformationsContent": MessageLookupByLibrary.simpleMessage(
            "Esta aplicación utiliza el almacenamiento local para guardar sus datos. Esto significa que sus datos se almacenan en su dispositivo y no se comparten con terceros. Advertencia, si elimina la aplicación, perderá todos estos datos."),
        "appStorageInformationsTitle": MessageLookupByLibrary.simpleMessage(
            "Información de almacenamiento"),
        "appVersion": m0,
        "categoryName": m1,
        "darkTheme": MessageLookupByLibrary.simpleMessage("Oscuro"),
        "expirationLabel":
            MessageLookupByLibrary.simpleMessage("Fecha de vencimiento"),
        "expirationRange":
            MessageLookupByLibrary.simpleMessage("Dentro de 5 días"),
        "expirationTitle":
            MessageLookupByLibrary.simpleMessage("Fechas de vencimiento"),
        "expired": MessageLookupByLibrary.simpleMessage("Vencido"),
        "failedToAddItem": MessageLookupByLibrary.simpleMessage(
            "No se pudo agregar el elemento... Por favor, inténtelo de nuevo más tarde."),
        "failedToRemoveItem": MessageLookupByLibrary.simpleMessage(
            "No se pudo eliminar el elemento... Por favor, inténtelo de nuevo más tarde."),
        "failedToUpdateItem": MessageLookupByLibrary.simpleMessage(
            "No se pudo actualizar el elemento... Por favor, inténtelo de nuevo más tarde."),
        "language": MessageLookupByLibrary.simpleMessage("Idioma"),
        "lightTheme": MessageLookupByLibrary.simpleMessage("Claro"),
        "mustBePositive":
            MessageLookupByLibrary.simpleMessage("Debe ser un número positivo"),
        "mustHaveCharacters": MessageLookupByLibrary.simpleMessage(
            "Debe contener entre 1 y 30 caracteres"),
        "nameLabel": MessageLookupByLibrary.simpleMessage("Nombre"),
        "noItems": MessageLookupByLibrary.simpleMessage(
            "No hay elementos agregados por el momento."),
        "pantryDialogActionNo": MessageLookupByLibrary.simpleMessage("No"),
        "pantryDialogActionYes": MessageLookupByLibrary.simpleMessage("Sí"),
        "pantryDialogConfirmContent": MessageLookupByLibrary.simpleMessage(
            "¿Realmente quiere eliminar este elemento de su despensa?"),
        "pantryDialogDismissContent": MessageLookupByLibrary.simpleMessage(
            "¿Quiere agregar este elemento a su lista de compras?"),
        "pantryDialogTitle": MessageLookupByLibrary.simpleMessage(
            "Eliminación de un elemento de la despensa"),
        "pantryTitle": MessageLookupByLibrary.simpleMessage("Despensa"),
        "quantityLabel": MessageLookupByLibrary.simpleMessage("Cantidad"),
        "reset": MessageLookupByLibrary.simpleMessage("Restablecer"),
        "settingsTitle":
            MessageLookupByLibrary.simpleMessage("Configuraciones"),
        "shoppingListAddToPantryDialogActionNo":
            MessageLookupByLibrary.simpleMessage("No"),
        "shoppingListAddToPantryDialogActionYes":
            MessageLookupByLibrary.simpleMessage("Sí"),
        "shoppingListAddToPantryDialogConfirmContent":
            MessageLookupByLibrary.simpleMessage(
                "¿Compró ese artículo y desea agregarlo a la despensa?"),
        "shoppingListAddToPantryDialogTitle":
            MessageLookupByLibrary.simpleMessage(
                "Artículo comprado de la lista de compras"),
        "shoppingListRemoveDialogActionNo":
            MessageLookupByLibrary.simpleMessage("No"),
        "shoppingListRemoveDialogActionYes":
            MessageLookupByLibrary.simpleMessage("Sí"),
        "shoppingListRemoveDialogConfirmContent":
            MessageLookupByLibrary.simpleMessage(
                "¿Realmente quiere eliminar este elemento de su lista de compras?"),
        "shoppingListRemoveDialogTitle": MessageLookupByLibrary.simpleMessage(
            "Eliminación de un elemento de la lista de compras"),
        "shoppingListTitle":
            MessageLookupByLibrary.simpleMessage("Lista de compras"),
        "storageName": m2,
        "systemTheme": MessageLookupByLibrary.simpleMessage("Sistema"),
        "theme": MessageLookupByLibrary.simpleMessage("Tema"),
        "update": MessageLookupByLibrary.simpleMessage("Actualizar")
      };
}
