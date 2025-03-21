import 'package:ecommerce_shop/provider/main_provider.dart';
import 'package:ecommerce_shop/view/resources/assets_manager/images_manager.dart';
import 'package:ecommerce_shop/view/resources/colors/colors_manager.dart';
import 'package:ecommerce_shop/view/resources/strings_manager.dart';
import 'package:ecommerce_shop/view/screen/home/home.dart';
import 'package:ecommerce_shop/view/screen/my_cart/my_cart.dart';
import 'package:ecommerce_shop/view/screen/profile/profile.dart';
import 'package:ecommerce_shop/view/screen/wishlist/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../features/categories/presentation/screens/categories/categories_screen.dart';

class MainScreen extends StatelessWidget {
  static const String routeName = '/home';
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MainProvider mainProvider = Provider.of<MainProvider>(context);
    return Scaffold(
      body: currentTab(mainProvider.index, context),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: mainProvider.index,
        type: BottomNavigationBarType.fixed,
        backgroundColor: ColorsManager.whiteColor,
        selectedItemColor: ColorsManager.cyanColor,
        elevation: 0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(ImagesManager.homeIcon),
              ),
              label: StringsManager.home),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(ImagesManager.categoryIcon),
              ),
              label: StringsManager.categories),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(ImagesManager.cartIcon),
              ),
              label: StringsManager.myCart),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(ImagesManager.heartIcon),
              ),
              label: StringsManager.wishlist),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(ImagesManager.profileIcon),
              ),
              label: StringsManager.profile),
        ],
        onTap: (index) {
          mainProvider.changeIndex(index);
        },
      ),
    );
  }

  Widget currentTab(int index,BuildContext context){
    switch(index){
      case 0:
        return HomeScreen();
      case 1:
        return CategoriesScreen();
      case 2:
        return  MyCart();
      case 3:
        return  Wishlist();
      case 4:
        return Profile();
      default:
        return HomeScreen();
    }

  }
}
