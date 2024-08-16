import 'package:flutter/material.dart';
import 'package:smart_pantry/generated/l10n.dart';

class NumberFormInput extends StatelessWidget {
  const NumberFormInput({
    super.key,
    required this.label,
    required this.onSaved,
    this.initialValue = 0,
  });

  final String label;
  final Function(int) onSaved;
  final int initialValue;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue.toString(),
      decoration: InputDecoration(
        label: Text(
          label,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Theme.of(context).colorScheme.onSurface),
        ),
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
      maxLength: 4,
      validator: (value) {
        if (value == null ||
            value.isEmpty ||
            int.tryParse(value) == null ||
            int.tryParse(value)! <= 0) {
          return S.of(context).mustBePositive;
        }
        return null;
      },
      onSaved: (value) {
        onSaved(int.parse(value!));
      },
    );
  }
}
