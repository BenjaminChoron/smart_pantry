import 'package:flutter/material.dart';
import 'package:smart_pantry/localization/generated/l10n.dart';

import 'settings_controller.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key, required this.controller});

  static const routeName = '/settings';

  final SettingsController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).settingsTitle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  S.of(context).theme,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
                const Spacer(),
                DropdownButton<ThemeMode>(
                  value: controller.themeMode,
                  onChanged: controller.updateThemeMode,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  dropdownColor: Theme.of(context).colorScheme.surface,
                  items: [
                    DropdownMenuItem(
                      value: ThemeMode.system,
                      child: Text(S.of(context).systemTheme),
                    ),
                    DropdownMenuItem(
                      value: ThemeMode.light,
                      child: Text(S.of(context).lightTheme),
                    ),
                    DropdownMenuItem(
                      value: ThemeMode.dark,
                      child: Text(S.of(context).darkTheme),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
