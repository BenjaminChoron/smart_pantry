import 'package:flutter/material.dart';
import 'package:smart_pantry/generated/l10n.dart';

import 'package:smart_pantry/shopping_list/models/shopping_item.dart';
import 'package:smart_pantry/shopping_list/widgets/shopping_item_form.dart';

class AddShoppingItemView extends StatelessWidget {
  const AddShoppingItemView({
    super.key,
    this.isAddToShoppingAfterRemovedFromPantry = false,
    this.item,
  });

  final bool isAddToShoppingAfterRemovedFromPantry;
  final ShoppingItem? item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).addShoppingListItem),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: isAddToShoppingAfterRemovedFromPantry
              ? ShoppingItemForm(
                  isAddToShoppingAfterRemovedFromPantry: true,
                  item: item,
                )
              : const ShoppingItemForm()),
    );
  }
}
