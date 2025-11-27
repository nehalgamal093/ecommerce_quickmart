import 'package:ecommerce_shop/core/widgets/label_text.dart';
import 'package:ecommerce_shop/features/profile/data/models/payment_request.dart';
import 'package:ecommerce_shop/features/profile/presentation/provider/address_radio_provider.dart';
import 'package:ecommerce_shop/features/profile/presentation/screens/check_out/sections/write_location_manual.dart';
import 'package:ecommerce_shop/features/profile/presentation/screens/check_out/widgets/inputs/phone_number_input.dart';
import 'package:ecommerce_shop/features/profile/presentation/screens/check_out/widgets/inputs/username_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../core/resources/colors/colors_manager.dart';
import '../../../../../../core/resources/constants/strings_manager.dart';
import '../../../../../map/presentation/screens/map_screen/map_screen.dart';
import '../../../../../product_info/presentation/provider/hide_show_bottom_nav.dart';
import '../../shipping_address/providers/cities_province_provider.dart';

class ShippingSection extends StatefulWidget {
  final BillingData billingData;
  const ShippingSection({super.key, required this.billingData});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection> {
  @override
  Widget build(BuildContext context) {
    var provinceProvider =
        Provider.of<CityProvinceProvider>(context, listen: false);
    var manualProvider = Provider.of<AddressRadioProvider>(context);

    return Column(
      children: [
        LabelText(label: StringsManager.fullName),
        SizedBox(
          height: 10,
        ),
        UsernameInput(billingData: widget.billingData),
        SizedBox(
          height: 15,
        ),
        LabelText(label: StringsManager.phoneNumber),
        SizedBox(
          height: 10,
        ),
        PhoneNumberInput(billingData: widget.billingData),
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
                billingData: widget.billingData,
                provinceProvider: provinceProvider,
              )
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
                }),
            Text('Pick From Map'),
            Icon(Icons.location_on_rounded, color: ColorsManager.redColor)
          ],
        ),

      ],
    );
  }
} //92
