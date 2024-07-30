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

    TextStyle? textStyle;

    TextStyle expiredStyle = Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: Theme.of(context).colorScheme.error,
          fontWeight: FontWeight.bold,
        );

    TextStyle almostExpiredStyle =
        Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Colors.orange,
              fontWeight: FontWeight.bold,
            );

    bool isExpired = item.expiration!.isBefore(DateTime.now()) &&
        item.expiration!.day != DateTime.now().day;

    bool expireToday = item.expiration!.day == DateTime.now().day &&
        item.expiration!.month == DateTime.now().month &&
        item.expiration!.year == DateTime.now().year;

    if (isExpired) {
      textStyle = expiredStyle;
    }
    if (expireToday) {
      textStyle = almostExpiredStyle;
    }

    return ListTile(
      titleTextStyle: textStyle ??
          Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
      title: Text(item.name),
      trailing: Text(
        formatDate(item.expiration ?? DateTime.now()),
        style: textStyle ??
            Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
      ),
    );
  }
}
