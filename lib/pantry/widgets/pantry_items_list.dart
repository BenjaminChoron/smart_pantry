import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_pantry/globals/data/categories.dart';
import 'package:smart_pantry/generated/l10n.dart';
import 'package:smart_pantry/globals/models/category.dart';
import 'package:smart_pantry/globals/widgets/global_alert_dialog.dart';

import 'package:smart_pantry/pantry/models/pantry_item.dart';
import 'package:smart_pantry/shopping_list/models/shopping_item.dart';
import 'package:smart_pantry/pantry/providers/user_pantry.dart';
import 'package:smart_pantry/shopping_list/add_shopping_list_item_view.dart';
import 'package:smart_pantry/pantry/widgets/pantry_item_form.dart';

class PantryItemsList extends ConsumerStatefulWidget {
  const PantryItemsList(
      {super.key, required this.items, this.isAllItems = false});

  final List<PantryItem> items;
  final bool isAllItems;

  @override
  ConsumerState<PantryItemsList> createState() => _PantryItemsListState();
}

class _PantryItemsListState extends ConsumerState<PantryItemsList> {
  List<PantryItem> get items => widget.items;
  bool get isAllPantryItems => widget.isAllItems;

  void _onRemoveItem(PantryItem item) async {
    final index = items.indexOf(item);

    setState(() {
      items.remove(item);
    });

    final pantry = ref.read(userPantryProvider.notifier);
    final result = await pantry.removeItem(item);

    if (!result) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(S.of(context).failedToRemoveItem),
          backgroundColor: Theme.of(context).colorScheme.error,
          duration: const Duration(seconds: 2),
        ),
      );
      setState(() {
        items.insert(index, item);
      });
    }
  }

  void _showBottomSheet(PantryItem item) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: PantryItemForm(
            isUpdate: true,
            item: item,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.items.isEmpty) {
      return Center(
        child: Text(
          S.of(context).noItems,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
      );
    }

    return ListView.builder(
      itemCount: widget.items.length,
      itemBuilder: (context, index) {
        final item = widget.items[index];
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
          onDismissed: (_) async {
            return await showDialog(
              context: context,
              builder: (_) {
                return GlobalAlertDialog(
                  title: S.of(context).pantryDialogDismissTitle,
                  content: S.of(context).pantryDialogDismissContent,
                  actionYes: S.of(context).pantryDialogActionYes,
                  actionNo: S.of(context).pantryDialogActionNo,
                  doOnYesAction: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => AddShoppingListItemView(
                          isAddToShoppingAfterRemovedFromPantry: true,
                          item: ShoppingItem(
                            name: item.name,
                            category: categories[Categories.fruits]!,
                            quantity: 0,
                            unit: item.unit,
                          ),
                        ),
                      ),
                    );
                    _onRemoveItem(item);
                  },
                  doOnNoAction: () {
                    Navigator.of(context).pop();
                    _onRemoveItem(item);
                  },
                );
              },
            );
          },
          direction: DismissDirection.endToStart,
          background: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.error,
            ),
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 16),
            child: Icon(
              Icons.delete,
              color: Theme.of(context).colorScheme.onError,
              size: 32,
            ),
          ),
          child: ListTile(
            onTap: () {
              _showBottomSheet(item);
            },
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            leading: isAllPantryItems
                ? CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    child: Icon(
                      item.storage.icon,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ))
                : null,
            title: Text(
              item.name,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            trailing: Text(
              '${item.quantity.toString()} ${item.unit.symbol}',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
          ),
        );
      },
    );
  }
}
