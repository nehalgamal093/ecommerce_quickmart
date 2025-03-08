import 'package:ecommerce_shop/view/screen/check_out/sections/shipping_section.dart';
import 'package:ecommerce_shop/view/screen/check_out/widgets/checkout_tracker.dart';
import 'package:flutter/material.dart';

class Checkout extends StatelessWidget {
  static const String routeName = "/checkout";
   Checkout({super.key});
  int currIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            CheckoutTracker(currIndex: currIndex,),
            SizedBox(height: 20,),
            ShippingSection()
          ],
        ),
      ),
    );
  }
}
