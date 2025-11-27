import 'package:ecommerce_shop/core/extensions/text_theme.dart';
import 'package:flutter/material.dart';
import '../resources/colors/colors_manager.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final String hintText;
  final int maxLines;
  final Widget icon;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final bool isObscure;
  final String errorText;
  const CustomTextFieldWidget({
    super.key,
    required this.hintText,
    this.maxLines = 1,
    this.controller,
    this.onChanged,
    this.isObscure = false,
    this.icon = const SizedBox(),
    this.errorText =""
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscure,
      maxLines: maxLines,
      controller: controller,
      onChanged: onChanged,

      decoration: InputDecoration(
        errorText: errorText,
        hintText: hintText,
        hintStyle: context.bodySmall!.copyWith(
            color: ColorsManager.lightGreyColor, fontWeight: FontWeight.w200),
        suffixIcon: icon,
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
