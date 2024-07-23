import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:smart_pantry/pantry/pantry_view.dart';
import 'package:smart_pantry/shopping_list/shopping_list_view.dart';
import 'generated/l10n.dart';

import 'package:smart_pantry/configs/color_schemes.dart';
import 'package:smart_pantry/settings/settings_view.dart';
import 'package:smart_pantry/settings/settings_controller.dart';

class MainApp extends StatefulWidget {
  const MainApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  State<MainApp> createState() => MainAppState();
}

class MainAppState extends State<MainApp> {
  Locale? _locale;

  void changeLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          theme: theme,
          darkTheme: darkTheme,
          themeMode: widget.settingsController.themeMode,
          locale: _locale,
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
                    return SettingsView(controller: widget.settingsController);
                  case ShoppingListView.routeName:
                    return const ShoppingListView();
                  case PantryView.routeName:
                  default:
                    return const PantryView();
                }
              },
            );
          },
        );
      },
    );
  }
}
