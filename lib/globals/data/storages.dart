import 'package:flutter/material.dart';

import 'package:smart_pantry/globals/models/storage.dart';

const storages = {
  Storages.fridge: Storage(
    name: 'Fridge',
    icon: Icons.kitchen,
  ),
  Storages.freezer: Storage(
    name: 'Freezer',
    icon: Icons.ac_unit,
  ),
  Storages.cupboard: Storage(
    name: 'Cupboard',
    icon: Icons.local_cafe,
  ),
};
