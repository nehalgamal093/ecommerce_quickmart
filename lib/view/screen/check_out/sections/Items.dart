import 'package:ecommerce_shop/core/widgets/product_tile_widget.dart';
import 'package:flutter/material.dart';

class Items extends StatelessWidget {
  static const String routeName = '/items';
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Items'),
      ),
      body: ListView.builder(
          itemCount: 2,
          itemBuilder: (context,index){
        return ProductTileWidget(isWishlist: true,name: "Product",description: "Product Description",image:"",price: 10.toString(),priceAfterDiscount: 10.toString(),);
      }),
    );
  }
}
