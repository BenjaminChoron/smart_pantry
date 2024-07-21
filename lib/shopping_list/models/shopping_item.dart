import 'package:uuid/uuid.dart';

import 'package:smart_pantry/globals/models/category.dart';
import 'package:smart_pantry/globals/models/unit.dart';

const uuid = Uuid();

class ShoppingItem {
  ShoppingItem({
    required this.name,
    required this.category,
    required this.quantity,
    required this.unit,
    String? id,
  }) : id = id ?? uuid.v4();

  final String id;
  final String name;
  final Category category;
  final int quantity;
  final Unit unit;
}
