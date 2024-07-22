import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_pantry/generated/l10n.dart';

import 'package:smart_pantry/pantry/widgets/pantry_item_form.dart';

class AddPantryItemView extends ConsumerStatefulWidget {
  const AddPantryItemView({super.key});

  @override
  ConsumerState<AddPantryItemView> createState() => _AddPantryItemViewState();
}

class _AddPantryItemViewState extends ConsumerState<AddPantryItemView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).addPantryItem),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: PantryItemForm(),
      ),
    );
  }
}
