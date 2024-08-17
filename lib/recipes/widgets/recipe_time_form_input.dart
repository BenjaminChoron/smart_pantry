import 'package:flutter/material.dart';
import 'package:smart_pantry/generated/l10n.dart';
import 'package:smart_pantry/globals/widgets/number_form_input.dart';

class RecipeTimeFormInput extends StatefulWidget {
  const RecipeTimeFormInput({
    super.key,
    required this.hours,
    required this.minutes,
    required this.onHoursSaved,
    required this.onMinutesSaved,
  });

  final int hours;
  final int minutes;
  final Function(int hours) onHoursSaved;
  final Function(int hours) onMinutesSaved;

  @override
  State<RecipeTimeFormInput> createState() => _RecipeTimeFormInputState();
}

class _RecipeTimeFormInputState extends State<RecipeTimeFormInput> {
  int _hours = 0;
  int _minutes = 0;

  @override
  void initState() {
    super.initState();
    _hours = widget.hours;
    _minutes = widget.minutes;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.of(context).recipeTimeLabel,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
                fontWeight: FontWeight.bold,
              ),
        ),
        Row(
          children: [
            SizedBox(
              width: 100,
              child: NumberFormInput(
                initialValue: _hours,
                label: S.of(context).hours,
                onSaved: (value) {
                  _hours = value;
                  widget.onHoursSaved(_hours);
                },
              ),
            ),
            const SizedBox(width: 20),
            SizedBox(
              width: 100,
              child: NumberFormInput(
                initialValue: _minutes,
                label: S.of(context).minutes,
                onSaved: (value) {
                  _minutes = value;
                  widget.onMinutesSaved(_minutes);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
