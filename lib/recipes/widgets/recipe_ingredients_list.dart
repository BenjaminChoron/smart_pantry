import 'package:flutter/material.dart';
import 'package:smart_pantry/generated/l10n.dart';
import 'package:smart_pantry/globals/data/categories.dart';
import 'package:smart_pantry/globals/models/category.dart';
import 'package:smart_pantry/pantry/pantry_view.dart';
import 'package:smart_pantry/recipes/models/recipe_ingredient.dart';
import 'package:smart_pantry/shopping_list/models/shopping_item.dart';
import 'package:smart_pantry/shopping_list/widgets/shopping_list_item_form.dart';

class RecipeIngredientsList extends StatelessWidget {
  const RecipeIngredientsList({
    super.key,
    required this.ingredients,
    this.isNotEnough = false,
    this.isMissing = false,
  });

  final List<RecipeIngredient> ingredients;
  final bool isNotEnough;
  final bool isMissing;

  Icon get _icon {
    if (isMissing) {
      return const Icon(Icons.error, color: Color.fromARGB(255, 172, 29, 29));
    }
    if (isNotEnough) {
      return const Icon(Icons.warning, color: Color.fromARGB(255, 255, 152, 0));
    }
    return const Icon(Icons.check, color: Color.fromARGB(255, 0, 172, 29));
  }

  @override
  Widget build(BuildContext context) {
    void showBottomSheet(ShoppingItem item) {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      S.of(context).addShoppingListItem,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                    const SizedBox(height: 20),
                    ShoppingListItemForm(item: item),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }

    return Column(
      children: ingredients
          .map(
            (ingredient) => InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () {
                if (isMissing) {
                  showBottomSheet(
                    ShoppingItem(
                      name: ingredient.name,
                      category: categories[Categories.other]!,
                      quantity: ingredient.quantity.toInt(),
                      unit: ingredient.unit,
                    ),
                  );
                }

                if (isNotEnough) {
                  Navigator.of(context).pop();
                  Navigator.of(context).popAndPushNamed(PantryView.routeName);
                }
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    Text(
                      ingredient.name,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                    const Spacer(),
                    Text(
                      '${ingredient.quantity} ${ingredient.unit.symbol}',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                    const SizedBox(width: 8),
                    _icon,
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
