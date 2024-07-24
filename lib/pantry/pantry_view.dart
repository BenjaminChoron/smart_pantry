import 'package:flutter/material.dart';
import 'package:smart_pantry/generated/l10n.dart';
import 'package:smart_pantry/globals/data/storages.dart';
import 'package:smart_pantry/pantry/add_pantry_item_view.dart';
import 'package:smart_pantry/pantry/widgets/pantry_items.dart';
import 'package:smart_pantry/settings/settings_view.dart';
import 'package:smart_pantry/shopping_list/shopping_list_view.dart';

class PantryView extends StatefulWidget {
  const PantryView({super.key});

  static const routeName = '/';

  @override
  State<PantryView> createState() => _PantryViewState();
}

class _PantryViewState extends State<PantryView> {
  @override
  Widget build(BuildContext context) {
    List<Tab> pantryTabs = [
      Tab(
        text: S.of(context).storageName('All'),
        icon: Icon(
          Icons.list,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      ...storages.entries.map((entry) => Tab(
            text: S.of(context).storageName(entry.value.name),
            icon: Icon(
              entry.value.icon,
              color: Theme.of(context).colorScheme.secondary,
            ),
          )),
    ];

    List<Widget> pantryTabViews = [
      const PantryItems(isAllItems: true),
      ...storages.entries.map((entry) => PantryItems(storage: entry.value)),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          S.of(context).pantryTitle,
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
                  builder: (context) => const AddPantryItemView(),
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
      body: DefaultTabController(
        length: pantryTabs.length,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 80,
            actions: [
              Expanded(
                child: TabBar(
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  tabs: pantryTabs,
                ),
              )
            ],
          ),
          body: TabBarView(
            children: pantryTabViews,
          ),
        ),
      ),
    );
  }
}
