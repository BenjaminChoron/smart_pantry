import 'package:flutter/material.dart';

enum Categories {
  fruits,
  fish,
  dairy,
  bakery,
  butcher,
  drinks,
  snacks,
  frozen,
  fresh,
  grocery,
  other
}

class Category {
  const Category({
    required this.name,
    required this.icon,
  });

  final String name;
  final IconData icon;
}
