import 'package:flutter/material.dart';
import 'package:smart_pantry/expiration/widgets/expiration_list_item.dart';
import 'package:smart_pantry/generated/l10n.dart';
import 'package:smart_pantry/pantry/models/pantry_item.dart';

class ExpirationList extends StatelessWidget {
  const ExpirationList({
    super.key,
    this.expiredItems,
    this.almostExpiredItems,
  });

  final List<PantryItem>? expiredItems;
  final List<PantryItem>? almostExpiredItems;

  @override
  Widget build(BuildContext context) {
    Widget? expired;
    Widget? almostExpired;

    if (expiredItems!.isNotEmpty) {
      expired = Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Theme.of(context).colorScheme.error,
                  width: 1,
                ),
              ),
            ),
            child: Text(
              S.of(context).expired,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.error,
                  ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: expiredItems!.length,
              itemBuilder: (context, index) {
                return ExpirationListItem(
                  context: context,
                  item: expiredItems![index],
                );
              },
            ),
          ),
        ],
      );
    }

    if (almostExpiredItems!.isNotEmpty) {
      almostExpired = Column(
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
              itemCount: almostExpiredItems!.length,
              itemBuilder: (context, index) {
                return ExpirationListItem(
                  context: context,
                  item: almostExpiredItems![index],
                );
              },
            ),
          ),
        ],
      );
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          children: [
            if (expired != null) Expanded(child: expired),
            if (almostExpired != null) Expanded(child: almostExpired),
          ],
        ),
      ),
    );
  }
}
