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
  });

  final String name;
  final Icon icon;
  final String color;
}
