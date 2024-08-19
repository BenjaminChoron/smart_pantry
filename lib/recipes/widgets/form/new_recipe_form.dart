import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_pantry/generated/l10n.dart';
import 'package:smart_pantry/globals/widgets/text_form_input.dart';
import 'package:smart_pantry/recipes/data/recipe_costs.dart';
import 'package:smart_pantry/recipes/data/recipe_difficulties.dart';
import 'package:smart_pantry/recipes/data/recipe_types.dart';
import 'package:smart_pantry/recipes/models/recipe_cost.dart';
import 'package:smart_pantry/recipes/models/recipe_description.dart';
import 'package:smart_pantry/recipes/models/recipe_difficulty.dart';
import 'package:smart_pantry/recipes/models/recipe_ingredient.dart';
import 'package:smart_pantry/recipes/models/recipe_time.dart';
import 'package:smart_pantry/recipes/models/recipe_type.dart';
import 'package:smart_pantry/recipes/providers/recipe.dart';
import 'package:smart_pantry/recipes/widgets/form/recipe_cost_dropdown_form_input.dart';
import 'package:smart_pantry/recipes/widgets/form/recipe_difficulty_dropdown_form_input.dart';
import 'package:smart_pantry/recipes/widgets/form/recipe_ingredients_input.dart';
import 'package:smart_pantry/recipes/widgets/form/recipe_time_form_input.dart';
import 'package:smart_pantry/recipes/widgets/form/recipe_type_dropdown_form_input.dart';

class NewRecipeForm extends ConsumerStatefulWidget {
  const NewRecipeForm({super.key});

  @override
  ConsumerState<NewRecipeForm> createState() => _NewRecipeFormState();
}

class _NewRecipeFormState extends ConsumerState<NewRecipeForm> {
  final _formKey = GlobalKey<FormState>();
  String _enteredName = '';
  RecipeType _selectedRecipeType = recipeTypes[Types.breakfast]!;
  RecipeDifficulty _selectedRecipeDifficulty =
      recipeDifficulties[Difficulties.easy]!;
  RecipeCost _selectedRecipeCost = recipeCosts[Costs.low]!;
  int _hours = 0;
  int _minutes = 0;
  List<RecipeIngredient> _enteredIngredients = [];
  String _enteredSteps = '';
  bool _clearIngredients = false;

  bool _stepsInputIsFocus = false;
  bool _isSending = false;

  void _saveRecipe() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSending = true;
      });

      _formKey.currentState!.save();

      final result = await ref.read(recipeProvider.notifier).addItem(
            _enteredName,
            RecipeDescription(
              type: _selectedRecipeType,
              difficulty: _selectedRecipeDifficulty,
              cost: _selectedRecipeCost,
              time: RecipeTime(
                hours: _hours,
                minutes: _minutes,
              ),
            ),
            _enteredIngredients,
            _enteredSteps,
          );

      if (!result) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(S.of(context).failedToAddItem),
            backgroundColor: Theme.of(context).colorScheme.error,
            duration: const Duration(seconds: 2),
          ),
        );

        return;
      }

      setState(() {
        _isSending = false;
      });

      Navigator.of(context).pop();
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
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).colorScheme.onSurface,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: RecipeTypeDropdownFormInput(
                        recipeType: _selectedRecipeType,
                        onChanged: (value) {
                          _selectedRecipeType = value;
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: RecipeTimeFormInput(
                        hours: _hours,
                        minutes: _minutes,
                        onHoursSaved: (value) {
                          _hours = value;
                        },
                        onMinutesSaved: (value) {
                          _minutes = value;
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: RecipeCostDropdownFormInput(
                        recipeCost: _selectedRecipeCost,
                        onChanged: (value) {
                          _selectedRecipeCost = value;
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: RecipeDifficultyDropdownFormInput(
                        recipeDifficulty: _selectedRecipeDifficulty,
                        onChanged: (value) {
                          _selectedRecipeDifficulty = value;
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          RecipeIngredientsInput(
            initialValues: _enteredIngredients,
            onValidate: (value) {
              _enteredIngredients = value;
            },
            clearIngredients: _clearIngredients,
          ),
          const SizedBox(height: 20),
          TextFormField(
            initialValue: '',
            onTap: () => setState(() {
              _stepsInputIsFocus = true;
            }),
            onTapOutside: (event) => setState(() {
              _stepsInputIsFocus = false;
            }),
            maxLines: _stepsInputIsFocus ? 10 : 1,
            decoration: InputDecoration(
              label: Text(
                S.of(context).stepsLabel,
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
            validator: (value) {
              if (value == null || value.isEmpty || value.trim().length <= 1) {
                return S.of(context).mustHaveCharacters;
              }
              return null;
            },
            onSaved: (value) {
              _enteredSteps = value!;
            },
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  _formKey.currentState!.reset();
                  _enteredIngredients.clear();
                  setState(() {
                    _clearIngredients = true;
                  });
                },
                child: Text(S.of(context).reset),
              ),
              const SizedBox(width: 12),
              ElevatedButton(
                onPressed: _isSending ? null : _saveRecipe,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                child: _isSending
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(),
                      )
                    : Text(
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
