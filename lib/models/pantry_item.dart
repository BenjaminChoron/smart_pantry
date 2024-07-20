import 'package:uuid/uuid.dart';

import 'package:smart_pantry/models/storage.dart';
import 'package:smart_pantry/models/unit.dart';

const uuid = Uuid();

class PantryItem {
  PantryItem({
    required this.storage,
    required this.name,
    required this.quantity,
    required this.unit,
    String? id,
  }) : id = id ?? uuid.v4();

  final String id;
  final Storage storage;
  final String name;
  final int quantity;
  final Unit unit;
}
