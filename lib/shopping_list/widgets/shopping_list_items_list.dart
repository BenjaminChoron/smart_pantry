import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_pantry/generated/l10n.dart';
import 'package:smart_pantry/globals/data/categories.dart';
import 'package:smart_pantry/globals/data/storages.dart';
import 'package:smart_pantry/globals/models/category.dart';
import 'package:smart_pantry/globals/models/storage.dart';
import 'package:smart_pantry/globals/widgets/global_alert_dialog.dart';
import 'package:smart_pantry/globals/widgets/storage_dropdown_form_input.dart';
import 'package:smart_pantry/pantry/providers/user_pantry.dart';
import 'package:smart_pantry/shopping_list/models/shopping_item.dart';
import 'package:smart_pantry/shopping_list/providers/user_shopping_list.dart';
import 'package:smart_pantry/shopping_list/widgets/shopping_list_item_form.dart';

class ShoppingListItemsList extends ConsumerStatefulWidget {
  const ShoppingListItemsList(
      {super.key, required this.items, this.isAllItems = false});

  final List<ShoppingItem> items;
  final bool isAllItems;

  @override
  ConsumerState<ShoppingListItemsList> createState() =>
      _ShoppingListItemsListState();
}

class _ShoppingListItemsListState extends ConsumerState<ShoppingListItemsList> {
  List<ShoppingItem> get items => widget.items;
  bool get isAllItems => widget.isAllItems;

  void _onRemoveItem(ShoppingItem item) async {
    final index = items.indexOf(item);

    setState(() {
      items.remove(item);
    });

    final shoppingList = ref.read(userShoppingListProvider.notifier);
    final result = await shoppingList.removeItem(item);

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

  void _storeItem(ShoppingItem item) async {
    final index = items.indexOf(item);
    final pantry = ref.read(userPantryProvider.notifier);
    Storage storage = storages[Storages.cupboard]!;

    if (item.category == categories[Categories.frozen]) {
      storage = storages[Storages.freezer]!;
    }

    if (item.category == categories[Categories.fresh]) {
      storage = storages[Storages.fridge]!;
    }

    void onStoreItem() async {
      final result = await pantry.addItem(
        item.name,
        storage,
        item.quantity,
        item.unit,
        null,
      );

      if (!result) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(S.of(context).failedToAddItem),
            backgroundColor: Theme.of(context).colorScheme.error,
            duration: const Duration(seconds: 2),
          ),
        );
        setState(() {
          items.insert(index, item);
        });
      }

      _onRemoveItem(item);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(S.of(context).addedToPantry),
          backgroundColor: Theme.of(context).colorScheme.primary,
          duration: const Duration(seconds: 2),
        ),
      );
    }

    showDialog(
        context: context,
        builder: (_) {
          return Dialog(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    S.of(context).whereToStore,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                  ),
                  const SizedBox(height: 10),
                  StorageDropdownFormInput(
                    storage: storage,
                    onChanged: (value) {
                      storage = value;
                    },
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      onStoreItem();
                      Navigator.of(context).pop(true);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    child: Text(
                      S.of(context).store,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _showBottomSheet(ShoppingItem item) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ShoppingListItemForm(
                isUpdate: true,
                item: item,
              ),
            ),
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
          onDismissed: (direction) async {
            if (direction == DismissDirection.endToStart) {
              _onRemoveItem(item);
            }

            if (direction == DismissDirection.startToEnd) {
              _storeItem(item);
            }
          },
          confirmDismiss: (direction) async {
            if (direction == DismissDirection.endToStart) {
              return await showDialog(
                context: context,
                builder: (_) {
                  return GlobalAlertDialog(
                    title: S.of(context).shoppingListRemoveDialogTitle,
                    content:
                        S.of(context).shoppingListRemoveDialogConfirmContent,
                    actionYes: S.of(context).shoppingListRemoveDialogActionYes,
                    actionNo: S.of(context).shoppingListRemoveDialogActionNo,
                    doOnYesAction: () {
                      Navigator.of(context).pop(true);
                    },
                    doOnNoAction: () {
                      Navigator.of(context).pop(false);
                    },
                  );
                },
              );
            }

            if (direction == DismissDirection.startToEnd) {
              return await showDialog(
                context: context,
                builder: (_) {
                  return GlobalAlertDialog(
                    title: S.of(context).shoppingListAddToPantryDialogTitle,
                    content: S
                        .of(context)
                        .shoppingListAddToPantryDialogConfirmContent,
                    actionYes:
                        S.of(context).shoppingListAddToPantryDialogActionYes,
                    actionNo:
                        S.of(context).shoppingListAddToPantryDialogActionNo,
                    doOnYesAction: () {
                      Navigator.of(context).pop(true);
                    },
                    doOnNoAction: () {
                      Navigator.of(context).pop(false);
                    },
                  );
                },
              );
            }

            return null;
          },
          secondaryBackground: Container(
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
          background: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.tertiary,
            ),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 16),
            child: Icon(
              Icons.shopping_cart,
              color: Theme.of(context).colorScheme.onTertiary,
              size: 32,
            ),
          ),
          child: ListTile(
            onTap: () {
              _showBottomSheet(item);
            },
            leading: isAllItems
                ? CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    child: Icon(
                      item.category.icon,
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
