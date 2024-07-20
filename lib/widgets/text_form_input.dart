import 'package:flutter/material.dart';

class TextFormInput extends StatelessWidget {
  const TextFormInput({
    super.key,
    required this.label,
    required this.onSaved,
  });

  final String label;
  final Function(String) onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: 30,
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
      validator: (value) {
        if (value == null ||
            value.isEmpty ||
            value.trim().length <= 1 ||
            value.trim().length > 30) {
          return 'Must be between 1 and 30 characters';
        }
        return null;
      },
      onSaved: (value) {
        onSaved(value!);
      },
    );
  }
}
