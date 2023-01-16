import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  static TextStyle titleLarge(Color textColor) => GoogleFonts.roboto(
      fontSize: 32, fontWeight: FontWeight.w500, color: textColor);

  static TextStyle titleLargeMedium(Color textColor) => GoogleFonts.roboto(
      fontSize: 24, fontWeight: FontWeight.w500, color: textColor);
  static TextStyle titleMedium(Color textColor) => GoogleFonts.roboto(
      fontSize: 16, fontWeight: FontWeight.w600, color: textColor);

  static TextStyle subtitleMedium(Color textColor) => GoogleFonts.roboto(
      fontSize: 20, fontWeight: FontWeight.w700, color: textColor);

  static TextStyle labelMedium(Color textColor) => GoogleFonts.roboto(
      fontSize: 14, fontWeight: FontWeight.w600, color: textColor, height: 1.3);

  static TextStyle labelSmall(Color textColor) => GoogleFonts.roboto(
      fontSize: 16, fontWeight: FontWeight.w400, color: textColor);

  static TextStyle bodyMedium(Color textColor) => GoogleFonts.roboto(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.2,
      height: 1.4,
      color: textColor);
}
