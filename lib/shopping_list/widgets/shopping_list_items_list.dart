import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_pantry/generated/l10n.dart';
import 'package:smart_pantry/globals/widgets/global_alert_dialog.dart';
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

  void _showBottomSheet(ShoppingItem item) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: ShoppingListItemForm(
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
          onDismissed: (_) {
            _onRemoveItem(item);
          },
          direction: DismissDirection.endToStart,
          confirmDismiss: (_) async {
            return await showDialog(
              context: context,
              builder: (_) {
                return GlobalAlertDialog(
                  title: S.of(context).shoppingListDialogTitle,
                  content: S.of(context).shoppingListDialogConfirmContent,
                  actionYes: S.of(context).shoppingListDialogActionYes,
                  actionNo: S.of(context).shoppingListDialogActionNo,
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
            leading: isAllItems
                ? CircleAvatar(
                    backgroundColor: item.category.color,
                    child: Icon(
                      item.category.icon,
                      color: Theme.of(context).colorScheme.onPrimary,
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
