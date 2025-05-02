import 'package:flutter/material.dart';
import '../../../core/resources/colors/colors_manager.dart';

class CustomButton extends StatelessWidget {
  final Function()? onPressed;
  final String title;
  final Color color;
  final Color borderColor;
  final Color textColor;
  final Widget icon;
  const CustomButton(
      {super.key,
      required this.onPressed,
      required this.title,
      required this.color,
      this.borderColor = ColorsManager.blackColor,
      this.textColor = ColorsManager.whiteColor,
      this.icon = const SizedBox()});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 21),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: borderColor),
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          backgroundColor: color),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: textColor, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: 5,
          ),
          icon
        ],
      ),
    );
  }
}
