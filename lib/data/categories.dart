import 'package:flutter/material.dart';

import 'package:smart_pantry/models/category.dart';

const categories = {
  Categories.fruits: Category(
    name: 'Fruits',
    color: Color(0xFFF44336),
    icon: Icons.local_florist,
    screen: Placeholder(),
  ),
  Categories.vegetables: Category(
    name: 'Vegetables',
    color: Color(0xFF4CAF50),
    icon: Icons.eco,
    screen: Placeholder(),
  ),
  Categories.meat: Category(
    name: 'Meat',
    color: Color(0xFF795548),
    icon: Icons.restaurant,
    screen: Placeholder(),
  ),
  Categories.seafood: Category(
    name: 'Seafood',
    color: Color(0xFF03A9F4),
    icon: Icons.water,
    screen: Placeholder(),
  ),
  Categories.dairy: Category(
    name: 'Dairy',
    color: Color(0xFFFFEB3B),
    icon: Icons.takeout_dining,
    screen: Placeholder(),
  ),
  Categories.bakery: Category(
    name: 'Bakery',
    color: Color(0xFF9C27B0),
    icon: Icons.breakfast_dining,
    screen: Placeholder(),
  ),
  Categories.drinks: Category(
    name: 'Drinks',
    color: Color(0xFF009688),
    icon: Icons.local_drink,
    screen: Placeholder(),
  ),
  Categories.snacks: Category(
    name: 'Snacks',
    color: Color(0xFF607D8B),
    icon: Icons.fastfood,
    screen: Placeholder(),
  ),
  Categories.frozen: Category(
    name: 'Frozen',
    color: Color(0xFF2196F3),
    icon: Icons.ac_unit,
    screen: Placeholder(),
  ),
  Categories.other: Category(
    name: 'Other',
    color: Color(0xFFE91E63),
    icon: Icons.category,
    screen: Placeholder(),
  ),
};
