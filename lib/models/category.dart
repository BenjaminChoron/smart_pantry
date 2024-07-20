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
    required this.color,
    required this.icon,
    required this.screen,
  });

  final String name;
  final Color color;
  final IconData icon;
  final Widget screen;
}
