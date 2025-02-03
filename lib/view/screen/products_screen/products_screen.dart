import 'package:ecommerce_shop/models/product_model.dart';
import 'package:ecommerce_shop/view/common_widgets/product_item.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  static const String routeName = '/products_screen';
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Smart Watches'),
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
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 10,
                      crossAxisCount: 2,
                      childAspectRatio: 200 / 270),
                  itemCount: ProductModel.length,
                  itemBuilder: (context, index) {
                    return ProductItem(
                        productModel: ProductModel.products[index]);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
