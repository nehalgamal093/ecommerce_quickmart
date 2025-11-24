import 'package:ecommerce_shop/features/profile/data/models/payment_request.dart';
import 'package:ecommerce_shop/features/profile/presentation/screens/payment_process/widgets/stepper_buttons.dart';

import '../../../../../auth/presentation/screen/import_files/import_files.dart';
import '../../../../../main/presentation/provider/order_tracking_state.dart';
import '../../check_out/sections/payment_section.dart';
import '../../check_out/sections/review_section.dart';
import '../../check_out/sections/shipping_section.dart';

class PaymentStepper extends StatelessWidget {
  final BillingData billingData;
  const PaymentStepper({super.key, required this.billingData});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<OrderTrackingState>(context);
    return Stepper(
        controlsBuilder: (context, details) {
          return Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                details.currentStep < 2
                    ? StepperButtons(
                        title: 'Continue',
                        onTap: () {
                          provider.changeTrackingState();
                        },
                        color: Colors.white,
                        backgroundColor: Colors.black,
                      )
                    : SizedBox(),
                SizedBox(
                  width: 10,
                ),
                details.currentStep == 0
                    ? SizedBox()
                    : StepperButtons(
                        title: 'Go back',
                        onTap: () {
                          provider.stepCancel();
                        },
                        color: Colors.black,
                        backgroundColor: Colors.transparent,
                      ),
              ],
            ),
          );
        },
        currentStep: provider.index,
        connectorColor: WidgetStateProperty.all(Colors.amber),
        steps: [
          Step(
              title: Text(StringsManager.shipping),
              content: ShippingSection(
                billingData: billingData,
              ),
              subtitle: Image.asset(ImagesManager.box)),
          Step(
              title: Text(StringsManager.payment),
              content: PaymentSection(),
              subtitle: Image.asset(
                ImagesManager.cardTick,
              )),
          Step(
            title: Text(StringsManager.review),
            content: ReviewSection(
              totalPrice: 20000,
              billingData: billingData,
            ),
            subtitle: Image.asset(
              ImagesManager.clipboardTick,
            ),
          ),
        ]);
  }
}
