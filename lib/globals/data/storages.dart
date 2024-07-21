import 'package:flutter/material.dart';

import 'package:smart_pantry/globals/models/storage.dart';
import 'package:smart_pantry/pantry/widgets/cupboard.dart';
import 'package:smart_pantry/pantry/widgets/freezer.dart';
import 'package:smart_pantry/pantry/widgets/fridge.dart';

const storages = {
  Storages.fridge: Storage(
    name: 'Fridge',
    icon: Icons.kitchen,
    color: Color(0xFF4CAF50),
    screen: FridgeScreen(),
  ),
  Storages.freezer: Storage(
    name: 'Freezer',
    icon: Icons.ac_unit,
    color: Color(0xFF03A9F4),
    screen: FreezerScreen(),
  ),
  Storages.cupboard: Storage(
    name: 'Cupboard',
    icon: Icons.local_cafe,
    color: Color(0xFFFF9800),
    screen: CupboardScreen(),
  ),
};
