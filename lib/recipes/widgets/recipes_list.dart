import 'package:flutter/material.dart';
import 'package:smart_pantry/generated/l10n.dart';
import 'package:smart_pantry/globals/widgets/global_alert_dialog.dart';
import 'package:smart_pantry/recipes/models/recipe.dart';
import 'package:smart_pantry/recipes/widgets/recipe_card.dart';

class RecipesList extends StatelessWidget {
  const RecipesList({
    super.key,
    required this.allRecipes,
    required this.onRemoveItem,
  });

  final List<Recipe> allRecipes;
  final Function(Recipe) onRemoveItem;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: allRecipes.length,
          itemBuilder: (context, index) {
            final item = allRecipes[index];
            return Dismissible(
              key: ValueKey(item.id),
              confirmDismiss: (_) async {
                return await showDialog(
                  context: context,
                  builder: (_) {
                    return GlobalAlertDialog(
                      title: S.of(context).pantryDialogTitle,
                      content: S.of(context).pantryDialogConfirmContent,
                      actionYes: S.of(context).pantryDialogActionYes,
                      actionNo: S.of(context).pantryDialogActionNo,
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
              onDismissed: (_) => onRemoveItem(item),
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
    );
  }
}
