import 'package:smart_pantry/recipes/models/recipe_cost.dart';
import 'package:smart_pantry/recipes/models/recipe_difficulty.dart';
import 'package:smart_pantry/recipes/models/recipe_time.dart';
import 'package:smart_pantry/recipes/models/recipe_type.dart';

class RecipeDescription {
  RecipeDescription({
    required this.difficulty,
    required this.time,
    required this.cost,
    required this.type,
  });

  final RecipeDifficulty difficulty;
  final RecipeTime time;
  final RecipeCost cost;
  final RecipeType type;
}
