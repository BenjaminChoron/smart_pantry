import 'package:flutter/material.dart';

class NumberFormInput extends StatelessWidget {
  const NumberFormInput({
    super.key,
    required this.label,
    required this.onSaved,
  });

  final String label;
  final Function(int) onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        label: Text(label),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      style: TextStyle(
        color: Theme.of(context).colorScheme.onSurface,
      ),
      keyboardType: TextInputType.number,
      maxLength: 3,
      validator: (value) {
        if (value == null ||
            value.isEmpty ||
            int.tryParse(value) == null ||
            int.tryParse(value)! <= 0) {
          return 'Must be a valid positive number';
        }
        return null;
      },
      onSaved: (value) {
        onSaved(int.parse(value!));
      },
    );
  }
}
