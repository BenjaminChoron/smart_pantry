import 'package:flutter/material.dart';
import 'package:smart_pantry/generated/l10n.dart';
import 'package:smart_pantry/recipes/data/recipe_difficulties.dart';
import 'package:smart_pantry/recipes/models/recipe_difficulty.dart';

class RecipeDifficultyDropdownFormInput extends StatefulWidget {
  const RecipeDifficultyDropdownFormInput({
    super.key,
    required this.recipeDifficulty,
    required this.onChanged,
  });

  final RecipeDifficulty recipeDifficulty;
  final Function(RecipeDifficulty) onChanged;

  @override
  State<RecipeDifficultyDropdownFormInput> createState() =>
      _RecipeDifficultyDropdownFormInputState();
}

class _RecipeDifficultyDropdownFormInputState
    extends State<RecipeDifficultyDropdownFormInput> {
  RecipeDifficulty _selectedRecipeDifficulty =
      recipeDifficulties[Difficulties.easy]!;

  @override
  void initState() {
    super.initState();
    _selectedRecipeDifficulty = widget.recipeDifficulty;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: _selectedRecipeDifficulty,
      dropdownColor: Theme.of(context).colorScheme.surfaceBright,
      decoration: InputDecoration(
        border: InputBorder.none,
        label: Text(
          S.of(context).recipeDifficultyLabel,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.bold),
        ),
      ),
      style: TextStyle(
        color: Theme.of(context).colorScheme.onSurface,
      ),
      items: recipeDifficulties.entries
          .map((entry) => DropdownMenuItem(
                value: entry.value,
                child:
                    Text(S.of(context).recipeDifficultyName(entry.value.name)),
              ))
          .toList(),
      onChanged: (value) {
        setState(() {
          _selectedRecipeDifficulty = value!;
        });
        widget.onChanged(value!);
      },
    );
  }
}
