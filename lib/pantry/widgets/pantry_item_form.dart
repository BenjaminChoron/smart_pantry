import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:smart_pantry/globals/data/storages.dart';
import 'package:smart_pantry/globals/data/units.dart';
import 'package:smart_pantry/localization/generated/l10n.dart';
import 'package:smart_pantry/pantry/models/pantry_item.dart';
import 'package:smart_pantry/globals/models/storage.dart';
import 'package:smart_pantry/globals/models/unit.dart';
import 'package:smart_pantry/pantry/providers/user_pantry.dart';
import 'package:smart_pantry/globals/widgets/number_form_input.dart';
import 'package:smart_pantry/globals/widgets/storage_dropdown_form_input.dart';
import 'package:smart_pantry/globals/widgets/text_form_input.dart';
import 'package:smart_pantry/globals/widgets/unit_dropdown_form_input.dart';

class PantryItemForm extends ConsumerStatefulWidget {
  const PantryItemForm({
    super.key,
    this.isUpdate = false,
    this.item,
  });

  final PantryItem? item;
  final bool isUpdate;

  @override
  ConsumerState<PantryItemForm> createState() => _PantryItemFormState();
}

class _PantryItemFormState extends ConsumerState<PantryItemForm> {
  bool get isUpdate => widget.isUpdate;
  PantryItem? get item => widget.item;

  final _formKey = GlobalKey<FormState>();
  String _enteredName = '';
  Storage _selectedStorage = storages[Storages.fridge]!;
  int _enteredQuantity = 0;
  Unit _selectedUnit = units[Units.gram]!;

  bool _isSending = false;

  void _saveItem() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSending = true;
      });

      _formKey.currentState!.save();

      final result = await ref.read(userPantryProvider.notifier).addItem(
            _enteredName,
            _selectedStorage,
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

      final itemToUpdate = PantryItem(
        id: item!.id,
        name: _enteredName,
        storage: _selectedStorage,
        quantity: _enteredQuantity,
        unit: _selectedUnit,
      );

      final result =
          await ref.read(userPantryProvider.notifier).updateItem(itemToUpdate);

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
      _selectedStorage = item!.storage;
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
                    label: S.of(context).nameLabel,
                    onSaved: (value) {
                      _enteredName = value;
                    }),
              ),
              const SizedBox(width: 20),
              Expanded(
                flex: 1,
                child: StorageDropdownFormInput(
                    storage: _selectedStorage,
                    onChanged: (value) {
                      _selectedStorage = value;
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
              isUpdate
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
