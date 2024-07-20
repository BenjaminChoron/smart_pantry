import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:smart_pantry/providers/user_pantry.dart';
import 'package:smart_pantry/widgets/items_list.dart';
import 'package:smart_pantry/data/storages.dart';
import 'package:smart_pantry/models/storage.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: _cupboardItems,
          builder: (context, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? const Center(child: CircularProgressIndicator())
                  : ItemsList(items: cupboardItems),
        ),
      ),
    );
  }
}
