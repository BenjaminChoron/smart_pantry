import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_pantry/generated/l10n.dart';
import 'package:smart_pantry/shopping_list/models/shopping_item.dart';
import 'package:smart_pantry/shopping_list/providers/user_shopping_list.dart';
import 'package:smart_pantry/shopping_list/widgets/shopping_item_form.dart';

class ShoppingItemsList extends ConsumerStatefulWidget {
  const ShoppingItemsList(
      {super.key, required this.items, this.isAllItems = false});

  final List<ShoppingItem> items;
  final bool isAllItems;

  @override
  ConsumerState<ShoppingItemsList> createState() => _ShoppingItemsListState();
}

class _ShoppingItemsListState extends ConsumerState<ShoppingItemsList> {
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
          content:
              const Text('Failed to remove item... Please try again later.'),
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
          child: ShoppingItemForm(
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
              builder: (context) {
                bool isCupertino =
                    Theme.of(context).platform == TargetPlatform.iOS;

                if (isCupertino) {
                  return CupertinoAlertDialog(
                    title: const Text('Are you sure?'),
                    content: const Text(
                        'Do you really want to remove this item from the list?'),
                    actions: [
                      CupertinoDialogAction(
                        textStyle: TextStyle(
                            color: Theme.of(context).colorScheme.error),
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                        child: const Text('Yes'),
                      ),
                      CupertinoDialogAction(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: const Text('No'),
                      ),
                    ],
                  );
                }

                return AlertDialog(
                  title: const Text('Are you sure?'),
                  content: const Text(
                      'Do you want to remove this item from the list?'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                        child: Text(
                          'Yes',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.error),
                        )),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: const Text('No')),
                  ],
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
                    backgroundColor: Theme.of(context).colorScheme.primary,
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
