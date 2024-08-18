import 'package:flutter/material.dart';
import 'package:smart_pantry/generated/l10n.dart';
import 'package:smart_pantry/globals/data/units.dart';
import 'package:smart_pantry/globals/models/unit.dart';
import 'package:smart_pantry/globals/widgets/unit_dropdown_form_input.dart';
import 'package:smart_pantry/recipes/models/recipe_ingredient.dart';

class RecipeIngredientsInput extends StatefulWidget {
  const RecipeIngredientsInput({
    super.key,
    required this.initialValues,
    required this.onValidate,
  });

  final List<RecipeIngredient> initialValues;
  final Function(List<RecipeIngredient>) onValidate;

  @override
  State<RecipeIngredientsInput> createState() => _RecipeIngredientsInputState();
}

class _RecipeIngredientsInputState extends State<RecipeIngredientsInput> {
  List<RecipeIngredient> _ingredients = [];
  final TextEditingController _newIngredientController =
      TextEditingController();
  final TextEditingController _newIngredientQuantityController =
      TextEditingController();
  Unit _selectedUnit = units[Units.gram]!;

  @override
  void initState() {
    super.initState();
    setState(() {
      _ingredients = [...widget.initialValues];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.onSurface,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Wrap(
            children: _ingredients
                .map(
                  (ingredient) => Container(
                    margin: const EdgeInsets.all(2),
                    padding: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${ingredient.name} ${ingredient.quantity}${ingredient.unit.symbol}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondary),
                        ),
                        IconButton(
                          style: ButtonStyle(
                            padding: WidgetStateProperty.all(
                              const EdgeInsets.all(0),
                            ),
                            iconSize: WidgetStateProperty.all(14),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          onPressed: () {
                            setState(() {
                              _ingredients.remove(ingredient);
                            });
                            widget.onValidate(_ingredients);
                          },
                          icon: const Icon(
                            Icons.close,
                          ),
                        )
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _newIngredientController,
                maxLength: 30,
                decoration: InputDecoration(
                  label: Text(
                    S.of(context).newIngredientLabel,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                      controller: _newIngredientQuantityController,
                      decoration: InputDecoration(
                        label: Text(
                          S.of(context).quantityLabel,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onSurface),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      keyboardType: TextInputType.number,
                      maxLength: 4,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            int.tryParse(value) == null) {
                          return S.of(context).mustBePositive;
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    flex: 1,
                    child: UnitDropdownFormInput(
                        unit: _selectedUnit,
                        onChanged: (value) {
                          _selectedUnit = value;
                        }),
                  ),
                  IconButton(
                    color: Theme.of(context).colorScheme.primary,
                    onPressed: () {
                      if (_newIngredientController.value.text.isNotEmpty) {
                        setState(() {
                          _ingredients.add(
                            RecipeIngredient(
                              name: _newIngredientController.value.text,
                              quantity: double.parse(
                                  _newIngredientQuantityController.value.text),
                              unit: _selectedUnit,
                            ),
                          );
                          _newIngredientController.clear();
                        });
                        widget.onValidate(_ingredients);
                      }
                    },
                    icon: const Icon(Icons.add),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
