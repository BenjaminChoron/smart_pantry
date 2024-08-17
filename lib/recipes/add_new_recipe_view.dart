import 'package:flutter/material.dart';
import 'package:smart_pantry/recipes/widgets/new_recipe_form.dart';

class AddNewRecipeView extends StatelessWidget {
  const AddNewRecipeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Recipe'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: NewRecipeForm(),
      ),
    );
  }
}
