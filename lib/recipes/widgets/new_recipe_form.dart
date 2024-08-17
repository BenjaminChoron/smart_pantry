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
import 'package:smart_pantry/recipes/widgets/recipe_type_dropdown_form_input.dart';

class NewRecipeForm extends StatefulWidget {
  const NewRecipeForm({super.key});

  @override
  State<NewRecipeForm> createState() => _NewRecipeFormState();
}

class _NewRecipeFormState extends State<NewRecipeForm> {
  final _formKey = GlobalKey<FormState>();
  String _enteredName = '';

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
                  'Description',
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
                  recipeType: recipeTypes[Types.breakfast]!,
                  onChanged: (value) {},
                ),
                RecipeDifficultyDropdownFormInput(
                  recipeDifficulty: recipeDifficulties[Difficulties.easy]!,
                  onChanged: (value) {},
                ),
                RecipeCostDropdownFormInput(
                  recipeCost: recipeCosts[Costs.low]!,
                  onChanged: (value) {},
                )
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
                onPressed: () {},
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
