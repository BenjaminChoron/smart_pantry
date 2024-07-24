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
  });

  final String name;
  final IconData icon;
}
