import 'package:flutter/material.dart';

class DatePickerFormInput extends StatefulWidget {
  const DatePickerFormInput({
    super.key,
    required this.label,
    required this.initialDate,
    required this.onSaved,
  });

  final String label;
  final DateTime? initialDate;
  final Function(DateTime value) onSaved;

  @override
  State<DatePickerFormInput> createState() => _DatePickerFormInputState();
}

class _DatePickerFormInputState extends State<DatePickerFormInput> {
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    if (widget.initialDate != null) {
      _selectedDate = widget.initialDate!;
    }
  }

  void _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: widget.initialDate ?? _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    ).then((value) {
      if (value != null) {
        setState(() {
          _selectedDate = value;
        });
        widget.onSaved(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showDatePicker(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.label,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              Text(
                _selectedDate != null
                    ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
                    : 'Aucune date sélectionnée',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
            ],
          ),
          const Icon(Icons.calendar_today),
        ],
      ),
    );
  }
}
