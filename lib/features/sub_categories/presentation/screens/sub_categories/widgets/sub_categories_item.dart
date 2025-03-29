import 'package:ecommerce_shop/features/categories/data/models/categories.dart';
import 'package:ecommerce_shop/view/resources/colors/colors_manager.dart';
import 'package:flutter/material.dart';

import '../../../../../products/presentation/screens/products_screen/products_screen.dart';

class SubCategoriesItem extends StatelessWidget {
  final Result categoryModel;
  const SubCategoriesItem({super.key, required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(

      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              categoryModel.image!,
              fit: BoxFit.cover,
              width: size.width * .40,
              height: size.height * .20,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              categoryModel.name!,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.w700, color: ColorsManager.blackColor),
            )
          ],
        ),
      ),
    );
  }
}
