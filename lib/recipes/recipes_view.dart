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
        name: 'Sandwich au poulet mariné',
        description: RecipeDescription(
          cost: recipeCosts[Costs.low]!,
          difficulty: recipeDifficulties[Difficulties.easy]!,
          time: RecipeTime(minutes: 30),
          type: recipeTypes[Types.lunch]!,
        ),
        ingredients: [
          RecipeIngredient(
            name: 'Baguette',
            quantity: 1,
            unit: units[Units.piece]!,
          ),
          RecipeIngredient(
            name: 'Escalope de poulet',
            quantity: 1,
            unit: units[Units.piece]!,
          ),
          RecipeIngredient(
            name: 'Huile d\'olive',
            quantity: 20,
            unit: units[Units.milliliter]!,
          ),
          RecipeIngredient(
            name: 'Gousse d\'ail',
            quantity: 1,
            unit: units[Units.piece]!,
          ),
          RecipeIngredient(
            name: 'Persil',
            quantity: 20,
            unit: units[Units.gram]!,
          ),
          RecipeIngredient(
            name: 'Jus de citron',
            quantity: 50,
            unit: units[Units.milliliter]!,
          ),
          RecipeIngredient(
            name: 'Mayonnaise',
            quantity: 20,
            unit: units[Units.gram]!,
          ),
          RecipeIngredient(
            name: 'Feuilles de salade',
            quantity: 4,
            unit: units[Units.piece]!,
          ),
          RecipeIngredient(
            name: 'Tomates séchées',
            quantity: 6,
            unit: units[Units.piece]!,
          ),
        ],
        steps: [
          'Hacher l\'ail.',
          'Hacher le persil.',
          'Mélanger le pot de tomates séchées avec le persil, l\'ail, l\'huile d\'olive et le jus de citron.',
          'Faire mariner l\'escalope de poulet pendant au moins 15 minutes.',
          'Faire griller à feu vif l\'escalope de poulet dans une poêle antiadhésive pendant environ 5 minutes.',
          'Couper la baguette en deux.',
          'Tartiner la mayonnaise sur les deux côtés de la baguette.',
          'Disposer les feuilles de salade sur la baguette.',
          'Ajouter l\'escalope de poulet grillée coupée en lamelles.',
          'Ajouter la préparation de tomates séchées.',
          'Ajouter les feuilles de salade.',
          'Refermer la baguette.',
          'Déguster !',
        ],
      ),
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
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      // add recipe form
                    },
                    icon: Icon(
                      Icons.add,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.filter_list,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ],
              )
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
