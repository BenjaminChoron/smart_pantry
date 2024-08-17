import 'package:flutter/material.dart';
import 'package:smart_pantry/recipes/models/recipe_description.dart';

class RecipeDescriptionLine extends StatelessWidget {
  const RecipeDescriptionLine({super.key, required this.description});

  final RecipeDescription description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              const SizedBox(
                width: 60,
              ),
              Text(
                description.type.name,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
            ],
          ),
          Column(
            children: [
              const SizedBox(
                width: 65,
              ),
              Text(
                'Difficulty',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: description.difficulty.icons
                    .map((icon) => Icon(
                          icon,
                          size: 16,
                          color: Theme.of(context).colorScheme.onSurface,
                        ))
                    .toList(),
              ),
            ],
          ),
          Column(
            children: [
              const SizedBox(
                width: 60,
              ),
              Text(
                'Cost',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: description.cost.icons
                    .map((icon) => Icon(
                          icon,
                          size: 16,
                          color: Theme.of(context).colorScheme.onSurface,
                        ))
                    .toList(),
              ),
            ],
          ),
          Column(
            children: [
              const SizedBox(
                width: 65,
              ),
              Icon(
                Icons.timer_outlined,
                size: 16,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              Text(
                description.time.formatted,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
