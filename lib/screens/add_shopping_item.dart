import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddShoppingItemScreen extends ConsumerStatefulWidget {
  const AddShoppingItemScreen({super.key});

  @override
  ConsumerState<AddShoppingItemScreen> createState() =>
      _AddShoppingItemScreenState();
}

class _AddShoppingItemScreenState extends ConsumerState<AddShoppingItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Shopping Item'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Text('Add Shopping Item Form',
            style: TextStyle(color: Colors.white)),
      ),
    );
  }
}