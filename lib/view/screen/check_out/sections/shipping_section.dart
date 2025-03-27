import 'package:ecommerce_shop/core/widgets/custom_btn_widget.dart';
import 'package:ecommerce_shop/core/widgets/custom_textfield_widget.dart';
import 'package:ecommerce_shop/core/widgets/label_text.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';

import '../../../../provider/order_tracking_state.dart';
import '../../../resources/colors/colors_manager.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection> {
  TextEditingController nameController = TextEditingController();
  TextEditingController streetAddressController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<OrderTrackingState>(context);
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        LabelText(label: 'Full Name'),
        SizedBox(
          height: 10,
        ),
        CustomTextFieldWidget(hintText: 'Enter full name',controller: nameController,),
        SizedBox(
          height: 15,
        ),
        LabelText(label: 'Phone Number'),
        SizedBox(
          height: 10,
        ),
        IntlPhoneField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: ColorsManager.lightGreyColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorsManager.lightGreyColor),
            ),
          ),
          initialCountryCode: 'EG',
          onChanged: (phone) {

          },
        ),
        SizedBox(
          height: 10,
        ),
        DropdownMenu(
          width: size.width,
          dropdownMenuEntries: [],
          hintText: 'Select Province',
          inputDecorationTheme: InputDecorationTheme(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: ColorsManager.lightGreyColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: ColorsManager.lightGreyColor),
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        DropdownMenu(
          width: size.width,
          dropdownMenuEntries: [],
          hintText: 'Select City',
          inputDecorationTheme: InputDecorationTheme(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: ColorsManager.lightGreyColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: ColorsManager.lightGreyColor),
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        LabelText(label: 'Street Address'),
        SizedBox(
          height: 10,
        ),
        CustomTextFieldWidget(hintText: 'Enter street address',controller: streetAddressController,),
        SizedBox(
          height: 15,
        ),
        LabelText(label: 'Postal Code'),
        SizedBox(
          height: 15,
        ),
        CustomTextFieldWidget(hintText: 'Enter postal code',controller:postalCodeController ,),
        SizedBox(
          height: 20,
        ),
        CustomBtnWidget(title: 'Save', onPressed: () {
          provider.changeTrackingState(1);
        })
      ],
    );
  }
}
