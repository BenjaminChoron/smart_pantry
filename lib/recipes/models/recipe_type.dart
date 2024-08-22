import 'package:flutter/material.dart';

enum Types {
  breakfast,
  mainCourse,
  starter,
  snack,
  dessert,
  drink,
}

class RecipeType {
  RecipeType({
    required this.name,
    required this.icon,
  });

  final String name;
  final IconData icon;
}
