import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_pantry/models/shopping_item.dart';
import 'package:smart_pantry/providers/user_shopping_list.dart';
import 'package:smart_pantry/widgets/shopping_item_form.dart';

class ShoppingItemsList extends ConsumerStatefulWidget {
  const ShoppingItemsList({super.key, required this.items});

  final List<ShoppingItem> items;

  @override
  ConsumerState<ShoppingItemsList> createState() => _ShoppingItemsListState();
}

class _ShoppingItemsListState extends ConsumerState<ShoppingItemsList> {
  List<ShoppingItem> get items => widget.items;

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
          onDismissed: (_) {
            _onRemoveItem(item);
          },
          direction: DismissDirection.endToStart,
          background: Container(
            color: Theme.of(context).colorScheme.error,
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
            leading: CircleAvatar(
              child: Text(item.category.name),
            ),
            title: Text('${item.quantity} ${item.unit.symbol} of ${item.name}'),
          ),
        );
      },
    );
  }
}
