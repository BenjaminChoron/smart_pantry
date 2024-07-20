import 'package:flutter/material.dart';

import 'package:smart_pantry/models/storage.dart';

const storages = {
  Storages.fridge: Storage(
    name: 'Fridge',
    icon: Icon(Icons.kitchen),
    color: '#FFC107',
  ),
  Storages.freezer: Storage(
    name: 'Freezer',
    icon: Icon(Icons.ac_unit),
    color: '#03A9F4',
  ),
  Storages.cupboard: Storage(
    name: 'Cupboard',
    icon: Icon(Icons.local_cafe),
    color: '#8BC34A',
  ),
};
