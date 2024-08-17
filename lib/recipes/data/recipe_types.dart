import 'package:flutter/material.dart';
import 'package:smart_pantry/recipes/models/recipe_type.dart';

final recipeTypes = {
  Types.breakfast: RecipeType(
    name: 'Breakfast',
    icon: Icons.bakery_dining,
  ),
  Types.lunch: RecipeType(
    name: 'Lunch',
    icon: Icons.lunch_dining,
  ),
  Types.dinner: RecipeType(
    name: 'Dinner',
    icon: Icons.dinner_dining,
  ),
  Types.snack: RecipeType(
    name: 'Snack',
    icon: Icons.cookie,
  ),
  Types.dessert: RecipeType(
    name: 'Dessert',
    icon: Icons.icecream,
  ),
};
