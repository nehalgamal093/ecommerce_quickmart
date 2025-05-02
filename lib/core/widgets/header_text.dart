import 'package:flutter/material.dart';
import '../resources/colors/colors_manager.dart';

class HeaderText extends StatelessWidget {
  final String title;
  final String text;
  final String span;
  const HeaderText(
      {super.key, required this.title, required this.text, required this.span});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(
          height: 5,
        ),
        RichText(
          text: TextSpan(children: [
            TextSpan(text: text, style: Theme.of(context).textTheme.bodySmall),
            TextSpan(
              text: span,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: ColorsManager.cyanColor),
            )
          ]),
        ),
      ],
    );
  }
}
