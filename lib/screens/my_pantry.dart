import 'package:flutter/material.dart';
import 'package:smart_pantry/data/storages.dart';

import 'package:smart_pantry/screens/add_item.dart';
import 'package:smart_pantry/screens/all_items.dart';
import 'package:smart_pantry/screens/cupboard.dart';
import 'package:smart_pantry/screens/freezer.dart';
import 'package:smart_pantry/screens/fridge.dart';

class MyPantryScreen extends StatelessWidget {
  const MyPantryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Tab> dynamicTabs = storages.entries
        .map((entry) => Tab(
              text: entry.value.name,
              icon: Icon(entry.value.icon),
            ))
        .toList();

    List<Tab> tabs = [
      const Tab(
        text: 'All',
        icon: Icon(Icons.list),
      ),
      ...dynamicTabs,
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'My Pantry',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onPrimary),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx) => const AddItemScreen()),
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
        length: tabs.length,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 80,
            actions: [
              Expanded(
                child: TabBar(
                  tabs: tabs,
                ),
              )
            ],
          ),
          body: const TabBarView(
            children: [
              AllItemsScreen(),
              FridgeScreen(),
              FreezerScreen(),
              CupboardScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
