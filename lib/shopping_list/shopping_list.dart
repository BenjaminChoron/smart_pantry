import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:smart_pantry/globals/models/category.dart';
import 'package:smart_pantry/shopping_list/providers/user_shopping_list.dart';
import 'package:smart_pantry/shopping_list/widgets/shopping_items_list.dart';

class ShoppingListScreen extends ConsumerStatefulWidget {
  const ShoppingListScreen({
    super.key,
    this.category,
    this.isAllItems = false,
  });

  static const routeName = '/shopping_list';

  final Category? category;
  final bool isAllItems;

  @override
  ConsumerState<ShoppingListScreen> createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends ConsumerState<ShoppingListScreen> {
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
        builder: (context, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? const Center(child: CircularProgressIndicator())
                : ShoppingItemsList(items: allItems, isAllItems: isAllItems),
      ),
    );
  }
}
