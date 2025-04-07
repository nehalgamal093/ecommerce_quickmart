import 'package:flutter/material.dart';

import '../check_out/sections/payment_section.dart';


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

