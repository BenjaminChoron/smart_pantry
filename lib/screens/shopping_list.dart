import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:smart_pantry/providers/user_shopping_list.dart';
import 'package:smart_pantry/widgets/shopping_items_list.dart';

class ShoppingListScreen extends ConsumerStatefulWidget {
  const ShoppingListScreen({super.key});

  @override
  ConsumerState<ShoppingListScreen> createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends ConsumerState<ShoppingListScreen> {
  late Future<void> _allItems;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _allItems = ref.watch(userShoppingListProvider.notifier).loadItems();
  }

  @override
  Widget build(BuildContext context) {
    final allItems = ref.watch(userShoppingListProvider);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: _allItems,
          builder: (context, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? const Center(child: CircularProgressIndicator())
                  : ShoppingItemsList(items: allItems),
        ),
      ),
    );
  }
}
