import 'package:ecommerce_shop/features/profile/presentation/screens/change_password/sections/new_password_section.dart';
import 'package:ecommerce_shop/features/profile/presentation/screens/change_password/sections/old_password_section.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/resources/constants/strings_manager.dart';
import '../../provider/old_new_screen.dart';

class ChangePassword extends StatelessWidget {
  static const String routeName = '/change_password';
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<OldNewScreen>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(StringsManager.changePassword),
        actions: [
          Text('${provider.index}0'),
          Text(StringsManager.c2),
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
