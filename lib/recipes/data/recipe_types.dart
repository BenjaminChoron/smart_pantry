import 'package:flutter/material.dart';
import 'package:smart_pantry/recipes/models/recipe_type.dart';

final recipeTypes = {
  Types.breakfast: RecipeType(
    name: 'Breakfast',
    icon: Icons.bakery_dining,
  ),
  Types.mainCourse: RecipeType(
    name: 'MainCourse',
    icon: Icons.dinner_dining,
  ),
  Types.starter: RecipeType(
    name: 'Starter',
    icon: Icons.soup_kitchen,
  ),
  Types.snack: RecipeType(
    name: 'Snack',
    icon: Icons.cookie,
  ),
  Types.dessert: RecipeType(
    name: 'Dessert',
    icon: Icons.icecream,
  ),
  Types.drink: RecipeType(
    name: 'Drink',
    icon: Icons.local_bar,
  ),
};
