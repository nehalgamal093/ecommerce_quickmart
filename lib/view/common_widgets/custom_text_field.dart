import 'package:ecommerce_shop/view/resources/colors/colors_manager.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Widget icon;
  final String errorText;
  final int maxLines;
  final Function(String)? onChanged;
  final TextEditingController controller;
  const CustomTextField(
      {super.key, required this.hintText, this.icon = const SizedBox(),required this.controller,required this.onChanged,this.errorText="",this.maxLines=1});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        errorText:errorText.isEmpty?null:errorText,
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
      validator: (val){
        if(val!.isEmpty){
          return 'Field is required';
        }
        return null;
      },
    );
  }
}
