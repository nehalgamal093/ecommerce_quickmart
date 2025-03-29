import 'package:ecommerce_shop/provider/main_provider.dart';
import 'package:ecommerce_shop/view/resources/assets_manager/images_manager.dart';
import 'package:ecommerce_shop/view/resources/colors/colors_manager.dart';
import 'package:ecommerce_shop/view/resources/strings_manager.dart';
import 'package:ecommerce_shop/view/screen/home/home.dart';
import 'package:ecommerce_shop/view/screen/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../features/cart/presentation/screens/my_cart/my_cart.dart';
import '../../../features/categories/presentation/screens/categories/categories_screen.dart';
import '../../../features/wish_list/presentation/screens/wishlist/wishlist.dart';

class MainScreen extends StatelessWidget {
  static const String routeName = '/home';
   MainScreen({super.key});
  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];
  final Map<int, DateTime> _lastTabTapTimes = {};
  @override
  Widget build(BuildContext context) {

    MainProvider mainProvider = Provider.of<MainProvider>(context);
    return PopScope(
        canPop: false,
        onPopInvoked: (didPop) async {
          if (didPop) return;

          final currentNavigator = _navigatorKeys[mainProvider.index].currentState;
          if (currentNavigator != null && currentNavigator.canPop()) {
            currentNavigator.pop();
          }},
      child: Scaffold(
        body:  IndexedStack(
          index: mainProvider.index,
          children: [

            _buildNavigator(0, HomeScreen()),
            _buildNavigator(1, CategoriesScreen()),
            _buildNavigator(2, MyCart()),
            _buildNavigator(3, Wishlist()),
            _buildNavigator(4, Profile())
            // Add other tabs
          ],
        ),
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
          _handleTabTapped(index, mainProvider);
          },
        ),
      ),
    );
  }
  void _handleTabTapped(int index,MainProvider provider) {
    final now = DateTime.now();
    final lastTap = _lastTabTapTimes[index];
    final isDoubleTap = lastTap != null &&
        now.difference(lastTap) < Duration(milliseconds: 300);

    if (provider.index == index) {
      if (isDoubleTap) {
        // _scrollToTop(index);
      } else {
        _navigatorKeys[index].currentState?.popUntil((route) => route.isFirst);
      }
    }

    provider.changeIndex(index);
    _lastTabTapTimes[index] = now;
  }
  // Widget currentTab(int index,BuildContext context){
  //   switch(index){
  //     case 0:
  //       return _buildNavigator(0, HomeScreen());
  //     case 1:
  //
  //       return _buildNavigator(1, CategoriesScreen());
  //     case 2:
  //
  //       return _buildNavigator(2, MyCart());
  //     case 3:
  //       return _buildNavigator(3, Wishlist());
  //     case 4:
  //
  //       return _buildNavigator(4, Profile());
  //     default:
  //
  //       return _buildNavigator(0, HomeScreen());
  //   }
  //
  // }
  Widget _buildNavigator(int index, Widget screen) {
    return Navigator(
      key: _navigatorKeys[index],
      onGenerateRoute: (settings) => MaterialPageRoute(
        builder: (_) => screen,
      ),
    );
  }
}
