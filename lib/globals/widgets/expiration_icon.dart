import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_pantry/expiration/expiration_view.dart';
import 'package:smart_pantry/pantry/providers/user_pantry.dart';

class ExpirationIcon extends ConsumerStatefulWidget {
  const ExpirationIcon({super.key});

  @override
  ConsumerState<ExpirationIcon> createState() => _ExpirationIconState();
}

class _ExpirationIconState extends ConsumerState<ExpirationIcon> {
  late Future<void> _allItems;

  @override
  void didChangeDependencies() {
    _allItems = ref.watch(userPantryProvider.notifier).loadAlmostExpiredItems();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const SizedBox();
    final allItems = ref.watch(userPantryProvider).where((item) {
      bool hasExpiration = item.expiration != null;

      if (!hasExpiration) {
        return false;
      }

      bool isExpired = item.expiration!.isBefore(DateTime.now());

      bool isAlmostExpired = item.expiration!
          .isBefore(DateTime.now().add(const Duration(days: 5)));

      if (!isExpired && !isAlmostExpired) {
        return false;
      }

      return isAlmostExpired;
    }).toList();

    if (allItems.isNotEmpty) {
      content = IconButton(
        onPressed: () {
          Navigator.of(context).pushReplacementNamed(ExpirationView.routeName);
        },
        icon: const Icon(
          Icons.warning,
          color: Color.fromARGB(255, 255, 193, 7),
        ),
      );
    }

    return FutureBuilder(
      future: _allItems,
      builder: (context, snapshot) =>
          snapshot.connectionState == ConnectionState.waiting
              ? const Center(child: CircularProgressIndicator())
              : content,
    );
  }
}
