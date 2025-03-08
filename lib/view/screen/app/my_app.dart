import 'package:ecommerce_shop/view/screen/check_out/check_out.dart';
import 'package:ecommerce_shop/view/screen/on_boarding/on_boarding.dart';
import 'package:ecommerce_shop/view/screen/products_screen/products_screen.dart';
import 'package:ecommerce_shop/view/theme/light_theme.dart';
import 'package:flutter/material.dart';
import '../../theme/base_theme.dart';
import '../home/home.dart';
import '../login/login.dart';
import '../main/main_screen.dart';
import '../product_details/product_details.dart';
import '../sign_up/signup.dart';
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
        Checkout.routeName:(context)=>Checkout()
      },
    );
  }
}
