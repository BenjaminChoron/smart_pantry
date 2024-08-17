import 'package:flutter/material.dart';
import 'package:smart_pantry/recipes/models/recipe_difficulty.dart';

final recipeDifficulties = {
  Difficulties.easy: RecipeDifficulty(
    name: 'easy',
    icons: [
      Icons.star,
      Icons.star_outline,
      Icons.star_outline,
    ],
  ),
  Difficulties.medium: RecipeDifficulty(
    name: 'medium',
    icons: [
      Icons.star,
      Icons.star,
      Icons.star_outline,
    ],
  ),
  Difficulties.hard: RecipeDifficulty(
    name: 'hard',
    icons: [
      Icons.star,
      Icons.star,
      Icons.star,
    ],
  ),
};
