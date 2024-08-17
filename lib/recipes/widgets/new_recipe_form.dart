import 'package:flutter/material.dart';
import 'package:smart_pantry/generated/l10n.dart';
import 'package:smart_pantry/globals/widgets/text_form_input.dart';
import 'package:smart_pantry/recipes/data/recipe_costs.dart';
import 'package:smart_pantry/recipes/data/recipe_difficulties.dart';
import 'package:smart_pantry/recipes/data/recipe_types.dart';
import 'package:smart_pantry/recipes/models/recipe_cost.dart';
import 'package:smart_pantry/recipes/models/recipe_difficulty.dart';
import 'package:smart_pantry/recipes/models/recipe_type.dart';
import 'package:smart_pantry/recipes/widgets/recipe_cost_dropdown_form_input.dart';
import 'package:smart_pantry/recipes/widgets/recipe_difficulty_dropdown_form_input.dart';
import 'package:smart_pantry/recipes/widgets/recipe_time_form_input.dart';
import 'package:smart_pantry/recipes/widgets/recipe_type_dropdown_form_input.dart';

class NewRecipeForm extends StatefulWidget {
  const NewRecipeForm({super.key});

  @override
  State<NewRecipeForm> createState() => _NewRecipeFormState();
}

class _NewRecipeFormState extends State<NewRecipeForm> {
  final _formKey = GlobalKey<FormState>();
  String _enteredName = '';
  RecipeType _selectedRecipeType = recipeTypes[Types.breakfast]!;
  RecipeDifficulty _selectedRecipeDifficulty =
      recipeDifficulties[Difficulties.easy]!;
  RecipeCost _selectedRecipeCost = recipeCosts[Costs.low]!;
  int _hours = 0;
  int _minutes = 0;

  void _saveRecipe() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print('Name: $_enteredName');
      print('Type: ${_selectedRecipeType.name}');
      print('Difficulty: ${_selectedRecipeDifficulty.name}');
      print('Cost: ${_selectedRecipeCost.name}');
      print('Time: $_hours hours $_minutes minutes');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormInput(
            initialValue: _enteredName,
            label: S.of(context).nameLabel,
            onSaved: (value) {
              _enteredName = value;
            },
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).colorScheme.onSurface,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [
                Text(
                  S.of(context).recipeDescription,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontWeight: FontWeight.bold),
                ),
                Divider(
                  color: Theme.of(context).colorScheme.onSurface,
                  height: 20,
                  thickness: 1,
                ),
                RecipeTypeDropdownFormInput(
                  recipeType: _selectedRecipeType,
                  onChanged: (value) {
                    _selectedRecipeType = value;
                  },
                ),
                RecipeDifficultyDropdownFormInput(
                  recipeDifficulty: _selectedRecipeDifficulty,
                  onChanged: (value) {
                    _selectedRecipeDifficulty = value;
                  },
                ),
                RecipeCostDropdownFormInput(
                  recipeCost: _selectedRecipeCost,
                  onChanged: (value) {
                    _selectedRecipeCost = value;
                  },
                ),
                const SizedBox(height: 10),
                RecipeTimeFormInput(
                  hours: _hours,
                  minutes: _minutes,
                  onHoursSaved: (value) {
                    _hours = value;
                  },
                  onMinutesSaved: (value) {
                    _minutes = value;
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  _formKey.currentState!.reset();
                },
                child: Text(S.of(context).reset),
              ),
              const SizedBox(width: 12),
              ElevatedButton(
                onPressed: () => _saveRecipe,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                child: Text(
                  S.of(context).add,
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
