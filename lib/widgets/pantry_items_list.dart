import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_pantry/data/categories.dart';
import 'package:smart_pantry/models/category.dart';

import 'package:smart_pantry/models/pantry_item.dart';
import 'package:smart_pantry/models/shopping_item.dart';
import 'package:smart_pantry/providers/user_pantry.dart';
import 'package:smart_pantry/screens/add_shopping_item.dart';
import 'package:smart_pantry/widgets/pantry_item_form.dart';

class PantryItemsList extends ConsumerStatefulWidget {
  const PantryItemsList(
      {super.key, required this.items, this.isAllPantryItems = false});

  final List<PantryItem> items;
  final bool isAllPantryItems;

  @override
  ConsumerState<PantryItemsList> createState() => _PantryItemsListState();
}

class _PantryItemsListState extends ConsumerState<PantryItemsList> {
  List<PantryItem> get items => widget.items;
  bool get isAllPantryItems => widget.isAllPantryItems;

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

  void _showDialog(PantryItem item) {
    bool isCupertino = Theme.of(context).platform == TargetPlatform.iOS;

    final dialogTexts = {
      'title': 'Did you run out of this item?',
      'content':
          'If you want, you can directly add it to your shopping list. What do you wanna do?',
      'remove': 'Just remove it',
      'removeAndAdd': 'Remove and add to shopping list',
    };

    Widget androidDialog = AlertDialog(
      title: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(
          dialogTexts['title']!,
        ),
      ),
      content: Text(dialogTexts['content']!),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            _onRemoveItem(item);
          },
          child: Text(
            dialogTexts['remove']!,
            style: TextStyle(color: Theme.of(context).colorScheme.error),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => AddShoppingItemScreen(
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
          child: Text(dialogTexts['removeAndAdd']!),
        ),
      ],
    );

    Widget iosDialog = CupertinoAlertDialog(
      title: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(
          dialogTexts['title']!,
        ),
      ),
      content: Text(
        dialogTexts['content']!,
      ),
      actions: [
        CupertinoDialogAction(
          textStyle: TextStyle(color: Theme.of(context).colorScheme.error),
          onPressed: () {
            Navigator.of(context).pop();
            _onRemoveItem(item);
          },
          child: Text(dialogTexts['remove']!),
        ),
        CupertinoDialogAction(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => AddShoppingItemScreen(
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(dialogTexts['removeAndAdd']!),
            )),
      ],
    );

    showDialog(
      context: context,
      builder: (_) => isCupertino ? iosDialog : androidDialog,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.items.isEmpty) {
      return Center(
        child: Text(
          'No items added yet.',
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
                bool isCupertino =
                    Theme.of(context).platform == TargetPlatform.iOS;

                if (isCupertino) {
                  return CupertinoAlertDialog(
                    title: const Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Text('Are you sure?'),
                    ),
                    content: const Text(
                        'Do you really want to remove this item from your pantry?'),
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
                  title: const Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Text('Are you sure?'),
                  ),
                  content: const Text(
                      'Do you really want to remove this item from your pantry?'),
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
          onDismissed: (_) {
            _showDialog(item);
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
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    child: Icon(
                      item.storage.icon,
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
