import 'dart:ui';

import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';

class GlobalFonts{

  static TextStyle titleExtraLarge(Color textColor) => GoogleFonts.montserrat(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    color: textColor,
  );

  static TextStyle titleLarge(Color textColor) => GoogleFonts.montserrat(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: textColor,
  );

  static TextStyle titleMedium(Color textColor) => GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: textColor,
  );

  static TextStyle titleSmall(Color textColor) => GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: textColor,
  );

  static TextStyle bodyLarge(Color textColor) => GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
    color: textColor,
  );

  static TextStyle bodyMedium(Color textColor) => GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    color: textColor,
  );

  static TextStyle bodySmall(Color textColor) => GoogleFonts.montserrat(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
    color: textColor,
  );

  static TextStyle labelLarge(Color textColor) => GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    color: textColor,
  );

  static TextStyle labelLargeUnderline(Color textColor) => GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    color: textColor,
    decoration: TextDecoration.underline,
  );


  static TextStyle labelMedium(Color textColor) => GoogleFonts.montserrat(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    color: textColor,
  );

  static TextStyle labelSmall(Color textColor) => GoogleFonts.montserrat(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    color: textColor,
  );

}