import 'package:ecommerce_shop/features/profile/presentation/screens/check_out/sections/payment_section.dart';
import 'package:ecommerce_shop/features/profile/presentation/screens/check_out/sections/review_section.dart';
import 'package:ecommerce_shop/features/profile/presentation/screens/check_out/sections/shipping_section.dart';
import 'package:ecommerce_shop/features/profile/presentation/screens/check_out/widgets/checkout_tracker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/provider/order_tracking_state.dart';

class Checkout extends StatelessWidget {
  static const String routeName = "/checkout";
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<OrderTrackingState>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              CheckoutTracker(
                currIndex: provider.index,
              ),
              SizedBox(
                height: 20,
              ),
              trackingState(provider.index)
            ],
          ),
        ),
      ),
    );
  }

  Widget trackingState(int index) {
    if (index == 0) {
      return ShippingSection();
    } else if (index == 1) {
      return PaymentSection();
    } else {
      return ReviewSection();
    }
  }
}
