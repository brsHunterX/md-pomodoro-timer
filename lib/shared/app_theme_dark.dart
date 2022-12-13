import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemeDark {
  AppThemeDark._();

  static final ThemeData theme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    textTheme: GoogleFonts.latoTextTheme(ThemeData.dark().textTheme),
    colorSchemeSeed: Colors.green,
  );
}
