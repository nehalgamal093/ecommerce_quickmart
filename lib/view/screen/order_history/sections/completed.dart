import 'package:ecommerce_shop/view/screen/order_history/widgets/productWithLabel.dart';
import 'package:flutter/material.dart';

class Completed extends StatelessWidget {
  const Completed({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 2,
        itemBuilder: (context,index){
      return ProductWithLabel();
    });
  }
}
