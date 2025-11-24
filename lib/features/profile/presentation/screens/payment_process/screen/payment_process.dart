import 'package:ecommerce_shop/features/profile/presentation/screens/payment_process/widgets/payment_stepper.dart';
import '../../../../../../core/logic/Animation/route_animation.dart';
import '../../../../../../core/widgets/custom_btn_widget.dart';
import '../../../../../auth/presentation/screen/import_files/import_files.dart';
import '../../../../../cart/data/models/cart_model.dart';
import '../../../../../main/presentation/provider/order_tracking_state.dart';
import '../../../../../payment_webview/presentation/screens/payment_webview.dart';
import '../../../../../product_info/presentation/provider/hide_show_bottom_nav.dart';
import '../../../../data/models/payment_request.dart';
import '../../../bloc/payment_bloc/payment_bloc.dart';

class PaymentProcess extends StatefulWidget {
  final List<CartItem> cartItems;
  final num totalPrice;

  const PaymentProcess(
      {super.key, required this.cartItems, required this.totalPrice});

  @override
  State<PaymentProcess> createState() => _PaymentProcessState();
}

class _PaymentProcessState extends State<PaymentProcess> {
  final BillingData billingData = BillingData();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<OrderTrackingState>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Process'),
      ),
      body: BlocProvider(
        create: (context) => getIt<PaymentBloc>(),
        child:
            BlocConsumer<PaymentBloc, PaymentState>(listener: (context, state) {
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
        }, builder: (context, state) {
          return Column(
            children: [
              Flexible(
                flex: 1,
                child: PaymentStepper(billingData: billingData),
              ),
              provider.index == 2
                  ? Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CustomBtnWidget(
                          title: StringsManager.placeOrder,
                          onPressed: () async {
                            context.read<PaymentBloc>().add(
                                  ProcessPaymentEvent(
                                    payRequest(billingData),
                                  ),
                                );
                          }),
                    )
                  : SizedBox()
            ],
          );
        }),
      ),
    );
  }

  PaymentRequest payRequest(BillingData billingData) {
    List<Items> items = widget.cartItems
        .map((e) => Items(
            name: e.product?.title,
            amount: e.price,
            description: e.product?.description,
            quantity: e.quantity))
        .toList();
    PaymentRequest paymentRequest = PaymentRequest();
    paymentRequest.setValues(billingData, items, widget.totalPrice);
    return paymentRequest;
  }
}