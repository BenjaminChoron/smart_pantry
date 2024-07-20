import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:smart_pantry/widgets/pantry_item_form.dart';

class AddPantryItemScreen extends ConsumerStatefulWidget {
  const AddPantryItemScreen({super.key});

  @override
  ConsumerState<AddPantryItemScreen> createState() =>
      _AddPantryItemScreenState();
}

class _AddPantryItemScreenState extends ConsumerState<AddPantryItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Item'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: PantryItemForm(),
      ),
    );
  }
}
