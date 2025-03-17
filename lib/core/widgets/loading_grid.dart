import 'package:ecommerce_shop/view/resources/colors/colors_manager.dart';
import 'package:flutter/material.dart';

class LoadingGrid extends StatelessWidget {
  const LoadingGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return   Padding(
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
                    childAspectRatio: 160 / 100),
                itemBuilder: (context, index) {
                  return loadingItem();
                }),
          ),
        ],
      ),
    );
  }
}
Widget loadingItem(){
  return Container(
    decoration: BoxDecoration(
      color: ColorsManager.veryLightGreyColor,
      borderRadius: BorderRadius.circular(16),
    ),

  );
}