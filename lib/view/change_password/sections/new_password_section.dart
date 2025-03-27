import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/widgets/custom_btn_widget.dart';
import '../../../core/widgets/custom_textfield_widget.dart';
import '../../../core/widgets/label_text.dart';
import '../../../provider/old_new_screen.dart';

class NewPasswordSection extends StatefulWidget {
  const NewPasswordSection({super.key});

  @override
  State<NewPasswordSection> createState() => _NewPasswordSectionState();
}

class _NewPasswordSectionState extends State<NewPasswordSection> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
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
          CustomTextFieldWidget(hintText: 'Enter your password',controller: passwordController,),
          SizedBox(height: 20,),
          LabelText(label: 'Confirm Password'),
          SizedBox(height: 5,),
          CustomTextFieldWidget(hintText: 'Enter your password',controller: confirmPasswordController,),
          SizedBox(height: 30,),
          CustomBtnWidget(title: 'Continue', onPressed: (){
            provider.changeScreen(0);
          })
        ],
      ),
    );
  }
}
