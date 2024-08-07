import 'package:uuid/uuid.dart';

import 'package:smart_pantry/globals/models/storage.dart';
import 'package:smart_pantry/globals/models/unit.dart';

const uuid = Uuid();

class PantryItem {
  PantryItem({
    required this.storage,
    required this.name,
    required this.quantity,
    required this.unit,
    this.expiration,
    String? id,
  }) : id = id ?? uuid.v4();

  final String id;
  final Storage storage;
  final String name;
  final int quantity;
  final Unit unit;
  final DateTime? expiration;
}
