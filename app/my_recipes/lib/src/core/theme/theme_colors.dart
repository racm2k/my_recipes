import 'package:flutter/material.dart';

class ThemeColors {
  // Primary Color (Green)
  static const primary = Color(0xFF4CAF50);
  static const primary100 = Color(0x1A4CAF50);
  static const primary70 = Color(0xB34CAF50);
  static const primary50 = Color(0x804CAF50);
  static const primary30 = Color(0x4D4CAF50);

// Secondary Color (Yellow)
  static const secondary = Color(0xFFFFEB3B);
  static const secondary100 = Color(0xFFFFEB3B);
  static const secondary70 = Color(0xB3FFEB3B);
  static const secondary50 = Color(0x80FFEB3B);
  static const secondary30 = Color(0x4DFFEB3B);

// Error Color (Red)
  static const error = Color(0xFFE53935);
  static const error100 = Color(0x1AE53935);
  static const error70 = Color(0xB3E53935);
  static const error50 = Color(0x80E53935);
  static const error30 = Color(0x4DE53935);

// Success Color (Light Green)
  static const success = Color(0xFF8BC34A);
  static const success100 = Color(0x1A8BC34A);
  static const success70 = Color(0xB38BC34A);
  static const success50 = Color(0x808BC34A);
  static const success30 = Color(0x4D8BC34A);

// Warning Color (Yellow)
  static const warning = Color(0xFFFFC107);
  static const warning100 = Color(0x1AFFFFC107);
  static const warning70 = Color(0xB3FFFFC107);
  static const warning50 = Color(0x80FFFFC107);
  static const warning30 = Color(0x4DFFFFC107);

  // Primary Text Color with Transparency
  static const primaryText = Color(0xFF1D1A05);

// Secondary Text Color with Transparency
  static const secondaryText = Color(0x8C00BCD4);

// Placeholders Color with Transparency
  static const placeholders = Color(0x8C808080);

// Borders Color with Transparency
  static const borders = Color(0x8CE0E0E0);

// White Text Color
  static const whiteText = Color(0xFFFFFFFF);

// Primary Background Color
  static const primaryBg = Color(0xFFFFFFFF);

// Disabled Background Color with Transparency
  static const disabledBg = Color(0x8CE0E0E0);

// Card Primary Background Color
  static const cardPrimaryBg = Color(0xFF4CAF50);

// Card Disabled Background Color with Transparency
  static const cardDisabledBg = Color(0xCC8BC34A);

  static const transparent = Color(0x00000000);

  static const lightColorScheme = ColorScheme(
    primary: primary,
    onPrimary: primary100,
    primaryContainer: primary70,
    onPrimaryContainer: primary30,
    secondary: secondary,
    onSecondary: secondary100,
    secondaryContainer: secondary70,
    onSecondaryContainer: secondary30,
    error: error,
    onError: error100,
    errorContainer: error70,
    onErrorContainer: error30,
    background: primaryBg,
    onBackground: primaryText,
    surface: primaryBg,
    onSurface: primaryText,
    shadow: Color(0xFF000000),
    brightness: Brightness.light,
  );
}
