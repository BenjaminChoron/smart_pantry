import 'package:flutter/material.dart';

enum Difficulties {
  easy,
  medium,
  hard,
}

class RecipeDifficulty {
  RecipeDifficulty({
    required this.name,
    required this.icons,
  });

  final String name;
  final List<IconData> icons;
}
