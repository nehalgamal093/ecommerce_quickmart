import 'package:ecommerce_shop/core/extensions/text_theme.dart';
import 'package:flutter/material.dart';
import '../../features/auth/presentation/screen/login/login.dart';
import '../caching/cache_helper.dart';
import '../resources/colors/colors_manager.dart';

logoutDialog(
  BuildContext context,
) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Logout"),
              SizedBox(
                height: 10,
              ),
              Text(
                "Do you want to logout?",
                style: context.bodySmall,
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorsManager.redColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                CacheHelper.clearToken();
                CacheHelper.clearUserId();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                    (route) => false);
              },
              child: Text(
                'Logout',
                style: context
                    .bodySmall!
                    .copyWith(color: ColorsManager.whiteColor),
              ),
            )
          ],
        );
      });
}
