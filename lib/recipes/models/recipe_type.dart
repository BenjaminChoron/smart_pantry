import 'package:flutter/material.dart';

enum Types {
  breakfast,
  lunch,
  dinner,
  snack,
  dessert,
}

class RecipeType {
  RecipeType({
    required this.name,
    required this.icon,
  });

  final String name;
  final IconData icon;
}
