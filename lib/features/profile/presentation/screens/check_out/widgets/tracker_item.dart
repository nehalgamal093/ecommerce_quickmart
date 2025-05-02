import 'package:flutter/material.dart';

import '../../../../../../core/resources/colors/colors_manager.dart';

class TrackerItem extends StatelessWidget {
  final String image;
  final String activeImage;
  final String title;
  final Color color;
  const TrackerItem(
      {super.key,
      required this.image,
      required this.title,
      required this.color,
      required this.activeImage});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        color == ColorsManager.cyanColor
            ? Image.asset(activeImage)
            : Image.asset(
                image,
                color: color,
              ),
        Text(
          title,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(color: color),
        )
      ],
    );
  }
}
