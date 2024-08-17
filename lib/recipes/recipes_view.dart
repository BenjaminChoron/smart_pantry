import 'package:flutter/material.dart';
import 'package:smart_pantry/generated/l10n.dart';
import 'package:smart_pantry/globals/data/units.dart';
import 'package:smart_pantry/globals/models/unit.dart';
import 'package:smart_pantry/globals/widgets/expiration_icon.dart';
import 'package:smart_pantry/pantry/pantry_view.dart';
import 'package:smart_pantry/recipes/data/recipe_costs.dart';
import 'package:smart_pantry/recipes/data/recipe_difficulties.dart';
import 'package:smart_pantry/recipes/data/recipe_types.dart';
import 'package:smart_pantry/recipes/models/recipe.dart';
import 'package:smart_pantry/recipes/models/recipe_cost.dart';
import 'package:smart_pantry/recipes/models/recipe_description.dart';
import 'package:smart_pantry/recipes/models/recipe_difficulty.dart';
import 'package:smart_pantry/recipes/models/recipe_ingredient.dart';
import 'package:smart_pantry/recipes/models/recipe_time.dart';
import 'package:smart_pantry/recipes/models/recipe_type.dart';
import 'package:smart_pantry/recipes/widgets/recipe_card.dart';
import 'package:smart_pantry/settings/settings_view.dart';
import 'package:smart_pantry/shopping_list/shopping_list_view.dart';

class RecipesView extends StatelessWidget {
  const RecipesView({super.key});

  static const routeName = '/recipes';

  @override
  Widget build(BuildContext context) {
    final items = [
      Recipe(
        name: 'Test',
        description: RecipeDescription(
          cost: recipeCosts[Costs.medium]!,
          difficulty: recipeDifficulties[Difficulties.medium]!,
          time: RecipeTime(minutes: 30),
          type: recipeTypes[Types.breakfast]!,
        ),
        ingredients: [
          RecipeIngredient(
            name: 'Test',
            quantity: 100,
            unit: units[Units.gram]!,
          ),
          RecipeIngredient(
            name: 'Toto',
            quantity: 1,
            unit: units[Units.liter]!,
          ),
          RecipeIngredient(
            name: 'Hello',
            quantity: 2,
            unit: units[Units.piece]!,
          ),
        ],
        steps: [
          'Aliqua ipsum et sint cillum qui eu nulla in eiusmod nulla commodo nulla deserunt.',
          'Non non nisi velit duis eu dolore tempor.',
          'Esse aliquip magna dolore duis exercitation elit laboris reprehenderit occaecat aute Lorem qui.',
        ],
      ),
      Recipe(
        name: 'Toto',
        description: RecipeDescription(
          cost: recipeCosts[Costs.low]!,
          difficulty: recipeDifficulties[Difficulties.hard]!,
          time: RecipeTime(minutes: 45, hours: 1),
          type: recipeTypes[Types.dinner]!,
        ),
        ingredients: [
          RecipeIngredient(
            name: 'Test',
            quantity: 100,
            unit: units[Units.gram]!,
          ),
          RecipeIngredient(
            name: 'Toto',
            quantity: 1,
            unit: units[Units.liter]!,
          ),
          RecipeIngredient(
            name: 'Hello',
            quantity: 2,
            unit: units[Units.piece]!,
          ),
        ],
        steps: [
          'Amet officia duis ea proident fugiat.',
          'Dolore mollit cupidatat officia esse consequat commodo voluptate ex et exercitation amet cupidatat fugiat.',
          'Eiusmod do amet velit mollit pariatur non commodo ea tempor eiusmod cupidatat reprehenderit.',
        ],
      ),
      Recipe(
        name: 'Pouloulou',
        description: RecipeDescription(
          cost: recipeCosts[Costs.high]!,
          difficulty: recipeDifficulties[Difficulties.easy]!,
          time: RecipeTime(minutes: 15, hours: 2),
          type: recipeTypes[Types.lunch]!,
        ),
        ingredients: [
          RecipeIngredient(
            name: 'Test',
            quantity: 100,
            unit: units[Units.gram]!,
          ),
          RecipeIngredient(
            name: 'Toto',
            quantity: 1,
            unit: units[Units.liter]!,
          ),
          RecipeIngredient(
            name: 'Hello',
            quantity: 2,
            unit: units[Units.piece]!,
          ),
        ],
        steps: [
          'Culpa commodo elit nisi commodo laborum officia.',
          'Occaecat consectetur proident qui cillum nulla officia reprehenderit est.',
          'Occaecat veniam adipisicing ut enim veniam veniam do anim ad ad nisi labore.',
        ],
      )
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          S.of(context).recipesTitle,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onPrimary),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(SettingsView.routeName);
            },
            icon: Icon(
              Icons.settings,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(PantryView.routeName);
                    },
                    icon: Icon(
                      Icons.kitchen,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(ShoppingListView.routeName);
                    },
                    icon: Icon(
                      Icons.shopping_cart,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                  const ExpirationIcon(),
                ],
              ),
              IconButton(
                onPressed: () {
                  // add recipe form
                },
                icon: Icon(
                  Icons.add,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return RecipeCard(recipe: items[index]);
            },
          ),
        ),
      ),
    );
  }
}
