import 'package:ecommerce_shop/features/categories/data/models/categories.dart';
import 'package:flutter/material.dart';

import '../../../core/resources/colors/colors_manager.dart';

class CategoryItem extends StatelessWidget {
  final Result categoryModel;
  const CategoryItem({super.key, required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Container(
      height: isPortrait ? size.height * .15 : size.height * .25,
      width: isPortrait ? size.width * .20 : size.width * .10,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: ColorsManager.veryLightGreyColor),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Image.network(
              categoryModel.image!,
              width: 50,
            ),
          ),
          SizedBox(
            height: isPortrait ? size.height * .01 : size.height * .01,
          ),
          Text(
            categoryModel.name!,
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                color: ColorsManager.blackColor,
                overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
    );
  }
}
