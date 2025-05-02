import 'package:flutter/material.dart';

import '../resources/colors/colors_manager.dart';

class LoadingSmallHorizontalList extends StatelessWidget {
  const LoadingSmallHorizontalList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 100,
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
    height: 70,
    width: 70,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: ColorsManager.veryLightGreyColor),
  );
}
