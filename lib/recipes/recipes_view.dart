import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:smart_pantry/generated/l10n.dart';
import 'package:smart_pantry/globals/widgets/expiration_icon.dart';
import 'package:smart_pantry/pantry/pantry_view.dart';
import 'package:smart_pantry/recipes/add_new_recipe_view.dart';
import 'package:smart_pantry/recipes/models/recipe.dart';
import 'package:smart_pantry/recipes/providers/recipe.dart';
import 'package:smart_pantry/recipes/widgets/recipes_list.dart';
import 'package:smart_pantry/settings/settings_view.dart';
import 'package:smart_pantry/shopping_list/shopping_list_view.dart';

class RecipesView extends ConsumerStatefulWidget {
  const RecipesView({super.key});

  static const routeName = '/recipes';

  @override
  ConsumerState<RecipesView> createState() => _RecipesViewState();
}

class _RecipesViewState extends ConsumerState<RecipesView> {
  late Future<void> _allRecipes;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _allRecipes = ref.watch(recipeProvider.notifier).loadItems();
  }

  @override
  Widget build(BuildContext context) {
    final allRecipes = ref.watch(recipeProvider);

    void onRemoveItem(Recipe recipe) async {
      final index = allRecipes.indexOf(recipe);

      setState(() {
        allRecipes.remove(recipe);
      });

      final recipes = ref.read(recipeProvider.notifier);
      final result = await recipes.removeItem(recipe);

      if (!result) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(S.of(context).failedToRemoveItem),
            backgroundColor: Theme.of(context).colorScheme.error,
            duration: const Duration(seconds: 2),
          ),
        );
        setState(() {
          allRecipes.insert(index, recipe);
        });
      }
    }

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
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const AddNewRecipeView(),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.add,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      body: FutureBuilder(
        future: _allRecipes,
        builder: (context, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? const Center(child: CircularProgressIndicator())
                : RecipesList(
                    allRecipes: allRecipes,
                    onRemoveItem: onRemoveItem,
                  ),
      ),
    );
  }
}
