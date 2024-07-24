import 'package:flutter/material.dart';
import 'package:smart_pantry/pantry/models/pantry_item.dart';

class ExpirationListItem extends StatelessWidget {
  const ExpirationListItem({
    super.key,
    required this.context,
    required this.item,
  });

  final BuildContext context;
  final PantryItem item;

  @override
  Widget build(BuildContext context) {
    String formatDate(DateTime date) {
      return '${date.day}/${date.month}/${date.year}';
    }

    bool expireToday(DateTime date) {
      final today = DateTime.now();
      return date.day == today.day &&
          date.month == today.month &&
          date.year == today.year;
    }

    return ListTile(
      titleTextStyle: expireToday(item.expiration ?? DateTime.now())
          ? Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.error,
                fontWeight: FontWeight.bold,
              )
          : Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
      title: Text(item.name),
      trailing: Text(
        formatDate(item.expiration ?? DateTime.now()),
        style: expireToday(item.expiration ?? DateTime.now())
            ? Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.error,
                  fontWeight: FontWeight.bold,
                )
            : Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
      ),
    );
  }
}
