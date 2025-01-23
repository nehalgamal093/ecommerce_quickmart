import 'package:ecommerce_shop/models/category_model.dart';
import 'package:ecommerce_shop/view/resources/colors/colors_manager.dart';
import 'package:ecommerce_shop/view/resources/strings_manager.dart';
import 'package:ecommerce_shop/view/screen/home/widgets/category_item.dart';
import 'package:ecommerce_shop/view/screen/home/widgets/label_section.dart';
import 'package:flutter/material.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        LabelSection(label: StringsManager.categories),
        Expanded(
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CategoryItem(
                  categoryModel: CategoryModel.getItem(index),
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                    width: 10,
                  ),
              itemCount: CategoryModel.length),
        )
      ],
    );
  }
}
