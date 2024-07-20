import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:smart_pantry/providers/user_pantry.dart';
import 'package:smart_pantry/widgets/items_list.dart';

class AllItemsScreen extends ConsumerStatefulWidget {
  const AllItemsScreen({super.key});

  @override
  ConsumerState<AllItemsScreen> createState() => _AllItemsScreenState();
}

class _AllItemsScreenState extends ConsumerState<AllItemsScreen> {
  late Future<void> _allItems;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _allItems = ref.watch(userPantryProvider.notifier).loadItems();
  }

  @override
  Widget build(BuildContext context) {
    final allItems = ref.watch(userPantryProvider);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: _allItems,
          builder: (context, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? const Center(child: CircularProgressIndicator())
                  : ItemsList(items: allItems, isAllPantryItems: true),
        ),
      ),
    );
  }
}
