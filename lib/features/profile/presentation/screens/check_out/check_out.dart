import 'package:ecommerce_shop/features/profile/presentation/screens/check_out/sections/payment_section.dart';
import 'package:ecommerce_shop/features/profile/presentation/screens/check_out/sections/review_section.dart';
import 'package:ecommerce_shop/features/profile/presentation/screens/check_out/sections/shipping_section.dart';
import 'package:ecommerce_shop/features/profile/presentation/screens/check_out/widgets/checkout_tracker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import '../../../../../core/di/di.dart';
import '../../../../../core/resources/constants/strings_manager.dart';
import '../../../../../core/widgets/custom_btn_widget.dart';
import '../../../../cart/data/models/cart_model.dart';
import '../../../../main/presentation/provider/order_tracking_state.dart';
import '../../../../payment_webview/presentation/screens/payment_webview.dart';
import '../../../data/models/payment_request.dart';
import '../../bloc/payment_bloc/payment_bloc.dart';
import '../../provider/payment_provider.dart';

class Checkout extends StatelessWidget {
  final List<CartItem> cartItems;
  final num totalPrice;
  static const String routeName = "/checkout";
  const Checkout(
      {super.key, required this.cartItems, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<OrderTrackingState>(context);
    var paymentProvider = Provider.of<PaymentProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(StringsManager.checkout),
      ),
      body: BlocProvider(
        create: (context) => getIt<PaymentBloc>(),
        child:
            BlocConsumer<PaymentBloc, PaymentState>(listener: (context, state) {
          if (state.paymentRequestState == PaymentRequestState.success) {
            var bloc = BlocProvider.of<PaymentBloc>(context);
            Navigator.of(context).pushReplacement(

              MaterialPageRoute(
                builder: (context) =>
                    PaymentWebView(clientSecret: bloc.clientSecret),
              ),
            );
          }
        }, builder: (context, state) {
          return BlocBuilder<PaymentBloc, PaymentState>(
              builder: (context, state) {
            return SingleChildScrollView(
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
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.8,
                        maxHeight: MediaQuery.of(context).size.height * 0.9,
                      ),
                      child: IndexedStack(
                        index: provider.index,
                        children: [
                          ShippingSection(),

                          PaymentSection(),
                          ReviewSection(
                            totalPrice: totalPrice,
                          ),
                          // Add other tabs
                        ],
                      ),
                    ),
                    provider.index == 2
                        ? CustomBtnWidget(
                            title: StringsManager.placeOrder,
                            onPressed: () async {
                              provider.changeTrackingState(0);
                              payRequest(paymentProvider);
                              context.read<PaymentBloc>().add(
                                  ProcessPaymentEvent(
                                      paymentProvider.paymentRequest));
                            })
                        : SizedBox()
                  ],
                ),
              ),
            );
          });
        }),
      ),
    );
  }

  void payRequest(PaymentProvider paymentProvider) {
    List<Items> items = cartItems
        .map((e) => Items(
            name: e.product?.title,
            amount: e.price,
            description: e.product?.description,
            quantity: e.quantity))
        .toList();
    PaymentRequest paymentRequest = PaymentRequest(
        amount: totalPrice,
        currency: StringsManager.egp,
        paymentMethodsList: [5048616],
        itemsList: items,
        billingData: paymentProvider.billingData,
        extras: Extras(ee: 100),
        specialReference: UniqueKey().hashCode.toString(),
        expiration: 3600,
        notificationUrl: dotenv.env['NOTIFICATION_URL']!,
        redirectionUrl: dotenv.env['REDIRECTION_URL']!);
    paymentProvider.setPaymentRequest(paymentRequest);
  }
}
