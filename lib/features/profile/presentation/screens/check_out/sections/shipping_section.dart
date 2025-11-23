import 'package:ecommerce_shop/core/widgets/custom_btn_widget.dart';
import 'package:ecommerce_shop/core/widgets/label_text.dart';
import 'package:ecommerce_shop/features/profile/data/models/payment_request.dart';
import 'package:ecommerce_shop/features/profile/presentation/bloc/address_bloc/address_bloc.dart';
import 'package:ecommerce_shop/features/profile/presentation/provider/address_radio_provider.dart';
import 'package:ecommerce_shop/features/profile/presentation/provider/payment_provider.dart';
import 'package:ecommerce_shop/features/profile/presentation/screens/check_out/sections/write_location_manual.dart';
import 'package:ecommerce_shop/features/profile/presentation/screens/check_out/widgets/inputs/phone_number_input.dart';
import 'package:ecommerce_shop/features/profile/presentation/screens/check_out/widgets/inputs/username_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../../../../../core/resources/colors/colors_manager.dart';
import '../../../../../../core/resources/constants/strings_manager.dart';
import '../../../../../map/presentation/screens/map_screen/map_screen.dart';
import '../../../../../product_info/presentation/provider/hide_show_bottom_nav.dart';
import '../../../bloc/profile_bloc/profile_bloc.dart';
import '../../shipping_address/providers/cities_province_provider.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection> {
  BillingData billingData = BillingData();
  @override
  Widget build(BuildContext context) {
    var paymentProvider = Provider.of<PaymentProvider>(context);
    var provinceProvider =
        Provider.of<CityProvinceProvider>(context, listen: false);
    var manualProvider = Provider.of<AddressRadioProvider>(context);

    return Column(
      children: [
        LabelText(label: StringsManager.fullName),
        SizedBox(
          height: 10,
        ),
        UsernameInput(billingData: billingData),
        SizedBox(
          height: 15,
        ),
        LabelText(label: StringsManager.phoneNumber),
        SizedBox(
          height: 10,
        ),
        PhoneNumberInput(billingData: billingData),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Radio(
                value: manualProvider.status,
                groupValue: 'Manual',
                onChanged: (val) {
                  manualProvider.changeManual('Manual');
                }),
            Text('Write Address Manually'),
          ],
        ),
        manualProvider.status == 'Manual'
            ? WriteLocationManual(
                billingData: billingData, provinceProvider: provinceProvider,)
            : SizedBox(),
        SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Radio(
                value: manualProvider.status,
                groupValue: 'Map',
                onChanged: (val) {
                  manualProvider.changeManual('Map');
                  Navigator.pushNamed(
                    context,
                    MapScreen.routeName,
                    arguments: Provider.of<CityProvinceProvider>(context,
                        listen: false),
                  );
                  Provider.of<HideShowBottomNavProvider>(context, listen: false)
                      .hide();
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => MapScreen(
                  //       cityProvince: Provider.of<CityProvinceProvider>(context,
                  //           listen: false),
                  //     ),
                  //   ),
                  // );
                }),
            Text('Pick From Map'),
            Icon(Icons.location_on_rounded, color: ColorsManager.redColor)
          ],
        ),
        SizedBox(
          height: 20,
        ),
        BlocConsumer<AddressBloc, AddressState>(listener: (context, state) {
          if (state.addAddressRequest == AddressRequestState.success) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(StringsManager.addressAddedSuccessfully),
              ),
            );
            Navigator.pop(context);
          } else if (state.addAddressRequest == AddressRequestState.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(StringsManager.somethingWentWrong),
              ),
            );
          }
        }, builder: (context, state) {
          if (state.addAddressRequest == UserRequestState.loading) {
            return CustomBtnWidget(
                title: StringsManager.loading, onPressed: () {});
          }
          return CustomBtnWidget(
              title: StringsManager.save,
              onPressed: () {
                billingData.setApartment(StringsManager.na);
                billingData.setBuilding(StringsManager.na);
                billingData.setFloor(StringsManager.na);
                billingData.setEmail("nehal@gmail.com");
                billingData.setLastName("Negal");
                billingData.setCountry("Canada");
                 paymentProvider.setBillingData(billingData);

                // AddressRequest request = AddressRequest(
                //     street:
                //         '${provinceProvider.province} ${streetAddressController.text}',
                //     city: provinceProvider.city,
                //     phone: provinceProvider.phone);
                // context.read<ProfileBloc>().add(AddAddressEvent(request));
              });
        })
      ],
    );
  }
}
//213
