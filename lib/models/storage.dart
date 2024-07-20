import 'package:flutter/material.dart';

enum Storages {
  fridge,
  freezer,
  cupboard,
}

class Storage {
  const Storage({
    required this.name,
    required this.icon,
    required this.color,
    required this.screen,
  });

  final String name;
  final IconData icon;
  final String color;
  final Widget screen;
}
