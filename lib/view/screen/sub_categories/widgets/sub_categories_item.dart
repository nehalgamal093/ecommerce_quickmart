import 'package:ecommerce_shop/models/category_model.dart';
import 'package:ecommerce_shop/view/resources/colors/colors_manager.dart';
import 'package:ecommerce_shop/view/screen/products_screen/products_screen.dart';
import 'package:flutter/material.dart';

class SubCategoriesItem extends StatelessWidget {
  final CategoryModel categoryModel;
  const SubCategoriesItem({super.key, required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, ProductsScreen.routeName);
      },
      child: SizedBox(
        width: 200,
        height: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              categoryModel.image,
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              categoryModel.title,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.w700, color: ColorsManager.blackColor),
            )
          ],
        ),
      ),
    );
  }
}
