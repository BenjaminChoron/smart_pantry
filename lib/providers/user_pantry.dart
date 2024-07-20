import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:smart_pantry/models/pantry_item.dart';
import 'package:smart_pantry/models/storage.dart';
import 'package:smart_pantry/models/unit.dart';
import 'package:smart_pantry/data/storages.dart';
import 'package:smart_pantry/data/units.dart';

Future<Database> _getDatabase() async {
  final dbPath = await sql.getDatabasesPath();
  final db = await sql.openDatabase(
    path.join(dbPath, 'pantry.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE user_pantry(id TEXT PRIMARY KEY, storage TEXT, name TEXT, quantity INTEGER, unit TEXT)',
      );
    },
    version: 1,
  );

  return db;
}

class UserPantryNotifier extends StateNotifier<List<PantryItem>> {
  UserPantryNotifier() : super(const []);

  Future<bool> addItem(
      Storage storage, String name, int quantity, Unit unit) async {
    final newItem = PantryItem(
        storage: storage, name: name, quantity: quantity, unit: unit);

    final db = await _getDatabase();

    final result = await db.insert('user_pantry', {
      'id': newItem.id,
      'place': newItem.storage.name,
      'name': newItem.name,
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
    final data = await db.query('user_pantry');
    final items = data
        .map(
          (row) => PantryItem(
            id: row['id'] as String,
            storage: storages.values.firstWhere(
              (storage) => storage.name == row['storage'],
            ),
            name: row['name'] as String,
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

final userPantryProvider =
    StateNotifierProvider<UserPantryNotifier, List<PantryItem>>(
  (ref) => UserPantryNotifier(),
);
