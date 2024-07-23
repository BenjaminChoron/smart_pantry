import 'package:flutter/material.dart';

import 'package:smart_pantry/globals/models/category.dart';

const categories = {
  Categories.fruits: Category(
    name: 'Fruits',
    color: Color(0xFF4CAF50),
    icon: Icons.eco,
  ),
  Categories.fresh: Category(
    name: 'Fresh',
    color: Color.fromARGB(255, 109, 200, 241),
    icon: Icons.kitchen,
  ),
  Categories.grocery: Category(
    name: 'Grocery',
    color: Color(0xFF795548),
    icon: Icons.shopping_basket,
  ),
  Categories.butcher: Category(
    name: 'Butcher',
    color: Color.fromARGB(255, 218, 86, 86),
    icon: Icons.restaurant,
  ),
  Categories.fish: Category(
    name: 'Fish',
    color: Color(0xFF03A9F4),
    icon: Icons.water,
  ),
  Categories.dairy: Category(
    name: 'Dairy',
    color: Color.fromARGB(255, 227, 210, 58),
    icon: Icons.takeout_dining,
  ),
  Categories.bakery: Category(
    name: 'Bakery',
    color: Color.fromARGB(255, 180, 138, 103),
    icon: Icons.breakfast_dining,
  ),
  Categories.snacks: Category(
    name: 'Snacks',
    color: Color(0xFF607D8B),
    icon: Icons.fastfood,
  ),
  Categories.drinks: Category(
    name: 'Drinks',
    color: Color(0xFF009688),
    icon: Icons.local_drink,
  ),
  Categories.frozen: Category(
    name: 'Frozen',
    color: Color(0xFF2196F3),
    icon: Icons.ac_unit,
  ),
  Categories.other: Category(
    name: 'Other',
    color: Color(0xFFE91E63),
    icon: Icons.category,
  ),
};
