import 'package:flutter/material.dart';

import '../../../../../../core/resources/colors/colors_manager.dart';

class TitleIconWidget extends StatelessWidget {
  final Widget widget;
  final String title;
  final String icon;
  final VoidCallback onPressed;
  const TitleIconWidget(
      {super.key,
      required this.icon,
      required this.title,
      this.widget = const Icon(Icons.arrow_forward_ios_outlined,
          color: ColorsManager.greyColor),
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        children: [
          Image.asset(icon, color: ColorsManager.greyColor),
          SizedBox(
            width: 5,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.w500, color: ColorsManager.greyColor),
          ),
          Spacer(),
          widget
        ],
      ),
    );
  }
}
