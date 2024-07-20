import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:smart_pantry/data/categories.dart';
import 'package:smart_pantry/data/units.dart';
import 'package:smart_pantry/models/category.dart';
import 'package:smart_pantry/models/shopping_item.dart';
import 'package:smart_pantry/models/unit.dart';
import 'package:smart_pantry/providers/user_shopping_list.dart';
import 'package:smart_pantry/widgets/number_form_input.dart';
import 'package:smart_pantry/widgets/category_dropdown_form_input.dart';
import 'package:smart_pantry/widgets/text_form_input.dart';
import 'package:smart_pantry/widgets/unit_dropdown_form_input.dart';

class ShoppingItemForm extends ConsumerStatefulWidget {
  const ShoppingItemForm({
    super.key,
    this.isUpdate = false,
    this.item,
  });

  final ShoppingItem? item;
  final bool isUpdate;

  @override
  ConsumerState<ShoppingItemForm> createState() => _ShoppingItemFormState();
}

class _ShoppingItemFormState extends ConsumerState<ShoppingItemForm> {
  bool get isUpdate => widget.isUpdate;
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
            content:
                const Text('Failed to add item... Please try again later.'),
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
            content:
                const Text('Failed to update item... Please try again later.'),
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
    if (isUpdate) {
      _enteredName = item!.name;
      _selectedCategory = item!.category;
      _enteredQuantity = item!.quantity;
      _selectedUnit = item!.unit;
    }

    return Form(
      key: _formKey,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: TextFormInput(
                    initialValue: _enteredName,
                    label: 'Name',
                    onSaved: (value) {
                      _enteredName = value;
                    }),
              ),
              const SizedBox(width: 20),
              Expanded(
                flex: 1,
                child: CategoryDropdownFormInput(
                    category: _selectedCategory,
                    onChanged: (value) {
                      _selectedCategory = value;
                    }),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: NumberFormInput(
                    initialValue: _enteredQuantity,
                    label: 'Quantity',
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
              TextButton(
                onPressed: _isSending
                    ? null
                    : () {
                        _formKey.currentState!.reset();
                      },
                child: const Text('Reset'),
              ),
              const SizedBox(width: 12),
              ElevatedButton(
                onPressed:
                    _isSending ? null : (isUpdate ? _updateItem : _saveItem),
                child: _isSending
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(),
                      )
                    : Text(isUpdate ? 'Update' : 'Add'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
