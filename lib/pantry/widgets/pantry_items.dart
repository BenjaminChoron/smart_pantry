import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_pantry/globals/models/storage.dart';
import 'package:smart_pantry/pantry/providers/user_pantry.dart';
import 'package:smart_pantry/pantry/widgets/pantry_items_list.dart';

class PantryItems extends ConsumerStatefulWidget {
  const PantryItems({
    super.key,
    this.isAllItems = false,
    this.storage,
  });

  final bool isAllItems;
  final Storage? storage;

  @override
  ConsumerState<PantryItems> createState() => _PantryItemsState();
}

class _PantryItemsState extends ConsumerState<PantryItems> {
  late Future<void> _allItems;
  bool get isAllItems => widget.isAllItems;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.storage == null) {
      _allItems = ref.watch(userPantryProvider.notifier).loadItems();
    } else {
      _allItems = ref
          .watch(userPantryProvider.notifier)
          .loadItemsByStorage(widget.storage!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final allItems = ref.watch(userPantryProvider);

    return Scaffold(
      body: FutureBuilder(
        future: _allItems,
        builder: (context, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? const Center(child: CircularProgressIndicator())
                : PantryItemsList(items: allItems, isAllItems: isAllItems),
      ),
    );
  }
}
