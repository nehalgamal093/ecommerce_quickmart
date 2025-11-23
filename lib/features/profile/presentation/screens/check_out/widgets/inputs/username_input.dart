import 'package:ecommerce_shop/features/profile/data/models/payment_request.dart';

import '../../../../../../../core/widgets/custom_textfield_widget.dart';
import '../../../../../../auth/presentation/screen/import_files/import_files.dart';

class UsernameInput extends StatelessWidget {
  final BillingData billingData;
  const UsernameInput({super.key,required this.billingData});

  @override
  Widget build(BuildContext context) {
    return  CustomTextFieldWidget(
      hintText: StringsManager.enterFullName,
      onChanged: (val){
        billingData.firstName = val;
      },
    );
  }
}
