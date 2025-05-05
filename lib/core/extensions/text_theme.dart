import 'package:flutter/material.dart';

extension TextThemeExtension on BuildContext{
  TextStyle? get titleLarge => Theme.of(this).textTheme.titleLarge;
  TextStyle? get titleMedium => Theme.of(this).textTheme.titleMedium;
  TextStyle? get bodyMedium => Theme.of(this).textTheme.bodyMedium;
  TextStyle? get titleSmall => Theme.of(this).textTheme.titleSmall;
  TextStyle? get displaySmall => Theme.of(this).textTheme.displaySmall;
  TextStyle? get bodySmall => Theme.of(this).textTheme.bodySmall;
}