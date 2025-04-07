import 'package:ecommerce_shop/core/widgets/button_logo.dart';
import 'package:ecommerce_shop/core/widgets/custom_btn_widget.dart';
import 'package:ecommerce_shop/core/widgets/custom_textfield_widget.dart';
import 'package:ecommerce_shop/core/widgets/label_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../core/provider/order_tracking_state.dart';
import '../../../../../../core/resources/assets_manager/images_manager.dart';

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
        LabelText(label: 'Card Holder Name'),
        SizedBox(
          height: 5,
        ),
        CustomTextFieldWidget(hintText: 'Enter card holder name',controller: cardHolderController,),
        SizedBox(
          height: 15,
        ),
        LabelText(label: 'Card Number'),
        SizedBox(
          height: 5,
        ),
        CustomTextFieldWidget(hintText: '4111 1111 1111',controller: cardNumberController,),
        SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  LabelText(label: 'Expiration'),
                  SizedBox(
                    height: 5,
                  ),
                  CustomTextFieldWidget(hintText: 'MM/YY',controller: expirationController,),
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                children: [
                  LabelText(label: 'CVV'),
                  SizedBox(
                    height: 5,
                  ),
                  CustomTextFieldWidget(hintText: '123',controller: cvvController,),
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: 100,
        ),
        CustomBtnWidget(title: 'Continue', onPressed: () {
          provider.changeTrackingState(2);
        })
      ],
    );
  }
}
