import 'package:ecommerce_shop/provider/old_new_screen.dart';
import 'package:ecommerce_shop/view/change_password/sections/new_password_section.dart';
import 'package:ecommerce_shop/view/change_password/sections/old_password_section.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangePassword extends StatelessWidget {
  static const String routeName = '/change_password';
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<OldNewScreen>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
        actions: [
          Text('${provider.index}0'),
          Text('/02'),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: oldNewScreen(provider.index),
    );
  }

  Widget oldNewScreen(int index) {
    if (index == 0) {
      return OldPasswordSection();
    } else {
      return NewPasswordSection();
    }
  }
}
