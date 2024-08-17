import 'package:flutter/material.dart';

enum Costs {
  low,
  medium,
  high,
}

class RecipeCost {
  RecipeCost({
    required this.name,
    required this.icons,
  });

  final String name;
  final List<IconData> icons;
}
