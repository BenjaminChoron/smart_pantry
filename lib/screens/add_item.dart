import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_pantry/data/storages.dart';
import 'package:smart_pantry/data/units.dart';
import 'package:smart_pantry/models/storage.dart';
import 'package:smart_pantry/models/unit.dart';
import 'package:smart_pantry/providers/user_pantry.dart';
import 'package:smart_pantry/widgets/storage_dropdown_form_input.dart';
import 'package:smart_pantry/widgets/unit_dropdown_form_input.dart';
import 'package:smart_pantry/widgets/number_form_input.dart';
import 'package:smart_pantry/widgets/text_form_input.dart';

class AddItemScreen extends ConsumerStatefulWidget {
  const AddItemScreen({super.key});

  @override
  ConsumerState<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends ConsumerState<AddItemScreen> {
  final _formKey = GlobalKey<FormState>();
  String _enteredName = '';
  Storage _selectedStorage = storages[Storages.fridge]!;
  int _enteredQuantity = 1;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: TextFormInput(
                        label: 'Name',
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
                    onPressed: _isSending ? null : _saveItem,
                    child: _isSending
                        ? const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(),
                          )
                        : const Text('Add item'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
