import 'package:flutter/material.dart';

enum Categories {
  fruits,
  vegetables,
  meat,
  seafood,
  dairy,
  bakery,
  drinks,
}

class Category {
  const Category({
    required this.name,
    required this.icon,
    required this.color,
    required this.screen,
  });

  final String name;
  final IconData icon;
  final Color color;
  final Widget screen;
}
