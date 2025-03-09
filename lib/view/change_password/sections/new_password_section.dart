import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/widgets/custom_btn_widget.dart';
import '../../../core/widgets/custom_textfield_widget.dart';
import '../../../core/widgets/label_text.dart';
import '../../../provider/old_new_screen.dart';

class NewPasswordSection extends StatelessWidget {
  const NewPasswordSection({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<OldNewScreen>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
          Text('New Password',style: Theme.of(context).textTheme.titleLarge,),
          SizedBox(height: 5,),
          Text('Enter your new password and remember it',style: Theme.of(context).textTheme.bodySmall,),
          SizedBox(height: 20,),
          LabelText(label: 'Password'),
          SizedBox(height: 5,),
          CustomTextFieldWidget(hintText: 'Enter your password',),
          SizedBox(height: 20,),
          LabelText(label: 'Confirm Password'),
          SizedBox(height: 5,),
          CustomTextFieldWidget(hintText: 'Enter your password',),
          SizedBox(height: 30,),
          CustomBtnWidget(title: 'Continue', onPressed: (){
            provider.changeScreen(0);
          })
        ],
      ),
    );
  }
}
