import 'package:flutter/material.dart';
import 'package:smart_pantry/generated/l10n.dart';

import 'package:smart_pantry/recipes/models/recipe.dart';
import 'package:smart_pantry/recipes/models/recipe_ingredient.dart';
import 'package:smart_pantry/recipes/widgets/recipe_description_line.dart';
import 'package:smart_pantry/recipes/widgets/recipe_ingredients_list.dart';

class RecipeDetails extends StatelessWidget {
  const RecipeDetails({
    super.key,
    required this.recipe,
    required this.ingredientsStockedInGoodQuantity,
    required this.notEnoughStock,
    required this.missingIngredients,
  });

  final Recipe recipe;
  final List<RecipeIngredient> ingredientsStockedInGoodQuantity;
  final List<RecipeIngredient> notEnoughStock;
  final List<RecipeIngredient> missingIngredients;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Theme.of(context).colorScheme.secondary,
                padding: const EdgeInsets.all(14),
                child: RecipeDescriptionLine(description: recipe.description),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    Text(
                      S.of(context).recipeIngredients,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                    Divider(
                      color: Theme.of(context).colorScheme.onSurface,
                      thickness: 0.2,
                      height: 20,
                    ),
                    Column(
                      children: [
                        RecipeIngredientsList(
                          ingredients: ingredientsStockedInGoodQuantity,
                        ),
                        RecipeIngredientsList(
                          ingredients: notEnoughStock,
                          isNotEnough: true,
                        ),
                        RecipeIngredientsList(
                          ingredients: missingIngredients,
                          isMissing: true,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    Text(
                      S.of(context).recipeSteps,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                    Divider(
                      color: Theme.of(context).colorScheme.onSurface,
                      thickness: 0.2,
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        recipe.steps,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
