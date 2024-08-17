import 'package:flutter/material.dart';
import 'package:smart_pantry/generated/l10n.dart';
import 'package:smart_pantry/recipes/data/recipe_costs.dart';
import 'package:smart_pantry/recipes/models/recipe_cost.dart';

class RecipeCostDropdownFormInput extends StatefulWidget {
  const RecipeCostDropdownFormInput({
    super.key,
    required this.recipeCost,
    required this.onChanged,
  });

  final RecipeCost recipeCost;
  final Function(RecipeCost) onChanged;

  @override
  State<RecipeCostDropdownFormInput> createState() =>
      _RecipeCostDropdownFormInputState();
}

class _RecipeCostDropdownFormInputState
    extends State<RecipeCostDropdownFormInput> {
  RecipeCost _selectedRecipeCost = recipeCosts[Costs.low]!;

  @override
  void initState() {
    super.initState();
    _selectedRecipeCost = widget.recipeCost;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.of(context).recipeCostLabel,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 200,
          child: DropdownButtonFormField(
            value: _selectedRecipeCost,
            dropdownColor: Theme.of(context).colorScheme.surfaceBright,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
            ),
            items: recipeCosts.entries
                .map((entry) => DropdownMenuItem(
                      value: entry.value,
                      child:
                          Text(S.of(context).recipeCostName(entry.value.name)),
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                _selectedRecipeCost = value!;
              });
              widget.onChanged(value!);
            },
          ),
        ),
      ],
    );
  }
}
