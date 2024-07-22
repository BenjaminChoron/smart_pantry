import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PantryAlertDialog extends StatelessWidget {
  const PantryAlertDialog({
    super.key,
    required this.title,
    required this.content,
    required this.actionYes,
    required this.actionNo,
    required this.doOnYesAction,
    required this.doOnNoAction,
  });

  final String title;
  final String content;
  final String actionYes;
  final String actionNo;
  final Function() doOnYesAction;
  final Function() doOnNoAction;

  @override
  Widget build(BuildContext context) {
    bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;

    if (isIOS) {
      return CupertinoAlertDialog(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(title),
        ),
        content: Text(content),
        actions: [
          CupertinoDialogAction(
            onPressed: doOnYesAction,
            child: Text(actionYes),
          ),
          CupertinoDialogAction(
            onPressed: doOnNoAction,
            child: Text(actionNo),
          ),
        ],
      );
    }

    return AlertDialog(
      title: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(title),
      ),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: doOnYesAction,
          child: Text(actionYes),
        ),
        TextButton(
          onPressed: doOnNoAction,
          child: Text(actionNo),
        ),
      ],
    );
  }
}
