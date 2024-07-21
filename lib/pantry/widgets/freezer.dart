import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:smart_pantry/pantry/providers/user_pantry.dart';
import 'package:smart_pantry/pantry/widgets/pantry_items_list.dart';
import 'package:smart_pantry/globals/data/storages.dart';
import 'package:smart_pantry/globals/models/storage.dart';

class FreezerScreen extends ConsumerStatefulWidget {
  const FreezerScreen({super.key});

  @override
  ConsumerState<FreezerScreen> createState() => _FreezerScreenState();
}

class _FreezerScreenState extends ConsumerState<FreezerScreen> {
  late Future<void> _freezerItems;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _freezerItems = ref
        .watch(userPantryProvider.notifier)
        .loadStorageItems(storages[Storages.freezer]!);
  }

  @override
  Widget build(BuildContext context) {
    final freezerItems = ref.watch(userPantryProvider);

    return Scaffold(
      body: FutureBuilder(
        future: _freezerItems,
        builder: (context, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? const Center(child: CircularProgressIndicator())
                : PantryItemsList(items: freezerItems),
      ),
    );
  }
}
