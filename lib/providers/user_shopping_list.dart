import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:smart_pantry/models/shopping_item.dart';
import 'package:smart_pantry/models/category.dart';
import 'package:smart_pantry/models/unit.dart';
import 'package:smart_pantry/data/categories.dart';
import 'package:smart_pantry/data/units.dart';

Future<Database> _getDatabase() async {
  final dbPath = await sql.getDatabasesPath();
  final db = await sql.openDatabase(
    path.join(dbPath, 'shopping_list.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE user_shopping_list(id TEXT PRIMARY KEY, name TEXT, category TEXT, quantity INTEGER, unit TEXT)',
      );
    },
    version: 1,
  );

  return db;
}

class UserShoppingListNotifier extends StateNotifier<List<ShoppingItem>> {
  UserShoppingListNotifier() : super(const []);

  Future<bool> addItem(
    String name,
    Category category,
    int quantity,
    Unit unit,
  ) async {
    final newItem = ShoppingItem(
      name: name,
      category: category,
      quantity: quantity,
      unit: unit,
    );

    final db = await _getDatabase();

    final result = await db.insert('user_shopping_list', {
      'id': newItem.id,
      'name': newItem.name,
      'category': newItem.category.name,
      'quantity': newItem.quantity,
      'unit': newItem.unit.name,
    });

    if (result == 0) {
      return false;
    }

    state = [...state, newItem];
    return true;
  }

  Future<void> loadItems() async {
    final db = await _getDatabase();
    final data = await db.query('user_shopping_list');
    final items = data
        .map(
          (row) => ShoppingItem(
            id: row['id'] as String,
            name: row['name'] as String,
            category: categories.values.firstWhere(
              (category) => category.name == row['category'],
            ),
            quantity: row['quantity'] as int,
            unit: units.values.firstWhere(
              (unit) => unit.name == row['unit'],
            ),
          ),
        )
        .toList();

    state = items;
  }
}

final userShoppingListProvider =
    StateNotifierProvider<UserShoppingListNotifier, List<ShoppingItem>>(
  (ref) => UserShoppingListNotifier(),
);
