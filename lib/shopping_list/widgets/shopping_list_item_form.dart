import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:smart_pantry/globals/data/categories.dart';
import 'package:smart_pantry/globals/data/units.dart';
import 'package:smart_pantry/generated/l10n.dart';
import 'package:smart_pantry/globals/models/category.dart';
import 'package:smart_pantry/shopping_list/models/shopping_item.dart';
import 'package:smart_pantry/globals/models/unit.dart';
import 'package:smart_pantry/shopping_list/providers/user_shopping_list.dart';
import 'package:smart_pantry/globals/widgets/number_form_input.dart';
import 'package:smart_pantry/globals/widgets/category_dropdown_form_input.dart';
import 'package:smart_pantry/globals/widgets/text_form_input.dart';
import 'package:smart_pantry/globals/widgets/unit_dropdown_form_input.dart';

class ShoppingListItemForm extends ConsumerStatefulWidget {
  const ShoppingListItemForm({
    super.key,
    this.isUpdate = false,
    this.isAddToShoppingAfterRemovedFromPantry = false,
    this.item,
  });

  final ShoppingItem? item;
  final bool isUpdate;
  final bool isAddToShoppingAfterRemovedFromPantry;

  @override
  ConsumerState<ShoppingListItemForm> createState() =>
      _ShoppingListItemFormState();
}

class _ShoppingListItemFormState extends ConsumerState<ShoppingListItemForm> {
  bool get isUpdate => widget.isUpdate;
  bool get isAddToShoppingAfterRemovedFromPantry =>
      widget.isAddToShoppingAfterRemovedFromPantry;
  ShoppingItem? get item => widget.item;

  final _formKey = GlobalKey<FormState>();
  String _enteredName = '';
  Category _selectedCategory = categories[Categories.fruits]!;
  int _enteredQuantity = 0;
  Unit _selectedUnit = units[Units.gram]!;

  bool _isSending = false;

  void _saveItem() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSending = true;
      });

      _formKey.currentState!.save();

      final result = await ref.read(userShoppingListProvider.notifier).addItem(
            _enteredName,
            _selectedCategory,
            _enteredQuantity,
            _selectedUnit,
          );

      if (!result) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(S.of(context).failedToAddItem),
            backgroundColor: Theme.of(context).colorScheme.error,
            duration: const Duration(seconds: 2),
          ),
        );

        return;
      }

      setState(() {
        _isSending = false;
      });

      Navigator.of(context).pop();
    }
  }

  void _updateItem() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSending = true;
      });

      _formKey.currentState!.save();

      final itemToUpdate = ShoppingItem(
        id: item!.id,
        name: _enteredName,
        category: _selectedCategory,
        quantity: _enteredQuantity,
        unit: _selectedUnit,
      );

      final result = await ref
          .read(userShoppingListProvider.notifier)
          .updateItem(itemToUpdate);

      if (!result) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(S.of(context).failedToUpdateItem),
            backgroundColor: Theme.of(context).colorScheme.error,
            duration: const Duration(seconds: 2),
          ),
        );

        return;
      }

      setState(() {
        _isSending = false;
      });

      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isUpdate || item != null) {
      _enteredName = item!.name;
      _selectedCategory = item!.category;
      _enteredQuantity = item!.quantity;
      _selectedUnit = item!.unit;
    }

    if (isAddToShoppingAfterRemovedFromPantry) {
      _enteredName = item!.name;
      _selectedUnit = item!.unit;
    }

    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormInput(
              initialValue: _enteredName,
              label: S.of(context).nameLabel,
              onSaved: (value) {
                _enteredName = value;
              }),
          const SizedBox(width: 20),
          CategoryDropdownFormInput(
            category: _selectedCategory,
            onChanged: (value) {
              _selectedCategory = value;
            },
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: NumberFormInput(
                    initialValue: _enteredQuantity,
                    label: S.of(context).quantityLabel,
                    onSaved: (value) {
                      _enteredQuantity = value;
                    }),
              ),
              const SizedBox(width: 20),
              Expanded(
                flex: 1,
                child: UnitDropdownFormInput(
                    unit: _selectedUnit,
                    onChanged: (value) {
                      _selectedUnit = value;
                    }),
              )
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              (isAddToShoppingAfterRemovedFromPantry || isUpdate)
                  ? const SizedBox()
                  : TextButton(
                      onPressed: _isSending
                          ? null
                          : () {
                              _formKey.currentState!.reset();
                            },
                      child: Text(S.of(context).reset),
                    ),
              const SizedBox(width: 12),
              ElevatedButton(
                onPressed:
                    _isSending ? null : (isUpdate ? _updateItem : _saveItem),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                child: _isSending
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(),
                      )
                    : Text(
                        isUpdate ? S.of(context).update : S.of(context).add,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
