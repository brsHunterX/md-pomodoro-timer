import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemeLight {
  AppThemeLight._();

  static final ThemeData theme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    textTheme: GoogleFonts.latoTextTheme(ThemeData.light().textTheme),
    colorSchemeSeed: Colors.green
  );
}
