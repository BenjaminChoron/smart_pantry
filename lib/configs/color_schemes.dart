import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const colorScheme = ColorScheme.light(
  primary: Color.fromARGB(255, 64, 93, 114),
  onPrimary: Color.fromARGB(255, 255, 248, 243),
  secondary: Color.fromARGB(255, 117, 134, 148),
  onSecondary: Color.fromARGB(255, 255, 248, 243),
  tertiary: Color.fromARGB(255, 247, 231, 220),
  onTertiary: Color.fromARGB(255, 64, 93, 114),
  surface: Color.fromARGB(255, 255, 248, 243),
  onSurface: Color.fromARGB(255, 45, 45, 45),
  error: Color.fromARGB(255, 157, 57, 57),
  onError: Color.fromARGB(255, 255, 248, 243),
);

final theme = ThemeData().copyWith(
  scaffoldBackgroundColor: colorScheme.surface,
  colorScheme: colorScheme,
  textTheme: GoogleFonts.ubuntuCondensedTextTheme().copyWith(
    titleSmall: GoogleFonts.ubuntuCondensed(
      fontWeight: FontWeight.bold,
    ),
    titleMedium: GoogleFonts.ubuntuCondensed(
      fontWeight: FontWeight.bold,
    ),
    titleLarge: GoogleFonts.ubuntuCondensed(
      fontWeight: FontWeight.bold,
    ),
  ),
);

const colorSchemeDark = ColorScheme.dark(
  primary: Color.fromARGB(255, 15, 76, 117),
  onPrimary: Color.fromARGB(255, 222, 222, 222),
  secondary: Color.fromARGB(255, 50, 130, 184),
  onSecondary: Color.fromARGB(255, 222, 222, 222),
  tertiary: Color.fromARGB(255, 187, 225, 250),
  onTertiary: Color.fromARGB(255, 15, 76, 117),
  surface: Color.fromARGB(255, 27, 38, 44),
  onSurface: Color.fromARGB(255, 222, 222, 222),
  error: Color.fromARGB(255, 161, 90, 90),
  onError: Color.fromARGB(255, 222, 222, 222),
);

final darkTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: colorSchemeDark.surface,
  colorScheme: colorSchemeDark,
  textTheme: GoogleFonts.ubuntuCondensedTextTheme().copyWith(
    titleSmall: GoogleFonts.ubuntuCondensed(
      fontWeight: FontWeight.bold,
    ),
    titleMedium: GoogleFonts.ubuntuCondensed(
      fontWeight: FontWeight.bold,
    ),
    titleLarge: GoogleFonts.ubuntuCondensed(
      fontWeight: FontWeight.bold,
    ),
  ),
);
