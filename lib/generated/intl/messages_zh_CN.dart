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

  static String m0(version) => "版本${version}";

  static String m1(name) => "${Intl.select(name, {
            'All': '所有',
            'Fruits': '水果',
            'Fish': '鱼类',
            'Butcher': '肉类',
            'Dairy': '乳制品',
            'Fresh': '新鲜',
            'Bakery': '面包店',
            'Snacks': '零食',
            'Drinks': '饮料',
            'Frozen': '冷冻食品',
            'Grocery': '杂货',
            'Other': '其他',
          })}";

  static String m2(name) => "${Intl.select(name, {
            'Low': '低',
            'Medium': '中',
            'High': '高',
          })}";

  static String m3(name) => "${Intl.select(name, {
            'Easy': '简单',
            'Medium': '中等',
            'Hard': '困难',
          })}";

  static String m4(name) => "${Intl.select(name, {
            'Breakfast': '早餐',
            'Lunch': '午餐',
            'Dinner': '晚餐',
            'Snack': '小吃',
            'Dessert': '甜点',
          })}";

  static String m5(name) => "${Intl.select(name, {
            'All': '所有',
            'Fridge': '冰箱',
            'Freezer': '冷冻柜',
            'Cupboard': '橱柜',
          })}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "add": MessageLookupByLibrary.simpleMessage("添加"),
        "addNewRecipe": MessageLookupByLibrary.simpleMessage("添加新食谱"),
        "addPantryItem": MessageLookupByLibrary.simpleMessage("添加到储藏室"),
        "addShoppingListItem": MessageLookupByLibrary.simpleMessage("添加到购物清单"),
        "addedToPantry": MessageLookupByLibrary.simpleMessage("已添加到储藏室！"),
        "addedToShoppingList":
            MessageLookupByLibrary.simpleMessage("已添加到购物清单！"),
        "appDevelopedBy":
            MessageLookupByLibrary.simpleMessage("由Benjamin Choron开发"),
        "appExpirationDateManagementContent":
            MessageLookupByLibrary.simpleMessage(
                "此应用程序提供了在过期日期前五天内显示接近过期的产品的功能。过期后，它们将保持在此列表中以红色显示，直到被删除。"),
        "appExpirationDateManagementTitle":
            MessageLookupByLibrary.simpleMessage("到期日期管理"),
        "appInformationsButton": MessageLookupByLibrary.simpleMessage("信息"),
        "appStorageInformationsContent": MessageLookupByLibrary.simpleMessage(
            "此应用程序使用本地存储来保存您的数据。这意味着您的数据存储在您的设备上，不会与任何第三方共享。警告，如果您删除该应用程序，将丢失所有这些数据。"),
        "appStorageInformationsTitle":
            MessageLookupByLibrary.simpleMessage("存储信息"),
        "appVersion": m0,
        "applyFilters": MessageLookupByLibrary.simpleMessage("应用过滤器"),
        "categoryName": m1,
        "clearFilters": MessageLookupByLibrary.simpleMessage("清除过滤器"),
        "darkTheme": MessageLookupByLibrary.simpleMessage("深色"),
        "expirationLabel": MessageLookupByLibrary.simpleMessage("到期日期"),
        "expirationRange": MessageLookupByLibrary.simpleMessage("在5天内"),
        "expirationTitle": MessageLookupByLibrary.simpleMessage("到期日期"),
        "expired": MessageLookupByLibrary.simpleMessage("已过期"),
        "failedToAddItem":
            MessageLookupByLibrary.simpleMessage("无法添加项目... 请稍后再试。"),
        "failedToRemoveItem":
            MessageLookupByLibrary.simpleMessage("无法删除项目... 请稍后再试。"),
        "failedToUpdateItem":
            MessageLookupByLibrary.simpleMessage("无法更新项目... 请稍后再试。"),
        "hours": MessageLookupByLibrary.simpleMessage("小时"),
        "language": MessageLookupByLibrary.simpleMessage("语言"),
        "lightTheme": MessageLookupByLibrary.simpleMessage("浅色"),
        "minutes": MessageLookupByLibrary.simpleMessage("分钟"),
        "mustBePositive": MessageLookupByLibrary.simpleMessage("必须是正数"),
        "mustHaveCharacters":
            MessageLookupByLibrary.simpleMessage("必须包含1到30个字符"),
        "nameLabel": MessageLookupByLibrary.simpleMessage("名称"),
        "newIngredientLabel": MessageLookupByLibrary.simpleMessage("新配料"),
        "noItems": MessageLookupByLibrary.simpleMessage("目前没有添加任何项目。"),
        "pantryDialogActionNo": MessageLookupByLibrary.simpleMessage("否"),
        "pantryDialogActionYes": MessageLookupByLibrary.simpleMessage("是"),
        "pantryDialogConfirmContent":
            MessageLookupByLibrary.simpleMessage("您真的要从储藏室中删除此项目吗？"),
        "pantryDialogDismissContent":
            MessageLookupByLibrary.simpleMessage("您想将此项目添加到购物清单吗？"),
        "pantryDialogDismissTitle":
            MessageLookupByLibrary.simpleMessage("添加到购物清单"),
        "pantryDialogTitle": MessageLookupByLibrary.simpleMessage("从储藏室删除项目"),
        "pantryTitle": MessageLookupByLibrary.simpleMessage("储藏室"),
        "quantityLabel": MessageLookupByLibrary.simpleMessage("数量"),
        "recipeCost": MessageLookupByLibrary.simpleMessage("成本"),
        "recipeCostLabel": MessageLookupByLibrary.simpleMessage("成本"),
        "recipeCostName": m2,
        "recipeDescription": MessageLookupByLibrary.simpleMessage("描述"),
        "recipeDifficulty": MessageLookupByLibrary.simpleMessage("难度"),
        "recipeDifficultyLabel": MessageLookupByLibrary.simpleMessage("难度"),
        "recipeDifficultyName": m3,
        "recipeIngredients": MessageLookupByLibrary.simpleMessage("配料"),
        "recipeRemoveDialogActionNo": MessageLookupByLibrary.simpleMessage("否"),
        "recipeRemoveDialogActionYes":
            MessageLookupByLibrary.simpleMessage("是"),
        "recipeRemoveDialogConfirmContent":
            MessageLookupByLibrary.simpleMessage("您真的要删除此食谱吗？"),
        "recipeRemoveDialogTitle": MessageLookupByLibrary.simpleMessage("删除食谱"),
        "recipeSteps": MessageLookupByLibrary.simpleMessage("步骤"),
        "recipeTimeLabel": MessageLookupByLibrary.simpleMessage("时间"),
        "recipeTypeLabel": MessageLookupByLibrary.simpleMessage("类型"),
        "recipeTypeName": m4,
        "recipesTitle": MessageLookupByLibrary.simpleMessage("食谱"),
        "reset": MessageLookupByLibrary.simpleMessage("重置"),
        "settingsTitle": MessageLookupByLibrary.simpleMessage("设置"),
        "shoppingListAddToPantryDialogActionNo":
            MessageLookupByLibrary.simpleMessage("否"),
        "shoppingListAddToPantryDialogActionYes":
            MessageLookupByLibrary.simpleMessage("是"),
        "shoppingListAddToPantryDialogConfirmContent":
            MessageLookupByLibrary.simpleMessage("您购买了该项目并希望将其添加到储藏室吗？"),
        "shoppingListAddToPantryDialogTitle":
            MessageLookupByLibrary.simpleMessage("购物清单购买的项目"),
        "shoppingListTitle": MessageLookupByLibrary.simpleMessage("购物清单"),
        "stepsLabel": MessageLookupByLibrary.simpleMessage("步骤"),
        "storageName": m5,
        "store": MessageLookupByLibrary.simpleMessage("存放"),
        "systemTheme": MessageLookupByLibrary.simpleMessage("系统"),
        "theme": MessageLookupByLibrary.simpleMessage("主题"),
        "update": MessageLookupByLibrary.simpleMessage("更新"),
        "whereToStore": MessageLookupByLibrary.simpleMessage("您想将此项目存放在哪里？")
      };
}
