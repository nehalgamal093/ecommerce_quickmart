import 'package:flutter/material.dart';

import '../resources/colors/colors_manager.dart';

class CustomDropDown extends StatelessWidget {
  final String hintText;
  final List<DropdownMenuItem<String>>? items;
  final void Function(String?)? onChanged;
  final String? value;
  const CustomDropDown(
      {super.key,
      required this.hintText,
      required this.items,
      required this.onChanged,
      this.value});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: ColorsManager.lightGreyColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: ColorsManager.lightGreyColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: ColorsManager.redAccentColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: ColorsManager.redAccentColor),
        ),
      ),
      value: value,
      hint: Text(hintText),
      items: items,
      onChanged: onChanged,
    );
  }
}
