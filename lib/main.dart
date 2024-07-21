import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:smart_pantry/app.dart';
import 'package:smart_pantry/settings/settings_controller.dart';
import 'package:smart_pantry/settings/settings_service.dart';

void main() async {
  final settingsController = SettingsController(SettingsService());
  await settingsController.loadSettings();

  runApp(
    ProviderScope(
      child: MainApp(settingsController: settingsController),
    ),
  );
}
