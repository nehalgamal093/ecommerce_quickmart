import 'package:ecommerce_shop/core/caching/cache_helper.dart';
import 'package:ecommerce_shop/features/auth/presentation/screen/login/login.dart';
import 'package:ecommerce_shop/features/auth/presentation/screen/sign_up/signup.dart';
import 'package:ecommerce_shop/features/map/presentation/screens/map_screen/map_screen.dart';
import 'package:ecommerce_shop/features/products/presentation/screens/products_screen/products_screen.dart';
import 'package:ecommerce_shop/features/sub_categories/presentation/screens/sub_categories/sub_categories_screen.dart';
import 'package:flutter/material.dart';

import '../../../features/categories/presentation/screens/categories/categories_screen.dart';
import '../../../features/product_info/presentation/screens/product_details/product_details.dart';
import '../../../features/product_info/presentation/screens/write_review/write_review.dart';
import '../../../features/profile/presentation/screens/change_password/change_password.dart';
import '../../core/resources/theme/base_theme.dart';
import '../../core/resources/theme/light_theme.dart';
import '../main/presentation/screens/main_screen.dart';
import '../on_boarding/on_boarding.dart';
import '../profile/presentation/screens/faq/faq.dart';
import '../profile/presentation/screens/order_history/order_history.dart';
import '../profile/presentation/screens/order_success/order_success.dart';
import '../profile/presentation/screens/payment_method/payment_method.dart';
import '../profile/presentation/screens/shipping_address/shipping_address.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    BaseTheme lightTheme = LightTheme();
    return MaterialApp(
      title: 'Quick Mart',
      debugShowCheckedModeBanner: false,
      theme: lightTheme.myThemeData,
      initialRoute: CacheHelper.getToken() == null
          ? OnBoardingScreen.routeName
          : MainScreen.routeName,
      routes: {
        OnBoardingScreen.routeName: (context) => OnBoardingScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        Signup.routeName: (context) => Signup(),
        MainScreen.routeName: (context) => MainScreen(),
        OrderSuccess.routeName: (context) => OrderSuccess(),
        ShippingAddress.routeName: (context) => ShippingAddress(),
        PaymentMethod.routeName: (context) => PaymentMethod(),
        ChangePassword.routeName: (context) => ChangePassword(),
        FAQ.routeName: (context) => FAQ(),
        OrderHistory.routeName: (context) => OrderHistory(),
        WriteReview.routeName: (context) => WriteReview(),
        ProductDetails.routeName: (context) => ProductDetails(
              id: '',
            ),
        ProductsScreen.routeName: (context) => ProductsScreen(
              id: '',
          title: '',
            ),
        CategoriesScreen.routeName: (context) => CategoriesScreen(),
        SubCategoriesScreen.routeName: (context) => SubCategoriesScreen(id: '',title: '',),
        MapScreen.routeName:(context)=>MapScreen()
        // ImageView.routeName: (context) => ImageView()
      },
    );
  }
}
