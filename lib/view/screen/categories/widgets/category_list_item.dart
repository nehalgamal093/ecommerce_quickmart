import 'package:ecommerce_shop/models/category_model.dart';
import 'package:ecommerce_shop/view/resources/colors/colors_manager.dart';
import 'package:ecommerce_shop/view/screen/sub_categories/sub_categories_screen.dart';
import 'package:flutter/material.dart';

class CategoryListItem extends StatelessWidget {
  final CategoryModel categoryModel;
  const CategoryListItem({super.key, required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, SubCategoriesScreen.routeName);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: ColorsManager.veryLightGreyColor),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(categoryModel.image,width:50),
            SizedBox(height: 5,),
            Text(categoryModel.title,style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
      ),
    );
  }
}
