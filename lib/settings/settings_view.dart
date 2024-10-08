import 'package:flutter/material.dart';
import 'package:smart_pantry/app.dart';
import 'package:smart_pantry/generated/l10n.dart';
import 'package:smart_pantry/settings/widgets/informations_view.dart';

import 'settings_controller.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key, required this.controller});

  static const routeName = '/settings';

  final SettingsController controller;

  @override
  Widget build(BuildContext context) {
    final mainAppState = context.findAncestorStateOfType<MainAppState>();

    String localeToLanguage(Locale locale) {
      switch (locale.languageCode) {
        case 'en':
          return 'English';
        case 'es':
          return 'Español';
        case 'fr':
          return 'Français';
        case 'de':
          return 'Deutsch';
        case 'it':
          return 'Italiano';
        case 'pt':
          return 'Português';
        case 'zh':
          return '中文';
        default:
          return 'Unknown';
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).settingsTitle,
        ),
      ),
      body: SafeArea(
        child: Padding(
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
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    S.of(context).language,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                  ),
                  const Spacer(),
                  DropdownButton<Locale>(
                    value: Localizations.localeOf(context),
                    onChanged: (Locale? newLocale) {
                      if (newLocale != null) {
                        mainAppState?.changeLocale(newLocale);
                      }
                    },
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    dropdownColor: Theme.of(context).colorScheme.surface,
                    items: S.delegate.supportedLocales
                        .map<DropdownMenuItem<Locale>>((Locale locale) {
                      return DropdownMenuItem<Locale>(
                        value: locale,
                        child: Text(localeToLanguage(locale)),
                      );
                    }).toList(),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton.icon(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => const SafeArea(
                          child: SingleChildScrollView(
                            child: InformationsView(),
                          ),
                        ),
                      );
                    },
                    icon: Icon(Icons.info_outline,
                        color: Theme.of(context).colorScheme.onSecondary),
                    label: Text(
                      S.of(context).appInformationsButton,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onSecondary,
                            fontSize: 18,
                          ),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      fixedSize: const Size(300, 50),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
