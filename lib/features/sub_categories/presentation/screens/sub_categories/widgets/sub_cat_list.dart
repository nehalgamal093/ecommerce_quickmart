import 'package:ecommerce_shop/features/sub_categories/presentation/screens/sub_categories/widgets/sub_categories_item.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/logic/Animation/route_animation.dart';
import '../../../../../categories/data/models/categories.dart';
import '../../../../../products/presentation/screens/products_screen/products_screen.dart';

class SubCatList extends StatelessWidget {
  final Categories categories;
  const SubCatList({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return GridView.builder(
        itemCount: categories.result!.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 10,
            childAspectRatio: isPortrait ? 160 / 180 : 120 / 60),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(
                RouteAnimation.createRoute(
                  ProductsScreen(
                    id: categories.result![index].id!,
                    title: categories.result![index].name!,
                  ),
                ),
              );
            },
            child: SubCategoriesItem(categoryModel: categories.result![index]),
          );
        });
  }
}
