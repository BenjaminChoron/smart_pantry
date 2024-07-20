import 'package:flutter/material.dart';

import 'package:smart_pantry/data/storages.dart';
import 'package:smart_pantry/models/storage.dart';

class StorageDropdownFormInput extends StatefulWidget {
  const StorageDropdownFormInput({
    super.key,
    required this.storage,
    required this.onChanged,
  });

  final Storage storage;
  final Function(Storage) onChanged;

  @override
  State<StorageDropdownFormInput> createState() =>
      _StorageDropdownFormInputState();
}

class _StorageDropdownFormInputState extends State<StorageDropdownFormInput> {
  Storage _selectedStorage = storages[Storages.fridge]!;

  @override
  void initState() {
    super.initState();
    _selectedStorage = widget.storage;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: _selectedStorage,
      dropdownColor: Theme.of(context).colorScheme.surfaceBright,
      decoration: const InputDecoration(
        border: InputBorder.none,
      ),
      style: TextStyle(
        color: Theme.of(context).colorScheme.onSurface,
      ),
      items: storages.entries
          .map((entry) => DropdownMenuItem(
                value: entry.value,
                child: Text(entry.value.name),
              ))
          .toList(),
      onChanged: (value) {
        setState(() {
          _selectedStorage = value!;
        });
        widget.onChanged(value!);
      },
    );
  }
}
