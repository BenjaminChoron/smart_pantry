import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:smart_pantry/models/shopping_item.dart';
import 'package:smart_pantry/widgets/shopping_item_form.dart';

class AddShoppingItemScreen extends ConsumerStatefulWidget {
  const AddShoppingItemScreen({
    super.key,
    this.isAddToShoppingAfterRemovedFromPantry = false,
    this.item,
  });

  final bool? isAddToShoppingAfterRemovedFromPantry;
  final ShoppingItem? item;

  @override
  ConsumerState<AddShoppingItemScreen> createState() =>
      _AddShoppingItemScreenState();
}

class _AddShoppingItemScreenState extends ConsumerState<AddShoppingItemScreen> {
  final routeName = '/add-shopping-item';

  bool get isAddToShoppingAfterRemovedFromPantry =>
      widget.isAddToShoppingAfterRemovedFromPantry!;
  ShoppingItem? get item => widget.item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Shopping Item'),
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
