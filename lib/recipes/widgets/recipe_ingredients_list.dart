import 'package:flutter/material.dart';
import 'package:smart_pantry/recipes/models/recipe_ingredient.dart';

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

  Color get _color {
    if (isMissing) {
      return Colors.red;
    }
    if (isNotEnough) {
      return Colors.orange;
    }
    return Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: ingredients
          .map(
            (ingredient) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Text(
                    ingredient.name,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: _color,
                        ),
                  ),
                  const Spacer(),
                  Text(
                    '${ingredient.quantity} ${ingredient.unit.symbol}',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: _color,
                        ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
