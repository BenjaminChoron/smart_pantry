import 'package:flutter/material.dart';
import 'package:smart_pantry/recipes/models/recipe_cost.dart';

final recipeCosts = {
  Costs.low: RecipeCost(
    name: 'Low',
    icons: [
      Icons.monetization_on,
      Icons.monetization_on_outlined,
      Icons.monetization_on_outlined,
    ],
  ),
  Costs.medium: RecipeCost(
    name: 'Medium',
    icons: [
      Icons.monetization_on,
      Icons.monetization_on,
      Icons.monetization_on_outlined,
    ],
  ),
  Costs.high: RecipeCost(
    name: 'High',
    icons: [
      Icons.monetization_on,
      Icons.monetization_on,
      Icons.monetization_on,
    ],
  ),
};
