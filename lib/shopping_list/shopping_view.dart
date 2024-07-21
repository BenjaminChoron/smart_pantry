import 'package:flutter/material.dart';
import 'package:smart_pantry/generated/l10n.dart';
import 'package:smart_pantry/globals/data/categories.dart';
import 'package:smart_pantry/shopping_list/add_shopping_item.dart';
import 'package:smart_pantry/shopping_list/shopping_list.dart';

class ShoppingView extends StatefulWidget {
  const ShoppingView({super.key});

  static const routeName = '/shopping_list';

  @override
  State<ShoppingView> createState() => _ShoppingViewState();
}

class _ShoppingViewState extends State<ShoppingView> {
  @override
  Widget build(BuildContext context) {
    List<Tab> shoppingTabs = [
      Tab(
        text: S.of(context).categoryName('All'),
        icon: Icon(
          Icons.list,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      ...categories.entries.map((entry) => Tab(
            text: S.of(context).categoryName(entry.value.name),
            icon: Icon(
              entry.value.icon,
              color: entry.value.color,
            ),
          )),
    ];

    List<Widget> shoppingTabViews = [
      const ShoppingListScreen(isAllItems: true),
      ...categories.entries
          .map((entry) => ShoppingListScreen(category: entry.value)),
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
                  builder: (ctx) => const AddShoppingItemScreen(),
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
              Navigator.of(context).pushReplacementNamed('/');
            },
            icon: Icon(
              Icons.kitchen,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/settings');
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
