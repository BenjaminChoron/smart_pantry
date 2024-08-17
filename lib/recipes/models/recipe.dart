import 'package:uuid/uuid.dart';

import 'package:smart_pantry/recipes/models/recipe_description.dart';
import 'package:smart_pantry/recipes/models/recipe_ingredient.dart';

const uuid = Uuid();

class Recipe {
  Recipe({
    required this.name,
    required this.description,
    required this.ingredients,
    required this.steps,
    String? id,
  }) : id = id ?? uuid.v4();

  final String id;
  final String name;
  final RecipeDescription description;
  final List<RecipeIngredient> ingredients;
  final List<String> steps;
}
