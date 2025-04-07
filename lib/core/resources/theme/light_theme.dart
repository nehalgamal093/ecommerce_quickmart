import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../colors/colors_manager.dart';
import 'base_theme.dart';

class LightTheme extends BaseTheme {
  @override
  Color get background => ColorsManager.whiteColor;

  @override
  Color get primaryColor => ColorsManager.cyanColor;

  @override
  Color get textColor => ColorsManager.blackColor;

  @override
  ThemeData get myThemeData => ThemeData(
      scaffoldBackgroundColor: background,
      appBarTheme: AppBarTheme(backgroundColor: background),
      textTheme: TextTheme(
        titleLarge: GoogleFonts.plusJakartaSans(
          fontSize: 24,
          color: textColor,
          fontWeight: FontWeight.w700,
        ),
        bodySmall: GoogleFonts.plusJakartaSans(
          fontSize: 14,
          color: ColorsManager.greyColor,
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: GoogleFonts.plusJakartaSans(
          fontSize: 12,
          color: ColorsManager.blackColor,
          fontWeight: FontWeight.w700,
        ),
        displaySmall: GoogleFonts.plusJakartaSans(
          fontSize: 10,
          color: ColorsManager.whiteColor,
          fontWeight: FontWeight.w500,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: background,
      ));
}
