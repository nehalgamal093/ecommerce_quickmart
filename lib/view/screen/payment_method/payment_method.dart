import 'package:ecommerce_shop/view/screen/check_out/sections/payment_section.dart';
import 'package:flutter/material.dart';


class PaymentMethod extends StatelessWidget {
  static const String routeName = '/payment_method';
  const PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Payment Method'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              PaymentSection(),
            ],
          ),
        ));
  }
}

