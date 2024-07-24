import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_pantry/expiration/widgets/expiration_list.dart';
import 'package:smart_pantry/generated/l10n.dart';
import 'package:smart_pantry/pantry/pantry_view.dart';
import 'package:smart_pantry/pantry/providers/user_pantry.dart';
import 'package:smart_pantry/settings/settings_view.dart';
import 'package:smart_pantry/shopping_list/shopping_list_view.dart';

class ExpirationView extends ConsumerStatefulWidget {
  const ExpirationView({super.key});

  static const routeName = '/expiration';

  @override
  ConsumerState<ExpirationView> createState() => _PantryItemsState();
}

class _PantryItemsState extends ConsumerState<ExpirationView> {
  late Future<void> _allItems;

  @override
  void didChangeDependencies() {
    _allItems = ref.watch(userPantryProvider.notifier).loadAlmostExpiredItems();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final allItems = ref.watch(userPantryProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          S.of(context).expirationTitle,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onPrimary),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(PantryView.routeName);
            },
            icon: Icon(
              Icons.kitchen,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushReplacementNamed(ShoppingListView.routeName);
            },
            icon: Icon(
              Icons.shopping_cart,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(SettingsView.routeName);
            },
            icon: Icon(
              Icons.settings,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: _allItems,
        builder: (context, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? const Center(child: CircularProgressIndicator())
                : ExpirationList(items: allItems),
      ),
    );
  }
}
