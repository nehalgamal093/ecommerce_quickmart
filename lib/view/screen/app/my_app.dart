import 'package:ecommerce_shop/core/caching/cache_helper.dart';
import 'package:ecommerce_shop/features/auth/presentation/screen/login/login.dart';
import 'package:ecommerce_shop/features/auth/presentation/screen/sign_up/signup.dart';
import 'package:ecommerce_shop/features/products/presentation/screens/products_screen/products_screen.dart';
import 'package:ecommerce_shop/features/sub_categories/presentation/screens/sub_categories/sub_categories_screen.dart';
import 'package:ecommerce_shop/view/change_password/change_password.dart';
import 'package:ecommerce_shop/view/faq/faq.dart';
import 'package:ecommerce_shop/view/screen/check_out/check_out.dart';
import 'package:ecommerce_shop/view/screen/check_out/sections/Items.dart';
import 'package:ecommerce_shop/view/screen/on_boarding/on_boarding.dart';
import 'package:ecommerce_shop/view/screen/order_history/order_history.dart';
import 'package:ecommerce_shop/view/screen/order_success/order_success.dart';
import 'package:ecommerce_shop/view/screen/payment_method/payment_method.dart';
import 'package:ecommerce_shop/view/shipping_address/shipping_address.dart';
import 'package:ecommerce_shop/view/theme/light_theme.dart';
import 'package:flutter/material.dart';
import '../../../features/categories/presentation/screens/categories/categories_screen.dart';
import '../../../features/product_info/presentation/screens/product_details/product_details.dart';
import '../../../features/product_info/presentation/screens/write_review/write_review.dart';
import '../../theme/base_theme.dart';
import '../main/main_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    BaseTheme lightTheme = LightTheme();
    return MaterialApp(

      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: lightTheme.myThemeData,
      initialRoute: CacheHelper.getToken()==null?OnBoardingScreen.routeName:MainScreen.routeName,
      routes: {
        OnBoardingScreen.routeName: (context) => OnBoardingScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        Signup.routeName: (context) => Signup(),
        MainScreen.routeName: (context) => MainScreen(),
        Checkout.routeName:(context)=>Checkout(),
        Items.routeName:(context)=>Items(),
        OrderSuccess.routeName:(context)=>OrderSuccess(),
        ShippingAddress.routeName:(context)=>ShippingAddress(),
        PaymentMethod.routeName:(context)=>PaymentMethod(),
        ChangePassword.routeName:(context)=>ChangePassword(),
        FAQ.routeName:(context)=>FAQ(),
        OrderHistory.routeName:(context)=>OrderHistory(),
        WriteReview.routeName:(context)=>WriteReview(),
        ProductDetails.routeName:(context)=>ProductDetails(id: '',),
        ProductsScreen.routeName:(context)=>ProductsScreen(id: '',),
        CategoriesScreen.routeName:(context)=>CategoriesScreen(),
        SubCategoriesScreen.routeName:(context)=>SubCategoriesScreen(id: '')
      },

    );
  }
}
