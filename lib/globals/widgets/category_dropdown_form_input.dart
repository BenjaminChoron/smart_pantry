import 'package:flutter/material.dart';

import 'package:smart_pantry/globals/data/categories.dart';
import 'package:smart_pantry/generated/l10n.dart';
import 'package:smart_pantry/globals/models/category.dart';

class CategoryDropdownFormInput extends StatefulWidget {
  const CategoryDropdownFormInput({
    super.key,
    required this.category,
    required this.onChanged,
  });

  final Category category;
  final Function(Category) onChanged;

  @override
  State<CategoryDropdownFormInput> createState() =>
      _CategoryDropdownFormInputState();
}

class _CategoryDropdownFormInputState extends State<CategoryDropdownFormInput> {
  Category _selectedCategory = categories[Categories.fruits]!;

  @override
  void initState() {
    super.initState();
    _selectedCategory = widget.category;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: _selectedCategory,
      dropdownColor: Theme.of(context).colorScheme.surfaceBright,
      decoration: const InputDecoration(
        border: InputBorder.none,
      ),
      style: TextStyle(
        color: Theme.of(context).colorScheme.onSurface,
      ),
      items: categories.entries
          .map((entry) => DropdownMenuItem(
                value: entry.value,
                child: Text(S.of(context).categoryName(entry.value.name)),
              ))
          .toList(),
      onChanged: (value) {
        setState(() {
          _selectedCategory = value!;
        });
        widget.onChanged(value!);
      },
    );
  }
}
