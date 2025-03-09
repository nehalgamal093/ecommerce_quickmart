import 'package:ecommerce_shop/view/screen/check_out/sections/shipping_section.dart';
import 'package:flutter/material.dart';

class ShippingAddress extends StatelessWidget {
  static const String routeName = '/shipping_address';
  const ShippingAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Shipping Address'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              ShippingSection(),
            ],
          ),
        ));
  }
}
