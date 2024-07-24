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
    final allItems = ref.watch(userPantryProvider);

    if (allItems.isEmpty) {
      return const SizedBox();
    }

    return FutureBuilder(
      future: _allItems,
      builder: (context, snapshot) =>
          snapshot.connectionState == ConnectionState.waiting
              ? const Center(child: CircularProgressIndicator())
              : IconButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(ExpirationView.routeName);
                  },
                  icon: const Icon(
                    Icons.warning,
                    color: Color.fromARGB(255, 255, 193, 7),
                  ),
                ),
    );
  }
}
