import 'package:intl_phone_field/intl_phone_field.dart';
import '../../../../../../auth/presentation/screen/import_files/import_files.dart';
import '../../../../../data/models/payment_request.dart';
import '../../../../provider/input_validation_provider.dart';

class PhoneNumberInput extends StatelessWidget {
  final BillingData billingData;
  const PhoneNumberInput({super.key, required this.billingData});

  @override
  Widget build(BuildContext context) {
    var validatorProvider = Provider.of<InputValidationProvider>(context);
    return IntlPhoneField(
      decoration: InputDecoration(
        errorText: validatorProvider.errorPhoneNumber,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: ColorsManager.lightGreyColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorsManager.lightGreyColor),
        ),
      ),
      initialCountryCode: StringsManager.countryCode,
      onChanged: (phone) {
        validatorProvider.phoneNumber = '${phone.number}';
        validatorProvider.isPhoneNumberValid();
        billingData.setPhoneNumber('${phone.countryCode}${phone.number}');
        // provinceProvider.changePhone('${phone.countryCode}${phone.number}');
      },
    );
  }
}
