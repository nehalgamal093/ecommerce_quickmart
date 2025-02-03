import 'package:ecommerce_shop/models/category_model.dart';
import 'package:ecommerce_shop/view/resources/strings_manager.dart';
import 'package:ecommerce_shop/view/screen/sub_categories/widgets/sub_categories_item.dart';
import 'package:flutter/material.dart';

class SubCategoriesScreen extends StatelessWidget {
  static const String routeName = '/sub_categories';
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringsManager.electronics),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(

          children: [
            SizedBox(
              height: 30,
            ),
            Expanded(
                child: GridView.builder(
                    itemCount: CategoryModel.subCategories.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return SubCategoriesItem(
                          categoryModel: CategoryModel.subCategories[index]);
                    }),)
          ],
        ),
      ),
    );
  }
}
