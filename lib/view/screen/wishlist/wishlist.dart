import 'package:ecommerce_shop/core/widgets/product_tile_widget.dart';
import 'package:flutter/material.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'),
      ),
      body: ListView.builder(
          itemCount: 2,
          itemBuilder: (context,index){
        return ProductTileWidget(isWishlist: true,);
      }),
    );
  }
}
