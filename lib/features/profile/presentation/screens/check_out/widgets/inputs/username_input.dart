import 'package:ecommerce_shop/features/profile/data/models/payment_request.dart';
import 'package:ecommerce_shop/features/profile/presentation/provider/input_validation_provider.dart';

import '../../../../../../../core/widgets/custom_textfield_widget.dart';
import '../../../../../../auth/presentation/screen/import_files/import_files.dart';

class UsernameInput extends StatelessWidget {
  final BillingData billingData;
  const UsernameInput({super.key,required this.billingData});

  @override
  Widget build(BuildContext context) {
    var validationProvider = Provider.of<InputValidationProvider>(context);
    return  CustomTextFieldWidget(
      hintText: StringsManager.enterFullName,
      errorText: validationProvider.errorFullName,
      onChanged: (val){
        validationProvider.fullName = val;
        validationProvider.isFullNameValid();
        billingData.firstName = val;
      },
    );
  }
}
