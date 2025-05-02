import 'package:ecommerce_shop/core/widgets/button_logo.dart';
import 'package:ecommerce_shop/core/widgets/custom_btn_widget.dart';
import 'package:ecommerce_shop/core/widgets/custom_textfield_widget.dart';
import 'package:ecommerce_shop/core/widgets/label_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/resources/assets_manager/images_manager.dart';
import '../../../../../../core/resources/constants/strings_manager.dart';
import '../../../../../main/presentation/provider/order_tracking_state.dart';

class PaymentSection extends StatefulWidget {
  const PaymentSection({super.key});

  @override
  State<PaymentSection> createState() => _PaymentSectionState();
}

class _PaymentSectionState extends State<PaymentSection> {
  TextEditingController cardHolderController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expirationController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<OrderTrackingState>(context);
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: ButtonLogo(image: ImagesManager.googlePay),
            ),
            SizedBox(width: 10),
            Expanded(child: ButtonLogo(image: ImagesManager.payPal)),
          ],
        ),
        SizedBox(
          height: 24,
        ),
        LabelText(label: StringsManager.cardHolderName),
        SizedBox(
          height: 5,
        ),
        CustomTextFieldWidget(
          hintText: StringsManager.enterCardHolderName,
          controller: cardHolderController,
        ),
        SizedBox(
          height: 15,
        ),
        LabelText(label: StringsManager.cardNumber),
        SizedBox(
          height: 5,
        ),
        CustomTextFieldWidget(
          hintText: StringsManager.dummyCardNumber,
          controller: cardNumberController,
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  LabelText(label: StringsManager.expiration),
                  SizedBox(
                    height: 5,
                  ),
                  CustomTextFieldWidget(
                    hintText: StringsManager.dateTemplate,
                    controller: expirationController,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                children: [
                  LabelText(label: StringsManager.cvv),
                  SizedBox(
                    height: 5,
                  ),
                  CustomTextFieldWidget(
                    hintText: StringsManager.dummyCVV,
                    controller: cvvController,
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: 100,
        ),
        CustomBtnWidget(
            title: StringsManager.continueProcess,
            onPressed: () {
              provider.changeTrackingState(2);
            })
      ],
    );
  }
}
