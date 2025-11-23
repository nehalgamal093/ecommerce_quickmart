import 'package:ecommerce_shop/features/profile/data/models/payment_request.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/data/cities.dart';
import '../../../../../../core/resources/constants/strings_manager.dart';
import '../../../../../../core/widgets/custom_drop_down.dart';
import '../../../../../../core/widgets/custom_textfield_widget.dart';
import '../../../../../../core/widgets/label_text.dart';
import '../../shipping_address/providers/cities_province_provider.dart';

class WriteLocationManual extends StatelessWidget {
   final CityProvinceProvider provinceProvider;
  final BillingData billingData;
  const WriteLocationManual(
      {super.key,
      required this.provinceProvider,
      required this.billingData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomDropDown(
            hintText: StringsManager.selectProvince,
            items: Cities()
                .getProvinceNames()
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (val) {
               provinceProvider.changeProvince(val!);
              billingData.setState(val);
            }),
        SizedBox(
          height: 15,
        ),
        CustomDropDown(
            value:provinceProvider.province.isEmpty
                ? null
                : getCities(provinceProvider.province)[0],
            hintText: StringsManager.selectCity,
            items: getCities(provinceProvider.province)
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (val) {
              provinceProvider.changeCity(val!);
              billingData.setCity(val);
            }),
        SizedBox(
          height: 15,
        ),
        LabelText(label: StringsManager.streetAddress),
        SizedBox(
          height: 10,
        ),
        CustomTextFieldWidget(
          hintText: StringsManager.enterStreetAddress,
          onChanged: (val){
            billingData.setStreet(val);
          },
        ),
        SizedBox(
          height: 15,
        ),
        LabelText(label: StringsManager.postalCode),
        SizedBox(
          height: 15,
        ),
        CustomTextFieldWidget(
          hintText: StringsManager.enterPostalCode,
          onChanged: (val){

          },
        ),
      ],
    );
  }

  List<String> getCities(String province) {
    return province.isEmpty ? [] : Cities().getCitiesByProvince()[province]!;
  }
}
