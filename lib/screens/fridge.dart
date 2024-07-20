import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:smart_pantry/providers/user_pantry.dart';
import 'package:smart_pantry/widgets/items_list.dart';

class FridgeScreen extends ConsumerStatefulWidget {
  const FridgeScreen({super.key});

  @override
  ConsumerState<FridgeScreen> createState() => _FridgeScreenState();
}

class _FridgeScreenState extends ConsumerState<FridgeScreen> {
  late Future<void> _fridgeItems;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _fridgeItems = ref.watch(userPantryProvider.notifier).loadFridgeItems();
  }

  @override
  Widget build(BuildContext context) {
    final fridgeItems = ref.watch(userPantryProvider);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: _fridgeItems,
          builder: (context, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? const Center(child: CircularProgressIndicator())
                  : ItemsList(items: fridgeItems),
        ),
      ),
    );
  }
}
