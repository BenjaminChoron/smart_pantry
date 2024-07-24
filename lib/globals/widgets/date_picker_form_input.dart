import 'package:flutter/material.dart';

class DatePickerFormInput extends StatefulWidget {
  const DatePickerFormInput({
    super.key,
    required this.initialDate,
    required this.onSubmitted,
  });

  final DateTime? initialDate;
  final Function(DateTime value) onSubmitted;

  @override
  State<DatePickerFormInput> createState() => _DatePickerFormInputState();
}

class _DatePickerFormInputState extends State<DatePickerFormInput> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InputDatePickerFormField(
            fieldLabelText: 'Date d\'expiration (dd/mm/yyyy)',
            keyboardType: TextInputType.datetime,
            initialDate: null,
            firstDate: DateTime.now(),
            lastDate: DateTime(2100),
            onDateSubmitted: (value) => widget.onSubmitted(value),
          ),
        ),
      ],
    );
  }
}
