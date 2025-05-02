import 'package:flutter/material.dart';

import '../resources/colors/colors_manager.dart';

class LoadingGrid extends StatelessWidget {
  final double height;
  const LoadingGrid({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: GridView.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 10,
                    childAspectRatio: 160 / height),
                itemBuilder: (context, index) {
                  return loadingItem();
                }),
          ),
        ],
      ),
    );
  }
}

Widget loadingItem() {
  return Container(
    decoration: BoxDecoration(
      color: ColorsManager.veryLightGreyColor,
      borderRadius: BorderRadius.circular(16),
    ),
  );
}
