import 'package:flutter/material.dart';

class ShoppingListScreen extends StatelessWidget {
  const ShoppingListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Shopping List',
          style: TextStyle(color: Theme.of(context).colorScheme.onSurface)),
    );
  }
}
