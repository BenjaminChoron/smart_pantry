import 'package:flutter/material.dart';
import 'package:smart_pantry/generated/l10n.dart';
import 'package:smart_pantry/globals/data/categories.dart';
import 'package:smart_pantry/globals/widgets/expiration_icon.dart';
import 'package:smart_pantry/pantry/pantry_view.dart';
import 'package:smart_pantry/settings/settings_view.dart';
import 'package:smart_pantry/shopping_list/add_shopping_list_item_view.dart';
import 'package:smart_pantry/shopping_list/widgets/shopping_list_items.dart';

class ShoppingListView extends StatelessWidget {
  const ShoppingListView({super.key});

  static const routeName = '/shopping_list';

  @override
  Widget build(BuildContext context) {
    List<Tab> shoppingTabs = [
      Tab(
        text: S.of(context).categoryName('All'),
        icon: Icon(
          Icons.list,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      ...categories.entries.map((entry) => Tab(
            text: S.of(context).categoryName(entry.value.name),
            icon: Icon(
              entry.value.icon,
              color: Theme.of(context).colorScheme.secondary,
            ),
          )),
    ];

    List<Widget> shoppingTabViews = [
      const ShoppingListItems(isAllItems: true),
      ...categories.entries
          .map((entry) => ShoppingListItems(category: entry.value)),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          S.of(context).shoppingListTitle,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onPrimary),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AddShoppingListItemView(),
                ),
              );
            },
            icon: Icon(
              Icons.add,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(PantryView.routeName);
            },
            icon: Icon(
              Icons.kitchen,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          const ExpirationIcon(),
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
      body: DefaultTabController(
        length: shoppingTabs.length,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 80,
            actions: [
              Expanded(
                child: TabBar(
                  dividerColor: Theme.of(context).colorScheme.primary,
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  tabs: shoppingTabs,
                ),
              )
            ],
          ),
          body: TabBarView(
            children: shoppingTabViews,
          ),
        ),
      ),
    );
  }
}
