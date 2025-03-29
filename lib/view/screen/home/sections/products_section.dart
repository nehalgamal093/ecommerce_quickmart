import 'package:ecommerce_shop/features/products/data/models/products.dart';
import 'package:ecommerce_shop/view/common_widgets/product_item.dart';
import 'package:flutter/material.dart';

import '../../../../features/product_info/presentation/screens/product_details/product_details.dart';

class ProductsSection extends StatelessWidget {
  final Products products;
  const ProductsSection({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(childCount: products.result!.length,
          (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ProductDetails(id: products.result![index].id!),
              ),
            );
          },
          child: ProductItem(
            productModel: products.result![index],
          ),
        );
      }),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
          childAspectRatio: 150 / 270),
    );
  }
}
