import 'package:flutter/material.dart';

import 'package:smart_pantry/globals/models/storage.dart';

const storages = {
  Storages.fridge: Storage(
    name: 'Fridge',
    icon: Icons.kitchen,
    color: Color(0xFF4CAF50),
  ),
  Storages.freezer: Storage(
    name: 'Freezer',
    icon: Icons.ac_unit,
    color: Color(0xFF03A9F4),
  ),
  Storages.cupboard: Storage(
    name: 'Cupboard',
    icon: Icons.local_cafe,
    color: Color(0xFFFF9800),
  ),
};
