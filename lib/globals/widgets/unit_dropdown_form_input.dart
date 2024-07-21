import 'package:flutter/material.dart';
import 'package:smart_pantry/globals/data/units.dart';
import 'package:smart_pantry/globals/models/unit.dart';

class UnitDropdownFormInput extends StatefulWidget {
  const UnitDropdownFormInput({
    super.key,
    required this.unit,
    required this.onChanged,
  });

  final Unit unit;
  final Function(Unit) onChanged;

  @override
  State<UnitDropdownFormInput> createState() => _UnitDropdownFormInputState();
}

class _UnitDropdownFormInputState extends State<UnitDropdownFormInput> {
  Unit _selectedUnit = units[Units.gram]!;

  @override
  void initState() {
    super.initState();
    _selectedUnit = widget.unit;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: _selectedUnit,
      dropdownColor: Theme.of(context).colorScheme.surfaceBright,
      decoration: const InputDecoration(
        border: InputBorder.none,
      ),
      style: TextStyle(
        color: Theme.of(context).colorScheme.onSurface,
      ),
      items: units.entries
          .map((entry) => DropdownMenuItem(
                value: entry.value,
                child: Text(entry.value.symbol),
              ))
          .toList(),
      onChanged: (value) {
        setState(() {
          _selectedUnit = value!;
        });
        widget.onChanged(value!);
      },
    );
  }
}
