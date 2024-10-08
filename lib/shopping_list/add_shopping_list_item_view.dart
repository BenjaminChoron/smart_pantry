import 'package:flutter/material.dart';
import 'package:smart_pantry/generated/l10n.dart';

import 'package:smart_pantry/shopping_list/models/shopping_item.dart';
import 'package:smart_pantry/shopping_list/widgets/shopping_list_item_form.dart';

class AddShoppingListItemView extends StatelessWidget {
  const AddShoppingListItemView({
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(16),
              child: isAddToShoppingAfterRemovedFromPantry
                  ? ShoppingListItemForm(
                      isAddToShoppingAfterRemovedFromPantry: true,
                      item: item,
                    )
                  : const ShoppingListItemForm()),
        ),
      ),
    );
  }
}
