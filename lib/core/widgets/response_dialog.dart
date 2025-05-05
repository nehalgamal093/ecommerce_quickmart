import 'package:ecommerce_shop/core/extensions/text_theme.dart';
import 'package:flutter/material.dart';

import '../resources/assets_manager/images_manager.dart';
import '../resources/colors/colors_manager.dart';

responseDialog(
    BuildContext context, String title, String content, bool success) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              success
                  ? Image.asset(ImagesManager.success)
                  : Image.asset(ImagesManager.error),
              Text(title),
              SizedBox(
                height: 10,
              ),
              Text(
                content,
                style: context.bodySmall,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsManager.redColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Try Again',
                  style: context.bodySmall!
                      .copyWith(color: ColorsManager.whiteColor),
                ),
              )
            ],
          ),
          actions: [],
        );
      });
}
