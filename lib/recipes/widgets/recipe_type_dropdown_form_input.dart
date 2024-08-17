import 'package:flutter/material.dart';
import 'package:smart_pantry/generated/l10n.dart';
import 'package:smart_pantry/recipes/data/recipe_types.dart';
import 'package:smart_pantry/recipes/models/recipe_type.dart';

class RecipeTypeDropdownFormInput extends StatefulWidget {
  const RecipeTypeDropdownFormInput({
    super.key,
    required this.recipeType,
    required this.onChanged,
  });

  final RecipeType recipeType;
  final Function(RecipeType) onChanged;

  @override
  State<RecipeTypeDropdownFormInput> createState() =>
      _RecipeTypeDropdownFormInputState();
}

class _RecipeTypeDropdownFormInputState
    extends State<RecipeTypeDropdownFormInput> {
  RecipeType _selectedRecipeType = recipeTypes[Types.breakfast]!;

  @override
  void initState() {
    super.initState();
    _selectedRecipeType = widget.recipeType;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.of(context).recipeTypeLabel,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 200,
          child: DropdownButtonFormField(
            value: _selectedRecipeType,
            dropdownColor: Theme.of(context).colorScheme.surfaceBright,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
            ),
            items: recipeTypes.entries
                .map((entry) => DropdownMenuItem(
                      value: entry.value,
                      child:
                          Text(S.of(context).recipeTypeName(entry.value.name)),
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                _selectedRecipeType = value!;
              });
              widget.onChanged(value!);
            },
          ),
        ),
      ],
    );
  }
}
