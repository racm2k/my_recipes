import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_recipes/src/core/theme/theme_colors.dart';

class ApplicationTheme {
  static final ThemeData lightScheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: Colors.green,
      backgroundColor: Colors.white,
      scaffoldBackgroundColor: ThemeColors.primaryBg,
      primaryTextTheme: GoogleFonts.montserratTextTheme(),
      colorScheme: ThemeColors.lightColorScheme,

      drawerTheme: const DrawerThemeData(
        backgroundColor: ThemeColors.primaryBg,
      ),
      dialogTheme: const DialogTheme(
        backgroundColor: ThemeColors.primaryBg,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: ThemeColors.primary),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ThemeColors.primaryText),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ThemeColors.primary),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ThemeColors.borders),
        ),

      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: ThemeColors.primaryBg,
        surfaceTintColor: ThemeColors.primaryBg,
        elevation: 0,
      ),

    dividerTheme: const DividerThemeData(
      color: ThemeColors.borders,
      thickness: 1,
    ),

  );
}