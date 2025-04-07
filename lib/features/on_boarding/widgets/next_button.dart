import 'package:flutter/material.dart';
import '../../../core/resources/colors/colors_manager.dart';
import 'custom_button.dart';

class NextButton extends StatelessWidget {
  final Function()? onPressed;
  const NextButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
              onPressed: onPressed,
              title: 'Next',
              color: ColorsManager.blackColor),
        ),
      ],
    );
  }
}
