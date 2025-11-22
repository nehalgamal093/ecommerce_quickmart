import 'package:ecommerce_shop/features/profile/presentation/screens/check_out/sections/review_section.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../../../../core/logic/Animation/route_animation.dart';
import '../../../../../../core/widgets/custom_btn_widget.dart';
import '../../../../../auth/presentation/screen/import_files/import_files.dart';
import '../../../../../cart/data/models/cart_model.dart';
import '../../../../../main/presentation/provider/order_tracking_state.dart';
import '../../../../../payment_webview/presentation/screens/payment_webview.dart';
import '../../../../../product_info/presentation/provider/hide_show_bottom_nav.dart';
import '../../../../data/models/payment_request.dart';
import '../../../bloc/payment_bloc/payment_bloc.dart';
import '../../../provider/payment_provider.dart';
import '../../check_out/sections/payment_section.dart';
import '../../check_out/sections/shipping_section.dart';

class PaymentProcess extends StatelessWidget {
  final List<CartItem> cartItems;
  final num totalPrice;
  const PaymentProcess({super.key, required this.cartItems, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    var paymentProvider = Provider.of<PaymentProvider>(context);
    var provider = Provider.of<OrderTrackingState>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Process'),
      ),
      body: BlocProvider(
        create: (context) => getIt<PaymentBloc>(),
        child: BlocConsumer<PaymentBloc, PaymentState>(
          listener: (context, state){
            if (state.paymentRequestState == PaymentRequestState.loading) {
              // loadingDialog(context);
            } else if (state.paymentRequestState == PaymentRequestState.success) {
              var bloc = BlocProvider.of<PaymentBloc>(context);
              Provider.of<HideShowBottomNavProvider>(context, listen: false)
                  .hide();
              Navigator.of(context).push(
                RouteAnimation.createRoute(
                  PaymentWebView(clientSecret: bloc.clientSecret),
                ),
              );

              provider.changeTrackingState();
            } else {
              Navigator.pop(context);
            }
          },
          builder: (context,state) {
            return Column(
              children: [
                Flexible(
                  flex: 1,
                  child: Stepper(

                      currentStep: provider.index,
                      onStepContinue: () {
                        provider.changeTrackingState();
                      },
                      onStepCancel: () {
                        provider.stepCancel();
                      },
                      connectorColor: WidgetStateProperty.all(Colors.amber),
                      steps: [
                        Step(
                            title: Text(StringsManager.shipping),
                            content: ShippingSection(),
                            subtitle: Image.asset(ImagesManager.box)),
                        Step(
                            title: Text(StringsManager.payment),
                            content: PaymentSection(),
                            subtitle: Image.asset(
                              ImagesManager.cardTick,
                            )),
                        Step(
                            title: Text(StringsManager.review),
                            content: ReviewSection(totalPrice: 20000),
                            subtitle: Image.asset(
                              ImagesManager.clipboardTick,
                            )),
                      ]),
                ),
                provider.index == 2
                    ? CustomBtnWidget(
                    title: StringsManager.placeOrder,
                    onPressed: () async {
                      payRequest(paymentProvider);
                      context.read<PaymentBloc>().add(
                          ProcessPaymentEvent(
                              paymentProvider.paymentRequest));
                    })
                    : SizedBox()
              ],
            );
          }
        ),
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
