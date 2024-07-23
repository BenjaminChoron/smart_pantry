import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:smart_pantry/globals/models/category.dart';
import 'package:smart_pantry/shopping_list/providers/user_shopping_list.dart';
import 'package:smart_pantry/shopping_list/widgets/shopping_list_items_list.dart';

class ShoppingListItems extends ConsumerStatefulWidget {
  const ShoppingListItems({
    super.key,
    this.isAllItems = false,
    this.category,
  });

  final bool isAllItems;
  final Category? category;

  @override
  ConsumerState<ShoppingListItems> createState() => _ShoppingListItemsState();
}

class _ShoppingListItemsState extends ConsumerState<ShoppingListItems> {
  late Future<void> _allItems;
  bool get isAllItems => widget.isAllItems;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.category == null) {
      _allItems = ref.watch(userShoppingListProvider.notifier).loadItems();
    } else {
      _allItems = ref
          .watch(userShoppingListProvider.notifier)
          .loadItemsByCategory(widget.category!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final allItems = ref.watch(userShoppingListProvider);

    return Scaffold(
      body: FutureBuilder(
        future: _allItems,
        builder: (context, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? const Center(child: CircularProgressIndicator())
            : ShoppingListItemsList(items: allItems, isAllItems: isAllItems),
      ),
    );
  }
}
