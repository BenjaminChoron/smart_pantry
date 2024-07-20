import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:smart_pantry/providers/user_shopping_list.dart';

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
                    : allItems.isEmpty
                        ? const Center(
                            child: Text(
                              'No items in the shopping list',
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        : ListView.builder(
                            itemCount: allItems.length,
                            itemBuilder: (context, index) {
                              final item = allItems[index];
                              return ListTile(
                                leading: CircleAvatar(
                                  child: Text(item.category.name),
                                ),
                                title: Text(
                                    '${item.quantity} ${item.unit.symbol} of ${item.name}'),
                              );
                            },
                          )),
      ),
    );
  }
}
