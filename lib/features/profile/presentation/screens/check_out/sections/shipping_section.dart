import 'package:ecommerce_shop/core/widgets/custom_btn_widget.dart';
import 'package:ecommerce_shop/core/widgets/custom_textfield_widget.dart';
import 'package:ecommerce_shop/core/widgets/label_text.dart';
import 'package:ecommerce_shop/features/profile/data/models/address_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';
import '../../../../../../core/data/cities.dart';
import '../../../../../../core/provider/order_tracking_state.dart';
import '../../../../../../core/resources/colors/colors_manager.dart';
import '../../../bloc/profile_bloc.dart';
import '../../shipping_address/providers/cities_province_provider.dart';


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
    var provinceProvider = Provider.of<CityProvinceProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        LabelText(label: 'Full Name'),
        SizedBox(
          height: 10,
        ),
        CustomTextFieldWidget(
          hintText: 'Enter full name',
          controller: nameController,
        ),
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
            provinceProvider
                .changePhone('${phone.countryCode}${phone.number}');
          },
        ),
        SizedBox(
          height: 10,
        ),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: ColorsManager.lightGreyColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: ColorsManager.lightGreyColor),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: ColorsManager.redAccentColor),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: ColorsManager.redAccentColor),
            ),
          ),
          hint: Text('Select Province'),
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
           
          },
        ),
        SizedBox(
          height: 15,
        ),
        DropdownButtonFormField<String>(
          value: provinceProvider.province.isEmpty
              ? null
              : getCities(provinceProvider.province)[0],
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: ColorsManager.lightGreyColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: ColorsManager.lightGreyColor),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: ColorsManager.redAccentColor),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: ColorsManager.redAccentColor),
            ),
          ),
          hint: Text('Select City'),
          items: getCities(provinceProvider.province)
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (val) {
            provinceProvider.changeCity(val!);
          },
        ),
        SizedBox(
          height: 15,
        ),
        LabelText(label: 'Street Address'),
        SizedBox(
          height: 10,
        ),
        CustomTextFieldWidget(
          hintText: 'Enter street address',
          controller: streetAddressController,
        ),
        SizedBox(
          height: 15,
        ),
        LabelText(label: 'Postal Code'),
        SizedBox(
          height: 15,
        ),
        CustomTextFieldWidget(
          hintText: 'Enter postal code',
          controller: postalCodeController,
        ),
        SizedBox(
          height: 20,
        ),
        BlocConsumer<ProfileBloc, ProfileState>(listener: (context, state) {
          if (state.addAddressRequest == UserRequestState.success) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Address added successfully'),
            ));
            Navigator.pop(context);
          } else if (state.addAddressRequest == UserRequestState.error) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Something went wrong'),
            ));

          }
        }, builder: (context, state) {
          if (state.addAddressRequest == UserRequestState.loading) {
            return CustomBtnWidget(title: 'Loading', onPressed: () {});
          }
          return CustomBtnWidget(
              title: 'Save',
              onPressed: () {
                AddressRequest request = AddressRequest(
                    street:
                        '${provinceProvider.province} ${streetAddressController.text}',
                    city: provinceProvider.city,
                    phone: provinceProvider.phone);
                context.read<ProfileBloc>().add(AddAddressEvent(request));
                provider.changeTrackingState(1);
              });
        })
      ],
    );
  }

  List<String> getCities(String province) {
    return province.isEmpty ? [] : Cities().getCitiesByProvince()[province]!;
  }
}
