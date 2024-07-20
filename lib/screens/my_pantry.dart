import 'package:flutter/material.dart';
import 'package:smart_pantry/data/categories.dart';
import 'package:smart_pantry/data/storages.dart';

import 'package:smart_pantry/screens/add_pantry_item.dart';
import 'package:smart_pantry/screens/add_shopping_item.dart';
import 'package:smart_pantry/screens/all_items.dart';
import 'package:smart_pantry/screens/shopping_list.dart';

class MyPantryScreen extends StatefulWidget {
  const MyPantryScreen({super.key});

  @override
  State<MyPantryScreen> createState() => _MyPantryScreenState();
}

class _MyPantryScreenState extends State<MyPantryScreen> {
  bool _isShoppingList = false;

  @override
  Widget build(BuildContext context) {
    List<Tab> pantryTabs = [
      Tab(
        text: 'All',
        icon: Icon(
          Icons.list,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      ...storages.entries.map((entry) => Tab(
            text: entry.value.name,
            icon: Icon(
              entry.value.icon,
              color: entry.value.color,
            ),
          )),
    ];

    List<Widget> pantryTabViews = [
      const AllItemsScreen(),
      ...storages.entries.map((entry) => entry.value.screen),
    ];

    List<Tab> shoppingTabs = [
      Tab(
        text: 'All',
        icon: Icon(
          Icons.list,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      ...categories.entries.map((entry) => Tab(
            text: entry.value.name,
            icon: Icon(
              entry.value.icon,
              color: entry.value.color,
            ),
          )),
    ];

    List<Widget> shoppingTabViews = [
      const ShoppingListScreen(),
      ...categories.entries
          .map((entry) => ShoppingListScreen(category: entry.value)),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          _isShoppingList ? 'Shopping List' : 'My Pantry',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onPrimary),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _isShoppingList = !_isShoppingList;
              });
            },
            icon: Icon(
              _isShoppingList ? Icons.kitchen : Icons.shopping_cart,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => _isShoppingList
                      ? const AddShoppingItemScreen()
                      : const AddPantryItemScreen(),
                ),
              );
            },
            icon: Icon(
              Icons.add,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ],
      ),
      body: DefaultTabController(
        length: _isShoppingList ? shoppingTabs.length : pantryTabs.length,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 80,
            actions: [
              Expanded(
                child: TabBar(
                  isScrollable: _isShoppingList,
                  tabAlignment: _isShoppingList ? TabAlignment.start : null,
                  tabs: _isShoppingList ? shoppingTabs : pantryTabs,
                ),
              )
            ],
          ),
          body: TabBarView(
            children: _isShoppingList ? shoppingTabViews : pantryTabViews,
          ),
        ),
      ),
    );
  }
}
