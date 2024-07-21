import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:smart_pantry/pantry/providers/user_pantry.dart';
import 'package:smart_pantry/pantry/widgets/pantry_items_list.dart';
import 'package:smart_pantry/globals/data/storages.dart';
import 'package:smart_pantry/globals/models/storage.dart';

class CupboardScreen extends ConsumerStatefulWidget {
  const CupboardScreen({super.key});

  @override
  ConsumerState<CupboardScreen> createState() => _CupboardScreenState();
}

class _CupboardScreenState extends ConsumerState<CupboardScreen> {
  late Future<void> _cupboardItems;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _cupboardItems = ref
        .watch(userPantryProvider.notifier)
        .loadStorageItems(storages[Storages.cupboard]!);
  }

  @override
  Widget build(BuildContext context) {
    final cupboardItems = ref.watch(userPantryProvider);

    return Scaffold(
      body: FutureBuilder(
        future: _cupboardItems,
        builder: (context, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? const Center(child: CircularProgressIndicator())
                : PantryItemsList(items: cupboardItems),
      ),
    );
  }
}
