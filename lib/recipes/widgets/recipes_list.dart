import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smart_pantry/generated/l10n.dart';
import 'package:smart_pantry/globals/widgets/global_alert_dialog.dart';
import 'package:smart_pantry/recipes/data/recipe_costs.dart';
import 'package:smart_pantry/recipes/data/recipe_difficulties.dart';
import 'package:smart_pantry/recipes/data/recipe_types.dart';
import 'package:smart_pantry/recipes/models/recipe.dart';
import 'package:smart_pantry/recipes/models/recipe_cost.dart';
import 'package:smart_pantry/recipes/models/recipe_difficulty.dart';
import 'package:smart_pantry/recipes/models/recipe_type.dart';
import 'package:smart_pantry/recipes/widgets/recipe_card.dart';

class RecipesList extends StatefulWidget {
  const RecipesList({
    super.key,
    required this.allRecipes,
    required this.onRemoveItem,
  });

  final List<Recipe> allRecipes;
  final Function(Recipe) onRemoveItem;

  @override
  State<RecipesList> createState() => _RecipesListState();
}

class _RecipesListState extends State<RecipesList> {
  late List<Recipe> _shownRecipes;

  RecipeType? _recipeType;
  RecipeDifficulty? _recipeDifficulty;
  RecipeCost? _recipeCost;

  void _filterRecipes() {
    setState(() {
      _shownRecipes = widget.allRecipes
          .where(
            (recipe) =>
                (_recipeType == null ||
                    recipe.description.type == _recipeType) &&
                (_recipeDifficulty == null ||
                    recipe.description.difficulty == _recipeDifficulty) &&
                (_recipeCost == null || recipe.description.cost == _recipeCost),
          )
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    _shownRecipes = widget.allRecipes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: SearchBar(
                leading: Icon(
                  Icons.search,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                elevation: const WidgetStatePropertyAll(0),
                backgroundColor: WidgetStatePropertyAll(
                    Theme.of(context).colorScheme.surfaceContainerHigh),
                onChanged: (String searchText) {
                  setState(() {
                    _shownRecipes = widget.allRecipes
                        .where((recipe) => recipe.name
                            .toLowerCase()
                            .contains(searchText.toLowerCase()))
                        .toList();
                  });
                },
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(
                            S.of(context).filterBy,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                ),
                          ),
                          const SizedBox(height: 10),
                          DropdownButtonFormField(
                            value: _recipeType,
                            dropdownColor:
                                Theme.of(context).colorScheme.surfaceBright,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              label: Text(
                                S.of(context).recipeTypeLabel,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                        fontWeight: FontWeight.bold),
                              ),
                              labelStyle: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                            items: recipeTypes.entries
                                .map((entry) => DropdownMenuItem(
                                      value: entry.value,
                                      child: Text(S
                                          .of(context)
                                          .recipeTypeName(entry.value.name)),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                _recipeType = value;
                              });
                            },
                          ),
                          const SizedBox(height: 10),
                          DropdownButtonFormField(
                            value: _recipeDifficulty,
                            dropdownColor:
                                Theme.of(context).colorScheme.surfaceBright,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              label: Text(
                                S.of(context).recipeDifficultyLabel,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                        fontWeight: FontWeight.bold),
                              ),
                            ),
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                            items: recipeDifficulties.entries
                                .map((entry) => DropdownMenuItem(
                                      value: entry.value,
                                      child: Text(
                                        S.of(context).recipeDifficultyName(
                                            entry.value.name),
                                      ),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                _recipeDifficulty = value;
                              });
                            },
                          ),
                          const SizedBox(height: 10),
                          DropdownButtonFormField(
                            value: _recipeCost,
                            dropdownColor:
                                Theme.of(context).colorScheme.surfaceBright,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              label: Text(
                                S.of(context).recipeCostLabel,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                        fontWeight: FontWeight.bold),
                              ),
                              labelStyle: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                            items: recipeCosts.entries
                                .map((entry) => DropdownMenuItem(
                                      value: entry.value,
                                      child: Text(S
                                          .of(context)
                                          .recipeCostName(entry.value.name)),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                _recipeCost = value;
                              });
                            },
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    _recipeType = null;
                                    _recipeDifficulty = null;
                                    _recipeCost = null;
                                  });

                                  _filterRecipes();
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  S.of(context).clearFilters,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              ElevatedButton(
                                onPressed: () {
                                  _filterRecipes();
                                  Navigator.of(context).pop();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Theme.of(context).colorScheme.primary,
                                ),
                                child: Text(
                                  S.of(context).applyFilters,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                      ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  });
            },
            icon: Icon(
              Icons.filter_list,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: _shownRecipes.length,
            itemBuilder: (context, index) {
              final item = _shownRecipes[index];
              return Dismissible(
                key: ValueKey(item.id),
                confirmDismiss: (_) async {
                  return await showDialog(
                    context: context,
                    builder: (_) {
                      return GlobalAlertDialog(
                        title: S.of(context).recipeRemoveDialogTitle,
                        content: S.of(context).recipeRemoveDialogConfirmContent,
                        actionYes: S.of(context).recipeRemoveDialogActionYes,
                        actionNo: S.of(context).recipeRemoveDialogActionNo,
                        doOnYesAction: () {
                          Navigator.of(context).pop(true);
                        },
                        doOnNoAction: () {
                          Navigator.of(context).pop(false);
                        },
                      );
                    },
                  );
                },
                onDismissed: (_) => widget.onRemoveItem(item),
                direction: DismissDirection.endToStart,
                background: Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 16),
                  child: Icon(
                    Icons.delete,
                    color: Theme.of(context).colorScheme.error,
                    size: 32,
                  ),
                ),
                child: RecipeCard(recipe: item),
              );
            },
          ),
        ),
      ),
    );
  }
}
