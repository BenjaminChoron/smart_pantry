import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:smart_pantry/pantry/models/pantry_item.dart';
import 'package:smart_pantry/globals/models/storage.dart';
import 'package:smart_pantry/globals/models/unit.dart';
import 'package:smart_pantry/globals/data/storages.dart';
import 'package:smart_pantry/globals/data/units.dart';

Future<Database> _getDatabase() async {
  final dbPath = await sql.getDatabasesPath();
  final db = await sql.openDatabase(
    path.join(dbPath, 'pantry.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE user_pantry(id TEXT PRIMARY KEY, name TEXT, storage TEXT, quantity INTEGER, unit TEXT)',
      );
    },
    version: 1,
  );

  return db;
}

class UserPantryNotifier extends StateNotifier<List<PantryItem>> {
  UserPantryNotifier() : super(const []);

  Future<bool> addItem(
      String name, Storage storage, int quantity, Unit unit) async {
    final newItem = PantryItem(
        name: name, storage: storage, quantity: quantity, unit: unit);

    final db = await _getDatabase();

    final result = await db.insert('user_pantry', {
      'id': newItem.id,
      'name': newItem.name,
      'storage': newItem.storage.name,
      'quantity': newItem.quantity,
      'unit': newItem.unit.name,
    });

    if (result == 0) {
      return false;
    }

    state = [...state, newItem];
    return true;
  }

  Future<bool> updateItem(PantryItem item) async {
    final db = await _getDatabase();
    final result = await db.update(
      'user_pantry',
      {
        'name': item.name,
        'storage': item.storage.name,
        'quantity': item.quantity,
        'unit': item.unit.name,
      },
      where: 'id = ?',
      whereArgs: [item.id],
    );

    if (result == 0) {
      return false;
    }

    state = state.map((element) {
      if (element.id == item.id) {
        return item;
      }

      return element;
    }).toList();

    return true;
  }

  Future<bool> removeItem(PantryItem item) async {
    final db = await _getDatabase();
    final result =
        await db.delete('user_pantry', where: 'id = ?', whereArgs: [item.id]);

    if (result == 1) {
      state = state.where((element) => element.id != item.id).toList();
      return true;
    }

    return false;
  }

  Future<void> loadItems() async {
    final db = await _getDatabase();
    final data = await db.query('user_pantry', orderBy: 'storage');
    final items = data
        .map(
          (row) => PantryItem(
            id: row['id'] as String,
            name: row['name'] as String,
            storage: storages.values.firstWhere(
              (storage) => storage.name == row['storage'],
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

  Future<void> loadStorageItems(Storage storage) async {
    final db = await _getDatabase();
    final data = await db
        .query('user_pantry', where: 'storage = ?', whereArgs: [storage.name]);
    final items = data
        .map(
          (row) => PantryItem(
            id: row['id'] as String,
            name: row['name'] as String,
            storage: storages.values.firstWhere(
              (storage) => storage.name == row['storage'],
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

final userPantryProvider =
    StateNotifierProvider<UserPantryNotifier, List<PantryItem>>(
  (ref) => UserPantryNotifier(),
);
