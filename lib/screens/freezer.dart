import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:smart_pantry/providers/user_pantry.dart';
import 'package:smart_pantry/widgets/pantry_items_list.dart';
import 'package:smart_pantry/data/storages.dart';
import 'package:smart_pantry/models/storage.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: _freezerItems,
          builder: (context, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? const Center(child: CircularProgressIndicator())
                  : PantryItemsList(items: freezerItems),
        ),
      ),
    );
  }
}
