import 'package:ecommerce_shop/view/resources/colors/colors_manager.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Widget icon;
  const CustomTextField(
      {super.key, required this.hintText, this.icon = const SizedBox()});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodySmall,
        suffixIcon: icon,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
            borderSide: BorderSide(color: ColorsManager.cyanColor)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
            borderSide: BorderSide(color: ColorsManager.cyanColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
            borderSide: BorderSide(color: ColorsManager.cyanColor)),
      ),
    );
  }
}
