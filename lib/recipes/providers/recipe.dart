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
import 'package:uuid/uuid.dart';

const uuid = Uuid();

Future<Database> _getDatabase() async {
  final dbPath = await sql.getDatabasesPath();
  final db = await sql.openDatabase(
    path.join(dbPath, 'recipe.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE recipe(id TEXT PRIMARY KEY, name TEXT, difficulty TEXT, time TEXT, cost TEXT, type TEXT, steps TEXT); CREATE TABLE ingredient(id TEXT PRIMARY KEY, name TEXT, quantity INT, unit TEXT, recipeId TEXT);',
      );
    },
    version: 1,
  );

  return db;
}

Future<Database> _getIngredientsDatabase() async {
  final dbPath = await sql.getDatabasesPath();
  final db = await sql.openDatabase(
    path.join(dbPath, 'ingredient.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE ingredient(id TEXT PRIMARY KEY, name TEXT, quantity INT, unit TEXT, recipeId TEXT);',
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
    final ingredientDb = await _getIngredientsDatabase();

    final result = await db.insert('recipe', {
      'id': newItem.id,
      'name': newItem.name,
      'difficulty': newItem.description.difficulty.name,
      'time':
          '${newItem.description.time.hours}|${newItem.description.time.minutes}',
      'cost': newItem.description.cost.name,
      'type': newItem.description.type.name,
      'steps': newItem.steps,
    });

    if (result == 0) {
      return false;
    }

    final errors = <int>[];
    ingredients.forEach((ingredient) async {
      final result = await ingredientDb.insert(
        'ingredient',
        {
          'id': uuid.v4(),
          'name': ingredient.name,
          'quantity': ingredient.quantity,
          'unit': ingredient.unit.name,
          'recipeId': newItem.id,
        },
      );

      if (result == 0) {
        errors.add(1);
      }
    });

    if (errors.isNotEmpty) {
      return false;
    }

    state = [...state, newItem];
    return true;
  }

  Future<void> loadItems() async {
    final db = await _getDatabase();
    final ingredientDb = await _getIngredientsDatabase();

    final recipe = await db.query('recipe');
    final ingredients = await ingredientDb.query('ingredient');
    final items = recipe
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
            ingredients: ingredients
                .where(
                  (ingredient) => ingredient['recipeId'] == row['id'],
                )
                .map((ingredient) => RecipeIngredient(
                      name: ingredient['name'] as String,
                      quantity: double.parse(ingredient['quantity'].toString()),
                      unit: units.values.firstWhere(
                          (unit) => unit.name == ingredient['unit']),
                    ))
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
