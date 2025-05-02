import 'package:ecommerce_shop/features/product_info/presentation/provider/hide_show_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../../features/cart/presentation/screens/my_cart/my_cart.dart';
import '../../../../../features/categories/presentation/screens/categories/categories_screen.dart';
import '../../../../../features/profile/presentation/screens/profile/profile.dart';
import '../../../../../features/wish_list/presentation/screens/wishlist/wishlist.dart';
import '../../../../core/resources/assets_manager/images_manager.dart';
import '../../../../core/resources/colors/colors_manager.dart';
import '../../../../core/resources/constants/strings_manager.dart';
import '../../../cart/presentation/bloc/my_cart_bloc.dart';
import '../../../home/presentation/home.dart';
import '../../../product_info/presentation/screens/product_details/sections/image_view.dart';
import '../provider/main_provider.dart';

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
    int size = 0;
    MainProvider mainProvider = Provider.of<MainProvider>(context);

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) return;

        final currentNavigator =
            _navigatorKeys[mainProvider.index].currentState;
        if (currentNavigator != null && currentNavigator.canPop()) {
          currentNavigator.pop();
        }
      },
      child: Scaffold(
        body: IndexedStack(
          index: mainProvider.index,
          children: [
            _buildNavigator(
              0,
              HomeScreen(),
            ),
            _buildNavigator(
              1,
              CategoriesScreen(),
            ),
            _buildNavigator(
              2,
              MyCart(),
            ),
            _buildNavigator(
              3,
              Wishlist(),
            ),
            _buildNavigator(
              4,
              Profile(),
            ),

            // Add other tabs
          ],
        ),
        bottomNavigationBar: Consumer<HideShowBottomNavProvider>(
            builder: (context, visibility, child) {
          return visibility.visible
              ? BottomNavigationBar(
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
                        icon: BlocBuilder<MyCartBloc, MyCartState>(
                            builder: (context, state) {
                          if (state is ItemsLoaded) {
                            size = state.items.length;
                            return Badge(
                              label: Text(size.toString()),
                              child: ImageIcon(
                                AssetImage(ImagesManager.cartIcon),
                              ),
                            );
                          } else if (state is ItemsLoading) {
                            return Badge(
                              label: Text(size.toString()),
                              child: ImageIcon(
                                AssetImage(ImagesManager.cartIcon),
                              ),
                            );
                          } else {
                            return Badge(
                              label: Text(size.toString()),
                              child: ImageIcon(
                                AssetImage(ImagesManager.cartIcon),
                              ),
                            );
                          }
                        }),
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
                )
              : SizedBox.shrink();
        }),
      ),
    );
  }

  void _handleTabTapped(int index, MainProvider provider) {
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

  Widget _buildNavigator(int index, Widget screen) {
    return Navigator(
      key: _navigatorKeys[index],
      // onGenerateRoute: (settings) => MaterialPageRoute(
      //   builder: (_) => screen,
      // ),
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case '/image-view':
            builder = (BuildContext _) => ImageView();
            break;
          default:
            builder = (BuildContext _) => screen;
        }
        return MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}
