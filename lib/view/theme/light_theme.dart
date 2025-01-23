import 'package:ecommerce_shop/view/theme/base_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../resources/colors/colors_manager.dart';

class LightTheme extends BaseTheme {
  @override
  Color get background => ColorsManager.whiteColor;

  @override
  Color get primaryColor => Colors.cyan;

  @override
  Color get textColor => Colors.black;

  @override
  ThemeData get myThemeData => ThemeData(
        scaffoldBackgroundColor: background,
        appBarTheme: AppBarTheme(
          backgroundColor: background
        ),
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
        ),
      );
}
