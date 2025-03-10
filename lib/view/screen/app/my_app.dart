import 'package:ecommerce_shop/features/auth/presentation/screen/login/login.dart';
import 'package:ecommerce_shop/features/auth/presentation/screen/sign_up/signup.dart';
import 'package:ecommerce_shop/view/change_password/change_password.dart';
import 'package:ecommerce_shop/view/faq/faq.dart';
import 'package:ecommerce_shop/view/screen/check_out/check_out.dart';
import 'package:ecommerce_shop/view/screen/check_out/sections/Items.dart';
import 'package:ecommerce_shop/view/screen/on_boarding/on_boarding.dart';
import 'package:ecommerce_shop/view/screen/order_success/order_success.dart';
import 'package:ecommerce_shop/view/screen/payment_method/payment_method.dart';
import 'package:ecommerce_shop/view/screen/products_screen/products_screen.dart';
import 'package:ecommerce_shop/view/shipping_address/shipping_address.dart';
import 'package:ecommerce_shop/view/theme/light_theme.dart';
import 'package:flutter/material.dart';
import '../../theme/base_theme.dart';
import '../main/main_screen.dart';
import '../product_details/product_details.dart';
import '../sub_categories/sub_categories_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    BaseTheme lightTheme = LightTheme();
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: lightTheme.myThemeData,
      initialRoute: OnBoardingScreen.routeName,
      routes: {
        OnBoardingScreen.routeName: (context) => OnBoardingScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        Signup.routeName: (context) => Signup(),
        MainScreen.routeName: (context) => MainScreen(),
        SubCategoriesScreen.routeName: (context) => SubCategoriesScreen(),
        ProductsScreen.routeName: (context) => ProductsScreen(),
        ProductDetails.routeName: (context) => ProductDetails(),
        Checkout.routeName:(context)=>Checkout(),
        Items.routeName:(context)=>Items(),
        OrderSuccess.routeName:(context)=>OrderSuccess(),
        ShippingAddress.routeName:(context)=>ShippingAddress(),
        PaymentMethod.routeName:(context)=>PaymentMethod(),
        ChangePassword.routeName:(context)=>ChangePassword(),
        FAQ.routeName:(context)=>FAQ()
      },
    );
  }
}
