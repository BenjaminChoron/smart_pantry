import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:smart_pantry/pantry/providers/user_pantry.dart';
import 'package:smart_pantry/recipes/models/recipe.dart';
import 'package:smart_pantry/recipes/widgets/recipe_details.dart';

class RecipeDetailsView extends ConsumerStatefulWidget {
  const RecipeDetailsView({super.key, required this.recipe});

  final Recipe recipe;

  @override
  ConsumerState<RecipeDetailsView> createState() => _RecipeDetailsViewState();
}

class _RecipeDetailsViewState extends ConsumerState<RecipeDetailsView> {
  late Future<void> _allItems;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _allItems = ref.watch(userPantryProvider.notifier).loadItems();
  }

  @override
  Widget build(BuildContext context) {
    final allItems = ref.watch(userPantryProvider);

    final pantryItemsNames =
        allItems.map((item) => item.name.toLowerCase()).toList();

    final missingIngredients = widget.recipe.ingredients
        .where((ingredient) =>
            !pantryItemsNames.contains(ingredient.name.toLowerCase()))
        .toList();

    final stockedIngredients = widget.recipe.ingredients
        .where((ingredient) =>
            pantryItemsNames.contains(ingredient.name.toLowerCase()))
        .toList();

    final ingredientsStockedInGoodQuantity = stockedIngredients
        .where(
          (e) =>
              allItems
                      .firstWhere((element) =>
                          element.name.toLowerCase() == e.name.toLowerCase())
                      .quantity >=
                  e.quantity &&
              allItems
                      .firstWhere((element) =>
                          element.name.toLowerCase() == e.name.toLowerCase())
                      .unit
                      .symbol ==
                  e.unit.symbol,
        )
        .toList();

    final notEnoughStock = stockedIngredients
        .where((element) => !ingredientsStockedInGoodQuantity.contains(element))
        .toList();

    return Scaffold(
      body: FutureBuilder(
        future: _allItems,
        builder: (context, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? const Center(child: CircularProgressIndicator())
                : RecipeDetails(
                    recipe: widget.recipe,
                    ingredientsStockedInGoodQuantity:
                        ingredientsStockedInGoodQuantity,
                    notEnoughStock: notEnoughStock,
                    missingIngredients: missingIngredients,
                  ),
      ),
    );
  }
}
