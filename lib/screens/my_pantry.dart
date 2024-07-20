import 'package:flutter/material.dart';

import 'package:smart_pantry/screens/add_item.dart';
import 'package:smart_pantry/screens/all_items.dart';
import 'package:smart_pantry/screens/cupboard.dart';
import 'package:smart_pantry/screens/freezer.dart';
import 'package:smart_pantry/screens/fridge.dart';

class MyPantryScreen extends StatelessWidget {
  const MyPantryScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 80,
            actions: const [
              Expanded(
                child: TabBar(
                  tabs: [
                    Tab(text: 'All', icon: Icon(Icons.list)),
                    Tab(text: 'Fridge', icon: Icon(Icons.kitchen)),
                    Tab(text: 'Freezer', icon: Icon(Icons.ac_unit)),
                    Tab(text: 'Cupboard', icon: Icon(Icons.local_cafe)),
                  ],
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
