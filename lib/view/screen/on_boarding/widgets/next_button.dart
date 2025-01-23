import 'package:ecommerce_shop/view/screen/on_boarding/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import '../../../resources/colors/colors_manager.dart';

class NextButton extends StatelessWidget {
  final Function()? onPressed;
  const NextButton({super.key,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child:CustomButton(onPressed: onPressed, title: 'Next', color: ColorsManager.blackColor),
        ),
      ],
    );
  }
}
