import 'package:ecommerce_shop/features/categories/data/models/categories.dart';
import 'package:ecommerce_shop/view/resources/colors/colors_manager.dart';
import 'package:flutter/material.dart';

class CategoryListItem extends StatelessWidget {
  final Result categoryModel;

  const CategoryListItem({super.key, required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ColorsManager.veryLightGreyColor),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(categoryModel.image!, width: 50),
          SizedBox(
            height: 5,
          ),
          Text(
            categoryModel.name ?? "",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
