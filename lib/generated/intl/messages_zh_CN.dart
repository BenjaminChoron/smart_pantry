// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh_CN locale. All the
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
  String get localeName => 'zh_CN';

  static String m0(name) => "${Intl.select(name, {
            'All': '所有',
            'Fruits': '水果',
            'Vegetables': '蔬菜',
            'Meat': '肉类',
            'Seafood': '海鲜',
            'Dairy': '乳制品',
            'Bakery': '烘焙',
            'Snacks': '零食',
            'Drinks': '饮料',
            'Frozen': '冷冻',
            'Other': '其他',
          })}";

  static String m1(name) => "${Intl.select(name, {
            'All': '所有',
            'Fridge': '冰箱',
            'Freezer': '冷冻柜',
            'Cupboard': '橱柜',
          })}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "add": MessageLookupByLibrary.simpleMessage("添加"),
        "addPantryItem": MessageLookupByLibrary.simpleMessage("添加到储藏室"),
        "addShoppingListItem": MessageLookupByLibrary.simpleMessage("添加到购物清单"),
        "categoryName": m0,
        "darkTheme": MessageLookupByLibrary.simpleMessage("深色"),
        "failedToAddItem":
            MessageLookupByLibrary.simpleMessage("无法添加项目... 请稍后再试。"),
        "failedToRemoveItem":
            MessageLookupByLibrary.simpleMessage("无法删除项目... 请稍后再试。"),
        "failedToUpdateItem":
            MessageLookupByLibrary.simpleMessage("无法更新项目... 请稍后再试。"),
        "language": MessageLookupByLibrary.simpleMessage("语言"),
        "lightTheme": MessageLookupByLibrary.simpleMessage("浅色"),
        "mustBePositive": MessageLookupByLibrary.simpleMessage("必须是正数"),
        "mustHaveCharacters":
            MessageLookupByLibrary.simpleMessage("必须包含1到30个字符"),
        "nameLabel": MessageLookupByLibrary.simpleMessage("名称"),
        "noItems": MessageLookupByLibrary.simpleMessage("目前没有添加任何项目。"),
        "pantryDialogActionNo": MessageLookupByLibrary.simpleMessage("否"),
        "pantryDialogActionYes": MessageLookupByLibrary.simpleMessage("是"),
        "pantryDialogConfirmContent":
            MessageLookupByLibrary.simpleMessage("您真的要从储藏室中删除此项目吗？"),
        "pantryDialogDismissContent":
            MessageLookupByLibrary.simpleMessage("您想将此项目添加到购物清单吗？"),
        "pantryDialogTitle": MessageLookupByLibrary.simpleMessage("从储藏室删除项目"),
        "pantryTitle": MessageLookupByLibrary.simpleMessage("储藏室"),
        "quantityLabel": MessageLookupByLibrary.simpleMessage("数量"),
        "reset": MessageLookupByLibrary.simpleMessage("重置"),
        "settingsTitle": MessageLookupByLibrary.simpleMessage("设置"),
        "shoppingListDialogActionNo": MessageLookupByLibrary.simpleMessage("否"),
        "shoppingListDialogActionYes":
            MessageLookupByLibrary.simpleMessage("是"),
        "shoppingListDialogConfirmContent":
            MessageLookupByLibrary.simpleMessage("您真的要从购物清单中删除此项目吗？"),
        "shoppingListDialogTitle":
            MessageLookupByLibrary.simpleMessage("从购物清单删除项目"),
        "shoppingListTitle": MessageLookupByLibrary.simpleMessage("购物清单"),
        "storageName": m1,
        "systemTheme": MessageLookupByLibrary.simpleMessage("系统"),
        "theme": MessageLookupByLibrary.simpleMessage("主题"),
        "update": MessageLookupByLibrary.simpleMessage("更新")
      };
}
