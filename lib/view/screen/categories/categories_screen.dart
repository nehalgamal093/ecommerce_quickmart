import 'package:ecommerce_shop/models/category_model.dart';
import 'package:ecommerce_shop/view/screen/categories/widgets/category_list_item.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Categories'),
        ),
        body: Column(
          children: [
            SizedBox(height: 30,),
            Expanded(
              child: GridView.builder(
                  itemCount: CategoryModel.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 160 / 100),
                  itemBuilder: (context, index) {
                    return CategoryListItem(
                      categoryModel: CategoryModel.getItem(index),
                    );
                  }),
            )
          ],
        ));
  }
}
