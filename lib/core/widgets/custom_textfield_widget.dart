import 'package:flutter/material.dart';

import '../../view/resources/colors/colors_manager.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final String hintText;
  const CustomTextFieldWidget({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: ColorsManager.lightGreyColor, fontWeight: FontWeight.w200),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          borderSide: BorderSide(color: ColorsManager.lightGreyColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          borderSide: BorderSide(color: ColorsManager.lightGreyColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          borderSide: BorderSide(color: ColorsManager.lightGreyColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          borderSide: BorderSide(color: ColorsManager.lightGreyColor),
        ),
      ),
    );
  }
}
