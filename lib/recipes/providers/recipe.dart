import 'package:path/path.dart' as path;
import 'package:smart_pantry/globals/data/units.dart';
import 'package:smart_pantry/recipes/data/recipe_costs.dart';
import 'package:smart_pantry/recipes/data/recipe_difficulties.dart';
import 'package:smart_pantry/recipes/data/recipe_types.dart';
import 'package:smart_pantry/recipes/models/recipe.dart';
import 'package:smart_pantry/recipes/models/recipe_description.dart';
import 'package:smart_pantry/recipes/models/recipe_ingredient.dart';
import 'package:smart_pantry/recipes/models/recipe_time.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<Database> _getDatabase() async {
  final dbPath = await sql.getDatabasesPath();
  final db = await sql.openDatabase(
    path.join(dbPath, 'recipe.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE recipe(id TEXT PRIMARY KEY, name TEXT, difficulty TEXT, time TEXT, cost TEXT, type TEXT, ingredients TEXT, steps TEXT)',
      );
    },
    version: 1,
  );

  return db;
}

class RecipeNotifier extends StateNotifier<List<Recipe>> {
  RecipeNotifier() : super(const []);

  Future<bool> addItem(
    String name,
    RecipeDescription description,
    List<RecipeIngredient> ingredients,
    String steps,
  ) async {
    final newItem = Recipe(
      name: name,
      description: RecipeDescription(
        cost: description.cost,
        difficulty: description.difficulty,
        time: description.time,
        type: description.type,
      ),
      ingredients: ingredients,
      steps: steps,
    );

    final db = await _getDatabase();

    final result = await db.insert('recipe', {
      'id': newItem.id,
      'name': newItem.name,
      'difficulty': newItem.description.difficulty.name,
      'time':
          '${newItem.description.time.hours}|${newItem.description.time.minutes}',
      'cost': newItem.description.cost.name,
      'type': newItem.description.type.name,
      'ingredients': newItem.ingredients.map((e) {
        return '${e.name}|${e.quantity}|${e.unit.name}';
      }).toString(),
      'steps': newItem.steps,
    });

    if (result == 0) {
      return false;
    }

    state = [...state, newItem];
    return true;
  }

  Future<void> loadItems() async {
    final db = await _getDatabase();
    final data = await db.query('recipe');
    final items = data
        .map(
          (row) => Recipe(
            id: row['id'] as String,
            name: row['name'] as String,
            description: RecipeDescription(
              cost: recipeCosts.values.firstWhere(
                (cost) => cost.name == row['cost'],
              ),
              difficulty: recipeDifficulties.values.firstWhere(
                (difficulty) => difficulty.name == row['difficulty'],
              ),
              time: RecipeTime(
                // row['time] format => "hours|minutes"
                hours: int.parse((row['time'] as String).split('|')[0]),
                minutes: int.parse((row['time'] as String).split('|')[1]),
              ),
              type: recipeTypes.values.firstWhere(
                (type) => type.name == row['type'],
              ),
            ),
            // row['steps] format => (name|quantity|unitName, name|quantity|unitName)
            ingredients: ((row['ingredients'] as String)
                    .replaceAll('(', '')
                    .replaceAll(')', '')
                    .split(', '))
                .map(
                  (e) => RecipeIngredient(
                    name: e.split('|')[0],
                    quantity: double.parse(e.split('|')[1]),
                    unit: units.values.firstWhere(
                      (unit) => unit.name == e.split('|')[2],
                    ),
                  ),
                )
                .toList(),
            steps: row['steps'] as String,
          ),
        )
        .toList();

    state = items;
  }

  Future<bool> removeItem(Recipe recipe) async {
    final db = await _getDatabase();
    final result =
        await db.delete('recipe', where: 'id = ?', whereArgs: [recipe.id]);

    if (result == 1) {
      state = state.where((element) => element.id != recipe.id).toList();
      return true;
    }

    return false;
  }
}

final recipeProvider = StateNotifierProvider<RecipeNotifier, List<Recipe>>(
  (ref) => RecipeNotifier(),
);
