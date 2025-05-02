import 'package:ecommerce_shop/features/products/data/models/products.dart';
import 'package:flutter/material.dart';

import '../../../../../core/logic/Animation/route_animation.dart';
import '../../../../../core/widgets/product_item.dart';
import '../../../../product_info/presentation/screens/product_details/product_details.dart';

class ProductsList extends StatelessWidget {
  final Products products;
  const ProductsList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Expanded(
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 10,
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  childAspectRatio: 150 / 270),
              itemCount: products.result!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      RouteAnimation.createRoute(
                        ProductDetails(id: products.result![index].id!),
                      ),
                    );
                  },
                  child: ProductItem(productModel: products.result![index]),
                );
              }),
        )
      ],
    );
  }
}
//--
