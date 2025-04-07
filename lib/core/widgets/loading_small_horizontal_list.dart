import 'package:flutter/material.dart';

import '../resources/colors/colors_manager.dart';

class LoadingSmallHorizontalList extends StatelessWidget {
  const LoadingSmallHorizontalList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return loadingListItem();
              },
              separatorBuilder: (context, index) => SizedBox(
                    width: 10,
                  ),
              itemCount: 10),
        )
      ],
    );
  }
}

Widget loadingListItem() {
  return Container(
    width: 76,
    height: 60,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: ColorsManager.veryLightGreyColor),
  );
}
