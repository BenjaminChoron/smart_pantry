import 'package:flutter/material.dart';
import 'package:smart_pantry/generated/l10n.dart';
import 'package:smart_pantry/pantry/models/pantry_item.dart';

class ExpirationList extends StatelessWidget {
  const ExpirationList({
    super.key,
    required this.items,
  });

  final List<PantryItem> items;

  String formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  bool expireToday(DateTime date) {
    final today = DateTime.now();
    return date.day == today.day &&
        date.month == today.month &&
        date.year == today.year;
  }

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
                  return ListTile(
                    titleTextStyle: expireToday(items[index].expiration!)
                        ? Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context).colorScheme.error,
                              fontWeight: FontWeight.bold,
                            )
                        : Theme.of(context).textTheme.bodyMedium,
                    title: Text(items[index].name),
                    trailing: items[index].expiration != null
                        ? Text(
                            formatDate(items[index].expiration!),
                            style: expireToday(items[index].expiration!)
                                ? Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color:
                                          Theme.of(context).colorScheme.error,
                                      fontWeight: FontWeight.bold,
                                    )
                                : Theme.of(context).textTheme.bodyMedium,
                          )
                        : null,
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
