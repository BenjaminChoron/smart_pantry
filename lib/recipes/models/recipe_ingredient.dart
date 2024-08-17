import 'package:smart_pantry/globals/models/unit.dart';

class RecipeIngredient {
  RecipeIngredient({
    required this.name,
    required this.quantity,
    required this.unit,
  });

  final String name;
  final double quantity;
  final Unit unit;
}
