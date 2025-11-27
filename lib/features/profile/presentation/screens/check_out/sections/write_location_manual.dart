import 'package:ecommerce_shop/features/profile/data/models/payment_request.dart';
import '../../../../../../core/data/cities.dart';
import '../../../../../../core/widgets/custom_drop_down.dart';
import '../../../../../../core/widgets/custom_textfield_widget.dart';
import '../../../../../auth/presentation/screen/import_files/import_files.dart';
import '../../../provider/input_validation_provider.dart';
import '../../shipping_address/providers/cities_province_provider.dart';

class WriteLocationManual extends StatelessWidget {
  final CityProvinceProvider provinceProvider;
  final BillingData billingData;
  const WriteLocationManual(
      {super.key, required this.provinceProvider, required this.billingData});

  @override
  Widget build(BuildContext context) {
    var validatorProvider = Provider.of<InputValidationProvider>(context);

    return Column(
      children: [
        CustomDropDown(
            errorText: validatorProvider.errorState,
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
              validatorProvider.state = val!;
              validatorProvider.isStateValid();
              provinceProvider.changeProvince(val);
              billingData.setState(val);
            }),
        SizedBox(
          height: 15,
        ),
        CustomDropDown(
            errorText: validatorProvider.errorCity,
            value: provinceProvider.province.isEmpty
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
              validatorProvider.city = val!;
              validatorProvider.isCityValid();
              provinceProvider.changeCity(val);
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
          errorText: validatorProvider.errorStreetAddress,
          hintText: StringsManager.enterStreetAddress,
          onChanged: (val) {
            validatorProvider.streetAddress = val;
            validatorProvider.isStreetAddressValid();
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
          errorText: validatorProvider.errorPostalCode,
          hintText: StringsManager.enterPostalCode,
          onChanged: (val) {
            validatorProvider.postalCode = val;
            validatorProvider.isPostalCodeValid();
          },
        ),
      ],
    );
  }

  List<String> getCities(String province) {
    return province.isEmpty ? [] : Cities().getCitiesByProvince()[province]!;
  }
}
