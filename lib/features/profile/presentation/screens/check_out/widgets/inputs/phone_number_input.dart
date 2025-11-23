import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../../../auth/presentation/screen/import_files/import_files.dart';
import '../../../../../data/models/payment_request.dart';
import '../../../shipping_address/providers/cities_province_provider.dart';

class PhoneNumberInput extends StatelessWidget {
  final BillingData billingData;
  const PhoneNumberInput({super.key,required this.billingData});

  @override
  Widget build(BuildContext context) {
    var provinceProvider =
    Provider.of<CityProvinceProvider>(context, listen: false);
    return IntlPhoneField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: ColorsManager.lightGreyColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorsManager.lightGreyColor),
        ),
      ),
      initialCountryCode: StringsManager.countryCode,
      onChanged: (phone) {
        billingData.setPhoneNumber('${phone.countryCode}${phone.number}');
        // provinceProvider.changePhone('${phone.countryCode}${phone.number}');

      },
    );
  }
}
