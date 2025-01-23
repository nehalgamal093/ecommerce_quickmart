import 'package:ecommerce_shop/models/category_model.dart';
import 'package:ecommerce_shop/view/resources/colors/colors_manager.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel categoryModel;
  const CategoryItem({super.key, required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 76,
      height: 60,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: ColorsManager.veryLightGreyColor),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            categoryModel.image,
            width: 25,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            categoryModel.title,
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                color: ColorsManager.blackColor,
                overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
    );
  }
}
