import 'package:flutter/material.dart';
import 'package:smart_pantry/expiration/widgets/expiration_list_item.dart';
import 'package:smart_pantry/generated/l10n.dart';
import 'package:smart_pantry/pantry/models/pantry_item.dart';

class ExpirationList extends StatelessWidget {
  const ExpirationList({
    super.key,
    required this.items,
  });

  final List<PantryItem> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(context).colorScheme.secondary,
                    width: 1,
                  ),
                ),
              ),
              child: Text(
                S.of(context).expirationRange,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ExpirationListItem(
                    context: context,
                    item: items[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
