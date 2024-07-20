import 'package:flutter/material.dart';

import 'package:smart_pantry/models/storage.dart';
import 'package:smart_pantry/screens/cupboard.dart';
import 'package:smart_pantry/screens/freezer.dart';
import 'package:smart_pantry/screens/fridge.dart';

const storages = {
  Storages.fridge: Storage(
    name: 'Fridge',
    icon: Icons.kitchen,
    color: '#FFC107',
    screen: FridgeScreen(),
  ),
  Storages.freezer: Storage(
    name: 'Freezer',
    icon: Icons.ac_unit,
    color: '#03A9F4',
    screen: FreezerScreen(),
  ),
  Storages.cupboard: Storage(
    name: 'Cupboard',
    icon: Icons.local_cafe,
    color: '#8BC34A',
    screen: CupboardScreen(),
  ),
};
