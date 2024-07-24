import 'package:flutter/material.dart';

import 'package:smart_pantry/globals/models/category.dart';

const categories = {
  Categories.fruits: Category(
    name: 'Fruits',
    icon: Icons.eco,
  ),
  Categories.fresh: Category(
    name: 'Fresh',
    icon: Icons.kitchen,
  ),
  Categories.grocery: Category(
    name: 'Grocery',
    icon: Icons.shopping_basket,
  ),
  Categories.butcher: Category(
    name: 'Butcher',
    icon: Icons.restaurant,
  ),
  Categories.fish: Category(
    name: 'Fish',
    icon: Icons.water,
  ),
  Categories.dairy: Category(
    name: 'Dairy',
    icon: Icons.takeout_dining,
  ),
  Categories.bakery: Category(
    name: 'Bakery',
    icon: Icons.breakfast_dining,
  ),
  Categories.snacks: Category(
    name: 'Snacks',
    icon: Icons.fastfood,
  ),
  Categories.drinks: Category(
    name: 'Drinks',
    icon: Icons.local_drink,
  ),
  Categories.frozen: Category(
    name: 'Frozen',
    icon: Icons.ac_unit,
  ),
  Categories.other: Category(
    name: 'Other',
    icon: Icons.category,
  ),
};
