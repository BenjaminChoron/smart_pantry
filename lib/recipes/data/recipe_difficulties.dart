import 'package:flutter/material.dart';
import 'package:smart_pantry/recipes/models/recipe_difficulty.dart';

final recipeDifficulties = {
  Difficulties.easy: RecipeDifficulty(
    name: 'Easy',
    icons: [
      Icons.star,
      Icons.star_outline,
      Icons.star_outline,
    ],
  ),
  Difficulties.medium: RecipeDifficulty(
    name: 'Medium',
    icons: [
      Icons.star,
      Icons.star,
      Icons.star_outline,
    ],
  ),
  Difficulties.hard: RecipeDifficulty(
    name: 'Hard',
    icons: [
      Icons.star,
      Icons.star,
      Icons.star,
    ],
  ),
};
