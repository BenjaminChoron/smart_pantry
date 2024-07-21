import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

import 'package:smart_pantry/configs/color_schemes.dart';
import 'package:smart_pantry/settings/settings_view.dart';
import 'package:smart_pantry/settings/settings_controller.dart';
import 'package:smart_pantry/pantry/my_pantry.dart';

class MainApp extends StatelessWidget {
  const MainApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          theme: theme,
          darkTheme: darkTheme,
          themeMode: settingsController.themeMode,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  case SettingsView.routeName:
                    return SettingsView(controller: settingsController);
                  case MyPantryScreen.routeName:
                  default:
                    return const MyPantryScreen();
                }
              },
            );
          },
        );
      },
    );
  }
}
