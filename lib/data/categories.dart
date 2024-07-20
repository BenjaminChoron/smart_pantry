import 'package:flutter/material.dart';

import 'package:smart_pantry/models/category.dart';

const categories = {
  Categories.fruits: Category(
    name: 'Fruits',
    color: Color(0xFFF44336),
    screen: Placeholder(),
  ),
  Categories.vegetables: Category(
    name: 'Vegetables',
    color: Color(0xFF4CAF50),
    screen: Placeholder(),
  ),
  Categories.meat: Category(
    name: 'Meat',
    color: Color(0xFF795548),
    screen: Placeholder(),
  ),
  Categories.seafood: Category(
    name: 'Seafood',
    color: Color(0xFF03A9F4),
    screen: Placeholder(),
  ),
  Categories.dairy: Category(
    name: 'Dairy',
    color: Color(0xFFFFEB3B),
    screen: Placeholder(),
  ),
  Categories.bakery: Category(
    name: 'Bakery',
    color: Color(0xFF9C27B0),
    screen: Placeholder(),
  ),
  Categories.drinks: Category(
    name: 'Drinks',
    color: Color(0xFF009688),
    screen: Placeholder(),
  ),
};
