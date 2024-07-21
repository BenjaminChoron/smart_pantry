import 'package:flutter/material.dart';
import 'package:smart_pantry/localization/generated/l10n.dart';

class TextFormInput extends StatelessWidget {
  const TextFormInput({
    super.key,
    required this.label,
    required this.onSaved,
    this.initialValue = '',
  });

  final String label;
  final Function(String) onSaved;
  final String initialValue;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
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
          return S.of(context).mustHaveCharacters;
        }
        return null;
      },
      onSaved: (value) {
        onSaved(value!);
      },
    );
  }
}
