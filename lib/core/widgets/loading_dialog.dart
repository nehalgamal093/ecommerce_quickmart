import 'package:flutter/material.dart';

import '../resources/colors/colors_manager.dart';

loadingDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          content: Center(
            child: CircularProgressIndicator(
              color: ColorsManager.cyanColor,
            ),
          ),
        );
      });
}
