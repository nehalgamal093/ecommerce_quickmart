import 'package:flutter/material.dart';

import '../check_out/sections/shipping_section.dart';

class ShippingAddress extends StatelessWidget {
  static const String routeName = '/shipping_address';
  const ShippingAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Shipping Address'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                ShippingSection(),
              ],
            ),
          ),
        ),);
  }
}
